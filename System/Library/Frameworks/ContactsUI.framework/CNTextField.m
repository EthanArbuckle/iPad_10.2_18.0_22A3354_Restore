@implementation CNTextField

- (CNTextField)initWithFrame:(CGRect)a3
{
  CNTextField *v3;
  double v4;
  CNTextField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNTextField;
  v3 = -[CNTextField initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v3;
  if (v3)
  {
    LODWORD(v4) = *MEMORY[0x1E0CFAA90];
    -[CNTextField setLayoutSize:withContentPriority:](v3, "setLayoutSize:withContentPriority:", 20.0, *MEMORY[0x1E0CFAA78], v4);
  }
  return v5;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  NSObject *v6;
  double v7;
  double v8;
  objc_super v9;
  uint8_t buf[4];
  CNTextField *v11;
  uint64_t v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v12 = *MEMORY[0x1E0C80C00];
  CNUILogContactCard();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_error_impl(&dword_18AC56000, v6, OS_LOG_TYPE_ERROR, "%@ did not use fast-path for sizing", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)CNTextField;
  -[CNTextField sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v5.receiver = self;
  v5.super_class = (Class)CNTextField;
  -[CNTextField intrinsicContentSize](&v5, sel_intrinsicContentSize);
  v4 = v2;
  result.height = v3;
  result.width = v4;
  return result;
}

@end
