@implementation COMTDeleteAction

+ (id)actionWithTargetType:(id)a3 targetIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTargetType:targetIdentifier:", v7, v6);

  return v8;
}

- (COMTDeleteAction)initWithTargetType:(id)a3 targetIdentifier:(id)a4
{
  id v7;
  COMTDeleteAction *v8;
  COMTDeleteAction *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)COMTDeleteAction;
  v8 = -[COMTTypedAction initWithType:](&v11, sel_initWithType_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_targetIdentifier, a4);

  return v9;
}

- (COMTDeleteAction)initWithCoder:(id)a3
{
  id v4;
  COMTDeleteAction *v5;
  uint64_t v6;
  NSUUID *targetIdentifier;
  COMTDeleteAction *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)COMTDeleteAction;
  v5 = -[COMTTypedAction initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DI"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v8 = 0;
      goto LABEL_6;
    }
    targetIdentifier = v5->_targetIdentifier;
    v5->_targetIdentifier = (NSUUID *)v6;

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
  v6.super_class = (Class)COMTDeleteAction;
  v4 = a3;
  -[COMTTypedAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COMTDeleteAction targetIdentifier](self, "targetIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("DI"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
}

@end
