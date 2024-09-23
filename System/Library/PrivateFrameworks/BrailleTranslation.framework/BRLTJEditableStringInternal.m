@implementation BRLTJEditableStringInternal

- (NSString)string
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_2114E4F5C();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BRLTJEditableStringInternal_string);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)append:(id)a3
{
  _QWORD *v4;
  BRLTJEditableStringInternal *v5;

  v4 = a3;
  v5 = self;
  sub_2114D76E0(v4);

}

- (int64_t)tokenForLocation:(int64_t)a3
{
  BRLTJEditableStringInternal *v4;
  int64_t v5;

  v4 = self;
  v5 = sub_2114D7B84(a3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BRLTJEditableStringInternal *v4;
  BRLTJEditableStringInternal *v5;
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
  type metadata accessor for BRLTJEditableString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    v6 = 0;
    goto LABEL_9;
  }
  v6 = _s18BrailleTranslation19BRLTJEditableStringC2eeoiySbAC_ACtFZ_0(self, v8);

LABEL_9:
  sub_2114C9690((uint64_t)v11);
  return v6 & 1;
}

- (NSString)description
{
  BRLTJEditableStringInternal *v2;
  void *v3;

  v2 = self;
  sub_2114D7DEC();

  v3 = (void *)sub_2114E4F50();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copyWithZone:(void *)a3
{
  BRLTJEditableStringInternal *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_2114D8054(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_2114E5160();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (BRLTJEditableStringInternal)init
{
  BRLTJEditableStringInternal *result;

  result = (BRLTJEditableStringInternal *)_swift_stdlib_reportUnimplementedInitializer();
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
  uint64_t (*v2)(void);
  BRLTJEditableStringInternal *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x90);
  v3 = self;
  v4 = v2();
  v7 = sub_2114DA4CC(v4, v6, v5 & 1);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)NSFocus
{
  uint64_t (*v2)(void);
  BRLTJEditableStringInternal *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xA8);
  v3 = self;
  v4 = v2();
  v7 = sub_2114DA4CC(v4, v6, v5 & 1);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)NSSuggestion
{
  uint64_t (*v2)(void);
  BRLTJEditableStringInternal *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xC0);
  v3 = self;
  v4 = v2();
  v7 = sub_2114DA4CC(v4, v6, v5 & 1);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (BRLTJEditableStringInternal)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(int64_t)a6 suggestion:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BRLTJEditableStringInternal *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t ObjectType;
  uint64_t v30;
  BRLTJEditableStringInternal *result;
  BRLTJEditableStringInternal *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  length = a5.length;
  location = a5.location;
  v9 = a4.length;
  v10 = a4.location;
  v12 = sub_2114E4F5C();
  v14 = v13;
  v15 = self;
  v16 = sub_2114DA4F8(v10, v9);
  v35 = v17;
  v36 = v16;
  v19 = v18;
  v20 = sub_2114DA4F8(location, length);
  v33 = v21;
  v34 = v20;
  v23 = v22;
  v24 = sub_2114DA4F8(a7.location, a7.length);
  v26 = v25;
  v28 = v27;
  ObjectType = swift_getObjectType();

  __swift_instantiateConcreteTypeFromMangledName(&qword_254AB36A8);
  v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_2114E7C40;
  result = (BRLTJEditableStringInternal *)sub_2114E4F98();
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v30 + 32) = 0;
    *(_QWORD *)(v30 + 40) = result;
    *(_QWORD *)(v30 + 48) = a6;
    v32 = (BRLTJEditableStringInternal *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _BYTE, uint64_t))(ObjectType + 256))(v12, v14, v36, v35, v19 & 1, v34, v33, v23 & 1, v24, v26, v28 & 1, v30);
    swift_deallocPartialClassInstance();
    return v32;
  }
  return result;
}

@end
