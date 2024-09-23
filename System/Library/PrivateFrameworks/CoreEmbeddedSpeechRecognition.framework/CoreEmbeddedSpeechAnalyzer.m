@implementation CoreEmbeddedSpeechAnalyzer

- (void).cxx_destruct
{
  swift_getObjectType();
  sub_1B3E6EF84();
  sub_1B3E6EFA8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___CoreEmbeddedSpeechAnalyzer__instanceUUID);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___CoreEmbeddedSpeechAnalyzer__taskPriority);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___CoreEmbeddedSpeechAnalyzer__operationEnqueuer);
  sub_1B3E6F038((uint64_t)self + OBJC_IVAR___CoreEmbeddedSpeechAnalyzer__audioEnqueuer);
  sub_1B3E6EFA8();
  sub_1B3E6EFA8();
  sub_1B3E6EFA8();
  sub_1B3E6EFA8();
  sub_1B3E6818C();
  sub_1B3E6818C();
  sub_1B3E68020((id *)((char *)&self->super.isa + OBJC_IVAR___CoreEmbeddedSpeechAnalyzer_audioFormat));
  sub_1B3E62344();
  sub_1B3E62344();
  sub_1B3E6F078((Class *)((char *)&self->super.isa + OBJC_IVAR___CoreEmbeddedSpeechAnalyzer_didFinish));
  sub_1B3E6EFA8();
  sub_1B3E6EFA8();
  sub_1B3E6EFA8();
}

- (CoreEmbeddedSpeechRecognizerDelegate)delegate
{
  CoreEmbeddedSpeechAnalyzer *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  v6 = (id)CoreEmbeddedSpeechAnalyzer.delegate.getter();

  return (CoreEmbeddedSpeechRecognizerDelegate *)v6;
}

- (void)setDelegate:(id)a3
{
  CoreEmbeddedSpeechAnalyzer *v4;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v4 = self;
  sub_1B3E9B76C();

}

- (CoreEmbeddedSpeechAnalyzer)initWithDelegate:(id)a3 instanceUUID:(char *)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  return (CoreEmbeddedSpeechAnalyzer *)CoreEmbeddedSpeechAnalyzer.init(delegate:instanceUUID:)((uint64_t)a3, a4);
}

- (void)dealloc
{
  CoreEmbeddedSpeechAnalyzer *v3;

  swift_getObjectType();
  v3 = self;
  sub_1B3E9DA94();
}

- (void)preheatSpeechRecognitionWithAssetConfig:(id)a3 preheatSource:(id)a4 modelOverrideURL:(id)a5
{
  void *v5;
  id v6;
  id v7;
  id v8;
  CoreEmbeddedSpeechAnalyzer *v9;
  uint64_t v10;
  id v11[2];
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  id v24;
  unint64_t v25;
  char *v26;
  id v27;
  CoreEmbeddedSpeechAnalyzer *v28;
  id v29;

  v28 = self;
  v24 = a3;
  v29 = a4;
  v27 = a5;
  swift_getObjectType();
  v20 = sub_1B3F6F08C();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = (*(_QWORD *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v20);
  v23 = (char *)v11 - v22;
  v25 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1D8308) - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = (void *)MEMORY[0x1E0C80A78](v24);
  v26 = (char *)v11 - v25;
  v6 = v5;
  v7 = v29;
  v8 = v27;
  v9 = v28;
  if (v29)
  {
    v19 = v29;
    v14 = v29;
    v15 = sub_1B3F6FA64();
    v16 = v10;

    v17 = v15;
    v18 = v16;
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  v12 = v18;
  v13 = v17;
  if (v27)
  {
    v11[1] = v27;
    v11[0] = v27;
    sub_1B3F6F068();
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v26, v23, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v26, 0, 1, v20);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v26, 1, 1, v20);
  }
  CoreEmbeddedSpeechAnalyzer.preheatSpeechRecognition(with:preheatSource:modelOverrideURL:)(v24, v13, v12, v26);
  sub_1B3F0897C((uint64_t)v26);
  swift_bridgeObjectRelease();

}

- (void)startSpeechRecognitionWithParameters:(id)a3 didStartHandlerWithInfo:(id)a4
{
  id v5;
  CoreEmbeddedSpeechAnalyzer *v6;
  void *v8;
  uint64_t v9;

  swift_getObjectType();
  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  CoreEmbeddedSpeechAnalyzer.startSpeechRecognition(with:didStartHandlerWithInfo:)(a3, (uint64_t)sub_1B3F0B4B8, v9);
  swift_release();

}

- (void)addAudioPacket:(id)a3
{
  id v4;
  CoreEmbeddedSpeechAnalyzer *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  swift_getObjectType();
  v4 = a3;
  v5 = self;
  v7 = sub_1B3F6F0B0();
  v8 = v6;
  CoreEmbeddedSpeechAnalyzer.addAudioPacket(_:)(v7, v6);
  sub_1B3E9690C(v7, v8);

}

- (void)addAudioPacket:(id)a3 packetRecordedTime:(id)a4 packetReadyUpstreamTime:(id)a5
{
  id v6;
  id v7;
  id v8;
  CoreEmbeddedSpeechAnalyzer *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  swift_getObjectType();
  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = self;
  v11 = sub_1B3F6F0B0();
  v12 = v10;
  CoreEmbeddedSpeechAnalyzer.addAudioPacket(_:packetRecordedTime:packetReadyUpstreamTime:)(v11, v10, a4, a5);
  sub_1B3E9690C(v11, v12);

}

- (void)pauseRecognition
{
  CoreEmbeddedSpeechAnalyzer *v3;

  swift_getObjectType();
  v3 = self;
  CoreEmbeddedSpeechAnalyzer.pauseRecognition()();

}

- (void)resumeRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v6;
  id v7;
  id v8;
  CoreEmbeddedSpeechAnalyzer *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *postfixText;
  void *v22;

  swift_getObjectType();
  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = self;
  v18 = sub_1B3F6FA64();
  v22 = v10;
  v17 = sub_1B3F6FA64();
  postfixText = v11;
  v12 = sub_1B3F6FA64();
  v13._countAndFlagsBits = v17;
  v13._object = postfixText;
  v14._countAndFlagsBits = v12;
  v15._countAndFlagsBits = v18;
  v14._object = v16;
  v15._object = v22;
  CoreEmbeddedSpeechAnalyzer.resumeRecognition(withPrefixText:postfixText:selectedText:)(v15, v13, v14);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CoreEmbeddedSpeechAnalyzer *v18;
  void *v19;
  void *v20;
  void *v21;
  NSNumber_optional cursorInVisibleText;
  NSNumber_optional favorCommandSuppression;
  NSNumber_optional abortCommandSuppression;
  Swift::String_optional undoEvent;
  Swift::String_optional selectedText;
  Swift::String_optional v27;
  Swift::String_optional v28;
  Swift::String_optional v29;
  Swift::String_optional v30;
  __int128 v33;

  *(_QWORD *)&v33 = a6;
  *((_QWORD *)&v33 + 1) = a7;
  swift_getObjectType();
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)v33;
  v14 = *((id *)&v33 + 1);
  v15 = a8;
  v16 = a9;
  v17 = a10;
  v18 = self;
  if (a3)
  {
    v29.value._countAndFlagsBits = sub_1B3F6FA64();
    v29.value._object = v19;

    v30 = v29;
  }
  else
  {
    v30 = (Swift::String_optional)0;
  }
  if (a4)
  {
    v27.value._countAndFlagsBits = sub_1B3F6FA64();
    v27.value._object = v20;

    v28 = v27;
  }
  else
  {
    v28 = (Swift::String_optional)0;
  }
  if (a5)
  {
    abortCommandSuppression.is_nil = (char)a5;
    undoEvent.value._countAndFlagsBits = sub_1B3F6FA64();
    undoEvent.value._object = v21;

    selectedText = undoEvent;
  }
  else
  {
    selectedText = (Swift::String_optional)0;
  }
  abortCommandSuppression.value.super.super.isa = (Class)selectedText.value._object;
  cursorInVisibleText.value.super.super.isa = (Class)a8;
  cursorInVisibleText.is_nil = (char)a9;
  favorCommandSuppression.value.super.super.isa = (Class)a10;
  CoreEmbeddedSpeechAnalyzer.updateVoiceCommandContext(withPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:)(v30, v28, selectedText, (NSNumber_optional)v33, cursorInVisibleText, favorCommandSuppression, abortCommandSuppression, *(NSNumber_optional *)&undoEvent.value._countAndFlagsBits);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)finishAudio
{
  CoreEmbeddedSpeechAnalyzer *v3;

  swift_getObjectType();
  v3 = self;
  CoreEmbeddedSpeechAnalyzer.finishAudio()();

}

- (void)stopAudioDecoding
{
  CoreEmbeddedSpeechAnalyzer *v3;

  swift_getObjectType();
  v3 = self;
  CoreEmbeddedSpeechAnalyzer.stopAudioDecoding()();

}

- (void)requestEagerResult
{
  CoreEmbeddedSpeechAnalyzer *v3;

  swift_getObjectType();
  v3 = self;
  CoreEmbeddedSpeechAnalyzer.requestEagerResult()();

}

- (void)startMissingAssetDownload
{
  CoreEmbeddedSpeechAnalyzer *v3;

  swift_getObjectType();
  v3 = self;
  CoreEmbeddedSpeechAnalyzer.startMissingAssetDownload()();

}

+ (void)forceCooldownIfIdle
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static CoreEmbeddedSpeechAnalyzer.forceCooldownIfIdle()();
}

+ (void)resetCache
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static CoreEmbeddedSpeechAnalyzer.resetCache()();
}

- (void)invalidate
{
  CoreEmbeddedSpeechAnalyzer *v3;

  swift_getObjectType();
  v3 = self;
  CoreEmbeddedSpeechAnalyzer.invalidate()();

}

+ (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = a4;
  v7 = sub_1B3F6FA64();
  v8 = v6;
  swift_getObjCClassMetadata();
  static CoreEmbeddedSpeechAnalyzer.send(speechCorrectionInfo:interactionIdentifier:)(a3, v7, v8);
  swift_bridgeObjectRelease();

}

- (CoreEmbeddedSpeechAnalyzer)init
{
  swift_getObjectType();
  return (CoreEmbeddedSpeechAnalyzer *)CoreEmbeddedSpeechAnalyzer.init()();
}

@end
