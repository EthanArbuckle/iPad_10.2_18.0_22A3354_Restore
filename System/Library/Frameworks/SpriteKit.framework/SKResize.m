@implementation SKResize

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKResize)init
{
  SKResize *v2;
  SKCResize *v3;
  SKCAction *v4;
  SKCResize *mycaction;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKResize;
  v2 = -[SKAction init](&v9, sel_init);
  if (v2)
  {
    v3 = (SKCResize *)operator new();
    v8.receiver = v2;
    v8.super_class = (Class)SKResize;
    v4 = -[SKAction caction](&v8, sel_caction);
    SKCResize::SKCResize(v3, v4);
    v2->_mycaction = v3;
    v7.receiver = v2;
    v7.super_class = (Class)SKResize;
    -[SKAction setCppAction:](&v7, sel_setCppAction_, v3);
    mycaction = v2->_mycaction;
    *(_QWORD *)&mycaction->var19 = 0;
    *(_QWORD *)&mycaction->var20.var1 = 0;
    *($94F468A8D4C62B317260615823C2B210 *)((char *)&mycaction->var22 + 2) = 0;
    *(_QWORD *)&mycaction->var21.var1 = 0;
    *(_WORD *)&mycaction->var25 = 257;
  }
  return v2;
}

- (SKResize)initWithCoder:(id)a3
{
  id v4;
  SKResize *v5;
  SKCResize *v6;
  SKCAction *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;
  objc_super v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SKResize;
  v5 = -[SKAction initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (SKCResize *)operator new();
    v28.receiver = v5;
    v28.super_class = (Class)SKResize;
    v7 = -[SKAction caction](&v28, sel_caction);
    SKCResize::SKCResize(v6, v7);
    v5->_mycaction = v6;
    v27.receiver = v5;
    v27.super_class = (Class)SKResize;
    -[SKAction setCppAction:](&v27, sel_setCppAction_, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastRatio"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    *(float *)&v9 = v9;
    v5->_mycaction->var19 = *(float *)&v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sizeTarget.width"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    *(float *)&v11 = v11;
    v5->_mycaction->var20.var0 = *(float *)&v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sizeTarget.height"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    *(float *)&v13 = v13;
    v5->_mycaction->var20.var1 = *(float *)&v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sizeTargetReversed.width"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    *(float *)&v15 = v15;
    v5->_mycaction->var21.var0 = *(float *)&v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sizeTargetReversed.height"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    *(float *)&v17 = v17;
    v5->_mycaction->var21.var1 = *(float *)&v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sizeResidual.width"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    *(float *)&v19 = v19;
    v5->_mycaction->var22.var0 = *(float *)&v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sizeResidual.height"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    *(float *)&v21 = v21;
    v5->_mycaction->var22.var1 = *(float *)&v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isReversed"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var23 = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isRelative"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var24 = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_useW"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var25 = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_useH"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var26 = objc_msgSend(v25, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SKResize;
  -[SKAction encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_lastRatio"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var20.var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_sizeTarget.width"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var20.var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_sizeTarget.height"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var21.var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_sizeTargetReversed.width"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var21.var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_sizeTargetReversed.height"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var22.var0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_sizeResidual.width"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var22.var1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("_sizeResidual.height"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("_isReversed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("_isRelative"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("_useW"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("_useH"));

}

+ (id)resizeToWidth:(double)a3 duration:(double)a4
{
  SKResize *v6;
  SKCResize *mycaction;
  float v8;

  v6 = objc_alloc_init(SKResize);
  mycaction = v6->_mycaction;
  v8 = a3;
  mycaction->var20.var0 = v8;
  mycaction->var20.var1 = 0.0;
  mycaction->var21.var0 = v8;
  mycaction->var21.var1 = 0.0;
  *(_WORD *)&mycaction->var24 = 256;
  mycaction->var26 = 0;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

+ (id)resizeToWidth:(double)a3 height:(double)a4 duration:(double)a5
{
  SKResize *v8;
  float v9;
  SKCResize *mycaction;
  float v11;

  v8 = objc_alloc_init(SKResize);
  v9 = a3;
  mycaction = v8->_mycaction;
  v11 = a4;
  mycaction->var20.var0 = v9;
  mycaction->var20.var1 = v11;
  mycaction->var21.var0 = v9;
  mycaction->var21.var1 = v11;
  *(_WORD *)&mycaction->var24 = 256;
  mycaction->var26 = 1;
  -[SKAction setDuration:](v8, "setDuration:", a5);
  return v8;
}

+ (id)resizeToHeight:(double)a3 duration:(double)a4
{
  SKResize *v6;
  SKCResize *mycaction;
  float v8;

  v6 = objc_alloc_init(SKResize);
  mycaction = v6->_mycaction;
  mycaction->var20.var0 = 0.0;
  v8 = a3;
  mycaction->var20.var1 = v8;
  mycaction->var21.var0 = 0.0;
  mycaction->var21.var1 = v8;
  *(_WORD *)&mycaction->var24 = 0;
  mycaction->var26 = 1;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

+ (id)resizeByWidth:(double)a3 height:(double)a4 duration:(double)a5
{
  SKResize *v8;
  SKCResize *mycaction;
  float v10;
  float v11;

  v8 = objc_alloc_init(SKResize);
  mycaction = v8->_mycaction;
  v10 = a3;
  v11 = a4;
  mycaction->var20.var0 = v10;
  mycaction->var20.var1 = v11;
  mycaction->var21.var0 = -v10;
  mycaction->var21.var1 = -v11;
  *(_WORD *)&mycaction->var24 = 257;
  mycaction->var26 = 1;
  -[SKAction setDuration:](v8, "setDuration:", a5);
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  SKCResize *mycaction;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKResize;
  result = -[SKAction copyWithZone:](&v7, sel_copyWithZone_, a3);
  mycaction = self->_mycaction;
  v6 = *((_QWORD *)result + 2);
  *(float *)(v6 + 112) = mycaction->var19;
  *($94F468A8D4C62B317260615823C2B210 *)(v6 + 116) = mycaction->var20;
  *($94F468A8D4C62B317260615823C2B210 *)(*((_QWORD *)result + 2) + 124) = self->_mycaction->var21;
  *($94F468A8D4C62B317260615823C2B210 *)(*((_QWORD *)result + 2) + 132) = self->_mycaction->var22;
  *(_DWORD *)(*((_QWORD *)result + 2) + 140) = *(_DWORD *)&self->_mycaction->var23;
  return result;
}

- (id)reversedAction
{
  uint64_t v3;
  _QWORD *v4;
  SKCResize *mycaction;
  uint64_t v6;
  SKCResize *v7;
  uint64_t v8;
  objc_super v10;

  v3 = MEMORY[0x1DF0CF2F0](self, a2);
  v10.receiver = self;
  v10.super_class = (Class)SKResize;
  v4 = -[SKAction copyWithZone:](&v10, sel_copyWithZone_, v3);
  mycaction = self->_mycaction;
  v6 = v4[2];
  *(float *)(v6 + 112) = mycaction->var19;
  *($94F468A8D4C62B317260615823C2B210 *)(v6 + 116) = mycaction->var21;
  *($94F468A8D4C62B317260615823C2B210 *)(v4[2] + 124) = self->_mycaction->var20;
  *($94F468A8D4C62B317260615823C2B210 *)(v4[2] + 132) = self->_mycaction->var22;
  v7 = self->_mycaction;
  v8 = v4[2];
  *(_BYTE *)(v8 + 140) = !v7->var23;
  *(_BYTE *)(v8 + 141) = v7->var24;
  *(_WORD *)(v8 + 142) = *(_WORD *)&v7->var25;
  return v4;
}

@end
