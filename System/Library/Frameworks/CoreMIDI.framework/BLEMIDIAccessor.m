@implementation BLEMIDIAccessor

+ (unsigned)midiDeviceForUUID:(id)a3
{
  ItemCount v4;
  uint64_t v5;
  ItemCount v6;
  ItemCount v7;
  id v8;
  CFStringRef str;

  v4 = MIDIGetNumberOfDevices();
  LODWORD(v5) = 0;
  if (a3)
  {
    v6 = v4;
    if (v4)
    {
      v7 = 0;
      do
      {
        str = 0;
        v5 = MIDIGetDevice(v7);
        if (!MIDIObjectGetStringProperty(v5, kMIDIPropertyDriverOwner, &str) && str)
        {
          if (CFEqual(str, CFSTR("com.apple.AppleMIDIBluetoothDriver")))
          {
            v8 = +[BLEMIDIAccessor uuidForMIDIDevice:](BLEMIDIAccessor, "uuidForMIDIDevice:", v5);
            if (v8)
            {
              if ((objc_msgSend(v8, "isEqualToString:", a3) & 1) != 0)
                goto LABEL_13;
            }
          }
          if (str)
          {
            CFRelease(str);
            str = 0;
          }
        }
        ++v7;
      }
      while (v6 != v7);
      LODWORD(v5) = 0;
LABEL_13:
      if (str)
        CFRelease(str);
    }
  }
  return v5;
}

+ (unsigned)midiDeviceForUUID:(id)a3 isLocalPeripheral:(BOOL)a4 isRemotePeripheral:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a5;
  v6 = a4;
  v7 = +[BLEMIDIAccessor midiDeviceForUUID:](BLEMIDIAccessor, "midiDeviceForUUID:", a3);
  if (!(_DWORD)v7
    || (v8 = v7,
        +[BLEMIDIAccessor deviceIsLocalPeripheral:](BLEMIDIAccessor, "deviceIsLocalPeripheral:", v7) != v6)
    || +[BLEMIDIAccessor deviceIsRemotePeripheral:](BLEMIDIAccessor, "deviceIsRemotePeripheral:", v8) != v5)
  {
    LODWORD(v8) = 0;
  }
  return v8;
}

+ (unsigned)nullDevice
{
  ItemCount v2;
  ItemCount v3;
  ItemCount i;
  MIDIDeviceRef v5;
  MIDIObjectRef v6;
  SInt32 outValue;
  CFStringRef str;

  v2 = MIDIGetNumberOfDevices();
  if (v2)
  {
    v3 = v2;
    for (i = 0; i != v3; ++i)
    {
      v5 = MIDIGetDevice(i);
      if (v5)
      {
        v6 = v5;
        str = 0;
        MIDIObjectGetStringProperty(v5, kMIDIPropertyDriverOwner, &str);
        if (str)
        {
          if (CFEqual(str, CFSTR("com.apple.AppleMIDIBluetoothDriver")))
          {
            CFRelease(str);
            outValue = 0;
            MIDIObjectGetIntegerProperty(v6, CFSTR("is BLE MIDI null device"), &outValue);
            if (outValue)
              return v6;
          }
          else if (str)
          {
            CFRelease(str);
          }
        }
      }
    }
  }
  return 0;
}

+ (unsigned)localPeripheral
{
  ItemCount v2;
  ItemCount v3;
  ItemCount i;
  MIDIDeviceRef v5;
  MIDIObjectRef v6;
  SInt32 outValue[2];
  CFStringRef str;

  v2 = MIDIGetNumberOfDevices();
  if (v2)
  {
    v3 = v2;
    for (i = 0; v3 != i; ++i)
    {
      v5 = MIDIGetDevice(i);
      if (v5)
      {
        v6 = v5;
        str = 0;
        MIDIObjectGetStringProperty(v5, kMIDIPropertyDriverOwner, &str);
        if (str)
        {
          if (CFEqual(str, CFSTR("com.apple.AppleMIDIBluetoothDriver")))
          {
            CFRelease(str);
            *(_QWORD *)outValue = 0;
            MIDIObjectGetIntegerProperty(v6, CFSTR("MIDI Local Peripheral"), &outValue[1]);
            MIDIObjectGetIntegerProperty(v6, kMIDIPropertyOffline, outValue);
            if (outValue[1] && !outValue[0])
              return v6;
          }
          else if (str)
          {
            CFRelease(str);
          }
        }
      }
    }
  }
  return 0;
}

+ (id)localPeripheralName
{
  uint64_t v2;
  const __CFString *v3;
  id v4;

  v2 = +[BLEMIDIAccessor localPeripheral](BLEMIDIAccessor, "localPeripheral");
  v3 = CFSTR("Unknown");
  if ((_DWORD)v2)
  {
    v4 = +[BLEMIDIAccessor nameForMIDIDevice:](BLEMIDIAccessor, "nameForMIDIDevice:", v2);
    if (v4)
      return v4;
  }
  return (id)v3;
}

+ (id)uuidForMIDIDevice:(unsigned int)a3
{
  void *v3;
  CFStringRef str;

  if (!a3)
    return 0;
  str = 0;
  MIDIObjectGetStringProperty(a3, CFSTR("BLE MIDI Device UUID"), &str);
  if (!str)
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:");
  CFRelease(str);
  return v3;
}

+ (id)nameForMIDIDevice:(unsigned int)a3
{
  void *v3;
  CFStringRef str;

  if (!a3)
    return 0;
  str = 0;
  MIDIObjectGetStringProperty(a3, kMIDIPropertyName, &str);
  if (!str)
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:");
  CFRelease(str);
  return v3;
}

+ (BOOL)deviceIsRemotePeripheral:(unsigned int)a3
{
  BOOL result;
  SInt32 outValue;

  result = a3;
  outValue = 0;
  if (a3)
  {
    MIDIObjectGetIntegerProperty(a3, CFSTR("MIDI Remote Peripheral"), &outValue);
    return outValue != 0;
  }
  return result;
}

+ (BOOL)deviceIsLocalPeripheral:(unsigned int)a3
{
  BOOL result;
  SInt32 outValue;

  result = a3;
  outValue = 0;
  if (a3)
  {
    MIDIObjectGetIntegerProperty(a3, CFSTR("MIDI Local Peripheral"), &outValue);
    return outValue != 0;
  }
  return result;
}

+ (BOOL)deviceIsNullDevice:(unsigned int)a3
{
  BOOL result;
  SInt32 outValue;

  result = a3;
  outValue = 0;
  if (a3)
  {
    MIDIObjectGetIntegerProperty(a3, CFSTR("is BLE MIDI null device"), &outValue);
    return outValue != 0;
  }
  return result;
}

+ (BOOL)deviceIsOnline:(unsigned int)a3
{
  BOOL result;
  SInt32 outValue;

  result = a3;
  outValue = 0;
  if (a3)
  {
    MIDIObjectGetIntegerProperty(a3, kMIDIPropertyOffline, &outValue);
    return outValue == 0;
  }
  return result;
}

+ (BOOL)uuidIsForgettable:(id)a3
{
  uint64_t v3;

  v3 = +[BLEMIDIAccessor midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:](BLEMIDIAccessor, "midiDeviceForUUID:isLocalPeripheral:isRemotePeripheral:", a3, 0, 1);
  if ((_DWORD)v3)
    LOBYTE(v3) = !+[BLEMIDIAccessor deviceIsOnline:](BLEMIDIAccessor, "deviceIsOnline:", v3);
  return v3;
}

+ (unsigned)timeStampOffset:(unint64_t)a3
{
  return ((((unint64_t)__udivti3() * (unsigned __int128)0x431BDE82D7B634DBuLL) >> 64) >> 18) & 0x1FFF;
}

+ (unsigned)reconstructWithHighByte:(unsigned __int8)a3 lowByte:(unsigned __int8)a4 overflow:(BOOL)a5
{
  return a4 | ((a5 + a3) << 7);
}

+ (unint64_t)timeStampWithEpoch:(unint64_t)a3 offset:(unsigned __int16)a4
{
  return a3 + a4;
}

+ (void)splitOffset:(unsigned __int16)a3 intoHeaderByte:(char *)a4 timeStampByte:(char *)a5
{
  *a4 = (a3 >> 7) & 0x3F | 0x80;
  *a5 = a3 | 0x80;
}

+ (void)logEvent:(char *)a3 length:(unsigned __int16)a4 timeStamp:(unint64_t)a5 intoBuffer:(char *)a6
{
  unsigned int v7;
  unint64_t v9;
  unsigned __int16 v10;
  int v11;
  unsigned __int16 v12;
  unsigned __int16 v13;
  uint64_t v14;
  unsigned __int16 v15;
  int v16;

  v7 = a4;
  v9 = __udivti3();
  v10 = snprintf(a6, 0x7D0uLL, "Timestamp: %10.10llu ms MIDI:", v9 / 0xF4240);
  v11 = v10;
  if (v10)
  {
    if (v7)
    {
      v12 = v10;
      v13 = 2000 - v10;
      v14 = v7;
      do
      {
        v15 = v13;
        if (v13 < 4u)
          break;
        v16 = (unsigned __int16)snprintf(&a6[v12], 2000 - v12, " %02.2X", *a3);
        if (!v16)
          break;
        v12 += v16;
        v13 = v15 - v16;
        ++a3;
        --v14;
      }
      while (v14);
      v11 = v12;
    }
    a6[v11] = 0;
  }
}

@end
