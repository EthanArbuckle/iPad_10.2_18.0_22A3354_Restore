@implementation SKTileDefinition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)textures
{
  return (NSArray *)self->_textures;
}

- (void)setTextures:(NSArray *)textures
{
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSArray *v6;

  v6 = textures;
  -[SKTileDefinition willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("images"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v5 = self->_textures;
  self->_textures = v4;

  -[SKTileDefinition didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("images"));
}

- (NSArray)normalTextures
{
  return (NSArray *)self->_normals;
}

- (SKTileDefinitionRotation)rotation
{
  return self->_orientation & 3;
}

- (void)setRotation:(SKTileDefinitionRotation)rotation
{
  self->_orientation = self->_orientation & 0xFFFFFFFFFFFFFFFCLL | rotation & 3;
}

- (BOOL)flipVertically
{
  return (LOBYTE(self->_orientation) >> 2) & 1;
}

- (void)setFlipVertically:(BOOL)flipVertically
{
  uint64_t v3;

  v3 = 4;
  if (!flipVertically)
    v3 = 0;
  self->_orientation = self->_orientation & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)flipHorizontally
{
  return (LOBYTE(self->_orientation) >> 3) & 1;
}

- (void)setFlipHorizontally:(BOOL)flipHorizontally
{
  uint64_t v3;

  v3 = 8;
  if (!flipHorizontally)
    v3 = 0;
  self->_orientation = self->_orientation & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (void)setNormalTextures:(NSArray *)normalTextures
{
  NSMutableArray *v4;
  NSMutableArray *normals;
  NSArray *v6;

  v6 = normalTextures;
  -[SKTileDefinition willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("normalTextures"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  normals = self->_normals;
  self->_normals = v4;

  -[SKTileDefinition didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("normalTextures"));
}

- (SKTileDefinition)initWithCoder:(id)a3
{
  id v4;
  SKTileDefinition *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *textures;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableArray *normals;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  objc_super v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[8];

  v29[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SKTileDefinition;
  v5 = -[SKTileDefinition init](&v26, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    v29[3] = objc_opt_class();
    v29[4] = objc_opt_class();
    v29[5] = objc_opt_class();
    v29[6] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 7);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v4, "allowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v8);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_textures"));
    v12 = objc_claimAutoreleasedReturnValue();
    textures = v5->_textures;
    v5->_textures = (NSMutableArray *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_normals"));
    v17 = objc_claimAutoreleasedReturnValue();
    normals = v5->_normals;
    v5->_normals = (NSMutableArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_userData"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTileDefinition setUserData:](v5, "setUserData:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uuid"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTileDefinition setUid:](v5, "setUid:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTileDefinition setName:](v5, "setName:", v21);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_width"));
    v23 = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_height"));
    -[SKTileDefinition setSize:](v5, "setSize:", v23, v24);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_timePerFrame"));
    -[SKTileDefinition setTimePerFrame:](v5, "setTimePerFrame:");
    -[SKTileDefinition setPlacementWeight:](v5, "setPlacementWeight:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_placementWeight")));
    v5->_orientation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_orientation"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", self->_textures, CFSTR("_textures"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_normals, CFSTR("_normals"));
  -[SKTileDefinition userData](self, "userData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("_userData"));

  -[SKTileDefinition uid](self, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("_uid"));

  -[SKTileDefinition name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("_name"));

  -[SKTileDefinition size](self, "size");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("_width"));
  -[SKTileDefinition size](self, "size");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("_height"), v7);
  -[SKTileDefinition timePerFrame](self, "timePerFrame");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("_timePerFrame"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[SKTileDefinition placementWeight](self, "placementWeight"), CFSTR("_placementWeight"));
  objc_msgSend(v8, "encodeInteger:forKey:", self->_orientation, CFSTR("_orientation"));

}

- (BOOL)isEqualToNode:(id)a3
{
  SKTileDefinition *v4;
  SKTileDefinition *v5;
  SKTileDefinition *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  float timePerFrame;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  unint64_t v26;
  void *v27;
  void *v28;
  char v29;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  char v35;

  v4 = (SKTileDefinition *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (self->_orientation != v6->_orientation)
      goto LABEL_21;
    -[SKTileDefinition size](self, "size");
    v8 = v7;
    -[SKTileDefinition size](v6, "size");
    if (v8 != v9)
      goto LABEL_21;
    -[SKTileDefinition size](self, "size");
    v11 = v10;
    -[SKTileDefinition size](v6, "size");
    if (v11 != v12)
      goto LABEL_21;
    -[SKTileDefinition name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else
    {
      -[SKTileDefinition name](v6, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
LABEL_10:
        if (self->_placementWeight == v6->_placementWeight)
        {
          timePerFrame = self->_timePerFrame;
          v20 = v6->_timePerFrame;
          if ((COERCE_UNSIGNED_INT(timePerFrame - v20) & 0x60000000) == 0)
          {
            -[SKTileDefinition uid](self, "uid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {

            }
            else
            {
              -[SKTileDefinition uid](v6, "uid");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v22)
                goto LABEL_16;
            }
            -[SKTileDefinition uid](self, "uid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKTileDefinition uid](v6, "uid");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "isEqualToString:", v24);

            if ((v25 & 1) != 0)
            {
LABEL_16:
              v26 = 0;
              while (-[NSMutableArray count](self->_textures, "count") > v26)
              {
                if (-[NSMutableArray count](v6->_textures, "count") <= v26)
                  goto LABEL_21;
                -[NSMutableArray objectAtIndexedSubscript:](self->_textures, "objectAtIndexedSubscript:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray objectAtIndexedSubscript:](v6->_textures, "objectAtIndexedSubscript:", v26);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v27, "isEqualToTexture:", v28);

                v14 = 0;
                ++v26;
                if ((v29 & 1) == 0)
                  goto LABEL_22;
              }
              v31 = 0;
              do
              {
                v32 = -[NSMutableArray count](self->_normals, "count");
                v14 = v32 <= v31;
                if (v32 <= v31)
                  break;
                if (-[NSMutableArray count](v6->_normals, "count") <= v31)
                  break;
                -[NSMutableArray objectAtIndexedSubscript:](self->_normals, "objectAtIndexedSubscript:", v31);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray objectAtIndexedSubscript:](v6->_normals, "objectAtIndexedSubscript:", v31);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v33, "isEqualToTexture:", v34);

                ++v31;
              }
              while ((v35 & 1) != 0);
              goto LABEL_22;
            }
          }
        }
LABEL_21:
        v14 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    -[SKTileDefinition name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTileDefinition name](v6, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    if ((v18 & 1) == 0)
      goto LABEL_21;
    goto LABEL_10;
  }
  v14 = 1;
LABEL_23:

  return v14;
}

- (id)copy
{
  return -[SKTileDefinition copyWithZone:](self, "copyWithZone:", MEMORY[0x1DF0CF2F0](self, a2));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setTextures:", self->_textures);
    objc_msgSend(v5, "setNormalTextures:", self->_normals);
    -[SKTileDefinition uid](self, "uid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUid:", v6);

    -[SKTileDefinition size](self, "size");
    objc_msgSend(v5, "setSize:");
    -[SKTileDefinition timePerFrame](self, "timePerFrame");
    objc_msgSend(v5, "setTimePerFrame:");
    objc_msgSend(v5, "setPlacementWeight:", -[SKTileDefinition placementWeight](self, "placementWeight"));
  }
  return v5;
}

- (void)setDataWithTexture:(id)a3 normalTexture:(id)a4 tileName:(id)a5 size:(CGSize)a6
{
  double height;
  double width;
  id v11;
  id v12;
  NSMutableArray *v13;
  NSMutableArray *textures;
  NSMutableArray *v15;
  NSMutableArray *normals;
  id v17;

  height = a6.height;
  width = a6.width;
  v17 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  textures = self->_textures;
  self->_textures = v13;

  if (v17)
    -[NSMutableArray addObject:](self->_textures, "addObject:", v17);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  normals = self->_normals;
  self->_normals = v15;

  if (v11)
    -[NSMutableArray addObject:](self->_normals, "addObject:", v11);
  objc_msgSend(v17, "setFilteringMode:", 0);
  self->_timePerFrame = 0.0;
  -[SKTileDefinition setName:](self, "setName:", v12);
  -[SKTileDefinition setSize:](self, "setSize:", width, height);
  -[SKTileDefinition setPlacementWeight:](self, "setPlacementWeight:", 1);

}

- (void)setDataWithTextures:(id)a3 normalTextures:(id)a4 timePerFrame:(double)a5 tileName:(id)a6 size:(CGSize)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  NSMutableArray *v16;
  NSMutableArray *textures;
  NSMutableArray *v18;
  NSMutableArray *normals;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  height = a7.height;
  width = a7.width;
  v31 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v13);
  v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  textures = self->_textures;
  self->_textures = v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v14);
  v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  normals = self->_normals;
  self->_normals = v18;

  self->_timePerFrame = a5;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v20 = self->_textures;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v27;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v23++), "setFilteringMode:", 0, (_QWORD)v26);
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v21);
  }

  -[SKTileDefinition setName:](self, "setName:", v15);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKTileDefinition setUid:](self, "setUid:", v25);

  -[SKTileDefinition setSize:](self, "setSize:", width, height);
  self->_orientation = 0;

}

- (SKTileDefinition)init
{
  SKTileDefinition *v2;
  SKTileDefinition *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKTileDefinition;
  v2 = -[SKTileDefinition init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKTileDefinition setDataWithTexture:normalTexture:tileName:size:](v2, "setDataWithTexture:normalTexture:tileName:size:", 0, 0, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  return v3;
}

- (SKTileDefinition)initWithTexture:(SKTexture *)texture
{
  SKTexture *v4;
  SKTileDefinition *v5;
  objc_super v7;

  v4 = texture;
  v7.receiver = self;
  v7.super_class = (Class)SKTileDefinition;
  v5 = -[SKTileDefinition init](&v7, sel_init);
  if (v5)
  {
    -[SKTexture size](v4, "size");
    -[SKTileDefinition setDataWithTexture:normalTexture:tileName:size:](v5, "setDataWithTexture:normalTexture:tileName:size:", v4, 0, 0);
  }

  return v5;
}

- (SKTileDefinition)initWithTexture:(SKTexture *)texture size:(CGSize)size
{
  double height;
  double width;
  SKTexture *v7;
  SKTileDefinition *v8;
  SKTileDefinition *v9;
  objc_super v11;

  height = size.height;
  width = size.width;
  v7 = texture;
  v11.receiver = self;
  v11.super_class = (Class)SKTileDefinition;
  v8 = -[SKTileDefinition init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[SKTileDefinition setDataWithTexture:normalTexture:tileName:size:](v8, "setDataWithTexture:normalTexture:tileName:size:", v7, 0, 0, width, height);

  return v9;
}

- (SKTileDefinition)initWithTexture:(SKTexture *)texture normalTexture:(SKTexture *)normalTexture size:(CGSize)size
{
  double height;
  double width;
  SKTexture *v9;
  SKTexture *v10;
  SKTileDefinition *v11;
  SKTileDefinition *v12;
  objc_super v14;

  height = size.height;
  width = size.width;
  v9 = texture;
  v10 = normalTexture;
  v14.receiver = self;
  v14.super_class = (Class)SKTileDefinition;
  v11 = -[SKTileDefinition init](&v14, sel_init);
  v12 = v11;
  if (v11)
    -[SKTileDefinition setDataWithTexture:normalTexture:tileName:size:](v11, "setDataWithTexture:normalTexture:tileName:size:", v9, v10, 0, width, height);

  return v12;
}

- (SKTileDefinition)initWithTextures:(NSArray *)textures size:(CGSize)size timePerFrame:(CGFloat)timePerFrame
{
  double height;
  double width;
  NSArray *v9;
  SKTileDefinition *v10;
  SKTileDefinition *v11;
  objc_super v13;

  height = size.height;
  width = size.width;
  v9 = textures;
  v13.receiver = self;
  v13.super_class = (Class)SKTileDefinition;
  v10 = -[SKTileDefinition init](&v13, sel_init);
  v11 = v10;
  if (v10)
    -[SKTileDefinition setDataWithTextures:normalTextures:timePerFrame:tileName:size:](v10, "setDataWithTextures:normalTextures:timePerFrame:tileName:size:", v9, MEMORY[0x1E0C9AA60], 0, timePerFrame, width, height);

  return v11;
}

- (SKTileDefinition)initWithTextures:(NSArray *)textures normalTextures:(NSArray *)normalTextures size:(CGSize)size timePerFrame:(CGFloat)timePerFrame
{
  double height;
  double width;
  NSArray *v11;
  NSArray *v12;
  SKTileDefinition *v13;
  SKTileDefinition *v14;
  objc_super v16;

  height = size.height;
  width = size.width;
  v11 = textures;
  v12 = normalTextures;
  v16.receiver = self;
  v16.super_class = (Class)SKTileDefinition;
  v13 = -[SKTileDefinition init](&v16, sel_init);
  v14 = v13;
  if (v13)
    -[SKTileDefinition setDataWithTextures:normalTextures:timePerFrame:tileName:size:](v13, "setDataWithTextures:normalTextures:timePerFrame:tileName:size:", v11, v12, 0, timePerFrame, width, height);

  return v14;
}

+ (SKTileDefinition)tileDefinitionWithTexture:(SKTexture *)texture
{
  SKTexture *v3;
  SKTileDefinition *v4;

  v3 = texture;
  v4 = -[SKTileDefinition initWithTexture:]([SKTileDefinition alloc], "initWithTexture:", v3);

  return v4;
}

+ (SKTileDefinition)tileDefinitionWithTexture:(SKTexture *)texture size:(CGSize)size
{
  double height;
  double width;
  SKTexture *v6;
  SKTileDefinition *v7;

  height = size.height;
  width = size.width;
  v6 = texture;
  v7 = -[SKTileDefinition initWithTexture:size:]([SKTileDefinition alloc], "initWithTexture:size:", v6, width, height);

  return v7;
}

+ (SKTileDefinition)tileDefinitionWithTexture:(SKTexture *)texture normalTexture:(SKTexture *)normalTexture size:(CGSize)size
{
  double height;
  double width;
  SKTexture *v8;
  SKTexture *v9;
  SKTileDefinition *v10;

  height = size.height;
  width = size.width;
  v8 = texture;
  v9 = normalTexture;
  v10 = -[SKTileDefinition initWithTexture:normalTexture:size:]([SKTileDefinition alloc], "initWithTexture:normalTexture:size:", v8, v9, width, height);

  return v10;
}

+ (SKTileDefinition)tileDefinitionWithTextures:(NSArray *)textures size:(CGSize)size timePerFrame:(CGFloat)timePerFrame
{
  double height;
  double width;
  NSArray *v8;
  SKTileDefinition *v9;

  height = size.height;
  width = size.width;
  v8 = textures;
  v9 = -[SKTileDefinition initWithTextures:size:timePerFrame:]([SKTileDefinition alloc], "initWithTextures:size:timePerFrame:", v8, width, height, timePerFrame);

  return v9;
}

+ (SKTileDefinition)tileDefinitionWithTextures:(NSArray *)textures normalTextures:(NSArray *)normalTextures size:(CGSize)size timePerFrame:(CGFloat)timePerFrame
{
  double height;
  double width;
  NSArray *v10;
  NSArray *v11;
  SKTileDefinition *v12;

  height = size.height;
  width = size.width;
  v10 = textures;
  v11 = normalTextures;
  v12 = -[SKTileDefinition initWithTextures:normalTextures:size:timePerFrame:]([SKTileDefinition alloc], "initWithTextures:normalTextures:size:timePerFrame:", v10, v11, width, height, timePerFrame);

  return v12;
}

- (NSMutableDictionary)userData
{
  return self->_userData;
}

- (void)setUserData:(NSMutableDictionary *)userData
{
  objc_storeStrong((id *)&self->_userData, userData);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 48);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)size
{
  self->_size = size;
}

- (CGFloat)timePerFrame
{
  return self->_timePerFrame;
}

- (void)setTimePerFrame:(CGFloat)timePerFrame
{
  self->_timePerFrame = timePerFrame;
}

- (NSUInteger)placementWeight
{
  return self->_placementWeight;
}

- (void)setPlacementWeight:(NSUInteger)placementWeight
{
  self->_placementWeight = placementWeight;
}

- (SKTileGroupRule)parentRule
{
  return (SKTileGroupRule *)objc_loadWeakRetained((id *)&self->_parentRule);
}

- (void)setParentRule:(id)a3
{
  objc_storeWeak((id *)&self->_parentRule, a3);
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
  objc_storeStrong((id *)&self->_uid, a3);
}

- (unsigned)currentFrameIndex
{
  return self->_currentFrameIndex;
}

- (void)setCurrentFrameIndex:(unsigned __int16)a3
{
  self->_currentFrameIndex = a3;
}

- (double)lastTargetTime
{
  return self->_lastTargetTime;
}

- (void)setLastTargetTime:(double)a3
{
  self->_lastTargetTime = a3;
}

- (float)currentFrameTime
{
  return self->_currentFrameTime;
}

- (void)setCurrentFrameTime:(float)a3
{
  self->_currentFrameTime = a3;
}

- (BOOL)frameDidChange
{
  return self->_frameDidChange;
}

- (void)setFrameDidChange:(BOOL)a3
{
  self->_frameDidChange = a3;
}

- (BOOL)nextFrameAffectsVertexBuffer
{
  return self->_nextFrameAffectsVertexBuffer;
}

- (void)setNextFrameAffectsVertexBuffer:(BOOL)a3
{
  self->_nextFrameAffectsVertexBuffer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_destroyWeak((id *)&self->_parentRule);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_normals, 0);
  objc_storeStrong((id *)&self->_textures, 0);
}

@end
