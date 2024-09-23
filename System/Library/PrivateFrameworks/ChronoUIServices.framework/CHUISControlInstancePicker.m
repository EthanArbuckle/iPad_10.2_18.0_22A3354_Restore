@implementation CHUISControlInstancePicker

- (NSString)title
{
  return (NSString *)sub_1B715A514(self, (uint64_t)a2, (void (*)(void))CHUISControlInstancePicker.title.getter);
}

- (CHUISControlIconView)iconView
{
  char *v3;
  CHUISControlInstancePicker *v4;
  id v5;
  uint64_t v7;
  _BYTE v8[40];

  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1B7139494((uint64_t)v3, (uint64_t)v8);
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED33EA60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF152CD0);
  swift_dynamicCast();
  v5 = *(id *)(v7 + 24);

  swift_release();
  return (CHUISControlIconView *)v5;
}

- (UIColor)tintColor
{
  CHUISControlInstancePicker *v2;
  id v3;

  v2 = self;
  v3 = CHUISControlInstancePicker.tintColor.getter();

  return (UIColor *)v3;
}

- (int64_t)state
{
  CHUISControlInstancePicker *v2;
  id v3;

  v2 = self;
  v3 = CHUISControlInstancePicker.state.getter();

  return (int64_t)v3;
}

- (NSString)valueLabel
{
  return (NSString *)sub_1B715A514(self, (uint64_t)a2, (void (*)(void))CHUISControlInstancePicker.valueLabel.getter);
}

- (NSArray)options
{
  CHUISControlInstancePicker *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  v3 = CHUISControlInstancePicker.options.getter();

  if (v3)
  {
    type metadata accessor for CHUISControlPickerOption(v4);
    v5 = (void *)sub_1B719665C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (CHUISControlPickerViewModel)viewModel
{
  char *v3;
  CHUISControlInstancePicker *v4;
  id v5;
  uint64_t v7;
  _BYTE v8[40];

  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1B7139494((uint64_t)v3, (uint64_t)v8);
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED33EA60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF152CD0);
  swift_dynamicCast();
  swift_beginAccess();
  v5 = *(id *)(v7 + 16);

  swift_release();
  return (CHUISControlPickerViewModel *)v5;
}

- (CHUISControlInstancePicker)initWithControl:(id)a3 contentType:(unint64_t)a4
{
  id v7;
  id v8;
  id v9;
  CHUISControlInstancePicker *v10;

  v7 = objc_allocWithZone(MEMORY[0x1E0D10010]);
  v8 = a3;
  v9 = objc_msgSend(v7, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, v8, a4, 0, 0);
  v10 = -[CHUISControlInstancePicker initWithInstanceIdentity:](self, sel_initWithInstanceIdentity_, v9);

  return v10;
}

- (CHUISControlInstancePicker)initWithInstanceIdentity:(id)a3
{
  return (CHUISControlInstancePicker *)CHUISControlInstancePicker.init(instanceIdentity:)(a3);
}

- (void)setState:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  CHUISControlInstancePicker *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1B715B35C;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  CHUISControlInstancePicker.setState(_:completion:)(a3, (uint64_t)v6, v7);
  sub_1B715B328((uint64_t)v6);

}

- (CHUISControlInstancePicker)initWithControl:(id)a3
{
  id v3;
  CHUISControlInstancePicker *result;

  v3 = a3;
  result = (CHUISControlInstancePicker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
