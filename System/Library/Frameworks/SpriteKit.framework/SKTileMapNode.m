@implementation SKTileMapNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUInteger)numberOfColumns
{
  return *((unsigned int *)self->_skcTileMapNode + 151);
}

- (void)setNumberOfColumns:(NSUInteger)numberOfColumns
{
  -[SKTileMapNode setColumns:andRows:](self, "setColumns:andRows:", numberOfColumns, -[SKTileMapNode numberOfRows](self, "numberOfRows"));
}

- (NSUInteger)numberOfRows
{
  return *((unsigned int *)self->_skcTileMapNode + 152);
}

- (void)setNumberOfRows:(NSUInteger)numberOfRows
{
  -[SKTileMapNode setColumns:andRows:](self, "setColumns:andRows:", -[SKTileMapNode numberOfColumns](self, "numberOfColumns"), numberOfRows);
}

- (CGSize)tileSize
{
  double width;
  double height;
  CGSize result;

  width = self->_tileSize.width;
  height = self->_tileSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTileSize:(CGSize)tileSize
{
  self->_tileSize = tileSize;
  -[SKTileMapNode calculateSize](self, "calculateSize");
  SKCTileMapNode::forceRedraw((SKCTileMapNode **)self->_skcTileMapNode, 0);
}

- (CGSize)mapSize
{
  float64x2_t v2;
  double v3;
  CGSize result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcTileMapNode + 336));
  v3 = v2.f64[1];
  result.width = v2.f64[0];
  result.height = v3;
  return result;
}

- (SKTileSet)tileSet
{
  return self->_tileSet;
}

- (void)setTileSet:(SKTileSet *)tileSet
{
  SKTileSet **p_tileSet;
  double v6;
  double v7;
  SKTileSet *v8;

  p_tileSet = &self->_tileSet;
  v8 = tileSet;
  if (*p_tileSet != v8)
  {
    objc_storeStrong((id *)&self->_tileSet, tileSet);
    SKCTileMapNode::setTileSetType((uint64_t)self->_skcTileMapNode, -[SKTileSet type](v8, "type"));
    if (*p_tileSet)
    {
      -[SKTileSet defaultTileSize](*p_tileSet, "defaultTileSize");
    }
    else
    {
      v6 = *MEMORY[0x1E0C9D820];
      v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    -[SKTileMapNode setTileSize:](self, "setTileSize:", v6, v7);
    -[SKTileMapNode calculateSize](self, "calculateSize");
    -[SKTileMapNode rebuildTileSprites](self, "rebuildTileSprites");
    SKCTileMapNode::forceRedraw((SKCTileMapNode **)self->_skcTileMapNode, 1);
  }

}

- (CGFloat)colorBlendFactor
{
  return *((float *)self->_skcTileMapNode + 80);
}

- (void)setColorBlendFactor:(CGFloat)colorBlendFactor
{
  void *skcTileMapNode;
  float v4;
  float v5;

  skcTileMapNode = self->_skcTileMapNode;
  v4 = colorBlendFactor;
  v5 = fminf(fmaxf(v4, 0.0), 1.0);
  (*(void (**)(void *, float *))(*(_QWORD *)skcTileMapNode + 192))(skcTileMapNode, &v5);
}

- (UIColor)color
{
  double v2;
  double v3;
  double v4;
  double v5;
  _DWORD *skcTileMapNode;

  skcTileMapNode = self->_skcTileMapNode;
  LODWORD(v2) = skcTileMapNode[76];
  LODWORD(v3) = skcTileMapNode[77];
  LODWORD(v4) = skcTileMapNode[78];
  LODWORD(v5) = skcTileMapNode[79];
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", v2, v3, v4, v5);
}

- (void)setColor:(UIColor *)color
{
  UIColor *v4;
  void *skcTileMapNode;
  int v6;
  __int128 v7;
  unsigned int v8;
  unsigned int v9;
  __int128 v10;

  v4 = color;
  -[UIColor componentRGBA](v4, "componentRGBA");
  skcTileMapNode = self->_skcTileMapNode;
  DWORD1(v7) = v6;
  *((_QWORD *)&v7 + 1) = __PAIR64__(v9, v8);
  v10 = v7;
  (*(void (**)(void *, __int128 *))(*(_QWORD *)skcTileMapNode + 184))(skcTileMapNode, &v10);

}

- (SKBlendMode)blendMode
{
  return *((_QWORD *)self->_skcTileMapNode + 36);
}

- (void)setBlendMode:(SKBlendMode)blendMode
{
  SKCNode::setBlendMode((SKCNode *)self->_skcTileMapNode, blendMode);
}

- (CGPoint)anchorPoint
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcTileMapNode + 352));
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;

  *(float *)&v4 = anchorPoint.x;
  *(float *)&v5 = anchorPoint.y;
  v6 = __PAIR64__(v5, v4);
  SKCNode::setAnchor((SKCNode *)self->_skcTileMapNode, &v6);
  SKCTileMapNode::forceRedraw((SKCTileMapNode **)self->_skcTileMapNode, 0);
}

- (SKShader)shader
{
  return (SKShader *)*((id *)self->_skcTileMapNode + 71);
}

- (void)setShader:(SKShader *)shader
{
  SKShader *v4;

  v4 = shader;
  objc_msgSend(*((id *)self->_skcTileMapNode + 71), "_removeTargetNode:", self);
  SKCTileMapNode::setShader((id *)self->_skcTileMapNode, v4);
  -[SKShader _addTargetNode:](v4, "_addTargetNode:", self);

}

- (void)setLightingBitMask:(uint32_t)lightingBitMask
{
  *((_DWORD *)self->_skcTileMapNode + 140) = lightingBitMask;
}

- (uint32_t)lightingBitMask
{
  return *((_DWORD *)self->_skcTileMapNode + 140);
}

- (void)_makeBackingNode
{
  SKCTileMapNode *v2;

  v2 = (SKCTileMapNode *)operator new();
  SKCTileMapNode::SKCTileMapNode(v2);
  return v2;
}

- (void)_didMakeBackingNode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKTileMapNode;
  -[SKNode _didMakeBackingNode](&v3, sel__didMakeBackingNode);
  self->_skcTileMapNode = -[SKNode _backingNode](self, "_backingNode");
}

- (BOOL)enableAutomapping
{
  return self->_enableAutomapping;
}

- (void)setEnableAutomapping:(BOOL)enableAutomapping
{
  if (self->_enableAutomapping != enableAutomapping)
  {
    self->_enableAutomapping = enableAutomapping;
    if (enableAutomapping)
      -[SKTileMapNode rebuildTileSprites](self, "rebuildTileSprites");
  }
}

- (double)alpha
{
  return *((float *)self->_skcTileMapNode + 81);
}

- (void)setAlpha:(double)a3
{
  SKCNode *skcTileMapNode;
  float v5;
  float v6;

  skcTileMapNode = (SKCNode *)self->_skcTileMapNode;
  v5 = a3;
  v6 = v5;
  SKCNode::setAlpha(skcTileMapNode, &v6);
  SKCTileMapNode::forceRedraw((SKCTileMapNode **)self->_skcTileMapNode, 0);
}

- (SKTileMapNode)initWithCoder:(id)a3
{
  id v4;
  SKTileMapNode *v5;
  SKTileMapNode *v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SKTileSet *tileSet;
  SKTileSet *v16;
  uint64_t v17;
  SKTileSet *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  const unsigned int *v38;
  uint64_t v40;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SKTileMapNode;
  v5 = -[SKNode initWithCoder:](&v41, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[SKTileMapNode commonInit](v5, "commonInit");
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_currentColumns"));
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_currentRows"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_tileWidth"));
    v6->_tileSize.width = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_tileHeight"));
    v6->_tileSize.height = v10;
    if (-[SKTileMapNode shouldUnarchiveTileSet](v6, "shouldUnarchiveTileSet"))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tileSetName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKTileMapNode setTileSetName:](v6, "setTileSetName:", v11);

      -[SKTileMapNode tileSetName](v6, "tileSetName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[SKTileMapNode tileSetName](v6, "tileSetName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKTileSet tileSetNamed:](SKTileSet, "tileSetNamed:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        tileSet = v6->_tileSet;
        v6->_tileSet = (SKTileSet *)v14;

      }
      v16 = v6->_tileSet;
      if (!v16)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tileSet"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v6->_tileSet;
        v6->_tileSet = (SKTileSet *)v17;

        v16 = v6->_tileSet;
      }
      SKCTileMapNode::setTileSetType((uint64_t)v6->_skcTileMapNode, -[SKTileSet type](v16, "type"));
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_baseColorR"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_baseColorG"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v24 = v23;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_baseColorB"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_baseColorA"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v29;

    *(float *)&v21 = v21;
    LODWORD(v31) = LODWORD(v21);
    *(float *)&v24 = v24;
    LODWORD(v32) = LODWORD(v24);
    *(float *)&v27 = v27;
    LODWORD(v33) = LODWORD(v27);
    *(float *)&v34 = v30;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTileMapNode setColor:](v6, "setColor:", v35);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_colorBlendFactor"));
    -[SKTileMapNode setColorBlendFactor:](v6, "setColorBlendFactor:");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_blendMode"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTileMapNode setBlendMode:](v6, "setBlendMode:", (int)objc_msgSend(v36, "intValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shader"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTileMapNode setShader:](v6, "setShader:", v37);

    -[SKTileMapNode setLightingBitMask:](v6, "setLightingBitMask:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_lightingBitMask")));
    v6->_enableAutomapping = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enableAutomapping"));
    v40 = 0;
    v38 = (const unsigned int *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("_rawTiles"), &v40);
    -[SKTileMapNode calculateSize](v6, "calculateSize");
    -[SKTileMapNode setColumns:andRows:](v6, "setColumns:andRows:", v7, v8);
    if (v40 == 4 * v7 * v8)
      SKCTileMapNode::setRawTiles((SKCTileMapNode *)v6->_skcTileMapNode, v38, v7, v8);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
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
  _DWORD *RawTilesCopy;
  __int128 v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SKTileMapNode;
  -[SKNode encodeWithCoder:](&v20, sel_encodeWithCoder_, v4);
  v5 = -[SKTileMapNode numberOfColumns](self, "numberOfColumns");
  v6 = -[SKTileMapNode numberOfRows](self, "numberOfRows");
  objc_msgSend(v4, "encodeInteger:forKey:", v5, CFSTR("_currentColumns"));
  objc_msgSend(v4, "encodeInteger:forKey:", v6, CFSTR("_currentRows"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_tileWidth"), self->_tileSize.width);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_tileHeight"), self->_tileSize.height);
  -[SKTileMapNode tileSetName](self, "tileSetName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_tileSetName"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_tileSet, CFSTR("_tileSet"));
  v19 = *((_OWORD *)self->_skcTileMapNode + 19);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&v19, (_QWORD)v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_baseColorR"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&v19 + 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_baseColorG"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&v19 + 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_baseColorB"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&v19 + 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("_baseColorA"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SKTileMapNode colorBlendFactor](self, "colorBlendFactor");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("_colorMix"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[SKTileMapNode blendMode](self, "blendMode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("_blendMode"));

  -[SKTileMapNode shader](self, "shader");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("_shader"));

  objc_msgSend(v4, "encodeInt32:forKey:", -[SKTileMapNode lightingBitMask](self, "lightingBitMask"), CFSTR("_lightingBitMask"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_enableAutomapping, CFSTR("_enableAutomapping"));
  v16 = (void *)MEMORY[0x1E0CB3B18];
  -[SKTileMapNode anchorPoint](self, "anchorPoint");
  objc_msgSend(v16, "valueWithCGPoint:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("_anchorPoint"));

  RawTilesCopy = SKCTileMapNode::getRawTilesCopy((SKCTileMapNode *)self->_skcTileMapNode);
  objc_msgSend(v4, "encodeBytes:length:forKey:", RawTilesCopy, 4 * v5 * v6, CFSTR("_rawTiles"));
  if (RawTilesCopy)
    free(RawTilesCopy);

}

- (BOOL)isEqualToNode:(id)a3
{
  SKTileMapNode *v4;
  SKTileMapNode *v5;
  NSUInteger v6;
  NSUInteger v7;
  double width;
  NSString *tileSetName;
  void *v10;
  void *v11;
  BOOL v12;
  SKTileSet *tileSet;
  void *v14;
  void *v15;
  BOOL v16;
  float32x4_t v17;
  double v18;
  double v19;
  float v20;
  double v21;
  SKBlendMode v22;
  _BOOL4 v23;
  uint32_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  char v31;
  void *v33;
  void *v34;
  char v35;
  objc_super v36;

  v4 = (SKTileMapNode *)a3;
  if (v4 == self)
  {
    v31 = 1;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = 0;
    goto LABEL_30;
  }
  v5 = v4;
  v36.receiver = self;
  v36.super_class = (Class)SKTileMapNode;
  if (!-[SKNode isEqualToNode:](&v36, sel_isEqualToNode_, v5))
    goto LABEL_26;
  v6 = -[SKTileMapNode numberOfColumns](self, "numberOfColumns");
  if (v6 != -[SKTileMapNode numberOfColumns](v5, "numberOfColumns"))
    goto LABEL_26;
  v7 = -[SKTileMapNode numberOfRows](self, "numberOfRows");
  if (v7 != -[SKTileMapNode numberOfRows](v5, "numberOfRows"))
    goto LABEL_26;
  width = self->_tileSize.width;
  if (width != v5->_tileSize.width || width != v5->_tileSize.height)
    goto LABEL_26;
  tileSetName = self->_tileSetName;
  if (!tileSetName)
  {
    -[SKTileMapNode tileSetName](v5, "tileSetName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_12;
    tileSetName = self->_tileSetName;
  }
  -[SKTileMapNode tileSetName](v5, "tileSetName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NSString isEqualToString:](tileSetName, "isEqualToString:", v11);

  if (!v12)
    goto LABEL_26;
LABEL_12:
  tileSet = self->_tileSet;
  if (tileSet)
    goto LABEL_15;
  -[SKTileMapNode tileSet](v5, "tileSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    tileSet = self->_tileSet;
LABEL_15:
    -[SKTileMapNode tileSet](v5, "tileSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SKTileSet isEqualToNode:](tileSet, "isEqualToNode:", v15);

    if (!v16)
      goto LABEL_26;
  }
  v17 = vsubq_f32(*((float32x4_t *)self->_skcTileMapNode + 19), *((float32x4_t *)v5->_skcTileMapNode + 19));
  if ((v17.i32[0] & 0x60000000) != 0
    && (v17.i32[1] & 0x60000000) != 0
    && (v17.i32[2] & 0x60000000) != 0
    && (v17.i32[3] & 0x60000000) != 0)
  {
    -[SKTileMapNode colorBlendFactor](self, "colorBlendFactor");
    v19 = v18;
    -[SKTileMapNode colorBlendFactor](v5, "colorBlendFactor");
    v20 = v19;
    *(float *)&v21 = v21;
    if ((COERCE_UNSIGNED_INT(v20 - *(float *)&v21) & 0x60000000) != 0)
    {
      v22 = -[SKTileMapNode blendMode](self, "blendMode");
      if (v22 == -[SKTileMapNode blendMode](v5, "blendMode"))
      {
        v23 = -[SKTileMapNode enableAutomapping](self, "enableAutomapping");
        if (v23 == -[SKTileMapNode enableAutomapping](v5, "enableAutomapping"))
        {
          v24 = -[SKTileMapNode lightingBitMask](self, "lightingBitMask");
          if (v24 == -[SKTileMapNode lightingBitMask](v5, "lightingBitMask"))
          {
            -[SKTileMapNode anchorPoint](self, "anchorPoint");
            v26 = v25;
            v28 = v27;
            -[SKTileMapNode anchorPoint](v5, "anchorPoint");
            if (v26 != v30 || v28 != v29)
            {
              -[SKTileMapNode shader](self, "shader");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[SKTileMapNode shader](v5, "shader");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v33, "isEqualToShader:", v34);

              v31 = v35 ^ 1;
              goto LABEL_27;
            }
          }
        }
      }
    }
  }
LABEL_26:
  v31 = 0;
LABEL_27:

LABEL_30:
  return v31;
}

- (void)setRawTiles:(unsigned int *)a3 rows:(unint64_t)a4 columns:(unint64_t)a5
{
  SKCTileMapNode::setRawTiles((SKCTileMapNode *)self->_skcTileMapNode, a3, a5, a4);
}

- (id)copy
{
  return -[SKTileMapNode copyWithZone:](self, "copyWithZone:", MEMORY[0x1DF0CF2F0](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKCTileMapNode **v4;
  unsigned int *RawTilesCopy;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKTileMapNode;
  v4 = -[SKNode copyWithZone:](&v7, sel_copyWithZone_, a3);
  RawTilesCopy = SKCTileMapNode::getRawTilesCopy((SKCTileMapNode *)self->_skcTileMapNode);
  SKCTileMapNode::setRawTiles(v4[18], RawTilesCopy, -[SKTileMapNode numberOfColumns](self, "numberOfColumns"), -[SKTileMapNode numberOfRows](self, "numberOfRows"));
  if (RawTilesCopy)
    free(RawTilesCopy);
  return v4;
}

- (void)setStartData:(unint64_t)a3 rows:(unint64_t)a4 tileSize:(CGSize)a5 tileSet:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;

  height = a5.height;
  width = a5.width;
  v12 = a6;
  objc_storeStrong((id *)&self->_tileSet, a6);
  SKCTileMapNode::setTileSetType((uint64_t)self->_skcTileMapNode, (SKTileSetType)objc_msgSend(v12, "type"));
  self->_tileSize.width = width;
  self->_tileSize.height = height;
  self->_enableAutomapping = 1;
  -[SKNode setName:](self, "setName:", CFSTR("Default Tile Map"));
  -[SKTileMapNode setLightingBitMask:](self, "setLightingBitMask:", 0);
  -[SKTileMapNode calculateSize](self, "calculateSize");
  -[SKTileMapNode setColumns:andRows:](self, "setColumns:andRows:", a3, a4);

}

- (SKTileMapNode)init
{
  SKTileMapNode *v2;
  SKTileMapNode *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKTileMapNode;
  v2 = -[SKNode init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SKTileMapNode commonInit](v2, "commonInit");
    -[SKTileMapNode setStartData:rows:tileSize:tileSet:](v3, "setStartData:rows:tileSize:tileSet:", 0, 0, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }
  return v3;
}

- (SKTileMapNode)initWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize
{
  double height;
  double width;
  SKTileSet *v11;
  SKTileMapNode *v12;
  SKTileMapNode *v13;
  objc_super v15;

  height = tileSize.height;
  width = tileSize.width;
  v11 = tileSet;
  v15.receiver = self;
  v15.super_class = (Class)SKTileMapNode;
  v12 = -[SKNode init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[SKTileMapNode commonInit](v12, "commonInit");
    -[SKTileMapNode setStartData:rows:tileSize:tileSet:](v13, "setStartData:rows:tileSize:tileSet:", columns, rows, v11, width, height);
  }

  return v13;
}

- (SKTileMapNode)initWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize fillWithTileGroup:(SKTileGroup *)tileGroup
{
  double height;
  double width;
  SKTileSet *v13;
  SKTileGroup *v14;
  SKTileMapNode *v15;
  SKTileMapNode *v16;
  objc_super v18;

  height = tileSize.height;
  width = tileSize.width;
  v13 = tileSet;
  v14 = tileGroup;
  v18.receiver = self;
  v18.super_class = (Class)SKTileMapNode;
  v15 = -[SKNode init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[SKTileMapNode commonInit](v15, "commonInit");
    -[SKTileMapNode setStartData:rows:tileSize:tileSet:](v16, "setStartData:rows:tileSize:tileSet:", columns, rows, v13, width, height);
    -[SKTileMapNode fillWithTileGroup:](v16, "fillWithTileGroup:", v14);
  }

  return v16;
}

- (SKTileMapNode)initWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize tileGroupLayout:(NSArray *)tileGroupLayout
{
  double height;
  double width;
  SKTileSet *v13;
  NSArray *v14;
  SKTileMapNode *v15;
  SKTileMapNode *v16;
  uint64_t v17;
  unint64_t i;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  __int16 v26;
  SKTileSet *v28;
  objc_super v29;

  height = tileSize.height;
  width = tileSize.width;
  v13 = tileSet;
  v14 = tileGroupLayout;
  v29.receiver = self;
  v29.super_class = (Class)SKTileMapNode;
  v15 = -[SKNode init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    -[SKTileMapNode commonInit](v15, "commonInit");
    -[SKTileMapNode setStartData:rows:tileSize:tileSet:](v16, "setStartData:rows:tileSize:tileSet:", columns, rows, v13, width, height);
    v28 = v13;
    v17 = (rows * columns);
    if ((_DWORD)v17)
    {
      for (i = 0; i != v17; ++i)
      {
        if (-[NSArray count](v14, "count") <= i)
        {
          v26 = 0x7FFF;
        }
        else
        {
          -[SKTileMapNode tileSet](v16, "tileSet");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "tileGroups");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", i);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "indexOfObject:", v21);

          -[SKTileMapNode tileSet](v16, "tileSet");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "tileGroups");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "count");

          if (v22 >= v25)
            v26 = 0x7FFF;
          else
            v26 = v22;
        }
        SKCTileMapNode::setTile((SKCTileMapNode *)v16->_skcTileMapNode, i, ((v26 & 0x7FFF) << 16) | 0xFFFF);
      }
    }
    v13 = v28;
    -[SKTileMapNode rebuildTileSprites](v16, "rebuildTileSprites");
  }

  return v16;
}

+ (SKTileMapNode)tileMapNodeWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize
{
  double height;
  double width;
  SKTileSet *v10;
  void *v11;

  height = tileSize.height;
  width = tileSize.width;
  v10 = tileSet;
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTileSet:columns:rows:tileSize:", v10, columns, rows, width, height);

  return (SKTileMapNode *)v11;
}

+ (SKTileMapNode)tileMapNodeWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize fillWithTileGroup:(SKTileGroup *)tileGroup
{
  double height;
  double width;
  SKTileSet *v12;
  SKTileGroup *v13;
  void *v14;

  height = tileSize.height;
  width = tileSize.width;
  v12 = tileSet;
  v13 = tileGroup;
  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTileSet:columns:rows:tileSize:fillWithTileGroup:", v12, columns, rows, v13, width, height);

  return (SKTileMapNode *)v14;
}

+ (SKTileMapNode)tileMapNodeWithTileSet:(SKTileSet *)tileSet columns:(NSUInteger)columns rows:(NSUInteger)rows tileSize:(CGSize)tileSize tileGroupLayout:(NSArray *)tileGroupLayout
{
  double height;
  double width;
  SKTileSet *v12;
  NSArray *v13;
  void *v14;

  height = tileSize.height;
  width = tileSize.width;
  v12 = tileSet;
  v13 = tileGroupLayout;
  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTileSet:columns:rows:tileSize:tileGroupLayout:", v12, columns, rows, v13, width, height);

  return (SKTileMapNode *)v14;
}

- (void)dealloc
{
  objc_super v3;

  -[SKTileMapNode removeAllTiles](self, "removeAllTiles");
  v3.receiver = self;
  v3.super_class = (Class)SKTileMapNode;
  -[SKNode dealloc](&v3, sel_dealloc);
}

- (unsigned)getTileIDWithTileGroup:(id)a3 andTileDefinition:(id)a4
{
  id v6;
  id v7;
  SKTileSet *tileSet;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;

  v6 = a3;
  v7 = a4;
  tileSet = self->_tileSet;
  if (!tileSet)
  {
    v12 = 0xFFFF;
    LOWORD(v10) = 0x7FFF;
    goto LABEL_10;
  }
  if (v6)
  {
    -[SKTileSet tileGroups](tileSet, "tileGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObject:", v6);

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      LOWORD(v10) = 0x7FFF;
    if (v7)
      goto LABEL_6;
LABEL_9:
    v12 = 0xFFFF;
    goto LABEL_10;
  }
  LOWORD(v10) = 0x7FFF;
  if (!v7)
    goto LABEL_9;
LABEL_6:
  -[SKTileSet tileDefinitions](self->_tileSet, "tileDefinitions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v12) = objc_msgSend(v11, "indexOfObject:", v7);

  v12 = (unsigned __int16)v12;
LABEL_10:

  return v12 & 0x8000FFFF | ((v10 & 0x7FFF) << 16);
}

- (void)fillWithTileDefinition:(id)a3
{
  SKTileSet *tileSet;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t i;
  id v13;

  v13 = a3;
  if (v13
    && (tileSet = self->_tileSet) != 0
    && (-[SKTileSet tileDefinitions](tileSet, "tileDefinitions"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[SKTileSet tileDefinitions](self->_tileSet, "tileDefinitions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v13);

    -[SKTileSet tileDefinitions](self->_tileSet, "tileDefinitions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v7 >= v9)
      v10 = 0x7FFFFFFF;
    else
      v10 = (unsigned __int16)v7 | 0x7FFF0000;
  }
  else
  {
    v10 = 0x7FFFFFFF;
  }
  v11 = (*((_DWORD *)self->_skcTileMapNode + 152) * *((_DWORD *)self->_skcTileMapNode + 151));
  if ((_DWORD)v11)
  {
    for (i = 0; i != v11; ++i)
      SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, i, v10);
  }
  -[SKTileMapNode updateTileGroupsAtX:y:](self, "updateTileGroupsAtX:y:", 0, 0);

}

- (void)fillWithTileGroup:(SKTileGroup *)tileGroup
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unsigned int v12;
  _DWORD *skcTileMapNode;
  int v14;
  int v15;
  unsigned int i;
  unint64_t v17;
  unint64_t v18;
  SKTileGroup *v19;

  v19 = tileGroup;
  if (!v19)
    goto LABEL_7;
  -[SKTileMapNode tileSet](self, "tileSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  -[SKTileMapNode tileSet](self, "tileSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tileGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SKTileMapNode tileSet](self, "tileSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tileGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v19);

    -[SKTileSet tileGroups](self->_tileSet, "tileGroups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v9 >= v11)
      v12 = 0x7FFFFFFF;
    else
      v12 = ((v9 & 0x7FFF) << 16) | 0xFFFF;
  }
  else
  {
LABEL_7:
    v12 = 0x7FFFFFFF;
  }
  skcTileMapNode = self->_skcTileMapNode;
  v14 = skcTileMapNode[152];
  v15 = v14 * skcTileMapNode[151];
  if (v15)
  {
    for (i = 0; i != v15; ++i)
      SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, i, v12);
    skcTileMapNode = self->_skcTileMapNode;
    v14 = skcTileMapNode[152];
  }
  if (v14)
  {
    v17 = 0;
    do
    {
      if (skcTileMapNode[151])
      {
        v18 = 0;
        do
        {
          -[SKTileMapNode updateTileDefinitionWithoutAutomappingAtX:y:](self, "updateTileDefinitionWithoutAutomappingAtX:y:", v18++, v17);
          skcTileMapNode = self->_skcTileMapNode;
        }
        while (v18 < skcTileMapNode[151]);
      }
      ++v17;
    }
    while (v17 < skcTileMapNode[152]);
  }

}

- (SKTileDefinition)tileDefinitionAtColumn:(NSUInteger)column row:(NSUInteger)row
{
  int v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int16 RawTile;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = column;
  if (-[SKTileMapNode numberOfColumns](self, "numberOfColumns") <= column)
    goto LABEL_7;
  if (-[SKTileMapNode numberOfRows](self, "numberOfRows") <= row)
    goto LABEL_7;
  -[SKTileMapNode tileSet](self, "tileSet");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_7;
  v8 = (void *)v7;
  -[SKTileMapNode tileSet](self, "tileSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tileDefinitions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_7;
  RawTile = SKCTileMapNode::getRawTile((SKCTileMapNode *)self->_skcTileMapNode, v5 + *((_DWORD *)self->_skcTileMapNode + 151) * (int)row);
  -[SKTileMapNode tileSet](self, "tileSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tileDefinitions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14 > RawTile)
  {
    -[SKTileMapNode tileSet](self, "tileSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tileDefinitions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", RawTile);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    v17 = 0;
  }
  return (SKTileDefinition *)v17;
}

- (SKTileGroup)tileGroupAtColumn:(NSUInteger)column row:(NSUInteger)row
{
  int v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int RawTile;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = column;
  if (-[SKTileMapNode numberOfColumns](self, "numberOfColumns") <= column)
    goto LABEL_7;
  if (-[SKTileMapNode numberOfRows](self, "numberOfRows") <= row)
    goto LABEL_7;
  -[SKTileMapNode tileSet](self, "tileSet");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_7;
  v8 = (void *)v7;
  -[SKTileMapNode tileSet](self, "tileSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tileGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_7;
  RawTile = SKCTileMapNode::getRawTile((SKCTileMapNode *)self->_skcTileMapNode, v5 + *((_DWORD *)self->_skcTileMapNode + 151) * (int)row);
  -[SKTileMapNode tileSet](self, "tileSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tileGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  v15 = HIWORD(RawTile) & 0x7FFF;

  if (v14 > v15)
  {
    -[SKTileMapNode tileSet](self, "tileSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tileGroups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    v18 = 0;
  }
  return (SKTileGroup *)v18;
}

- (void)setTileGroup:(SKTileGroup *)tileGroup forColumn:(NSUInteger)column row:(NSUInteger)row
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SKTileGroup *v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unsigned int v18;
  SKTileGroup *v19;

  v19 = tileGroup;
  if (-[SKTileMapNode numberOfColumns](self, "numberOfColumns") > column
    && -[SKTileMapNode numberOfRows](self, "numberOfRows") > row)
  {
    if (!v19)
      goto LABEL_9;
    -[SKTileMapNode tileSet](self, "tileSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_9;
    -[SKTileMapNode tileSet](self, "tileSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tileGroups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SKTileMapNode tileSet](self, "tileSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v19;
      v13 = v11;
      objc_msgSend(v13, "tileGroups");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "indexOfObject:", v12);

      objc_msgSend(v13, "tileGroups");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v15 >= v17)
        v18 = 0x7FFFFFFF;
      else
        v18 = ((v15 & 0x7FFF) << 16) | 0xFFFF;
    }
    else
    {
LABEL_9:
      v18 = 0x7FFFFFFF;
    }
    SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, column + *((_DWORD *)self->_skcTileMapNode + 151) * row, v18);
    -[SKTileMapNode updateTileGroupsAtX:y:](self, "updateTileGroupsAtX:y:", column, row);
  }

}

- (void)setTileGroup:(SKTileGroup *)tileGroup andTileDefinition:(SKTileDefinition *)tileDefinition forColumn:(NSUInteger)column row:(NSUInteger)row
{
  SKTileDefinition *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SKTileGroup *v17;
  id v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  int v23;
  void *v24;
  SKTileDefinition *v25;
  id v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  int v31;
  SKTileGroup *v32;

  v32 = tileGroup;
  v10 = tileDefinition;
  if (-[SKTileMapNode numberOfColumns](self, "numberOfColumns") > column
    && -[SKTileMapNode numberOfRows](self, "numberOfRows") > row)
  {
    -[SKTileMapNode tileSet](self, "tileSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[SKTileMapNode tileSet](self, "tileSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tileGroups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[SKTileMapNode tileSet](self, "tileSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "tileDefinitions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          if (v32)
          {
            -[SKTileMapNode tileSet](self, "tileSet");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v32;
            v18 = v16;
            objc_msgSend(v18, "tileGroups");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "indexOfObject:", v17);

            objc_msgSend(v18, "tileGroups");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

            if (v20 >= v22)
              v23 = 2147418112;
            else
              v23 = (v20 & 0x7FFF) << 16;
          }
          else
          {
            v23 = 2147418112;
          }
          -[SKTileMapNode tileSet](self, "tileSet");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v10;
          v26 = v24;
          objc_msgSend(v26, "tileDefinitions");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "indexOfObject:", v25);

          objc_msgSend(v26, "tileDefinitions");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "count");

          v31 = (unsigned __int16)v28;
          if (v28 >= v30)
            v31 = 0xFFFF;
          SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, column + *((_DWORD *)self->_skcTileMapNode + 151) * row, v31 | v23);
          -[SKTileMapNode updateTileGroupsAtX:y:](self, "updateTileGroupsAtX:y:", column, row);
        }
      }
      else
      {

      }
    }
  }

}

- (void)setTileGroupWithoutUpdate:(id)a3 forColumn:(unint64_t)a4 row:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  int v18;
  unsigned int v19;
  id v20;

  v20 = a3;
  if (-[SKTileMapNode numberOfColumns](self, "numberOfColumns") > a4
    && -[SKTileMapNode numberOfRows](self, "numberOfRows") > a5)
  {
    -[SKTileMapNode tileSet](self, "tileSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[SKTileMapNode tileSet](self, "tileSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tileGroups");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[SKTileMapNode tileSet](self, "tileSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v20;
        v13 = v11;
        objc_msgSend(v13, "tileGroups");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "indexOfObject:", v12);

        objc_msgSend(v13, "tileGroups");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        v18 = -[SKTileMapNode numberOfColumns](self, "numberOfColumns");
        if (v15 >= v17)
          v19 = 0x7FFFFFFF;
        else
          v19 = ((v15 & 0x7FFF) << 16) | 0xFFFF;
        SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, a4 + v18 * a5, v19);
      }
    }
  }

}

- (void)setTileGroupWithoutUpdate:(id)a3 tileDefinition:(id)a4 forColumn:(unint64_t)a5 row:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  int v29;
  int v30;
  int v31;
  unint64_t v32;
  id v33;

  v33 = a3;
  v10 = a4;
  if (-[SKTileMapNode numberOfColumns](self, "numberOfColumns") > a5
    && -[SKTileMapNode numberOfRows](self, "numberOfRows") > a6)
  {
    -[SKTileMapNode tileSet](self, "tileSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[SKTileMapNode tileSet](self, "tileSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tileGroups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[SKTileMapNode tileSet](self, "tileSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "tileDefinitions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[SKTileMapNode tileSet](self, "tileSet");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v33;
          v18 = v16;
          objc_msgSend(v18, "tileGroups");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "indexOfObject:", v17);

          objc_msgSend(v18, "tileGroups");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v21, "count");

          -[SKTileMapNode tileSet](self, "tileSet");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v10;
          v24 = v22;
          objc_msgSend(v24, "tileDefinitions");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "indexOfObject:", v23);

          objc_msgSend(v24, "tileDefinitions");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "count");

          v29 = -[SKTileMapNode numberOfColumns](self, "numberOfColumns");
          v30 = (v20 & 0x7FFF) << 16;
          if (v20 >= v32)
            v30 = 2147418112;
          v31 = (unsigned __int16)v26;
          if (v26 >= v28)
            v31 = 0xFFFF;
          SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, a5 + v29 * a6, v31 | v30);
        }
      }
      else
      {

      }
    }
  }

}

- (void)setTileGroup:(id)a3 forTileIndicies:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unsigned int v18;
  NSUInteger v19;
  NSUInteger v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  unint64_t v33;
  NSUInteger v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_7;
  -[SKTileMapNode tileSet](self, "tileSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_7;
  -[SKTileMapNode tileSet](self, "tileSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tileGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SKTileMapNode tileSet](self, "tileSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    v13 = v11;
    objc_msgSend(v13, "tileGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "indexOfObject:", v12);

    objc_msgSend(v13, "tileGroups");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v15 >= v17)
      v18 = 0x7FFFFFFF;
    else
      v18 = ((v15 & 0x7FFF) << 16) | 0xFFFF;
  }
  else
  {
LABEL_7:
    v18 = 0x7FFFFFFF;
  }
  v19 = -[SKTileMapNode numberOfColumns](self, "numberOfColumns");
  v20 = -[SKTileMapNode numberOfRows](self, "numberOfRows");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v21 = v7;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  v23 = v20 * v19;
  if (v22)
  {
    v24 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v40 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (v26)
        {
          v27 = objc_msgSend(v26, "unsignedIntegerValue");
          if (v27 < v23)
            SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v27, v18);
        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v22);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = v21;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(v28);
        v32 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        if (v32)
        {
          v33 = objc_msgSend(v32, "unsignedIntegerValue", (_QWORD)v35);
          if (v33 < v23)
          {
            v34 = -[SKTileMapNode numberOfColumns](self, "numberOfColumns");
            -[SKTileMapNode updateTileGroupsAtX:y:](self, "updateTileGroupsAtX:y:", v33 % v34, v33 / v34 * v34 / -[SKTileMapNode numberOfRows](self, "numberOfRows"));
          }
        }
      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v29);
  }

}

- (void)setTileGroup:(id)a3 andTileDefinition:(id)a4 forTileIndicies:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  int v29;
  int v30;
  NSUInteger v31;
  NSUInteger v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  unint64_t v46;
  NSUInteger v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v8 = a4;
  v9 = a5;
  -[SKTileMapNode tileSet](self, "tileSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SKTileMapNode tileSet](self, "tileSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tileGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[SKTileMapNode tileSet](self, "tileSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "tileDefinitions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[SKTileMapNode tileSet](self, "tileSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v48;
        v17 = v15;
        objc_msgSend(v17, "tileGroups");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "indexOfObject:", v16);

        objc_msgSend(v17, "tileGroups");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        -[SKTileMapNode tileSet](self, "tileSet");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v8;
        v24 = v22;
        objc_msgSend(v24, "tileDefinitions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "indexOfObject:", v23);

        objc_msgSend(v24, "tileDefinitions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

        if (v26 >= v28)
          v29 = 0xFFFF;
        else
          v29 = (unsigned __int16)v26;
        if (v19 >= v21)
          v30 = 2147418112;
        else
          v30 = (v19 & 0x7FFF) << 16;
        v31 = -[SKTileMapNode numberOfColumns](self, "numberOfColumns");
        v32 = -[SKTileMapNode numberOfRows](self, "numberOfRows");
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v33 = v9;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        v35 = v32 * v31;
        if (v34)
        {
          v36 = v29 | v30;
          v37 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v54 != v37)
                objc_enumerationMutation(v33);
              v39 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              if (v39)
              {
                v40 = objc_msgSend(v39, "unsignedIntegerValue");
                if (v40 < v35)
                  SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v40, v36);
              }
            }
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
          }
          while (v34);
        }

        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v41 = v33;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        if (v42)
        {
          v43 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v42; ++j)
            {
              if (*(_QWORD *)v50 != v43)
                objc_enumerationMutation(v41);
              v45 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
              if (v45)
              {
                v46 = objc_msgSend(v45, "unsignedIntegerValue");
                if (v46 < v35)
                {
                  v47 = -[SKTileMapNode numberOfColumns](self, "numberOfColumns");
                  -[SKTileMapNode updateTileGroupsAtX:y:](self, "updateTileGroupsAtX:y:", v46 % v47, v46 / v47 * v47 / -[SKTileMapNode numberOfRows](self, "numberOfRows"));
                }
              }
            }
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          }
          while (v42);
        }

      }
    }
    else
    {

    }
  }

}

- (void)validateAllTiles
{
  unint64_t v3;
  unint64_t v4;

  if (-[SKTileMapNode numberOfRows](self, "numberOfRows"))
  {
    v3 = 0;
    do
    {
      if (-[SKTileMapNode numberOfColumns](self, "numberOfColumns"))
      {
        v4 = 0;
        do
          -[SKTileMapNode updateTileGroupsAtX:y:](self, "updateTileGroupsAtX:y:", v4++, v3);
        while (v4 < -[SKTileMapNode numberOfColumns](self, "numberOfColumns"));
      }
      ++v3;
    }
    while (v3 < -[SKTileMapNode numberOfRows](self, "numberOfRows"));
  }
}

- (void)fillArrayWithTiles:(unsigned int *)a3
{
  SKCTileMapNode::copyRawTilesIntoArray((SKCTileMapNode *)self->_skcTileMapNode, a3);
}

- (void)fillArray:(unsigned int *)a3 withTilesFromColumn:(unint64_t)a4 row:(unint64_t)a5 forWidth:(unint64_t)a6 height:(unint64_t)a7
{
  SKCTileMapNode::copyRawTilesIntoArray((SKCTileMapNode *)self->_skcTileMapNode, a3, a4, a5, a6, a7);
}

- (void)setTilesFromArray:(unsigned int *)a3
{
  SKCTileMapNode::copyRawTilesFromArray((SKCTileMapNode *)self->_skcTileMapNode, a3);
}

- (void)setTilesFromArray:(unsigned int *)a3 fromColumn:(unint64_t)a4 row:(unint64_t)a5 forWidth:(unint64_t)a6 height:(unint64_t)a7
{
  SKCTileMapNode::copyRawTilesFromArray((SKCTileMapNode *)self->_skcTileMapNode, a3, a4, a5, a6, a7);
}

- (void)clearModifiedTileTracking
{
  SKCTileMapNode::clearModifiedTileTracking((SKCTileMapNode *)self->_skcTileMapNode);
}

- (void)getTileModifiedData:(int64_t *)a3 outMinRowModified:(int64_t *)a4 outMaxColumnModified:(int64_t *)a5 outmaxRowModified:(int64_t *)a6
{
  int *skcTileMapNode;

  skcTileMapNode = (int *)self->_skcTileMapNode;
  *a3 = skcTileMapNode[156];
  *a4 = skcTileMapNode[157];
  *a5 = skcTileMapNode[158];
  *a6 = skcTileMapNode[159];
}

- (void)removeAllTiles
{
  SKCTileMapNode *skcTileMapNode;

  skcTileMapNode = (SKCTileMapNode *)self->_skcTileMapNode;
  if (skcTileMapNode && *((_DWORD *)skcTileMapNode + 151))
  {
    if (*((_DWORD *)skcTileMapNode + 152))
      SKCTileMapNode::setAllTiles(skcTileMapNode, 0x7FFFFFFFu);
  }
}

- (void)rebuildTileSprites
{
  _DWORD *skcTileMapNode;
  unint64_t v4;
  unint64_t v5;

  skcTileMapNode = self->_skcTileMapNode;
  if (skcTileMapNode[152])
  {
    v4 = 0;
    do
    {
      if (skcTileMapNode[151])
      {
        v5 = 0;
        do
        {
          -[SKTileMapNode updateTileGroupsAtX:y:](self, "updateTileGroupsAtX:y:", v5++, v4);
          skcTileMapNode = self->_skcTileMapNode;
        }
        while (v5 < skcTileMapNode[151]);
      }
      ++v4;
    }
    while (v4 < skcTileMapNode[152]);
  }
}

- (void)updateTileDefinitionWithoutAutomappingAtX:(unint64_t)a3 y:(unint64_t)a4
{
  SKCTileMapNode *skcTileMapNode;
  unsigned int v6;
  unsigned int RawTile;
  uint64_t v8;
  unsigned __int16 v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint32_t v28;
  id v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  void *j;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  skcTileMapNode = (SKCTileMapNode *)self->_skcTileMapNode;
  v6 = a3 + *((_DWORD *)skcTileMapNode + 151) * a4;
  RawTile = SKCTileMapNode::getRawTile(skcTileMapNode, v6);
  v8 = HIWORD(RawTile) & 0x7FFF;
  if ((_DWORD)v8 != 0x7FFF)
  {
    v9 = RawTile;
    -[SKTileSet tileGroups](self->_tileSet, "tileGroups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 > v8)
    {
      -[SKTileSet tileDefinitions](self->_tileSet, "tileDefinitions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v9 == 0xFFFF || v13 <= v9)
      {
        -[SKTileSet tileGroups](self->_tileSet, "tileGroups");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_35;
        objc_msgSend(v16, "rules");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_35;
        objc_msgSend(v16, "rules");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (!v19)
          goto LABEL_35;
        objc_msgSend(v16, "rules");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = v21;
        objc_msgSend(v21, "tileDefinitions");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "count") == 1)
        {
          objc_msgSend(v36, "firstObject");
          v22 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v36, "count"))
          {
            v30 = 0;
LABEL_34:
            SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v6, -[SKTileMapNode getTileIDWithTileGroup:andTileDefinition:](self, "getTileIDWithTileGroup:andTileDefinition:", v16, v30));

LABEL_35:
            return;
          }
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v23 = v36;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
          if (v24)
          {
            v25 = 0;
            v26 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v42 != v26)
                  objc_enumerationMutation(v23);
                v25 += objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "placementWeight");
              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
            }
            while (v24);

            if (v25)
            {
              v28 = arc4random_uniform(v25);
              v39 = 0u;
              v40 = 0u;
              v37 = 0u;
              v38 = 0u;
              v29 = v23;
              v30 = (id)objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v30)
              {
                v31 = v28;
                v32 = *(_QWORD *)v38;
                while (2)
                {
                  for (j = 0; j != v30; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v38 != v32)
                      objc_enumerationMutation(v29);
                    v34 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
                    if (v31 < objc_msgSend(v34, "placementWeight"))
                    {
                      v30 = v34;
                      goto LABEL_38;
                    }
                    v31 -= objc_msgSend(v34, "placementWeight");
                  }
                  v30 = (id)objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                  if (v30)
                    continue;
                  break;
                }
              }
LABEL_38:

              goto LABEL_34;
            }
          }
          else
          {

          }
          objc_msgSend(v23, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v23, "count")));
          v22 = objc_claimAutoreleasedReturnValue();
        }
        v30 = (id)v22;
        goto LABEL_34;
      }
    }
  }
}

- (void)updateTileGroupsAtX:(unint64_t)a3 y:(unint64_t)a4
{
  unint64_t v7;
  unsigned int RawTile;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *skcTileMapNode;
  unint64_t v13;
  SKTileSetType v14;
  BOOL v15;
  int *v16;
  int *v17;
  int *v18;
  int *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  int v31;
  int v32;
  _DWORD *v33;
  unsigned int v34;
  unsigned int v35;
  _QWORD *v36;
  _DWORD *v37;
  _QWORD *v38;
  _DWORD *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  uint32_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  id v54;
  uint64_t m;
  unsigned int v56;
  int v57;
  SKCTileMapNode *v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  int v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t n;
  uint32_t v71;
  id v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t ii;
  void *v76;
  void *v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t k;
  void *v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t jj;
  _QWORD *v87;
  id v88;
  int v89;
  unsigned int v90;
  SKCTileMapNode *v91;
  unsigned int v92;
  unsigned int v93;
  _QWORD *v94;
  _DWORD *v95;
  _QWORD *v96;
  _DWORD *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  void *v101;
  _BOOL4 v102;
  SKCTileMapNode *v103;
  void *v104;
  int v105;
  uint64_t v106;
  unint64_t v107;
  id v108;
  id obj;
  id obja;
  unsigned int v111[2];
  unint64_t v112;
  int v113;
  void *v114;
  unsigned int v115;
  unint64_t v116;
  uint64_t v117;
  int v118;
  unint64_t v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _QWORD v153[11];

  v153[8] = *MEMORY[0x1E0C80C00];
  if (!-[SKTileMapNode enableAutomapping](self, "enableAutomapping"))
  {
    -[SKTileMapNode updateTileDefinitionWithoutAutomappingAtX:y:](self, "updateTileDefinitionWithoutAutomappingAtX:y:", a3, a4);
    return;
  }
  v145 = 0u;
  v146 = 0u;
  v144 = 0u;
  v7 = a3 + *((unsigned int *)self->_skcTileMapNode + 151) * a4;
  LODWORD(v119) = v7;
  std::deque<unsigned int>::push_back(&v144, &v119);
  v112 = v7;
  RawTile = SKCTileMapNode::getRawTile((SKCTileMapNode *)self->_skcTileMapNode, v7);
  -[SKTileSet tileDefinitions](self->_tileSet, "tileDefinitions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "count");

  v10 = *((_QWORD *)&v146 + 1);
  if (!*((_QWORD *)&v146 + 1))
    goto LABEL_166;
  v113 = 0;
  v105 = HIWORD(RawTile) & 0x7FFF;
  do
  {
    v11 = *(unsigned int *)(*(_QWORD *)(*((_QWORD *)&v144 + 1) + (((unint64_t)v146 >> 7) & 0x1FFFFFFFFFFFFF8))
                          + 4 * (v146 & 0x3FF));
    *(_QWORD *)&v146 = v146 + 1;
    *((_QWORD *)&v146 + 1) = v10 - 1;
    if ((unint64_t)v146 >= 0x800)
    {
      operator delete(**((void ***)&v144 + 1));
      *((_QWORD *)&v144 + 1) += 8;
      *(_QWORD *)&v146 = v146 - 1024;
    }
    skcTileMapNode = (unsigned int *)self->_skcTileMapNode;
    v13 = skcTileMapNode[151];
    v115 = SKCTileMapNode::getRawTile((SKCTileMapNode *)skcTileMapNode, v11);
    v14 = -[SKTileSet type](self->_tileSet, "type");
    v117 = v11 % v13;
    v116 = (v11 - v117) / v13;
    *(_QWORD *)v111 = v11;
    if (v14 >= SKTileSetTypeHexagonalFlat)
    {
      if (v14 == SKTileSetTypeHexagonalPointy)
      {
        v15 = (((v11 - v117) / v13) & 1) == 0;
        if ((v116 & 1) != 0)
          v16 = (int *)&kHexPointyOddRowXOffsets;
        else
          v16 = (int *)&kHexPointyEvenRowXOffsets;
        v17 = (int *)&kHexPointyOddRowYOffsets;
        v18 = (int *)&kHexPointyEvenRowYOffsets;
        goto LABEL_18;
      }
      if (v14 == SKTileSetTypeHexagonalFlat)
      {
        v15 = (v117 & 1) == 0;
        if ((v117 & 1) != 0)
          v16 = (int *)&kHexFlatOddColumnXOffsets;
        else
          v16 = (int *)&kHexFlatEvenColumnXOffsets;
        v17 = (int *)&kHexFlatOddColumnYOffsets;
        v18 = (int *)&kHexFlatEvenColumnYOffsets;
LABEL_18:
        if (v15)
          v19 = v18;
        else
          v19 = v17;
        v20 = 6;
        goto LABEL_22;
      }
    }
    v19 = &kYOffsets;
    v16 = &kXOffsets;
    v20 = 8;
LABEL_22:
    v107 = HIWORD(v115) & 0x7FFF;
    if ((_DWORD)v107 == 0x7FFF)
      goto LABEL_29;
    -[SKTileSet tileGroups](self->_tileSet, "tileGroups");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count") > v107;

    if (!v22)
    {
      SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v111[0], 0x7FFFFFFFu);
LABEL_29:
      if (v112 != *(_QWORD *)v111)
        goto LABEL_155;
      do
      {
LABEL_30:
        v29 = *v16;
        v16 += 2;
        v30 = v117 + v29;
        v32 = *v19;
        v19 += 2;
        v31 = v32;
        v33 = self->_skcTileMapNode;
        v34 = v33[151];
        if (v30 < v34)
        {
          v35 = v31 + v116;
          if (v33[152] > v35)
          {
            v119 = v30 + v34 * v35;
            v36 = (_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * ((unint64_t)v146 >> 10));
            if ((_QWORD)v145 == *((_QWORD *)&v144 + 1))
            {
              v37 = 0;
              v39 = 0;
              v38 = (_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * ((*((_QWORD *)&v146 + 1) + (_QWORD)v146) >> 10));
            }
            else
            {
              v37 = (_DWORD *)(*v36 + 4 * (v146 & 0x3FF));
              v38 = (_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * ((*((_QWORD *)&v146 + 1) + (_QWORD)v146) >> 10));
              v39 = (_DWORD *)(*v38 + 4 * ((*((_QWORD *)&v146 + 1) + v146) & 0x3FF));
            }
            std::__find_segment_if[abi:ne180100]<std::__deque_iterator<unsigned int,unsigned int *,unsigned int &,unsigned int **,long,1024l>,std::__find_segment<unsigned long>,std::__identity>(v36, v37, v38, v39, &v119);
            if ((_QWORD)v145 == *((_QWORD *)&v144 + 1))
              v41 = 0;
            else
              v41 = *(_QWORD *)(*((_QWORD *)&v144 + 1)
                              + (((*((_QWORD *)&v146 + 1) + (_QWORD)v146) >> 7) & 0x1FFFFFFFFFFFFF8))
                  + 4 * ((*((_QWORD *)&v146 + 1) + v146) & 0x3FF);
            if (v41 == v40)
            {
              v42 = v119;
              if ((v113 & (v119 == v112)) != 0)
              {
                v113 = 1;
              }
              else
              {
                v118 = v119;
                std::deque<unsigned int>::push_back(&v144, &v118);
                v113 |= v42 == v112;
              }
            }
          }
        }
        --v20;
      }
      while (v20);
      goto LABEL_155;
    }
    -[SKTileSet tileGroups](self->_tileSet, "tileGroups");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", v107);
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v114, "type") == 1
      || (objc_msgSend(v114, "rules"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "count") == 1,
          v24,
          v25))
    {
      objc_msgSend(v114, "rules");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "tileDefinitions");
      v108 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v108, "count") == 1)
      {
        objc_msgSend(v108, "firstObject");
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_100;
      }
      if (!objc_msgSend(v108, "count"))
      {
        v54 = 0;
        goto LABEL_154;
      }
      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v43 = v108;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v140, v152, 16);
      if (v44)
      {
        v45 = 0;
        v46 = *(_QWORD *)v141;
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v141 != v46)
              objc_enumerationMutation(v43);
            v45 += objc_msgSend(*(id *)(*((_QWORD *)&v140 + 1) + 8 * i), "placementWeight");
          }
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v140, v152, 16);
        }
        while (v44);

        if (v45)
        {
          v48 = arc4random_uniform(v45);
          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          obj = v43;
          v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
          if (v49)
          {
            v50 = v48;
            v51 = *(_QWORD *)v137;
            while (2)
            {
              for (j = 0; j != v49; ++j)
              {
                if (*(_QWORD *)v137 != v51)
                  objc_enumerationMutation(obj);
                v53 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * j);
                if (v50 < objc_msgSend(v53, "placementWeight"))
                {
                  v54 = v53;
                  goto LABEL_116;
                }
                v50 -= objc_msgSend(v53, "placementWeight");
              }
              v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
              if (v49)
                continue;
              break;
            }
          }
          v54 = 0;
LABEL_116:

          goto LABEL_101;
        }
      }
      else
      {

      }
      objc_msgSend(v43, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v43, "count")));
      v28 = objc_claimAutoreleasedReturnValue();
LABEL_100:
      v54 = (id)v28;
LABEL_101:
      if (!v54)
        goto LABEL_154;
      v78 = -[SKTileMapNode getTileIDWithTileGroup:andTileDefinition:](self, "getTileIDWithTileGroup:andTileDefinition:", v114, v54);
      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      obja = v108;
      v79 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
      if (v79)
      {
        v80 = *(_QWORD *)v133;
        while (2)
        {
          for (k = 0; k != v79; ++k)
          {
            if (*(_QWORD *)v133 != v80)
              objc_enumerationMutation(obja);
            if (*(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * k)
              && v115 == -[SKTileMapNode getTileIDWithTileGroup:andTileDefinition:](self, "getTileIDWithTileGroup:andTileDefinition:", v114))
            {
              v82 = obja;
              goto LABEL_153;
            }
          }
          v79 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
          if (v79)
            continue;
          break;
        }
      }

      if (v78 != v115)
      {
        SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v111[0], v78);
        goto LABEL_162;
      }
LABEL_112:
      v108 = obja;
      goto LABEL_154;
    }
    for (m = 0; m != v20; ++m)
    {
      v56 = v19[2 * m] + v116;
      v57 = v117 + v16[2 * m];
      if (v57 >= 0)
      {
        v58 = (SKCTileMapNode *)self->_skcTileMapNode;
        v59 = *((_DWORD *)v58 + 151);
        if (v57 < v59)
        {
          if ((v56 & 0x80000000) != 0)
          {
            v62 = v59 + v59 * v56 + v57;
          }
          else
          {
            v60 = v57 + v59 * v56;
            v61 = v57 + v59 * (v56 - 1);
            if (*((_DWORD *)v58 + 152) <= v56)
              v62 = v61;
            else
              v62 = v60;
          }
LABEL_75:
          v63 = SKCTileMapNode::getRawTile(v58, v62);
          goto LABEL_76;
        }
      }
      v63 = v115;
      if ((v56 & 0x80000000) == 0)
      {
        v58 = (SKCTileMapNode *)self->_skcTileMapNode;
        v63 = v115;
        if (*((_DWORD *)v58 + 152) > v56)
        {
          v64 = v57 + *((_DWORD *)v58 + 151) * v56;
          if (v57 < 0)
            v62 = v64 + 1;
          else
            v62 = v64 - 1;
          goto LABEL_75;
        }
      }
LABEL_76:
      v153[m] = HIWORD(v63) & 0x7FFF;
    }
    -[SKTileSet findTileDefinitionsForGroup:withGroupAdjacency:](self->_tileSet, "findTileDefinitionsForGroup:withGroupAdjacency:", v114, v153);
    obja = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(obja, "count") == 1)
    {
      objc_msgSend(obja, "firstObject");
      v65 = objc_claimAutoreleasedReturnValue();
      goto LABEL_119;
    }
    if (!objc_msgSend(obja, "count"))
      goto LABEL_133;
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v66 = obja;
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v128, v149, 16);
    if (v67)
    {
      v68 = 0;
      v69 = *(_QWORD *)v129;
      do
      {
        for (n = 0; n != v67; ++n)
        {
          if (*(_QWORD *)v129 != v69)
            objc_enumerationMutation(v66);
          v68 += objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * n), "placementWeight");
        }
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v128, v149, 16);
      }
      while (v67);

      if (v68)
      {
        v71 = arc4random_uniform(v68);
        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v72 = v66;
        v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v124, v148, 16);
        if (v73)
        {
          v74 = v71;
          v106 = *(_QWORD *)v125;
          while (2)
          {
            for (ii = 0; ii != v73; ++ii)
            {
              if (*(_QWORD *)v125 != v106)
                objc_enumerationMutation(v72);
              v76 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * ii);
              if (v74 < objc_msgSend(v76, "placementWeight"))
              {
                v77 = v72;
                v54 = v76;
                goto LABEL_164;
              }
              v74 -= objc_msgSend(v76, "placementWeight");
            }
            v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v124, v148, 16);
            if (v73)
              continue;
            break;
          }
        }
        v77 = v72;
        v54 = 0;
LABEL_164:

        goto LABEL_120;
      }
    }
    else
    {

    }
    objc_msgSend(v66, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v66, "count")));
    v65 = objc_claimAutoreleasedReturnValue();
LABEL_119:
    v54 = (id)v65;
LABEL_120:
    if (!v54)
    {
LABEL_133:
      if ((_DWORD)v107 != v105 || v112 != *(_QWORD *)v111)
      {
        if (!v114
          || (-[SKTileSet defaultTileGroup](self->_tileSet, "defaultTileGroup"),
              v101 = (void *)objc_claimAutoreleasedReturnValue(),
              v102 = v114 == v101,
              v101,
              v102))
        {
          SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v111[0], -[SKTileMapNode getTileIDWithTileGroup:andTileDefinition:](self, "getTileIDWithTileGroup:andTileDefinition:", 0, 0));
        }
        else
        {
          v103 = (SKCTileMapNode *)self->_skcTileMapNode;
          -[SKTileSet defaultTileGroup](self->_tileSet, "defaultTileGroup");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          SKCTileMapNode::setTile(v103, v111[0], -[SKTileMapNode getTileIDWithTileGroup:andTileDefinition:](self, "getTileIDWithTileGroup:andTileDefinition:", v104, 0));

        }
        v54 = 0;
LABEL_162:

        goto LABEL_30;
      }
      -[SKTileSet getCenterTileDefinitionForGroup:withRequiredOutputGroupAdjacency:](self->_tileSet, "getCenterTileDefinitionForGroup:withRequiredOutputGroupAdjacency:", v114, v153);
      v54 = (id)objc_claimAutoreleasedReturnValue();
      v87 = v153;
      v88 = v54;
      do
      {
        v89 = *(unsigned __int16 *)v87;
        if (v89 != 0x7FFF)
        {
          v90 = v117 + *v16;
          v91 = (SKCTileMapNode *)self->_skcTileMapNode;
          v92 = *((_DWORD *)v91 + 151);
          if (v90 >= v92 || (v93 = *v19 + v116, *((_DWORD *)v91 + 152) <= v93))
          {
            *v87 = 0x7FFFLL;
          }
          else
          {
            v119 = v90 + v92 * v93;
            SKCTileMapNode::setTile(v91, v90 + v92 * v93, (v89 << 16) | 0xFFFF);
            v94 = (_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * ((unint64_t)v146 >> 10));
            if ((_QWORD)v145 == *((_QWORD *)&v144 + 1))
            {
              v95 = 0;
              v97 = 0;
              v96 = (_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * ((*((_QWORD *)&v146 + 1) + (_QWORD)v146) >> 10));
            }
            else
            {
              v95 = (_DWORD *)(*v94 + 4 * (v146 & 0x3FF));
              v96 = (_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * ((*((_QWORD *)&v146 + 1) + (_QWORD)v146) >> 10));
              v97 = (_DWORD *)(*v96 + 4 * ((*((_QWORD *)&v146 + 1) + v146) & 0x3FF));
            }
            std::__find_segment_if[abi:ne180100]<std::__deque_iterator<unsigned int,unsigned int *,unsigned int &,unsigned int **,long,1024l>,std::__find_segment<unsigned long>,std::__identity>(v94, v95, v96, v97, &v119);
            if ((_QWORD)v145 == *((_QWORD *)&v144 + 1))
              v99 = 0;
            else
              v99 = *(_QWORD *)(*((_QWORD *)&v144 + 1)
                              + (((*((_QWORD *)&v146 + 1) + (_QWORD)v146) >> 7) & 0x1FFFFFFFFFFFFF8))
                  + 4 * ((*((_QWORD *)&v146 + 1) + v146) & 0x3FF);
            if (v99 == v98)
            {
              v100 = v119;
              if ((v113 & (v119 == v112)) != 0)
              {
                v113 = 1;
              }
              else
              {
                v118 = v119;
                std::deque<unsigned int>::push_back(&v144, &v118);
                v113 |= v100 == v112;
              }
              v54 = v88;
            }
          }
        }
        ++v87;
        v16 += 2;
        v19 += 2;
        --v20;
      }
      while (v20);
      goto LABEL_112;
    }
    v83 = -[SKTileMapNode getTileIDWithTileGroup:andTileDefinition:](self, "getTileIDWithTileGroup:andTileDefinition:", v114, v54);
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v108 = obja;
    v84 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v120, v147, 16);
    if (v84)
    {
      v85 = *(_QWORD *)v121;
      while (2)
      {
        for (jj = 0; jj != v84; ++jj)
        {
          if (*(_QWORD *)v121 != v85)
            objc_enumerationMutation(v108);
          if (*(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * jj)
            && v115 == -[SKTileMapNode getTileIDWithTileGroup:andTileDefinition:](self, "getTileIDWithTileGroup:andTileDefinition:", v114))
          {
            v82 = v108;
LABEL_153:
            v108 = v82;

            goto LABEL_154;
          }
        }
        v84 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v120, v147, 16);
        if (v84)
          continue;
        break;
      }
    }

    if (v83 != v115)
    {
      SKCTileMapNode::setTile((SKCTileMapNode *)self->_skcTileMapNode, v111[0], v83);
      goto LABEL_162;
    }
LABEL_154:

LABEL_155:
    v10 = *((_QWORD *)&v146 + 1);
  }
  while (*((_QWORD *)&v146 + 1));
LABEL_166:
  std::deque<unsigned int>::~deque[abi:ne180100](&v144);
}

- (void)setColumns:(unint64_t)a3 andRows:(int64_t)a4
{
  _DWORD *RawTilesCopy;
  char *v8;
  _BOOL4 v9;
  unsigned int *skcTileMapNode;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BOOL4 v14;
  char *v15;
  unint64_t v16;
  int v17;
  int v18;
  _BOOL4 v19;
  unint64_t v20;
  int v21;
  _BOOL4 v22;
  int v23;

  RawTilesCopy = SKCTileMapNode::getRawTilesCopy((SKCTileMapNode *)self->_skcTileMapNode);
  v8 = 0;
  v9 = a4 > 0;
  if (a3 && a4 >= 1)
  {
    v8 = (char *)malloc_type_malloc(4 * a3 * a4, 0xBDB0CCBFuLL);
    memset(v8, 255, 4 * a3 * a4);
  }
  skcTileMapNode = (unsigned int *)self->_skcTileMapNode;
  v11 = skcTileMapNode[151];
  if ((_DWORD)v11)
  {
    v12 = skcTileMapNode[152];
    if ((_DWORD)v12)
    {
      v13 = 0;
      v14 = 1;
      v15 = v8;
      v16 = skcTileMapNode[151];
      v17 = 1;
      v18 = 1;
      do
      {
        v18 &= v14;
        v17 &= v9;
        v19 = v16 != 0;
        if (v16 | a3)
        {
          v20 = 0;
          v21 = 1;
          v22 = a3 != 0;
          v23 = 1;
          while (1)
          {
            v23 &= v19;
            v21 &= v22;
            if ((v23 & v18 & v21 & v17 & 1) != 0)
            {
              *(_DWORD *)&v15[4 * v20] = RawTilesCopy[v20 + v13 * v16];
              v11 = skcTileMapNode[151];
            }
            v22 = ++v20 < a3;
            v16 = v11;
            v19 = v20 < v11;
            if (v20 >= v11)
            {
              v16 = v11;
              if (v20 >= a3)
                break;
            }
          }
          v12 = skcTileMapNode[152];
          v16 = v11;
        }
        else
        {
          v16 = 0;
        }
        v9 = (uint64_t)++v13 < a4;
        v15 += 4 * a3;
        v14 = v13 < v12;
      }
      while (v13 < v12 || (uint64_t)v13 < a4);
    }
  }
  SKCTileMapNode::setRawTiles((SKCTileMapNode *)skcTileMapNode, (const unsigned int *)v8, a3, a4);
  free(v8);
  if (RawTilesCopy)
    free(RawTilesCopy);
  -[SKTileMapNode calculateSize](self, "calculateSize");
}

- (void)calculateSize
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  double v10;
  double v11;
  NSUInteger v12;
  double v13;
  double v14;
  unsigned int v15;
  double v16;
  double v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float *p_isoColumnWidth;
  float *p_isoRowHeight;
  float32x2_t v24;
  float32x2_t v25;
  void *skcTileMapNode;
  double v27;
  double v28;
  double v29;
  double v30;
  unsigned int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  float width;
  float v36;
  float v37;
  float v38;
  float height;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  unsigned int v51;
  unsigned int v52;
  float v53;
  float v54;
  __int128 v55;

  -[SKTileMapNode tileSet](self, "tileSet");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[SKTileMapNode tileSet](self, "tileSet"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "type"),
        v5,
        v4,
        !v6))
  {
    skcTileMapNode = self->_skcTileMapNode;
    v27 = (double)-[SKTileMapNode numberOfColumns](self, "numberOfColumns");
    -[SKTileMapNode tileSize](self, "tileSize");
    *(float *)&v28 = v28 * v27;
    v52 = LODWORD(v28);
    v29 = (double)-[SKTileMapNode numberOfRows](self, "numberOfRows");
    -[SKTileMapNode tileSize](self, "tileSize");
    *(float *)&v31 = v30 * v29;
    v55 = __PAIR64__(v31, v52);
    v32 = skcTileMapNode;
LABEL_6:
    SKCNode::setSize((uint64_t)v32, &v55);
    return;
  }
  -[SKTileMapNode tileSet](self, "tileSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  if (v8 == 1)
  {
    v9 = -[SKTileMapNode numberOfColumns](self, "numberOfColumns");
    v10 = (double)(-[SKTileMapNode numberOfRows](self, "numberOfRows") + v9);
    -[SKTileMapNode tileSize](self, "tileSize");
    *(float *)&v11 = v11 * v10 * 0.5;
    v51 = LODWORD(v11);
    v12 = -[SKTileMapNode numberOfColumns](self, "numberOfColumns");
    v13 = (double)(-[SKTileMapNode numberOfRows](self, "numberOfRows") + v12);
    -[SKTileMapNode tileSize](self, "tileSize");
    *(float *)&v15 = v14 * v13 * 0.5;
    v55 = __PAIR64__(v15, v51);
    SKCNode::setSize((uint64_t)self->_skcTileMapNode, &v55);
    -[SKTileMapNode tileSize](self, "tileSize");
    *(float *)&v10 = v16;
    -[SKTileMapNode tileSize](self, "tileSize");
    *(float *)&v13 = v17;
    self->_isoHeightScalar = *(float *)&v10 / *(float *)&v13;
    v18 = -[SKTileMapNode numberOfColumns](self, "numberOfColumns");
    LODWORD(v19) = 0;
    *((float *)&v19 + 1) = self->_isoHeightScalar * (float)((float)(*(float *)&v13 * 0.5) * (float)v18);
    *(_QWORD *)self->_isoOrigin = v19;
    *(float *)&v20 = *(float *)&v10 * 0.5;
    *(float *)&v21 = *(float *)&v10 * 0.5;
    *((float *)&v21 + 1) = (float)(*(float *)&v13 * -0.5) * self->_isoHeightScalar;
    *(_QWORD *)self->_isoColumnVector = v21;
    *((float *)&v20 + 1) = (float)(*(float *)&v13 * 0.5) * self->_isoHeightScalar;
    *(_QWORD *)self->_isoRowVector = v20;
    p_isoColumnWidth = &self->_isoColumnWidth;
    self->_isoColumnWidth = sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)self->_isoColumnVector, *(float32x2_t *)self->_isoColumnVector)));
    p_isoRowHeight = &self->_isoRowHeight;
    self->_isoRowHeight = sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)self->_isoRowVector, *(float32x2_t *)self->_isoRowVector)));
    v24 = vld1_dup_f32(p_isoColumnWidth);
    *(float32x2_t *)self->_isoColumnVector = vdiv_f32(*(float32x2_t *)self->_isoColumnVector, v24);
    v25 = vld1_dup_f32(p_isoRowHeight);
    *(float32x2_t *)self->_isoRowVector = vdiv_f32(*(float32x2_t *)self->_isoRowVector, v25);
    return;
  }
  -[SKTileMapNode tileSet](self, "tileSet");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "type");

  if (v34 == 2)
  {
    width = self->_tileSize.width;
    v36 = width * 0.5;
    self->_hexRadius = v36;
    self->_tileSize.height = (float)(v36 * 1.7321);
    v37 = floorf((float)-[SKTileMapNode numberOfColumns](self, "numberOfColumns") * 0.5);
    v38 = self->_tileSize.width;
    v53 = (float)(self->_hexRadius * (float)(v37 + -1.0)) + (float)(v38 * v37);
    if ((-[SKTileMapNode numberOfColumns](self, "numberOfColumns") & 1) == 0)
      v53 = v53 + (float)(self->_hexRadius * 1.5);
    height = self->_tileSize.height;
    v40 = -[SKTileMapNode numberOfRows](self, "numberOfRows");
    *(float *)&v41 = v53;
    *((float *)&v41 + 1) = (float)((float)v40 + 0.5) * height;
    v55 = v41;
LABEL_17:
    v32 = self->_skcTileMapNode;
    goto LABEL_6;
  }
  -[SKTileMapNode tileSet](self, "tileSet");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "type");

  if (v43 == 3)
  {
    v44 = self->_tileSize.height;
    v45 = v44 * 0.5;
    self->_hexRadius = v45;
    self->_tileSize.width = (float)(v45 * 1.7321);
    v46 = floorf((float)-[SKTileMapNode numberOfRows](self, "numberOfRows") * 0.5);
    v47 = self->_tileSize.width;
    v54 = (float)((float)-[SKTileMapNode numberOfColumns](self, "numberOfColumns") + 0.5) * v47;
    v48 = self->_tileSize.height;
    v50 = (float)(self->_hexRadius * (float)(v46 + -1.0)) + (float)(v48 * v46);
    if ((-[SKTileMapNode numberOfRows](self, "numberOfRows") & 1) != 0)
      v49 = v50;
    else
      v49 = v50 + (float)(self->_hexRadius * 1.5);
    v55 = __PAIR64__(LODWORD(v49), LODWORD(v54));
    goto LABEL_17;
  }
}

- (NSUInteger)tileColumnIndexFromPosition:(CGPoint)position
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  float v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  float64x2_t v21;
  float32x2_t v22;
  double v23;
  float64x2_t v24;
  float64_t v25;
  float hexRadius;
  float height;
  int *v28;
  int *v29;
  void *v30;
  uint64_t v31;
  float64x2_t v32;
  float32x2_t v33;
  double v34;
  float64x2_t v35;
  double y;
  double x;
  float v38;
  float64_t v39;
  float64_t v40;
  __int128 v41;
  _BYTE v42[4];
  int v43;
  float32x2_t v44;

  y = position.y;
  x = position.x;
  v41 = *((_OWORD *)self->_skcTileMapNode + 21);
  -[SKTileMapNode tileSet](self, "tileSet");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[SKTileMapNode tileSet](self, "tileSet"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "type"),
        v6,
        v5,
        !v7))
  {
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    v17 = x + v16 * *(float *)&v41;
    -[SKTileMapNode tileSize](self, "tileSize");
    return vcvtmd_u64_f64(v17 / v18);
  }
  -[SKTileMapNode tileSet](self, "tileSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (v9 == 1)
  {
    v10 = x;
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    *(float *)&v11 = v11 * *(float *)&v41;
    v38 = v10 + *(float *)&v11;
    v12 = y;
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    v14 = v13 * *((float *)&v41 + 1);
    *(float *)&v13 = v38;
    *((float *)&v13 + 1) = self->_isoHeightScalar * (float)(v12 + v14);
    return vcvtms_u32_f32(vaddv_f32(vmul_f32(*(float32x2_t *)self->_isoColumnVector, vsub_f32(*(float32x2_t *)&v13, *(float32x2_t *)self->_isoOrigin)))/ self->_isoColumnWidth);
  }
  -[SKTileMapNode tileSet](self, "tileSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "type");

  if (v20 == 2)
  {
    v21.f64[0] = x;
    v21.f64[1] = y;
    v22 = vcvt_f32_f64(v21);
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    v39 = v23;
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    v24.f64[0] = v39;
    v24.f64[1] = v25;
    v44 = vadd_f32(v22, vcvt_f32_f64(vmulq_f64(v24, vcvtq_f64_f32(*(float32x2_t *)&v41))));
    hexRadius = self->_hexRadius;
    v43 = -1;
    height = self->_tileSize.height;
    v28 = &v43;
    v29 = (int *)v42;
LABEL_10:
    getHexIndexFromPoint(&v44, v28, v29, hexRadius, height);
    return v43;
  }
  -[SKTileMapNode tileSet](self, "tileSet");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "type");

  if (v31 == 3)
  {
    v32.f64[0] = y;
    v32.f64[1] = x;
    v33 = vcvt_f32_f64(v32);
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    v40 = v34;
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    v35.f64[1] = v40;
    v44 = vadd_f32(v33, vcvt_f32_f64(vmulq_f64(v35, vcvtq_f64_f32((float32x2_t)vrev64_s32(*(int32x2_t *)&v41)))));
    hexRadius = self->_hexRadius;
    v43 = -1;
    height = self->_tileSize.width;
    v28 = (int *)v42;
    v29 = &v43;
    goto LABEL_10;
  }
  return -1;
}

- (NSUInteger)tileRowIndexFromPosition:(CGPoint)position
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  float v10;
  double v11;
  float v12;
  double v13;
  float v14;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  float64x2_t v21;
  float32x2_t v22;
  double v23;
  float64x2_t v24;
  float64_t v25;
  float hexRadius;
  float height;
  int *v28;
  int *v29;
  void *v30;
  uint64_t v31;
  float64x2_t v32;
  float32x2_t v33;
  double v34;
  float64x2_t v35;
  double x;
  float v37;
  double y;
  float64_t v39;
  float64_t v40;
  __int128 v41;
  int v42;
  _BYTE v43[4];
  float32x2_t v44;

  x = position.x;
  y = position.y;
  v41 = *((_OWORD *)self->_skcTileMapNode + 21);
  -[SKTileMapNode tileSet](self, "tileSet");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[SKTileMapNode tileSet](self, "tileSet"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "type"),
        v6,
        v5,
        !v7))
  {
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    v17 = y + v16 * *((float *)&v41 + 1);
    -[SKTileMapNode tileSize](self, "tileSize");
    return vcvtmd_u64_f64(v17 / v18);
  }
  -[SKTileMapNode tileSet](self, "tileSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (v9 == 1)
  {
    v10 = x;
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    *(float *)&v11 = v11 * *(float *)&v41;
    v37 = v10 + *(float *)&v11;
    v12 = y;
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    v14 = v13 * *((float *)&v41 + 1);
    *(float *)&v13 = v37;
    *((float *)&v13 + 1) = self->_isoHeightScalar * (float)(v12 + v14);
    return vcvtms_u32_f32(vaddv_f32(vmul_f32(*(float32x2_t *)self->_isoRowVector, vsub_f32(*(float32x2_t *)&v13, *(float32x2_t *)self->_isoOrigin)))/ self->_isoRowHeight);
  }
  -[SKTileMapNode tileSet](self, "tileSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "type");

  if (v20 == 2)
  {
    v21.f64[0] = x;
    v21.f64[1] = y;
    v22 = vcvt_f32_f64(v21);
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    v39 = v23;
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    v24.f64[0] = v39;
    v24.f64[1] = v25;
    v44 = vadd_f32(v22, vcvt_f32_f64(vmulq_f64(v24, vcvtq_f64_f32(*(float32x2_t *)&v41))));
    hexRadius = self->_hexRadius;
    v42 = -1;
    height = self->_tileSize.height;
    v28 = (int *)v43;
    v29 = &v42;
LABEL_10:
    getHexIndexFromPoint(&v44, v28, v29, hexRadius, height);
    return v42;
  }
  -[SKTileMapNode tileSet](self, "tileSet");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "type");

  if (v31 == 3)
  {
    v32.f64[0] = y;
    v32.f64[1] = x;
    v33 = vcvt_f32_f64(v32);
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    v40 = v34;
    -[SKTileMapNode anchorPoint](self, "anchorPoint");
    v35.f64[1] = v40;
    v44 = vadd_f32(v33, vcvt_f32_f64(vmulq_f64(v35, vcvtq_f64_f32((float32x2_t)vrev64_s32(*(int32x2_t *)&v41)))));
    hexRadius = self->_hexRadius;
    v42 = -1;
    height = self->_tileSize.width;
    v28 = &v42;
    v29 = (int *)v43;
    goto LABEL_10;
  }
  return -1;
}

- (CGPoint)centerOfTileAtColumn:(NSUInteger)column row:(NSUInteger)row
{
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  float32x2_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  __int128 v35;
  CGPoint result;

  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v35 = *((_OWORD *)self->_skcTileMapNode + 21);
  -[SKTileMapNode tileSet](self, "tileSet");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        -[SKTileMapNode tileSet](self, "tileSet"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "type"),
        v11,
        v10,
        v12))
  {
    -[SKTileMapNode tileSet](self, "tileSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");

    if (v14 == 1)
    {
      v15 = vmla_n_f32(vmla_n_f32(*(float32x2_t *)self->_isoOrigin, vmul_n_f32(*(float32x2_t *)self->_isoColumnVector, self->_isoColumnWidth), (float)column + 0.5), vmul_n_f32(*(float32x2_t *)self->_isoRowVector, self->_isoRowHeight), (float)row + 0.5);
      v7 = v15.f32[0];
      v8 = (float)(v15.f32[1] / self->_isoHeightScalar);
    }
    else
    {
      -[SKTileMapNode tileSet](self, "tileSet");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "type");

      if (v24 == 2)
      {
        v25 = (double)column * self->_hexRadius;
        -[SKTileMapNode tileSize](self, "tileSize");
        v7 = v26 * 0.5 + v25 * 1.5;
        -[SKTileMapNode tileSize](self, "tileSize");
        v8 = ((double)row + 0.5) * v27;
        if ((column & 1) != 0)
        {
          -[SKTileMapNode tileSize](self, "tileSize");
          v8 = v8 + v28 * 0.5;
        }
      }
      else
      {
        -[SKTileMapNode tileSet](self, "tileSet");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "type");

        if (v30 == 3)
        {
          -[SKTileMapNode tileSize](self, "tileSize");
          v7 = ((double)column + 0.5) * v31;
          v32 = (double)row * self->_hexRadius;
          -[SKTileMapNode tileSize](self, "tileSize");
          v8 = v33 * 0.5 + v32 * 1.5;
          if ((row & 1) != 0)
          {
            -[SKTileMapNode tileSize](self, "tileSize");
            v7 = v7 + v34 * 0.5;
          }
        }
      }
    }
  }
  else
  {
    -[SKTileMapNode tileSize](self, "tileSize");
    v7 = ((double)column + 0.5) * v16;
    -[SKTileMapNode tileSize](self, "tileSize");
    v8 = ((double)row + 0.5) * v17;
  }
  -[SKTileMapNode anchorPoint](self, "anchorPoint");
  v19 = v7 - v18 * *(float *)&v35;
  -[SKTileMapNode anchorPoint](self, "anchorPoint");
  v21 = v8 - v20 * *((float *)&v35 + 1);
  v22 = v19;
  result.y = v21;
  result.x = v22;
  return result;
}

- (id)createTileStampFromColumn:(unint64_t)a3 row:(unint64_t)a4 withWidth:(unint64_t)a5 height:(unint64_t)a6 addToTileSet:(BOOL)a7
{
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _DWORD *v15;
  _DWORD *v16;
  int v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v26;
  BOOL v27;
  void *v28;

  -[SKTileMapNode tileSet](self, "tileSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12 || !self->_skcTileMapNode || -[SKTileMapNode numberOfColumns](self, "numberOfColumns") <= a3)
  {

    goto LABEL_18;
  }
  v13 = -[SKTileMapNode numberOfRows](self, "numberOfRows");

  if (v13 <= a4)
  {
LABEL_18:
    v19 = 0;
    return v19;
  }
  v27 = a7;
  if (a5 + a3 >= -[SKTileMapNode numberOfColumns](self, "numberOfColumns"))
    a5 = -[SKTileMapNode numberOfColumns](self, "numberOfColumns") - a3;
  v14 = a6 + a4;
  if (a6 + a4 >= -[SKTileMapNode numberOfRows](self, "numberOfRows"))
  {
    v14 = -[SKTileMapNode numberOfRows](self, "numberOfRows");
    a6 = v14 - a4;
  }
  v26 = a6;
  v28 = malloc_type_malloc(4 * a5 * a6, 0x5B3CDE6EuLL);
  bzero(v28, 4 * a5 * a6);
  if (v14 > a4)
  {
    v15 = v28;
    do
    {
      v16 = v15;
      v17 = a3;
      v18 = a5;
      if (a5 + a3 > a3)
      {
        do
        {
          *v16++ = SKCTileMapNode::getRawTile((SKCTileMapNode *)self->_skcTileMapNode, v17+ a4 * -[SKTileMapNode numberOfColumns](self, "numberOfColumns", v26));
          ++v17;
          --v18;
        }
        while (v18);
      }
      ++a4;
      v15 += a5;
    }
    while (a4 != v14);
  }
  +[SKTileStamp tileStampWithWidth:height:tileData:](SKTileStamp, "tileStampWithWidth:height:tileData:", a5, v26, v28, v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v20 = (void *)MEMORY[0x1E0C99DE8];
    -[SKTileMapNode tileSet](self, "tileSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stamps");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "addObject:", v19);
    -[SKTileMapNode tileSet](self, "tileSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setStamps:", v23);

  }
  free(v28);
  return v19;
}

- (void)applyTileStamp:(id)a3 inColumn:(int64_t)a4 row:(int64_t)a5
{
  void *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  int v24;
  int64_t j;
  int64_t k;
  uint64_t v28;
  uint64_t v29;
  id v30;
  SKTileMapNode *v31;

  v30 = a3;
  -[SKTileMapNode tileSet](self, "tileSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && self->_skcTileMapNode
    && (int64_t)-[SKTileMapNode numberOfColumns](self, "numberOfColumns") > a4
    && (int64_t)-[SKTileMapNode numberOfRows](self, "numberOfRows") > a5
    && objc_msgSend(v30, "numberOfColumns") + a4 >= 1)
  {
    v8 = objc_msgSend(v30, "numberOfRows") + a5;

    if (v8 >= 1)
    {
      v28 = objc_msgSend(v30, "tileData");
      v29 = 0;
      v9 = a5;
      v31 = self;
      while (v9 < (int64_t)-[SKTileMapNode numberOfRows](self, "numberOfRows")
           && v9 < objc_msgSend(v30, "numberOfRows") + a5)
      {
        if ((v9 & 0x8000000000000000) == 0)
        {
          for (i = 0; ; ++i)
          {
            v11 = a4 + i;
            if (a4 + i >= (int64_t)-[SKTileMapNode numberOfColumns](self, "numberOfColumns")
              || v11 >= objc_msgSend(v30, "numberOfColumns") + a4)
            {
              break;
            }
            if ((v11 & 0x8000000000000000) == 0)
            {
              v12 = objc_msgSend(v30, "numberOfColumns");
              v13 = -[SKTileMapNode numberOfColumns](v31, "numberOfColumns");
              v14 = *(unsigned int *)(v28 + 4 * (i + v29 * v12));
              -[SKTileMapNode tileSet](v31, "tileSet");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "tileGroups");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "count");

              -[SKTileMapNode tileSet](v31, "tileSet");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "tileDefinitions");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v13;
              v21 = i;
              v22 = objc_msgSend(v19, "count");

              v23 = v14 & 0x7FFF0000;
              if (v17 <= ((v14 >> 16) & 0x7FFF))
                v23 = 2147418112;
              if (v22 <= (unsigned __int16)v14)
                v24 = 0xFFFF;
              else
                v24 = (unsigned __int16)v14;
              i = v21;
              SKCTileMapNode::setTile((SKCTileMapNode *)v31->_skcTileMapNode, a4 + v21 + v9 * v20, v24 | v23);
            }
            self = v31;
          }
        }
        ++v9;
        ++v29;
      }
      if (-[SKTileMapNode enableAutomapping](self, "enableAutomapping"))
      {
        for (j = a5;
              j < (int64_t)-[SKTileMapNode numberOfRows](self, "numberOfRows")
           && j < objc_msgSend(v30, "numberOfRows") + a5;
              ++j)
        {
          if ((j & 0x8000000000000000) == 0)
          {
            for (k = a4;
                  k < (int64_t)-[SKTileMapNode numberOfColumns](self, "numberOfColumns")
               && k < objc_msgSend(v30, "numberOfColumns") + a4;
                  ++k)
            {
              if ((k & 0x8000000000000000) == 0)
                -[SKTileMapNode updateTileGroupsAtX:y:](self, "updateTileGroupsAtX:y:", k, j);
            }
          }
        }
      }
    }
  }
  else
  {

  }
}

- (id)tileDefinitionForTileID:(unsigned int)a3
{
  SKTileSet *tileSet;
  unsigned __int16 v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  tileSet = self->_tileSet;
  if (tileSet
    && (v5 = a3,
        -[SKTileSet tileDefinitions](tileSet, "tileDefinitions"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7 > v5))
  {
    -[SKTileSet tileDefinitions](self->_tileSet, "tileDefinitions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)shouldUnarchiveTileSet
{
  return 1;
}

- (void)forceRedraw
{
  SKCTileMapNode **skcTileMapNode;

  skcTileMapNode = (SKCTileMapNode **)self->_skcTileMapNode;
  if (skcTileMapNode)
    SKCTileMapNode::forceRedraw(skcTileMapNode, 1);
}

- (SKAttributeValue)valueForAttributeNamed:(NSString *)key
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKTileMapNode;
  -[SKNode valueForAttributeNamed:](&v4, sel_valueForAttributeNamed_, key);
  return (SKAttributeValue *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKTileMapNode;
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
  __CFDictionary *v15;
  __CFDictionary *v16;
  CFNumberRef v17;
  CFNumberRef v18;
  void *v19;
  __CFDictionary *v21;
  __CFDictionary *v22;
  __CFDictionary *v23;
  __CFDictionary *v24;
  uint64_t valuePtr;
  _QWORD v26[15];

  v26[13] = *MEMORY[0x1E0C80C00];
  v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("anchorPoint"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("CGPoint"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypePoint"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v24 = Mutable;
  v26[0] = Mutable;
  v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("color"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("color"));
  v23 = v5;
  v26[1] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("colorBlendFactor"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("CGf"));
  v22 = v6;
  v26[2] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("enableAutomapping"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("b"));
  v21 = v7;
  v26[3] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("lightingBitMask"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("unsigned long"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("ul"));
  v26[4] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("mapSize"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v26[5] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("numberOfColumns"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("NSUInteger"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v26[6] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("numberOfRows"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("NSUInteger"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v26[7] = v11;
  v12 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("shader"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v26[8] = v12;
  v13 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("tileSet"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v26[9] = v13;
  v14 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("tileSize"));
  CFDictionaryAddValue(v14, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v26[10] = v14;
  v15 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("blendMode"));
  CFDictionaryAddValue(v15, CFSTR("propertyRuntimeType"), CFSTR("SKBlendMode"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeEnum"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("integer"));
  v26[11] = v15;
  v16 = CFDictionaryCreateMutable(0, 7, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("visualRepresentation"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("CGImage"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeImage"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("public.data"));
  valuePtr = 8;
  v17 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v16, CFSTR("visibility"), v17);
  CFRelease(v17);
  valuePtr = 1;
  v18 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v16, CFSTR("propertyOptions"), v18);
  CFRelease(v18);
  v26[12] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)Mutable
{
  id v9;
  id v10;
  CGColor *v11;
  size_t NumberOfComponents;
  uint64_t v13;
  CFIndex v14;
  __CFString *v15;
  CFIndex v16;
  uint64_t v17;
  id v18;
  NSString *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const CGFloat *Components;
  const void **v26;
  const void **v27;
  uint64_t v28;
  CFNumberRef *v29;
  CFArrayRef v30;
  uint64_t v31;
  CFTypeRef *v32;
  NSString *v33;
  id v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  id v41;
  id v43;
  CGColorSpace *space;
  CFStringRef value;
  id v46;
  const __CFString *v47;
  uint64_t v48;
  _QWORD v49[3];
  _QWORD v50[4];

  v50[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v46 = a4;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("visualRepresentation")))
  {
    objc_msgSend(v46, "createDebugHierarchyVisualRepresentation");
    Mutable = (id *)objc_claimAutoreleasedReturnValue();
    v47 = CFSTR("propertyFormat");
    v48 = *MEMORY[0x1E0CA5C10];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_61;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("color")))
  {
    v18 = v46;
    v19 = (NSString *)v9;
    if (-[NSString length](v19, "length"))
    {
      NSSelectorFromString(v19);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v20 = v19;
        if (v20)
        {
LABEL_16:
          objc_msgSend(v18, "valueForKey:", v20);
          Mutable = (id *)objc_claimAutoreleasedReturnValue();
LABEL_60:

          goto LABEL_61;
        }
      }
      else
      {
        if (-[NSString length](v19, "length") < 2)
        {
          -[NSString uppercaseString](v19, "uppercaseString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[NSString substringToIndex:](v19, "substringToIndex:", 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uppercaseString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString substringFromIndex:](v19, "substringFromIndex:", 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringByAppendingString:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(CFSTR("is"), "stringByAppendingString:", v24);
        v33 = (NSString *)objc_claimAutoreleasedReturnValue();
        NSSelectorFromString(v33);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v20 = v33;
        else
          v20 = 0;

        if (v20)
          goto LABEL_16;
      }
    }
    if (Mutable)
    {
      v34 = v18;
      v35 = v19;
      if (v34)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v34);
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = &stru_1EA5021F8;
      }
      if (v35)
        v37 = v35;
      else
        v37 = &stru_1EA5021F8;
      v38 = v37;
      v49[0] = CFSTR("propertyName");
      v49[1] = CFSTR("objectDescription");
      v50[0] = v38;
      v50[1] = v36;
      v49[2] = CFSTR("errorDescription");
      v50[2] = &stru_1EA5021F8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = objc_retainAutorelease(v40);
      *Mutable = v41;

      v20 = 0;
      Mutable = 0;
    }
    else
    {
      v20 = 0;
    }
    goto LABEL_60;
  }
  objc_msgSend(v46, "color");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = (CGColor *)objc_msgSend(v10, "CGColor");
  if (v11)
  {
    Mutable = (id *)CFDictionaryCreateMutable(0, 20, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
    space = CGColorGetColorSpace(v11);
    value = CGColorSpaceCopyName(space);
    NumberOfComponents = CGColorGetNumberOfComponents(v11);
    v13 = NumberOfComponents << 32;
    v14 = (int)NumberOfComponents;
    if (NumberOfComponents << 32)
    {
      v15 = CFStringCreateMutable(0, 0);
      v43 = v10;
      v16 = v14 - 1;
      if ((unint64_t)v14 <= 1)
        v17 = 1;
      else
        v17 = v14;
      do
      {
        CFStringAppend(v15, CFSTR("CGf"));
        if (v16)
          CFStringAppend(v15, CFSTR(", "));
        --v16;
        --v17;
      }
      while (v17);
      v10 = v43;
    }
    else
    {
      v15 = &stru_1EA5021F8;
    }
    Components = CGColorGetComponents(v11);
    v26 = (const void **)malloc_type_malloc(v13 >> 29, 0x6004044C4A2DFuLL);
    v27 = v26;
    if (v13 >= 1)
    {
      if (v14 <= 1)
        v28 = 1;
      else
        v28 = v14;
      v29 = (CFNumberRef *)v26;
      do
      {
        *v29++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
        --v28;
      }
      while (v28);
    }
    v30 = CFArrayCreate(0, v27, v14, MEMORY[0x1E0C9B378]);
    if (v13 >= 1)
    {
      if (v14 <= 1)
        v31 = 1;
      else
        v31 = v14;
      v32 = v27;
      do
      {
        CFRelease(*v32++);
        --v31;
      }
      while (v31);
    }
    free(v27);
    CGColorSpaceGetModel(space);
    if (v30)
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("componentValues"), v30);
    if (v15)
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("componentValuesFormat"), v15);
    if (value)
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, CFSTR("colorSpaceName"), value);
    if (v30)
      CFRelease(v30);
    if (value)
      CFRelease(value);
    if (v15)
      CFRelease(v15);
  }
  else
  {
    Mutable = 0;
  }

LABEL_61:
  return Mutable;
}

- (NSString)tileSetName
{
  return self->_tileSetName;
}

- (void)setTileSetName:(id)a3
{
  objc_storeStrong((id *)&self->_tileSetName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileSetName, 0);
  objc_storeStrong((id *)&self->_tileSet, 0);
}

@end
