@implementation AudiogramFrequencySelectionCell

- (_TtC18AudiogramIngestion31AudiogramFrequencySelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v6;
  _TtC18AudiogramIngestion31AudiogramFrequencySelectionCell *v7;
  objc_super v9;

  if (a4)
  {
    sub_22FB8D160();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency) = 0;
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequencySelected) = 0;
    v6 = (void *)sub_22FB8D154();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency) = 0;
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequencySelected) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionCell();
  v7 = -[AudiogramFrequencySelectionCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, v6);

  return v7;
}

- (_TtC18AudiogramIngestion31AudiogramFrequencySelectionCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequencySelected) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionCell();
  return -[AudiogramFrequencySelectionCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18AudiogramIngestion31AudiogramFrequencySelectionCell_frequency));
}

@end
