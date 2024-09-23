@implementation NSMatchingPredicateOperator

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_regexContext)
  {
    -[NSMatchingPredicateOperator _clearContext](self, "_clearContext");
    free(self->_regexContext);
    self->_regexContext = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NSMatchingPredicateOperator;
  -[NSMatchingPredicateOperator dealloc](&v3, sel_dealloc);
}

- (void)_clearContext
{
  $1CE8F269E3F9829EF91048F8D16FEC75 *regexContext;
  URegularExpression *var1;

  regexContext = self->_regexContext;
  var1 = (URegularExpression *)regexContext->var1;
  if (var1)
  {
    uregex_close(var1);
    self->_regexContext->var1 = 0;
    regexContext = self->_regexContext;
  }
  if (regexContext->var0)
  {
    CFRelease(regexContext->var0);
    self->_regexContext->var0 = 0;
  }
}

- (NSMatchingPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5
{
  NSMatchingPredicateOperator *result;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSMatchingPredicateOperator;
  result = -[NSStringPredicateOperator initWithOperatorType:modifier:variant:](&v6, sel_initWithOperatorType_modifier_variant_, a3, a4, a5);
  if (result)
    result->_regexContext = 0;
  return result;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL v4;
  $1CE8F269E3F9829EF91048F8D16FEC75 *regexContext;
  $1CE8F269E3F9829EF91048F8D16FEC75 *v9;
  void *v11;
  uint64_t v12;
  NSString *v13;

  v4 = 0;
  if (!a3 || !a4)
    return v4;
  if ((objc_msgSend(&stru_1E0F56070, "isEqual:", a4) & 1) != 0)
    return 0;
  if ((_NSIsNSString() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't create a regex expression from object %@."), a4);
    goto LABEL_16;
  }
  if ((_NSIsNSString() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't do regex matching on object %@."), a3);
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0));
  }
  OSSpinLockLock(&self->_contextLock);
  regexContext = self->_regexContext;
  if (regexContext)
  {
    if (regexContext->var0 && (objc_msgSend(regexContext->var0, "isEqual:", a4) & 1) == 0)
      -[NSMatchingPredicateOperator _clearContext](self, "_clearContext");
  }
  else
  {
    v9 = ($1CE8F269E3F9829EF91048F8D16FEC75 *)malloc_type_calloc(1uLL, 0x18uLL, 0x1080040CC6EE3FDuLL);
    self->_regexContext = v9;
    v9->var0 = 0;
    v9->var1 = 0;
  }
  v4 = +[_NSPredicateOperatorUtilities doRegexForString:pattern:likeProtect:flags:context:](_NSPredicateOperatorUtilities, "doRegexForString:pattern:likeProtect:flags:context:", a3, a4, -[NSMatchingPredicateOperator _shouldEscapeForLike](self, "_shouldEscapeForLike"), -[NSStringPredicateOperator flags](self, "flags"), self->_regexContext);
  OSSpinLockUnlock(&self->_contextLock);
  return v4;
}

- (BOOL)_shouldEscapeForLike
{
  return 0;
}

- (id)symbol
{
  return (id)objc_msgSend(CFSTR("MATCHES"), "stringByAppendingString:", -[NSStringPredicateOperator _modifierString](self, "_modifierString"));
}

- (SEL)selector
{
  return sel_matches_;
}

@end
