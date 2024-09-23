@implementation GKSKNodeComponent

+ (GKSKNodeComponent)componentWithNode:(SKNode *)node
{
  SKNode *v3;
  void *v4;

  v3 = node;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNode:", v3);

  return (GKSKNodeComponent *)v4;
}

- (GKSKNodeComponent)initWithNode:(SKNode *)node
{
  SKNode *v4;
  GKSKNodeComponent *v5;
  GKSKNodeComponent *v6;
  objc_super v8;

  v4 = node;
  v8.receiver = self;
  v8.super_class = (Class)GKSKNodeComponent;
  v5 = -[GKComponent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[GKSKNodeComponent setNode:](v5, "setNode:", v4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKSKNodeComponent)initWithCoder:(id)a3
{
  id v4;
  GKSKNodeComponent *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSIndexPath *serializableNodeIndexPath;
  void *v11;
  objc_super v13;
  _QWORD v14[13];

  v14[12] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKSKNodeComponent;
  v5 = -[GKComponent initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    v14[3] = objc_opt_class();
    v14[4] = objc_opt_class();
    v14[5] = objc_opt_class();
    v14[6] = objc_opt_class();
    v14[7] = objc_opt_class();
    v14[8] = objc_opt_class();
    v14[9] = objc_opt_class();
    v14[10] = objc_opt_class();
    v14[11] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v4, "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v8);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_serializableNodeIndexPath"));
    v9 = objc_claimAutoreleasedReturnValue();
    serializableNodeIndexPath = v5->_serializableNodeIndexPath;
    v5->_serializableNodeIndexPath = (NSIndexPath *)v9;

    if (!v5->_serializableNodeIndexPath)
    {
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_node"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKSKNodeComponent setNode:](v5, "setNode:", v11);

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *serializableNodeIndexPath;
  const __CFString *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKSKNodeComponent;
  v4 = a3;
  -[GKComponent encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  serializableNodeIndexPath = self->_serializableNodeIndexPath;
  if (serializableNodeIndexPath)
  {
    v6 = CFSTR("_serializableNodeIndexPath");
  }
  else
  {
    serializableNodeIndexPath = self->_node;
    v6 = CFSTR("_node");
  }
  objc_msgSend(v4, "encodeObject:forKey:", serializableNodeIndexPath, v6, v7.receiver, v7.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKSKNodeComponent;
  v4 = -[GKComponent copyWithZone:](&v9, sel_copyWithZone_, a3);
  v5 = -[NSIndexPath copy](self->_serializableNodeIndexPath, "copy");
  v6 = (void *)v4[5];
  v4[5] = v5;

  v7 = (void *)-[SKNode copy](self->_node, "copy");
  objc_msgSend(v4, "setNode:", v7);

  return v4;
}

- (void)setEntity:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKSKNodeComponent;
  v4 = a3;
  -[GKComponent setEntity:](&v5, sel_setEntity_, v4);
  -[SKNode setEntity:](self->_node, "setEntity:", v4, v5.receiver, v5.super_class);

}

- (void)setNode:(SKNode *)node
{
  SKNode *v4;
  SKNode *v5;
  SKNode *v6;
  id v7;

  v4 = node;
  -[SKNode setEntity:](self->_node, "setEntity:", 0);
  v5 = self->_node;
  self->_node = v4;
  v6 = v4;

  -[GKComponent entity](self, "entity");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SKNode setEntity:](self->_node, "setEntity:", v7);

}

- (void)agentWillUpdate:(id)a3
{
  SKNode *node;
  double v5;
  float64x2_t v6;
  float64_t v7;
  double v8;
  float64_t v9;
  id v10;

  node = self->_node;
  v10 = a3;
  -[SKNode position](node, "position");
  v9 = v5;
  -[SKNode position](self->_node, "position");
  v6.f64[0] = v9;
  v6.f64[1] = v7;
  objc_msgSend(v10, "setPosition:", COERCE_DOUBLE(vcvt_f32_f64(v6)));
  -[SKNode zRotation](self->_node, "zRotation");
  *(float *)&v8 = v8;
  objc_msgSend(v10, "setRotation:", v8);

}

- (void)agentDidUpdate:(id)a3
{
  id v4;
  float v5;
  double v6;
  float v7;
  int v8;

  v4 = a3;
  objc_msgSend(v4, "position");
  v6 = v5;
  objc_msgSend(v4, "position");
  -[SKNode setPosition:](self->_node, "setPosition:", v6, v7);
  objc_msgSend(v4, "rotation");
  LODWORD(v6) = v8;

  -[SKNode setZRotation:](self->_node, "setZRotation:", *(float *)&v6);
}

- (NSIndexPath)serializableNodeIndexPath
{
  return self->_serializableNodeIndexPath;
}

- (void)setSerializableNodeIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_serializableNodeIndexPath, a3);
}

- (SKNode)node
{
  return self->_node;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_serializableNodeIndexPath, 0);
}

@end
