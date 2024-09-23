@implementation PartsAndServicePlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v5;
  _TtC12CoreRepairUI26PartsAndServicePlacardCell *v6;

  sub_22AC861C0();
  sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  sub_22AC8433C();
  swift_release();

}

- (_TtC12CoreRepairUI26PartsAndServicePlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v8;
  void *v9;
  id v10;
  _TtC12CoreRepairUI26PartsAndServicePlacardCell *v11;

  sub_22AC861C0();
  sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  if (a4)
  {
    v8 = sub_22AC86184();
    a4 = v9;
  }
  else
  {
    v8 = 0;
  }
  v10 = a5;
  v11 = (_TtC12CoreRepairUI26PartsAndServicePlacardCell *)sub_22AC838D8(a3, v8, (uint64_t)a4, a5);
  swift_release();
  return v11;
}

- (_TtC12CoreRepairUI26PartsAndServicePlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  _TtC12CoreRepairUI26PartsAndServicePlacardCell *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_22AC861C0();
  sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  if (a4)
  {
    sub_22AC86184();
    a4 = (id)sub_22AC86160();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = -[PartsAndServicePlacardCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  swift_release();

  return v8;
}

- (_TtC12CoreRepairUI26PartsAndServicePlacardCell)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _TtC12CoreRepairUI26PartsAndServicePlacardCell *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_22AC861C0();
  sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[PartsAndServicePlacardCell initWithCoder:](&v8, sel_initWithCoder_, a3);
  swift_release();
  return v6;
}

@end
