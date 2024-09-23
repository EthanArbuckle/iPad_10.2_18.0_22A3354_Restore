@implementation MUTransitDeparturesDataSource

- (MUTransitDeparturesDataSourceDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___MUTransitDeparturesDataSource_delegate;
  swift_beginAccess();
  return (MUTransitDeparturesDataSourceDelegate *)(id)MEMORY[0x1940213B8](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)isActive
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___MUTransitDeparturesDataSource_isActive;
  swift_beginAccess();
  return *v2;
}

- (void)setIsActive:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v5;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR___MUTransitDeparturesDataSource_isActive;
  swift_beginAccess();
  *v5 = v3;
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MUTransitDeparturesDataSource_dataProvider), sel_setActive_, v3);
}

- (MUTransitDeparturesDataSource)initWithMapItem:(id)a3
{
  return (MUTransitDeparturesDataSource *)TransitDeparturesDataSource.init(mapItem:)(a3);
}

- (MUTransitDeparturesDataSource)init
{
  MUTransitDeparturesDataSource *result;

  result = (MUTransitDeparturesDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_191DBE818((uint64_t)self + OBJC_IVAR___MUTransitDeparturesDataSource_delegate);

}

- (id)traitsForTransitDeparturesDataProvider:(id)a3
{
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  MUTransitDeparturesDataSource *v9;
  id v10;
  id v11;
  id v12;
  MUTransitDeparturesDataSource *v13;
  id result;

  v5 = (char *)self + OBJC_IVAR___MUTransitDeparturesDataSource_delegate;
  swift_beginAccess();
  v6 = MEMORY[0x1940213B8](v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = a3;
    v9 = self;
    v10 = objc_msgSend(v7, sel_traitsForDeparturesDataSource_, v9);

    swift_unknownObjectRelease();
    return v10;
  }
  v11 = objc_allocWithZone(MEMORY[0x1E0D27220]);
  v12 = a3;
  v13 = self;
  result = objc_msgSend(v11, sel_init);
  if (result)
  {
    v10 = result;

    return v10;
  }
  __break(1u);
  return result;
}

- (void)transitDeparturesDataProviderDidReload:(id)a3
{
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  MUTransitDeparturesDataSource *v9;

  v5 = (char *)self + OBJC_IVAR___MUTransitDeparturesDataSource_delegate;
  swift_beginAccess();
  v6 = MEMORY[0x1940213B8](v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = a3;
    v9 = self;
    objc_msgSend(v7, sel_transitDeparturesDataSourceWantsReload_, v9);

    swift_unknownObjectRelease();
  }
}

@end
