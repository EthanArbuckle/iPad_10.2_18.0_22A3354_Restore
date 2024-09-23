@implementation MacListPickerTableViewCell

- (_TtC8Business26MacListPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC8Business26MacListPickerTableViewCell *)sub_100066D04(a3, (uint64_t)a4, v6);
}

- (_TtC8Business26MacListPickerTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100068740();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC8Business26MacListPickerTableViewCell *v10;
  uint64_t v11;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  sub_100067D7C((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_listItemImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_horizontalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_checkmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell_checkmarkPlacholderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business26MacListPickerTableViewCell____lazy_storage___separatorView));
}

@end
