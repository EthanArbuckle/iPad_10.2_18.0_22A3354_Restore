@implementation BMDSLArgumentTransform

- (BMDSLArgumentTransform)initWithSelector:(id)a3 name:(id)a4 version:(unsigned int)a5
{
  uint64_t v5;
  id v9;
  BMDSLArgumentTransform *v10;
  BMDSLArgumentTransform *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a5;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMDSLArgumentTransform;
  v10 = -[BMDSLBaseCodable initWithName:version:](&v13, sel_initWithName_version_, a4, v5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_selector, a3);

  return v11;
}

- (BMDSLArgumentTransform)initWithSelector:(id)a3
{
  id v4;
  BMDSLArgumentTransform *v5;

  v4 = a3;
  v5 = -[BMDSLArgumentTransform initWithSelector:name:version:]([BMDSLArgumentTransform alloc], "initWithSelector:name:version:", v4, CFSTR("argument"), 1);

  return v5;
}

+ (id)withSelector:(id)a3
{
  id v3;
  BMDSLArgumentTransform *v4;

  v3 = a3;
  v4 = -[BMDSLArgumentTransform initWithSelector:]([BMDSLArgumentTransform alloc], "initWithSelector:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BMDSLArgumentTransform;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[BMDSLArgumentTransform selector](self, "selector", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("selector"));

}

- (BMDSLArgumentTransform)initWithCoder:(id)a3
{
  id v4;
  BMDSLArgumentTransform *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMDSLArgumentTransform;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("selector"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMDSLBaseCodable name](v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLArgumentTransform initWithSelector:name:version:](v5, "initWithSelector:name:version:", v7, v8, -[BMDSLBaseCodable version](v5, "version"));

  }
  return v5;
}

- (id)transformInput:(id)a3 combinedState:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a4;
  v8 = a3;
  -[BMDSLArgumentTransform selector](self, "selector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "argumentsFromInput:combinedState:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLArgumentTransform.m"), 63, CFSTR("Expect array type"));

  }
  return v10;
}

- (BMDSLArgumentSelector)selector
{
  return self->_selector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selector, 0);
}

@end
