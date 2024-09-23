@implementation AMSUIBubbleTipViewController

- (AMSUIBubbleTipViewController)initWithRequest:(id)a3
{
  id v4;
  AMSUIBubbleTipViewController *v5;
  AMSUIBubbleTipAppearance *v6;
  AMSUIBubbleTipAppearance *preferredAppearance;
  AMSUIBubbleTipAppearance *v8;
  void *v9;
  uint64_t v10;
  AMSUIBubbleTipAppearance *requestAppearance;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIBubbleTipViewController;
  v5 = -[AMSUIBaseMessageViewController initWithRequest:](&v13, sel_initWithRequest_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(AMSUIBubbleTipAppearance);
    preferredAppearance = v5->_preferredAppearance;
    v5->_preferredAppearance = v6;

    v8 = [AMSUIBubbleTipAppearance alloc];
    objc_msgSend(v4, "appearanceInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AMSUIBubbleTipAppearance initWithDictionary:](v8, "initWithDictionary:", v9);
    requestAppearance = v5->_requestAppearance;
    v5->_requestAppearance = (AMSUIBubbleTipAppearance *)v10;

    v5->_isSelfSizing = 1;
    -[AMSUIBubbleTipViewController _startObservations](v5, "_startObservations");
  }

  return v5;
}

- (AMSUIBubbleTipViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIBubbleTipViewController;
  return -[AMSUIBaseMessageViewController initWithRequest:bag:account:](&v6, sel_initWithRequest_bag_account_, a3, a4, a5);
}

- (void)dealloc
{
  objc_super v3;

  -[AMSUIBubbleTipViewController _endObservations](self, "_endObservations");
  v3.receiver = self;
  v3.super_class = (Class)AMSUIBubbleTipViewController;
  -[AMSUIBubbleTipViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIBubbleTipViewController;
  -[AMSUIBubbleTipViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[AMSUIBubbleTipViewController _updateArrowProperties](self, "_updateArrowProperties");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)AMSUIBubbleTipViewController;
  -[AMSUIBubbleTipViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[AMSUIBubbleTipViewController _updateSelfSizedContentSize](self, "_updateSelfSizedContentSize");
  if (-[AMSUIBubbleTipViewController modalPresentationStyle](self, "modalPresentationStyle") == 7)
  {
    -[AMSUIBubbleTipViewController popoverPresentationController](self, "popoverPresentationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[AMSUIBubbleTipViewController popoverPresentationController](self, "popoverPresentationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "passthroughViews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        -[AMSUIBubbleTipViewController presentingViewController](self, "presentingViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMSUIBubbleTipViewController popoverPresentationController](self, "popoverPresentationController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPassthroughViews:", v9);

      }
      -[AMSUIBubbleTipViewController _transferBackgroundColorForPopover](self, "_transferBackgroundColorForPopover");
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIBubbleTipViewController;
  v7 = a4;
  -[AMSUIBubbleTipViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__AMSUIBubbleTipViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24CB4F600;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __83__AMSUIBubbleTipViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSelfSizedContentSize");
}

- (void)_preferredContentSizeCategoryDidChange:(id)a3
{
  -[AMSUIBaseMessageViewController _updateTextWithAttributes:](self, "_updateTextWithAttributes:", a3);
  -[AMSUIBubbleTipViewController updateTraitsIfNeeded](self, "updateTraitsIfNeeded");
  -[AMSUIBubbleTipViewController _updateSelfSizedContentSize](self, "_updateSelfSizedContentSize");
}

- (void)_startObservations
{
  -[AMSUIBubbleTipViewController addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("modalPresentationStyle"), 1, 0);
}

- (void)_endObservations
{
  -[AMSUIBubbleTipViewController removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("modalPresentationStyle"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  AMSUIBubbleTipViewController *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = (AMSUIBubbleTipViewController *)a4;
  v12 = a5;
  if (v11 == self && objc_msgSend(v10, "isEqualToString:", CFSTR("modalPresentationStyle")))
  {
    v13 = -[AMSUIBubbleTipViewController _messageStyle](v11, "_messageStyle");
    -[AMSUIBubbleTipViewController viewIfLoaded](v11, "viewIfLoaded");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[AMSUIBaseMessageViewController _messageView](v11, "_messageView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "style");

      if (v17 != v13)
      {
        -[AMSUIBaseMessageViewController _messageView](v11, "_messageView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setStyle:", v13);

        -[AMSUIBaseMessageViewController _messageView](v11, "_messageView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setNeedsLayout");

      }
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)AMSUIBubbleTipViewController;
    -[AMSUIBubbleTipViewController observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_setDialogRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  AMSUIBubbleTipViewController *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AMSUIBubbleTipViewController;
  -[AMSUIBaseMessageViewController _setDialogRequest:](&v25, sel__setDialogRequest_, v4);
  v20 = self;
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultAction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v19 = v4;
  objc_msgSend(v4, "buttonActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v9 || objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "style") != 2)
        {
          if ((unint64_t)objc_msgSend(v5, "count") > 1)
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedMessagingUIConfig");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v13, "OSLogObject");
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              v15 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v27 = v15;
              v16 = v15;
              _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_INFO, "%{public}@: Warning ignoring extraneous action", buf, 0xCu);

            }
          }
          else
          {
            objc_msgSend(v5, "addObject:", v12);
          }
        }
        else
        {
          v9 = v12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  if (v17)
    objc_msgSend(v18, "setBodyDialogAction:target:action:", v17, v20, sel__didTapActionButton_);
  if (v9)
    objc_msgSend(v18, "setAccessoryViewForDialogAction:target:action:", v9, v20, sel__didTapActionButton_);
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v18, "setFooterForDialogActions:target:action:", v5, v20, sel__didTapActionButton_);

}

- (id)_messageFontCompatibleWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_messageFontDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIFontParser fontWithDictionary:compatibleWith:](AMSUIFontParser, "fontWithDictionary:compatibleWith:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_messageFontDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIFontParser fontWithDictionary:compatibleWith:](AMSUIFontParser, "fontWithDictionary:compatibleWith:", v12, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v9 = v13;
    }
    else
    {
      -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "messageFont");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)_messageTextColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageTextColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_titleFontCompatibleWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_titleFontDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSUIFontParser fontWithDictionary:compatibleWith:](AMSUIFontParser, "fontWithDictionary:compatibleWith:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleFont");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_titleFontDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIFontParser fontWithDictionary:compatibleWith:](AMSUIFontParser, "fontWithDictionary:compatibleWith:", v12, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v9 = v13;
    }
    else
    {
      -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "titleFont");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)_titleTextColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "titleTextColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_commitAppearance
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  -[AMSUIBubbleTipViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return;
  -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryButtonColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessoryButtonColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "accessoryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  if (v12 && v9)
    objc_msgSend(v12, "setPreferredForegroundColor:", v9);
  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessoryButtonFont");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;

  }
  else
  {
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "accessoryButtonFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_15;
  }
  objc_msgSend(v12, "setPreferredFont:", v15);

LABEL_15:
  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "imageStyle");

  if (v17)
    -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  else
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageStyle:", objc_msgSend(v18, "imageStyle"));

  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "backgroundColor");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;

  }
  else
  {
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      goto LABEL_22;
  }
  objc_msgSend(v5, "setBackgroundColor:", v21);

LABEL_22:
  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "backgroundImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23)
  {
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "backgroundImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "backgroundImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setImage:", v24);

  if (!v23)
  {

  }
  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "footerButtonColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = v27;
  }
  else
  {
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "footerButtonColor");
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "footerButtonFont");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  v57 = v12;
  if (v32)
  {
    v34 = v32;
  }
  else
  {
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "footerButtonFont");
    v34 = (id)objc_claimAutoreleasedReturnValue();

  }
  v36 = v9;

  objc_msgSend(v5, "footerButtonViews");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v38 = v37;
  else
    v38 = 0;

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v39 = v38;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v59 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        if (v29)
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "setPreferredForegroundColor:", v29);
        if (v34)
          objc_msgSend(v44, "setPreferredFont:", v34);
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    }
    while (v41);
  }

  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "imageTintColor");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;

  }
  else
  {
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "imageTintColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v47)
      goto LABEL_50;
  }
  objc_msgSend(v5, "setIconColor:", v47);

LABEL_50:
  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "separatorColor");
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = (void *)v50;

LABEL_53:
    objc_msgSend(v5, "setSeparatorColor:", v51);

    goto LABEL_54;
  }
  -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "separatorColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
    goto LABEL_53;
LABEL_54:
  -[AMSUIBaseMessageViewController _loadedImage](self, "_loadedImage");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    -[AMSUIBaseMessageViewController _loadedImage](self, "_loadedImage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "ams_imageWithRenderingMode:", -[AMSUIBubbleTipViewController _primaryImageRenderingMode](self, "_primaryImageRenderingMode"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setImage:", v55);

  }
  -[AMSUIBaseMessageViewController _updateTextWithAttributes](self, "_updateTextWithAttributes");
  objc_msgSend(v57, "commitAppearance");

}

- (unint64_t)directionForAMSUIPopoverArrowDirection:(unint64_t)a3
{
  if (a3 + 1 > 4)
    return 1;
  else
    return qword_211254680[a3 + 1];
}

- (void)_transferBackgroundColorForPopover
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[AMSUIBubbleTipViewController modalPresentationStyle](self, "modalPresentationStyle") == 7)
  {
    -[AMSUIBubbleTipViewController popoverPresentationController](self, "popoverPresentationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "backgroundColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v5);

      -[AMSUIBubbleTipViewController popoverPresentationController](self, "popoverPresentationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v8);

    }
  }
}

- (void)_updateArrowProperties
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  id v28;

  -[AMSUIBubbleTipViewController inlineAnchorInfo](self, "inlineAnchorInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "removeBubbleArrowMaskView");
LABEL_18:

    return;
  }
  -[AMSUIBubbleTipViewController inlineAnchorInfo](self, "inlineAnchorInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AMSUIBubbleTipViewController directionForAMSUIPopoverArrowDirection:](self, "directionForAMSUIPopoverArrowDirection:", objc_msgSend(v4, "arrowDirection"));

  if (v5 + 1 < 2)
    return;
  -[AMSUIBubbleTipViewController inlineAnchorInfo](self, "inlineAnchorInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrowOffset");
  v8 = v7;

  -[AMSUIBubbleTipViewController inlineAnchorInfo](self, "inlineAnchorInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == 2.22507386e-308)
  {
    objc_msgSend(v9, "relativeArrowOffset");
    v17 = v16;

    if (v17 == 2.22507386e-308)
      return;
    -[AMSUIBubbleTipViewController inlineAnchorInfo](self, "inlineAnchorInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "relativeArrowOffset");
    v20 = v19;

    if (v5 - 1 < 2)
    {
      -[AMSUIBubbleTipViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v20 * v27;
    }
    else
    {
      if (v5 != 4 && v5 != 8)
        return;
      -[AMSUIBubbleTipViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v20 * v21;
    }
  }
  else
  {
    objc_msgSend(v9, "arrowOffset");
    v12 = v11;
  }

  if (v5 - 1 < 2)
  {
    -[AMSUIBubbleTipViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = v22;
    goto LABEL_17;
  }
  if (v5 == 4 || v5 == 8)
  {
    -[AMSUIBubbleTipViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = v14;
LABEL_17:

    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setupBubbleArrowMaskView");

    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "maskShapeView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setArrowOffset:", v12 + v15 * -0.5);

    -[AMSUIBaseMessageViewController _messageView](self, "_messageView");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "maskShapeView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setArrowDirection:", v5);

    goto LABEL_18;
  }
}

- (void)_updateSelfSizedContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  if (-[AMSUIBubbleTipViewController modalPresentationStyle](self, "modalPresentationStyle") == 7)
  {
    -[AMSUIBubbleTipViewController popoverPresentationController](self, "popoverPresentationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (-[AMSUIBubbleTipViewController isSelfSizing](self, "isSelfSizing")
        || (-[AMSUIBubbleTipViewController viewIfLoaded](self, "viewIfLoaded"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            v4,
            !v4))
      {
        -[AMSUIBubbleTipViewController presentingViewController](self, "presentingViewController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "directionalLayoutMargins");
        v8 = v7;
        v10 = v9;

        -[AMSUIBubbleTipViewController presentingViewController](self, "presentingViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "frame");
        v14 = v13;

        v15 = fmin(v14 - (v8 + v10), 327.0);
        -[AMSUIBubbleTipViewController presentingViewController](self, "presentingViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "window");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "frame");
        v20 = v19 * 0.5;

        -[AMSUIBubbleTipViewController view](self, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setNeedsLayout");

        -[AMSUIBubbleTipViewController view](self, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sizeThatFits:", v15, v20);
        v24 = v23;
        v26 = v25;

        -[AMSUIBubbleTipViewController preferredContentSize](self, "preferredContentSize");
        if (v28 != v24 || v27 != v26)
        {
          -[AMSUIBubbleTipViewController setPreferredContentSize:](self, "setPreferredContentSize:", v24, v26);
          -[AMSUIBubbleTipViewController setIsSelfSizing:](self, "setIsSelfSizing:", 1);
        }
      }
    }
  }
}

- (int64_t)_iconAnimationPlayCount
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = 1;
  -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "iconAnimationPlayCount");

    if (v7 != -90)
    {
      -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "iconAnimationPlayCount");

    }
  }
  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "iconAnimationPlayCount");

    if (v12 != -90)
    {
      -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v13, "iconAnimationPlayCount");

    }
  }
  return v3;
}

- (id)_defaultPreferredImageSymbolConfiguration
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[AMSUIBubbleTipViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE210], 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 != 5)
  {
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationByApplyingConfiguration:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (id)_effectiveImageSymbolConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AMSUIBubbleTipViewController _defaultPreferredImageSymbolConfiguration](self, "_defaultPreferredImageSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageSymbolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationByApplyingConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageSymbolConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationByApplyingConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)_messageStyle
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[AMSUIBaseMessageViewController dialogRequest](self, "dialogRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");

  if (v4 == 8)
    v5 = 6;
  else
    v5 = 3;
  if (-[AMSUIBubbleTipViewController modalPresentationStyle](self, "modalPresentationStyle") == 7)
    return 2;
  else
    return v5;
}

- (AMSUIBubbleTipInlineAnchorInfo)inlineAnchorInfo
{
  return self->_inlineAnchorInfo;
}

- (void)setInlineAnchorInfo:(id)a3
{
  objc_storeStrong((id *)&self->_inlineAnchorInfo, a3);
  -[AMSUIBubbleTipViewController _updateArrowProperties](self, "_updateArrowProperties");
}

- (AMSUIBubbleTipAppearance)preferredAppearance
{
  return self->_preferredAppearance;
}

- (void)setPreferredAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAppearance, a3);
  -[AMSUIBubbleTipViewController _commitAppearance](self, "_commitAppearance");
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIBubbleTipViewController;
  -[AMSUIBubbleTipViewController preferredContentSize](&v4, sel_preferredContentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  -[AMSUIBubbleTipViewController setIsSelfSizing:](self, "setIsSelfSizing:", 0);
  v6.receiver = self;
  v6.super_class = (Class)AMSUIBubbleTipViewController;
  -[AMSUIBubbleTipViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_, width, height);
}

- (int64_t)_primaryImageRenderingMode
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[AMSUIBubbleTipViewController preferredAppearance](self, "preferredAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "primaryImageRenderingMode");

  -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "primaryImageRenderingMode");

  if (v6)
  {
    -[AMSUIBubbleTipViewController requestAppearance](self, "requestAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "primaryImageRenderingMode");

  }
  return v4;
}

- (CGPoint)anchorPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_anchorPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_anchorPoint, &v3, 16, 1, 0);
}

- (AMSUIBubbleTipAppearance)requestAppearance
{
  return self->_requestAppearance;
}

- (void)setRequestAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_requestAppearance, a3);
}

- (BOOL)isSelfSizing
{
  return self->_isSelfSizing;
}

- (void)setIsSelfSizing:(BOOL)a3
{
  self->_isSelfSizing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAppearance, 0);
  objc_storeStrong((id *)&self->_preferredAppearance, 0);
  objc_storeStrong((id *)&self->_inlineAnchorInfo, 0);
}

@end
