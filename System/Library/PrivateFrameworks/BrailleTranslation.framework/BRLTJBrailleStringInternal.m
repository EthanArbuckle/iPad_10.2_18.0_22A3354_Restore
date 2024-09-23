@implementation BRLTJBrailleStringInternal

- (BOOL)isStageEmpty
{
  return self->super.string[OBJC_IVAR___BRLTJBrailleStringInternal_stage + 8] & 1 | (*(Class *)((char *)&self->super.super.isa
                                                                                              + OBJC_IVAR___BRLTJBrailleStringInternal_stage) == *(Class *)&self->super.string[OBJC_IVAR___BRLTJBrailleStringInternal_stage]);
}

- (NSString)stageString
{
  return (NSString *)sub_2114C8EB8(self, (uint64_t)a2, (void (*)(void))sub_2114C7AF4);
}

- (NSString)stageSignalledString
{
  return (NSString *)sub_2114C8EB8(self, (uint64_t)a2, (void (*)(void))sub_2114C877C);
}

- (BOOL)isEqual:(id)a3
{
  BRLTJBrailleStringInternal *v4;
  BRLTJBrailleStringInternal *v5;
  char v6;
  _QWORD *v8;
  _BYTE v9[24];
  uint64_t v10;
  _OWORD v11[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2114E50B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_2114C9608((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_2114C9690((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for BRLTJBrailleString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    v6 = 0;
    goto LABEL_9;
  }
  v6 = _s18BrailleTranslation18BRLTJBrailleStringC2eeoiySbAC_ACtFZ_0(self, v8);

LABEL_9:
  sub_2114C9690((uint64_t)v11);
  return v6 & 1;
}

- (NSString)description
{
  return (NSString *)sub_2114C8EB8(self, (uint64_t)a2, (void (*)(void))sub_2114C8F10);
}

- (id)copyWithZone:(void *)a3
{
  BRLTJBrailleStringInternal *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_2114C9088(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_2114E5160();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (_NSRange)NSStage
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_2114DA4CC(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___BRLTJBrailleStringInternal_stage), *(_QWORD *)&self->super.string[OBJC_IVAR___BRLTJBrailleStringInternal_stage], self->super.string[OBJC_IVAR___BRLTJBrailleStringInternal_stage + 8]);
  result.length = v3;
  result.location = v2;
  return result;
}

@end
