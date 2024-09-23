@implementation BYDevice

- (BOOL)posedDeviceSelection_largeSizeDevice
{
  int64_t v2;
  BOOL v3;
  int64_t v4;
  unsigned __int8 v5;
  char v7;
  UIDevice *v8;
  BOOL v10;

  v2 = -[BYDevice size](self, "size");
  v7 = 0;
  v3 = 1;
  if (v2 != 5)
  {
    v4 = -[BYDevice size](self, "size");
    v3 = 1;
    if (v4 != 1)
    {
      v5 = -[BYDevice isD33](self, "isD33");
      v3 = 1;
      if ((v5 & 1) == 0)
      {
        v8 = +[UIDevice currentDevice](UIDevice, "currentDevice");
        v7 = 1;
        v3 = (id)-[UIDevice userInterfaceIdiom](v8, "userInterfaceIdiom") == (id)1;
      }
    }
  }
  v10 = v3;
  if ((v7 & 1) != 0)

  return v10;
}

- (BOOL)isD33
{
  _BYTE v3[20];
  _BYTE __dst[20];

  memcpy(__dst, &unk_10024D0B0, sizeof(__dst));
  memcpy(v3, &unk_10024D0C4, sizeof(v3));
  return MGIsDeviceOneOfType(__dst) & 1;
}

+ (id)currentDevice
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&unk_1002EECA8;
  location = 0;
  objc_storeStrong(&location, &stru_100284558);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)qword_1002EECA0;
}

- (id)currentDevice
{
  return self;
}

- (BYDevice)init
{
  BOOL v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BYDevice *v10;
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  int v16;
  __CFString *theString1;
  objc_super v18;
  SEL v19;
  id location;

  v19 = a2;
  location = 0;
  v18.receiver = self;
  v18.super_class = (Class)BYDevice;
  location = -[BYDevice init](&v18, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    theString1 = (__CFString *)MGGetStringAnswer(CFSTR("DeviceClass"));
    if (theString1)
    {
      if (CFStringCompare(theString1, CFSTR("iPad"), 0))
        *((_QWORD *)location + 3) = 0;
      else
        *((_QWORD *)location + 3) = 1;
      objc_storeStrong((id *)location + 5, theString1);
      CFRelease(theString1);
    }
    v16 = MGGetSInt32Answer(CFSTR("main-screen-class"), 0);
    v15 = 0;
    if (objc_msgSend(location, "type"))
    {
      if (v16 == 11 || v16 == 14)
        v15 = 4;
    }
    else
    {
      switch(v16)
      {
        case 5:
          v15 = 2;
          break;
        case 9:
          v15 = 1;
          break;
        case 15:
        case 30:
          v15 = 3;
          break;
        case 18:
        case 31:
          v15 = 6;
          break;
        case 19:
          v15 = 5;
          break;
        case 22:
        case 24:
        case 25:
          v15 = 0;
          break;
        default:
          break;
      }
    }
    *((_QWORD *)location + 4) = v15;
    *((_DWORD *)location + 4) = v16;
    v2 = MGGetSInt32Answer(CFSTR("JwLB44/jEB8aFDpXQ16Tuw"), 0) != 2;
    *((_BYTE *)location + 8) = v2;
    v3 = sub_1001C4B10(0);
    v4 = 0;
    if (v3)
      v4 = sub_1001C4870();
    *((_BYTE *)location + 12) = v4 & 1;
    v5 = MGCopyAnswer(CFSTR("ProductType"), 0);
    v6 = (void *)*((_QWORD *)location + 6);
    *((_QWORD *)location + 6) = v5;

    v7 = *((_QWORD *)location + 3);
    if (v7)
    {
      if (v7 == 1)
        *((_BYTE *)location + 9) = 0;
    }
    else
    {
      v14 = MGGetBoolAnswer(CFSTR("RingerButtonCapability")) & 1;
      *((_BYTE *)location + 9) = v14;
    }
    v13 = MGGetBoolAnswer(CFSTR("CameraButtonCapability")) & 1;
    *((_BYTE *)location + 10) = v13;
    v12 = MGGetBoolAnswer(CFSTR("euampscYbKXqj/bSaHD0QA")) & 1;
    *((_BYTE *)location + 11) = v12;
    v8 = MGCopyAnswer(CFSTR("SerialNumber"), 0);
    v9 = (void *)*((_QWORD *)location + 7);
    *((_QWORD *)location + 7) = v8;

  }
  v10 = (BYDevice *)location;
  objc_storeStrong(&location, 0);
  return v10;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)size
{
  return self->_size;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (BOOL)hasActionButton
{
  return self->_hasActionButton;
}

- (BOOL)hasCameraButton
{
  return self->_hasCameraButton;
}

- (BOOL)isPowerButtonOppositeVolumeButtons
{
  return self->_isPowerButtonOppositeVolumeButtons;
}

- (BOOL)hasDynamicIsland
{
  return self->_hasDynamicIsland;
}

- (int)mainScreenClass
{
  return self->_mainScreenClass;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end
