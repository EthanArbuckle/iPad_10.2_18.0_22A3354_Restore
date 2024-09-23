@implementation _DASLogCondition

+ (id)withCondition:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setCondition:", v3);

  return v4;
}

- (id)description
{
  return (id)-[NSObject description](self->_condition, "description");
}

- (NSObject)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_storeStrong((id *)&self->_condition, a3);
}

- (BOOL)isIdeal
{
  return self->_isIdeal;
}

- (void)setIsIdeal:(BOOL)a3
{
  self->_isIdeal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
