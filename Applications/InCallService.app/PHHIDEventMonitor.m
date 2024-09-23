@implementation PHHIDEventMonitor

+ (id)HIDEventMonitor
{
  return objc_alloc_init(PHHIDEventMonitor);
}

- (PHHIDEventMonitor)init
{
  PHHIDEventMonitor *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHHIDEventMonitor;
  v2 = -[PHHIDEventMonitor init](&v8, "init");
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("PHHIDEventMonitor.serialQueue", v4);
  dispatchQueue = v2->_dispatchQueue;
  v2->_dispatchQueue = (OS_dispatch_queue *)v5;

  v2->_HIDEventSystemClient = 0;
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[4];
  id v6;
  __IOHIDEventSystemClient *v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007BE90;
  block[3] = &unk_1002850B0;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHHIDEventMonitor dispatchQueue](self, "dispatchQueue"));
  v7 = -[PHHIDEventMonitor HIDEventSystemClient](self, "HIDEventSystemClient");
  v3 = v6;
  dispatch_async(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)PHHIDEventMonitor;
  -[PHHIDEventMonitor dealloc](&v4, "dealloc");
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[PHHIDEventMonitor dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007BF38;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[PHHIDEventMonitor dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007C134;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setHIDEventSystemClient:(__IOHIDEventSystemClient *)a3
{
  __IOHIDEventSystemClient *HIDEventSystemClient;
  void *v6;

  HIDEventSystemClient = self->_HIDEventSystemClient;
  if (HIDEventSystemClient != a3)
  {
    if (HIDEventSystemClient)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHHIDEventMonitor dispatchQueue](self, "dispatchQueue"));
      IOHIDEventSystemClientUnscheduleFromDispatchQueue(HIDEventSystemClient, v6);

      CFRelease(self->_HIDEventSystemClient);
    }
    self->_HIDEventSystemClient = a3;
  }
}

- (void)handleKeyboardEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  IntegerValue = IOHIDEventGetIntegerValue(a3, 196608);
  v6 = IOHIDEventGetIntegerValue(a3, 196609);
  v7 = IOHIDEventGetIntegerValue(a3, 196610);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHHIDEventMonitor stringFromIOHIDUsagePage:](self, "stringFromIOHIDUsagePage:", IntegerValue));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHHIDEventMonitor stringFromIOHIDUsage:](self, "stringFromIOHIDUsage:", v6));
  if (v8)
  {
    v10 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134219010;
      v13 = IntegerValue;
      v14 = 2048;
      v15 = v6;
      v16 = 2048;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%li - %li keyDown: %li (%@ - %@)", (uint8_t *)&v12, 0x34u);
    }

  }
}

- (id)stringFromIOHIDUsage:(int64_t)a3
{
  id result;
  __CFString *v4;

  if (a3 <= 175)
  {
    result = 0;
    switch(a3)
    {
      case ' ':
        result = CFSTR("kHIDUsage_Tfon_HookSwitch");
        break;
      case '!':
        result = CFSTR("kHIDUsage_Tfon_Flash");
        break;
      case '"':
      case '#':
      case '$':
      case '%':
      case '\'':
      case '(':
      case ')':
      case '+':
      case ',':
      case '-':
        return result;
      case '&':
        result = CFSTR("kHIDUsage_Tfon_Drop");
        break;
      case '*':
        result = CFSTR("kHIDUsage_KeyboardDeleteOrBackspace");
        break;
      case '.':
        result = CFSTR("kHIDUsage_Tfon_Ring");
        break;
      case '/':
        result = CFSTR("kHIDUsage_Tfon_PhoneMute");
        break;
      case '0':
        result = CFSTR("kHIDUsage_Csmr_Power");
        break;
      default:
        if (a3 == 64)
          result = CFSTR("kHIDUsage_Csmr_Menu");
        else
          result = 0;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 176:
        result = CFSTR("kHIDUsage_Tfon_PhoneKey0");
        break;
      case 177:
        result = CFSTR("kHIDUsage_Tfon_PhoneKey1");
        break;
      case 178:
        result = CFSTR("kHIDUsage_Tfon_PhoneKey2");
        break;
      case 179:
        result = CFSTR("kHIDUsage_Tfon_PhoneKey3");
        break;
      case 180:
        result = CFSTR("kHIDUsage_Tfon_PhoneKey4");
        break;
      case 181:
        result = CFSTR("kHIDUsage_Tfon_PhoneKey5");
        break;
      case 182:
        result = CFSTR("kHIDUsage_Tfon_PhoneKey6");
        break;
      case 183:
        result = CFSTR("kHIDUsage_Tfon_PhoneKey7");
        break;
      case 184:
        result = CFSTR("kHIDUsage_Tfon_PhoneKey8");
        break;
      case 185:
        result = CFSTR("kHIDUsage_Tfon_PhoneKey9");
        break;
      case 186:
        result = CFSTR("kHIDUsage_Tfon_PhoneKeyStar");
        break;
      case 187:
        result = CFSTR("kHIDUsage_Tfon_PhoneKeyPound");
        break;
      default:
        v4 = CFSTR("kHIDUsage_Csmr_VolumeDecrement");
        if (a3 != 234)
          v4 = 0;
        if (a3 == 233)
          result = CFSTR("kHIDUsage_Csmr_VolumeIncrement");
        else
          result = v4;
        break;
    }
  }
  return result;
}

- (id)stringFromIOHIDUsagePage:(int64_t)a3
{
  if ((unint64_t)(a3 - 7) > 5)
    return 0;
  else
    return *(&off_100286748 + a3 - 7);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (__IOHIDEventSystemClient)HIDEventSystemClient
{
  return self->_HIDEventSystemClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
