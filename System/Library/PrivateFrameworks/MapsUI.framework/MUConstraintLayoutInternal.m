@implementation MUConstraintLayoutInternal

- (NSArray)layoutConstraints
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  MUConstraintLayoutInternal *v6;
  void *v7;

  v3 = *(_QWORD *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v6 = self;
  v5(ObjectType, v3);

  sub_191DC65A4(0, (unint64_t *)&qword_1ED01B350);
  v7 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (NSArray)layoutGuides
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t);
  MUConstraintLayoutInternal *v6;
  void *v7;

  v3 = *(_QWORD *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v6 = self;
  v5(ObjectType, v3);

  sub_191DC65A4(0, &qword_1ED01B318);
  v7 = (void *)sub_191EEB038();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (int64_t)mode
{
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t (*v5)(uint64_t, uint64_t);
  MUConstraintLayoutInternal *v6;
  int64_t v7;

  v3 = *(_QWORD *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  ObjectType = swift_getObjectType();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 24);
  v6 = self;
  v7 = v5(ObjectType, v3);

  return v7;
}

- (void)setMode:(int64_t)a3
{
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(int64_t, uint64_t, uint64_t);
  MUConstraintLayoutInternal *v8;

  v5 = *(_QWORD *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  ObjectType = swift_getObjectType();
  v7 = *(void (**)(int64_t, uint64_t, uint64_t))(v5 + 32);
  v8 = self;
  v7(a3, ObjectType, v5);

}

- (void)deactivate
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(_QWORD, uint64_t, uint64_t);
  MUConstraintLayoutInternal *v6;

  v3 = *(_QWORD *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32);
  v6 = self;
  v5(0, ObjectType, v3);

}

- (void)prepare
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  MUConstraintLayoutInternal *v6;

  v3 = *(_QWORD *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  v6 = self;
  v5(1, ObjectType, v3);

}

- (void)activate
{
  uint64_t v3;
  uint64_t ObjectType;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  MUConstraintLayoutInternal *v6;

  v3 = *(_QWORD *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  v6 = self;
  v5(2, ObjectType, v3);

}

- (UIView)viewForForwardingSetNeedsUpdateConstraints
{
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t (*v5)(uint64_t, uint64_t);
  MUConstraintLayoutInternal *v6;
  void *v7;

  v3 = *(_QWORD *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  ObjectType = swift_getObjectType();
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 48);
  v6 = self;
  v7 = (void *)v5(ObjectType, v3);

  return (UIView *)v7;
}

- (void)setViewForForwardingSetNeedsUpdateConstraints:(id)a3
{
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(id, uint64_t, uint64_t);
  id v8;
  MUConstraintLayoutInternal *v9;

  v5 = *(_QWORD *)&self->layoutBuilder[OBJC_IVAR___MUConstraintLayoutInternal_layoutBuilder];
  ObjectType = swift_getObjectType();
  v7 = *(void (**)(id, uint64_t, uint64_t))(v5 + 56);
  v8 = a3;
  v9 = self;
  v7(a3, ObjectType, v5);

}

- (MUConstraintLayoutInternal)init
{
  MUConstraintLayoutInternal *result;

  result = (MUConstraintLayoutInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
