@implementation SKAnimate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKAnimate)init
{
  SKAnimate *v2;
  uint64_t v3;
  const SKCAction *v4;
  uint64_t v5;
  NSArray *textures;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKAnimate;
  v2 = -[SKAction init](&v10, sel_init);
  if (v2)
  {
    v3 = operator new();
    v9.receiver = v2;
    v9.super_class = (Class)SKAnimate;
    v4 = -[SKAction caction](&v9, sel_caction);
    SKCAction::SKCAction((SKCAction *)v3, v4);
    *(_QWORD *)v3 = &off_1EA4FEA70;
    *(_OWORD *)(v3 + 112) = 0u;
    *(_OWORD *)(v3 + 128) = 0u;
    *(_OWORD *)(v3 + 144) = 0u;
    *(_WORD *)(v3 + 160) = 257;
    v2->_mycaction = (void *)v3;
    *(_BYTE *)(v3 + 162) = 0;
    v8.receiver = v2;
    v8.super_class = (Class)SKAnimate;
    -[SKAction setCppAction:](&v8, sel_setCppAction_, v3);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    textures = v2->_textures;
    v2->_textures = (NSArray *)v5;

    *((_QWORD *)v2->_mycaction + 17) = 0;
  }
  return v2;
}

- (SKAnimate)initWithCoder:(id)a3
{
  id v4;
  SKAnimate *v5;
  uint64_t v6;
  const SKCAction *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *textures;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  objc_super v25;
  objc_super v26;
  objc_super v27;
  _BYTE v28[128];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SKAnimate;
  v5 = -[SKAction initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = operator new();
    v26.receiver = v5;
    v26.super_class = (Class)SKAnimate;
    v7 = -[SKAction caction](&v26, sel_caction);
    SKCAction::SKCAction((SKCAction *)v6, v7);
    *(_QWORD *)v6 = &off_1EA4FEA70;
    *(_OWORD *)(v6 + 112) = 0u;
    *(_OWORD *)(v6 + 128) = 0u;
    *(_OWORD *)(v6 + 144) = 0u;
    *(_WORD *)(v6 + 160) = 257;
    *(_BYTE *)(v6 + 162) = 0;
    v5->_mycaction = (void *)v6;
    v25.receiver = v5;
    v25.super_class = (Class)SKAnimate;
    -[SKAction setCppAction:](&v25, sel_setCppAction_, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timePerFrame"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    *((_QWORD *)v5->_mycaction + 17) = v9;

    *((_BYTE *)v5->_mycaction + 161) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_resize"));
    *((_BYTE *)v5->_mycaction + 160) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_restore"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_textures"));
    v13 = objc_claimAutoreleasedReturnValue();
    textures = v5->_textures;
    v5->_textures = (NSArray *)v13;

    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v5->_textures;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v15);
          v24 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * v18);
          std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v5->_mycaction + 14, &v24);
          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v16);
    }

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
  v6.super_class = (Class)SKAnimate;
  -[SKAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)self->_mycaction + 17));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_timePerFrame"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_textures, CFSTR("_textures"));
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)self->_mycaction + 161), CFSTR("_resize"));
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)self->_mycaction + 160), CFSTR("_restore"));

}

+ (id)animateWithTextures:(id)a3 timePerFrame:(double)a4 resize:(BOOL)a5 restore:(BOOL)a6
{
  id v9;
  SKAnimate *v10;
  uint64_t v11;
  NSArray *textures;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *mycaction;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!objc_msgSend(v9, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("SKAction animateWithTextures: textures array cannot be empty"));
  v10 = objc_alloc_init(SKAnimate);
  v11 = objc_msgSend(v9, "copy");
  textures = v10->_textures;
  v10->_textures = (NSArray *)v11;

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v10->_textures;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        v23 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v16);
        std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v10->_mycaction + 14, &v23);
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v14);
  }

  *((double *)v10->_mycaction + 17) = a4;
  -[SKAnimate setDuration:](v10, "setDuration:", (double)(unint64_t)objc_msgSend(v9, "count", (_QWORD)v19) * a4);
  mycaction = v10->_mycaction;
  mycaction[160] = a6;
  mycaction[161] = a5;

  return v10;
}

+ (id)animateWithNormalTextures:(id)a3 timePerFrame:(double)a4 resize:(BOOL)a5 restore:(BOOL)a6
{
  id v9;
  SKAnimate *v10;
  uint64_t v11;
  NSArray *textures;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *mycaction;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!objc_msgSend(v9, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("SKAction animateWithNormalTextures: textures array cannot be empty"));
  v10 = objc_alloc_init(SKAnimate);
  v11 = objc_msgSend(v9, "copy");
  textures = v10->_textures;
  v10->_textures = (NSArray *)v11;

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v10->_textures;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        v23 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v16);
        std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v10->_mycaction + 14, &v23);
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v14);
  }

  *((double *)v10->_mycaction + 17) = a4;
  -[SKAnimate setDuration:](v10, "setDuration:", (double)(unint64_t)objc_msgSend(v9, "count", (_QWORD)v19) * a4);
  mycaction = v10->_mycaction;
  mycaction[160] = a6;
  mycaction[161] = a5;
  mycaction[162] = 1;

  return v10;
}

- (void)setDuration:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKAnimate;
  -[SKAction setDuration:](&v5, sel_setDuration_);
  *((double *)self->_mycaction + 17) = a3 / (double)-[NSArray count](self->_textures, "count");
}

- (void)setTimePerFrame:(double)a3
{
  *((double *)self->_mycaction + 17) = a3;
  -[SKAnimate setDuration:](self, "setDuration:", (double)-[NSArray count](self->_textures, "count") * a3);
}

- (double)timePerFrame
{
  return *((double *)self->_mycaction + 17);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSArray *textures;
  _QWORD *v5;

  textures = self->_textures;
  -[SKAnimate timePerFrame](self, "timePerFrame", a3);
  +[SKAnimate animateWithTextures:timePerFrame:resize:restore:](SKAnimate, "animateWithTextures:timePerFrame:resize:restore:", textures, *((unsigned __int8 *)self->_mycaction + 161), *((unsigned __int8 *)self->_mycaction + 160));
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingMode:", -[SKAction timingMode](self, "timingMode"));
  *(_BYTE *)(v5[2] + 162) = *((_BYTE *)self->_mycaction + 162);
  return v5;
}

- (id)reversedAction
{
  NSArray **p_textures;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _DWORD *mycaction;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_textures = &self->_textures;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_textures, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *p_textures;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8++), 0, (_QWORD)v13);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  +[SKAnimate animateWithTextures:timePerFrame:resize:restore:](SKAnimate, "animateWithTextures:timePerFrame:resize:restore:", v4, *((unsigned __int8 *)self->_mycaction + 161), *((unsigned __int8 *)self->_mycaction + 160), *((double *)self->_mycaction + 17));
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  mycaction = self->_mycaction;
  v11 = v9[2];
  *(_DWORD *)(v11 + 60) = mycaction[15];
  *(_BYTE *)(v11 + 162) = *((_BYTE *)mycaction + 162);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textures, 0);
}

@end
