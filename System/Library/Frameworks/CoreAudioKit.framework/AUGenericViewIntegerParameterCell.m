@implementation AUGenericViewIntegerParameterCell

- (UIButton)editButton
{
  return (UIButton *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit33AUGenericViewIntegerParameterCell_editButton, a2);
}

- (void)setEditButton:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIButton)valueButton
{
  return (UIButton *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit33AUGenericViewIntegerParameterCell_valueButton, a2);
}

- (void)setValueButton:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)accessibilityIncrement
{
  _TtC12CoreAudioKit33AUGenericViewIntegerParameterCell *v2;

  v2 = self;
  sub_2131A1EE0();

}

- (void)accessibilityDecrement
{
  _TtC12CoreAudioKit33AUGenericViewIntegerParameterCell *v2;

  v2 = self;
  sub_2131A1F94();

}

- (_TtC12CoreAudioKit33AUGenericViewIntegerParameterCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC12CoreAudioKit33AUGenericViewIntegerParameterCell_indexPath;
  v6 = sub_2131E198C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AUGenericViewIntegerParameterCell();
  return -[AUGenericViewParameterCellBase initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_21317BC98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit33AUGenericViewIntegerParameterCell_indexPath, &qword_254B881E0);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end
