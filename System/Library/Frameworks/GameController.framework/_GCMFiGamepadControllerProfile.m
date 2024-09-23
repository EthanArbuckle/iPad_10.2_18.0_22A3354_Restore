@implementation _GCMFiGamepadControllerProfile

- (id)name
{
  return CFSTR("Gamepad");
}

- (void)setPlayerIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const void *v7;

  -[GCPhysicalInputProfile controller](self, "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hidServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const void *)objc_msgSend(v6, "service");

  if (v7)
    GC_IOHIDSetLEDs(v7, a3);
}

@end
