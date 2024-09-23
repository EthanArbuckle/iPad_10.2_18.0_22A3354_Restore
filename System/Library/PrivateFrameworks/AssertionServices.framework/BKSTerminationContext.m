@implementation BKSTerminationContext

+ (id)terminationAssertionContext
{
  BKSTerminationContext *v2;

  v2 = objc_alloc_init(BKSTerminationContext);
  -[BKSTerminationContext setExplanation:](v2, "setExplanation:", CFSTR("Termination assertion"));
  -[BKSTerminationContext setExceptionCode:](v2, "setExceptionCode:", 3735905538);
  return v2;
}

+ (id)context
{
  return objc_alloc_init(BKSTerminationContext);
}

- (BOOL)_isEqualToTerminationContext:(id)a3
{
  id v4;
  int64_t exceptionCode;
  NSString *explanation;
  void *v7;
  BOOL v8;

  v4 = a3;
  exceptionCode = self->_exceptionCode;
  if (exceptionCode == objc_msgSend(v4, "exceptionCode"))
  {
    explanation = self->_explanation;
    objc_msgSend(v4, "explanation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSString isEqualToString:](explanation, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = -[BKSTerminationContext _isEqualToTerminationContext:](self, "_isEqualToTerminationContext:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BKSTerminationContext *v4;

  v4 = -[BKSTerminationContext init](+[BKSTerminationContext allocWithZone:](BKSTerminationContext, "allocWithZone:", a3), "init");
  -[BKSTerminationContext setExceptionCode:](v4, "setExceptionCode:", self->_exceptionCode);
  -[BKSTerminationContext setExplanation:](v4, "setExplanation:", self->_explanation);
  return v4;
}

- (int64_t)exceptionCode
{
  return self->_exceptionCode;
}

- (void)setExceptionCode:(int64_t)a3
{
  self->_exceptionCode = a3;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
}

@end
