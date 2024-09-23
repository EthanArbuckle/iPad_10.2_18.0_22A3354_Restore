@implementation DynamicTypeLabel

- (_TtC12GameCenterUI16DynamicTypeLabel)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB581848();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB581930();
}

- (UIFont)font
{
  _TtC12GameCenterUI16DynamicTypeLabel *v2;
  id v3;

  v2 = self;
  v3 = sub_1AB582070((SEL *)&selRef_font);

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v5;
  _TtC12GameCenterUI16DynamicTypeLabel *v6;

  v5 = a3;
  v6 = self;
  sub_1AB581E08(a3);

}

- (int64_t)textAlignment
{
  _TtC12GameCenterUI16DynamicTypeLabel *v2;
  id v3;

  v2 = self;
  v3 = sub_1AB581F68();

  return (int64_t)v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  _TtC12GameCenterUI16DynamicTypeLabel *v3;

  v3 = self;
  sub_1AB581FD8();

}

- (NSAttributedString)attributedText
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return -[DynamicTypeLabel attributedText](&v3, sel_attributedText);
}

- (void)setAttributedText:(id)a3
{
  id v4;
  _TtC12GameCenterUI16DynamicTypeLabel *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v5 = self;
  v6 = -[DynamicTypeLabel lineBreakMode](v5, sel_lineBreakMode);
  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  -[DynamicTypeLabel setAttributedText:](&v7, sel_setAttributedText_, v4);
  -[DynamicTypeLabel setLineBreakMode:](v5, sel_setLineBreakMode_, v6);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI16DynamicTypeLabel *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5821BC(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16DynamicTypeLabel_fontUseCaseContentSizeCategory));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16DynamicTypeLabel_systemDesign));
  sub_1AB473FBC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI16DynamicTypeLabel_fontUseCase, (uint64_t *)&unk_1EEC07AC0);
}

@end
