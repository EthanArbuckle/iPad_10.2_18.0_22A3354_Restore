@implementation SSSDebugScreenshotMangerView

+ (double)_fontSize
{
  return 10.0;
}

- (SSSDebugScreenshotMangerView)initWithFrame:(CGRect)a3
{
  SSSDebugScreenshotMangerView *v3;
  void *v4;
  void *v5;
  UILabel *v6;
  UILabel *debugLabel;
  UILabel *v8;
  uint64_t v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SSSDebugScreenshotMangerView;
  v3 = -[SSSDebugScreenshotMangerView initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorWithAlphaComponent:", 0.5));
  -[SSSDebugScreenshotMangerView setBackgroundColor:](v3, "setBackgroundColor:", v5);

  v6 = (UILabel *)objc_alloc_init((Class)UILabel);
  debugLabel = v3->_debugLabel;
  v3->_debugLabel = v6;

  -[UILabel setNumberOfLines:](v3->_debugLabel, "setNumberOfLines:", 0);
  v8 = v3->_debugLabel;
  *(_QWORD *)&v10 = objc_opt_class(v3, v9).n128_u64[0];
  objc_msgSend(v11, "_fontSize", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
  -[UILabel setFont:](v8, "setFont:", v12);

  -[SSSDebugScreenshotMangerView addSubview:](v3, "addSubview:", v3->_debugLabel);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", v3, "setNeedsLayout", CFSTR("SSSScreenshotManagerTrackingChanged"), 0);

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SSSDebugScreenshotMangerView;
  -[SSSDebugScreenshotMangerView dealloc](&v4, "dealloc");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 250.0;
  v3 = 250.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_labelAttributedString
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v2 = objc_alloc_init((Class)NSMutableAttributedString);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environmentDescriptionIdentifiersBeingRemoved"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environmentDescriptionIdentifiersBeingSaved"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "environmentDescriptionIdentifiersUIIsInterestedIn"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environmentDescriptionIdentifiersInActiveDragSession"));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSSScreenshotManager sharedScreenshotManager](SSSScreenshotManager, "sharedScreenshotManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "environmentDescriptionIdentifiersBeingTracked"));

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v15 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        if (objc_msgSend(v25, "containsObject:", v14))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
          objc_msgSend(v16, "setValue:forKey:", v17, NSForegroundColorAttributeName);

        }
        if (objc_msgSend(v24, "containsObject:", v14))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
          objc_msgSend(v16, "setValue:forKey:", v18, NSUnderlineColorAttributeName);

          objc_msgSend(v16, "setValue:forKey:", &off_100095C28, NSUnderlineStyleAttributeName);
        }
        if (objc_msgSend(v23, "containsObject:", v14))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor"));
          objc_msgSend(v16, "setValue:forKey:", v19, NSBackgroundColorAttributeName);

        }
        if (objc_msgSend(v7, "containsObject:", v14))
          objc_msgSend(v16, "setValue:forKey:", &off_100095C28, NSObliquenessAttributeName);
        objc_msgSend(v15, "addAttributes:range:", v16, 0, objc_msgSend(v14, "length"));
        objc_msgSend(v2, "appendAttributedString:", v15);
        v20 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("\n"));
        objc_msgSend(v2, "appendAttributedString:", v20);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  return v2;
}

- (void)layoutSubviews
{
  UILabel *debugLabel;
  UILabel *v4;
  id v5;

  debugLabel = self->_debugLabel;
  -[SSSDebugScreenshotMangerView bounds](self, "bounds");
  -[UILabel setFrame:](debugLabel, "setFrame:");
  v4 = self->_debugLabel;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SSSDebugScreenshotMangerView _labelAttributedString](self, "_labelAttributedString"));
  -[UILabel setAttributedText:](v4, "setAttributedText:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLabel, 0);
}

@end
