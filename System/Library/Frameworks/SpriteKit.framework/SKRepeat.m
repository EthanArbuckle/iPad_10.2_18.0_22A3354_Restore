@implementation SKRepeat

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRepeat)init
{
  SKRepeat *v2;
  uint64_t v3;
  const SKCAction *v4;
  SKAction *repeatedAction;
  SKCRepeat *mycaction;
  SKCAction *var19;
  int v8;
  SKCRepeat *v9;
  objc_super v11;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SKRepeat;
  v2 = -[SKAction init](&v13, sel_init);
  if (v2)
  {
    v3 = operator new();
    v12.receiver = v2;
    v12.super_class = (Class)SKRepeat;
    v4 = -[SKAction caction](&v12, sel_caction);
    SKCAction::SKCAction((SKCAction *)v3, v4);
    *(_QWORD *)(v3 + 120) = 0;
    *(_QWORD *)(v3 + 128) = 0;
    *(_QWORD *)(v3 + 112) = 0;
    *(_BYTE *)(v3 + 136) = 0;
    v2->_mycaction = (SKCRepeat *)v3;
    *(_QWORD *)v3 = &off_1EA4FF150;
    v11.receiver = v2;
    v11.super_class = (Class)SKRepeat;
    -[SKAction setCppAction:](&v11, sel_setCppAction_, v3);
    repeatedAction = v2->_repeatedAction;
    v2->_repeatedAction = 0;

    mycaction = v2->_mycaction;
    var19 = mycaction->var19;
    if (var19)
    {
      v8 = var19->var1 - 1;
      var19->var1 = v8;
      if (!v8)
        (*((void (**)(SKCAction *))var19->var0 + 1))(var19);
    }
    mycaction->var19 = 0;
    v9 = v2->_mycaction;
    v9->var20 = 0;
    v9->var21 = 0;
    v9->var22 = 0;
  }
  return v2;
}

- (SKRepeat)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  const SKCAction *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  SKRepeat *v14;
  objc_super v16;
  objc_super v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SKRepeat;
  v5 = -[SKAction initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = operator new();
    v17.receiver = v5;
    v17.super_class = (Class)SKRepeat;
    v7 = -[SKAction caction](&v17, sel_caction);
    SKCAction::SKCAction((SKCAction *)v6, v7);
    *(_QWORD *)(v6 + 120) = 0;
    *(_QWORD *)(v6 + 128) = 0;
    *(_QWORD *)(v6 + 112) = 0;
    *(_BYTE *)(v6 + 136) = 0;
    *((_QWORD *)v5 + 2) = v6;
    *(_QWORD *)v6 = &off_1EA4FF150;
    v16.receiver = v5;
    v16.super_class = (Class)SKRepeat;
    -[SKAction setCppAction:](&v16, sel_setCppAction_, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timesToRepeat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*((_QWORD *)v5 + 2) + 128) = objc_msgSend(v8, "unsignedIntValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timesRepeated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*((_QWORD *)v5 + 2) + 120) = objc_msgSend(v9, "unsignedIntValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_repeatedAction"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v10;

    v12 = (void *)*((_QWORD *)v5 + 3);
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Nil Action"), CFSTR("Action to be repeated must be non-nil"));
      v14 = 0;
      goto LABEL_6;
    }
    SKCReferencedAction::setReferencedCAction(*((SKCReferencedAction **)v5 + 2), (SKCAction *)objc_msgSend(v12, "caction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_forever"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*((_QWORD *)v5 + 2) + 136) = objc_msgSend(v13, "BOOLValue");

  }
  v14 = (SKRepeat *)v5;
LABEL_6:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKRepeat;
  -[SKAction encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mycaction->var21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_timesToRepeat"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mycaction->var20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_timesRepeated"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_repeatedAction, CFSTR("_repeatedAction"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_forever"));

}

+ (id)repeatAction:(id)a3 count:(unint64_t)a4
{
  id v5;
  SKRepeat *v6;
  uint64_t v7;
  SKAction *repeatedAction;
  double v9;

  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(SKRepeat);
    v7 = objc_msgSend(v5, "copy");
    repeatedAction = v6->_repeatedAction;
    v6->_repeatedAction = (SKAction *)v7;

    SKCReferencedAction::setReferencedCAction((SKCReferencedAction *)v6->_mycaction, -[SKAction caction](v6->_repeatedAction, "caction"));
    v6->_mycaction->var21 = a4;
    objc_msgSend(v5, "duration");
    -[SKAction setDuration:](v6, "setDuration:", v9 * (double)a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Nil Action"), CFSTR("Action to be repeated must be non-nil"));
    v6 = 0;
  }

  return v6;
}

+ (id)repeatActionForever:(id)a3
{
  id v3;
  SKRepeat *v4;
  uint64_t v5;
  SKAction *repeatedAction;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SKRepeat);
    v5 = objc_msgSend(v3, "copy");
    repeatedAction = v4->_repeatedAction;
    v4->_repeatedAction = (SKAction *)v5;

    SKCReferencedAction::setReferencedCAction((SKCReferencedAction *)v4->_mycaction, -[SKAction caction](v4->_repeatedAction, "caction"));
    v4->_mycaction->var22 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Nil Action"), CFSTR("Action to be repeated must be non-nil"));
    v4 = 0;
  }

  return v4;
}

- (id)subactions
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_repeatedAction;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKCRepeat *mycaction;
  SKAction *repeatedAction;
  void *v6;

  mycaction = self->_mycaction;
  repeatedAction = self->_repeatedAction;
  if (mycaction->var22)
    +[SKRepeat repeatActionForever:](SKRepeat, "repeatActionForever:", repeatedAction);
  else
    +[SKRepeat repeatAction:count:](SKRepeat, "repeatAction:count:", repeatedAction, mycaction->var21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimingMode:", -[SKAction timingMode](self, "timingMode"));
  return v6;
}

- (id)reversedAction
{
  void *v3;
  _QWORD *v4;

  -[SKAction reversedAction](self->_repeatedAction, "reversedAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKRepeat repeatAction:count:](SKRepeat, "repeatAction:count:", v3, self->_mycaction->var21);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(v4[2] + 136) = self->_mycaction->var22;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatedAction, 0);
}

@end
