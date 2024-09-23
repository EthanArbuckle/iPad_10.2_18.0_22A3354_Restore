@implementation AXSDKShotNSRecordingControllerImplementation

- (AXSDDetectorManager)detectorManager
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  return (AXSDDetectorManager *)*v2;
}

- (void)setDetectorManager:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BOOL)isListening
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener), sel_isListening);
}

- (NSSet)currentDetectionTypes
{
  void **v3;
  void *v4;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v5;
  id v6;
  uint64_t v7;
  void *v8;

  v3 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_currentDetectors);
  type metadata accessor for AXSDSoundDetectionType();
  v7 = sub_21AD23FAC();

  sub_21ACF7FA4(v7);
  swift_bridgeObjectRelease();
  sub_21ACF7DA4(&qword_255118260, (uint64_t (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType, (uint64_t)&unk_21AD26EC0);
  v8 = (void *)sub_21AD24024();
  swift_bridgeObjectRelease();
  return (NSSet *)v8;
}

- (BOOL)isSecure
{
  return 0;
}

- (_TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation)init
{
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *result;

  AXSDKShotNSRecordingControllerImplementation.init()();
  return result;
}

- (void)startListening
{
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v2;

  v2 = self;
  sub_21ACFDEAC();

}

- (void)startListeningToTrainDetector:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_21ACFDF04(v4);

}

- (void)stopListening
{
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v2;

  v2 = self;
  sub_21ACFE358();

}

- (void)registerWithListener:(id)a3 forRecordingUpdates:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_21ACFE7F0(v8, (uint64_t)sub_21AD04D88, v7);

  swift_release();
}

- (void)deregisterWithListener:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_21ACFEDA0(v4);

}

- (BOOL)retrainModelWithIdentifier:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v7;

  v4 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_21ACFF310(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)addWithListenType:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_21ACFF8C4(v4);

}

- (void)removeWithListenType:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_21ACFF92C(v4);

}

- (void)removeAllListenTypes
{
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v2;

  v2 = self;
  sub_21ACFFBF0();

}

- (BOOL)kickoffMLTrainingOfDetector:(id)a3 error:(id *)a4
{
  id v5;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v6;

  v5 = a3;
  v6 = self;
  sub_21AD00B64(v5);

  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorQueueManager));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listenerQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_xpcHelperService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_dispatchTimer));
}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v4;
  id v5;

  v5 = a3;
  v4 = self;
  AXSDKShotNSRecordingControllerImplementation.listenEngineFailedToStartWithError(_:)(v5);

}

- (void)listenEngineDidStartWithInputFormat:(id)a3
{
  id v5;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v6;

  v5 = a3;
  v6 = self;
  AXSDKShotNSRecordingControllerImplementation.listenEngineDidStart(withInputFormat:)((AVAudioFormat_optional *)a3);

}

- (void)receivedBuffer:(id)a3 atTime:(id)a4
{
  objc_class *v6;
  id v7;
  AVAudioPCMBuffer v8;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v9;

  v6 = (objc_class *)a3;
  v7 = a4;
  v9 = self;
  v8.super.super.isa = v6;
  v8.super._impl = v7;
  AXSDKShotNSRecordingControllerImplementation.receivedBuffer(_:at:)(v8, (AVAudioTime *)v9);

}

- (void)receivedBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v10;
  char v11;
  AVAudioPCMBuffer v12;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v13;

  v5 = a5;
  v8 = (objc_class *)a3;
  v9 = a4;
  v10 = self;
  v11 = (char)v10;
  v13 = v10;
  v12.super.super.isa = v8;
  v12.super._impl = v9;
  AXSDKShotNSRecordingControllerImplementation.receivedBuffer(_:at:isFile:)(v12, (AVAudioTime *)v5, v11);

}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
  id v6;
  id v7;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  AXSDKShotNSRecordingControllerImplementation.receivedObservation(_:forDetector:)(v6, v7);

}

- (void)receivedCompletion:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  AXSDKShotNSRecordingControllerImplementation.receivedCompletion(_:)(v4);

}

- (void)receivedError:(id)a3 fromDetector:(id)a4
{
  id v6;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  AXSDKShotNSRecordingControllerImplementation.receivedError(_:fromDetector:)(v8, v6);

}

- (void)assetsReadyAndDetectorsAdded
{
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v2;

  v2 = self;
  AXSDKShotNSRecordingControllerImplementation.assetsReadyAndDetectorsAdded()();

}

- (void)savedTrainingRecordingForDetector:(id)a3
{
  id v5;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v6;

  v5 = a3;
  v6 = self;
  AXSDKShotNSRecordingControllerImplementation.savedTrainingRecording(for:)((AXSDKShotDetector_optional *)a3);

}

- (void)hearingMLHelperService:(id)a3 eventOccurred:(int64_t)a4
{
  id v5;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v6;

  v5 = a3;
  v6 = self;
  sub_21AD04258();

}

@end
