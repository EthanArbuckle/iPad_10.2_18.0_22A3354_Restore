@implementation ObjCSpeechAnalyzer

- (_TtC6Speech18ObjCSpeechAnalyzer)initWithObjCSpeechAnalyzer:(id)a3 clientIdentifier:(id)a4 audioFormat:(id)a5 transcriberResultDelegate:(id)a6 endpointingResultDelegate:(id)a7 languageDetectorResultDelegate:(id)a8 queue:(id)a9 transcriberOptions:(id)a10 options:(id)a11 languageDetectorOptions:(id)a12 restrictedLogging:(BOOL)a13 geoLMRegionID:(id)a14 contextualNamedEntities:(id)a15 didChangeVolatileRange:(id)aBlock
{
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _TtC6Speech18ObjCSpeechAnalyzer *result;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, char, char);
  uint64_t v33;
  void *v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;

  *((_QWORD *)&v40 + 1) = a7;
  *(_QWORD *)&v40 = self;
  v18 = _Block_copy(aBlock);
  v39 = sub_1B25CCA18();
  v38 = v19;
  if (a14)
  {
    v20 = sub_1B25CCA18();
    v36 = v21;
    v37 = v20;
  }
  else
  {
    v36 = 0;
    v37 = 0;
  }
  if (a15)
  {
    type metadata accessor for SFContextualNamedEntity();
    v34 = (void *)sub_1B25CCBA4();
  }
  else
  {
    v34 = 0;
  }
  HIDWORD(v33) = a13;
  if (v18)
  {
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v18;
    v32 = sub_1B24C4594;
  }
  else
  {
    v32 = 0;
    v22 = 0;
  }
  v23 = a3;
  v24 = a5;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v25 = a9;
  v26 = a10;
  v27 = a11;
  v28 = a12;
  LOBYTE(v30) = BYTE4(v33);
  sub_1B258CF44((uint64_t)v23, v39, v38, (uint64_t)v24, (uint64_t)a6, *((uint64_t *)&v40 + 1), (uint64_t)a8, (uint64_t)v25, (uint64_t)a10, (uint64_t)a11, (uint64_t)a12, v30, v37, (uint64_t)v36, (uint64_t)v34, (uint64_t)v32, v22, v31, (uint64_t)v32,
    v33,
    v34,
    a5,
    v36,
    v37,
    v38,
    v39,
    v40,
    (uint64_t)a8);
  return result;
}

+ (id)modelDownloadRequestForClientIdentifier:(id)a3 transcriberOptions:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v5 = sub_1B25CCA18();
  v7 = v6;
  v8 = a4;
  v9 = (void *)sub_1B258ECA4(v5, v7, v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (void)requestResultAtEndpointTimes:(id)a3
{
  unint64_t v4;
  _TtC6Speech18ObjCSpeechAnalyzer *v5;

  sub_1B24ADA58(0, &qword_1EEFD8878);
  v4 = sub_1B25CCBA4();
  v5 = self;
  sub_1B2590C98(v4);
  swift_bridgeObjectRelease();

}

- (void)setInputAudioFile:(NSURL *)a3 withAudioFormat:(AVAudioFormat *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSURL *v10;
  AVAudioFormat *v11;
  _TtC6Speech18ObjCSpeechAnalyzer *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1B258B39C((uint64_t)&unk_1EEFDB1F0, (uint64_t)v9);
}

- (void)setAnalysisContextWithGeoLMRegionID:(NSString *)a3 contextualNamedEntities:(NSArray *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSString *v10;
  NSArray *v11;
  _TtC6Speech18ObjCSpeechAnalyzer *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1B258B39C((uint64_t)&unk_1EEFDB1B0, (uint64_t)v9);
}

- (_TtC6Speech18ObjCSpeechAnalyzer)init
{
  sub_1B2591638();
}

- (void).cxx_destruct
{

  sub_1B24EBD4C((uint64_t)self + OBJC_IVAR____TtC6Speech18ObjCSpeechAnalyzer_inputStreamBuilder, &qword_1EEFD8928);
  OUTLINED_FUNCTION_119_3();
  OUTLINED_FUNCTION_119_3();
  OUTLINED_FUNCTION_119_3();
  OUTLINED_FUNCTION_119_3();
  swift_release();
}

@end
