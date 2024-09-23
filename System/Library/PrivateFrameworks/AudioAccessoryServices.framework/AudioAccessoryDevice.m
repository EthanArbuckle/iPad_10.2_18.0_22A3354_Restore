@implementation AudioAccessoryDevice

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AudioAccessoryDevice)initWithIdentifier:(id)a3
{
  id v5;
  AudioAccessoryDevice *v6;
  AudioAccessoryDevice *v7;
  AudioAccessoryDevice *v8;

  v5 = a3;
  v6 = -[AudioAccessoryDevice init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = v7;
  }

  return v7;
}

- (AudioAccessoryDevice)initWithCoder:(id)a3
{
  id v4;
  AudioAccessoryDevice *v5;
  id v6;
  AudioAccessoryDevice *v7;

  v4 = a3;
  v5 = -[AudioAccessoryDevice init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_acceptReplyPlayPauseConfig = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_autoANCCapability = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_autoANCStrength = 0;
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent())
      v5->_bobbleCapability = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_bobbleConfig = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_caseSoundCapability = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_declineDismissSkipConfig = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_detectedHeadGesture = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_earTipFitTestCapability = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_frequencyBand = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_headGestureToggle = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_headGestureProxCardShown = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_heartRateMonitorEnabled = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_hideEarDetectionCapability = 0;
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent())
      v5->_listeningMode = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_listeningModeConfigs = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_listeningModeOffAllowed = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_siriMultitoneCapability = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_siriMultitoneEnabled = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_smartRoutingStateFlags = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_streamStateAoS = 0;
    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t autoANCCapability;
  uint64_t autoANCStrength;
  CBDevice *coreBluetoothDevice;
  NSData *bluetoothAddressData;
  NSString *identifier;
  uint64_t listeningMode;
  uint64_t listeningModeConfigs;
  uint64_t smartRoutingStateFlags;
  id v13;

  v4 = a3;
  v13 = v4;
  if (self->_acceptReplyPlayPauseConfig)
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    v4 = v13;
  }
  autoANCCapability = self->_autoANCCapability;
  if ((_DWORD)autoANCCapability)
  {
    objc_msgSend(v13, "encodeInt64:forKey:", autoANCCapability, CFSTR("aaCp"));
    v4 = v13;
  }
  autoANCStrength = self->_autoANCStrength;
  if ((_DWORD)autoANCStrength)
  {
    objc_msgSend(v13, "encodeInt64:forKey:", autoANCStrength, CFSTR("aaSt"));
    v4 = v13;
  }
  coreBluetoothDevice = self->_coreBluetoothDevice;
  if (coreBluetoothDevice)
  {
    objc_msgSend(v13, "encodeObject:forKey:", coreBluetoothDevice, CFSTR("cbd"));
    v4 = v13;
  }
  bluetoothAddressData = self->_bluetoothAddressData;
  if (bluetoothAddressData)
  {
    objc_msgSend(v13, "encodeObject:forKey:", bluetoothAddressData, CFSTR("btAd"));
    v4 = v13;
  }
  if (self->_bobbleCapability)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_bobbleConfig)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_caseSoundCapability)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_declineDismissSkipConfig)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_detectedHeadGesture)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_earTipFitTestCapability)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_frequencyBand)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_headGestureToggle)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_headGestureProxCardShown)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_heartRateMonitorEnabled)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_hideEarDetectionCapability)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v13, "encodeObject:forKey:", identifier, CFSTR("did"));
    v4 = v13;
  }
  listeningMode = self->_listeningMode;
  if ((_DWORD)listeningMode)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", listeningMode, CFSTR("lsnM"));
    v4 = v13;
  }
  listeningModeConfigs = self->_listeningModeConfigs;
  if ((_DWORD)listeningModeConfigs)
  {
    objc_msgSend(v13, "encodeInt64:forKey:", listeningModeConfigs, CFSTR("lsMC"));
    v4 = v13;
  }
  if (self->_listeningModeOffAllowed)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_siriMultitoneCapability)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  if (self->_siriMultitoneEnabled)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }
  smartRoutingStateFlags = self->_smartRoutingStateFlags;
  if ((_DWORD)smartRoutingStateFlags)
  {
    objc_msgSend(v13, "encodeInt64:forKey:", smartRoutingStateFlags, CFSTR("smRtS"));
    v4 = v13;
  }
  if (self->_streamStateAoS)
  {
    objc_msgSend(v13, "encodeInteger:forKey:");
    v4 = v13;
  }

}

- (NSString)bluetoothAddress
{
  NSData *bluetoothAddress;
  NSString *v4;
  NSString *v5;

  bluetoothAddress = (NSData *)self->_bluetoothAddress;
  if (!bluetoothAddress)
  {
    bluetoothAddress = self->_bluetoothAddressData;
    if (bluetoothAddress)
    {
      CUPrintNSDataAddress();
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      v5 = self->_bluetoothAddress;
      self->_bluetoothAddress = v4;

      bluetoothAddress = (NSData *)self->_bluetoothAddress;
    }
  }
  return (NSString *)bluetoothAddress;
}

- (id)description
{
  return -[AudioAccessoryDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned __int8 v3;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  unsigned int v29;
  CBDevice *v30;
  id v31;
  id v32;
  id v33;
  void *v35;
  void *v36;
  void *v37;

  v3 = a3;
  NSAppendPrintF_safe();
  v5 = 0;
  v6 = v5;
  if (self->_acceptReplyPlayPauseConfig)
  {
    v37 = v5;
    NSAppendPrintF_safe();
    v7 = v37;

    v6 = v7;
  }
  if (self->_autoANCCapability)
  {
    NSAppendPrintF_safe();
    v8 = v6;

    v6 = v8;
  }
  if (self->_autoANCStrength)
  {
    NSAppendPrintF_safe();
    v10 = v6;

    v6 = v10;
  }
  if (self->_bobbleCapability)
  {
    NSAppendPrintF_safe();
    v11 = v6;

    v6 = v11;
  }
  if (self->_bobbleConfig)
  {
    NSAppendPrintF_safe();
    v12 = v6;

    v6 = v12;
  }
  if (self->_caseSoundCapability)
  {
    NSAppendPrintF_safe();
    v13 = v6;

    v6 = v13;
  }
  if (self->_earTipFitTestCapability)
  {
    NSAppendPrintF_safe();
    v14 = v6;

    v6 = v14;
  }
  if (self->_declineDismissSkipConfig)
  {
    NSAppendPrintF_safe();
    v15 = v6;

    v6 = v15;
  }
  if (self->_detectedHeadGesture)
  {
    NSAppendPrintF_safe();
    v16 = v6;

    v6 = v16;
  }
  if (self->_headGestureToggle)
  {
    NSAppendPrintF_safe();
    v17 = v6;

    v6 = v17;
  }
  if (self->_headGestureProxCardShown)
  {
    NSAppendPrintF_safe();
    v18 = v6;

    v6 = v18;
  }
  if (self->_heartRateMonitorEnabled)
  {
    NSAppendPrintF_safe();
    v19 = v6;

    v6 = v19;
  }
  if (self->_hideEarDetectionCapability)
  {
    NSAppendPrintF_safe();
    v20 = v6;

    v6 = v20;
  }
  if (self->_frequencyBand)
  {
    NSAppendPrintF_safe();
    v21 = v6;

    v6 = v21;
  }
  if (self->_listeningMode)
  {
    NSAppendPrintF_safe();
    v22 = v6;

    v6 = v22;
  }
  if (self->_listeningModeConfigs)
  {
    CUPrintFlags32();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v23 = v6;

    v6 = v23;
  }
  if (self->_listeningModeOffAllowed)
  {
    NSAppendPrintF_safe();
    v24 = v6;

    v6 = v24;
  }
  if (self->_smartRoutingStateFlags)
  {
    CUPrintFlags32();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    v25 = v6;

    v6 = v25;
  }
  if (self->_siriMultitoneCapability)
  {
    NSAppendPrintF_safe();
    v26 = v6;

    v6 = v26;
  }
  if (self->_siriMultitoneEnabled)
  {
    NSAppendPrintF_safe();
    v27 = v6;

    v6 = v27;
  }
  if (self->_streamStateAoS)
  {
    NSAppendPrintF_safe();
    v28 = v6;

    v6 = v28;
  }
  v29 = v3;
  v30 = self->_coreBluetoothDevice;
  if (v30)
  {
    NSAppendPrintF_safe();
    v31 = v6;

    v6 = v31;
  }

  if (v29 < 0x15)
  {
    NSAppendPrintF_safe();
    v32 = v6;

    v6 = v32;
  }
  v33 = v6;

  return v33;
}

- (void)setBluetoothAddressData:(id)a3
{
  NSString *v5;
  NSString *bluetoothAddress;
  id v7;

  objc_storeStrong((id *)&self->_bluetoothAddressData, a3);
  v7 = a3;
  CUPrintNSDataAddress();
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  bluetoothAddress = self->_bluetoothAddress;
  self->_bluetoothAddress = v5;

}

- (BOOL)setDefaultConfigurationsIfNeeded
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
  {
    if (self->_bobbleCapability == 2 && !self->_headGestureToggle)
    {
      self->_headGestureToggle = 2;
      LOBYTE(v3) = 1;
      self->_acceptReplyPlayPauseConfig = 1;
      self->_declineDismissSkipConfig = 2;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)updateWithAADeviceInfo:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "autoANCCapability");
  v6 = -[AudioAccessoryDevice autoANCCapability](self, "autoANCCapability");
  v7 = (_DWORD)v5 != v6;
  if ((_DWORD)v5 != v6)
    -[AudioAccessoryDevice setAutoANCCapability:](self, "setAutoANCCapability:", v5);
  v8 = objc_msgSend(v4, "autoANCStrength");
  if ((_DWORD)v8 != -[AudioAccessoryDevice autoANCStrength](self, "autoANCStrength"))
  {
    -[AudioAccessoryDevice setAutoANCStrength:](self, "setAutoANCStrength:", v8);
    v7 = 1;
  }
  v9 = objc_msgSend(v4, "streamStateAoS");
  if ((_DWORD)v9 != -[AudioAccessoryDevice streamStateAoS](self, "streamStateAoS"))
  {
    -[AudioAccessoryDevice setStreamStateAoS:](self, "setStreamStateAoS:", v9);
    v7 = 1;
  }
  v10 = objc_msgSend(v4, "bobbleCapability");
  if ((_DWORD)v10 != -[AudioAccessoryDevice bobbleCapability](self, "bobbleCapability"))
  {
    -[AudioAccessoryDevice setBobbleCapability:](self, "setBobbleCapability:", v10);
    v7 = 1;
  }
  v11 = objc_msgSend(v4, "caseSoundCapability");
  if ((_DWORD)v11 != -[AudioAccessoryDevice caseSoundCapability](self, "caseSoundCapability"))
  {
    -[AudioAccessoryDevice setCaseSoundCapability:](self, "setCaseSoundCapability:", v11);
    v7 = 1;
  }
  v12 = objc_msgSend(v4, "earTipFitTestCapability");
  if ((_DWORD)v12 != -[AudioAccessoryDevice earTipFitTestCapability](self, "earTipFitTestCapability"))
  {
    -[AudioAccessoryDevice setEarTipFitTestCapability:](self, "setEarTipFitTestCapability:", v12);
    v7 = 1;
  }
  v13 = objc_msgSend(v4, "frequencyBand");
  if ((_DWORD)v13 != -[AudioAccessoryDevice frequencyBand](self, "frequencyBand"))
  {
    -[AudioAccessoryDevice setFrequencyBand:](self, "setFrequencyBand:", v13);
    v7 = 1;
  }
  v14 = objc_msgSend(v4, "heartRateMonitorEnabled");
  if (v14 != -[AudioAccessoryDevice heartRateMonitorEnabled](self, "heartRateMonitorEnabled"))
  {
    -[AudioAccessoryDevice setHeartRateMonitorEnabled:](self, "setHeartRateMonitorEnabled:", (char)v14);
    v7 = 1;
  }
  v15 = objc_msgSend(v4, "hideEarDetectionCapability");
  if ((_DWORD)v15 != -[AudioAccessoryDevice hideEarDetectionCapability](self, "hideEarDetectionCapability"))
  {
    -[AudioAccessoryDevice setHideEarDetectionCapability:](self, "setHideEarDetectionCapability:", v15);
    v7 = 1;
  }
  v16 = objc_msgSend(v4, "siriMultitoneCapability");
  if ((_DWORD)v16 != -[AudioAccessoryDevice siriMultitoneCapability](self, "siriMultitoneCapability"))
  {
    -[AudioAccessoryDevice setSiriMultitoneCapability:](self, "setSiriMultitoneCapability:", v16);
    v7 = 1;
  }

  return v7;
}

- (BOOL)updateWithCBDevice:(id)a3
{
  id v4;
  NSData *bluetoothAddressData;
  void *v6;
  NSData *v7;
  NSData *v8;
  BOOL v9;
  NSData *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CBDevice *coreBluetoothDevice;

  v4 = a3;
  bluetoothAddressData = self->_bluetoothAddressData;
  objc_msgSend(v4, "btAddressData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = bluetoothAddressData;
  v8 = v6;
  v9 = v7 != v8;
  if (v7 == v8)
  {

LABEL_8:
    goto LABEL_9;
  }
  v10 = v8;
  if ((v7 == 0) == (v8 != 0))
  {

    goto LABEL_7;
  }
  v11 = -[NSData isEqual:](v7, "isEqual:", v8);

  if ((v11 & 1) == 0)
  {
LABEL_7:
    objc_msgSend(v4, "btAddressData");
    v7 = (NSData *)objc_claimAutoreleasedReturnValue();
    -[AudioAccessoryDevice setBluetoothAddressData:](self, "setBluetoothAddressData:", v7);
    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:
  v12 = objc_msgSend(v4, "listeningMode");
  if ((_DWORD)v12)
  {
    v13 = v12;
    if ((_DWORD)v12 != -[AudioAccessoryDevice listeningMode](self, "listeningMode"))
    {
      -[AudioAccessoryDevice setListeningMode:](self, "setListeningMode:", v13);
      v9 = 1;
    }
  }
  v14 = objc_msgSend(v4, "listeningModeConfigs");
  if ((_DWORD)v14)
  {
    v15 = v14;
    if ((_DWORD)v14 != -[AudioAccessoryDevice listeningModeConfigs](self, "listeningModeConfigs"))
    {
      -[AudioAccessoryDevice setListeningModeConfigs:](self, "setListeningModeConfigs:", v15);
      v9 = 1;
    }
  }
  coreBluetoothDevice = self->_coreBluetoothDevice;
  self->_coreBluetoothDevice = (CBDevice *)v4;

  return v9;
}

- (unsigned)acceptReplyPlayPauseConfig
{
  return self->_acceptReplyPlayPauseConfig;
}

- (void)setAcceptReplyPlayPauseConfig:(unsigned __int8)a3
{
  self->_acceptReplyPlayPauseConfig = a3;
}

- (unsigned)autoANCCapability
{
  return self->_autoANCCapability;
}

- (void)setAutoANCCapability:(unsigned int)a3
{
  self->_autoANCCapability = a3;
}

- (unsigned)autoANCStrength
{
  return self->_autoANCStrength;
}

- (void)setAutoANCStrength:(unsigned int)a3
{
  self->_autoANCStrength = a3;
}

- (NSData)bluetoothAddressData
{
  return self->_bluetoothAddressData;
}

- (unsigned)bobbleCapability
{
  return self->_bobbleCapability;
}

- (void)setBobbleCapability:(unsigned __int8)a3
{
  self->_bobbleCapability = a3;
}

- (unsigned)bobbleConfig
{
  return self->_bobbleConfig;
}

- (void)setBobbleConfig:(unsigned __int8)a3
{
  self->_bobbleConfig = a3;
}

- (unsigned)caseSoundCapability
{
  return self->_caseSoundCapability;
}

- (void)setCaseSoundCapability:(unsigned __int8)a3
{
  self->_caseSoundCapability = a3;
}

- (unsigned)declineDismissSkipConfig
{
  return self->_declineDismissSkipConfig;
}

- (void)setDeclineDismissSkipConfig:(unsigned __int8)a3
{
  self->_declineDismissSkipConfig = a3;
}

- (unsigned)detectedHeadGesture
{
  return self->_detectedHeadGesture;
}

- (void)setDetectedHeadGesture:(unsigned __int8)a3
{
  self->_detectedHeadGesture = a3;
}

- (unsigned)earTipFitTestCapability
{
  return self->_earTipFitTestCapability;
}

- (void)setEarTipFitTestCapability:(unsigned __int8)a3
{
  self->_earTipFitTestCapability = a3;
}

- (unsigned)frequencyBand
{
  return self->_frequencyBand;
}

- (void)setFrequencyBand:(unsigned __int8)a3
{
  self->_frequencyBand = a3;
}

- (char)headGestureToggle
{
  return self->_headGestureToggle;
}

- (void)setHeadGestureToggle:(char)a3
{
  self->_headGestureToggle = a3;
}

- (char)headGestureProxCardShown
{
  return self->_headGestureProxCardShown;
}

- (void)setHeadGestureProxCardShown:(char)a3
{
  self->_headGestureProxCardShown = a3;
}

- (char)heartRateMonitorEnabled
{
  return self->_heartRateMonitorEnabled;
}

- (void)setHeartRateMonitorEnabled:(char)a3
{
  self->_heartRateMonitorEnabled = a3;
}

- (unsigned)hideEarDetectionCapability
{
  return self->_hideEarDetectionCapability;
}

- (void)setHideEarDetectionCapability:(unsigned __int8)a3
{
  self->_hideEarDetectionCapability = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)listeningMode
{
  return self->_listeningMode;
}

- (void)setListeningMode:(int)a3
{
  self->_listeningMode = a3;
}

- (unsigned)listeningModeConfigs
{
  return self->_listeningModeConfigs;
}

- (void)setListeningModeConfigs:(unsigned int)a3
{
  self->_listeningModeConfigs = a3;
}

- (char)listeningModeOffAllowed
{
  return self->_listeningModeOffAllowed;
}

- (void)setListeningModeOffAllowed:(char)a3
{
  self->_listeningModeOffAllowed = a3;
}

- (unsigned)siriMultitoneCapability
{
  return self->_siriMultitoneCapability;
}

- (void)setSiriMultitoneCapability:(unsigned __int8)a3
{
  self->_siriMultitoneCapability = a3;
}

- (char)siriMultitoneEnabled
{
  return self->_siriMultitoneEnabled;
}

- (void)setSiriMultitoneEnabled:(char)a3
{
  self->_siriMultitoneEnabled = a3;
}

- (unsigned)smartRoutingStateFlags
{
  return self->_smartRoutingStateFlags;
}

- (void)setSmartRoutingStateFlags:(unsigned int)a3
{
  self->_smartRoutingStateFlags = a3;
}

- (unsigned)streamStateAoS
{
  return self->_streamStateAoS;
}

- (void)setStreamStateAoS:(unsigned __int8)a3
{
  self->_streamStateAoS = a3;
}

- (CBDevice)coreBluetoothDevice
{
  return self->_coreBluetoothDevice;
}

- (void)setCoreBluetoothDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreBluetoothDevice, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bluetoothAddressData, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end
