@implementation SKFade

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKFade)init
{
  SKFade *v2;
  uint64_t v3;
  const SKCAction *v4;
  SKCFade *mycaction;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKFade;
  v2 = -[SKAction init](&v9, sel_init);
  if (v2)
  {
    v3 = operator new();
    v8.receiver = v2;
    v8.super_class = (Class)SKFade;
    v4 = -[SKAction caction](&v8, sel_caction);
    SKCAction::SKCAction((SKCAction *)v3, v4);
    *(_QWORD *)(v3 + 112) = 0;
    *(_QWORD *)(v3 + 117) = 0;
    v2->_mycaction = (SKCFade *)v3;
    *(_QWORD *)v3 = &off_1EA4FECC8;
    v7.receiver = v2;
    v7.super_class = (Class)SKFade;
    -[SKAction setCppAction:](&v7, sel_setCppAction_, v3);
    mycaction = v2->_mycaction;
    *(_QWORD *)&mycaction->var19 = 1065353216;
    mycaction->var22 = 1;
  }
  return v2;
}

- (SKFade)initWithCoder:(id)a3
{
  id v4;
  SKFade *v5;
  uint64_t v6;
  const SKCAction *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  objc_super v16;
  objc_super v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SKFade;
  v5 = -[SKAction initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = operator new();
    v17.receiver = v5;
    v17.super_class = (Class)SKFade;
    v7 = -[SKAction caction](&v17, sel_caction);
    SKCAction::SKCAction((SKCAction *)v6, v7);
    *(_QWORD *)(v6 + 112) = 0;
    *(_QWORD *)(v6 + 117) = 0;
    v5->_mycaction = (SKCFade *)v6;
    *(_QWORD *)v6 = &off_1EA4FECC8;
    v16.receiver = v5;
    v16.super_class = (Class)SKFade;
    -[SKAction setCppAction:](&v16, sel_setCppAction_, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alphaTarget"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    *(float *)&v9 = v9;
    v5->_mycaction->var19 = *(float *)&v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_alphaTargetReversed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    *(float *)&v11 = v11;
    v5->_mycaction->var20 = *(float *)&v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastAlpha"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    *(float *)&v13 = v13;
    v5->_mycaction->var21 = *(float *)&v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isRelative"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var22 = objc_msgSend(v14, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKFade;
  -[SKAction encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_alphaTarget"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_alphaTargetReversed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_lastAlpha"));

  v8 = 0.0;
  if (self->_mycaction->var22)
    v8 = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_isRelative"));

}

+ (id)fadeAlphaBy:(double)a3 duration:(double)a4
{
  SKFade *v6;
  SKFade *v7;
  float v8;
  SKCFade *mycaction;
  float v10;
  BOOL v11;
  float v12;

  v6 = objc_alloc_init(SKFade);
  v7 = v6;
  v8 = a3;
  mycaction = v6->_mycaction;
  mycaction->var19 = v8;
  v10 = -v8;
  v11 = (LODWORD(v8) & 0x60000000) == 0;
  v12 = 0.0;
  if (!v11)
    v12 = v10;
  mycaction->var20 = v12;
  mycaction->var22 = 1;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v7;
}

+ (id)fadeAlphaTo:(double)a3 duration:(double)a4
{
  SKFade *v6;
  SKCFade *mycaction;
  float v8;

  v6 = objc_alloc_init(SKFade);
  mycaction = v6->_mycaction;
  v8 = a3;
  mycaction->var19 = v8;
  mycaction->var20 = v8;
  mycaction->var22 = 0;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

+ (id)fadeInWithDuration:(double)a3
{
  SKFade *v4;
  SKCFade *mycaction;

  v4 = objc_alloc_init(SKFade);
  mycaction = v4->_mycaction;
  *(_QWORD *)&mycaction->var19 = 1065353216;
  mycaction->var22 = 0;
  -[SKAction setDuration:](v4, "setDuration:", a3);
  return v4;
}

+ (id)fadeOutWithDuration:(double)a3
{
  SKFade *v4;
  SKCFade *mycaction;

  v4 = objc_alloc_init(SKFade);
  mycaction = v4->_mycaction;
  *(_QWORD *)&mycaction->var19 = 0x3F80000000000000;
  mycaction->var22 = 0;
  -[SKAction setDuration:](v4, "setDuration:", a3);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  SKCFade *mycaction;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKFade;
  v4 = -[SKAction copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SKAction duration](self, "duration");
  objc_msgSend(v4, "setDuration:");
  mycaction = self->_mycaction;
  v6 = v4[2];
  *(_QWORD *)(v6 + 112) = *(_QWORD *)&mycaction->var19;
  *(_BYTE *)(v6 + 124) = mycaction->var22;
  return v4;
}

- (id)reversedAction
{
  SKFade *v3;
  SKCFade *mycaction;
  SKCFade *v5;

  v3 = objc_alloc_init(SKFade);
  mycaction = self->_mycaction;
  v5 = v3->_mycaction;
  v5->var22 = mycaction->var22;
  v5->var19 = mycaction->var20;
  v5->var20 = mycaction->var19;
  v5->var9 = mycaction->var9;
  return v3;
}

@end
