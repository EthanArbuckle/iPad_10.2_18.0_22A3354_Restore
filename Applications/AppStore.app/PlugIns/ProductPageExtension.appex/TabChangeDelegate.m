@implementation TabChangeDelegate

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  id v7;
  _TtC20ProductPageExtension17TabChangeDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1004E7334(v6, (uint64_t)v7);

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6;
  id v7;
  _TtC20ProductPageExtension17TabChangeDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1004E79B0(v6);

}

- (_TtC20ProductPageExtension17TabChangeDelegate)init
{
  _TtC20ProductPageExtension17TabChangeDelegate *result;

  result = (_TtC20ProductPageExtension17TabChangeDelegate *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.TabChangeDelegate", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC20ProductPageExtension17TabChangeDelegate_objectGraph));
}

@end
