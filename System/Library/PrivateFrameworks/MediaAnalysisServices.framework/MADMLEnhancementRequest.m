@implementation MADMLEnhancementRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMLEnhancementRequest)initWithCoder:(id)a3
{
  id v4;
  MADMLEnhancementRequest *v5;
  uint64_t v6;
  NSString *uuid;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADMLEnhancementRequest;
  v5 = -[MADRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    v5->_modelPreparationOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ModelPreparationOnly"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADMLEnhancementRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_uuid, CFSTR("UUID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_modelPreparationOnly, CFSTR("ModelPreparationOnly"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p"), v5, self);

  -[MADMLEnhancementRequest uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@"), CFSTR("UUID"), v6);

  v7 = -[MADMLEnhancementRequest modelPreparationOnly](self, "modelPreparationOnly");
  v8 = CFSTR("No");
  if (v7)
    v8 = CFSTR("Yes");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@"), CFSTR("ModelPreparationOnly"), v8);
  -[MADRequest error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v9);

  return v3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (BOOL)modelPreparationOnly
{
  return self->_modelPreparationOnly;
}

- (void)setModelPreparationOnly:(BOOL)a3
{
  self->_modelPreparationOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
