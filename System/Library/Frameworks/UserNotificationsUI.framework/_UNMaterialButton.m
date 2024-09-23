@implementation _UNMaterialButton

- (_UNMaterialButton)initWithFrame:(CGRect)a3
{
  _UNMaterialButton *v3;
  uint64_t v4;
  NSMutableDictionary *styling;
  uint64_t v6;
  NSMutableDictionary *imageViewStyling;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UNMaterialButton;
  v3 = -[_UNMaterialButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    styling = v3->_styling;
    v3->_styling = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    imageViewStyling = v3->_imageViewStyling;
    v3->_imageViewStyling = (NSMutableDictionary *)v6;

    -[_UNMaterialButton setShowsTouchWhenHighlighted:](v3, "setShowsTouchWhenHighlighted:", 0);
    -[_UNMaterialButton _applyStyling](v3, "_applyStyling");
  }
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[_UNMaterialButton isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UNMaterialButton;
    -[_UNMaterialButton setEnabled:](&v5, sel_setEnabled_, v3);
    -[_UNMaterialButton _applyStyling](self, "_applyStyling");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[_UNMaterialButton isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UNMaterialButton;
    -[_UNMaterialButton setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[_UNMaterialButton _applyStyling](self, "_applyStyling");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[_UNMaterialButton isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UNMaterialButton;
    -[_UNMaterialButton setSelected:](&v5, sel_setSelected_, v3);
    -[_UNMaterialButton _applyStyling](self, "_applyStyling");
  }
}

- (void)setStyle:(int64_t)a3 forState:(unint64_t)a4
{
  NSMutableDictionary *styling;
  void *v7;
  void *v8;

  styling = self->_styling;
  if (a3 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](styling, "removeObjectForKey:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](styling, "setObject:forKey:", v7, v8);

  }
  if (-[_UNMaterialButton state](self, "state") == a4)
    -[_UNMaterialButton _applyButtonStyling](self, "_applyButtonStyling");
}

- (void)setImageViewStyle:(int64_t)a3 forState:(unint64_t)a4
{
  NSMutableDictionary *imageViewStyling;
  void *v8;
  void *v9;

  imageViewStyling = self->_imageViewStyling;
  if (a3 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](imageViewStyling, "removeObjectForKey:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](imageViewStyling, "setObject:forKey:", v8, v9);

  }
  -[_UNMaterialButton _setFlagsRelatedToState:to:](self, "_setFlagsRelatedToState:to:", a4, a3 == -1);
  if (-[_UNMaterialButton state](self, "state") == a4)
    -[_UNMaterialButton _applyImageViewStyling](self, "_applyImageViewStyling");
}

- (void)_setFlagsRelatedToState:(unint64_t)a3 to:(BOOL)a4
{
  if (a3 == 2)
  {
    -[_UNMaterialButton setAdjustsImageWhenDisabled:](self, "setAdjustsImageWhenDisabled:", a4);
  }
  else if (a3 == 1)
  {
    -[_UNMaterialButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", a4);
  }
}

- (void)_applyStyling
{
  -[_UNMaterialButton _applyButtonStyling](self, "_applyButtonStyling");
  -[_UNMaterialButton _applyImageViewStyling](self, "_applyImageViewStyling");
}

- (void)_applyButtonStyling
{
  NSMutableDictionary *styling;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[_UNMaterialButton mt_removeAllVisualStyling](self, "mt_removeAllVisualStyling");
  styling = self->_styling;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_UNMaterialButton state](self, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](styling, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7)
  {
    v6 = objc_msgSend(v7, "integerValue");
    v5 = v7;
    if (v6 != -1)
    {
      -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](self->_visualStylingProvider, "automaticallyUpdateView:withStyle:", self);
      v5 = v7;
    }
  }

}

- (void)_applyImageViewStyling
{
  void *v3;
  NSMutableDictionary *imageViewStyling;
  void *v5;
  void *v6;
  uint64_t v7;
  MTVisualStylingProvider *visualStylingProvider;
  void *v9;
  id v10;

  -[_UNMaterialButton imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mt_removeAllVisualStyling");

  imageViewStyling = self->_imageViewStyling;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_UNMaterialButton state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](imageViewStyling, "objectForKey:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v10)
  {
    v7 = objc_msgSend(v10, "integerValue");
    v6 = v10;
    if (v7 != -1)
    {
      visualStylingProvider = self->_visualStylingProvider;
      -[_UNMaterialButton imageView](self, "imageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTVisualStylingProvider automaticallyUpdateView:withStyle:](visualStylingProvider, "automaticallyUpdateView:withStyle:", v9, v7);

      v6 = v10;
    }
  }

}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  if (a3 == 1)
    return self->_visualStylingProvider;
  else
    return 0;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_24D5BDEB8;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v7;
  MTVisualStylingProvider *visualStylingProvider;
  MTVisualStylingProvider *v9;
  void *v10;
  MTVisualStylingProvider *v11;

  v7 = (MTVisualStylingProvider *)a3;
  if (a4 == 1)
  {
    visualStylingProvider = self->_visualStylingProvider;
    if (visualStylingProvider != v7)
    {
      v11 = v7;
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:", self);
      v9 = self->_visualStylingProvider;
      -[_UNMaterialButton imageView](self, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v9, "stopAutomaticallyUpdatingView:", v10);

      objc_storeStrong((id *)&self->_visualStylingProvider, a3);
      -[_UNMaterialButton _applyStyling](self, "_applyStyling");
      v7 = v11;
    }
  }

}

- (NSMutableDictionary)styling
{
  return self->_styling;
}

- (void)setStyling:(id)a3
{
  objc_storeStrong((id *)&self->_styling, a3);
}

- (NSMutableDictionary)imageViewStyling
{
  return self->_imageViewStyling;
}

- (void)setImageViewStyling:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewStyling, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewStyling, 0);
  objc_storeStrong((id *)&self->_styling, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

@end
