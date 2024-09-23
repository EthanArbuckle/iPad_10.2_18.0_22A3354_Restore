@implementation HeaderWithActionButtonCollectionViewCell

- (_TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell *)sub_231AB33D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_231AB4F88();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell *v8;
  uint64_t v9;

  v4 = sub_231C9FB5C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9FB50();
  v8 = self;
  sub_231AB410C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_231996A70((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell_item, (unint64_t *)&qword_255F4A910, (void (*)(uint64_t))sub_23191CDD0);
  v3 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell_listContentConfiguration;
  v4 = sub_231C9FD18();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell_actionButtonConfiguration;
  v6 = sub_231CA26B8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell_actionButtonTrailingSideBySideConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell_actionButtonLeadingStackedConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell____lazy_storage___actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin40HeaderWithActionButtonCollectionViewCell____lazy_storage___titleLabel));
}

@end
