@implementation SKVortexFieldNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_descriptionClassName
{
  return CFSTR("SKVortexFieldNode");
}

- (void)_initialize
{
  PKPhysicsField *v3;
  PKPhysicsField *field;

  if (!self->super._field)
  {
    objc_msgSend(MEMORY[0x1E0D7D2F0], "field");
    v3 = (PKPhysicsField *)objc_claimAutoreleasedReturnValue();
    field = self->super._field;
    self->super._field = v3;

    -[SKFieldNode setPhysicsField:](self, "setPhysicsField:", self->super._field);
  }
}

- (SKVortexFieldNode)init
{
  SKVortexFieldNode *v2;
  SKVortexFieldNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKVortexFieldNode;
  v2 = -[SKFieldNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKVortexFieldNode _initialize](v2, "_initialize");
  return v3;
}

- (SKVortexFieldNode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SKVortexFieldNode *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7D2F0], "field");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SKVortexFieldNode;
  v6 = -[SKFieldNode initWithCoder:field:](&v8, sel_initWithCoder_field_, v4, v5);

  if (v6)
    -[SKVortexFieldNode _initialize](v6, "_initialize");

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKVortexFieldNode;
  -[SKFieldNode encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

@end
