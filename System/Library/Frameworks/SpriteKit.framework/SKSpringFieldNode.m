@implementation SKSpringFieldNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_descriptionClassName
{
  return CFSTR("SKSpringFieldNode");
}

- (void)_initialize
{
  PKPhysicsField *v3;
  PKPhysicsField *field;

  if (!self->super._field)
  {
    objc_msgSend(MEMORY[0x1E0D7D2D8], "field");
    v3 = (PKPhysicsField *)objc_claimAutoreleasedReturnValue();
    field = self->super._field;
    self->super._field = v3;

    -[SKFieldNode setPhysicsField:](self, "setPhysicsField:", self->super._field);
  }
}

- (SKSpringFieldNode)init
{
  SKSpringFieldNode *v2;
  SKSpringFieldNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKSpringFieldNode;
  v2 = -[SKFieldNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKSpringFieldNode _initialize](v2, "_initialize");
  return v3;
}

- (SKSpringFieldNode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SKSpringFieldNode *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7D2D8], "field");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SKSpringFieldNode;
  v6 = -[SKFieldNode initWithCoder:field:](&v8, sel_initWithCoder_field_, v4, v5);

  if (v6)
    -[SKSpringFieldNode _initialize](v6, "_initialize");

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKSpringFieldNode;
  -[SKFieldNode encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

@end
