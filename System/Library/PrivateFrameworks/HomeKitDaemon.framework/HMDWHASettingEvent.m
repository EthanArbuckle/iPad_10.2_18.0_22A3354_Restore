@implementation HMDWHASettingEvent

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (AWDHomeKitValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

+ (id)eventWithKeyPath:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  HMDWHASettingEvent *v7;
  uint64_t v8;
  id v9;
  AWDHomeKitValue *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HMDWHASettingEvent);
  -[HMDWHASettingEvent setKeyPath:](v7, "setKeyPath:", v6);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "title");
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  v9 = v5;
  v10 = objc_alloc_init(AWDHomeKitValue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AWDHomeKitValue setStringVal:](v10, "setStringVal:", v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AWDHomeKitValue setDataVal:](v10, "setDataVal:", v9);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        switch(CFNumberGetType((CFNumberRef)v9))
        {
          case kCFNumberSInt8Type:
          case kCFNumberSInt16Type:
          case kCFNumberSInt32Type:
          case kCFNumberSInt64Type:
          case kCFNumberShortType:
          case kCFNumberIntType:
          case kCFNumberLongType:
          case kCFNumberLongLongType:
          case kCFNumberNSIntegerType:
            -[AWDHomeKitValue setIntVal:](v10, "setIntVal:", objc_msgSend(v9, "integerValue"));
            break;
          case kCFNumberFloat32Type:
          case kCFNumberFloatType:
          case kCFNumberCGFloatType:
            objc_msgSend(v9, "floatValue");
            -[AWDHomeKitValue setFloatVal:](v10, "setFloatVal:");
            break;
          case kCFNumberFloat64Type:
          case kCFNumberDoubleType:
            objc_msgSend(v9, "doubleValue");
            -[AWDHomeKitValue setDoubleVal:](v10, "setDoubleVal:");
            break;
          case kCFNumberCharType:
            -[AWDHomeKitValue setBoolVal:](v10, "setBoolVal:", objc_msgSend(v9, "BOOLValue"));
            break;
          default:
            break;
        }
      }
    }
  }

  -[HMDWHASettingEvent setValue:](v7, "setValue:", v10);
  return v7;
}

@end
