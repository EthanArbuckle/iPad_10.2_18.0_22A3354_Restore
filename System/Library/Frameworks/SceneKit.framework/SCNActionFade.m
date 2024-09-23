@implementation SCNActionFade

- (SCNActionFade)init
{
  SCNActionFade *v2;
  uint64_t v3;
  const SCNCAction *v4;
  SCNCActionFade *mycaction;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNActionFade;
  v2 = -[SCNAction init](&v9, sel_init);
  if (v2)
  {
    v3 = operator new();
    v8.receiver = v2;
    v8.super_class = (Class)SCNActionFade;
    v4 = -[SCNAction caction](&v8, sel_caction);
    SCNCAction::SCNCAction((SCNCAction *)v3, v4);
    *(_QWORD *)(v3 + 144) = 0;
    *(_QWORD *)(v3 + 149) = 0;
    v2->_mycaction = (SCNCActionFade *)v3;
    *(_QWORD *)v3 = &off_1EA5957B0;
    v7.receiver = v2;
    v7.super_class = (Class)SCNActionFade;
    -[SCNAction setCppAction:](&v7, sel_setCppAction_, v3);
    mycaction = v2->_mycaction;
    *(_QWORD *)&mycaction->var19 = 1065353216;
    mycaction->var22 = 1;
  }
  return v2;
}

- (SCNActionFade)initWithCoder:(id)a3
{
  SCNActionFade *v4;
  uint64_t v5;
  const SCNCAction *v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SCNActionFade;
  v4 = -[SCNAction initWithCoder:](&v13, sel_initWithCoder_);
  if (v4)
  {
    v5 = operator new();
    v12.receiver = v4;
    v12.super_class = (Class)SCNActionFade;
    v6 = -[SCNAction caction](&v12, sel_caction);
    SCNCAction::SCNCAction((SCNCAction *)v5, v6);
    *(_QWORD *)(v5 + 144) = 0;
    *(_QWORD *)(v5 + 149) = 0;
    v4->_mycaction = (SCNCActionFade *)v5;
    *(_QWORD *)v5 = &off_1EA5957B0;
    v11.receiver = v4;
    v11.super_class = (Class)SCNActionFade;
    -[SCNAction setCppAction:](&v11, sel_setCppAction_, v5);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_opacityTarget")), "doubleValue");
    *(float *)&v7 = v7;
    v4->_mycaction->var19 = *(float *)&v7;
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_opacityTargetReversed")), "doubleValue");
    *(float *)&v8 = v8;
    v4->_mycaction->var20 = *(float *)&v8;
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastOpacity")), "doubleValue");
    *(float *)&v9 = v9;
    v4->_mycaction->var21 = *(float *)&v9;
    v4->_mycaction->var22 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isRelative")), "BOOLValue");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNActionFade;
  -[SCNAction encodeWithCoder:](&v6, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19), CFSTR("_opacityTarget"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var20), CFSTR("_opacityTargetReversed"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var21), CFSTR("_lastOpacity"));
  v5 = 0.0;
  if (self->_mycaction->var22)
    v5 = 1.0;
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5), CFSTR("_isRelative"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

+ (id)fadeOpacityBy:(double)a3 duration:(double)a4
{
  SCNActionFade *v6;
  SCNActionFade *v7;
  float v8;
  SCNCActionFade *mycaction;
  float v10;
  BOOL v11;
  float v12;

  v6 = objc_alloc_init(SCNActionFade);
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
  -[SCNAction setDuration:](v6, "setDuration:", a4);
  return v7;
}

+ (id)fadeOpacityTo:(double)a3 duration:(double)a4
{
  SCNActionFade *v6;
  SCNCActionFade *mycaction;
  float v8;

  v6 = objc_alloc_init(SCNActionFade);
  mycaction = v6->_mycaction;
  v8 = a3;
  mycaction->var19 = v8;
  mycaction->var20 = v8;
  mycaction->var22 = 0;
  -[SCNAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

+ (id)fadeInWithDuration:(double)a3
{
  SCNActionFade *v4;
  SCNCActionFade *mycaction;

  v4 = objc_alloc_init(SCNActionFade);
  mycaction = v4->_mycaction;
  *(_QWORD *)&mycaction->var19 = 1065353216;
  mycaction->var22 = 0;
  -[SCNAction setDuration:](v4, "setDuration:", a3);
  return v4;
}

+ (id)fadeOutWithDuration:(double)a3
{
  SCNActionFade *v4;
  SCNCActionFade *mycaction;

  v4 = objc_alloc_init(SCNActionFade);
  mycaction = v4->_mycaction;
  *(_QWORD *)&mycaction->var19 = 0x3F80000000000000;
  mycaction->var22 = 0;
  -[SCNAction setDuration:](v4, "setDuration:", a3);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  SCNCActionFade *mycaction;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNActionFade;
  v4 = -[SCNAction copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SCNAction duration](self, "duration");
  objc_msgSend(v4, "setDuration:");
  mycaction = self->_mycaction;
  v6 = v4[2];
  *(_QWORD *)(v6 + 144) = *(_QWORD *)&mycaction->var19;
  *(_BYTE *)(v6 + 156) = mycaction->var22;
  return v4;
}

- (id)reversedAction
{
  id result;
  SCNCActionFade *mycaction;
  uint64_t v5;

  result = objc_alloc_init(SCNActionFade);
  mycaction = self->_mycaction;
  v5 = *((_QWORD *)result + 2);
  *(_BYTE *)(v5 + 156) = mycaction->var22;
  *(float *)(v5 + 144) = mycaction->var20;
  *(float *)(v5 + 148) = mycaction->var19;
  *(double *)(v5 + 64) = mycaction->var8;
  return result;
}

@end
