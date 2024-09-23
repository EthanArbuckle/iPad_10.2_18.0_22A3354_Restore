@implementation SKRunAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRunAction)init
{
  SKRunAction *v2;
  SKRunAction *v3;
  SKAction *action;
  NSString *subSpriteKey;
  NSString *actionKey;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKRunAction;
  v2 = -[SKAction init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    action = v2->_action;
    v2->_action = 0;

    subSpriteKey = v3->_subSpriteKey;
    v3->_subSpriteKey = 0;

    actionKey = v3->_actionKey;
    v3->_actionKey = 0;

    v3->_waitForKeyedAction = 0;
    v3->_runOnSubSprite = 0;
    v3->_fired = 0;
  }
  return v3;
}

- (SKRunAction)initWithCoder:(id)a3
{
  id v4;
  SKRunAction *v5;
  uint64_t v6;
  SKAction *action;
  uint64_t v8;
  NSString *subSpriteKey;
  uint64_t v10;
  NSString *actionKey;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKRunAction;
  v5 = -[SKAction initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_action"));
    v6 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (SKAction *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subSpriteKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    subSpriteKey = v5->_subSpriteKey;
    v5->_subSpriteKey = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_actionKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    actionKey = v5->_actionKey;
    v5->_actionKey = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_waitForKeyedAction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_waitForKeyedAction = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_runOnSubSprite"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_runOnSubSprite = objc_msgSend(v13, "BOOLValue");

    v5->_fired = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKRunAction;
  -[SKAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_action, CFSTR("_action"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subSpriteKey, CFSTR("_subSpriteKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionKey, CFSTR("_actionKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_waitForKeyedAction);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_waitForKeyedAction"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_runOnSubSprite);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_runOnSubSprite"));

}

+ (id)runAction:(id)a3 onFirstChildWithName:(id)a4
{
  id v5;
  NSString *v6;
  SKRunAction *v7;
  uint64_t v8;
  SKAction *action;
  NSString *subSpriteKey;

  v5 = a3;
  v6 = (NSString *)a4;
  v7 = objc_alloc_init(SKRunAction);
  v8 = objc_msgSend(v5, "copy");
  action = v7->_action;
  v7->_action = (SKAction *)v8;

  subSpriteKey = v7->_subSpriteKey;
  v7->_subSpriteKey = v6;

  v7->_runOnSubSprite = 1;
  return v7;
}

+ (id)runAction:(id)a3 afterActionWithKey:(id)a4
{
  id v5;
  NSString *v6;
  SKRunAction *v7;
  uint64_t v8;
  SKAction *action;
  NSString *actionKey;

  v5 = a3;
  v6 = (NSString *)a4;
  v7 = objc_alloc_init(SKRunAction);
  v8 = objc_msgSend(v5, "copy");
  action = v7->_action;
  v7->_action = (SKAction *)v8;

  actionKey = v7->_actionKey;
  v7->_actionKey = v6;

  v7->_waitForKeyedAction = 1;
  return v7;
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKRunAction;
  -[SKAction willStartWithTarget:atTime:](&v5, sel_willStartWithTarget_atTime_, a3, a4);
  self->_fired = 0;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  if (!self->_fired)
  {
    if (self->_runOnSubSprite)
    {
      v9 = v5;
      objc_msgSend(v5, "childNodeWithName:", self->_subSpriteKey);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        objc_msgSend(v6, "runAction:", self->_action);
      self->_fired = 1;
      -[SKAction setFinished:](self, "setFinished:", 1);

      goto LABEL_6;
    }
    if (self->_waitForKeyedAction)
    {
      v9 = v5;
      objc_msgSend(v5, "actionForKey:", self->_actionKey);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v9;
      if (!v8)
      {
        objc_msgSend(v9, "runAction:", self->_action);
        self->_fired = 1;
LABEL_6:
        v5 = v9;
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  SKRunAction *v4;
  SKAction *v5;
  SKAction *action;

  v4 = objc_alloc_init(SKRunAction);
  v5 = -[SKAction copy](self->_action, "copy");
  action = v4->_action;
  v4->_action = v5;

  objc_storeStrong((id *)&v4->_actionKey, self->_actionKey);
  objc_storeStrong((id *)&v4->_subSpriteKey, self->_subSpriteKey);
  v4->_waitForKeyedAction = self->_waitForKeyedAction;
  v4->_runOnSubSprite = self->_runOnSubSprite;
  return v4;
}

- (id)reversedAction
{
  SKRunAction *v3;
  uint64_t v4;
  SKAction *action;

  v3 = objc_alloc_init(SKRunAction);
  -[SKAction reversedAction](self->_action, "reversedAction");
  v4 = objc_claimAutoreleasedReturnValue();
  action = v3->_action;
  v3->_action = (SKAction *)v4;

  objc_storeStrong((id *)&v3->_actionKey, self->_actionKey);
  objc_storeStrong((id *)&v3->_subSpriteKey, self->_subSpriteKey);
  v3->_waitForKeyedAction = self->_waitForKeyedAction;
  v3->_runOnSubSprite = self->_runOnSubSprite;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionKey, 0);
  objc_storeStrong((id *)&self->_subSpriteKey, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
