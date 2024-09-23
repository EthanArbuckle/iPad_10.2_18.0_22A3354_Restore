@implementation _NSPropertyDescriptionProxy2

- (void)release
{

}

- (_NSPropertyDescriptionProxy2)retain
{
  id v3;

  v3 = self->super._sourceBuffer;
  return self;
}

- (Class)classForArchiver
{
  return (Class)objc_opt_class();
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (BOOL)_isDeallocating
{
  return objc_msgSend(self->super._sourceBuffer, "_isDeallocating");
}

- (BOOL)_tryRetain
{
  return objc_msgSend(self->super._sourceBuffer, "_tryRetain");
}

@end
