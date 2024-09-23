@implementation CycleHistorySingleCycleCell

- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell *)sub_231B2BAB8(v4, v5);
}

- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_singleCycleView;
  v6 = objc_allocWithZone((Class)type metadata accessor for CycleHistorySingleCycleView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_press) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_tap) = 0;

  result = (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleHistorySingleCycleCell();
  v2 = v3.receiver;
  -[CycleHistorySingleCycleCell prepareForReuse](&v3, sel_prepareForReuse);
  sub_231A3EAEC();

}

- (void)respondToHorizontalSizeChanges
{
  -[CycleHistorySingleCycleCell invalidateIntrinsicContentSize](self, sel_invalidateIntrinsicContentSize);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell *v8;
  uint64_t v9;

  v4 = sub_231C9FB5C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9FB50();
  v8 = self;
  sub_231B2AE00();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)cycleViewTapped:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell *v5;

  v4 = a3;
  v5 = self;
  sub_231B2BC1C();

}

- (void)cycleViewPanned:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell *v5;

  v4 = a3;
  v5 = self;
  sub_231B2B580(v4);

}

- (void)cycleViewPressed:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell *v5;

  v4 = a3;
  v5 = self;
  sub_231B2B678(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_press);
  return v4 && v4 == a3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_singleCycleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_press));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleCell_tap));
}

@end
