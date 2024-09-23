@implementation SNDistanceClassifier

+ (id)modelURLForCurrentProduct
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1D42B28FC(qword_1EFE47450);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjCClassMetadata();
  sub_1D44A3FA4((uint64_t)v4);
  v5 = sub_1D4519BC4();
  v6 = 0;
  if (_s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwet_0((uint64_t)v4, 1, v5) != 1)
  {
    v6 = (void *)sub_1D4519B28();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return v6;
}

+ (id)modelURLForProductType:(int)a3 acousticID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v5 = *(_QWORD *)&a3;
  v6 = sub_1D42B28FC(qword_1EFE47450);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v9 = sub_1D451A6EC();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  sub_1D44A3FEC(v5, v9, (uint64_t)a4, (uint64_t)v8);
  swift_bridgeObjectRelease();
  v11 = sub_1D4519BC4();
  v12 = 0;
  if (_s13SoundAnalysis11SNAOPReportV14SuccessPayloadOwet_0((uint64_t)v8, 1, v11) != 1)
  {
    v12 = (void *)sub_1D4519B28();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v8, v11);
  }
  return v12;
}

- (SNDistanceClassifier)init
{
  return (SNDistanceClassifier *)SNDistanceClassifier.init()();
}

@end
