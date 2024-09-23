@implementation WorldLine

- (NSArray)identifiersOfObjectsComposedInto
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_221653318();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setIdentifiersOfObjectsComposedInto:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  if (a3)
    v4 = sub_221653324();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC17MeasureFoundation9WorldLine)init
{
  _TtC17MeasureFoundation9WorldLine *result;

  result = (_TtC17MeasureFoundation9WorldLine *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
