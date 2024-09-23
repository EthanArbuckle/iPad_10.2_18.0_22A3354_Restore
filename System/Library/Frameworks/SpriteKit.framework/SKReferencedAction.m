@implementation SKReferencedAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKReferencedAction)init
{
  SKReferencedAction *v2;
  SKCAction *v3;
  const SKCAction *v4;
  NSString *referencedActionName;
  SKAction *referencedAction;
  SKCReferencedAction *mycaction;
  SKCAction *var19;
  int v9;
  objc_super v11;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SKReferencedAction;
  v2 = -[SKAction init](&v13, sel_init);
  if (v2)
  {
    v3 = (SKCAction *)operator new();
    v12.receiver = v2;
    v12.super_class = (Class)SKReferencedAction;
    v4 = -[SKAction caction](&v12, sel_caction);
    SKCAction::SKCAction(v3, v4);
    v3[1].var0 = 0;
    v2->_mycaction = (SKCReferencedAction *)v3;
    v3->var0 = (void **)&off_1EA4FDF90;
    v11.receiver = v2;
    v11.super_class = (Class)SKReferencedAction;
    -[SKAction setCppAction:](&v11, sel_setCppAction_, v3);
    referencedActionName = v2->_referencedActionName;
    v2->_referencedActionName = 0;

    referencedAction = v2->_referencedAction;
    v2->_referencedAction = 0;

    mycaction = v2->_mycaction;
    var19 = mycaction->var19;
    if (var19)
    {
      v9 = var19->var1 - 1;
      var19->var1 = v9;
      if (!v9)
        (*((void (**)(SKCAction *))var19->var0 + 1))(var19);
    }
    mycaction->var19 = 0;
  }
  return v2;
}

- (SKReferencedAction)initWithCoder:(id)a3
{
  id v4;
  SKReferencedAction *v5;
  SKCAction *v6;
  const SKCAction *v7;
  uint64_t v8;
  NSString *referencedActionName;
  SKAction *referencedAction;
  SKCReferencedAction *mycaction;
  SKCAction *var19;
  int v13;
  SKReferencedAction *v14;
  objc_super v16;
  objc_super v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SKReferencedAction;
  v5 = -[SKAction initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (SKCAction *)operator new();
    v17.receiver = v5;
    v17.super_class = (Class)SKReferencedAction;
    v7 = -[SKAction caction](&v17, sel_caction);
    SKCAction::SKCAction(v6, v7);
    v6[1].var0 = 0;
    v5->_mycaction = (SKCReferencedAction *)v6;
    v6->var0 = (void **)&off_1EA4FDF90;
    v16.receiver = v5;
    v16.super_class = (Class)SKReferencedAction;
    -[SKAction setCppAction:](&v16, sel_setCppAction_, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_referencedActionName"));
    v8 = objc_claimAutoreleasedReturnValue();
    referencedActionName = v5->_referencedActionName;
    v5->_referencedActionName = (NSString *)v8;

    referencedAction = v5->_referencedAction;
    v5->_referencedAction = 0;

    if (!v5->_referencedActionName)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Nil Action"), CFSTR("Action name to be referenced must be non-nil"));
      v14 = 0;
      goto LABEL_9;
    }
    mycaction = v5->_mycaction;
    var19 = mycaction->var19;
    if (var19)
    {
      v13 = var19->var1 - 1;
      var19->var1 = v13;
      if (!v13)
        (*((void (**)(SKCAction *))var19->var0 + 1))(var19);
    }
    mycaction->var19 = 0;
  }
  v14 = v5;
LABEL_9:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKReferencedAction;
  -[SKAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_referencedActionName, CFSTR("_referencedActionName"));

}

+ (id)referenceActionWithName:(id)a3 duration:(double)a4
{
  id v5;
  SKReferencedAction *v6;
  uint64_t v7;
  NSString *referencedActionName;
  float v9;

  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(SKReferencedAction);
    v7 = objc_msgSend(v5, "copy");
    referencedActionName = v6->_referencedActionName;
    v6->_referencedActionName = (NSString *)v7;

    v9 = a4;
    v6->_mycaction->var8 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Nil Action"), CFSTR("Action name to be referenced must be non-nil"));
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  SKAction *referencedAction;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SKReferencedAction;
  v5 = -[SKAction copyWithZone:](&v12, sel_copyWithZone_);
  v6 = -[NSString copyWithZone:](self->_referencedActionName, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v6;

  referencedAction = self->_referencedAction;
  if (referencedAction)
  {
    v9 = -[SKAction copyWithZone:](referencedAction, "copyWithZone:", a3);
    v10 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v9;

    SKCReferencedAction::setReferencedCAction(*((SKCReferencedAction **)v5 + 2), (SKCAction *)objc_msgSend(*((id *)v5 + 3), "caction"));
  }
  return v5;
}

- (id)subactions
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  -[SKReferencedAction _ensureReferencedAction](self, "_ensureReferencedAction");
  v4[0] = self->_referencedAction;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setTimingFunction:(id)a3
{
  uint64_t v4;
  SKCReferencedAction *mycaction;
  id var3;
  id v7;

  v7 = a3;
  -[SKReferencedAction _ensureReferencedAction](self, "_ensureReferencedAction");
  v4 = MEMORY[0x1DF0CFCB0](v7);
  mycaction = self->_mycaction;
  var3 = mycaction->var3;
  mycaction->var3 = (id)v4;

  -[SKAction setTimingFunction:](self->_referencedAction, "setTimingFunction:", v7);
}

- (void)setDuration:(double)a3
{
  float v5;

  v5 = a3;
  self->_mycaction->var8 = v5;
  -[SKReferencedAction _ensureReferencedAction](self, "_ensureReferencedAction");
  -[SKAction setDuration:](self->_referencedAction, "setDuration:", a3);
}

- (void)setTimingMode:(int64_t)a3
{
  -[SKReferencedAction _ensureReferencedAction](self, "_ensureReferencedAction");
  self->_mycaction->var14 = a3;
  -[SKAction setTimingMode:](self->_referencedAction, "setTimingMode:", a3);
}

- (id)reversedAction
{
  -[SKReferencedAction _ensureReferencedAction](self, "_ensureReferencedAction");
  return -[SKAction reversedAction](self->_referencedAction, "reversedAction");
}

- (void)_ensureReferencedAction
{
  SKAction *v3;
  SKAction *referencedAction;
  SKAction *v5;
  void *v6;
  SKAction *v7;
  SKAction *v8;

  if (!self->_referencedAction)
  {
    +[SKAction actionNamed:duration:](SKAction, "actionNamed:duration:", self->_referencedActionName, self->_mycaction->var8);
    v3 = (SKAction *)objc_claimAutoreleasedReturnValue();
    referencedAction = self->_referencedAction;
    self->_referencedAction = v3;

    v5 = self->_referencedAction;
    if (!v5)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@: Error loading action named: \"%@\"), v6, self->_referencedActionName);

      +[SKAction waitForDuration:](SKAction, "waitForDuration:", self->_mycaction->var8);
      v7 = (SKAction *)objc_claimAutoreleasedReturnValue();
      v8 = self->_referencedAction;
      self->_referencedAction = v7;

      v5 = self->_referencedAction;
    }
    SKCReferencedAction::setReferencedCAction(self->_mycaction, -[SKAction caction](v5, "caction"));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencedActionName, 0);
  objc_storeStrong((id *)&self->_referencedAction, 0);
}

@end
