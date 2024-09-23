@implementation CHUISControlInstanceToggle

- (NSString)title
{
  return (NSString *)sub_1B715A514(self, (uint64_t)a2, (void (*)(void))CHUISControlInstanceToggle.title.getter);
}

- (CHUISControlIconView)iconView
{
  char *v3;
  CHUISControlInstanceToggle *v4;
  id v5;
  uint64_t v7;
  _BYTE v8[40];

  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1B7139494((uint64_t)v3, (uint64_t)v8);
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED33EA60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED33E270);
  swift_dynamicCast();
  v5 = *(id *)(v7 + 24);

  swift_release();
  return (CHUISControlIconView *)v5;
}

- (UIColor)tintColor
{
  CHUISControlInstanceToggle *v2;
  id v3;

  v2 = self;
  v3 = CHUISControlInstanceToggle.tintColor.getter();

  return (UIColor *)v3;
}

- (BOOL)state
{
  CHUISControlInstanceToggle *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = CHUISControlInstanceToggle.state.getter();

  return v3 & 1;
}

- (NSString)valueLabel
{
  return (NSString *)sub_1B715A514(self, (uint64_t)a2, (void (*)(void))CHUISControlInstanceToggle.valueLabel.getter);
}

- (NSString)valueLabelAfterAction
{
  return (NSString *)sub_1B715A514(self, (uint64_t)a2, (void (*)(void))CHUISControlInstanceToggle.valueLabelAfterAction.getter);
}

- (CHUISControlToggleViewModel)viewModel
{
  char *v3;
  CHUISControlInstanceToggle *v4;
  id v5;
  uint64_t v7;
  _BYTE v8[40];

  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1B7139494((uint64_t)v3, (uint64_t)v8);
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED33EA60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED33E270);
  swift_dynamicCast();
  swift_beginAccess();
  v5 = *(id *)(v7 + 16);

  swift_release();
  return (CHUISControlToggleViewModel *)v5;
}

- (CHUISControlInstanceToggle)initWithControl:(id)a3
{
  return (CHUISControlInstanceToggle *)CHUISControlInstanceToggle.init(control:)(a3);
}

- (CHUISControlInstanceToggle)initWithControl:(id)a3 contentType:(unint64_t)a4
{
  id v7;
  id v8;
  id v9;
  CHUISControlInstanceToggle *v10;

  v7 = objc_allocWithZone(MEMORY[0x1E0D10010]);
  v8 = a3;
  v9 = objc_msgSend(v7, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, v8, a4, 0, 0);
  v10 = -[CHUISControlInstanceToggle initWithInstanceIdentity:](self, sel_initWithInstanceIdentity_, v9);

  return v10;
}

- (CHUISControlInstanceToggle)initWithInstanceIdentity:(id)a3
{
  return (CHUISControlInstanceToggle *)CHUISControlInstanceToggle.init(instanceIdentity:)(a3);
}

- (CHUISControlInstanceToggle)initWithWidget:(id)a3
{
  return (CHUISControlInstanceToggle *)CHUISControlInstanceToggle.init(widget:)(a3);
}

@end
