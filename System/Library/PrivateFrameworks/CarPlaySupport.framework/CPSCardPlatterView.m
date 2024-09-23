@implementation CPSCardPlatterView

- (CPSCardPlatterView)initWithFrame:(CGRect)a3 cornerRadius:(double)a4 maskedCorners:(unint64_t)a5
{
  CPSCardPlatterView *v6;
  id v7;
  id v8;
  id v9;
  CPSCardPlatterView *v10;
  id v11;
  objc_super v12;
  unint64_t v13;
  double v14;
  SEL v15;
  CPSCardPlatterView *v16;
  CGRect v17;

  v17 = a3;
  v15 = a2;
  v14 = a4;
  v13 = a5;
  v16 = 0;
  v12.receiver = self;
  v12.super_class = (Class)CPSCardPlatterView;
  v16 = -[CPSCardPlatterView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v16, v16);
  if (v16)
  {
    v7 = (id)-[CPSCardPlatterView layer](v16, "layer");
    objc_msgSend(v7, "setCornerRadius:", v14);

    v8 = (id)-[CPSCardPlatterView layer](v16, "layer");
    objc_msgSend(v8, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

    v9 = (id)-[CPSCardPlatterView layer](v16, "layer");
    objc_msgSend(v9, "setMaskedCorners:", v13);

    v10 = v16;
    v11 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
    -[CPSCardPlatterView setBackgroundColor:](v10, "setBackgroundColor:");

    -[CPSCardPlatterView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  v6 = v16;
  objc_storeStrong((id *)&v16, 0);
  return v6;
}

- (CPSCardPlatterView)initWithFrame:(CGRect)a3
{
  CPSCardPlatterView *v4;
  id v5;
  CGRect v6;

  v6 = a3;
  v5 = 0;
  v5 = -[CPSCardPlatterView initWithFrame:cornerRadius:maskedCorners:](self, "initWithFrame:cornerRadius:maskedCorners:", 15, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 5.0);
  objc_storeStrong(&v5, v5);
  v4 = (CPSCardPlatterView *)v5;
  objc_storeStrong(&v5, 0);
  return v4;
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v3;
  id location[2];
  CPSCardPlatterView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSCardPlatterView;
  -[CPSCardPlatterView setBackgroundColor:](&v3, sel_setBackgroundColor_, location[0]);
  -[CPSCardPlatterView _updateStyleOverridesForSubviews](v5, "_updateStyleOverridesForSubviews");
  objc_storeStrong(location, 0);
}

- (void)_updateStyleOverridesForSubviews
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(_QWORD *, void *);
  void *v13;
  uint64_t v14;
  id location;
  uint64_t v16;
  SEL v17;
  CPSCardPlatterView *v18;

  v18 = self;
  v17 = a2;
  v16 = 0;
  v8 = (id)-[CPSCardPlatterView backgroundColor](self, "backgroundColor");

  if (v8)
  {
    v4 = (id)-[CPSCardPlatterView backgroundColor](v18, "backgroundColor");
    v3 = (id)-[CPSCardPlatterView traitCollection](v18, "traitCollection");
    location = (id)objc_msgSend(v4, "resolvedColorWithTraitCollection:");

    v16 = 1;
    v6 = (id)CPContrastingColorForColor();
    v5 = (id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v7 = objc_msgSend(v6, "isEqual:");

    if ((v7 & 1) != 0)
      v16 = 2;
    objc_storeStrong(&location, 0);
  }
  v2 = (id)-[CPSCardPlatterView subviews](v18, "subviews");
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __54__CPSCardPlatterView__updateStyleOverridesForSubviews__block_invoke;
  v13 = &__block_descriptor_40_e23_v32__0__UIView_8Q16_B24l;
  v14 = v16;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v9);

}

void __54__CPSCardPlatterView__updateStyleOverridesForSubviews__block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setOverrideUserInterfaceStyle:", a1[4]);
  objc_storeStrong(location, 0);
}

- (void)didAddSubview:(id)a3
{
  objc_super v3;
  id location[2];
  CPSCardPlatterView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSCardPlatterView;
  -[CPSCardPlatterView didAddSubview:](&v3, sel_didAddSubview_, location[0]);
  -[CPSCardPlatterView _updateStyleOverridesForSubviews](v5, "_updateStyleOverridesForSubviews");
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSCardPlatterView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSCardPlatterView;
  -[CPSCardPlatterView traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSCardPlatterView _updateStyleOverridesForSubviews](v5, "_updateStyleOverridesForSubviews");
  objc_storeStrong(location, 0);
}

@end
