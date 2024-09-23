@implementation CHUISControlInstanceButton

- (NSString)title
{
  CHUISControlInstanceButton *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  CHUISControlInstanceButton.title.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B71965E4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (CHUISControlIconView)iconView
{
  char *v3;
  CHUISControlInstanceButton *v4;
  id v5;
  uint64_t v7;
  _BYTE v8[40];

  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1B7139494((uint64_t)v3, (uint64_t)v8);
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED33EA60);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED33E888);
  swift_dynamicCast();
  v5 = *(id *)(v7 + 24);

  swift_release();
  return (CHUISControlIconView *)v5;
}

- (UIColor)tintColor
{
  CHUISControlInstanceButton *v2;
  id v3;

  v2 = self;
  v3 = CHUISControlInstanceButton.tintColor.getter();

  return (UIColor *)v3;
}

- (CHUISControlButtonViewModel)viewModel
{
  char *v3;
  CHUISControlInstanceButton *v4;
  id v5;
  uint64_t v7;
  _BYTE v8[40];

  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1B7139494((uint64_t)v3, (uint64_t)v8);
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED33EA60);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED33E888);
  swift_dynamicCast();
  swift_beginAccess();
  v5 = *(id *)(v7 + 16);

  swift_release();
  return (CHUISControlButtonViewModel *)v5;
}

- (CHUISControlInstanceButton)initWithControl:(id)a3 contentType:(unint64_t)a4
{
  id v7;
  id v8;
  id v9;
  CHUISControlInstanceButton *v10;

  v7 = objc_allocWithZone(MEMORY[0x1E0D10010]);
  v8 = a3;
  v9 = objc_msgSend(v7, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, v8, a4, 0, 0);
  v10 = -[CHUISControlInstanceButton initWithInstanceIdentity:](self, sel_initWithInstanceIdentity_, v9);

  return v10;
}

- (CHUISControlInstanceButton)initWithInstanceIdentity:(id)a3
{
  return (CHUISControlInstanceButton *)CHUISControlInstanceButton.init(instanceIdentity:)(a3);
}

- (CHUISControlInstanceButton)initWithControl:(id)a3
{
  id v3;
  CHUISControlInstanceButton *result;

  v3 = a3;
  result = (CHUISControlInstanceButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
