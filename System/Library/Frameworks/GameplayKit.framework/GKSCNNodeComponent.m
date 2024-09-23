@implementation GKSCNNodeComponent

+ (GKSCNNodeComponent)componentWithNode:(SCNNode *)node
{
  SCNNode *v3;
  void *v4;

  v3 = node;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNode:", v3);

  return (GKSCNNodeComponent *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKSCNNodeComponent)initWithNode:(SCNNode *)node
{
  SCNNode *v5;
  GKSCNNodeComponent *v6;
  GKSCNNodeComponent *v7;
  objc_super v9;

  v5 = node;
  v9.receiver = self;
  v9.super_class = (Class)GKSCNNodeComponent;
  v6 = -[GKComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_node, node);

  return v7;
}

- (GKSCNNodeComponent)initWithCoder:(id)a3
{
  id v4;
  GKSCNNodeComponent *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSIndexPath *serializableNodeIndexPath;
  objc_super v12;
  _QWORD v13[13];

  v13[12] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKSCNNodeComponent;
  v5 = -[GKComponent initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    v13[5] = objc_opt_class();
    v13[6] = objc_opt_class();
    v13[7] = objc_opt_class();
    v13[8] = objc_opt_class();
    v13[9] = objc_opt_class();
    v13[10] = objc_opt_class();
    v13[11] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v4, "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v8);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_serializableNodeIndexPath"));
    v9 = objc_claimAutoreleasedReturnValue();
    serializableNodeIndexPath = v5->_serializableNodeIndexPath;
    v5->_serializableNodeIndexPath = (NSIndexPath *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GKSCNNodeComponent;
  -[GKComponent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDE8278], "_indexPathForNode:", self->_node);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_serializableNodeIndexPath"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKSCNNodeComponent;
  v4 = -[GKComponent copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 6, self->_node);
  return v4;
}

- (void)setEntity:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKSCNNodeComponent;
  v4 = a3;
  -[GKComponent setEntity:](&v5, sel_setEntity_, v4);
  -[SCNNode setEntity:](self->_node, "setEntity:", v4, v5.receiver, v5.super_class);

}

- (void)agentWillUpdate:(id)a3
{
  SCNNode *node;
  int v5;
  double v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  double v19;
  double v20;
  double v21;
  id v22;

  node = self->_node;
  v22 = a3;
  -[SCNNode position](node, "position");
  HIDWORD(v6) = v5;
  objc_msgSend(v22, "setPosition:", v6);
  -[SCNNode orientation](self->_node, "orientation");
  v8 = v7 * v7;
  v10 = v7 * v9;
  v12 = v7 * v11;
  v14 = v7 * v13;
  v15 = v9 * v11;
  v16 = v9 * v13;
  v17 = v11 * v11;
  v18 = v11 * v13;
  *(float *)&v19 = 1.0
                 - (float)((float)((float)(v9 * v9) + (float)(v11 * v11))
                         + (float)((float)(v9 * v9) + (float)(v11 * v11)));
  *(float *)&v20 = (float)(v10 - v18) + (float)(v10 - v18);
  *(float *)&v21 = (float)(v12 + v16) + (float)(v12 + v16);
  *((float *)&v19 + 1) = (float)(v10 + v18) + (float)(v10 + v18);
  *((float *)&v20 + 1) = 1.0 - (float)((float)(v8 + v17) + (float)(v8 + v17));
  *((float *)&v21 + 1) = (float)(v15 - v14) + (float)(v15 - v14);
  objc_msgSend(v22, "setRotation:", v19, v20, v21);

}

- (void)agentDidUpdate:(id)a3
{
  id v4;
  float v5;
  float v6;
  double v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  double v15;
  double v16;
  __int128 v17;

  v4 = a3;
  objc_msgSend(v4, "rotation");
  v6 = v5 + 1.0;
  v9 = sqrtf((float)(v5 + 1.0) - (float)(v8 + *((float *)&v7 + 1))) * 0.5;
  v10 = 1.0 - v5;
  *(float *)&v7 = sqrtf((float)(*((float *)&v7 + 1) - v8) + v10) * 0.5;
  *(float *)&v11 = sqrtf((float)(v8 - *((float *)&v7 + 1)) + v10) * 0.5;
  *(float *)&v12 = sqrtf((float)(v8 + *((float *)&v7 + 1)) + v6) * 0.5;
  *(float *)&v13 = v9;
  -[SCNNode setOrientation:](self->_node, "setOrientation:", v13, v7, v11, v12);
  objc_msgSend(v4, "position");
  v17 = v14;

  LODWORD(v16) = DWORD2(v17);
  LODWORD(v15) = DWORD1(v17);
  -[SCNNode setPosition:](self->_node, "setPosition:", *(double *)&v17, v15, v16);
}

- (NSIndexPath)serializableNodeIndexPath
{
  return self->_serializableNodeIndexPath;
}

- (void)setSerializableNodeIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_serializableNodeIndexPath, a3);
}

- (SCNNode)node
{
  return self->_node;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_serializableNodeIndexPath, 0);
}

- (void)setNode:(id)a3
{
  objc_storeStrong((id *)&self->_node, a3);
}

@end
