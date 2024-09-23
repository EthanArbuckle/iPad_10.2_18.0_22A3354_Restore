@implementation StarRow

- (NSString)maximumContentSizeCategory
{
  return (NSString *)sub_1003271E0(self, (uint64_t)a2, (SEL *)&selRef_maximumContentSizeCategory);
}

- (void)setMaximumContentSizeCategory:(id)a3
{
  sub_100327238(self, (uint64_t)a2, a3, (SEL *)&selRef_maximumContentSizeCategory, (SEL *)&selRef_setMaximumContentSizeCategory_);
}

- (NSString)minimumContentSizeCategory
{
  return (NSString *)sub_1003271E0(self, (uint64_t)a2, (SEL *)&selRef_minimumContentSizeCategory);
}

- (void)setMinimumContentSizeCategory:(id)a3
{
  sub_100327238(self, (uint64_t)a2, a3, (SEL *)&selRef_minimumContentSizeCategory, (SEL *)&selRef_setMinimumContentSizeCategory_);
}

- (_TtC8AppStoreP33_4D569A3E6303747AA734C2D941AA4EED7StarRow)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100328140();
}

- (_TtC8AppStoreP33_4D569A3E6303747AA734C2D941AA4EED7StarRow)initWithFrame:(CGRect)a3
{
  sub_1003278C4((uint64_t)self, (uint64_t)a2, (uint64_t)"AppStore.StarRow", 16);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_4D569A3E6303747AA734C2D941AA4EED7StarRow_starColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_4D569A3E6303747AA734C2D941AA4EED7StarRow_starImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_4D569A3E6303747AA734C2D941AA4EED7StarRow_starLayer));
}

@end
