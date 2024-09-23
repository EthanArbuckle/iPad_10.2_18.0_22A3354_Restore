@implementation AXMemoriesSlider

- (void)setSelectedDescription:(id)a3
{
  NSString *v4;
  NSString *selectedDescription;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("●")))
  {
    accessibilityMemoriesLocalizedString(CFSTR("slider.value.neutral"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (NSString *)v6;
  }
  selectedDescription = self->_selectedDescription;
  self->_selectedDescription = v4;

}

- (id)accessibilityLabel
{
  int64_t v2;
  __CFString *v3;
  void *v4;

  v2 = -[AXMemoriesSlider sliderType](self, "sliderType");
  if (v2)
  {
    if (v2 != 1)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("slider.description.duration");
  }
  else
  {
    v3 = CFSTR("slider.description.mood");
  }
  accessibilityMemoriesLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)_axContainingCollectionView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDF6F98];
  -[AXMemoriesSlider accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerForView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)_axContainingSelectedItem
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  v2 = (void *)MEMORY[0x24BDF6F98];
  -[AXMemoriesSlider accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerForView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("selectedItem"));
  return v5;
}

- (void)accessibilityIncrement
{
  uint64_t v3;
  void *v4;
  id v5;

  -[AXMemoriesSlider _axContainingCollectionView](self, "_axContainingCollectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[AXMemoriesSlider _axContainingSelectedItem](self, "_axContainingSelectedItem");
  if (v3 < objc_msgSend(v5, "numberOfItemsInSection:", 0) - 1)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v3 + 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 16, 1);

  }
}

- (void)accessibilityDecrement
{
  uint64_t v3;
  void *v4;
  id v5;

  -[AXMemoriesSlider _axContainingCollectionView](self, "_axContainingCollectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[AXMemoriesSlider _axContainingSelectedItem](self, "_axContainingSelectedItem");
  if (v3 >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v3 - 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 16, 1);

  }
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
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
  double v15;
  double v16;
  CGRect result;

  -[AXMemoriesSlider _axContainingCollectionView](self, "_axContainingCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMemoriesSlider accessibilityContainer](self, "accessibilityContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  UIAccessibilityFrameForBounds();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (id)_accessibilityUserTestingElementBaseType
{
  return (id)objc_msgSend((id)objc_opt_class(), "description");
}

- (int64_t)sliderType
{
  return self->_sliderType;
}

- (void)setSliderType:(int64_t)a3
{
  self->_sliderType = a3;
}

- (NSString)selectedDescription
{
  return self->_selectedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedDescription, 0);
}

@end
