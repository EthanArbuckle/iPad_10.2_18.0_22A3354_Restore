@implementation UIFont

+ (id)phPreferredFontForTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor phPreferredFontDescriptorForTextStyle:](UIFontDescriptor, "phPreferredFontDescriptorForTextStyle:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

+ (id)phPreferredBoldFontForTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:](UIFontDescriptor, "phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:", a3, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

+ (id)phPreferredItalicFontForTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:](UIFontDescriptor, "phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:", a3, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

+ (id)phPreferredTightLeadingFontForTextStyle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:](UIFontDescriptor, "phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:", a3, 0x8000));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "withCaseSensitiveAttribute"));

  return v5;
}

+ (id)_thinSystemFontWithDialerCharacteristicsOfSize:(double)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _thinSystemFontOfSize:](UIFont, "_thinSystemFontOfSize:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "withCaseSensitiveAttribute"));

  return v4;
}

+ (id)voicemailFootnoteFont
{
  if (qword_100092218 != -1)
    dispatch_once(&qword_100092218, &stru_10007D570);
  return (id)qword_100092210;
}

+ (id)voicemailHeadlineShortFont
{
  if (qword_100092228 != -1)
    dispatch_once(&qword_100092228, &stru_10007D590);
  return (id)qword_100092220;
}

+ (id)voicemailCaptionRegularFont
{
  if (qword_100092238 != -1)
    dispatch_once(&qword_100092238, &stru_10007D5B0);
  return (id)qword_100092230;
}

- (UIFont)withCaseSensitiveAttribute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  void *v12;
  UIFontDescriptorAttributeName v13;
  void *v14;

  v13 = UIFontDescriptorFeatureSettingsAttribute;
  v10[0] = UIFontFeatureTypeIdentifierKey;
  v10[1] = UIFontFeatureSelectorIdentifierKey;
  v11[0] = &off_100080250;
  v11[1] = &off_100080268;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  v12 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v14 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIFont fontDescriptor](self, "fontDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, 0.0));
  return (UIFont *)v8;
}

@end
