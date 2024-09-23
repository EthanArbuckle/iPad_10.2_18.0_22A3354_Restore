@implementation ATXOnboardingStackResult

- (ATXOnboardingStackResult)initWithStack1:(id)a3 stack2:(id)a4
{
  id v7;
  id v8;
  ATXOnboardingStackResult *v9;
  ATXOnboardingStackResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXOnboardingStackResult;
  v9 = -[ATXOnboardingStackResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stack1, a3);
    objc_storeStrong((id *)&v10->_stack2, a4);
  }

  return v10;
}

- (ATXOnboardingStackResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  ATXOnboardingStackResult *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stack1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stack2"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    v8 = 0;
  else
    v8 = (ATXOnboardingStackResult *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStack1:stack2:", v5, v6);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXDefaultWidgetStack *stack1;
  id v5;

  stack1 = self->_stack1;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", stack1, CFSTR("stack1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stack2, CFSTR("stack2"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStack1:stack2:", self->_stack1, self->_stack2);
}

- (ATXDefaultWidgetStack)stack1
{
  return self->_stack1;
}

- (ATXDefaultWidgetStack)stack2
{
  return self->_stack2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack2, 0);
  objc_storeStrong((id *)&self->_stack1, 0);
}

@end
