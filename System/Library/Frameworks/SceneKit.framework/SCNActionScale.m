@implementation SCNActionScale

- (SCNActionScale)init
{
  SCNActionScale *v2;
  SCNCActionScale *v3;
  SCNCAction *v4;
  SCNCActionScale *mycaction;
  objc_super v12;
  objc_super v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SCNActionScale;
  v2 = -[SCNAction init](&v14, sel_init);
  if (v2)
  {
    v3 = (SCNCActionScale *)operator new();
    v13.receiver = v2;
    v13.super_class = (Class)SCNActionScale;
    v4 = -[SCNAction caction](&v13, sel_caction);
    SCNCActionScale::SCNCActionScale(v3, v4);
    v2->_mycaction = v3;
    v12.receiver = v2;
    v12.super_class = (Class)SCNActionScale;
    -[SCNAction setCppAction:](&v12, sel_setCppAction_, v3);
    mycaction = v2->_mycaction;
    mycaction->var21 = 0.0;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&mycaction->var19 = _D0;
    mycaction->var23 = 0.0;
    *(_WORD *)&mycaction->var24 = 256;
  }
  return v2;
}

- (SCNActionScale)initWithCoder:(id)a3
{
  SCNActionScale *v4;
  SCNCActionScale *v5;
  SCNCAction *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;
  objc_super v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SCNActionScale;
  v4 = -[SCNAction initWithCoder:](&v14, sel_initWithCoder_);
  if (v4)
  {
    v5 = (SCNCActionScale *)operator new();
    v13.receiver = v4;
    v13.super_class = (Class)SCNActionScale;
    v6 = -[SCNAction caction](&v13, sel_caction);
    SCNCActionScale::SCNCActionScale(v5, v6);
    v4->_mycaction = v5;
    v12.receiver = v4;
    v12.super_class = (Class)SCNActionScale;
    -[SCNAction setCppAction:](&v12, sel_setCppAction_, v5);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastRatio")), "doubleValue");
    *(float *)&v7 = v7;
    v4->_mycaction->var21 = *(float *)&v7;
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scaleTarget")), "doubleValue");
    *(float *)&v8 = v8;
    v4->_mycaction->var19 = *(float *)&v8;
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scaleTargetReversed")), "doubleValue");
    *(float *)&v9 = v9;
    v4->_mycaction->var20 = *(float *)&v9;
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deltaScale")), "doubleValue");
    *(float *)&v10 = v10;
    v4->_mycaction->var23 = *(float *)&v10;
    v4->_mycaction->var24 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isReversed")), "BOOLValue");
    v4->_mycaction->var25 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isRelative")), "BOOLValue");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNActionScale;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var21), CFSTR("_lastRatio"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19), CFSTR("_scaleTarget"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var20), CFSTR("_scaleTargetReversed"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var23), CFSTR("_deltaScale"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var24), CFSTR("_isReversed"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var25), CFSTR("_isRelative"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)scaleBy:(double)a3 duration:(double)a4
{
  SCNActionScale *v6;
  SCNActionScale *v7;
  float v8;
  SCNCActionScale *mycaction;
  float v10;

  v6 = objc_alloc_init(SCNActionScale);
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
  -[SCNAction setDuration:](v6, "setDuration:", a4);
  return v7;
}

+ (id)scaleTo:(double)a3 duration:(double)a4
{
  SCNActionScale *v6;
  SCNCActionScale *mycaction;
  float v8;

  v6 = objc_alloc_init(SCNActionScale);
  mycaction = v6->_mycaction;
  v8 = a3;
  mycaction->var19 = v8;
  mycaction->var20 = v8;
  mycaction->var25 = 0;
  -[SCNAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  SCNCActionScale *mycaction;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNActionScale;
  result = -[SCNAction copyWithZone:](&v7, sel_copyWithZone_, a3);
  mycaction = self->_mycaction;
  v6 = *((_QWORD *)result + 2);
  *(float *)(v6 + 152) = mycaction->var21;
  *(_QWORD *)(v6 + 144) = *(_QWORD *)&mycaction->var19;
  *(float *)(v6 + 160) = mycaction->var23;
  *(_WORD *)(v6 + 164) = *(_WORD *)&mycaction->var24;
  return result;
}

- (id)reversedAction
{
  uint64_t v3;
  _QWORD *v4;
  SCNCActionScale *mycaction;
  uint64_t v6;
  float var21;
  objc_super v9;

  v3 = MEMORY[0x1DF0D3F5C](self, a2);
  v9.receiver = self;
  v9.super_class = (Class)SCNActionScale;
  v4 = -[SCNAction copyWithZone:](&v9, sel_copyWithZone_, v3);
  mycaction = self->_mycaction;
  v6 = v4[2];
  var21 = mycaction->var21;
  *(float *)(v6 + 144) = mycaction->var20;
  *(float *)(v6 + 148) = mycaction->var19;
  *(float *)(v6 + 152) = var21;
  *(float *)(v6 + 160) = mycaction->var23;
  *(_BYTE *)(v6 + 164) = !mycaction->var24;
  *(_BYTE *)(v6 + 165) = mycaction->var25;
  return v4;
}

- (id)parameters
{
  double v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  *(float *)&v2 = self->_mycaction->var19;
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
}

- (BOOL)isRelative
{
  return self->_mycaction->var25;
}

@end
