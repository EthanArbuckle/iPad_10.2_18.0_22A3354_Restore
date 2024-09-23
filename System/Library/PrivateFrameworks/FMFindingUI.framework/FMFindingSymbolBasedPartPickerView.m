@implementation FMFindingSymbolBasedPartPickerView

- (_TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  char *v8;
  _TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView *result;

  v5 = OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_stackView;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD978]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (char *)self + OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_value;
  *((_QWORD *)v8 + 4) = 0;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;

  result = (_TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView *)sub_23AA335A8();
  __break(1u);
  return result;
}

- (void)toggle
{
  _TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView *v2;

  v2 = self;
  sub_23A9CF7BC();

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMFindingSymbolBasedPartPickerView();
  v2 = (char *)v5.receiver;
  -[FMFindingSymbolBasedPartPickerView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_platterEffectView];
  v4 = objc_msgSend(v3, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, CGRectGetHeight(v6) * 0.5);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMFindingSymbolBasedPartPickerView();
  v4 = a3;
  v5 = v6.receiver;
  -[FMFindingSymbolBasedPartPickerView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  sub_23A9D02F8();

}

- (_TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView)initWithFrame:(CGRect)a3
{
  _TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView *result;

  result = (_TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_platterEffectView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_style));
  sub_23A9683BC((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI34FMFindingSymbolBasedPartPickerView_value, &qword_2569D53C8);
}

@end
