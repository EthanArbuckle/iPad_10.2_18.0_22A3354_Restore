@implementation SKCustomAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKCustomAction)init
{
  SKCustomAction *v2;
  SKCCustomAction *v3;
  SKCAction *v4;
  SKCCustomAction *mycaction;
  id var19;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKCustomAction;
  v2 = -[SKAction init](&v10, sel_init);
  if (v2)
  {
    v3 = (SKCCustomAction *)operator new();
    v9.receiver = v2;
    v9.super_class = (Class)SKCustomAction;
    v4 = -[SKAction caction](&v9, sel_caction);
    SKCCustomAction::SKCCustomAction(v3, v4);
    v2->_mycaction = v3;
    v8.receiver = v2;
    v8.super_class = (Class)SKCustomAction;
    -[SKAction setCppAction:](&v8, sel_setCppAction_, v3);
    mycaction = v2->_mycaction;
    var19 = mycaction->var19;
    mycaction->var19 = 0;

  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKCustomAction;
  -[SKAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  NSLog(CFSTR("SKAction: Custom actions can not be properly encoded, Objective-C blocks do not support NSSecureCoding."));

}

- (SKCustomAction)initWithCoder:(id)a3
{
  id v4;
  SKCustomAction *v5;
  SKCCustomAction *v6;
  SKCAction *v7;
  SKCCustomAction *mycaction;
  id var19;
  objc_super v11;
  objc_super v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKCustomAction;
  v5 = -[SKAction initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (SKCCustomAction *)operator new();
    v12.receiver = v5;
    v12.super_class = (Class)SKCustomAction;
    v7 = -[SKAction caction](&v12, sel_caction);
    SKCCustomAction::SKCCustomAction(v6, v7);
    v5->_mycaction = v6;
    v11.receiver = v5;
    v11.super_class = (Class)SKCustomAction;
    -[SKAction setCppAction:](&v11, sel_setCppAction_, v6);
    mycaction = v5->_mycaction;
    var19 = mycaction->var19;
    mycaction->var19 = 0;

  }
  NSLog(CFSTR("SKAction: Custom actions can not be properly decoded, Objective-C blocks do not support NSSecureCoding."));

  return v5;
}

+ (id)customActionWithDuration:(double)a3 actionBlock:(id)a4
{
  id v5;
  SKCustomAction *v6;
  uint64_t v7;
  SKCCustomAction *mycaction;
  id var19;

  v5 = a4;
  v6 = objc_alloc_init(SKCustomAction);
  v7 = MEMORY[0x1DF0CFCB0](v5);
  mycaction = v6->_mycaction;
  var19 = mycaction->var19;
  mycaction->var19 = (id)v7;

  -[SKAction setDuration:](v6, "setDuration:", a3);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKCustomAction;
  v4 = -[SKAction copyWithZone:](&v9, sel_copyWithZone_, a3);
  v5 = MEMORY[0x1DF0CFCB0](self->_mycaction->var19);
  v6 = v4[2];
  v7 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v5;

  -[SKAction duration](self, "duration");
  objc_msgSend(v4, "setDuration:");
  return v4;
}

- (id)reversedAction
{
  return -[SKAction copy](self, "copy");
}

@end
