@implementation AccessibilityFrameExpandingLabel

- (CGRect)accessibilityFrame
{
  _TtC7NotesUIP33_C019C42B7E55B56A7A54E47661E4063732AccessibilityFrameExpandingLabel *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  sub_1AC9EC7F8();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setAccessibilityFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AccessibilityFrameExpandingLabel();
  -[AccessibilityFrameExpandingLabel setAccessibilityFrame:](&v7, sel_setAccessibilityFrame_, x, y, width, height);
}

- (_TtC7NotesUIP33_C019C42B7E55B56A7A54E47661E4063732AccessibilityFrameExpandingLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC7NotesUIP33_C019C42B7E55B56A7A54E47661E4063732AccessibilityFrameExpandingLabel_accessibilityFrameDelegate) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AccessibilityFrameExpandingLabel();
  return -[AccessibilityFrameExpandingLabel initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7NotesUIP33_C019C42B7E55B56A7A54E47661E4063732AccessibilityFrameExpandingLabel)initWithCoder:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC7NotesUIP33_C019C42B7E55B56A7A54E47661E4063732AccessibilityFrameExpandingLabel_accessibilityFrameDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccessibilityFrameExpandingLabel();
  return -[AccessibilityFrameExpandingLabel initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1AC8FC3B8((uint64_t)self+ OBJC_IVAR____TtC7NotesUIP33_C019C42B7E55B56A7A54E47661E4063732AccessibilityFrameExpandingLabel_accessibilityFrameDelegate);
}

@end
