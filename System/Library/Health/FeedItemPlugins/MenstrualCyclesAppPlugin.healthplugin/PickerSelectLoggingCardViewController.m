@implementation PickerSelectLoggingCardViewController

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController *v2;

  v2 = self;
  sub_231BBCAAC();

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231BBCCD0(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231BBD184(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController *v14;
  char *v15;
  id v16;
  uint64_t v17;

  v8 = sub_231C9D438();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v12 = a3;
  v13 = a4;
  v14 = self;
  objc_msgSend(v13, sel__setShouldHaveFullLengthBottomSeparator_, 1);
  v15 = (char *)sub_231BBCA34();
  v16 = *(id *)&v15[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23PickerSelectLoggingCell_picker];

  if ((*((_BYTE *)&v14->super.super.super._responderFlags
        + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController_pickedIndex) & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(v16, sel_selectRow_inComponent_animated_, *(Class *)((char *)&v14->super.super.super.super.isa+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController_pickedIndex), 0, 0);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

- (void).cxx_destruct
{
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController_dataSource);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController____lazy_storage___cell));
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t result;
  id v7;
  _TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController *v8;
  int64_t v9;

  result = MEMORY[0x2348EE70C]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController_dataSource, a2, a3, a4);
  if (result)
  {
    v7 = a3;
    v8 = self;
    v9 = *(_QWORD *)(sub_231C04680() + 16);

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id result;
  id v9;
  _TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  result = (id)MEMORY[0x2348EE70C]((char *)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController_dataSource, a2, a3, a4, a5);
  if (result)
  {
    v9 = a3;
    v10 = self;
    sub_231C04AD8(a4);
    v12 = v11;

    swift_unknownObjectRelease();
    if (v12)
    {
      v13 = (void *)sub_231CA1BD8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v13 = 0;
    }
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7;
  _TtC24MenstrualCyclesAppPlugin37PickerSelectLoggingCardViewController *v8;

  v7 = a3;
  v8 = self;
  sub_231BBD6F4(a4);

}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

@end
