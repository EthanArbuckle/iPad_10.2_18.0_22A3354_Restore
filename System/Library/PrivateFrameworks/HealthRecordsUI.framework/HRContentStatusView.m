@implementation HRContentStatusView

- (NSString)title
{
  return (NSString *)sub_1BC49BD98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRContentStatusView_title);
}

- (void)setTitle:(id)a3
{
  sub_1BC49BE24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1BC51F8B8);
}

- (NSString)subtitle
{
  return (NSString *)sub_1BC49BD98((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRContentStatusView_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_1BC49BE24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1BC51F954);
}

- (HRContentStatusView)initWithTitle:(id)a3 subtitle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
  {
    v5 = 0;
    v7 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    v10 = 0;
    return (HRContentStatusView *)ContentStatusView.init(title:subtitle:)(v5, v7, v8, v10);
  }
  v5 = sub_1BC62C680();
  v7 = v6;
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = sub_1BC62C680();
  v10 = v9;
  return (HRContentStatusView *)ContentStatusView.init(title:subtitle:)(v5, v7, v8, v10);
}

- (HRContentStatusView)initWithCoder:(id)a3
{
  return (HRContentStatusView *)ContentStatusView.init(coder:)(a3);
}

- (HRContentStatusView)initWithFrame:(CGRect)a3
{
  return (HRContentStatusView *)ContentStatusView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)startAnimating
{
  sub_1BC5205B0((char *)self, (uint64_t)a2, (SEL *)&selRef_startAnimating);
}

- (void)stopAnimating
{
  sub_1BC5205B0((char *)self, (uint64_t)a2, (SEL *)&selRef_stopAnimating);
}

- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  HRContentStatusView *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_1BC520C10(a4);
  swift_unknownObjectRelease();

}

- (void)layoutSubviews
{
  HRContentStatusView *v2;

  v2 = self;
  sub_1BC520674();

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
