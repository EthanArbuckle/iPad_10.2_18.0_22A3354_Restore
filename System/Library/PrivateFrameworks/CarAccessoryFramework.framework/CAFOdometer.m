@implementation CAFOdometer

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFOdometer;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2568286D0))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFOdometer;
  -[CAFDistanceDisplay registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2568286D0))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFOdometer;
  -[CAFDistanceDisplay unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

+ (id)serviceIdentifier
{
  return CFSTR("0x000000001A00000A");
}

+ (id)observerProtocol
{
  return &unk_2568318F0;
}

@end
