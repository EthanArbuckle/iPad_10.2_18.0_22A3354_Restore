@implementation _EXExtensionProcess.ProcessObserver

- (void).cxx_destruct
{
  sub_190C2FC70(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC19ExtensionFoundation19_EXExtensionProcessP33_2DB9D1F412467A20BF3CD4E75CD2541715ProcessObserver_invalidationHandler));
  swift_release();
}

- (void)processDidInvalidate:(id)a3
{
  id v4;
  _TtCC19ExtensionFoundation19_EXExtensionProcessP33_2DB9D1F412467A20BF3CD4E75CD2541715ProcessObserver *v5;

  v4 = a3;
  v5 = self;
  sub_190C87ACC();

}

- (_TtCC19ExtensionFoundation19_EXExtensionProcessP33_2DB9D1F412467A20BF3CD4E75CD2541715ProcessObserver)init
{
  _TtCC19ExtensionFoundation19_EXExtensionProcessP33_2DB9D1F412467A20BF3CD4E75CD2541715ProcessObserver *result;

  result = (_TtCC19ExtensionFoundation19_EXExtensionProcessP33_2DB9D1F412467A20BF3CD4E75CD2541715ProcessObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
