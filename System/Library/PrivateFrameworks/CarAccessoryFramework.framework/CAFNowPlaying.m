@implementation CAFNowPlaying

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFNowPlaying;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256812388))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFNowPlaying;
  -[CAFService registerObserver:](&v6, sel_registerObserver_, v5);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_256812388))
    v5 = v4;
  else
    v5 = 0;

  v6.receiver = self;
  v6.super_class = (Class)CAFNowPlaying;
  -[CAFService unregisterObserver:](&v6, sel_unregisterObserver_, v5);

}

- (CAFStringCharacteristic)currentMediaSourceIdentifierCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000023"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000032000023"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)currentMediaSourceIdentifier
{
  void *v2;
  void *v3;

  -[CAFNowPlaying currentMediaSourceIdentifierCharacteristic](self, "currentMediaSourceIdentifierCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CAFStringCharacteristic)titleCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000003"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000032000003"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[CAFNowPlaying titleCharacteristic](self, "titleCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CAFStringCharacteristic)artistCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000004"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000032000004"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)artist
{
  void *v2;
  void *v3;

  -[CAFNowPlaying artistCharacteristic](self, "artistCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CAFStringCharacteristic)albumCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000005"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000032000005"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)album
{
  void *v2;
  void *v3;

  -[CAFNowPlaying albumCharacteristic](self, "albumCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CAFStringCharacteristic)userVisibleDescriptionCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000005"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000030000005"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFStringCharacteristic *)v11;
}

- (NSString)userVisibleDescription
{
  void *v2;
  void *v3;

  -[CAFNowPlaying userVisibleDescriptionCharacteristic](self, "userVisibleDescriptionCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)hasUserVisibleDescription
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying userVisibleDescriptionCharacteristic](self, "userVisibleDescriptionCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFDataCharacteristic)artworkCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000020"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000032000020"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFDataCharacteristic *)v11;
}

- (NSData)artwork
{
  void *v2;
  void *v3;

  -[CAFNowPlaying artworkCharacteristic](self, "artworkCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (CAFMeasurementCharacteristic)jumpBackwardIntervalCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000032"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000032000032"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)jumpBackwardInterval
{
  void *v2;
  void *v3;

  -[CAFNowPlaying jumpBackwardIntervalCharacteristic](self, "jumpBackwardIntervalCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (CAFUInt16Range)jumpBackwardIntervalRange
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFNowPlaying jumpBackwardIntervalCharacteristic](self, "jumpBackwardIntervalCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uInt16Range");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt16Range *)v4;
}

- (BOOL)hasJumpBackwardInterval
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying jumpBackwardIntervalCharacteristic](self, "jumpBackwardIntervalCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFMeasurementCharacteristic)jumpForwardIntervalCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000033"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000032000033"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFMeasurementCharacteristic *)v11;
}

- (NSMeasurement)jumpForwardInterval
{
  void *v2;
  void *v3;

  -[CAFNowPlaying jumpForwardIntervalCharacteristic](self, "jumpForwardIntervalCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "measurementValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMeasurement *)v3;
}

- (CAFUInt16Range)jumpForwardIntervalRange
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFNowPlaying jumpForwardIntervalCharacteristic](self, "jumpForwardIntervalCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "range");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uInt16Range");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt16Range *)v4;
}

- (BOOL)hasJumpForwardInterval
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying jumpForwardIntervalCharacteristic](self, "jumpForwardIntervalCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFPlaybackStateCharacteristic)playbackStateCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateRegisteredForAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000034"));

  objc_opt_class();
  -[CAFService characteristicForType:](self, "characteristicForType:", CFSTR("0x0000000032000034"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  return (CAFPlaybackStateCharacteristic *)v11;
}

- (unsigned)playbackState
{
  void *v2;
  unsigned __int8 v3;

  -[CAFNowPlaying playbackStateCharacteristic](self, "playbackStateCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playbackStateValue");

  return v3;
}

- (BOOL)hasPlaybackState
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying playbackStateCharacteristic](self, "playbackStateCharacteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFPlayControl)playControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F000032"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFPlayControl *)v4;
}

- (void)playWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[CAFNowPlaying playControl](self, "playControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "playWithCompletion:", v4);
  }
  else if (v4)
  {
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__CAFNowPlaying_playWithCompletion___block_invoke;
    block[3] = &unk_2508FD320;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

void __36__CAFNowPlaying_playWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasPlay
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying playControl](self, "playControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)playDisabled
{
  void *v2;
  char v3;

  -[CAFNowPlaying playControl](self, "playControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFPauseControl)pauseControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F000033"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFPauseControl *)v4;
}

- (void)pauseWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[CAFNowPlaying pauseControl](self, "pauseControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "pauseWithCompletion:", v4);
  }
  else if (v4)
  {
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__CAFNowPlaying_pauseWithCompletion___block_invoke;
    block[3] = &unk_2508FD320;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

void __37__CAFNowPlaying_pauseWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasPause
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying pauseControl](self, "pauseControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)pauseDisabled
{
  void *v2;
  char v3;

  -[CAFNowPlaying pauseControl](self, "pauseControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFStopControl)stopControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F000034"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFStopControl *)v4;
}

- (void)stopWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[CAFNowPlaying stopControl](self, "stopControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "stopWithCompletion:", v4);
  }
  else if (v4)
  {
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__CAFNowPlaying_stopWithCompletion___block_invoke;
    block[3] = &unk_2508FD320;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

void __36__CAFNowPlaying_stopWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasStop
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying stopControl](self, "stopControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)stopDisabled
{
  void *v2;
  char v3;

  -[CAFNowPlaying stopControl](self, "stopControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFNextItemControl)nextItemControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F000035"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFNextItemControl *)v4;
}

- (void)nextItemWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[CAFNowPlaying nextItemControl](self, "nextItemControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "nextItemWithCompletion:", v4);
  }
  else if (v4)
  {
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__CAFNowPlaying_nextItemWithCompletion___block_invoke;
    block[3] = &unk_2508FD320;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

void __40__CAFNowPlaying_nextItemWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasNextItem
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying nextItemControl](self, "nextItemControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)nextItemDisabled
{
  void *v2;
  char v3;

  -[CAFNowPlaying nextItemControl](self, "nextItemControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFPreviousItemControl)previousItemControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F000036"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFPreviousItemControl *)v4;
}

- (void)previousItemWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[CAFNowPlaying previousItemControl](self, "previousItemControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "previousItemWithCompletion:", v4);
  }
  else if (v4)
  {
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__CAFNowPlaying_previousItemWithCompletion___block_invoke;
    block[3] = &unk_2508FD320;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

void __44__CAFNowPlaying_previousItemWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasPreviousItem
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying previousItemControl](self, "previousItemControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)previousItemDisabled
{
  void *v2;
  char v3;

  -[CAFNowPlaying previousItemControl](self, "previousItemControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFBeginSeekForwardControl)beginSeekForwardControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F000037"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFBeginSeekForwardControl *)v4;
}

- (void)beginSeekForwardWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[CAFNowPlaying beginSeekForwardControl](self, "beginSeekForwardControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "beginSeekForwardWithCompletion:", v4);
  }
  else if (v4)
  {
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__CAFNowPlaying_beginSeekForwardWithCompletion___block_invoke;
    block[3] = &unk_2508FD320;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

void __48__CAFNowPlaying_beginSeekForwardWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasBeginSeekForward
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying beginSeekForwardControl](self, "beginSeekForwardControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)beginSeekForwardDisabled
{
  void *v2;
  char v3;

  -[CAFNowPlaying beginSeekForwardControl](self, "beginSeekForwardControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFBeginSeekBackwardControl)beginSeekBackwardControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F000038"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFBeginSeekBackwardControl *)v4;
}

- (void)beginSeekBackwardWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[CAFNowPlaying beginSeekBackwardControl](self, "beginSeekBackwardControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "beginSeekBackwardWithCompletion:", v4);
  }
  else if (v4)
  {
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__CAFNowPlaying_beginSeekBackwardWithCompletion___block_invoke;
    block[3] = &unk_2508FD320;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

void __49__CAFNowPlaying_beginSeekBackwardWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasBeginSeekBackward
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying beginSeekBackwardControl](self, "beginSeekBackwardControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)beginSeekBackwardDisabled
{
  void *v2;
  char v3;

  -[CAFNowPlaying beginSeekBackwardControl](self, "beginSeekBackwardControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFEndSeekControl)endSeekControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F000039"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFEndSeekControl *)v4;
}

- (void)endSeekWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[CAFNowPlaying endSeekControl](self, "endSeekControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "endSeekWithCompletion:", v4);
  }
  else if (v4)
  {
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__CAFNowPlaying_endSeekWithCompletion___block_invoke;
    block[3] = &unk_2508FD320;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

void __39__CAFNowPlaying_endSeekWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasEndSeek
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying endSeekControl](self, "endSeekControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CAFJumpForwardControl)jumpForwardControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F000040"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFJumpForwardControl *)v4;
}

- (void)jumpForwardWithJumpInterval:(unsigned __int16)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;

  v4 = a3;
  v6 = a4;
  -[CAFNowPlaying jumpForwardControl](self, "jumpForwardControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "jumpForwardWithJumpInterval:completion:", v4, v6);
  }
  else if (v6)
  {
    dispatch_get_global_queue(33, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__CAFNowPlaying_jumpForwardWithJumpInterval_completion___block_invoke;
    block[3] = &unk_2508FD320;
    v11 = v6;
    dispatch_async(v9, block);

  }
}

void __56__CAFNowPlaying_jumpForwardWithJumpInterval_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasJumpForward
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying jumpForwardControl](self, "jumpForwardControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)jumpForwardDisabled
{
  void *v2;
  char v3;

  -[CAFNowPlaying jumpForwardControl](self, "jumpForwardControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFJumpBackwardControl)jumpBackwardControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F00004A"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFJumpBackwardControl *)v4;
}

- (void)jumpBackwardWithJumpInterval:(unsigned __int16)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;

  v4 = a3;
  v6 = a4;
  -[CAFNowPlaying jumpBackwardControl](self, "jumpBackwardControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "jumpBackwardWithJumpInterval:completion:", v4, v6);
  }
  else if (v6)
  {
    dispatch_get_global_queue(33, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__CAFNowPlaying_jumpBackwardWithJumpInterval_completion___block_invoke;
    block[3] = &unk_2508FD320;
    v11 = v6;
    dispatch_async(v9, block);

  }
}

void __57__CAFNowPlaying_jumpBackwardWithJumpInterval_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasJumpBackward
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying jumpBackwardControl](self, "jumpBackwardControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)jumpBackwardDisabled
{
  void *v2;
  char v3;

  -[CAFNowPlaying jumpBackwardControl](self, "jumpBackwardControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (CAFTuneToIdentifierControl)tuneToIdentifierControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F00004B"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTuneToIdentifierControl *)v4;
}

- (void)tuneToIdentifier:(id)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CAFNowPlaying tuneToIdentifierControl](self, "tuneToIdentifierControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "tuneToIdentifier:sourceIdentifier:completion:", v8, v9, v10);
  }
  else if (v10)
  {
    dispatch_get_global_queue(33, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__CAFNowPlaying_tuneToIdentifier_sourceIdentifier_completion___block_invoke;
    block[3] = &unk_2508FD320;
    v15 = v10;
    dispatch_async(v13, block);

  }
}

void __62__CAFNowPlaying_tuneToIdentifier_sourceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (CAFTuneToFrequencyControl)tuneToFrequencyControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F00004C"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFTuneToFrequencyControl *)v4;
}

- (void)tuneToFrequency:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  -[CAFNowPlaying tuneToFrequencyControl](self, "tuneToFrequencyControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "tuneToFrequency:sourceIdentifier:completion:", v6, v8, v9);
  }
  else if (v9)
  {
    dispatch_get_global_queue(33, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__CAFNowPlaying_tuneToFrequency_sourceIdentifier_completion___block_invoke;
    block[3] = &unk_2508FD320;
    v14 = v9;
    dispatch_async(v12, block);

  }
}

void __61__CAFNowPlaying_tuneToFrequency_sourceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (CAFChangeMediaSourceControl)changeMediaSourceControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F00004D"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFChangeMediaSourceControl *)v4;
}

- (void)changeMediaSourceWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;

  v6 = a3;
  v7 = a4;
  -[CAFNowPlaying changeMediaSourceControl](self, "changeMediaSourceControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "changeMediaSourceWithIdentifier:completion:", v6, v7);
  }
  else if (v7)
  {
    dispatch_get_global_queue(33, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__CAFNowPlaying_changeMediaSourceWithIdentifier_completion___block_invoke;
    block[3] = &unk_2508FD320;
    v12 = v7;
    dispatch_async(v10, block);

  }
}

void __60__CAFNowPlaying_changeMediaSourceWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (CAFSetArtistSongNotificationControl)setArtistSongNotificationControl
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFService controlForType:](self, "controlForType:", CFSTR("0x000000000F00004E"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CAFSetArtistSongNotificationControl *)v4;
}

- (void)setArtistSongNotificationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[CAFNowPlaying setArtistSongNotificationControl](self, "setArtistSongNotificationControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setArtistSongNotificationWithCompletion:", v4);
  }
  else if (v4)
  {
    dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__CAFNowPlaying_setArtistSongNotificationWithCompletion___block_invoke;
    block[3] = &unk_2508FD320;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

void __57__CAFNowPlaying_setArtistSongNotificationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BOOL)hasSetArtistSongNotification
{
  void *v2;
  BOOL v3;

  -[CAFNowPlaying setArtistSongNotificationControl](self, "setArtistSongNotificationControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)setArtistSongNotificationDisabled
{
  void *v2;
  char v3;

  -[CAFNowPlaying setArtistSongNotificationControl](self, "setArtistSongNotificationControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

+ (id)serviceIdentifier
{
  return CFSTR("0x0000000014000001");
}

+ (id)observerProtocol
{
  return &unk_25682CAC0;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  objc_super v53;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "characteristicType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", CFSTR("0x0000000032000023")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying currentMediaSourceIdentifierCharacteristic](self, "currentMediaSourceIdentifierCharacteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFNowPlaying currentMediaSourceIdentifier](self, "currentMediaSourceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nowPlayingService:didUpdateCurrentMediaSourceIdentifier:", self, v13);
LABEL_32:

      goto LABEL_33;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", CFSTR("0x0000000032000003")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying titleCharacteristic](self, "titleCharacteristic");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "isEqual:", v17);

    if (v18)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFNowPlaying title](self, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nowPlayingService:didUpdateTitle:", self, v13);
      goto LABEL_32;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqual:", CFSTR("0x0000000032000004")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying artistCharacteristic](self, "artistCharacteristic");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "isEqual:", v22);

    if (v23)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFNowPlaying artist](self, "artist");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nowPlayingService:didUpdateArtist:", self, v13);
      goto LABEL_32;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqual:", CFSTR("0x0000000032000005")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying albumCharacteristic](self, "albumCharacteristic");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "uniqueIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v25, "isEqual:", v27);

    if (v28)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFNowPlaying album](self, "album");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nowPlayingService:didUpdateAlbum:", self, v13);
      goto LABEL_32;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v29, "isEqual:", CFSTR("0x0000000030000005")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying userVisibleDescriptionCharacteristic](self, "userVisibleDescriptionCharacteristic");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "uniqueIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v30, "isEqual:", v32);

    if (v33)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFNowPlaying userVisibleDescription](self, "userVisibleDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nowPlayingService:didUpdateUserVisibleDescription:", self, v13);
      goto LABEL_32;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v34, "isEqual:", CFSTR("0x0000000032000020")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying artworkCharacteristic](self, "artworkCharacteristic");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "uniqueIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v35, "isEqual:", v37);

    if (v38)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFNowPlaying artwork](self, "artwork");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nowPlayingService:didUpdateArtwork:", self, v13);
      goto LABEL_32;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v39, "isEqual:", CFSTR("0x0000000032000032")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying jumpBackwardIntervalCharacteristic](self, "jumpBackwardIntervalCharacteristic");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "uniqueIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v40, "isEqual:", v42);

    if (v43)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFNowPlaying jumpBackwardInterval](self, "jumpBackwardInterval");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nowPlayingService:didUpdateJumpBackwardInterval:", self, v13);
      goto LABEL_32;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v44, "isEqual:", CFSTR("0x0000000032000033")) & 1) != 0)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying jumpForwardIntervalCharacteristic](self, "jumpForwardIntervalCharacteristic");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "uniqueIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v45, "isEqual:", v47);

    if (v48)
    {
      -[CAFService observers](self, "observers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFNowPlaying jumpForwardInterval](self, "jumpForwardInterval");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nowPlayingService:didUpdateJumpForwardInterval:", self, v13);
      goto LABEL_32;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "characteristicType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqual:", CFSTR("0x0000000032000034")))
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying playbackStateCharacteristic](self, "playbackStateCharacteristic");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "uniqueIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v49, "isEqual:", v51);

    if (!v52)
      goto LABEL_34;
    -[CAFService observers](self, "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nowPlayingService:didUpdatePlaybackState:", self, -[CAFNowPlaying playbackState](self, "playbackState"));
  }
LABEL_33:

LABEL_34:
  v53.receiver = self;
  v53.super_class = (Class)CAFNowPlaying;
  -[CAFService _characteristicDidUpdate:fromGroupUpdate:](&v53, sel__characteristicDidUpdate_fromGroupUpdate_, v6, v4);

}

- (void)_controlDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  objc_super v55;

  v4 = a3;
  objc_msgSend(v4, "controlType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", CFSTR("0x000000000F000032")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying playControl](self, "playControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqual:", v8);

    if (v9)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nowPlayingServiceDidUpdatePlay:", self);
LABEL_40:

      goto LABEL_41;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", CFSTR("0x000000000F000033")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying pauseControl](self, "pauseControl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqual:", v14);

    if (v15)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nowPlayingServiceDidUpdatePause:", self);
      goto LABEL_40;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqual:", CFSTR("0x000000000F000034")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying stopControl](self, "stopControl");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "isEqual:", v19);

    if (v20)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nowPlayingServiceDidUpdateStop:", self);
      goto LABEL_40;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "isEqual:", CFSTR("0x000000000F000035")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying nextItemControl](self, "nextItemControl");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "uniqueIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v22, "isEqual:", v24);

    if (v25)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nowPlayingServiceDidUpdateNextItem:", self);
      goto LABEL_40;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "isEqual:", CFSTR("0x000000000F000036")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying previousItemControl](self, "previousItemControl");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uniqueIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "isEqual:", v29);

    if (v30)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nowPlayingServiceDidUpdatePreviousItem:", self);
      goto LABEL_40;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v31, "isEqual:", CFSTR("0x000000000F000037")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying beginSeekForwardControl](self, "beginSeekForwardControl");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "uniqueIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v32, "isEqual:", v34);

    if (v35)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nowPlayingServiceDidUpdateBeginSeekForward:", self);
      goto LABEL_40;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v36, "isEqual:", CFSTR("0x000000000F000038")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying beginSeekBackwardControl](self, "beginSeekBackwardControl");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "uniqueIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v37, "isEqual:", v39);

    if (v40)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nowPlayingServiceDidUpdateBeginSeekBackward:", self);
      goto LABEL_40;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v41, "isEqual:", CFSTR("0x000000000F000040")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying jumpForwardControl](self, "jumpForwardControl");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "uniqueIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v42, "isEqual:", v44);

    if (v45)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nowPlayingServiceDidUpdateJumpForward:", self);
      goto LABEL_40;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v46, "isEqual:", CFSTR("0x000000000F00004A")) & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFNowPlaying jumpBackwardControl](self, "jumpBackwardControl");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "uniqueIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v47, "isEqual:", v49);

    if (v50)
    {
      -[CAFService observers](self, "observers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nowPlayingServiceDidUpdateJumpBackward:", self);
      goto LABEL_40;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "controlType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqual:", CFSTR("0x000000000F00004E")))
    goto LABEL_40;
  objc_msgSend(v4, "uniqueIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFNowPlaying setArtistSongNotificationControl](self, "setArtistSongNotificationControl");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "uniqueIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v51, "isEqual:", v53);

  if (v54)
  {
    -[CAFService observers](self, "observers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nowPlayingServiceDidUpdateSetArtistSongNotification:", self);
    goto LABEL_40;
  }
LABEL_41:
  v55.receiver = self;
  v55.super_class = (Class)CAFNowPlaying;
  -[CAFService _controlDidUpdate:](&v55, sel__controlDidUpdate_, v4);

}

- (BOOL)registeredForCurrentMediaSourceIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000023"));

  return v10;
}

- (BOOL)registeredForTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000003"));

  return v10;
}

- (BOOL)registeredForArtist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000004"));

  return v10;
}

- (BOOL)registeredForAlbum
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000005"));

  return v10;
}

- (BOOL)registeredForUserVisibleDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000030000005"));

  return v10;
}

- (BOOL)registeredForArtwork
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000020"));

  return v10;
}

- (BOOL)registeredForJumpBackwardInterval
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000032"));

  return v10;
}

- (BOOL)registeredForJumpForwardInterval
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000033"));

  return v10;
}

- (BOOL)registeredForPlaybackState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:characteristic:", v8, v9, CFSTR("0x0000000032000034"));

  return v10;
}

- (BOOL)registeredForPlay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F000032"));

  return v10;
}

- (BOOL)registeredForPause
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F000033"));

  return v10;
}

- (BOOL)registeredForStop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F000034"));

  return v10;
}

- (BOOL)registeredForNextItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F000035"));

  return v10;
}

- (BOOL)registeredForPreviousItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F000036"));

  return v10;
}

- (BOOL)registeredForBeginSeekForward
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F000037"));

  return v10;
}

- (BOOL)registeredForBeginSeekBackward
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F000038"));

  return v10;
}

- (BOOL)registeredForEndSeek
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F000039"));

  return v10;
}

- (BOOL)registeredForJumpForward
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F000040"));

  return v10;
}

- (BOOL)registeredForJumpBackward
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F00004A"));

  return v10;
}

- (BOOL)registeredForTuneToIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F00004B"));

  return v10;
}

- (BOOL)registeredForTuneToFrequency
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F00004C"));

  return v10;
}

- (BOOL)registeredForChangeMediaSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F00004D"));

  return v10;
}

- (BOOL)registeredForSetArtistSongNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[CAFService car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "carManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hasAccessory:service:control:", v8, v9, CFSTR("0x000000000F00004E"));

  return v10;
}

@end
