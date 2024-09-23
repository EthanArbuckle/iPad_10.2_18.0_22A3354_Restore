@implementation OutlineDisclosureButton

- (int64_t)writingDirection
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC11NotesEditor23OutlineDisclosureButton_writingDirection);
  swift_beginAccess();
  return *v2;
}

- (void)setWritingDirection:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC11NotesEditor23OutlineDisclosureButton_writingDirection);
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC11NotesEditor23OutlineDisclosureButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11NotesEditor23OutlineDisclosureButton_isCollapsed) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor23OutlineDisclosureButton_writingDirection) = (Class)-1;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[OutlineDisclosureButton initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11NotesEditor23OutlineDisclosureButton)initWithCoder:(id)a3
{
  _TtC11NotesEditor23OutlineDisclosureButton *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11NotesEditor23OutlineDisclosureButton_isCollapsed) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor23OutlineDisclosureButton_writingDirection) = (Class)-1;

  result = (_TtC11NotesEditor23OutlineDisclosureButton *)sub_1DD9D2CEC();
  __break(1u);
  return result;
}

- (NSString)accessibilityLabel
{
  _TtC11NotesEditor23OutlineDisclosureButton *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  _s11NotesEditor23OutlineDisclosureButtonC18accessibilityLabelSSSgvg_0();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1DD9D2140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSArray)accessibilityUserInputLabels
{
  _TtC11NotesEditor23OutlineDisclosureButton *v2;
  void *v3;

  v2 = self;
  _s11NotesEditor23OutlineDisclosureButtonC28accessibilityUserInputLabelsSaySSGSgvg_0();

  v3 = (void *)sub_1DD9D229C();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = v7.receiver;
  v3 = -[OutlineDisclosureButton accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = *MEMORY[0x1E0DC46B0];

  v5 = -1;
  if ((v4 & v3) != 0)
    v5 = ~v4;
  return v5 & v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[OutlineDisclosureButton setAccessibilityTraits:](&v4, sel_setAccessibilityTraits_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

- (void)contentSizeCategoryDidChange
{
  void *v0;
  id v1;
  id v2;
  id v3;
  double v4;
  id v5;

  UIAccessibilityButtonShapesEnabled();
  v0 = (void *)sub_1DD9D2140();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v0);

  if (v1)
  {
    v2 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4B60]);
    v3 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_scale_, v2, 1);

    v5 = objc_msgSend(v1, sel_imageWithSymbolConfiguration_, v3);
    if (v5)
    {
      if (qword_1F03F5D88 != -1)
        swift_once();
      objc_msgSend(v5, sel_size);
      qword_1F03F9CB0 = fmax(v4, 20.0);

    }
  }
}

@end
