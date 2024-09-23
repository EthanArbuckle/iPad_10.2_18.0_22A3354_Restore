@implementation BRLTEditStringInternal

- (NSString)string
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)tokenForLocation:(int64_t)a3
{
  return sub_2114CC850(a3);
}

- (id)appending:(id)a3
{
  _BYTE *v4;
  BRLTEditStringInternal *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_2114CCDFC(v4);
  v7 = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  BRLTEditStringInternal *v4;
  BRLTEditStringInternal *v5;
  char v6;
  void *v8;
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
  type metadata accessor for BRLTEditString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    v6 = 0;
    goto LABEL_9;
  }
  v6 = sub_2114CE114((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_2114C9690((uint64_t)v11);
  return v6 & 1;
}

- (NSString)description
{
  BRLTEditStringInternal *v2;
  void *v3;

  v2 = self;
  sub_2114CD9A4();

  v3 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BRLTEditStringInternal)init
{
  BRLTEditStringInternal *result;

  result = (BRLTEditStringInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (_NSRange)NSSelection
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_2114CDD18((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BRLTEditStringInternal_selection);
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)NSFocus
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_2114CDD18((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BRLTEditStringInternal_focus);
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)NSSuggestion
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_2114CDD18((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BRLTEditStringInternal_suggestion);
  result.length = v3;
  result.location = v2;
  return result;
}

- (BRLTEditStringInternal)initWithString:(id)a3 NSSelection:(_NSRange)a4 NSFocus:(_NSRange)a5 token:(int64_t)a6 NSSuggestion:(_NSRange)a7 textFormattingRanges:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BRLTEditStringInternal *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t ObjectType;
  uint64_t v31;
  BRLTEditStringInternal *result;
  BRLTEditStringInternal *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;

  length = a5.length;
  location = a5.location;
  v10 = a4.length;
  v11 = a4.location;
  v13 = sub_2114E4F5C();
  v15 = v14;
  v38 = a8;
  v16 = self;
  v17 = sub_2114DA4F8(v11, v10);
  v36 = v18;
  v37 = v17;
  v20 = v19;
  v21 = sub_2114DA4F8(location, length);
  v34 = v22;
  v35 = v21;
  v24 = v23;
  v25 = sub_2114DA4F8(a7.location, a7.length);
  v27 = v26;
  v29 = v28;
  ObjectType = swift_getObjectType();

  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB36A8);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_2114E7C40;
  result = (BRLTEditStringInternal *)sub_2114E4F98();
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v31 + 32) = 0;
    *(_QWORD *)(v31 + 40) = result;
    *(_QWORD *)(v31 + 48) = a6;
    v33 = (BRLTEditStringInternal *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _BYTE, id))(ObjectType + 128))(v13, v15, v37, v36, v20 & 1, v35, v34, v24 & 1, v31, v25, v27, v29 & 1, v38);
    swift_deallocPartialClassInstance();
    return v33;
  }
  return result;
}

@end
