@implementation ExpandableTextView

- (_TtC8AppStore18ExpandableTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004C1F38();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ExpandableTextView();
  -[ExpandableTextView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  _TtC8AppStore18ExpandableTextView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for ExpandableTextView();
  v18.receiver = self;
  v18.super_class = v8;
  v9 = self;
  -[ExpandableTextView frame](&v18, "frame");
  v11 = v10;
  v13 = v12;
  v17.receiver = v9;
  v17.super_class = v8;
  -[ExpandableTextView setFrame:](&v17, "setFrame:", x, y, width, height);
  -[ExpandableTextView frame](v9, "frame");
  if (v11 != v15 || v13 != v14)
    sub_1004C09EC();

}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExpandableTextView();
  return -[ExpandableTextView backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ExpandableTextView();
  v4 = a3;
  v5 = (char *)v10.receiver;
  -[ExpandableTextView setBackgroundColor:](&v10, "setBackgroundColor:", v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC8AppStore18ExpandableTextView_textLabel];
  v7 = objc_msgSend(v5, "backgroundColor", v10.receiver, v10.super_class);
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v8 = *(void **)&v5[OBJC_IVAR____TtC8AppStore18ExpandableTextView_moreButton];
  v9 = objc_msgSend(v5, "backgroundColor");
  objc_msgSend(v8, "setBackgroundColor:", v9);

}

- (void)layoutSubviews
{
  _TtC8AppStore18ExpandableTextView *v2;

  v2 = self;
  sub_1004C0440();

}

- (void)tintColorDidChange
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ExpandableTextView();
  v2 = (char *)v5.receiver;
  -[ExpandableTextView tintColorDidChange](&v5, "tintColorDidChange");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore18ExpandableTextView_moreButton];
  v4 = objc_msgSend(v2, "tintColor", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setTitleColor:forState:", v4, 0);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  JUMeasurements result;

  width = a3.width;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18ExpandableTextView_textLabel), "measurementsWithFitting:in:", a4, a3.width, a3.height);
  v8 = width;
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ExpandableTextView();
  v4 = a3;
  v5 = v6.receiver;
  -[ExpandableTextView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_1004C09EC();

}

- (void)moreFrom:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC8AppStore18ExpandableTextView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore18ExpandableTextView_moreTapHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->textLabel[OBJC_IVAR____TtC8AppStore18ExpandableTextView_moreTapHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_10003A340((uint64_t)v3, v5);
    v3(v7);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore18ExpandableTextView_textLabel));
}

- (_TtC8AppStore18ExpandableTextView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore18ExpandableTextView *result;

  result = (_TtC8AppStore18ExpandableTextView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.ExpandableTextView", 27, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18ExpandableTextView_languageAwareString));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore18ExpandableTextView_moreTapHandler), *(_QWORD *)&self->textLabel[OBJC_IVAR____TtC8AppStore18ExpandableTextView_moreTapHandler]);
}

- (BOOL)hasContent
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore18ExpandableTextView_textLabel), "hasContent");
}

@end
