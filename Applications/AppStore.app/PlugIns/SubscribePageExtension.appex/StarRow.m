@implementation StarRow

- (NSString)maximumContentSizeCategory
{
  return (NSString *)sub_10042BD7C(self, (uint64_t)a2, (SEL *)&selRef_maximumContentSizeCategory);
}

- (void)setMaximumContentSizeCategory:(id)a3
{
  sub_10042BDD4(self, (uint64_t)a2, a3, (SEL *)&selRef_maximumContentSizeCategory, (SEL *)&selRef_setMaximumContentSizeCategory_);
}

- (NSString)minimumContentSizeCategory
{
  return (NSString *)sub_10042BD7C(self, (uint64_t)a2, (SEL *)&selRef_minimumContentSizeCategory);
}

- (void)setMinimumContentSizeCategory:(id)a3
{
  sub_10042BDD4(self, (uint64_t)a2, a3, (SEL *)&selRef_minimumContentSizeCategory, (SEL *)&selRef_setMinimumContentSizeCategory_);
}

- (_TtC22SubscribePageExtensionP33_2C6014D15F02DB8C76D5CE42FDC095AC7StarRow)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10042CD44();
}

- (_TtC22SubscribePageExtensionP33_2C6014D15F02DB8C76D5CE42FDC095AC7StarRow)initWithFrame:(CGRect)a3
{
  sub_100079114((uint64_t)self, (uint64_t)a2, (uint64_t)"SubscribePageExtension.StarRow", 30);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_2C6014D15F02DB8C76D5CE42FDC095AC7StarRow_starColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_2C6014D15F02DB8C76D5CE42FDC095AC7StarRow_starImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtensionP33_2C6014D15F02DB8C76D5CE42FDC095AC7StarRow_starLayer));
}

@end
