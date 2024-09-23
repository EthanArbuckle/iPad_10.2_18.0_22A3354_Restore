@implementation SKSpeed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKSpeed)init
{
  SKSpeed *v2;
  SKCSpeed *v3;
  SKCAction *v4;
  SKCSpeed *mycaction;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKSpeed;
  v2 = -[SKAction init](&v9, sel_init);
  if (v2)
  {
    v3 = (SKCSpeed *)operator new();
    v8.receiver = v2;
    v8.super_class = (Class)SKSpeed;
    v4 = -[SKAction caction](&v8, sel_caction);
    SKCSpeed::SKCSpeed(v3, v4);
    v2->_mycaction = v3;
    v7.receiver = v2;
    v7.super_class = (Class)SKSpeed;
    -[SKAction setCppAction:](&v7, sel_setCppAction_, v3);
    mycaction = v2->_mycaction;
    mycaction->var21 = 0.0;
    *(_QWORD *)&mycaction->var19 = 1065353216;
    mycaction->var23 = 0.0;
    *(_WORD *)&mycaction->var24 = 256;
  }
  return v2;
}

- (SKSpeed)initWithCoder:(id)a3
{
  id v4;
  SKSpeed *v5;
  SKCSpeed *v6;
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
  void *v17;
  objc_super v19;
  objc_super v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SKSpeed;
  v5 = -[SKAction initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (SKCSpeed *)operator new();
    v20.receiver = v5;
    v20.super_class = (Class)SKSpeed;
    v7 = -[SKAction caction](&v20, sel_caction);
    SKCSpeed::SKCSpeed(v6, v7);
    v5->_mycaction = v6;
    v19.receiver = v5;
    v19.super_class = (Class)SKSpeed;
    -[SKAction setCppAction:](&v19, sel_setCppAction_, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_speedTarget"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    *(float *)&v9 = v9;
    v5->_mycaction->var19 = *(float *)&v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_speedTargetReversed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    *(float *)&v11 = v11;
    v5->_mycaction->var20 = *(float *)&v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deltaSpeed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    *(float *)&v13 = v13;
    v5->_mycaction->var23 = *(float *)&v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastRatio"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    *(float *)&v15 = v15;
    v5->_mycaction->var21 = *(float *)&v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isReversed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var24 = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isRelative"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var25 = objc_msgSend(v17, "BOOLValue");

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
  double v9;
  void *v10;
  double v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKSpeed;
  -[SKAction encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_speedTarget"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_speedTargetReversed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_deltaSpeed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_lastRatio"));

  v9 = 0.0;
  if (self->_mycaction->var24)
    v9 = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_isReversed"));

  v11 = 0.0;
  if (self->_mycaction->var25)
    v11 = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("_isRelative"));

}

+ (id)speedBy:(double)a3 duration:(double)a4
{
  SKSpeed *v6;
  SKSpeed *v7;
  float v8;
  SKCSpeed *mycaction;
  float v10;

  v6 = objc_alloc_init(SKSpeed);
  v7 = v6;
  v8 = a3;
  mycaction = v6->_mycaction;
  mycaction->var19 = v8;
  if ((LODWORD(v8) & 0x60000000) != 0)
    v10 = 1.0 / a3;
  else
    v10 = 0.0;
  mycaction->var20 = v10;
  mycaction->var25 = 1;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v7;
}

+ (id)speedTo:(double)a3 duration:(double)a4
{
  SKSpeed *v6;
  SKCSpeed *mycaction;
  float v8;

  v6 = objc_alloc_init(SKSpeed);
  mycaction = v6->_mycaction;
  v8 = a3;
  mycaction->var19 = v8;
  mycaction->var20 = v8;
  mycaction->var25 = 0;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  SKCSpeed *mycaction;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKSpeed;
  result = -[SKAction copyWithZone:](&v7, sel_copyWithZone_, a3);
  mycaction = self->_mycaction;
  v6 = *((_QWORD *)result + 2);
  *(float *)(v6 + 120) = mycaction->var21;
  *(float *)(v6 + 128) = mycaction->var23;
  *(_QWORD *)(v6 + 112) = *(_QWORD *)&mycaction->var19;
  *(_WORD *)(v6 + 132) = *(_WORD *)&mycaction->var24;
  return result;
}

- (id)reversedAction
{
  SKSpeed *v3;
  SKCSpeed *mycaction;
  SKCSpeed *v5;
  float var21;

  v3 = objc_alloc_init(SKSpeed);
  mycaction = self->_mycaction;
  v5 = v3->_mycaction;
  v5->var24 = !mycaction->var24;
  v5->var25 = mycaction->var25;
  var21 = mycaction->var21;
  v5->var19 = mycaction->var20;
  v5->var20 = mycaction->var19;
  v5->var21 = var21;
  v5->var9 = mycaction->var9;
  return v3;
}

@end
