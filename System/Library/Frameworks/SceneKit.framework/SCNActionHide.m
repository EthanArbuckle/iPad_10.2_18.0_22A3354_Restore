@implementation SCNActionHide

- (SCNActionHide)init
{
  SCNActionHide *v2;
  uint64_t v3;
  const SCNCAction *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNActionHide;
  v2 = -[SCNAction init](&v8, sel_init);
  if (v2)
  {
    v3 = operator new();
    v7.receiver = v2;
    v7.super_class = (Class)SCNActionHide;
    v4 = -[SCNAction caction](&v7, sel_caction);
    SCNCAction::SCNCAction((SCNCAction *)v3, v4);
    *(_QWORD *)v3 = &off_1EA595848;
    v2->_mycaction = (SCNCActionHide *)v3;
    *(_BYTE *)(v3 + 144) = 1;
    v6.receiver = v2;
    v6.super_class = (Class)SCNActionHide;
    -[SCNAction setCppAction:](&v6, sel_setCppAction_, v3);
    v2->_mycaction->var19 = 1;
  }
  return v2;
}

- (SCNActionHide)initWithCoder:(id)a3
{
  SCNActionHide *v4;
  uint64_t v5;
  const SCNCAction *v6;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNActionHide;
  v4 = -[SCNAction initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    v5 = operator new();
    v9.receiver = v4;
    v9.super_class = (Class)SCNActionHide;
    v6 = -[SCNAction caction](&v9, sel_caction);
    SCNCAction::SCNCAction((SCNCAction *)v5, v6);
    *(_QWORD *)v5 = &off_1EA595848;
    v4->_mycaction = (SCNCActionHide *)v5;
    *(_BYTE *)(v5 + 144) = 1;
    v8.receiver = v4;
    v8.super_class = (Class)SCNActionHide;
    -[SCNAction setCppAction:](&v8, sel_setCppAction_, v5);
    v4->_mycaction->var19 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_hide"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNActionHide;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeBool:forKey:", self->_mycaction->var19, CFSTR("_hide"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)hide
{
  SCNActionHide *v2;

  v2 = objc_alloc_init(SCNActionHide);
  v2->_mycaction->var19 = 1;
  -[SCNAction setDuration:](v2, "setDuration:", 0.0);
  return v2;
}

+ (id)unhide
{
  SCNActionHide *v2;

  v2 = objc_alloc_init(SCNActionHide);
  v2->_mycaction->var19 = 0;
  -[SCNAction setDuration:](v2, "setDuration:", 0.0);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNActionHide;
  v4 = -[SCNAction copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[SCNAction duration](self, "duration");
  objc_msgSend(v4, "setDuration:");
  *(_BYTE *)(v4[2] + 144) = self->_mycaction->var19;
  return v4;
}

- (id)reversedAction
{
  id result;
  SCNCActionHide *mycaction;
  uint64_t v5;

  result = objc_alloc_init(SCNActionHide);
  mycaction = self->_mycaction;
  v5 = *((_QWORD *)result + 2);
  *(_BYTE *)(v5 + 144) = !mycaction->var19;
  *(double *)(v5 + 64) = mycaction->var8;
  return result;
}

- (id)parameters
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mycaction->var19);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

@end
