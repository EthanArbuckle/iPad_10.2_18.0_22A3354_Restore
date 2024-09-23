@implementation ManualEntryItem

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  char *v6;
  int64_t result;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v10;
  uint64_t (*v11)(id, uint64_t, uint64_t);
  id v12;
  _TtC24MenstrualCyclesAppPlugin15ManualEntryItem *v13;
  int64_t v14;

  v6 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource;
  result = MEMORY[0x2348EE70C]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource, a2, a3, a4);
  if (result)
  {
    v8 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType();
    v10 = *(_QWORD *)(v8 + 8);
    v11 = *(uint64_t (**)(id, uint64_t, uint64_t))(v10 + 16);
    v12 = a3;
    v13 = self;
    v14 = v11(v12, ObjectType, v10);

    swift_unknownObjectRelease();
    return v14;
  }
  return result;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;
  void (*v11)(int64_t, uint64_t, uint64_t);
  id v12;
  _TtC24MenstrualCyclesAppPlugin15ManualEntryItem *v13;
  void *v14;

  v8 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource;
  if (MEMORY[0x2348EE70C]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource, a2, a3, a4, a5))
  {
    v9 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    v11 = *(void (**)(int64_t, uint64_t, uint64_t))(v9 + 24);
    v12 = a3;
    v13 = self;
    v11(a4, ObjectType, v9);

    swift_unknownObjectRelease();
    v14 = (void *)sub_231CA1BD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  char *v8;
  uint64_t v9;
  uint64_t ObjectType;
  void (*v11)(id, int64_t, uint64_t, uint64_t);
  id v12;
  _TtC24MenstrualCyclesAppPlugin15ManualEntryItem *v13;

  v8 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource;
  if (MEMORY[0x2348EE70C]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource, a2, a3, a4, a5))
  {
    v9 = *((_QWORD *)v8 + 1);
    ObjectType = swift_getObjectType();
    v11 = *(void (**)(id, int64_t, uint64_t, uint64_t))(v9 + 16);
    v12 = a3;
    v13 = self;
    v11(v12, a4, ObjectType, v9);

    swift_unknownObjectRelease();
  }
}

- (_TtC24MenstrualCyclesAppPlugin15ManualEntryItem)init
{
  objc_super v4;

  *(_QWORD *)&self->dataSource[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ManualEntryItem();
  return -[ManualEntryItem init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin15ManualEntryItem_dataSource);
}

@end
