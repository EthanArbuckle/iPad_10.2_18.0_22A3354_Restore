@implementation SCNActionPlaySound

- (SCNActionPlaySound)init
{
  SCNActionPlaySound *v2;
  SCNCPlaySound *v3;
  SCNCAction *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNActionPlaySound;
  v2 = -[SCNAction init](&v8, sel_init);
  if (v2)
  {
    v3 = (SCNCPlaySound *)operator new();
    v7.receiver = v2;
    v7.super_class = (Class)SCNActionPlaySound;
    v4 = -[SCNAction caction](&v7, sel_caction);
    SCNCPlaySound::SCNCPlaySound(v3, v4);
    v2->_mycaction = v3;
    v6.receiver = v2;
    v6.super_class = (Class)SCNActionPlaySound;
    -[SCNAction setCppAction:](&v6, sel_setCppAction_, v3);
  }
  return v2;
}

- (void)_setupDuration
{
  SCNCPlaySound *mycaction;
  double v4;

  mycaction = self->_mycaction;
  if (mycaction->var20)
    objc_msgSend(mycaction->var21, "duration");
  else
    v4 = 0.0;
  -[SCNAction setDuration:](self, "setDuration:", v4);
}

- (SCNActionPlaySound)initWithCoder:(id)a3
{
  SCNActionPlaySound *v4;
  SCNCPlaySound *v5;
  SCNCAction *v6;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNActionPlaySound;
  v4 = -[SCNAction initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    v5 = (SCNCPlaySound *)operator new();
    v9.receiver = v4;
    v9.super_class = (Class)SCNActionPlaySound;
    v6 = -[SCNAction caction](&v9, sel_caction);
    SCNCPlaySound::SCNCPlaySound(v5, v6);
    v4->_mycaction = v5;
    v8.receiver = v4;
    v8.super_class = (Class)SCNActionPlaySound;
    -[SCNAction setCppAction:](&v8, sel_setCppAction_, v5);
    v4->_mycaction->var21 = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_audioSource"));
    v4->_mycaction->var20 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_wait"));
    -[SCNActionPlaySound _setupDuration](v4, "_setupDuration");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNActionPlaySound;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_mycaction->var21, CFSTR("_audioSource"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_mycaction->var20, CFSTR("_wait"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)playAudioSource:(id)a3 waitForCompletion:(BOOL)a4
{
  SCNActionPlaySound *v6;
  uint64_t v7;
  SCNCPlaySound *mycaction;

  v6 = objc_alloc_init(SCNActionPlaySound);
  v7 = objc_msgSend(a3, "copy");
  mycaction = v6->_mycaction;
  mycaction->var21 = (id)v7;
  mycaction->var20 = a4;
  -[SCNActionPlaySound _setupDuration](v6, "_setupDuration");
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNActionPlaySound;
  v4 = -[SCNAction copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = self->_mycaction->var21;
  v6 = v4[2];
  *(_QWORD *)(v6 + 152) = v5;
  *(_BYTE *)(v6 + 145) = self->_mycaction->var20;
  objc_msgSend(v4, "_setupDuration");
  return v4;
}

- (id)reversedAction
{
  return -[SCNAction copy](self, "copy");
}

- (id)parameters
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(self->_mycaction->var21, "fileName");
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var20);
  if (v3)
  {
    v10[0] = v4;
    v10[1] = objc_msgSend(self->_mycaction->var21, "fileName");
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = v10;
    v7 = 2;
  }
  else
  {
    v9 = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v9;
    v7 = 1;
  }
  return (id)objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v9);
}

@end
