@implementation SKWait

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKWait)init
{
  SKWait *v2;
  SKCWait *v3;
  SKCAction *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKWait;
  v2 = -[SKAction init](&v8, sel_init);
  if (v2)
  {
    v3 = (SKCWait *)operator new();
    v7.receiver = v2;
    v7.super_class = (Class)SKWait;
    v4 = -[SKAction caction](&v7, sel_caction);
    SKCWait::SKCWait(v3, v4);
    v2->_mycaction = v3;
    v6.receiver = v2;
    v6.super_class = (Class)SKWait;
    -[SKAction setCppAction:](&v6, sel_setCppAction_, v3);
  }
  return v2;
}

- (SKWait)initWithCoder:(id)a3
{
  id v4;
  SKWait *v5;
  SKCWait *v6;
  SKCAction *v7;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKWait;
  v5 = -[SKAction initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (SKCWait *)operator new();
    v10.receiver = v5;
    v10.super_class = (Class)SKWait;
    v7 = -[SKAction caction](&v10, sel_caction);
    SKCWait::SKCWait(v6, v7);
    v5->_mycaction = v6;
    v9.receiver = v5;
    v9.super_class = (Class)SKWait;
    -[SKAction setCppAction:](&v9, sel_setCppAction_, v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKWait;
  -[SKAction encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (id)waitForDuration:(double)a3
{
  SKWait *v4;

  v4 = objc_alloc_init(SKWait);
  -[SKAction setDuration:](v4, "setDuration:", a3);
  return v4;
}

+ (id)waitForDuration:(double)a3 withRange:(double)a4
{
  SKWait *v6;
  float v7;

  v6 = objc_alloc_init(SKWait);
  -[SKAction setDuration:](v6, "setDuration:", a3);
  v7 = a4;
  v6->_mycaction->var9 = v7;
  return v6;
}

- (id)reversedAction
{
  -[SKAction duration](self, "duration");
  return +[SKWait waitForDuration:withRange:](SKWait, "waitForDuration:withRange:");
}

@end
