@implementation SKCustomFieldNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_descriptionClassName
{
  return CFSTR("SKCustomFieldNode");
}

- (void)_initialize
{
  PKPhysicsField *v3;
  PKPhysicsField *field;

  if (!self->super._field)
  {
    objc_msgSend(MEMORY[0x1E0D7D2A0], "fieldWithCustomBlock:", 0);
    v3 = (PKPhysicsField *)objc_claimAutoreleasedReturnValue();
    field = self->super._field;
    self->super._field = v3;

    -[SKFieldNode setPhysicsField:](self, "setPhysicsField:", self->super._field);
  }
}

- (SKCustomFieldNode)init
{
  SKCustomFieldNode *v2;
  SKCustomFieldNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKCustomFieldNode;
  v2 = -[SKFieldNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKCustomFieldNode _initialize](v2, "_initialize");
  return v3;
}

- (SKCustomFieldNode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SKCustomFieldNode *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7D2A0], "fieldWithCustomBlock:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SKCustomFieldNode;
  v6 = -[SKFieldNode initWithCoder:field:](&v8, sel_initWithCoder_field_, v4, v5);

  if (v6)
    -[SKCustomFieldNode _initialize](v6, "_initialize");

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKCustomFieldNode;
  -[SKFieldNode encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (void)setBatchBlock:(id)a3
{
  PKPhysicsField *v4;
  PKPhysicsField *field;
  id v6;

  v6 = (id)MEMORY[0x1DF0CFCB0](a3, a2);
  objc_msgSend(MEMORY[0x1E0D7D2A0], "fieldWithCustomBatchBlock:");
  v4 = (PKPhysicsField *)objc_claimAutoreleasedReturnValue();
  field = self->super._field;
  self->super._field = v4;

  -[SKFieldNode setPhysicsField:](self, "setPhysicsField:", self->super._field);
}

- (id)batchBlock
{
  return 0;
}

- (void)setBlock:(id)a3
{
  PKPhysicsField *v4;
  PKPhysicsField *field;
  id v6;

  v6 = (id)MEMORY[0x1DF0CFCB0](a3, a2);
  objc_msgSend(MEMORY[0x1E0D7D2A0], "fieldWithCustomBlock:");
  v4 = (PKPhysicsField *)objc_claimAutoreleasedReturnValue();
  field = self->super._field;
  self->super._field = v4;

  -[SKFieldNode setPhysicsField:](self, "setPhysicsField:", self->super._field);
}

- (id)block
{
  return 0;
}

@end
