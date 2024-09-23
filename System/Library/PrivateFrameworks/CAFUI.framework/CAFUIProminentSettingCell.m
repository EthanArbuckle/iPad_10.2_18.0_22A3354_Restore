@implementation CAFUIProminentSettingCell

- (_TtC5CAFUI25CAFUIProminentSettingCell)initWithCoder:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _TtC5CAFUI25CAFUIProminentSettingCell *result;

  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_representable);
  *v5 = 0;
  v5[1] = 0;
  v6 = OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_imageColor;
  v7 = (void *)objc_opt_self();
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_systemGrayColor);

  result = (_TtC5CAFUI25CAFUIProminentSettingCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC5CAFUI25CAFUIProminentSettingCell)initWithFrame:(CGRect)a3
{
  return (_TtC5CAFUI25CAFUIProminentSettingCell *)CAFUIProminentSettingCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAFUIProminentSettingCell();
  v2 = (char *)v4.receiver;
  -[CAFUIProminentSettingCell prepareForReuse](&v4, sel_prepareForReuse);
  v3 = &v2[OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_representable];
  swift_beginAccess();
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectRelease();
  if (*(_QWORD *)v3)
    CAFUIProminentSettingCell.configureCell()();

}

- (void)buttonClicked
{
  _TtC5CAFUI25CAFUIProminentSettingCell *v2;

  v2 = self;
  CAFUIProminentSettingCell.buttonClicked()();

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_imageColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_clickableButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI25CAFUIProminentSettingCell_imageButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
