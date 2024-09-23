@implementation SKColorize

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKColorize)init
{
  SKColorize *v2;
  SKCColorize *v3;
  SKCAction *v4;
  SKCColorize *mycaction;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKColorize;
  v2 = -[SKAction init](&v9, sel_init);
  if (v2)
  {
    v3 = (SKCColorize *)operator new();
    v8.receiver = v2;
    v8.super_class = (Class)SKColorize;
    v4 = -[SKAction caction](&v8, sel_caction);
    SKCColorize::SKCColorize(v3, v4);
    v2->_mycaction = v3;
    v7.receiver = v2;
    v7.super_class = (Class)SKColorize;
    -[SKAction setCppAction:](&v7, sel_setCppAction_, v3);
    mycaction = v2->_mycaction;
    mycaction->var19 = ($C28CD4A45FD07A4F97CC9D5F91F25271)xmmword_1DC922190;
    mycaction->var20 = 0.0;
    BYTE4(mycaction[1].var3) = 0;
    *(_QWORD *)&mycaction->var21.var3 = 0;
    *(_QWORD *)&mycaction->var23.var0 = 0;
    mycaction->var23.var2 = 0.0;
  }
  return v2;
}

- (SKColorize)initWithCoder:(id)a3
{
  id v4;
  SKColorize *v5;
  SKCColorize *v6;
  SKCAction *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  float v18;
  float v19;
  SKCColorize *mycaction;
  float v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  objc_super v27;
  objc_super v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SKColorize;
  v5 = -[SKAction initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (SKCColorize *)operator new();
    v28.receiver = v5;
    v28.super_class = (Class)SKColorize;
    v7 = -[SKAction caction](&v28, sel_caction);
    SKCColorize::SKCColorize(v6, v7);
    v5->_mycaction = v6;
    v27.receiver = v5;
    v27.super_class = (Class)SKColorize;
    -[SKAction setCppAction:](&v27, sel_setCppAction_, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_colorR"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_colorG"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_colorB"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_colorA"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v18 = v10;
    v19 = v13;
    mycaction = v5->_mycaction;
    v21 = v16;
    *(float *)&v22 = v22;
    mycaction->var19.var0 = v18;
    mycaction->var19.var1 = v19;
    mycaction->var19.var2 = v21;
    mycaction->var19.var3 = *(float *)&v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_colorMix"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    *(float *)&v24 = v24;
    v5->_mycaction->var20 = *(float *)&v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isMixOnly"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE4(v5->_mycaction[1].var3) = objc_msgSend(v25, "BOOLValue");

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
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKColorize;
  -[SKAction encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_colorMix"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19.var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_colorBlendR"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19.var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_colorBlendG"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19.var2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_colorBlendB"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19.var3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_colorBlendA"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE4(self->_mycaction[1].var3));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_isMixOnly"));

}

+ (id)colorizeWithColor:(id)a3 colorBlendFactor:(double)a4 duration:(double)a5
{
  id v7;
  SKColorize *v8;
  SKCColorize *mycaction;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;

  v7 = a3;
  v8 = objc_alloc_init(SKColorize);
  objc_msgSend(v7, "componentRGBA");
  mycaction = v8->_mycaction;
  mycaction->var19.var0 = v10;
  mycaction->var19.var1 = v11;
  mycaction->var19.var2 = v12;
  mycaction->var19.var3 = v13;
  v14 = a4;
  mycaction->var20 = v14;
  -[SKAction setDuration:](v8, "setDuration:", a5);
  BYTE4(v8->_mycaction[1].var3) = 0;

  return v8;
}

+ (id)colorizeWithColorBlendFactor:(double)a3 duration:(double)a4
{
  SKColorize *v6;
  float v7;

  v6 = objc_alloc_init(SKColorize);
  v7 = a3;
  v6->_mycaction->var20 = v7;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  BYTE4(v6->_mycaction[1].var3) = 1;
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  SKCColorize *mycaction;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKColorize;
  result = -[SKAction copyWithZone:](&v7, sel_copyWithZone_, a3);
  *($C28CD4A45FD07A4F97CC9D5F91F25271 *)(*((_QWORD *)result + 2) + 112) = self->_mycaction->var19;
  mycaction = self->_mycaction;
  v6 = *((_QWORD *)result + 2);
  *(float *)(v6 + 128) = mycaction->var20;
  *(_BYTE *)(v6 + 196) = BYTE4(mycaction[1].var3);
  return result;
}

- (id)reversedAction
{
  uint64_t v3;
  _QWORD *v4;
  SKCColorize *mycaction;
  char v6;
  float v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  objc_super v13;

  v3 = MEMORY[0x1DF0CF2F0](self, a2);
  v13.receiver = self;
  v13.super_class = (Class)SKColorize;
  v4 = -[SKAction copyWithZone:](&v13, sel_copyWithZone_, v3);
  mycaction = self->_mycaction;
  v6 = BYTE4(mycaction[1].var3);
  if (v6)
  {
    v7 = 0.0;
    v8 = 1.0;
    v9 = 1.0;
    v10 = 1.0;
  }
  else
  {
    v8 = 1.0 - mycaction->var19.var0;
    v9 = 1.0 - mycaction->var19.var1;
    v10 = 1.0 - mycaction->var19.var2;
    v7 = 1.0 - mycaction->var19.var3;
  }
  v11 = v4[2];
  *(float *)(v11 + 112) = v8;
  *(float *)(v11 + 116) = v9;
  *(float *)(v11 + 120) = v10;
  *(float *)(v11 + 124) = v7;
  *(float *)(v11 + 128) = 1.0 - mycaction->var20;
  *(_BYTE *)(v11 + 196) = v6;
  return v4;
}

@end
