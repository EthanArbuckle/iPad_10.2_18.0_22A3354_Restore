@implementation SFSpeechAnalyzer

+ (void)configurationForClientIdentifier:(id)a3 queue:(id)a4 transcriberOptions:(id)a5 languageDetectorOptions:(id)a6 transcriberResultDelegate:(id)a7 endpointingResultDelegate:(id)a8 languageDetectorResultDelegate:(id)a9 considering:(id)a10 completion:(id)aBlock
{
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v16 = _Block_copy(aBlock);
  v17 = sub_1B25CCA18();
  v24 = v18;
  v25 = v17;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v16;
  v20 = a4;
  v23 = a5;
  v21 = a6;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v22 = a10;
  sub_1B24C0690(v25, v24, (uint64_t)v20, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t)a10, (uint64_t)sub_1B24C4810, v19);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)speechAnalyzerWithConfiguration:(id)a3 inputAudioFile:(id)a4 options:(id)a5 restrictedLogging:(BOOL)a6 geoLMRegionID:(id)a7 contextualNamedEntities:(id)a8 didChangeVolatileRange:(id)a9 completion:(id)a10
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t (*v18)();
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;

  v28 = a6;
  v14 = sub_1B25CC538();
  v29 = *(_QWORD *)(v14 - 8);
  v30 = v14;
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (uint64_t (*)())_Block_copy(a9);
  v19 = _Block_copy(a10);
  sub_1B25CC508();
  if (a7)
  {
    v20 = sub_1B25CCA18();
    v22 = v21;
    if (!a8)
      goto LABEL_4;
    goto LABEL_3;
  }
  v20 = 0;
  v22 = 0;
  if (a8)
  {
LABEL_3:
    type metadata accessor for SFContextualNamedEntity();
    a8 = (id)sub_1B25CCBA4();
  }
LABEL_4:
  if (v18)
  {
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v18;
    v18 = sub_1B24C48D8;
  }
  else
  {
    v23 = 0;
  }
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v19;
  v25 = a3;
  v26 = a5;
  sub_1B24C08F8(v25, (uint64_t)v17, a5, v28, v20, v22, (uint64_t)a8, (uint64_t)v18, v23, (uint64_t)sub_1B24C4608, v24);
  swift_release();
  sub_1B24C4564((uint64_t)v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v30);
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_41_2((uint64_t)self, OBJC_IVAR___SFSpeechAnalyzer__implementation);
}

- (SFSpeechAnalyzer)initWithClientIdentifier:(id)a3 audioFormat:(id)a4 transcriberResultDelegate:(id)a5 endpointingResultDelegate:(id)a6 languageDetectorResultDelegate:(id)a7 queue:(id)a8 transcriberOptions:(id)a9 options:(id)a10 languageDetectorOptions:(id)a11 restrictedLogging:(BOOL)a12 geoLMRegionID:(id)a13 contextualNamedEntities:(id)a14 didChangeVolatileRange:(id)aBlock
{
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t (*v23)();
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  SFSpeechAnalyzer *result;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;

  v17 = _Block_copy(aBlock);
  v18 = sub_1B25CCA18();
  v34 = v19;
  v35 = v18;
  if (a13)
  {
    v20 = sub_1B25CCA18();
    v31 = v21;
    v32 = (void *)v20;
  }
  else
  {
    v31 = 0;
    v32 = 0;
  }
  if (a14)
  {
    type metadata accessor for SFContextualNamedEntity();
    v30 = sub_1B25CCBA4();
  }
  else
  {
    v30 = 0;
  }
  if (v17)
  {
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v17;
    v23 = sub_1B24C48D8;
  }
  else
  {
    v23 = 0;
    v22 = 0;
  }
  v24 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v25 = a8;
  v26 = a9;
  v27 = a10;
  v28 = a11;
  sub_1B24C1298(v35, v34, (uint64_t)v24, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)v25, a9, (uint64_t)a10, (uint64_t)a11, a12, v32, v31, v30, (uint64_t)v23, v22);
  return result;
}

- (SFSpeechAnalyzer)initWithClientIdentifier:(id)a3 audioFormat:(id)a4 transcriberResultDelegate:(id)a5 endpointingResultDelegate:(id)a6 queue:(id)a7 transcriberOptions:(id)a8 options:(id)a9 restrictedLogging:(BOOL)a10 geoLMRegionID:(id)a11 contextualNamedEntities:(id)a12 didChangeVolatileRange:(id)aBlock
{
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)();
  id v25;
  id v26;
  id v27;
  id v28;
  SFSpeechAnalyzer *result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v17 = (uint64_t)a12;
  v18 = _Block_copy(aBlock);
  v19 = sub_1B25CCA18();
  v32 = v20;
  v33 = v19;
  if (a11)
  {
    v21 = sub_1B25CCA18();
    v30 = v22;
    v31 = v21;
  }
  else
  {
    v30 = 0;
    v31 = 0;
  }
  if (a12)
  {
    type metadata accessor for SFContextualNamedEntity();
    v17 = sub_1B25CCBA4();
  }
  if (v18)
  {
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v18;
    v24 = sub_1B24C48D8;
  }
  else
  {
    v24 = 0;
    v23 = 0;
  }
  v25 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v26 = a7;
  v27 = a8;
  v28 = a9;
  sub_1B24C1508(v33, v32, v25, (uint64_t)a5, (uint64_t)a6, v26, v27, a9, a10, v31, v30, v17, (uint64_t)v24, v23);
  return result;
}

- (SFSpeechAnalyzer)initWithClientIdentifier:(id)a3 audioFormat:(id)a4 transcriberResultDelegate:(id)a5 endpointingResultDelegate:(id)a6 queue:(id)a7 transcriberOptions:(id)a8 options:(id)a9 restrictedLogging:(BOOL)a10 didChangeVolatileRange:(id)aBlock
{
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)();
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v26;

  v16 = _Block_copy(aBlock);
  v26 = sub_1B25CCA18();
  v18 = v17;
  if (v16)
  {
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = v16;
    v20 = sub_1B24C48D8;
  }
  else
  {
    v20 = 0;
    v19 = 0;
  }
  v21 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v22 = a7;
  v23 = a8;
  v24 = a9;
  return (SFSpeechAnalyzer *)sub_1B24C18AC(v26, v18, v21, (uint64_t)a5, (uint64_t)a6, v22, v23, a9, a10, (uint64_t)v20, v19);
}

- (SFSpeechAnalyzer)initWithConfiguration:(id)a3 options:(id)a4 restrictedLogging:(BOOL)a5 geoLMRegionID:(id)a6 contextualNamedEntities:(id)a7 didChangeVolatileRange:(id)a8
{
  uint64_t (*v13)();
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;

  v13 = (uint64_t (*)())_Block_copy(a8);
  if (a6)
  {
    LOBYTE(a6) = sub_1B25CCA18();
    v15 = v14;
    if (!a7)
      goto LABEL_4;
    goto LABEL_3;
  }
  v15 = 0;
  if (a7)
  {
LABEL_3:
    type metadata accessor for SFContextualNamedEntity();
    a7 = (id)sub_1B25CCBA4();
  }
LABEL_4:
  if (v13)
  {
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v13;
    v13 = sub_1B24C48D8;
  }
  else
  {
    v16 = 0;
  }
  v17 = (char *)a3;
  v18 = a4;
  return (SFSpeechAnalyzer *)sub_1B24C1B48(v17, a4, a5, (char)a6, v15, (unint64_t)a7, (uint64_t)v13, v16);
}

- (SFSpeechAnalyzer)initWithConfiguration:(id)a3 options:(id)a4 restrictedLogging:(BOOL)a5 didChangeVolatileRange:(id)a6
{
  uint64_t (*v9)();
  id v10;
  id v11;

  v9 = (uint64_t (*)())_Block_copy(a6);
  if (v9)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v9;
    v9 = sub_1B24C48D8;
  }
  v10 = a3;
  v11 = a4;
  return (SFSpeechAnalyzer *)sub_1B24C1F04(v10, a4, a5, (uint64_t)v9);
}

- (id)initForAudioFileWithConfiguration:(id)a3 options:(id)a4 restrictedLogging:(BOOL)a5 didChangeVolatileRange:(id)a6
{
  uint64_t (*v9)();
  uint64_t v10;
  char *v11;
  id v12;

  v9 = (uint64_t (*)())_Block_copy(a6);
  if (v9)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    v9 = sub_1B24C48D8;
  }
  else
  {
    v10 = 0;
  }
  v11 = (char *)a3;
  v12 = a4;
  return sub_1B24C208C(v11, a4, a5, (uint64_t)v9, v10);
}

- (void)addAudio:(id)a3
{
  id v4;
  SFSpeechAnalyzer *v5;

  v4 = a3;
  v5 = self;
  sub_1B24C2E90((uint64_t)v4, &OBJC_IVAR___SFSpeechAnalyzer__implementation, (void (*)(uint64_t))sub_1B258EA2C);

}

- (void)finishAudio
{
  SFSpeechAnalyzer *v2;

  v2 = self;
  sub_1B24C2344();

}

- (void)getNextBufferStartTimeWithCompletion:(id)a3
{
  sub_1B24C3D54(self, (int)a2, a3, (uint64_t)&unk_1E64815D8, (uint64_t)&unk_1EEFD8918);
}

- (void)setDidChangeVolatileRange:(id)a3 completion:
{
  const void *v3;
  const void *v4;
  void *v6;
  void *v7;
  _QWORD *v8;
  SFSpeechAnalyzer *v9;

  v4 = v3;
  v6 = _Block_copy(a3);
  v7 = _Block_copy(v4);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = self;
  v9 = self;
  sub_1B258B39C((uint64_t)&unk_1EEFD8900, (uint64_t)v8);
}

- (void)cancelPendingResultsAndPauseWithCompletion:(id)a3
{
  sub_1B24C3D54(self, (int)a2, a3, (uint64_t)&unk_1E6481560, (uint64_t)&unk_1EEFD88E8);
}

- (void)resumeWithCompletion:(id)a3
{
  sub_1B24C3D54(self, (int)a2, a3, (uint64_t)&unk_1E6481538, (uint64_t)&unk_1EEFD88D0);
}

- (void)finalizeWithCompletion:(id)a3
{
  sub_1B24C3D54(self, (int)a2, a3, (uint64_t)&unk_1E6481510, (uint64_t)&unk_1EEFD88B8);
}

- (void)finalizeThrough:(id *)a3 completion:(id)a4
{
  int64_t var0;
  int64_t var3;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  SFSpeechAnalyzer *v10;

  var0 = a3->var0;
  var3 = a3->var3;
  v7 = *(_QWORD *)&a3->var1;
  v8 = _Block_copy(a4);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = var0;
  v9[3] = v7;
  v9[4] = var3;
  v9[5] = v8;
  v9[6] = self;
  v10 = self;
  sub_1B258B39C((uint64_t)&unk_1EEFD88A0, (uint64_t)v9);
}

- (void)finalizeAndFinishThroughEndOfInputWithCompletion:(id)a3
{
  sub_1B24C3D54(self, (int)a2, a3, (uint64_t)&unk_1E64814C0, (uint64_t)&unk_1EEFD8888);
}

- (void)requestResultAtEndpointTimes:(id)a3
{
  uint64_t v4;
  SFSpeechAnalyzer *v5;

  sub_1B24ADA58(0, &qword_1EEFD8878);
  v4 = sub_1B25CCBA4();
  v5 = self;
  sub_1B24C2E90(v4, &OBJC_IVAR___SFSpeechAnalyzer__implementation, (void (*)(uint64_t))sub_1B2590C98);

  swift_bridgeObjectRelease();
}

- (void)getModelInfoTasksWithCompletion:(id)a3
{
  sub_1B24C3688(self, (int)a2, a3, (uint64_t)&unk_1E6481448, (uint64_t)sub_1B24C4324, (void (*)(uint64_t, uint64_t))sub_1B24C2F5C);
}

- (void)getModelInfoLanguageWithCompletion:(id)a3
{
  sub_1B24C3688(self, (int)a2, a3, (uint64_t)&unk_1E64813D0, (uint64_t)sub_1B24C4314, (void (*)(uint64_t, uint64_t))sub_1B24C3118);
}

- (void)getRecognitionStatisticsWithCompletion:(id)a3
{
  sub_1B24C3688(self, (int)a2, a3, (uint64_t)&unk_1E6481358, (uint64_t)sub_1B24C4304, (void (*)(uint64_t, uint64_t))sub_1B24C32C4);
}

- (void)getRecognitionUtterenceStatisticsWithCompletion:(id)a3
{
  sub_1B24C3688(self, (int)a2, a3, (uint64_t)&unk_1E6481308, (uint64_t)sub_1B24C42DC, (void (*)(uint64_t, uint64_t))sub_1B24C34F4);
}

- (void)getModelInfoTasksWithCompletionWithError:(id)a3
{
  sub_1B24C3D54(self, (int)a2, a3, (uint64_t)&unk_1E64812E0, (uint64_t)&unk_1EEFD8868);
}

- (void)getModelInfoLanguageWithCompletionWithError:(id)a3
{
  sub_1B24C3D54(self, (int)a2, a3, (uint64_t)&unk_1E64812B8, (uint64_t)&unk_1EEFD8850);
}

- (void)getRecognitionStatisticsWithCompletionWithError:(id)a3
{
  sub_1B24C3D54(self, (int)a2, a3, (uint64_t)&unk_1E6481290, (uint64_t)&unk_1EEFD8838);
}

- (void)getRecognitionUtteranceStatisticsWithCompletionWithError:(id)a3
{
  sub_1B24C3D54(self, (int)a2, a3, (uint64_t)&unk_1E6481268, (uint64_t)&unk_1EEFD8820);
}

- (void)prepareToAnalyzeReportingInto:(NSProgress *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSProgress *v8;
  SFSpeechAnalyzer *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1B258B39C((uint64_t)&unk_1EEFD8808, (uint64_t)v7);
}

- (SFSpeechAnalyzer)init
{
  SFSpeechAnalyzer.init()();
}

@end
