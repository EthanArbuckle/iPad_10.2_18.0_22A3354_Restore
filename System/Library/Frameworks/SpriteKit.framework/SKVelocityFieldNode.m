@implementation SKVelocityFieldNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_descriptionClassName
{
  return CFSTR("SKVelocityFieldNode");
}

- (void)_initialize
{
  PKPhysicsField *v3;
  PKPhysicsField *field;

  if (!self->super._field)
  {
    objc_msgSend(MEMORY[0x1E0D7D2E8], "fieldWithGrid:", 0);
    v3 = (PKPhysicsField *)objc_claimAutoreleasedReturnValue();
    field = self->super._field;
    self->super._field = v3;

    -[SKFieldNode setPhysicsField:](self, "setPhysicsField:", self->super._field);
  }
}

- (SKVelocityFieldNode)init
{
  SKVelocityFieldNode *v2;
  SKVelocityFieldNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKVelocityFieldNode;
  v2 = -[SKFieldNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKVelocityFieldNode _initialize](v2, "_initialize");
  return v3;
}

- (SKVelocityFieldNode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SKVelocityFieldNode *v6;
  double v7;
  unsigned int v8;
  double v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7D2E8], "fieldWithGrid:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)SKVelocityFieldNode;
  v6 = -[SKFieldNode initWithCoder:field:](&v11, sel_initWithCoder_field_, v4, v5);

  if (v6)
  {
    -[SKVelocityFieldNode _initialize](v6, "_initialize");
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_velocity")))
    {
      objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("_velocity"));
      *(float *)&v8 = v7;
      *(float *)&v9 = v9;
      -[SKFieldNode setDirection:](v6, "setDirection:", COERCE_DOUBLE(__PAIR64__(LODWORD(v9), v8)));
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKVelocityFieldNode;
  -[SKFieldNode encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (void)setVelocityTexture:(id)a3
{
  id v4;
  double v5;
  void *v6;
  PKPhysicsField *v7;
  PKPhysicsField *field;
  id v9;

  v4 = a3;
  LODWORD(v5) = 1.0;
  v9 = v4;
  +[SKPhysicsGrid vectorGridFromTexture:accuracy:](SKPhysicsGrid, "vectorGridFromTexture:accuracy:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7D2E8], "fieldWithGrid:", v6);
  v7 = (PKPhysicsField *)objc_claimAutoreleasedReturnValue();
  field = self->super._field;
  self->super._field = v7;

  -[SKFieldNode setPhysicsField:](self, "setPhysicsField:", self->super._field);
}

- (void)setVelocity:(SKVelocityFieldNode *)self
{
  -[PKPhysicsField setDirection:](self->super._field, "setDirection:");
}

- (uint64_t)velocity
{
  return objc_msgSend(*(id *)(a1 + 144), "direction");
}

- (SKTexture)velocityTexture
{
  return self->_velocityTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_velocityTexture, 0);
}

@end
