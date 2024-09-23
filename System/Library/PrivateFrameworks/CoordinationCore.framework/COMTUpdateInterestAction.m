@implementation COMTUpdateInterestAction

+ (id)actionWithTargetType:(id)a3 targetIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTargetType:targetIdentifiers:", v7, v6);

  return v8;
}

- (COMTUpdateInterestAction)initWithTargetType:(id)a3 targetIdentifiers:(id)a4
{
  id v6;
  COMTUpdateInterestAction *v7;
  uint64_t v8;
  NSArray *targetIdentifiers;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)COMTUpdateInterestAction;
  v7 = -[COMTTypedAction initWithType:](&v11, sel_initWithType_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    targetIdentifiers = v7->_targetIdentifiers;
    v7->_targetIdentifiers = (NSArray *)v8;

  }
  return v7;
}

- (COMTUpdateInterestAction)initWithCoder:(id)a3
{
  id v4;
  COMTUpdateInterestAction *v5;
  uint64_t v6;
  NSArray *targetIdentifiers;
  COMTUpdateInterestAction *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)COMTUpdateInterestAction;
  v5 = -[COMTTypedAction initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("ITI"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v8 = 0;
      goto LABEL_6;
    }
    targetIdentifiers = v5->_targetIdentifiers;
    v5->_targetIdentifiers = (NSArray *)v6;

  }
  v8 = v5;
LABEL_6:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COMTUpdateInterestAction;
  v4 = a3;
  -[COMTTypedAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COMTUpdateInterestAction targetIdentifiers](self, "targetIdentifiers", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ITI"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)targetIdentifiers
{
  return self->_targetIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIdentifiers, 0);
}

@end
