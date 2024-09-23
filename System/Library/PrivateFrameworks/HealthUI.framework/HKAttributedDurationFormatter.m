@implementation HKAttributedDurationFormatter

- (HKAttributedDurationFormatter)init
{
  HKAttributedDurationFormatter *result;

  sub_1D7B4A7DC();
  swift_bridgeObjectRelease();
  result = (HKAttributedDurationFormatter *)sub_1D7B4A890();
  __break(1u);
  return result;
}

+ (id)formattedValueWithDuration:(double)a3 unitsStyle:(int64_t)a4 font:(id)a5 valueColor:(id)a6 unitColor:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id result;
  _QWORD v25[2];

  v25[0] = sub_1D7B4AA58();
  v11 = *(_QWORD *)(v25[0] - 8);
  MEMORY[0x1E0C80A78](v25[0]);
  v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1D7B48F4C();
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = sub_1D7B4AA88();
  v22 = v21;
  if (a4 == 1)
  {
    sub_1D7B4AA4C();
LABEL_5:
    swift_getObjCClassMetadata();
    sub_1D7ACBCF0();
    sub_1D7ACBECC(v20, v22, (uint64_t)v13, v17, v18, v19, (uint64_t)v16);
    (*(void (**)(char *, _QWORD))(v11 + 8))(v13, v25[0]);
    v23 = (void *)sub_1D7B4A680();

    return v23;
  }
  if (!a4)
  {
    sub_1D7B4AA34();
    goto LABEL_5;
  }
  v25[1] = a4;
  result = (id)sub_1D7B4A950();
  __break(1u);
  return result;
}

@end
