@implementation AXSDNSControllerImplementation

- (AXSDDetectorManager)detectorManager
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  return (AXSDDetectorManager *)*v2;
}

- (void)setDetectorManager:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSSet)currentDetectionTypes
{
  void **v3;
  void *v4;
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v5;
  id v6;
  uint64_t v7;
  void *v8;

  v3 = (void **)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
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

- (BOOL)isListening
{
  id *v3;
  id v4;
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v5;
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

- (_TtC18AXSoundDetectionUI30AXSDNSControllerImplementation)init
{
  return (_TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *)sub_21AD1A358();
}

- (void)addWithListenType:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_21AD1A504(v4);

}

- (void)removeWithListenType:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  sub_21AD1A56C(v4);

}

- (void)removeAllListenTypes
{
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v2;

  v2 = self;
  sub_21AD1A830();

}

- (void)startListening
{
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v2;

  v2 = self;
  _s18AXSoundDetectionUI30AXSDNSControllerImplementationC28assetsReadyAndDetectorsAddedyyF_0();

}

- (void)stopListening
{
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v2;

  v2 = self;
  sub_21AD1AF58();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorQueueManager));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recordingManager));
  swift_bridgeObjectRelease();
}

- (id)pipeInFileURL:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v9;
  void *v10;
  uint64_t v12;

  v5 = sub_21AD23D9C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21AD23D84();
  v9 = self;
  AXSDNSControllerImplementation.pipe(inFileURL:)((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  type metadata accessor for AXSDSoundDetectionType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255118258);
  sub_21ACF7DA4(&qword_255118260, (uint64_t (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType, (uint64_t)&unk_21AD26EC0);
  v10 = (void *)sub_21AD23F28();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)pipeInFilePath:(id)a3 error:(id *)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v8;
  void *v9;

  v5 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v7 = v6;
  v8 = self;
  AXSDNSControllerImplementation.pipe(inFilePath:)(v5, v7);
  swift_bridgeObjectRelease();

  type metadata accessor for AXSDSoundDetectionType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255118258);
  sub_21ACF7DA4(&qword_255118260, (uint64_t (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType, (uint64_t)&unk_21AD26EC0);
  v9 = (void *)sub_21AD23F28();
  swift_bridgeObjectRelease();
  return v9;
}

- (void)receivedBuffer:(id)a3 atTime:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AXSDNSControllerImplementation();
  v6 = a3;
  v7 = a4;
  v8 = v9.receiver;
  -[AXSDNSBaseControllerImplementation receivedBuffer:atTime:](&v9, sel_receivedBuffer_atTime_, v6, v7);
  objc_msgSend(v8, sel_receivedBuffer_atTime_isFile_, v6, v7, 0, v9.receiver, v9.super_class);

}

- (void)receivedBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5
{
  id v7;
  id v8;
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  _s18AXSoundDetectionUI30AXSDNSControllerImplementationC14receivedBuffer_2at6isFileySo16AVAudioPCMBufferC_So0K4TimeCSbtF_0((uint64_t)v7, (uint64_t)v8);

}

- (void)listenEngineDidStartWithInputFormat:(id)a3
{
  id v5;
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v6;

  v5 = a3;
  v6 = self;
  AXSDNSControllerImplementation.listenEngineDidStart(withInputFormat:)((AVAudioFormat_optional *)a3);

}

- (void)listenEngineReceivedAudioFile:(id)a3
{
  objc_class *v4;
  AVAudioFile v5;
  id impl;

  v4 = (objc_class *)a3;
  v5._impl = self;
  impl = v5._impl;
  v5.super.isa = v4;
  AXSDNSControllerImplementation.listenEngineReceivedAudioFile(_:)(v5);

}

- (void)listenEngineFinishedAudioFile:(id)a3
{
  objc_class *v4;
  AVAudioFile v5;
  id impl;

  v4 = (objc_class *)a3;
  v5._impl = self;
  impl = v5._impl;
  v5.super.isa = v4;
  AXSDNSControllerImplementation.listenEngineFinishedAudioFile(_:)(v5);

}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
  id v6;
  id v7;
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  AXSDNSControllerImplementation.receivedObservation(_:forDetector:)(v6, v7);

}

- (void)receivedCompletion:(id)a3
{
  id v4;
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v5;

  v4 = a3;
  v5 = self;
  _s18AXSoundDetectionUI30AXSDNSControllerImplementationC18receivedCompletionyySo20SNDetectSoundRequestCF_0(v4);

}

- (void)receivedError:(id)a3 fromDetector:(id)a4
{
  id v6;
  _TtC18AXSoundDetectionUI30AXSDNSControllerImplementation *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  _s18AXSoundDetectionUI30AXSDNSControllerImplementationC13receivedError_12fromDetectorys0G0_p_So20SNDetectSoundRequestCtF_0(v8, v6);

}

@end
