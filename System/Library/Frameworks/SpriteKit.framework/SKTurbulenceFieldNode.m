@implementation SKTurbulenceFieldNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_descriptionClassName
{
  return CFSTR("SKTurbulenceFieldNode");
}

- (void)_initialize
{
  PKPhysicsField *v3;
  PKPhysicsField *field;

  if (!self->super.super._field)
  {
    objc_msgSend(MEMORY[0x1E0D7D2E0], "field");
    v3 = (PKPhysicsField *)objc_claimAutoreleasedReturnValue();
    field = self->super.super._field;
    self->super.super._field = v3;

    -[SKFieldNode setPhysicsField:](self, "setPhysicsField:", self->super.super._field);
  }
}

- (SKTurbulenceFieldNode)init
{
  SKTurbulenceFieldNode *v2;
  SKTurbulenceFieldNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKTurbulenceFieldNode;
  v2 = -[SKNoiseFieldNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKTurbulenceFieldNode _initialize](v2, "_initialize");
  return v3;
}

- (SKTurbulenceFieldNode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SKTurbulenceFieldNode *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7D2E0], "field");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SKTurbulenceFieldNode;
  v6 = -[SKFieldNode initWithCoder:field:](&v8, sel_initWithCoder_field_, v4, v5);

  if (v6)
    -[SKTurbulenceFieldNode _initialize](v6, "_initialize");

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKTurbulenceFieldNode;
  -[SKNoiseFieldNode encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

@end
