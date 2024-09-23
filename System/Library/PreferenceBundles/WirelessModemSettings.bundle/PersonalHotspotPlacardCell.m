@implementation PersonalHotspotPlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  _TtC21WirelessModemSettings26PersonalHotspotPlacardCell *v5;

  v4 = a3;
  v5 = self;
  sub_22FE46928();

}

- (_TtC21WirelessModemSettings26PersonalHotspotPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a4)
  {
    v7 = sub_22FE48200();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = a5;
  return (_TtC21WirelessModemSettings26PersonalHotspotPlacardCell *)sub_22FE457FC(a3, v7, v9, a5);
}

- (_TtC21WirelessModemSettings26PersonalHotspotPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  _TtC21WirelessModemSettings26PersonalHotspotPlacardCell *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_22FE48200();
    a4 = (id)sub_22FE481DC();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = -[PersonalHotspotPlacardCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);

  return v8;
}

- (_TtC21WirelessModemSettings26PersonalHotspotPlacardCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[PersonalHotspotPlacardCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
