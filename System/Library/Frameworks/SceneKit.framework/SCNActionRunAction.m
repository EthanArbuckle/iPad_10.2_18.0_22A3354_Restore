@implementation SCNActionRunAction

- (SCNActionRunAction)init
{
  SCNActionRunAction *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionRunAction;
  result = -[SCNAction init](&v3, sel_init);
  if (result)
  {
    result->_action = 0;
    result->_subSpriteKey = 0;
    result->_actionKey = 0;
    result->_waitForKeyedAction = 0;
    result->_runOnSubSprite = 0;
    result->_fired = 0;
  }
  return result;
}

+ (id)runAction:(id)a3 onFirstChildWithName:(id)a4
{
  SCNActionRunAction *v6;

  v6 = objc_alloc_init(SCNActionRunAction);
  v6->_action = (SCNAction *)objc_msgSend(a3, "copy");
  v6->_subSpriteKey = (NSString *)objc_msgSend(a4, "copy");
  v6->_runOnSubSprite = 1;
  return v6;
}

+ (id)runAction:(id)a3 afterActionWithKey:(id)a4
{
  SCNActionRunAction *v6;

  v6 = objc_alloc_init(SCNActionRunAction);
  v6->_action = (SCNAction *)objc_msgSend(a3, "copy");
  v6->_actionKey = (NSString *)objc_msgSend(a4, "copy");
  v6->_waitForKeyedAction = 1;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionRunAction;
  -[SCNAction dealloc](&v3, sel_dealloc);
}

- (BOOL)isCustom
{
  return 1;
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNActionRunAction;
  -[SCNAction willStartWithTarget:atTime:](&v5, sel_willStartWithTarget_atTime_, a3, a4);
  self->_fired = 0;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  void *v6;

  if (!self->_fired)
  {
    if (self->_runOnSubSprite)
    {
      v6 = (void *)objc_msgSend(a3, "childNodeWithName:recursively:", self->_subSpriteKey, 1, a4);
      if (v6)
        objc_msgSend(v6, "runAction:", self->_action);
      self->_fired = 1;
      -[SCNAction setFinished:](self, "setFinished:", 1);
    }
    else if (self->_waitForKeyedAction && !objc_msgSend(a3, "actionForKey:", self->_actionKey, a4))
    {
      objc_msgSend(a3, "runAction:", self->_action);
      self->_fired = 1;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  SCNActionRunAction *v4;

  v4 = objc_alloc_init(SCNActionRunAction);
  v4->_action = (SCNAction *)-[SCNAction copy](self->_action, "copy");
  v4->_actionKey = (NSString *)-[NSString copy](self->_actionKey, "copy");
  v4->_subSpriteKey = (NSString *)-[NSString copy](self->_subSpriteKey, "copy");
  v4->_waitForKeyedAction = self->_waitForKeyedAction;
  v4->_runOnSubSprite = self->_runOnSubSprite;
  return v4;
}

- (id)reversedAction
{
  SCNActionRunAction *v3;

  v3 = objc_alloc_init(SCNActionRunAction);
  v3->_action = -[SCNAction reversedAction](self->_action, "reversedAction");
  v3->_actionKey = (NSString *)-[NSString copy](self->_actionKey, "copy");
  v3->_subSpriteKey = (NSString *)-[NSString copy](self->_subSpriteKey, "copy");
  v3->_waitForKeyedAction = self->_waitForKeyedAction;
  v3->_runOnSubSprite = self->_runOnSubSprite;
  return v3;
}

@end
