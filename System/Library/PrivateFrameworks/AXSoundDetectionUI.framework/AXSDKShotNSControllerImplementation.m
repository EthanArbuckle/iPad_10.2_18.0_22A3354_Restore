@implementation AXSDKShotNSControllerImplementation

- (BOOL)isListening
{
  id *v3;
  id v4;
  _TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *v5;
  unsigned __int8 v6;

  v3 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  if (objc_msgSend(v4, sel_containsListenDelegate_, v5))
    v6 = objc_msgSend(*v3, sel_isListening);
  else
    v6 = 0;

  return v6;
}

- (NSSet)currentDetectionTypes
{
  void *v2;
  _TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager);
  v3 = self;
  v4 = objc_msgSend(v2, sel_currentDetectors);
  v5 = sub_21AD23FAC();

  sub_21ACF79AC(v5);
  swift_bridgeObjectRelease();
  v6 = (void *)sub_21AD24024();
  swift_bridgeObjectRelease();
  return (NSSet *)v6;
}

- (_TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *)sub_21ACF3028();
}

- (void)dealloc
{
  _TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *v3;
  objc_super v4;

  type metadata accessor for AXSDKShotMonitor();
  v3 = self;
  swift_initStaticObject();
  sub_21AD0B87C();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AXSDKShotNSControllerImplementation();
  -[AXSDKShotNSControllerImplementation dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager));
}

- (void)startListening
{
  _TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *v2;

  v2 = self;
  sub_21ACF367C();

}

- (void)stopListening
{
  _TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *v2;

  v2 = self;
  sub_21ACF3A84();

}

- (void)addWithCustomDetector:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_addCustomDetector_, a3);
}

- (void)removeWithCustomDetector:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_removeCustomDetector_, a3);
}

- (void)removeAllListenTypes
{
  _TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *v2;

  v2 = self;
  sub_21ACF40CC();

}

- (void)listenEngineDidStartWithInputFormat:(id)a3
{
  id v5;
  _TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *v6;

  v5 = a3;
  v6 = self;
  AXSDKShotNSControllerImplementation.listenEngineDidStart(withInputFormat:)((AVAudioFormat_optional *)a3);

}

- (void)receivedBuffer:(id)a3 atTime:(id)a4
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_processAudioBuffer_atTime_, a3, a4);
}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  _TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *v4;
  id v5;

  v5 = a3;
  v4 = self;
  AXSDKShotNSControllerImplementation.listenEngineFailedToStartWithError(_:)(v5);

}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
  id v6;
  id v7;
  _TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  AXSDKShotNSControllerImplementation.receivedObservation(_:forDetector:)((SNClassificationResult)v6, (SNClassifySoundRequest)v7);

}

- (void)receivedCompletion:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  AXSDKShotNSControllerImplementation.receivedCompletion(_:)((SNClassifySoundRequest)v4);

}

- (void)receivedError:(id)a3 fromDetector:(id)a4
{
  id v6;
  _TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  AXSDKShotNSControllerImplementation.receivedError(_:fromDetector:)(v8, v6);

}

@end
