@implementation HPMHeadphoneDevice

- (CBDevice)cbDevice
{
  HPMHeadphoneDevice *v2;
  id v5;

  v2 = self;
  v5 = HeadphoneDevice.cbDevice.getter();

  return (CBDevice *)v5;
}

- (void)setCbDevice:(id)a3
{
  id v4;
  HPMHeadphoneDevice *v5;

  v4 = a3;
  v5 = self;
  HeadphoneDevice.cbDevice.setter(a3);

}

- (CBProductInfo)productInfo
{
  HPMHeadphoneDevice *v2;
  id v5;

  v2 = self;
  v5 = HeadphoneDevice.productInfo.getter();

  return (CBProductInfo *)v5;
}

- (void)setProductInfo:(id)a3
{
  id v4;
  HPMHeadphoneDevice *v5;

  v4 = a3;
  v5 = self;
  HeadphoneDevice.productInfo.setter(a3);

}

- (AudioAccessoryDevice)aaDevice
{
  HPMHeadphoneDevice *v2;
  id v5;

  v2 = self;
  v5 = HeadphoneDevice.aaDevice.getter();

  return (AudioAccessoryDevice *)v5;
}

- (void)setAaDevice:(id)a3
{
  id v4;
  HPMHeadphoneDevice *v5;

  v4 = a3;
  v5 = self;
  HeadphoneDevice.aaDevice.setter(a3);

}

- (UIImage)icon
{
  HPMHeadphoneDevice *v2;
  id v5;

  v2 = self;
  v5 = HeadphoneDevice.icon.getter();

  return (UIImage *)v5;
}

- (NSString)btAddress
{
  HPMHeadphoneDevice *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = self;
  v6 = HeadphoneDevice.btAddress.getter();
  v7 = v3;

  v8 = (id)MEMORY[0x24263ADA4](v6, v7);
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (BOOL)isUpdatingDeviceConfig
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.isUpdatingDeviceConfig.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsUpdatingDeviceConfig:(BOOL)a3
{
  HPMHeadphoneDevice *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isUpdatingDeviceConfig.setter(v4 & 1);

}

- (BOOL)isAirpods
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.isAirpods.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsAirpods:(BOOL)a3
{
  HPMHeadphoneDevice *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isAirpods.setter(v4 & 1);

}

- (BOOL)findMyNetworkSupport
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.findMyNetworkSupport.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setFindMyNetworkSupport:(BOOL)a3
{
  HPMHeadphoneDevice *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.findMyNetworkSupport.setter(v4 & 1);

}

- (BOOL)isResettingFindMyNetworkOnError
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.isResettingFindMyNetworkOnError.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsResettingFindMyNetworkOnError:(BOOL)a3
{
  HPMHeadphoneDevice *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isResettingFindMyNetworkOnError.setter(v4 & 1);

}

- (BOOL)findMyNetworkEnable
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.findMyNetworkEnable.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setFindMyNetworkEnable:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.findMyNetworkEnable.setter();

}

- (SPOwnerSessionProtocol)findMyNetworkSession
{
  HPMHeadphoneDevice *v2;
  id v5;

  v2 = self;
  v5 = (id)HeadphoneDevice.findMyNetworkSession.getter();

  return (SPOwnerSessionProtocol *)v5;
}

- (void)setFindMyNetworkSession:(id)a3
{
  HPMHeadphoneDevice *v4;

  swift_unknownObjectRetain();
  v4 = self;
  HeadphoneDevice.findMyNetworkSession.setter((uint64_t)a3);

}

- (BOOL)findMyNetworkValueUpdated
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.findMyNetworkValueUpdated.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setFindMyNetworkValueUpdated:(BOOL)a3
{
  HPMHeadphoneDevice *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.findMyNetworkValueUpdated.setter(v4 & 1);

}

- (BOOL)isSettingFindMyNetworkValue
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.isSettingFindMyNetworkValue.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsSettingFindMyNetworkValue:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isSettingFindMyNetworkValue.setter();

}

- (NSString)name
{
  HPMHeadphoneDevice *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = self;
  v6 = HeadphoneDevice.name.getter();
  v7 = v3;

  v8 = (id)MEMORY[0x24263ADA4](v6, v7);
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (void)setName:(id)a3
{
  id v4;
  HPMHeadphoneDevice *v5;

  v4 = a3;
  v5 = self;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  HeadphoneDevice.name.setter();

}

- (int)listeningMode
{
  HPMHeadphoneDevice *v2;
  int v5;

  v2 = self;
  v5 = HeadphoneDevice.listeningMode.getter();

  return v5;
}

- (void)setListeningMode:(int)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.listeningMode.setter();

}

- (unsigned)clickHoldModeLeft
{
  HPMHeadphoneDevice *v2;
  unsigned __int8 v5;

  v2 = self;
  v5 = HeadphoneDevice.clickHoldModeLeft.getter();

  return v5;
}

- (void)setClickHoldModeLeft:(unsigned __int8)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.clickHoldModeLeft.setter();

}

- (unsigned)clickHoldModeRight
{
  HPMHeadphoneDevice *v2;
  unsigned __int8 v5;

  v2 = self;
  v5 = HeadphoneDevice.clickHoldModeRight.getter();

  return v5;
}

- (void)setClickHoldModeRight:(unsigned __int8)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.clickHoldModeRight.setter();

}

- (unsigned)listeningModeConfigs
{
  HPMHeadphoneDevice *v2;
  unsigned int v5;

  v2 = self;
  v5 = HeadphoneDevice.listeningModeConfigs.getter();

  return v5;
}

- (void)setListeningModeConfigs:(unsigned int)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.listeningModeConfigs.setter(a3);

}

- (BOOL)pressHoldAuto
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.pressHoldAuto.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setPressHoldAuto:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.pressHoldAuto.setter();

}

- (BOOL)pressHoldTransparency
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.pressHoldTransparency.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setPressHoldTransparency:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.pressHoldTransparency.setter();

}

- (BOOL)pressHoldOff
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.pressHoldOff.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setPressHoldOff:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.pressHoldOff.setter();

}

- (BOOL)pressHoldNoiseCancel
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.pressHoldNoiseCancel.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setPressHoldNoiseCancel:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.pressHoldNoiseCancel.setter();

}

- (char)doubleTapActionLeft
{
  HPMHeadphoneDevice *v2;
  char v5;

  v2 = self;
  v5 = HeadphoneDevice.doubleTapActionLeft.getter();

  return v5;
}

- (void)setDoubleTapActionLeft:(char)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.doubleTapActionLeft.setter();

}

- (char)doubleTapActionRight
{
  HPMHeadphoneDevice *v2;
  char v5;

  v2 = self;
  v5 = HeadphoneDevice.doubleTapActionRight.getter();

  return v5;
}

- (void)setDoubleTapActionRight:(char)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.doubleTapActionRight.setter();

}

- (unsigned)crownRotationDirection
{
  HPMHeadphoneDevice *v2;
  unsigned __int8 v5;

  v2 = self;
  v5 = HeadphoneDevice.crownRotationDirection.getter();

  return v5;
}

- (void)setCrownRotationDirection:(unsigned __int8)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.crownRotationDirection.setter();

}

- (BOOL)inEarDetection
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.inEarDetection.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setInEarDetection:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.inEarDetection.setter();

}

- (BOOL)batteryCharging
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.batteryCharging.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setBatteryCharging:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.batteryCharging.setter();

}

- (char)smartRoutingMode
{
  HPMHeadphoneDevice *v2;
  char v5;

  v2 = self;
  v5 = HeadphoneDevice.smartRoutingMode.getter();

  return v5;
}

- (void)setSmartRoutingMode:(char)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.smartRoutingMode.setter();

}

- (char)microphoneMode
{
  HPMHeadphoneDevice *v2;
  char v5;

  v2 = self;
  v5 = HeadphoneDevice.microphoneMode.getter();

  return v5;
}

- (void)setMicrophoneMode:(char)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.microphoneMode.setter();

}

- (BOOL)volumeControlToggle
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.volumeControlToggle.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setVolumeControlToggle:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.volumeControlToggle.setter();

}

- (BOOL)volumeControlView
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.volumeControlView.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setVolumeControlView:(BOOL)a3
{
  HPMHeadphoneDevice *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.volumeControlView.setter(v4 & 1);

}

- (BOOL)spatialProfileExists
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.spatialProfileExists.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setSpatialProfileExists:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.spatialProfileExists.setter();

}

- (BOOL)isCaseSoundSupported
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.isCaseSoundSupported.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsCaseSoundSupported:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isCaseSoundSupported.setter();

}

- (BOOL)caseSound
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.caseSound.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setCaseSound:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.caseSound.setter();

}

- (BTAirPodsControlServiceClient)airPodsServiceClient
{
  HPMHeadphoneDevice *v2;
  id v5;

  v2 = self;
  v5 = HeadphoneDevice.airPodsServiceClient.getter();

  return (BTAirPodsControlServiceClient *)v5;
}

- (void)setAirPodsServiceClient:(id)a3
{
  id v4;
  HPMHeadphoneDevice *v5;

  v4 = a3;
  v5 = self;
  HeadphoneDevice.airPodsServiceClient.setter(a3);

}

- (BOOL)isResettingCaseSoundOnError
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.isResettingCaseSoundOnError.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsResettingCaseSoundOnError:(BOOL)a3
{
  HPMHeadphoneDevice *v3;
  char v4;

  v3 = self;
  v4 = _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isResettingCaseSoundOnError.setter(v4 & 1);

}

- (BOOL)isSettingCaseSoundValue
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.isSettingCaseSoundValue.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setIsSettingCaseSoundValue:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.isSettingCaseSoundValue.setter();

}

- (unsigned)endCallGesture
{
  HPMHeadphoneDevice *v2;
  unsigned __int8 v5;

  v2 = self;
  v5 = HeadphoneDevice.endCallGesture.getter();

  return v5;
}

- (void)setEndCallGesture:(unsigned __int8)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.endCallGesture.setter();

}

- (unsigned)muteControlGesture
{
  HPMHeadphoneDevice *v2;
  unsigned __int8 v5;

  v2 = self;
  v5 = HeadphoneDevice.muteControlGesture.getter();

  return v5;
}

- (void)setMuteControlGesture:(unsigned __int8)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.muteControlGesture.setter();

}

- (NSDictionary)serialNumbers
{
  HPMHeadphoneDevice *v2;
  Class isa;

  v2 = self;
  HeadphoneDevice.serialNumbers.getter();

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (void)setSerialNumbers:(id)a3
{
  id v4;
  HPMHeadphoneDevice *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  HeadphoneDevice.serialNumbers.setter(v6);

}

- (BOOL)selectiveSpeechListening
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.selectiveSpeechListening.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setSelectiveSpeechListening:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.selectiveSpeechListening.setter();

}

- (BOOL)conversationDetect
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.conversationDetect.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setConversationDetect:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.conversationDetect.setter();

}

- (BOOL)adaptiveVolume
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.adaptiveVolume.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setAdaptiveVolume:(BOOL)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  _convertObjCBoolToBool(_:)();
  HeadphoneDevice.adaptiveVolume.setter();

}

- (float)batteryLevelMain
{
  HPMHeadphoneDevice *v2;
  float v5;

  v2 = self;
  v5 = HeadphoneDevice.batteryLevelMain.getter();

  return v5;
}

- (void)setBatteryLevelMain:(float)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.batteryLevelMain.setter();

}

- (unsigned)batteryStateMain
{
  HPMHeadphoneDevice *v2;
  unsigned __int8 v5;

  v2 = self;
  v5 = HeadphoneDevice.batteryStateMain.getter();

  return v5;
}

- (void)setBatteryStateMain:(unsigned __int8)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.batteryStateMain.setter();

}

- (float)batteryLevelLeft
{
  HPMHeadphoneDevice *v2;
  float v5;

  v2 = self;
  v5 = HeadphoneDevice.batteryLevelLeft.getter();

  return v5;
}

- (void)setBatteryLevelLeft:(float)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.batteryLevelLeft.setter();

}

- (unsigned)batteryStateLeft
{
  HPMHeadphoneDevice *v2;
  unsigned __int8 v5;

  v2 = self;
  v5 = HeadphoneDevice.batteryStateLeft.getter();

  return v5;
}

- (void)setBatteryStateLeft:(unsigned __int8)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.batteryStateLeft.setter();

}

- (float)batteryLevelRight
{
  HPMHeadphoneDevice *v2;
  float v5;

  v2 = self;
  v5 = HeadphoneDevice.batteryLevelRight.getter();

  return v5;
}

- (void)setBatteryLevelRight:(float)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.batteryLevelRight.setter();

}

- (unsigned)batteryStateRight
{
  HPMHeadphoneDevice *v2;
  unsigned __int8 v5;

  v2 = self;
  v5 = HeadphoneDevice.batteryStateRight.getter();

  return v5;
}

- (void)setBatteryStateRight:(unsigned __int8)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.batteryStateRight.setter();

}

- (float)batteryLevelCase
{
  HPMHeadphoneDevice *v2;
  float v5;

  v2 = self;
  v5 = HeadphoneDevice.batteryLevelCase.getter();

  return v5;
}

- (void)setBatteryLevelCase:(float)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.batteryLevelCase.setter();

}

- (unsigned)batteryStateCase
{
  HPMHeadphoneDevice *v2;
  unsigned __int8 v5;

  v2 = self;
  v5 = HeadphoneDevice.batteryStateCase.getter();

  return v5;
}

- (void)setBatteryStateCase:(unsigned __int8)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.batteryStateCase.setter();

}

- (HPMHeadphoneDevice)initWithCbDevice:(id)a3 delegate:(id)a4
{
  id v4;

  v4 = a3;
  swift_unknownObjectRetain();
  return (HPMHeadphoneDevice *)HeadphoneDevice.init(cbDevice:delegate:)(a3);
}

- (HPMHeadphoneDevice)initWith_aaDevice:(id)a3 cbDevice:(id)a4 delegate:(id)a5
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  swift_unknownObjectRetain();
  return (HPMHeadphoneDevice *)HeadphoneDevice.init(_aaDevice:cbDevice:delegate:)(a3, a4, (uint64_t)a5);
}

- (BOOL)supportsFeatureWithFeature:(int64_t)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.supportsFeature(feature:)(a3);

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)updateFeatureValuesWithFeature:(int64_t)a3
{
  HPMHeadphoneDevice *v3;
  uint64_t v4;

  v3 = self;
  HeadphoneDevice.updateFeatureValues(feature:)(a3, v4);

}

- (id)getFindMyUrlWithHpDevice:(id)a3
{
  uint64_t v4;
  id v5;
  HPMHeadphoneDevice *v6;
  NSURL *v7;
  void *v8;
  uint64_t v10;
  unint64_t v11;
  HPMHeadphoneDevice *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v12 = self;
  v13 = a3;
  v15 = type metadata accessor for URL();
  v14 = *(_QWORD *)(v15 - 8);
  v11 = (*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v16 = (uint64_t)&v10 - v11;
  v5 = (id)MEMORY[0x24BDAC7A8](v13, v4);
  v6 = self;
  HeadphoneDevice.getFindMyUrl(hpDevice:)(v13, v16);

  URL._bridgeToObjectiveC()(v7);
  v17 = v8;
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v15);
  return v17;
}

- (void)featureUpdateListenerWith_aaDevice:(id)a3 cbDevice:(id)a4
{
  id v5;
  id v6;
  HPMHeadphoneDevice *v7;

  v5 = a3;
  v6 = a4;
  v7 = self;
  HeadphoneDevice.featureUpdateListener(_aaDevice:cbDevice:)(a3, (uint64_t)a4);

}

- (void)featureUpdateListenerWithCbDevice:(id)a3
{
  id v4;
  HPMHeadphoneDevice *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  HeadphoneDevice.featureUpdateListener(cbDevice:)((uint64_t)a3, v6);

}

- (id)getModelName
{
  HPMHeadphoneDevice *v2;
  Swift::String v3;
  id v6;

  v2 = self;
  v3 = HeadphoneDevice.getModelName()();

  v6 = (id)MEMORY[0x24263ADA4](v3._countAndFlagsBits, v3._object);
  swift_bridgeObjectRelease();
  return v6;
}

- (void)setFindMyStatus
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.setFindMyStatus()();

}

- (void)resetToggle
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.resetToggle()();

}

- (void)setCaseSilentMode
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.setCaseSilentMode()();

}

- (BOOL)isiCloudSignedIn
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.isiCloudSignedIn()();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setPressHoldDefaults
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.setPressHoldDefaults()();

}

- (void)isSpatialProfileRecordPresent
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.isSpatialProfileRecordPresent()();

}

- (void)removeSpatialProfileRecord
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.removeSpatialProfileRecord()();

}

- (void)getCaseSilentMode
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.getCaseSilentMode()();

}

- (void)populateSerialNumbers
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.populateSerialNumbers()();

}

- (BOOL)validatePressHoldCombination
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.validatePressHoldCombination()();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (BOOL)shouldShowFindMyNetworkAlert
{
  HPMHeadphoneDevice *v2;

  v2 = self;
  HeadphoneDevice.shouldShowFindMyNetworkAlert()();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (unsigned)accessorySettingFeatureBitMask
{
  HPMHeadphoneDevice *v2;
  unsigned int v5;

  v2 = self;
  v5 = HeadphoneDevice.accessorySettingFeatureBitMask.getter();

  return v5;
}

- (void)setAccessorySettingFeatureBitMask:(unsigned int)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.accessorySettingFeatureBitMask.setter(a3);

}

- (unsigned)deviceColor
{
  HPMHeadphoneDevice *v2;
  unsigned int v5;

  v2 = self;
  v5 = HeadphoneDevice.deviceColor.getter();

  return v5;
}

- (void)setDeviceColor:(unsigned int)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.deviceColor.setter(a3);

}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  HPMHeadphoneDevice *v3;

  v3 = self;
  HeadphoneDevice.isServiceSupported(_:)(a3);

  return _convertBoolToObjCBool(_:)() & 1;
}

- (HPMHeadphoneDevice)init
{
  return (HPMHeadphoneDevice *)HeadphoneDevice.init()();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *);
  uint64_t v24;
  void (*v25)(char *);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *);
  uint64_t v30;
  void (*v31)(char *);
  uint64_t v32;
  uint64_t v33;

  outlined destroy of AudioAccessoryDevice?((id *)((char *)&self->super.isa + OBJC_IVAR___HPMHeadphoneDevice_aaDevice));
  outlined destroy of UIImage?((id *)((char *)&self->super.isa + OBJC_IVAR___HPMHeadphoneDevice_icon));
  outlined destroy of String();
  v9 = OBJC_IVAR___HPMHeadphoneDevice__findMyNetworkEnable;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Bool>);
  v25 = *(void (**)(char *))(*(_QWORD *)(v24 - 8) + 8);
  v25((char *)self + v9);
  swift_unknownObjectRelease();
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__isSettingFindMyNetworkValue, v24);
  v10 = OBJC_IVAR___HPMHeadphoneDevice__name;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<String>);
  (*(void (**)(char *))(*(_QWORD *)(v2 - 8) + 8))((char *)self + v10);
  v11 = OBJC_IVAR___HPMHeadphoneDevice__listeningMode;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBListeningMode>);
  (*(void (**)(char *))(*(_QWORD *)(v3 - 8) + 8))((char *)self + v11);
  v12 = OBJC_IVAR___HPMHeadphoneDevice__clickHoldModeLeft;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBPeerUIGestureMode>);
  v14 = *(void (**)(char *))(*(_QWORD *)(v13 - 8) + 8);
  v14((char *)self + v12);
  ((void (*)(char *, uint64_t))v14)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__clickHoldModeRight, v13);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__pressHoldAuto, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__pressHoldTransparency, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__pressHoldOff, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__pressHoldNoiseCancel, v24);
  v15 = OBJC_IVAR___HPMHeadphoneDevice__doubleTapActionLeft;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBDoubleTapAction>);
  v17 = *(void (**)(char *))(*(_QWORD *)(v16 - 8) + 8);
  v17((char *)self + v15);
  ((void (*)(char *, uint64_t))v17)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__doubleTapActionRight, v16);
  v18 = OBJC_IVAR___HPMHeadphoneDevice__crownRotationDirection;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBPeerCrownRotationDirection>);
  (*(void (**)(char *))(*(_QWORD *)(v4 - 8) + 8))((char *)self + v18);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__inEarDetection, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryCharging, v24);
  v19 = OBJC_IVAR___HPMHeadphoneDevice__smartRoutingMode;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBSmartRoutingMode>);
  (*(void (**)(char *))(*(_QWORD *)(v5 - 8) + 8))((char *)self + v19);
  v20 = OBJC_IVAR___HPMHeadphoneDevice__microphoneMode;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBMicrophoneMode>);
  (*(void (**)(char *))(*(_QWORD *)(v6 - 8) + 8))((char *)self + v20);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__volumeControlToggle, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__spatialProfileExists, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__isCaseSoundSupported, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__caseSound, v24);
  outlined destroy of BTAirPodsControlServiceClient?((id *)((char *)&self->super.isa
                                                          + OBJC_IVAR___HPMHeadphoneDevice_airPodsServiceClient));
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__isSettingCaseSoundValue, v24);
  v21 = OBJC_IVAR___HPMHeadphoneDevice__endCallGesture;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBPeerCallConfig>);
  v23 = *(void (**)(char *))(*(_QWORD *)(v22 - 8) + 8);
  v23((char *)self + v21);
  ((void (*)(char *, uint64_t))v23)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__muteControlGesture, v22);
  outlined destroy of [Int : String]();
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__selectiveSpeechListening, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__conversationDetect, v24);
  ((void (*)(char *, uint64_t))v25)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__adaptiveVolume, v24);
  v26 = OBJC_IVAR___HPMHeadphoneDevice__batteryLevelMain;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Float>);
  v29 = *(void (**)(char *))(*(_QWORD *)(v28 - 8) + 8);
  v29((char *)self + v26);
  v27 = OBJC_IVAR___HPMHeadphoneDevice__batteryStateMain;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CBBatteryState>);
  v31 = *(void (**)(char *))(*(_QWORD *)(v30 - 8) + 8);
  v31((char *)self + v27);
  ((void (*)(char *, uint64_t))v29)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryLevelLeft, v28);
  ((void (*)(char *, uint64_t))v31)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryStateLeft, v30);
  ((void (*)(char *, uint64_t))v29)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryLevelRight, v28);
  ((void (*)(char *, uint64_t))v31)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryStateRight, v30);
  ((void (*)(char *, uint64_t))v29)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryLevelCase, v28);
  ((void (*)(char *, uint64_t))v31)((char *)self + OBJC_IVAR___HPMHeadphoneDevice__batteryStateCase, v30);
  v32 = OBJC_IVAR___HPMHeadphoneDevice__hearingRecord;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<HearingRecord>);
  (*(void (**)(char *))(*(_QWORD *)(v7 - 8) + 8))((char *)self + v32);
  v33 = OBJC_IVAR___HPMHeadphoneDevice__audioAccessoryDevice;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<AADevice>);
  (*(void (**)(char *))(*(_QWORD *)(v8 - 8) + 8))((char *)self + v33);
  outlined destroy of weak HeadphoneDeviceDelegate?();
}

@end
