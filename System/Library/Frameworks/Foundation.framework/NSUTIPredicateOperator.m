@implementation NSUTIPredicateOperator

- (id)initForVariant:(unint64_t)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3 >= 2)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("parameter");
    v9[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, CFSTR("Unsupported variant"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1)));
  }
  if (a3)
    v3 = 1101;
  else
    v3 = 1100;
  v7.receiver = self;
  v7.super_class = (Class)NSUTIPredicateOperator;
  return -[NSPredicateOperator initWithOperatorType:modifier:](&v7, sel_initWithOperatorType_modifier_, v3, 0);
}

- (unint64_t)variant
{
  return -[NSPredicateOperator operatorType](self, "operatorType") != 1100;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForVariant:", -[NSUTIPredicateOperator variant](self, "variant"));
}

- (id)predicateFormat
{
  if (-[NSPredicateOperator operatorType](self, "operatorType") == 1100)
    return CFSTR("UTI-EQUALS");
  else
    return CFSTR("UTI-CONFORMS-TO");
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL result;
  unsigned int (*v8)(id, id);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  result = 0;
  v18[2] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    if (_NSIsNSString() && (_NSIsNSString() & 1) != 0)
    {
      if (qword_1ECD09BE0 != -1)
        dispatch_once(&qword_1ECD09BE0, &__block_literal_global_16);
      if (-[NSPredicateOperator operatorType](self, "operatorType") == 1100)
      {
        v8 = (unsigned int (*)(id, id))_MergedGlobals_97;
        if (!_MergedGlobals_97)
        {
          v9 = (void *)MEMORY[0x1E0C99DA0];
          v10 = *MEMORY[0x1E0C99768];
          v15[0] = CFSTR("lhs");
          v15[1] = CFSTR("rhs");
          v16[0] = a3;
          v16[1] = a4;
          v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
          v12 = CFSTR("Unable to load UTTypeEqual");
          goto LABEL_15;
        }
        return v8(a3, a4) != 0;
      }
      v8 = (unsigned int (*)(id, id))qword_1ECD09BD8;
      if (qword_1ECD09BD8)
        return v8(a3, a4) != 0;
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v13[0] = CFSTR("lhs");
      v13[1] = CFSTR("rhs");
      v14[0] = a3;
      v14[1] = a4;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v12 = CFSTR("Unable to load UTTypeConformsTo");
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99778];
      v17[0] = CFSTR("lhs");
      v17[1] = CFSTR("rhs");
      v18[0] = a3;
      v18[1] = a4;
      v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v12 = CFSTR("Unsupported variant");
    }
LABEL_15:
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v12, v11));
  }
  return result;
}

void __73__NSUTIPredicateOperator_performPrimitiveOperationUsingObject_andObject___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  BOOL v3;

  v0 = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 256);
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_97 = dlsym(v0, "UTTypeEqual");
    v2 = dlsym(v1, "UTTypeConformsTo");
    qword_1ECD09BD8 = (uint64_t)v2;
  }
  else
  {
    v2 = (void *)qword_1ECD09BD8;
  }
  if (_MergedGlobals_97)
    v3 = v2 == 0;
  else
    v3 = 1;
  if (v3)
    NSLog((NSString *)CFSTR("NSUTIPredicateOperator couldn't load a MobileCoreServices symbol."));
}

@end
