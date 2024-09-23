@implementation HRConceptHeaderCell

- (UIImage)headerImage
{
  return (UIImage *)sub_1BC5FE318((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRConceptHeaderCell_headerImage);
}

- (void)setHeaderImage:(id)a3
{
  id v5;
  HRConceptHeaderCell *v6;

  v5 = a3;
  v6 = self;
  sub_1BC5FDF2C(a3);

}

- (NSString)title
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___HRConceptHeaderCell_title;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1BC62C650();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  HRConceptHeaderCell *v7;

  if (a3)
  {
    v4 = sub_1BC62C680();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1BC5FE100(v4, v6);

}

- (UIColor)categoryColor
{
  return (UIColor *)sub_1BC5FE318((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRConceptHeaderCell_categoryColor);
}

- (void)setCategoryColor:(id)a3
{
  id v5;
  HRConceptHeaderCell *v6;

  v5 = a3;
  v6 = self;
  sub_1BC5FE3F0(a3);

}

+ (id)defaultReuseIdentifier
{
  void *v2;

  swift_getObjCClassMetadata();
  sub_1BC5FF26C();
  sub_1BC62C6E0();
  v2 = (void *)sub_1BC62C650();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)setupSubviews
{
  HRConceptHeaderCell *v2;

  v2 = self;
  sub_1BC5FE614();

}

- (void)setUpConstraints
{
  HRConceptHeaderCell *v2;

  v2 = self;
  sub_1BC5FE7A0();

}

- (int64_t)intendedPlacement
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConceptHeaderCell();
  return -[WDMedicalRecordGroupableCell intendedPlacement](&v3, sel_intendedPlacement);
}

- (void)setIntendedPlacement:(int64_t)a3
{
  HRConceptHeaderCell *v4;

  v4 = self;
  sub_1BC5FEBEC((id)a3);

}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  void *v4;
  uint64_t v5;
  HRConceptHeaderCell *v6;
  id v7;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___HRConceptHeaderCell_titleLabel);
  v4 = (void *)objc_opt_self();
  v5 = *MEMORY[0x1E0DC4B10];
  v6 = self;
  v7 = objc_msgSend(v4, sel__preferredFontForTextStyle_variant_, v5, 1024);
  objc_msgSend(v3, sel_setFont_, v7);

}

- (void)_traitCollectionDidChange:(id)a3
{
  id v5;
  HRConceptHeaderCell *v6;

  v5 = a3;
  v6 = self;
  sub_1BC5FED74(a3);

}

- (HRConceptHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1BC62C680();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (HRConceptHeaderCell *)ConceptHeaderCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (HRConceptHeaderCell)initWithCoder:(id)a3
{
  return (HRConceptHeaderCell *)ConceptHeaderCell.init(coder:)(a3);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HRConceptHeaderCell____lazy_storage___bottomConstraint));

  swift_bridgeObjectRelease();
}

@end
