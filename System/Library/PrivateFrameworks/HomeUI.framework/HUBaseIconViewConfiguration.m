@implementation HUBaseIconViewConfiguration

- (int64_t)appearance
{
  return *(_QWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 16];
}

- (void)setAppearance:(int64_t)a3
{
  HUBaseIconViewConfiguration *v4;

  v4 = self;
  BaseIconView.__Configuration.appearance.setter(a3);

}

- (int64_t)viewType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___HUBaseIconViewConfiguration_configuration);
}

- (HUBaseIconViewConfiguration)initWithItem:(id)a3 appearance:(int64_t)a4
{
  return (HUBaseIconViewConfiguration *)BaseIconView.__Configuration.init(item:appearance:)(a3, a4);
}

- (id)copyWithIconDescriptor:(id)a3
{
  HUBaseIconViewConfiguration *v5;
  id v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = BaseIconView.__Configuration.copy(with:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (HUBaseIconViewConfiguration)init
{
  HUBaseIconViewConfiguration *result;

  result = (HUBaseIconViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[8];
  uint64_t v7;

  v2 = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 104];
  v6[6] = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 88];
  v6[7] = v2;
  v7 = *(_QWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 120];
  v3 = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 40];
  v6[2] = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 24];
  v6[3] = v3;
  v4 = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 72];
  v6[4] = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 56];
  v6[5] = v4;
  v5 = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___HUBaseIconViewConfiguration_configuration);
  v6[1] = v5;
  sub_1B8F4E858(v6);
}

@end
