@implementation PLImageAccessibilityElement

- (id)delegate
{
  void *v3;
  uint64_t v4;
  id v5;

  -[PLImageAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSClassFromString(CFSTR("UITableViewCellAccessibilityElement"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NSLog(CFSTR("AX******* What was the container for me: %x -> %@"), self, v3);
        v5 = 0;
        goto LABEL_6;
      }
      objc_msgSend(v3, "safeValueForKey:", CFSTR("tableViewCell"));
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
  }
  v5 = v3;
  v3 = v5;
LABEL_6:

  return v5;
}

- (id)dataSource
{
  void *v2;
  void *v3;
  void *v4;

  -[PLImageAccessibilityElement delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PLAlbumView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

  -[PLImageAccessibilityElement delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "safeValueForKey:", CFSTR("cellPhotoSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeValue");

  -[PLImageAccessibilityElement index](self, "index");
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

- (int64_t)_albumPhotoIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;

  -[PLImageAccessibilityElement delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLImageAccessibilityElement delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PLAlbumView")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForCell:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "row");
  objc_msgSend(v5, "safeValueForKey:", CFSTR("currentPickerSession"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  v11 = v8 - v10;
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_columnsPerRow"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  v14 = v13 * v11 + -[PLImageAccessibilityElement index](self, "index");
  return v14;
}

- (id)_axMainAssetURL
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[PLImageAccessibilityElement _albumPhotoIndex](self, "_albumPhotoIndex");
  -[PLImageAccessibilityElement dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PLImageAccessibilityElement albumView](self, "albumView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumView:accessibilityPhotoURL:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_accessibilityPhotoDescription
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[PLImageAccessibilityElement _albumPhotoIndex](self, "_albumPhotoIndex");
  -[PLImageAccessibilityElement dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PLImageAccessibilityElement albumView](self, "albumView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumView:accessibilityPhotoDescription:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_accessibilityElementStoredUserLabel
{
  void *v2;
  void *v3;
  __CFString *v4;

  -[PLImageAccessibilityElement _axMainAssetURL](self, "_axMainAssetURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityMetadataDescriptionForImage();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &stru_24FF00C00;

  return v4;
}

- (id)albumView
{
  void *v2;
  void *v3;

  -[PLImageAccessibilityElement delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PLAlbumView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityLabel
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[PLImageAccessibilityElement _albumPhotoIndex](self, "_albumPhotoIndex");
  -[PLImageAccessibilityElement dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PLImageAccessibilityElement albumView](self, "albumView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "albumView:accessibilityLabelForPhotoAtIndex:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v4)
    {
      v6 = 0;
      goto LABEL_7;
    }
    NSStringFromSelector(sel_albumView_accessibilityLabelForPhotoAtIndex_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _AXAssert();
    v6 = 0;
  }

LABEL_7:
  return v6;
}

- (unint64_t)accessibilityTraits
{
  int64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;

  v3 = -[PLImageAccessibilityElement _albumPhotoIndex](self, "_albumPhotoIndex");
  -[PLImageAccessibilityElement dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PLImageAccessibilityElement albumView](self, "albumView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "albumView:accessibilityTraitsForPhotoAtIndex:", v5, v3);

  }
  else
  {
    if (v4)
    {
      NSStringFromSelector(sel_albumView_accessibilityTraitsForPhotoAtIndex_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXAssert();

    }
    v6 = *MEMORY[0x24BDF73E0];
  }

  return v6;
}

- (id)_accessibilityDefaultFocusGroupIdentifier
{
  return 0;
}

- (int)index
{
  return self->_index;
}

- (void)setIndex:(int)a3
{
  self->_index = a3;
}

@end
