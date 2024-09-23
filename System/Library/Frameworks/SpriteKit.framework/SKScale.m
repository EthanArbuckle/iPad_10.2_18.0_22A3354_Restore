@implementation SKScale

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKScale)init
{
  SKScale *v2;
  SKCScale *v3;
  SKCAction *v4;
  SKCScale *mycaction;
  objc_super v12;
  objc_super v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SKScale;
  v2 = -[SKAction init](&v14, sel_init);
  if (v2)
  {
    v3 = (SKCScale *)operator new();
    v13.receiver = v2;
    v13.super_class = (Class)SKScale;
    v4 = -[SKAction caction](&v13, sel_caction);
    SKCScale::SKCScale(v3, v4);
    v2->_mycaction = v3;
    v12.receiver = v2;
    v12.super_class = (Class)SKScale;
    -[SKAction setCppAction:](&v12, sel_setCppAction_, v3);
    mycaction = v2->_mycaction;
    mycaction->var23 = 0.0;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)&mycaction->var19 = _Q0;
    *(_QWORD *)&mycaction->var26 = 0;
    mycaction->var28 = 0;
    *(_DWORD *)&mycaction->var29 = 65793;
    mycaction->var33 = (CGSize)vdupq_n_s64(0x4059000000000000uLL);
  }
  return v2;
}

- (SKScale)initWithCoder:(id)a3
{
  id v4;
  SKScale *v5;
  SKCScale *v6;
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
  void *v26;
  SKCScale *mycaction;
  CGFloat v28;
  CGFloat v29;
  objc_super v31;
  objc_super v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SKScale;
  v5 = -[SKAction initWithCoder:](&v33, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (SKCScale *)operator new();
    v32.receiver = v5;
    v32.super_class = (Class)SKScale;
    v7 = -[SKAction caction](&v32, sel_caction);
    SKCScale::SKCScale(v6, v7);
    v5->_mycaction = v6;
    v31.receiver = v5;
    v31.super_class = (Class)SKScale;
    -[SKAction setCppAction:](&v31, sel_setCppAction_, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastRatio"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    *(float *)&v9 = v9;
    v5->_mycaction->var23 = *(float *)&v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scaleTargetX"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    *(float *)&v11 = v11;
    v5->_mycaction->var19 = *(float *)&v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scaleTargetY"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    *(float *)&v13 = v13;
    v5->_mycaction->var20 = *(float *)&v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scaleTargetReversedX"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    *(float *)&v15 = v15;
    v5->_mycaction->var21 = *(float *)&v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scaleTargetReversedY"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    *(float *)&v17 = v17;
    v5->_mycaction->var22 = *(float *)&v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deltaScaleX"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    *(float *)&v19 = v19;
    v5->_mycaction->var26 = *(float *)&v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deltaScaleY"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    *(float *)&v21 = v21;
    v5->_mycaction->var27 = *(float *)&v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isReversed"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var28 = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isRelative"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var29 = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_useX"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var30 = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_useY"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var31 = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isTargetSizeBased"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var32 = objc_msgSend(v26, "BOOLValue");

    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("_targetSize"));
    mycaction = v5->_mycaction;
    mycaction->var33.width = v28;
    mycaction->var33.height = v29;
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
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKScale;
  -[SKAction encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_lastRatio"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_scaleTargetX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_scaleTargetY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_scaleTargetReversedX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_scaleTargetReversedY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_deltaScaleX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("_deltaScaleY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("_isReversed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("_isRelative"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("_useX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var31);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("_useY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("_isTargetSizeBased"));

  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("_targetSize"), self->_mycaction->var33.width, self->_mycaction->var33.height);
}

+ (id)scaleBy:(double)a3 duration:(double)a4
{
  return +[SKScale scaleXBy:y:duration:](SKScale, "scaleXBy:y:duration:", a3, a3, a4);
}

+ (id)scaleXBy:(double)a3 y:(double)a4 duration:(double)a5
{
  SKScale *v8;
  SKScale *v9;
  float v10;
  SKCScale *mycaction;
  float v12;
  float v13;
  float v14;
  float v15;

  v8 = objc_alloc_init(SKScale);
  v9 = v8;
  v10 = a3;
  mycaction = v8->_mycaction;
  v12 = a4;
  mycaction->var19 = v10;
  mycaction->var20 = v12;
  v13 = v10;
  v14 = 0.0;
  v15 = 0.0;
  if ((LODWORD(v13) & 0x60000000) != 0)
    v15 = 1.0 / a3;
  mycaction->var21 = v15;
  if ((LODWORD(v12) & 0x60000000) != 0)
    v14 = 1.0 / a4;
  mycaction->var22 = v14;
  *(_WORD *)&mycaction->var29 = 257;
  mycaction->var31 = 1;
  -[SKAction setDuration:](v8, "setDuration:", a5);
  return v9;
}

+ (id)scaleXBy:(double)a3 duration:(double)a4
{
  SKScale *v6;
  SKScale *v7;
  SKCScale *mycaction;
  float v9;
  float v10;

  v6 = objc_alloc_init(SKScale);
  v7 = v6;
  mycaction = v6->_mycaction;
  v9 = a3;
  mycaction->var19 = v9;
  mycaction->var20 = 1.0;
  if ((LODWORD(v9) & 0x60000000) != 0)
    v10 = 1.0 / a3;
  else
    v10 = 0.0;
  mycaction->var21 = v10;
  mycaction->var22 = 1.0;
  *(_WORD *)&mycaction->var29 = 257;
  mycaction->var31 = 0;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v7;
}

+ (id)scaleYBy:(double)a3 duration:(double)a4
{
  SKScale *v6;
  SKScale *v7;
  SKCScale *mycaction;
  float v9;
  float v10;

  v6 = objc_alloc_init(SKScale);
  v7 = v6;
  mycaction = v6->_mycaction;
  mycaction->var19 = 1.0;
  v9 = a3;
  mycaction->var20 = v9;
  if ((LODWORD(v9) & 0x60000000) != 0)
    v10 = 1.0 / a3;
  else
    v10 = 0.0;
  mycaction->var22 = v10;
  mycaction->var21 = 1.0;
  *(_WORD *)&mycaction->var29 = 1;
  mycaction->var31 = 1;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v7;
}

+ (id)scaleTo:(double)a3 duration:(double)a4
{
  return +[SKScale scaleXTo:y:duration:](SKScale, "scaleXTo:y:duration:", a3, a3, a4);
}

+ (id)scaleToSize:(CGSize)a3 duration:(double)a4
{
  CGFloat height;
  CGFloat width;
  SKScale *v7;
  SKCScale *mycaction;

  height = a3.height;
  width = a3.width;
  v7 = objc_alloc_init(SKScale);
  mycaction = v7->_mycaction;
  __asm { FMOV            V0.4S, #1.0 }
  *(_OWORD *)&mycaction->var19 = _Q0;
  *(_DWORD *)&mycaction->var29 = 16843008;
  mycaction->var33.width = width;
  mycaction->var33.height = height;
  -[SKAction setDuration:](v7, "setDuration:", a4);
  return v7;
}

+ (id)scaleXTo:(double)a3 y:(double)a4 duration:(double)a5
{
  SKScale *v8;
  float v9;
  SKCScale *mycaction;
  float v11;

  v8 = objc_alloc_init(SKScale);
  v9 = a3;
  mycaction = v8->_mycaction;
  v11 = a4;
  mycaction->var19 = v9;
  mycaction->var20 = v11;
  mycaction->var21 = v9;
  mycaction->var22 = v11;
  *(_WORD *)&mycaction->var29 = 256;
  mycaction->var31 = 1;
  -[SKAction setDuration:](v8, "setDuration:", a5);
  return v8;
}

+ (id)scaleXTo:(double)a3 duration:(double)a4
{
  SKScale *v6;
  SKCScale *mycaction;
  float v8;

  v6 = objc_alloc_init(SKScale);
  mycaction = v6->_mycaction;
  v8 = a3;
  mycaction->var19 = v8;
  mycaction->var20 = 1.0;
  mycaction->var21 = v8;
  mycaction->var22 = 1.0;
  *(_WORD *)&mycaction->var29 = 256;
  mycaction->var31 = 0;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

+ (id)scaleYTo:(double)a3 duration:(double)a4
{
  SKScale *v6;
  SKCScale *mycaction;
  float v8;

  v6 = objc_alloc_init(SKScale);
  mycaction = v6->_mycaction;
  mycaction->var19 = 1.0;
  v8 = a3;
  mycaction->var20 = v8;
  mycaction->var21 = 1.0;
  mycaction->var22 = v8;
  *(_WORD *)&mycaction->var29 = 0;
  mycaction->var31 = 1;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  SKCScale *mycaction;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKScale;
  result = -[SKAction copyWithZone:](&v7, sel_copyWithZone_, a3);
  mycaction = self->_mycaction;
  v6 = *((_QWORD *)result + 2);
  *(float *)(v6 + 128) = mycaction->var23;
  *(_OWORD *)(v6 + 112) = *(_OWORD *)&mycaction->var19;
  *(_QWORD *)(v6 + 140) = *(_QWORD *)&mycaction->var26;
  *(_DWORD *)(v6 + 148) = *(_DWORD *)&mycaction->var28;
  *(_BYTE *)(v6 + 152) = mycaction->var32;
  *(CGSize *)(v6 + 160) = mycaction->var33;
  return result;
}

- (id)reversedAction
{
  uint64_t v3;
  _QWORD *v4;
  SKCScale *mycaction;
  uint64_t v6;
  objc_super v8;

  v3 = MEMORY[0x1DF0CF2F0](self, a2);
  v8.receiver = self;
  v8.super_class = (Class)SKScale;
  v4 = -[SKAction copyWithZone:](&v8, sel_copyWithZone_, v3);
  mycaction = self->_mycaction;
  v6 = v4[2];
  *(float *)(v6 + 128) = mycaction->var23;
  *(_QWORD *)(v6 + 112) = *(_QWORD *)&mycaction->var21;
  *(_QWORD *)(v6 + 120) = *(_QWORD *)&mycaction->var19;
  *(_QWORD *)(v6 + 140) = *(_QWORD *)&mycaction->var26;
  *(_BYTE *)(v6 + 148) = !mycaction->var28;
  *(_DWORD *)(v6 + 149) = *(_DWORD *)&mycaction->var29;
  *(CGSize *)(v6 + 160) = mycaction->var33;
  return v4;
}

@end
