@implementation LUIUserInfoStyle

+ (id)sharedStyle
{
  if (qword_100088D38 != -1)
    dispatch_once(&qword_100088D38, &stru_100068F68);
  return (id)qword_100088D30;
}

- (void)applyIndicatorLabelThemeToLabel:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  if (a3)
  {
    v6 = a3;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightThin));
    objc_msgSend(v6, "setFont:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v6, "setTextColor:", v4);

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setTextAlignment:", 2);
    LODWORD(v5) = 1132134400;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v5);
    objc_msgSend(v6, "sizeToFit");

  }
}

- (void)applyIndicatorLabelThemeToLabels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[LUIUserInfoStyle applyIndicatorLabelThemeToLabel:](self, "applyIndicatorLabelThemeToLabel:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)applyThemeToLabel:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  if (a3)
  {
    v6 = a3;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightThin));
    objc_msgSend(v6, "setFont:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    objc_msgSend(v6, "setTextColor:", v4);

    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v6, "setNumberOfLines:", 0);
    objc_msgSend(v6, "setPreferredMaxLayoutWidth:", 300.0);
    LODWORD(v5) = 1132134400;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v5);

  }
}

- (void)applyThemeToLabels:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[LUIUserInfoStyle applyThemeToLabel:](self, "applyThemeToLabel:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)applyRowStackViewPropertiesToStackView:(id)a3
{
  double v4;
  double v5;
  id v6;

  if (a3)
  {
    v6 = a3;
    -[LUIUserInfoStyle stackViewSpacing](self, "stackViewSpacing");
    objc_msgSend(v6, "setSpacing:");
    LODWORD(v4) = 1148846080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v4);
    LODWORD(v5) = 1148846080;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v5);
    objc_msgSend(v6, "setAlignment:", 2);
    objc_msgSend(v6, "setDistribution:", 0);
    objc_msgSend(v6, "setAxis:", 0);

  }
}

- (void)applyRowStackViewPropertiesToStackViews:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[LUIUserInfoStyle applyRowStackViewPropertiesToStackView:](self, "applyRowStackViewPropertiesToStackView:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (double)stackViewSpacing
{
  return 8.0;
}

- (double)sidePadding
{
  return 30.0;
}

- (double)bottomPadding
{
  return 15.0;
}

@end
