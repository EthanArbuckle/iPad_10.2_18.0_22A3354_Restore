@implementation SKRotate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRotate)init
{
  SKRotate *v2;
  SKCRotate *v3;
  SKCAction *v4;
  SKCRotate *mycaction;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKRotate;
  v2 = -[SKAction init](&v9, sel_init);
  if (v2)
  {
    v3 = (SKCRotate *)operator new();
    v8.receiver = v2;
    v8.super_class = (Class)SKRotate;
    v4 = -[SKAction caction](&v8, sel_caction);
    SKCRotate::SKCRotate(v3, v4);
    v2->_mycaction = v3;
    v7.receiver = v2;
    v7.super_class = (Class)SKRotate;
    -[SKAction setCppAction:](&v7, sel_setCppAction_, v3);
    mycaction = v2->_mycaction;
    *(_QWORD *)&mycaction->var19 = 0;
    mycaction->var21 = 0.0;
    *(_QWORD *)&mycaction->var25 = 0;
    *(_QWORD *)&mycaction->var27 = 0;
    mycaction->var29 = 0;
    *(_DWORD *)&mycaction->var30 = 16842753;
    mycaction->var34 = 1;
  }
  return v2;
}

- (SKRotate)initWithCoder:(id)a3
{
  id v4;
  SKRotate *v5;
  SKCRotate *v6;
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
  void *v27;
  objc_super v29;
  objc_super v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SKRotate;
  v5 = -[SKAction initWithCoder:](&v31, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (SKCRotate *)operator new();
    v30.receiver = v5;
    v30.super_class = (Class)SKRotate;
    v7 = -[SKAction caction](&v30, sel_caction);
    SKCRotate::SKCRotate(v6, v7);
    v5->_mycaction = v6;
    v29.receiver = v5;
    v29.super_class = (Class)SKRotate;
    -[SKAction setCppAction:](&v29, sel_setCppAction_, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rotX"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    *(float *)&v9 = v9;
    v5->_mycaction->var19 = *(float *)&v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rotY"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    *(float *)&v11 = v11;
    v5->_mycaction->var20 = *(float *)&v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rotZ"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    *(float *)&v13 = v13;
    v5->_mycaction->var21 = *(float *)&v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastRotX"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    *(float *)&v15 = v15;
    v5->_mycaction->var25 = *(float *)&v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastRotY"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    *(float *)&v17 = v17;
    v5->_mycaction->var26 = *(float *)&v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastRotZ"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    *(float *)&v19 = v19;
    v5->_mycaction->var27 = *(float *)&v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastRatio"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    *(float *)&v21 = v21;
    v5->_mycaction->var28 = *(float *)&v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isReversed"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var29 = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isRelative"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var30 = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isUnitArc"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var31 = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_useX"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var32 = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_useY"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var33 = objc_msgSend(v26, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_useZ"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var34 = objc_msgSend(v27, "BOOLValue");

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
  void *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SKRotate;
  -[SKAction encodeWithCoder:](&v18, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_rotX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_rotY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_rotZ"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_lastRotX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_lastRotY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_lastRotZ"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("_lastRatio"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("_isReversed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var30);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("_isRelative"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("_isUnitArc"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var32);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("_useX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var33);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("_useY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var34);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("_useZ"));

}

+ (id)rotateByAngle:(double)a3 duration:(double)a4
{
  SKRotate *v6;
  SKCRotate *mycaction;
  float v8;

  v6 = objc_alloc_init(SKRotate);
  mycaction = v6->_mycaction;
  mycaction->var30 = 1;
  v8 = a3;
  mycaction->var21 = v8;
  *(_WORD *)&mycaction->var32 = 0;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

+ (id)rotateToAngle:(double)a3 duration:(double)a4
{
  SKRotate *v6;
  SKCRotate *mycaction;
  float v8;

  v6 = objc_alloc_init(SKRotate);
  mycaction = v6->_mycaction;
  v8 = a3;
  mycaction->var21 = v8;
  *(_DWORD *)&mycaction->var30 = 0;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

+ (id)rotateToAngle:(double)a3 duration:(double)a4 shortestUnitArc:(BOOL)a5
{
  SKRotate *v8;
  SKCRotate *mycaction;
  float v10;

  v8 = objc_alloc_init(SKRotate);
  mycaction = v8->_mycaction;
  mycaction->var30 = 0;
  mycaction->var31 = a5;
  v10 = a3;
  mycaction->var21 = v10;
  *(_WORD *)&mycaction->var32 = 0;
  -[SKAction setDuration:](v8, "setDuration:", a4);
  return v8;
}

+ (id)rotateByX:(double)a3 duration:(double)a4
{
  SKRotate *v6;
  SKCRotate *mycaction;
  float v8;

  v6 = objc_alloc_init(SKRotate);
  mycaction = v6->_mycaction;
  mycaction->var30 = 1;
  v8 = a3;
  mycaction->var19 = v8;
  *(_WORD *)&mycaction->var33 = 0;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

+ (id)rotateToX:(double)a3 duration:(double)a4
{
  SKRotate *v6;
  SKCRotate *mycaction;
  float v8;

  v6 = objc_alloc_init(SKRotate);
  mycaction = v6->_mycaction;
  mycaction->var30 = 0;
  v8 = a3;
  mycaction->var19 = v8;
  *(_WORD *)&mycaction->var33 = 0;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

+ (id)rotateByY:(double)a3 duration:(double)a4
{
  SKRotate *v6;
  SKCRotate *mycaction;
  float v8;

  v6 = objc_alloc_init(SKRotate);
  mycaction = v6->_mycaction;
  mycaction->var30 = 1;
  v8 = a3;
  mycaction->var20 = v8;
  mycaction->var32 = 0;
  mycaction->var34 = 0;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

+ (id)rotateToY:(double)a3 duration:(double)a4
{
  SKRotate *v6;
  SKCRotate *mycaction;
  float v8;

  v6 = objc_alloc_init(SKRotate);
  mycaction = v6->_mycaction;
  mycaction->var30 = 0;
  v8 = a3;
  mycaction->var20 = v8;
  mycaction->var32 = 0;
  mycaction->var34 = 0;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

+ (id)rotateByX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6
{
  SKRotate *v10;
  SKCRotate *mycaction;
  float v12;
  float v13;
  float v14;

  v10 = objc_alloc_init(SKRotate);
  mycaction = v10->_mycaction;
  mycaction->var30 = 1;
  v12 = a3;
  v13 = a4;
  mycaction->var19 = v12;
  mycaction->var20 = v13;
  v14 = a5;
  mycaction->var21 = v14;
  -[SKAction setDuration:](v10, "setDuration:", a6);
  return v10;
}

+ (id)rotateToX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6
{
  SKRotate *v10;
  SKCRotate *mycaction;
  float v12;
  float v13;
  float v14;

  v10 = objc_alloc_init(SKRotate);
  mycaction = v10->_mycaction;
  mycaction->var30 = 0;
  v12 = a3;
  v13 = a4;
  mycaction->var19 = v12;
  mycaction->var20 = v13;
  v14 = a5;
  mycaction->var21 = v14;
  -[SKAction setDuration:](v10, "setDuration:", a6);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  SKCRotate *mycaction;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKRotate;
  result = -[SKAction copyWithZone:](&v7, sel_copyWithZone_, a3);
  mycaction = self->_mycaction;
  v6 = *((_QWORD *)result + 2);
  *(_QWORD *)(v6 + 112) = *(_QWORD *)&mycaction->var19;
  *(float *)(v6 + 120) = mycaction->var21;
  *(_DWORD *)(v6 + 152) = *(_DWORD *)&mycaction->var29;
  *(_WORD *)(v6 + 156) = *(_WORD *)&mycaction->var33;
  *(_QWORD *)(v6 + 56) = *(_QWORD *)&mycaction->var8;
  *(_QWORD *)(v6 + 88) = mycaction->var14;
  *(_QWORD *)(v6 + 100) = *(_QWORD *)&mycaction->var16;
  *(float *)(v6 + 148) = mycaction->var28;
  return result;
}

- (id)reversedAction
{
  uint64_t v3;
  _QWORD *v4;
  SKCRotate *mycaction;
  uint64_t v6;
  float var19;
  float32x2_t v8;
  objc_super v10;

  v3 = MEMORY[0x1DF0CF2F0](self, a2);
  v10.receiver = self;
  v10.super_class = (Class)SKRotate;
  v4 = -[SKAction copyWithZone:](&v10, sel_copyWithZone_, v3);
  mycaction = self->_mycaction;
  v6 = v4[2];
  *(_WORD *)(v6 + 153) = *(_WORD *)&mycaction->var30;
  *(_BYTE *)(v6 + 152) = !mycaction->var29;
  var19 = mycaction->var19;
  if (mycaction->var30)
  {
    var19 = -var19;
    v8 = vneg_f32(*(float32x2_t *)&mycaction->var20);
  }
  else
  {
    v8 = *(float32x2_t *)&mycaction->var20;
  }
  *(float *)(v6 + 112) = var19;
  *(float32x2_t *)(v6 + 116) = v8;
  *(_WORD *)(v6 + 155) = *(_WORD *)&mycaction->var32;
  *(_BYTE *)(v6 + 157) = mycaction->var34;
  -[SKAction duration](self, "duration");
  objc_msgSend(v4, "setDuration:");
  return v4;
}

@end
