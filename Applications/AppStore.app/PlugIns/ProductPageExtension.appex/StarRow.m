@implementation StarRow

- (NSString)maximumContentSizeCategory
{
  return (NSString *)sub_100068910(self, (uint64_t)a2, (SEL *)&selRef_maximumContentSizeCategory);
}

- (void)setMaximumContentSizeCategory:(id)a3
{
  sub_100068968(self, (uint64_t)a2, a3, (SEL *)&selRef_maximumContentSizeCategory, (SEL *)&selRef_setMaximumContentSizeCategory_);
}

- (NSString)minimumContentSizeCategory
{
  return (NSString *)sub_100068910(self, (uint64_t)a2, (SEL *)&selRef_minimumContentSizeCategory);
}

- (void)setMinimumContentSizeCategory:(id)a3
{
  sub_100068968(self, (uint64_t)a2, a3, (SEL *)&selRef_minimumContentSizeCategory, (SEL *)&selRef_setMinimumContentSizeCategory_);
}

- (_TtC20ProductPageExtensionP33_06779790DFC391F4528ECB93682635147StarRow)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000698B8();
}

- (_TtC20ProductPageExtensionP33_06779790DFC391F4528ECB93682635147StarRow)initWithFrame:(CGRect)a3
{
  sub_100068FF4((uint64_t)self, (uint64_t)a2, (uint64_t)"ProductPageExtension.StarRow", 28);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_06779790DFC391F4528ECB93682635147StarRow_starColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_06779790DFC391F4528ECB93682635147StarRow_starImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_06779790DFC391F4528ECB93682635147StarRow_starLayer));
}

@end
