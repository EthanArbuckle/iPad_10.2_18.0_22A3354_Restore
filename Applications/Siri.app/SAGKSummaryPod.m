@implementation SAGKSummaryPod

- (id)_convertedCardSection
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init((Class)SFDescriptionCardSection);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSummaryPod text](self, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SFText textWithString:](SFText, "textWithString:", v4));

  objc_msgSend(v5, "setMaxLines:", 14);
  objc_msgSend(v3, "setDescriptionText:", v5);
  v6 = sub_10005B08C(CFSTR("ENCYCLOPEDIA_DESCRIPTION_EXPAND_TEXT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "setExpandText:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSummaryPod imageResource](self, "imageResource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_convertedImageOfSize:", 60.0, 75.0));
  objc_msgSend(v3, "setImage:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  objc_msgSend(v3, "setCardSectionId:", v11);

  objc_msgSend(v3, "setSeparatorStyle:", 5);
  return v3;
}

- (id)_convertedCardSections
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSummaryPod _convertedCardSection](self, "_convertedCardSection"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

@end
