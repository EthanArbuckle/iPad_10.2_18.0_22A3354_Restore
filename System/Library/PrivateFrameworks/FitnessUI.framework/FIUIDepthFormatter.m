@implementation FIUIDepthFormatter

- (FIUIDepthFormatter)initWithUnitManager:(id)a3
{
  id v3;
  FIUIDepthFormatter *v4;

  v3 = a3;
  v4 = (FIUIDepthFormatter *)sub_2130D915C(v3);

  return v4;
}

- (id)formatMaxDepth:(double)a3 unit:(unint64_t)a4
{
  return sub_2130D8784(self, a3, (uint64_t)a2, a4, (void (*)(uint64_t, double))FIUIDepthFormatter.formatMaxDepth(_:unit:));
}

- (id)formatDepthValue:(double)a3 unit:(unint64_t)a4
{
  return sub_2130D8784(self, a3, (uint64_t)a2, a4, (void (*)(uint64_t, double))FIUIDepthFormatter.formatDepthValue(_:unit:));
}

- (id)formatWaterTemperatureValue:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  FIUIDepthFormatter *v12;
  void *v13;
  uint64_t v15;

  v4 = sub_213106268();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_213106208();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BE2BE78], v4);
  v12 = self;
  sub_213106238();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BE2BE18], v8);
  sub_2131061D8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  v13 = (void *)sub_2131062F8();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)formatWaterTemperatureRangeWithLower:(double)a3 upper:(double)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  FIUIDepthFormatter *v15;
  void *v16;
  uint64_t v18;

  v5 = sub_213106268();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21310622C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B75248);
  v13 = *MEMORY[0x24BE2BE78];
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v14(v8, v13, v5);
  v15 = self;
  sub_213106238();
  v14(v8, v13, v5);
  sub_213106238();
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BE2BE38], v9);
  sub_2131061F0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  v16 = (void *)sub_2131062F8();
  swift_bridgeObjectRelease();
  return v16;
}

- (id)formatUnderwaterTime:(double)a3
{
  FIUIDepthFormatter *v3;
  void *v4;

  v3 = self;
  sub_2131061E4();

  v4 = (void *)sub_2131062F8();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)formatGoalValueForDive:(id)a3 healthStore:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  FIUIDepthFormatter *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;

  v19 = sub_213106184();
  v7 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_2131061B4();
  sub_213106178();
  sub_21310616C();
  v13 = objc_allocWithZone((Class)FIUIDepthFormattedGoalPair);
  v14 = (void *)sub_2131062F8();
  swift_bridgeObjectRelease();
  v15 = (void *)sub_2131062F8();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v13, sel_initWithGoalString_goalValue_, v14, v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
  return v16;
}

- (FIUIDepthFormatter)init
{
  FIUIDepthFormatter *result;

  result = (FIUIDepthFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
