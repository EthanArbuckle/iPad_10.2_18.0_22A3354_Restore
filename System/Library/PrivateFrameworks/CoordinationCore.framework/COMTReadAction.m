@implementation COMTReadAction

+ (id)actionWithTargetType:(id)a3 targetMemento:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTargetType:targetMemento:", v7, v6);

  return v8;
}

- (COMTReadAction)initWithTargetType:(id)a3 targetMemento:(id)a4
{
  id v7;
  COMTReadAction *v8;
  COMTReadAction *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)COMTReadAction;
  v8 = -[COMTTypedAction initWithType:](&v11, sel_initWithType_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_memento, a4);

  return v9;
}

- (COMTReadAction)initWithCoder:(id)a3
{
  id v4;
  COMTReadAction *v5;
  uint64_t v6;
  COHomeKitAccessoryMemento *memento;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTReadAction;
  v5 = -[COMTTypedAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TTM"));
    v6 = objc_claimAutoreleasedReturnValue();
    memento = v5->_memento;
    v5->_memento = (COHomeKitAccessoryMemento *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)COMTReadAction;
  v4 = a3;
  -[COMTTypedAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_memento, CFSTR("TTM"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (COHomeKitAccessoryMemento)memento
{
  return self->_memento;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memento, 0);
}

@end
