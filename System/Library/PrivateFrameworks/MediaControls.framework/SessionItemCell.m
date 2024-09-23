@implementation SessionItemCell

- (_TtC13MediaControls15SessionItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1AAABA478();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC13MediaControls15SessionItemCell *)sub_1AAAB6EC8(a3, (uint64_t)a4, v6);
}

- (_TtC13MediaControls15SessionItemCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC13MediaControls15SessionItemCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC13MediaControls15SessionItemCell_viewModel;
  v6 = type metadata accessor for SessionItemViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC13MediaControls15SessionItemCell_itemView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13MediaControls15SessionItemCell_stylingProvider) = 0;
  v7 = a3;

  result = (_TtC13MediaControls15SessionItemCell *)sub_1AAABA7FC();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC13MediaControls15SessionItemCell *v7;
  uint64_t v8;
  objc_super v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEB93B60);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for SessionItemCell();
  v9.receiver = self;
  v9.super_class = v6;
  v7 = self;
  -[SessionItemCell prepareForReuse](&v9, sel_prepareForReuse);
  v8 = type metadata accessor for SessionItemViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  (*(void (**)(char *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v7->super.super.super.super.isa) + 0x70))(v5);

}

- (void).cxx_destruct
{
  sub_1AAA7B7EC((uint64_t)self + OBJC_IVAR____TtC13MediaControls15SessionItemCell_viewModel, &qword_1EEB93B60);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemCell_itemView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls15SessionItemCell_stylingProvider));
}

@end
