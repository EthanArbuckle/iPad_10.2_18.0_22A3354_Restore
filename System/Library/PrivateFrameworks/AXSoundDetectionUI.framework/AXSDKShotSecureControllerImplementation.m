@implementation AXSDKShotSecureControllerImplementation

- (NSSet)currentDetectionTypes
{
  _TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation *v2;
  void *v3;

  v2 = self;
  sub_21ACFA858();

  v3 = (void *)sub_21AD24024();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (_TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation *)AXSDKShotSecureControllerImplementation.init()();
}

- (void)dealloc
{
  _TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation *v3;
  objc_super v4;

  type metadata accessor for AXSDKShotMonitor();
  v3 = self;
  swift_initStaticObject();
  sub_21AD0B87C();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AXSDKShotSecureControllerImplementation();
  -[AXSDSecureBaseControllerImplementation dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation_detectorQueueManager));
}

- (void)addWithCustomDetector:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_21ACFAEFC(v4);

}

- (void)removeWithCustomDetector:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_21ACFAF64(v4);

}

- (void)removeAllListenTypes
{
  _TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation *v2;

  v2 = self;
  sub_21AD0DDB4();

}

- (void)startListening
{
  _TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation *v2;

  v2 = self;
  sub_21AD0DFDC();

}

- (void)stopListening
{
  _TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation *v2;

  v2 = self;
  sub_21AD0E224();

}

@end
