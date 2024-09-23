@implementation ICDocCamFilterButton

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICDocCamFilterButton;
  -[ICDocCamFilterButton dealloc](&v4, sel_dealloc);
}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICDocCamFilterButton;
  -[ICDocCamFilterButton awakeFromNib](&v9, sel_awakeFromNib);
  -[ICDocCamFilterButton inactiveBackgroundViewColor](self, "inactiveBackgroundViewColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterButton backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[ICDocCamFilterButton inactiveTextColor](self, "inactiveTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterButton filterNameLabel](self, "filterNameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  -[ICDocCamFilterButton filterIconView](self, "filterIconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIgnoresInvertColors:", 1);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_updateForAccessibilityDarkerSystemColors_, *MEMORY[0x24BDF7230], 0);

}

- (void)setFilterType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  self->_filterType = a3;
  -[ICDocCamFilterButton imageForFilterType:](self, "imageForFilterType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterButton filterIconView](self, "filterIconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  +[ICDocCamImageFilters localizedImageFilterNameForType:](ICDocCamImageFilters, "localizedImageFilterNameForType:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamFilterButton filterNameLabel](self, "filterNameLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

}

- (void)setIconSize:(double)a3
{
  id v4;

  -[ICDocCamFilterButton iconSizeConstraint](self, "iconSizeConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", a3);

}

- (double)iconSize
{
  void *v2;
  double v3;
  double v4;

  -[ICDocCamFilterButton iconSizeConstraint](self, "iconSizeConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constant");
  v4 = v3;

  return v4;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  if (-[ICDocCamFilterButton isSelected](self, "isSelected") != a3)
  {
    if (v3)
      -[ICDocCamFilterButton activeBackgroundViewColor](self, "activeBackgroundViewColor");
    else
      -[ICDocCamFilterButton inactiveBackgroundViewColor](self, "inactiveBackgroundViewColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterButton backgroundView](self, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    if (v3)
      -[ICDocCamFilterButton activeBackgroundViewColor](self, "activeBackgroundViewColor");
    else
      -[ICDocCamFilterButton inactiveTextColor](self, "inactiveTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterButton filterNameLabel](self, "filterNameLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

  }
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamFilterButton;
  -[ICDocCamFilterButton setSelected:](&v9, sel_setSelected_, v3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v5;
  void *v6;
  ICDocCamFilterButton *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICDocCamFilterButton;
  -[ICDocCamFilterButton hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    return 0;
  v6 = (void *)v5;
  v7 = self;

  return v7;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (-[ICDocCamFilterButton isHighlighted](self, "isHighlighted") != a3)
  {
    if (v3)
      v5 = 0.5;
    else
      v5 = 1.0;
    -[ICDocCamFilterButton filterIconView](self, "filterIconView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", v5);

  }
  v7.receiver = self;
  v7.super_class = (Class)ICDocCamFilterButton;
  -[ICDocCamFilterButton setHighlighted:](&v7, sel_setHighlighted_, v3);
}

- (UIColor)inactiveBackgroundViewColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "DCExtractedDocumentViewControllerBackgroundColor");
}

- (UIColor)inactiveTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.61, 1.0);
}

- (UIColor)activeBackgroundViewColor
{
  void *v2;
  uint64_t v3;

  -[ICDocCamFilterButton tintColor](self, "tintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    objc_msgSend(MEMORY[0x24BDF6950], "dc_darkerAccessibilityColorForColor:", v2);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return (UIColor *)v2;
}

- (id)imageForFilterType:(signed __int16)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  if (a3 > 4)
    v3 = 0;
  else
    v3 = off_24C5B8778[a3];
  v4 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", v3, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICDocCamFilterButton imageForFilterType:].cold.1(v7);

  }
  return v6;
}

+ (id)filterButtonWithType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadNibNamed:owner:options:", v6, a1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v13;

    if (v14)
      goto LABEL_14;
  }
  else
  {
LABEL_9:

  }
  v15 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    +[ICDocCamFilterButton filterButtonWithType:].cold.1(v15);

  v14 = 0;
LABEL_14:
  objc_msgSend(v14, "setFilterType:", v3, (_QWORD)v17);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  objc_msgSend(v14, "setNeedsLayout");
  objc_msgSend(v14, "layoutIfNeeded");

  return v14;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[ICDocCamFilterButton filterNameLabel](self, "filterNameLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)accessibilityFrame
{
  void *v2;
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
  CGRect result;

  -[ICDocCamFilterButton filterIconView](self, "filterIconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICDocCamFilterButton;
  v3 = -[ICDocCamFilterButton accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[ICDocCamFilterButton isSelected](self, "isSelected");
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (void)updateForAccessibilityDarkerSystemColors:(id)a3
{
  void *v4;
  id v5;

  if (-[ICDocCamFilterButton isSelected](self, "isSelected", a3))
  {
    -[ICDocCamFilterButton activeBackgroundViewColor](self, "activeBackgroundViewColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[ICDocCamFilterButton backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
}

- (signed)filterType
{
  return self->_filterType;
}

- (NSLayoutConstraint)labelVerticalSpacingConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_labelVerticalSpacingConstraint);
}

- (void)setLabelVerticalSpacingConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_labelVerticalSpacingConstraint, a3);
}

- (UILabel)filterNameLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_filterNameLabel);
}

- (void)setFilterNameLabel:(id)a3
{
  objc_storeWeak((id *)&self->_filterNameLabel, a3);
}

- (UIImageView)filterIconView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_filterIconView);
}

- (void)setFilterIconView:(id)a3
{
  objc_storeWeak((id *)&self->_filterIconView, a3);
}

- (UIView)backgroundView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_backgroundView);
}

- (void)setBackgroundView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundView, a3);
}

- (NSLayoutConstraint)iconSizeConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_iconSizeConstraint);
}

- (void)setIconSizeConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_iconSizeConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconSizeConstraint);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_destroyWeak((id *)&self->_filterIconView);
  objc_destroyWeak((id *)&self->_filterNameLabel);
  objc_destroyWeak((id *)&self->_labelVerticalSpacingConstraint);
}

- (void)imageForFilterType:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "result";
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

+ (void)filterButtonWithType:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "Unable to load date view", v1, 2u);
}

@end
