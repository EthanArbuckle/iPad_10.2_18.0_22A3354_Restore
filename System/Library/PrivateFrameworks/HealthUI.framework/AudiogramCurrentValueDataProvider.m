@implementation AudiogramCurrentValueDataProvider

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  return sub_1D7AC4484(self, (uint64_t)a2, a3, (void (*)(id))sub_1D7AC4270);
}

- (id)lastUpdatedShortDescriptionWithDateCache:(id)a3
{
  return sub_1D7AC4484(self, (uint64_t)a2, a3, (void (*)(id))sub_1D7AC4378);
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _TtC8HealthUI33AudiogramCurrentValueDataProvider *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;

  v13 = (void *)objc_opt_self();
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = self;
  v20 = objc_msgSend(v13, sel_labelColor);
  v21 = objc_msgSend(v13, sel_secondaryLabelColor);
  sub_1D7AC46C8(v14, v15, a5, v20, a6, v21);
  v23 = v22;

  return v23;
}

- (id)attributedSupplementaryStringWithDisplayType:(id)a3 unitController:(id)a4 font:(id)a5
{
  return 0;
}

- (_TtC8HealthUI33AudiogramCurrentValueDataProvider)init
{
  _TtC8HealthUI33AudiogramCurrentValueDataProvider *result;

  result = (_TtC8HealthUI33AudiogramCurrentValueDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI33AudiogramCurrentValueDataProvider_healthStore));
}

@end
