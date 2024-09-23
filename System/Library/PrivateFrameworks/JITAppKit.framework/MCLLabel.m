@implementation MCLLabel

- (void)layoutSubviews
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  objc_super v11;
  SEL v12;
  MCLLabel *v13;

  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)MCLLabel;
  objc_msgSendSuper2(&v11, (SEL)0x1F2FD0E48);
  -[MCLLabel frame](v13, "frame");
  v7 = v2;
  v8 = v3;
  v9 = v4;
  v10 = v5;
  -[MCLLabel setPreferredMaxLayoutWidth:](v13, "setPreferredMaxLayoutWidth:", v4);
  v6.receiver = v13;
  v6.super_class = (Class)MCLLabel;
  objc_msgSendSuper2(&v6, (SEL)0x1F2FD0E48);
}

@end
