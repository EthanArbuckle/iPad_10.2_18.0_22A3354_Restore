@implementation AXSANSControllerImplementation

- (_TtP18AXSoundDetectionUI34AXSDSoundActionsControllerDelegate_)delegate
{
  swift_beginAccess();
  return (_TtP18AXSoundDetectionUI34AXSDSoundActionsControllerDelegate_ *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)isListening
{
  id *v3;
  id v4;
  _TtC18AXSoundDetectionUI30AXSANSControllerImplementation *v5;
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

- (_TtC18AXSoundDetectionUI30AXSANSControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI30AXSANSControllerImplementation *)AXSANSControllerImplementation.init()();
}

- (void)startListening
{
  _TtC18AXSoundDetectionUI30AXSANSControllerImplementation *v2;

  v2 = self;
  sub_21AD0972C(0);

}

- (void)startListeningOnQueue:(id)a3
{
  id v5;
  _TtC18AXSoundDetectionUI30AXSANSControllerImplementation *v6;

  v5 = a3;
  v6 = self;
  sub_21AD0972C(a3);

}

- (void)stopListening
{
  _TtC18AXSoundDetectionUI30AXSANSControllerImplementation *v2;

  v2 = self;
  sub_21ACFA6AC(v2, v2);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_processingQueue));
  swift_unknownObjectRelease();
}

- (void)receivedBuffer:(id)a3 atTime:(id)a4
{
  objc_class *v6;
  id v7;
  AVAudioPCMBuffer v8;
  _TtC18AXSoundDetectionUI30AXSANSControllerImplementation *v9;

  v6 = (objc_class *)a3;
  v7 = a4;
  v9 = self;
  v8.super.super.isa = v6;
  v8.super._impl = v7;
  AXSANSControllerImplementation.receivedBuffer(_:at:)(v8, (AVAudioTime *)v9);

}

- (void)listenEngineDidStartWithInputFormat:(id)a3
{
  id v5;
  _TtC18AXSoundDetectionUI30AXSANSControllerImplementation *v6;

  v5 = a3;
  v6 = self;
  AXSANSControllerImplementation.listenEngineDidStart(withInputFormat:)((AVAudioFormat_optional *)a3);

}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  _TtC18AXSoundDetectionUI30AXSANSControllerImplementation *v4;
  id v5;

  v5 = a3;
  v4 = self;
  AXSANSControllerImplementation.listenEngineFailedToStartWithError(_:)(v5);

}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
  id v6;
  id v7;
  _TtC18AXSoundDetectionUI30AXSANSControllerImplementation *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s18AXSoundDetectionUI30AXSANSControllerImplementationC19receivedObservation_11forDetectorySo20SNSoundActionsResultC_So20SNDetectSoundRequestCtF_0(v6);

}

- (void)receivedError:(id)a3 fromDetector:(id)a4
{
  id v6;
  _TtC18AXSoundDetectionUI30AXSANSControllerImplementation *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  AXSANSControllerImplementation.receivedError(_:fromDetector:)(v8, v6);

}

- (void)listeningStoppedWithError:(id)a3
{
  _TtC18AXSoundDetectionUI30AXSANSControllerImplementation *v4;
  id v5;

  v5 = a3;
  v4 = self;
  AXSANSControllerImplementation.listeningStoppedWithError(_:)(v5);

}

@end
