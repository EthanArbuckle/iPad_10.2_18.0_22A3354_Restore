@implementation FavoriteColorWellCell

- (_TtC20ColorPickerUIService21FavoriteColorWellCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ColorPickerUIService21FavoriteColorWellCell *)sub_1000324BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ColorPickerUIService21FavoriteColorWellCell)initWithCoder:(id)a3
{
  return (_TtC20ColorPickerUIService21FavoriteColorWellCell *)sub_100032624(a3);
}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  return -[FavoriteColorWellCell isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FavoriteColorWellCell();
  v4 = v5.receiver;
  -[FavoriteColorWellCell setSelected:](&v5, "setSelected:", v3);
  objc_msgSend(v4, "setNeedsLayout", v5.receiver, v5.super_class);

}

- (void)layoutSubviews
{
  _TtC20ColorPickerUIService21FavoriteColorWellCell *v2;

  v2 = self;
  sub_100032B60();

}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[FavoriteColorWellCell bounds](self, "bounds", a3, a4);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC20ColorPickerUIService21FavoriteColorWellCell *v7;
  uint64_t v8;
  __n128 v9;
  _TtC20ColorPickerUIService21FavoriteColorWellCell *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t (*v15)();
  _OWORD v17[2];

  if (a4)
  {
    v7 = self;
    v9 = swift_unknownObjectRetain(a4, v8);
    _bridgeAnyObjectToAny(_:)(v17, v9);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v10 = self;
  }
  if ((static Selector.== infix(_:_:)(a3, "delete:") & 1) != 0)
  {
    v11 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete);
    v12 = *(_QWORD *)&self->color[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete];
    v13 = v11 != 0;
    if (v11)
    {
      v14 = swift_allocObject(&unk_10005C330, 32, 7);
      *(_QWORD *)(v14 + 16) = v11;
      *(_QWORD *)(v14 + 24) = v12;
      v15 = sub_100033348;
    }
    else
    {
      v15 = 0;
      v14 = 0;
    }
    sub_100033314(v11, v12);
    sub_10000CCDC((uint64_t)v15, v14);
  }
  else
  {
    v13 = 0;
  }

  sub_1000332D4((uint64_t)v17);
  return v13;
}

- (void)delete:(id)a3
{
  _TtC20ColorPickerUIService21FavoriteColorWellCell *v5;
  uint64_t v6;
  __n128 v7;
  _TtC20ColorPickerUIService21FavoriteColorWellCell *v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[2];

  if (a3)
  {
    v5 = self;
    v7 = swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(v12, v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v8 = self;
  }
  v9 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete);
  if (v9)
  {
    v10 = *(_QWORD *)&self->color[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete];
    v11 = swift_retain(v10);
    v9(v11);
    sub_10000CCDC((uint64_t)v9, v10);
  }

  sub_1000332D4((uint64_t)v12);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC20ColorPickerUIService21FavoriteColorWellCell *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color);
  v3 = self;
  v4 = objc_msgSend(v2, "_accessibilityNameWithLuma");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v6 = v5;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (unint64_t)accessibilityTraits
{
  _TtC20ColorPickerUIService21FavoriteColorWellCell *v2;
  UIAccessibilityTraits v3;

  v2 = self;
  v3 = sub_100030E80();

  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_color));
  sub_10000CCDC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete), *(_QWORD *)&self->color[OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_onDelete]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell____lazy_storage___deleteInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_colorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_blackHalfView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ColorPickerUIService21FavoriteColorWellCell_maskShapeView));
}

@end
