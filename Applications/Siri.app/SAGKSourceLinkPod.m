@implementation SAGKSourceLinkPod

- (id)_convertedCardSections
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  void *v16;

  v3 = objc_alloc_init((Class)SFRowCardSection);
  objc_msgSend(v3, "setImageIsRightAligned:", 1);
  v4 = objc_alloc_init((Class)SFRichText);
  v5 = sub_10005B08C(CFSTR("SEE_MORE_ON_PUNCHOUT_FORMAT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSourceLinkPod punchOut](self, "punchOut"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "punchOutName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v8));
  objc_msgSend(v4, "setText:", v9);

  objc_msgSend(v3, "setLeadingText:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSourceLinkPod punchOut](self, "punchOut"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_convertedPunchout"));
  v16 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  objc_msgSend(v3, "setPunchoutOptions:", v12);

  objc_msgSend(v3, "setSeparatorStyle:", 5);
  v15 = v3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));

  return v13;
}

@end
