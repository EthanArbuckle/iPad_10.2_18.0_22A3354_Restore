@implementation _UIFontPickerTableViewCell

- (void)setFontInfo:(id)a3 usingSystemFont:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerTableViewCell defaultContentConfiguration](self, "defaultContentConfiguration"));
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "previewImage"));
    objc_msgSend(v6, "setImage:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageProperties"));
    objc_msgSend(v9, "setTintColor:", v8);

    objc_msgSend(v6, "setImageToTextPadding:", 10.0);
    objc_msgSend(v6, "setAxesPreservingSuperviewLayoutMargins:", 0);
    objc_msgSend(v6, "setDirectionalLayoutMargins:", 0.0, 10.0, 0.0, 10.0);
LABEL_8:
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedName"));
    objc_msgSend(v6, "setText:", v16);

    goto LABEL_9;
  }
  if ((objc_msgSend(v17, "fontCanRenderLocalizedName") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFontPickerTableViewCell traitCollection](self, "traitCollection"));
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if (v11 == (id)6)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", UIContentSizeCategoryLarge));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v12));

      objc_msgSend(v13, "lineHeight");
      objc_msgSend(v6, "setDirectionalLayoutMargins:", v14 * 0.5, 0.0, v14 * 0.5, 0.0);

    }
  }
  if ((objc_msgSend(v17, "fontCanRenderLocalizedName") & 1) == 0)
    goto LABEL_8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attributedString"));
  objc_msgSend(v6, "setAttributedText:", v15);

  objc_msgSend(v6, "setAxesPreservingSuperviewLayoutMargins:", 1);
  objc_msgSend(v6, "setDirectionalLayoutMargins:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
LABEL_9:
  -[_UIFontPickerTableViewCell setContentConfiguration:](self, "setContentConfiguration:", v6);

}

@end
