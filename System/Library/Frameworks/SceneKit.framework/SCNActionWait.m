@implementation SCNActionWait

- (SCNActionWait)init
{
  SCNActionWait *v2;
  SCNCActionWait *v3;
  SCNCAction *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNActionWait;
  v2 = -[SCNAction init](&v8, sel_init);
  if (v2)
  {
    v3 = (SCNCActionWait *)operator new();
    v7.receiver = v2;
    v7.super_class = (Class)SCNActionWait;
    v4 = -[SCNAction caction](&v7, sel_caction);
    SCNCActionWait::SCNCActionWait(v3, v4);
    v2->_mycaction = v3;
    v6.receiver = v2;
    v6.super_class = (Class)SCNActionWait;
    -[SCNAction setCppAction:](&v6, sel_setCppAction_, v3);
  }
  return v2;
}

- (SCNActionWait)initWithCoder:(id)a3
{
  SCNActionWait *v3;
  SCNCActionWait *v4;
  SCNCAction *v5;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNActionWait;
  v3 = -[SCNAction initWithCoder:](&v9, sel_initWithCoder_, a3);
  if (v3)
  {
    v4 = (SCNCActionWait *)operator new();
    v8.receiver = v3;
    v8.super_class = (Class)SCNActionWait;
    v5 = -[SCNAction caction](&v8, sel_caction);
    SCNCActionWait::SCNCActionWait(v4, v5);
    v3->_mycaction = v4;
    v7.receiver = v3;
    v7.super_class = (Class)SCNActionWait;
    -[SCNAction setCppAction:](&v7, sel_setCppAction_, v4);
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionWait;
  -[SCNAction encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)waitForDuration:(double)a3
{
  SCNActionWait *v4;

  v4 = objc_alloc_init(SCNActionWait);
  -[SCNAction setDuration:](v4, "setDuration:", a3);
  return v4;
}

+ (id)waitForDuration:(double)a3 withRange:(double)a4
{
  SCNActionWait *v6;

  v6 = objc_alloc_init(SCNActionWait);
  -[SCNAction setDuration:](v6, "setDuration:", a3);
  v6->_mycaction->var8 = a4;
  return v6;
}

- (id)reversedAction
{
  -[SCNAction duration](self, "duration");
  return +[SCNActionWait waitForDuration:withRange:](SCNActionWait, "waitForDuration:withRange:");
}

@end
