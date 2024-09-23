@implementation DOCUnicode

- (_TtC26DocumentManagerExecutables10DOCUnicode)init
{
  _TtC26DocumentManagerExecutables10DOCUnicode *result;

  result = (_TtC26DocumentManagerExecutables10DOCUnicode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

+ (id)uc:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  char *v7;
  uint64_t *v8;
  objc_super v10;

  v3 = sub_21EB02B88();
  v5 = v4;
  v6 = (objc_class *)type metadata accessor for DOCUnicode();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = (uint64_t *)&v7[OBJC_IVAR____TtC26DocumentManagerExecutables10DOCUnicode_rawValue];
  *v8 = v3;
  v8[1] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  return objc_msgSendSuper2(&v10, sel_init);
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)horizontalEllipsis
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_21EA95200((uint64_t)a1, (uint64_t)a2, &qword_2540A6658, (id *)&static DOCUnicode.horizontalEllipsis);
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)nonBreakingSpace
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_21EA95200((uint64_t)a1, (uint64_t)a2, &qword_255469A80, (id *)&static DOCUnicode.nonBreakingSpace);
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)nonBreakingSpace_zeroWidth
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_21EA95200((uint64_t)a1, (uint64_t)a2, &qword_255469A88, (id *)&static DOCUnicode.nonBreakingSpace_zeroWidth);
}

+ (id)nonBreakingSpaceWithZeroWidth:(BOOL)a3
{
  uint64_t *v3;

  if (a3)
  {
    if (qword_255469A88 != -1)
      swift_once();
    v3 = &static DOCUnicode.nonBreakingSpace_zeroWidth;
  }
  else
  {
    if (qword_255469A80 != -1)
      swift_once();
    v3 = &static DOCUnicode.nonBreakingSpace;
  }
  return (id)*v3;
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)bidiIsolateBeginLRI
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_21EA95200((uint64_t)a1, (uint64_t)a2, &qword_255469A90, (id *)&static DOCUnicode.bidiIsolateBeginLRI);
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)bidiIsolateBeginRLI
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_21EA95200((uint64_t)a1, (uint64_t)a2, &qword_255469A98, (id *)&static DOCUnicode.bidiIsolateBeginRLI);
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)bidiIsolateBeginFSI
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_21EA95200((uint64_t)a1, (uint64_t)a2, &qword_255469AA0, (id *)&static DOCUnicode.bidiIsolateBeginFSI);
}

+ (_TtC26DocumentManagerExecutables10DOCUnicode)bidiIsolateEnd
{
  return (_TtC26DocumentManagerExecutables10DOCUnicode *)sub_21EA95200((uint64_t)a1, (uint64_t)a2, &qword_255469AA8, (id *)&static DOCUnicode.bidiIsolateEnd);
}

+ (int64_t)layoutDirectionForUIDirection:(int64_t)a3
{
  if (a3 == 1)
    return 2;
  else
    return 1;
}

@end
