@implementation DynamicTypeTextField

- (BOOL)jet_isTextExtraTall
{
  _TtC12GameCenterUI20DynamicTypeTextField *v2;
  char v3;

  v2 = self;
  v3 = sub_1AB4F3EE8();

  return v3 & 1;
}

- (UIEdgeInsets)jet_languageAwareOutsets
{
  _TtC12GameCenterUI20DynamicTypeTextField *v2;
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
  UIEdgeInsets result;

  v2 = self;
  sub_1AB4F4018();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (int64_t)jet_textLength
{
  _TtC12GameCenterUI20DynamicTypeTextField *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1AB4F40D0();
  v4 = v3;

  return v4;
}

- (UIFont)font
{
  _TtC12GameCenterUI20DynamicTypeTextField *v2;
  id v3;

  v2 = self;
  v3 = sub_1AB76C9CC();

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v5;
  _TtC12GameCenterUI20DynamicTypeTextField *v6;

  v5 = a3;
  v6 = self;
  sub_1AB76CA48(a3);

}

- (int64_t)textAlignment
{
  _TtC12GameCenterUI20DynamicTypeTextField *v2;
  id v3;

  v2 = self;
  v3 = sub_1AB76CB14();

  return (int64_t)v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  _TtC12GameCenterUI20DynamicTypeTextField *v4;

  v4 = self;
  sub_1AB76CB84(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI20DynamicTypeTextField *v6;

  v5 = a3;
  v6 = self;
  sub_1AB76CCE0(a3);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC12GameCenterUI20DynamicTypeTextField *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1AB76CF5C((uint64_t)a4, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  swift_unknownObjectRelease();

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1AB76D188();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_1AB76D188();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_TtC12GameCenterUI20DynamicTypeTextField)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI20DynamicTypeTextField *)sub_1AB76D1F0();
}

- (_TtC12GameCenterUI20DynamicTypeTextField)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI20DynamicTypeTextField *)sub_1AB76D2B0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI20DynamicTypeTextField_fontUseCaseContentSizeCategory));
  sub_1AB473FBC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI20DynamicTypeTextField_fontUseCase, (uint64_t *)&unk_1EEC07AC0);
}

@end
