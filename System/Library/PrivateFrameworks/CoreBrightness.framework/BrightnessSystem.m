@implementation BrightnessSystem

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return -[BrightnessSystemInternal setProperty:forKey:client:](self->bsi, "setProperty:forKey:client:", a3, a4, 0, a4, a3, a2, self);
}

- (BrightnessSystem)init
{
  BrightnessSystemInternal *v2;
  objc_super v4;
  SEL v5;
  BrightnessSystem *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BrightnessSystem;
  v6 = -[BrightnessSystem init](&v4, sel_init);
  if (v6)
  {
    v2 = objc_alloc_init(BrightnessSystemInternal);
    v6->bsi = v2;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  BrightnessSystem *v4;

  v4 = self;
  v3 = a2;
  if (self->bsi)
  {
    -[BrightnessSystemInternal destroyServer](v4->bsi, "destroyServer");

  }
  v2.receiver = v4;
  v2.super_class = (Class)BrightnessSystem;
  -[BrightnessSystem dealloc](&v2, sel_dealloc);
}

- (id)copyPropertyForKey:(id)a3
{
  return -[BrightnessSystemInternal copyPropertyForKey:client:](self->bsi, "copyPropertyForKey:client:", a3, 0);
}

- (BOOL)isAlsSupported
{
  return -[BrightnessSystemInternal isAlsSupported](self->bsi, "isAlsSupported", a2, self);
}

- (void)registerNotificationBlock:(id)a3
{
  -[BrightnessSystemInternal registerNotificationBlock:](self->bsi, "registerNotificationBlock:", a3);
}

- (void)registerNotificationBlock:(id)a3 forProperties:(id)a4
{
  -[BrightnessSystemInternal registerNotificationBlock:forProperties:](self->bsi, "registerNotificationBlock:forProperties:", a3, a4, a4, a3, a2, self);
}

@end
