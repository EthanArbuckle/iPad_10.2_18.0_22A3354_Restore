@implementation SKSpriteNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKSpriteNode)initWithTexture:(SKTexture *)texture color:(UIColor *)color size:(CGSize)size
{
  double height;
  double width;
  SKTexture *v9;
  UIColor *v10;
  SKSpriteNode *v11;
  void *v12;
  void *v13;
  objc_super v15;
  CGSize v16;

  height = size.height;
  width = size.width;
  v9 = texture;
  v10 = color;
  v15.receiver = self;
  v15.super_class = (Class)SKSpriteNode;
  v11 = -[SKNode init](&v15, sel_init);
  if (v11)
  {
    if (width < 0.0 || height < 0.0)
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v16.width = width;
      v16.height = height;
      NSStringFromCGSize(v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid size specified: %@"), v13);

    }
    -[SKSpriteNode setColor:](v11, "setColor:", v10);
    -[SKSpriteNode setSize:](v11, "setSize:", width, height);
    -[SKSpriteNode setTexture:](v11, "setTexture:", v9);
    -[SKSpriteNode setLightingBitMask:](v11, "setLightingBitMask:", 0);
    -[SKSpriteNode setShadowCastBitMask:](v11, "setShadowCastBitMask:", 0);
    -[SKSpriteNode setShadowedBitMask:](v11, "setShadowedBitMask:", 0);
  }

  return v11;
}

- (void)_makeBackingNode
{
  SKCSpriteNode *v2;

  v2 = (SKCSpriteNode *)operator new();
  SKCSpriteNode::SKCSpriteNode(v2);
  return v2;
}

- (void)_didMakeBackingNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKSpriteNode;
  -[SKNode _didMakeBackingNode](&v3, sel__didMakeBackingNode);
  self->_skcSpriteNode = -[SKNode _backingNode](self, "_backingNode");
}

- (SKSpriteNode)init
{
  void *v3;
  SKSpriteNode *v4;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SKSpriteNode initWithTexture:color:size:](self, "initWithTexture:color:size:", 0, v3, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

  return v4;
}

- (SKSpriteNode)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  SKSpriteNode *v5;
  SKSpriteNode *v6;
  SKSpriteNode *v7;
  BOOL v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t skcSpriteNode;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  float v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  __int128 v42;
  objc_super v43;
  CGRect v44;

  v4 = aDecoder;
  v5 = self;
  v43.receiver = v5;
  v43.super_class = (Class)SKSpriteNode;
  v6 = -[SKNode initWithCoder:](&v43, sel_initWithCoder_, v4);
  v7 = v6;
  if (v6)
    v8 = v6 == v5;
  else
    v8 = 0;
  if (v8)
  {
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shader"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSpriteNode setShader:](v5, "setShader:", v9);

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_normalTexture"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSpriteNode setNormalTexture:](v5, "setNormalTexture:", v10);

    -[SKSpriteNode setLightingBitMask:](v5, "setLightingBitMask:", -[NSCoder decodeInt32ForKey:](v4, "decodeInt32ForKey:", CFSTR("_lightingBitMask")));
    -[SKSpriteNode setShadowCastBitMask:](v5, "setShadowCastBitMask:", -[NSCoder decodeInt32ForKey:](v4, "decodeInt32ForKey:", CFSTR("_shadowCastBitMask")));
    -[SKSpriteNode setShadowedBitMask:](v5, "setShadowedBitMask:", -[NSCoder decodeInt32ForKey:](v4, "decodeInt32ForKey:", CFSTR("_shadowedBitMask")));
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_centerRect"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v44 = CGRectFromString(v11);
      else
        -[NSString CGRectValue](v11, "CGRectValue");
      -[SKSpriteNode setCenterRect:](v5, "setCenterRect:", v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
    }
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_texture"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSpriteNode setTexture:](v5, "setTexture:", v12);

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bounds"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CGRectValue");
    v15 = v14;
    v17 = v16;

    skcSpriteNode = (uint64_t)v5->_skcSpriteNode;
    *(float *)&v19 = v15;
    *(float *)&v20 = v17;
    v42 = __PAIR64__(v20, v19);
    SKCNode::setSize(skcSpriteNode, &v42);
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_colorMix"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    -[SKSpriteNode setColorBlendFactor:](v5, "setColorBlendFactor:");

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_blendMode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSpriteNode setBlendMode:](v5, "setBlendMode:", (int)objc_msgSend(v22, "intValue"));

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_baseColorR"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_baseColorG"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v27;
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_baseColorB"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_baseColorA"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v34 = v33;

    *(float *)&v25 = v25;
    LODWORD(v35) = LODWORD(v25);
    *(float *)&v28 = v28;
    LODWORD(v36) = LODWORD(v28);
    *(float *)&v31 = v31;
    LODWORD(v37) = LODWORD(v31);
    *(float *)&v38 = v34;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSpriteNode setColor:](v5, "setColor:", v39);

    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_warpGeometry"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSpriteNode setWarpGeometry:](v5, "setWarpGeometry:", v40);

    -[SKSpriteNode setSubdivisionLevels:](v5, "setSubdivisionLevels:", -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("_subdivisionLevels")));
  }

  return v7;
}

- (SKSpriteNode)initWithImageNamed:(NSString *)name
{
  void *v4;
  SKSpriteNode *v5;

  +[SKTexture textureWithImageNamed:](SKTexture, "textureWithImageNamed:", name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SKSpriteNode initWithTexture:](self, "initWithTexture:", v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  float32x4_t *skcSpriteNode;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float32x4_t v23;
  __int128 v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SKSpriteNode;
  -[SKNode encodeWithCoder:](&v25, sel_encodeWithCoder_, v4);
  skcSpriteNode = (float32x4_t *)self->_skcSpriteNode;
  v23 = skcSpriteNode[21];
  v6 = vmlsq_f32((float32x4_t)SKCNode::getTranslation((__n128 *)skcSpriteNode), skcSpriteNode[22], v23).u64[0];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", *(float *)&v6, *((float *)&v6 + 1), v23.f32[0], v23.f32[1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_bounds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[SKSpriteNode blendMode](self, "blendMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_blendMode"));

  -[SKSpriteNode shader](self, "shader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_shader"));

  -[SKSpriteNode normalTexture](self, "normalTexture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_normalTexture"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[SKSpriteNode lightingBitMask](self, "lightingBitMask"), CFSTR("_lightingBitMask"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[SKSpriteNode shadowCastBitMask](self, "shadowCastBitMask"), CFSTR("_shadowCastBitMask"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[SKSpriteNode shadowedBitMask](self, "shadowedBitMask"), CFSTR("_shadowedBitMask"));
  -[SKSpriteNode texture](self, "texture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("_texture"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SKSpriteNode colorBlendFactor](self, "colorBlendFactor");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("_colorMix"));

  v14 = (void *)MEMORY[0x1E0CB3B18];
  -[SKSpriteNode anchorPoint](self, "anchorPoint");
  objc_msgSend(v14, "valueWithCGPoint:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("_anchorPoint"));

  v24 = *((_OWORD *)self->_skcSpriteNode + 19);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&v24, (_QWORD)v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("_baseColorR"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&v24 + 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("_baseColorG"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&v24 + 2));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("_baseColorB"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&v24 + 3));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("_baseColorA"));

  v20 = (void *)MEMORY[0x1E0CB3B18];
  -[SKSpriteNode centerRect](self, "centerRect");
  objc_msgSend(v20, "valueWithCGRect:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("_centerRect"));

  -[SKSpriteNode warpGeometry](self, "warpGeometry");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("_warpGeometry"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SKSpriteNode subdivisionLevels](self, "subdivisionLevels"), CFSTR("_subdivisionLevels"));
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SKSpriteNode anchorPoint](self, "anchorPoint");
  v9 = v8;
  v11 = v10;
  -[SKSpriteNode setSize:](self, "setSize:", width, height);
  -[SKNode setPosition:](self, "setPosition:", x + v9 * width, y + v11 * height);
}

- (SKSpriteNode)initWithColor:(UIColor *)color size:(CGSize)size
{
  return -[SKSpriteNode initWithTexture:color:size:](self, "initWithTexture:color:size:", 0, color, size.width, size.height);
}

- (SKSpriteNode)initWithTexture:(SKTexture *)texture
{
  SKTexture *v4;
  void *v5;
  SKSpriteNode *v6;

  v4 = texture;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKTexture size](v4, "size");
  v6 = -[SKSpriteNode initWithTexture:color:size:](self, "initWithTexture:color:size:", v4, v5);

  return v6;
}

+ (SKSpriteNode)spriteNodeWithImageNamed:(NSString *)name
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = name;
  v4 = (void *)objc_opt_class();
  +[SKTexture textureWithImageNamed:](SKTexture, "textureWithImageNamed:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spriteNodeWithTexture:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKSpriteNode *)v6;
}

+ (SKSpriteNode)spriteNodeWithImageNamed:(NSString *)name normalMapped:(BOOL)generateNormalMap
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = generateNormalMap;
  +[SKTexture textureWithImageNamed:](SKTexture, "textureWithImageNamed:", name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "spriteNodeWithTexture:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "textureByGeneratingNormalMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNormalTexture:", v7);

  }
  return (SKSpriteNode *)v6;
}

+ (SKSpriteNode)spriteNodeWithTexture:(SKTexture *)texture
{
  SKTexture *v3;
  void *v4;

  v3 = texture;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTexture:", v3);

  return (SKSpriteNode *)v4;
}

+ (SKSpriteNode)spriteNodeWithTexture:(SKTexture *)texture size:(CGSize)size
{
  double height;
  double width;
  SKTexture *v6;
  void *v7;
  void *v8;
  void *v9;
  CGSize v11;

  height = size.height;
  width = size.width;
  v6 = texture;
  objc_msgSend((id)objc_opt_class(), "spriteNodeWithTexture:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (width < 0.0 || height < 0.0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v11.width = width;
    v11.height = height;
    NSStringFromCGSize(v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid bounds specified: %@"), v9);

  }
  objc_msgSend(v7, "setSize:", width, height);

  return (SKSpriteNode *)v7;
}

+ (SKSpriteNode)spriteNodeWithTexture:(SKTexture *)texture normalMap:(SKTexture *)normalMap
{
  SKTexture *v5;
  SKTexture *v6;
  void *v7;

  v5 = texture;
  v6 = normalMap;
  objc_msgSend((id)objc_opt_class(), "spriteNodeWithTexture:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNormalTexture:", v6);

  return (SKSpriteNode *)v7;
}

+ (SKSpriteNode)spriteNodeWithColor:(UIColor *)color size:(CGSize)size
{
  double height;
  double width;
  UIColor *v6;
  void *v7;

  height = size.height;
  width = size.width;
  v6 = color;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithColor:size:", v6, width, height);

  return (SKSpriteNode *)v7;
}

- (NSString)description
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  CGPoint v18;
  CGSize v19;
  CGPoint v20;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[SKNode name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode texture](self, "texture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SKSpriteNode texture](self, "texture");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "description");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("'nil'");
  }
  -[SKNode position](self, "position");
  NSStringFromCGPoint(v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode xScale](self, "xScale");
  v10 = v9;
  -[SKNode yScale](self, "yScale");
  v12 = v11;
  -[SKSpriteNode size](self, "size");
  NSStringFromCGSize(v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKSpriteNode anchorPoint](self, "anchorPoint");
  NSStringFromCGPoint(v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKNode zRotation](self, "zRotation");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<SKSpriteNode> name:'%@' texture:[%@] position:%@ scale:{%.2f, %.2f} size:%@ anchor:%@ rotation:%.2f"), v5, v7, v8, v10, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {

  }
  return (NSString *)v16;
}

- (SKTexture)texture
{
}

- (void)setTexture:(SKTexture *)texture
{
  SKTexture *v4;
  void *skcNode;
  SKTexture *v6;

  v4 = texture;
  skcNode = self->super._skcNode;
  v6 = v4;
  if (skcNode)
  {
    v4 = v6;
  }
  SKCSpriteNode::setPrimaryTexture((id *)skcNode, v4);

}

- (void)setNormalTexture:(SKTexture *)normalTexture
{
  SKTexture *v4;
  void *skcNode;
  SKTexture *v6;

  v4 = normalTexture;
  skcNode = self->super._skcNode;
  v6 = v4;
  if (skcNode)
  {
    v4 = v6;
  }
  SKCSpriteNode::setSecondaryTexture((id *)skcNode, v4);

}

- (SKTexture)normalTexture
{
}

- (void)setShader:(SKShader *)shader
{
  SKShader *v4;

  v4 = shader;
  objc_msgSend(*((id *)self->_skcSpriteNode + 74), "_removeTargetNode:", self);
  SKCSpriteNode::setShader((id *)self->_skcSpriteNode, v4);
  -[SKShader _addTargetNode:](v4, "_addTargetNode:", self);

}

- (SKShader)shader
{
  return (SKShader *)*((id *)self->_skcSpriteNode + 74);
}

- (CGFloat)colorBlendFactor
{
  return *((float *)self->_skcSpriteNode + 80);
}

- (void)setColorBlendFactor:(CGFloat)colorBlendFactor
{
  void *skcSpriteNode;
  float v4;
  float v5;

  skcSpriteNode = self->_skcSpriteNode;
  v4 = colorBlendFactor;
  v5 = fminf(fmaxf(v4, 0.0), 1.0);
  (*(void (**)(void *, float *))(*(_QWORD *)skcSpriteNode + 192))(skcSpriteNode, &v5);
}

- (UIColor)color
{
  double v2;
  double v3;
  double v4;
  double v5;
  _DWORD *skcSpriteNode;

  skcSpriteNode = self->_skcSpriteNode;
  LODWORD(v2) = skcSpriteNode[76];
  LODWORD(v3) = skcSpriteNode[77];
  LODWORD(v4) = skcSpriteNode[78];
  LODWORD(v5) = skcSpriteNode[79];
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", v2, v3, v4, v5);
}

- (void)setColor:(UIColor *)color
{
  UIColor *v4;
  void *skcSpriteNode;
  int v6;
  __int128 v7;
  unsigned int v8;
  unsigned int v9;
  __int128 v10;

  v4 = color;
  -[UIColor componentRGBA](v4, "componentRGBA");
  skcSpriteNode = self->_skcSpriteNode;
  DWORD1(v7) = v6;
  *((_QWORD *)&v7 + 1) = __PAIR64__(v9, v8);
  v10 = v7;
  (*(void (**)(void *, __int128 *))(*(_QWORD *)skcSpriteNode + 184))(skcSpriteNode, &v10);

}

- (CGPoint)anchorPoint
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcSpriteNode + 352));
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
  unsigned int v3;
  unsigned int v4;
  __int128 v5;

  *(float *)&v3 = anchorPoint.x;
  *(float *)&v4 = anchorPoint.y;
  v5 = __PAIR64__(v4, v3);
  SKCNode::setAnchor((SKCNode *)self->_skcSpriteNode, &v5);
}

- (CGSize)size
{
  float64x2_t v2;
  double v3;
  CGSize result;

  v2 = vcvtq_f64_f32(vmul_f32(*(float32x2_t *)((char *)self->_skcSpriteNode + 336), (float32x2_t)(SKCNode::getScale((__n128 *)self->_skcSpriteNode).n128_u64[0] & 0x7FFFFFFF7FFFFFFFLL)));
  v3 = v2.f64[1];
  result.width = v2.f64[0];
  result.height = v3;
  return result;
}

- (void)setSize:(CGSize)size
{
  double height;
  double width;
  __n128 Scale;
  int8x16_t v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  int32x4_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  float32x4_t v20;

  height = size.height;
  width = size.width;
  Scale = SKCNode::getScale((__n128 *)self->_skcSpriteNode);
  v7.i32[0] = 0;
  *(float *)&v8 = width;
  *(float *)&v9 = height;
  v10 = __PAIR64__(v9, v8);
  v11 = (int32x4_t)vandq_s8((int8x16_t)vclezq_f32((float32x4_t)Scale), (int8x16_t)xmmword_1DC9221D0);
  v11.i32[0] = vaddvq_s32(v11);
  v12.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v12.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  v7.i64[0] = vceqq_s8(vandq_s8((int8x16_t)v11, v12), vandq_s8(v7, v12)).u64[0];
  v13 = vdupq_lane_s8(*(int8x8_t *)v7.i8, 0);
  v14 = (int8x16_t)vdupq_n_s64(v7.i8[0] & 0xF | (unint64_t)(16 * (v13.i8[1] & 0xF)) | ((v13.i8[2] & 0xF) << 8) & 0xFFF | ((v13.i8[3] & 0xFu) << 12) | ((unint64_t)(v13.i8[4] & 0xF) << 16) & 0xFFFFFFFFFF0FFFFFLL | ((unint64_t)(v13.i8[5] & 0xF) << 20) | ((unint64_t)(v13.i8[6] & 0xF) << 24) | ((unint64_t)(v13.i8[7] & 0xF) << 28) | ((unint64_t)(v13.i8[8] & 0xF) << 32) | ((unint64_t)(v13.i8[9] & 0xF) << 36) | ((unint64_t)(v13.i8[10] & 0xF) << 40) | ((unint64_t)(v13.i8[11] & 0xF) << 44) | ((unint64_t)(v13.i8[12] & 0xF) << 48) | ((unint64_t)(v13.i8[13] & 0xF) << 52) | ((unint64_t)(v13.i8[14] & 0xF) << 56) | ((unint64_t)v13.u8[15] << 60));
  __asm { FMOV            V3.4S, #1.0 }
  v20 = vdivq_f32((float32x4_t)v10, (float32x4_t)vbslq_s8(v14, (int8x16_t)Scale, _Q3));
  SKCNode::setSize((uint64_t)self->_skcSpriteNode, &v20);
}

- (void)scaleToSize:(CGSize)size
{
  SKCNode *skcSpriteNode;
  __int128 v4;
  int32x2_t v5;
  CGFloat height;

  skcSpriteNode = (SKCNode *)self->_skcSpriteNode;
  v4 = *((_OWORD *)skcSpriteNode + 21);
  v5 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)vrev64_s32(*(int32x2_t *)&v4), (int8x8_t)0x6000000060000000));
  if (((v5.i32[1] | v5.i32[0]) & 1) == 0)
  {
    height = size.height;
    *(float32x2_t *)&size.width = vdiv_f32(vcvt_f32_f64((float64x2_t)size), *(float32x2_t *)&v4);
    SKCNode::setScale(skcSpriteNode, (__n128)size);
  }
}

- (CGRect)centerRect
{
  float *skcSpriteNode;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  skcSpriteNode = (float *)self->_skcSpriteNode;
  v3 = skcSpriteNode[144];
  v4 = skcSpriteNode[145];
  v5 = skcSpriteNode[146];
  v6 = skcSpriteNode[147];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setCenterRect:(CGRect)centerRect
{
  CGFloat height;
  CGFloat y;

  height = centerRect.size.height;
  y = centerRect.origin.y;
  *((float32x4_t *)self->_skcSpriteNode + 36) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)centerRect.origin), (float64x2_t)centerRect.size);
}

- (void)setWarpGeometry:(id)a3
{
  SKCSpriteNode::setWarpGeometry((id *)self->_skcSpriteNode, (SKWarpGeometry *)a3);
}

- (SKWarpGeometry)warpGeometry
{
  return (SKWarpGeometry *)*((id *)self->_skcSpriteNode + 77);
}

- (void)setSubdivisionLevels:(int64_t)a3
{
  SKCSpriteNode::setSubdivisionLevels((SKCNode *)self->_skcSpriteNode, a3);
}

- (int64_t)subdivisionLevels
{
  return *((unsigned int *)self->_skcSpriteNode + 156);
}

- (BOOL)repeatTexture
{
  return 0;
}

- (CGSize)repeatTextureSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setLightingBitMask:(uint32_t)lightingBitMask
{
  *((_DWORD *)self->_skcSpriteNode + 140) = lightingBitMask;
}

- (uint32_t)lightingBitMask
{
  return *((_DWORD *)self->_skcSpriteNode + 140);
}

- (void)setShadowCastBitMask:(uint32_t)shadowCastBitMask
{
  *((_DWORD *)self->_skcSpriteNode + 141) = shadowCastBitMask;
}

- (uint32_t)shadowCastBitMask
{
  return *((_DWORD *)self->_skcSpriteNode + 141);
}

- (void)setShadowedBitMask:(uint32_t)shadowedBitMask
{
  *((_DWORD *)self->_skcSpriteNode + 142) = shadowedBitMask;
}

- (uint32_t)shadowedBitMask
{
  return *((_DWORD *)self->_skcSpriteNode + 142);
}

- (SKBlendMode)blendMode
{
  return *((_QWORD *)self->_skcSpriteNode + 36);
}

- (void)setBlendMode:(SKBlendMode)blendMode
{
  SKCNode::setBlendMode((SKCNode *)self->_skcSpriteNode, blendMode);
}

- (id)copy
{
  return -[SKSpriteNode copyWithZone:](self, "copyWithZone:", MEMORY[0x1DF0CF2F0](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKSpriteNode;
  v4 = -[SKNode copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[SKSpriteNode texture](self, "texture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTexture:", v5);

  -[SKSpriteNode size](self, "size");
  objc_msgSend(v4, "setSize:");
  -[SKSpriteNode color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColor:", v6);

  -[SKSpriteNode colorBlendFactor](self, "colorBlendFactor");
  objc_msgSend(v4, "setColorBlendFactor:");
  objc_msgSend(v4, "setBlendMode:", -[SKSpriteNode blendMode](self, "blendMode"));
  objc_msgSend(v4, "setLightingBitMask:", -[SKSpriteNode lightingBitMask](self, "lightingBitMask"));
  objc_msgSend(v4, "setShadowCastBitMask:", -[SKSpriteNode shadowCastBitMask](self, "shadowCastBitMask"));
  objc_msgSend(v4, "setShadowedBitMask:", -[SKSpriteNode shadowedBitMask](self, "shadowedBitMask"));
  -[SKSpriteNode normalTexture](self, "normalTexture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNormalTexture:", v7);

  -[SKSpriteNode shader](self, "shader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShader:", v8);

  -[SKSpriteNode centerRect](self, "centerRect");
  objc_msgSend(v4, "setCenterRect:");
  return v4;
}

- (BOOL)isEqualToNode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SKSpriteNode *v8;
  SKSpriteNode *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  SKBlendMode v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  float v40;
  double v41;
  CGColor *v42;
  id v43;
  id v44;
  void *v45;
  int v46;
  void *v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;

  v8 = (SKSpriteNode *)a3;
  if (self == v8)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      v48.receiver = self;
      v48.super_class = (Class)SKSpriteNode;
      if (-[SKNode isEqualToNode:](&v48, sel_isEqualToNode_, v9))
      {
        -[SKSpriteNode size](self, "size");
        v11 = v10;
        v13 = v12;
        -[SKSpriteNode size](v9, "size");
        LOBYTE(v15) = 0;
        if (v11 == v16 && v13 == v14)
        {
          -[SKSpriteNode anchorPoint](self, "anchorPoint");
          v18 = v17;
          v20 = v19;
          -[SKSpriteNode anchorPoint](v9, "anchorPoint");
          v15 = SKBlendModeAlpha;
          if (v18 == v22 && v20 == v21)
          {
            -[SKSpriteNode texture](self, "texture");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "imageNameOrPath");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24
              || (-[SKSpriteNode texture](v9, "texture"),
                  v45 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v45, "imageNameOrPath"),
                  (v15 = objc_claimAutoreleasedReturnValue()) != SKBlendModeAlpha))
            {
              -[SKSpriteNode texture](self, "texture");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "imageNameOrPath");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              -[SKSpriteNode texture](v9, "texture");
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "imageNameOrPath");
              v3 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v5, "isEqualToString:", v3))
              {
                v47 = (void *)v15;
                LOBYTE(v15) = 0;
                goto LABEL_23;
              }
              v46 = 1;
            }
            else
            {
              v46 = 0;
            }
            v47 = (void *)v15;
            -[SKSpriteNode centerRect](self, "centerRect");
            v27 = v26;
            v29 = v28;
            v31 = v30;
            v33 = v32;
            -[SKSpriteNode centerRect](v9, "centerRect");
            v50.origin.x = v34;
            v50.origin.y = v35;
            v50.size.width = v36;
            v50.size.height = v37;
            v49.origin.x = v27;
            v49.origin.y = v29;
            v49.size.width = v31;
            v49.size.height = v33;
            if (CGRectEqualToRect(v49, v50)
              && (-[SKSpriteNode colorBlendFactor](self, "colorBlendFactor"),
                  v39 = v38,
                  -[SKSpriteNode colorBlendFactor](v9, "colorBlendFactor"),
                  v40 = v39,
                  *(float *)&v41 = v41,
                  (COERCE_UNSIGNED_INT(v40 - *(float *)&v41) & 0x60000000) == 0))
            {
              -[SKSpriteNode color](self, "color");
              v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v42 = (CGColor *)objc_msgSend(v44, "CGColor");
              -[SKSpriteNode color](v9, "color");
              v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              if (!CGColorEqualToColor(v42, (CGColorRef)objc_msgSend(v43, "CGColor")))
              {

                LOBYTE(v15) = 0;
                if (!v46)
                  goto LABEL_24;
                goto LABEL_23;
              }
              v15 = -[SKSpriteNode blendMode](self, "blendMode");
              LOBYTE(v15) = v15 == -[SKSpriteNode blendMode](v9, "blendMode");

            }
            else
            {
              LOBYTE(v15) = 0;
            }
            if ((v46 & 1) == 0)
            {
LABEL_24:
              if (!v24)
              {

              }
              goto LABEL_15;
            }
LABEL_23:

            goto LABEL_24;
          }
        }
      }
      else
      {
        LOBYTE(v15) = 0;
      }
LABEL_15:

      goto LABEL_16;
    }
    LOBYTE(v15) = 0;
  }
LABEL_16:

  return v15;
}

- (BOOL)_pathFromTextureToPoints:(SKSpriteNode *)self outSize:(SEL)a2 accuracy:
{
  void **v2;
  int64_t *v3;
  int v4;
  BOOL v5;
  int64_t *v6;
  int v7;
  void **v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;

  v5 = 0;
  if (v2)
  {
    v6 = v3;
    if (v3)
    {
      v7 = v4;
      v8 = v2;
      -[SKSpriteNode texture](self, "texture");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKSpriteNode size](self, "size");
      v12 = v11;
      v14 = v13;
      LODWORD(v11) = 998277249;
      v15 = v12;
      v16 = v14;
      LODWORD(v14) = v7;
      +[SKPhysicsBody bodyWithTexture:alphaThreshold:size:accuracy:](SKPhysicsBody, "bodyWithTexture:alphaThreshold:size:accuracy:", v10, v11, v15, v16, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "volume");
      v19 = v18;
      v5 = v18 != 0;
      if (v18)
      {
        v20 = *(_QWORD *)(v18 + 16) - *(_QWORD *)(v18 + 8);
        *v6 = v20 >> 3;
        *v8 = malloc_type_malloc(v20, 0x100004000313F17uLL);
        v21 = *(_QWORD *)(v19 + 8);
        if (*(_QWORD *)(v19 + 16) != v21)
        {
          v22 = 0;
          do
          {
            *((_QWORD *)*v8 + v22) = *(_QWORD *)(v21 + 8 * v22);
            ++v22;
            v21 = *(_QWORD *)(v19 + 8);
          }
          while (v22 < (*(_QWORD *)(v19 + 16) - v21) >> 3);
        }
        PKPath::~PKPath((PKPath *)v19);
        MEMORY[0x1DF0CF560]();
      }

    }
  }
  return v5;
}

- (SKAttributeValue)valueForAttributeNamed:(NSString *)key
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKSpriteNode;
  -[SKNode valueForAttributeNamed:](&v4, sel_valueForAttributeNamed_, key);
  return (SKAttributeValue *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKSpriteNode;
  -[SKNode setValue:forAttributeNamed:](&v4, sel_setValue_forAttributeNamed_, value, key);
}

+ (id)debugHierarchyPropertyDescriptions
{
  const CFDictionaryKeyCallBacks *v2;
  const CFDictionaryValueCallBacks *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  __CFDictionary *v14;
  CFNumberRef v15;
  __CFDictionary *v16;
  CFNumberRef v17;
  __CFDictionary *v18;
  CFNumberRef v19;
  CFNumberRef v20;
  void *v21;
  __CFDictionary *v23;
  __CFDictionary *v24;
  __CFDictionary *v25;
  __CFDictionary *v26;
  uint64_t valuePtr;
  _QWORD v28[15];

  v28[13] = *MEMORY[0x1E0C80C00];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("anchorPoint"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("CGPoint"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypePoint"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v26 = Mutable;
  v28[0] = Mutable;
  v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("centerRect"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v25 = v5;
  v28[1] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("shader"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v24 = v6;
  v28[2] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("size"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v23 = v7;
  v28[3] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("lightingBitMask"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("unsigned long"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("ul"));
  v28[4] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("shadowCastBitMask"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("unsigned long"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("ul"));
  v28[5] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("shadowedBitMask"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("unsigned long"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("ul"));
  v28[6] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("colorBlendFactor"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("CGf"));
  v28[7] = v11;
  v12 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("color"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("color"));
  v28[8] = v12;
  v13 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("blendMode"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("SKBlendMode"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("integer"));
  v28[9] = v13;
  v14 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("texture"));
  CFDictionaryAddValue(v14, CFSTR("propertyRuntimeType"), CFSTR("CGImage"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("public.data"));
  valuePtr = 1;
  v15 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v14, CFSTR("propertyOptions"), v15);
  CFRelease(v15);
  v28[10] = v14;
  v16 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("normalTexture"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("CGImage"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("public.data"));
  valuePtr = 1;
  v17 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v16, CFSTR("propertyOptions"), v17);
  CFRelease(v17);
  v28[11] = v16;
  v18 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v18, CFSTR("propertyName"), CFSTR("visualRepresentation"));
  CFDictionaryAddValue(v18, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeCustom"));
  valuePtr = 8;
  v19 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v18, CFSTR("visibility"), v19);
  CFRelease(v19);
  valuePtr = 1;
  v20 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v18, CFSTR("propertyOptions"), v20);
  CFRelease(v20);
  v28[12] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  CGImage *v12;
  __CFData *Mutable;
  uint64_t v14;
  CGImageDestination *v15;
  const __CFAllocator *v16;
  CFNumberRef v17;
  const __CFDictionary *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CGImageDestination *v22;
  const __CFAllocator *v23;
  CFNumberRef v24;
  const __CFDictionary *v25;
  id v26;
  CGColor *v27;
  size_t NumberOfComponents;
  uint64_t v29;
  CFIndex v30;
  __CFString *v31;
  CFIndex v32;
  uint64_t v33;
  void *v34;
  id v35;
  NSString *v36;
  const CGFloat *Components;
  const void **v38;
  const void **v39;
  uint64_t v40;
  CFNumberRef *v41;
  CFArrayRef v42;
  uint64_t v43;
  CFTypeRef *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSString *v51;
  id v52;
  __CFString *v53;
  id v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v63;
  CGColor *v64;
  __CFDictionary *v65;
  size_t v66;
  __CFString *v67;
  uint64_t v68;
  uint64_t v69;
  const CGFloat *v70;
  const void **v71;
  const void **v72;
  uint64_t v73;
  CFNumberRef *v74;
  CFArrayRef v75;
  uint64_t v76;
  CFTypeRef *v77;
  id v78;
  CGColorSpace *ColorSpace;
  CFIndex numValues;
  uint64_t numValuesa;
  CGColorSpace *space;
  int64_t spacea;
  CFStringRef value;
  id valuea;
  CFStringRef valueb;
  id v87;
  int valuePtr;
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[3];
  const __CFString *v93;
  uint64_t v94;
  const __CFString *v95;
  uint64_t v96;
  void *values[3];
  void *keys[5];

  keys[3] = *(void **)MEMORY[0x1E0C80C00];
  v9 = a3;
  v87 = a4;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("texture")))
  {
    objc_msgSend(v87, "texture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v87, "texture");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (CGImage *)objc_msgSend(v11, "CGImage");

      if (v12)
      {
        valuePtr = 1065353216;
        Mutable = CFDataCreateMutable(0, 0);
        v14 = *MEMORY[0x1E0CA5C10];
        v15 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x1E0CA5C10], 1uLL, 0);
        v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v17 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
        keys[0] = *(void **)MEMORY[0x1E0CBC780];
        values[0] = v17;
        v18 = CFDictionaryCreate(v16, (const void **)keys, (const void **)values, 1, 0, 0);
        CGImageDestinationAddImage(v15, v12, v18);
        CGImageDestinationFinalize(v15);
        CFRelease(v18);
        CFRelease(v17);
        CFRelease(v15);
        v95 = CFSTR("propertyFormat");
        v96 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        Mutable = 0;
      }
LABEL_24:
      CGImageRelease(v12);
      goto LABEL_77;
    }
LABEL_9:
    Mutable = 0;
    goto LABEL_77;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("normalTexture")))
  {
    objc_msgSend(v87, "normalTexture");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v87, "normalTexture");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (CGImage *)objc_msgSend(v20, "CGImage");

      if (v12)
      {
        valuePtr = 1065353216;
        Mutable = CFDataCreateMutable(0, 0);
        v21 = *MEMORY[0x1E0CA5C10];
        v22 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x1E0CA5C10], 1uLL, 0);
        v23 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v24 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
        keys[0] = *(void **)MEMORY[0x1E0CBC780];
        values[0] = v24;
        v25 = CFDictionaryCreate(v23, (const void **)keys, (const void **)values, 1, 0, 0);
        CGImageDestinationAddImage(v22, v12, v25);
        CGImageDestinationFinalize(v22);
        CFRelease(v25);
        CFRelease(v24);
        CFRelease(v22);
        v93 = CFSTR("propertyFormat");
        v94 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        Mutable = 0;
      }
      goto LABEL_24;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("color")))
  {
    objc_msgSend(v87, "color");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = (CGColor *)objc_msgSend(v26, "CGColor");
    if (v27)
    {
      Mutable = CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
      space = CGColorGetColorSpace(v27);
      value = CGColorSpaceCopyName(space);
      NumberOfComponents = CGColorGetNumberOfComponents(v27);
      v29 = NumberOfComponents << 32;
      v30 = (int)NumberOfComponents;
      if (NumberOfComponents << 32)
      {
        v31 = CFStringCreateMutable(0, 0);
        numValues = (CFIndex)v26;
        v32 = v30 - 1;
        if ((unint64_t)v30 <= 1)
          v33 = 1;
        else
          v33 = v30;
        do
        {
          CFStringAppend(v31, CFSTR("CGf"));
          if (v32)
            CFStringAppend(v31, CFSTR(", "));
          --v32;
          --v33;
        }
        while (v33);
        v26 = (id)numValues;
      }
      else
      {
        v31 = &stru_1EA5021F8;
      }
      Components = CGColorGetComponents(v27);
      v38 = (const void **)malloc_type_malloc(v29 >> 29, 0x6004044C4A2DFuLL);
      v39 = v38;
      if (v29 >= 1)
      {
        if (v30 <= 1)
          v40 = 1;
        else
          v40 = v30;
        v41 = (CFNumberRef *)v38;
        do
        {
          *v41++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
          --v40;
        }
        while (v40);
      }
      v42 = CFArrayCreate(0, v39, v30, MEMORY[0x1E0C9B378]);
      if (v29 >= 1)
      {
        if (v30 <= 1)
          v43 = 1;
        else
          v43 = v30;
        v44 = v39;
        do
        {
          CFRelease(*v44++);
          --v43;
        }
        while (v43);
      }
      free(v39);
      CGColorSpaceGetModel(space);
      if (v42)
        CFDictionaryAddValue(Mutable, CFSTR("componentValues"), v42);
      if (v31)
        CFDictionaryAddValue(Mutable, CFSTR("componentValuesFormat"), v31);
      if (value)
        CFDictionaryAddValue(Mutable, CFSTR("colorSpaceName"), value);
      if (v42)
        CFRelease(v42);
      if (value)
        CFRelease(value);
      if (v31)
        CFRelease(v31);
    }
    else
    {
      Mutable = 0;
    }

    goto LABEL_77;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("visualRepresentation")))
  {
    objc_msgSend(v87, "texture");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {

LABEL_57:
      objc_msgSend(v87, "createDebugHierarchyVisualRepresentation");
      Mutable = (__CFData *)objc_claimAutoreleasedReturnValue();
      v91[0] = CFSTR("propertyRuntimeType");
      v91[1] = CFSTR("propertyFormat");
      v46 = *MEMORY[0x1E0CA5C10];
      v92[0] = CFSTR("SKTexture");
      v92[1] = v46;
      v91[2] = CFSTR("propertyLogicalType");
      v92[2] = CFSTR("DebugHierarchyLogicalPropertyTypeImage");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_77;
    }
    objc_msgSend(v87, "shader");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
      goto LABEL_57;
    objc_msgSend(v87, "color");
    v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v64 = (CGColor *)objc_msgSend(v63, "CGColor");
    if (v64)
    {
      v65 = CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
      ColorSpace = CGColorGetColorSpace(v64);
      valueb = CGColorSpaceCopyName(ColorSpace);
      v66 = CGColorGetNumberOfComponents(v64);
      numValuesa = (int)v66;
      spacea = v66 << 32;
      if (v66 << 32)
      {
        v67 = CFStringCreateMutable(0, 0);
        v78 = v63;
        v68 = numValuesa - 1;
        if ((unint64_t)numValuesa <= 1)
          v69 = 1;
        else
          v69 = numValuesa;
        do
        {
          CFStringAppend(v67, CFSTR("CGf"));
          if (v68)
            CFStringAppend(v67, CFSTR(", "));
          --v68;
          --v69;
        }
        while (v69);
        v63 = v78;
      }
      else
      {
        v67 = &stru_1EA5021F8;
      }
      v70 = CGColorGetComponents(v64);
      v71 = (const void **)malloc_type_malloc(spacea >> 29, 0x6004044C4A2DFuLL);
      v72 = v71;
      if (spacea >= 1)
      {
        if (numValuesa <= 1)
          v73 = 1;
        else
          v73 = numValuesa;
        v74 = (CFNumberRef *)v71;
        do
        {
          *v74++ = CFNumberCreate(0, kCFNumberCGFloatType, v70++);
          --v73;
        }
        while (v73);
      }
      v75 = CFArrayCreate(0, v72, numValuesa, MEMORY[0x1E0C9B378]);
      if (spacea >= 1)
      {
        if (numValuesa <= 1)
          v76 = 1;
        else
          v76 = numValuesa;
        v77 = v72;
        do
        {
          CFRelease(*v77++);
          --v76;
        }
        while (v76);
      }
      free(v72);
      CGColorSpaceGetModel(ColorSpace);
      if (v75)
        CFDictionaryAddValue(v65, CFSTR("componentValues"), v75);
      if (v67)
        CFDictionaryAddValue(v65, CFSTR("componentValuesFormat"), v67);
      if (valueb)
        CFDictionaryAddValue(v65, CFSTR("colorSpaceName"), valueb);
      if (v75)
        CFRelease(v75);
      if (valueb)
        CFRelease(valueb);
      if (v67)
        CFRelease(v67);
    }
    else
    {
      v65 = 0;
    }

    v89[0] = CFSTR("propertyRuntimeType");
    v89[1] = CFSTR("propertyFormat");
    v90[0] = CFSTR("CGColorRef");
    v90[1] = CFSTR("color");
    v89[2] = CFSTR("propertyLogicalType");
    v90[2] = CFSTR("DebugHierarchyLogicalPropertyTypeColor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    Mutable = v65;
  }
  else
  {
    valuea = v87;
    v35 = v9;
    if (!objc_msgSend(v35, "length"))
      goto LABEL_67;
    NSSelectorFromString((NSString *)v35);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v36 = (NSString *)v35;
    }
    else
    {
      if ((unint64_t)objc_msgSend(v35, "length") < 2)
      {
        objc_msgSend(v35, "uppercaseString");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v35, "substringToIndex:", 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "uppercaseString");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "substringFromIndex:", 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringByAppendingString:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(CFSTR("is"), "stringByAppendingString:", v50);
      v51 = (NSString *)objc_claimAutoreleasedReturnValue();
      NSSelectorFromString(v51);
      v36 = (objc_opt_respondsToSelector() & 1) != 0 ? v51 : 0;

    }
    if (v36)
    {
      objc_msgSend(valuea, "valueForKey:", v36);
      Mutable = (__CFData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_67:
      if (a6)
      {
        v52 = valuea;
        v53 = (__CFString *)v35;
        if (v52)
        {
          v54 = v52;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v52);
          v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v54 = 0;
          v55 = &stru_1EA5021F8;
        }
        if (v53)
          v56 = v53;
        else
          v56 = &stru_1EA5021F8;
        v57 = v56;
        values[0] = CFSTR("propertyName");
        values[1] = CFSTR("objectDescription");
        values[2] = CFSTR("errorDescription");
        keys[0] = v57;
        keys[1] = v55;
        keys[2] = &stru_1EA5021F8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", keys, values, 3);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v54;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = objc_retainAutorelease(v60);
        *a6 = v61;

      }
      v36 = 0;
      Mutable = 0;
    }

  }
LABEL_77:

  return Mutable;
}

- (BOOL)shouldRepeatTexture
{
  return self->_shouldRepeatTexture;
}

- (void)setShouldRepeatTexture:(BOOL)a3
{
  self->_shouldRepeatTexture = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_light);
}

@end
