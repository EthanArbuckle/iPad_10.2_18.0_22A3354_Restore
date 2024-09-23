@implementation BYDeviceForTest

- (BYDeviceForTest)init
{
  uint64_t v2;
  uint64_t v3;
  BYDeviceForTest *v4;
  uint64_t v6;
  objc_super v7;
  SEL v8;
  id location;

  v8 = a2;
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BYDeviceForTest;
  location = -[BYDevice init](&v7, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0);
    *((_BYTE *)location + 64) = (_DWORD)v2 == 1;
    v6 = MGGetProductType(v2, v3);
    *((_BYTE *)location + 65) = v6 == 3242623367
                             || v6 == 2311900306
                             || v6 == 502329937
                             || v6 == 2270970153
                             || v6 == 3402870384
                             || v6 == 896202454
                             || objc_msgSend(location, "size") == (id)3
                             || objc_msgSend(location, "size") == (id)6
                             || objc_msgSend(location, "size") == (id)5
                             || objc_msgSend(location, "size") == (id)4;
  }
  v4 = (BYDeviceForTest *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BOOL)hasSolidStateHomeButton
{
  return self->_hasSolidStateHomeButton;
}

- (BOOL)supportsTrueTone
{
  return self->_supportsTrueTone;
}

@end
