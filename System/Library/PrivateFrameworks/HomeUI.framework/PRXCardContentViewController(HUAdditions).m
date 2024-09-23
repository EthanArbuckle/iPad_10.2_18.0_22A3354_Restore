@implementation PRXCardContentViewController(HUAdditions)

- (void)addLearnMoreButtonWithURL:()HUAdditions
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("URL_KEY");
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addLearnMoreButtonWithTarget:action:userInfo:", a1, sel__handleSubtitleTouchForOpenURL_, v6);

}

- (uint64_t)addLearnMoreButtonWithTarget:()HUAdditions action:userInfo:
{
  return objc_msgSend(a1, "appendButtonWithKey:target:action:userInfo:", CFSTR("HUProximityCardSubtitleLearnMoreButton"), a3, a4, a5);
}

- (uint64_t)addMoreOptionsButtonWithTarget:()HUAdditions action:userInfo:
{
  return objc_msgSend(a1, "appendButtonWithKey:target:action:userInfo:", CFSTR("HUProximityCardSubtitleMoreOptionsButton"), a3, a4, a5);
}

- (void)appendButtonWithKey:()HUAdditions target:action:userInfo:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  HUStringInLabelTapGestureRecognizer *v25;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = a4;
  objc_msgSend(a1, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    objc_msgSend(a1, "setSubtitle:", CFSTR(" "));
  objc_msgSend(a1, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subtitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    _HULocalizedStringWithDefaultValue(v9, v9, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_withNilSubtitle"), v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(v16, v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  v27 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithString:attributes:", v15, v19);

  if (v12)
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(a1, "subtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithString:", v22);

    objc_msgSend(v23, "appendAttributedString:", v20);
    v24 = (void *)objc_msgSend(v23, "copy");
    objc_msgSend(v14, "setAttributedText:", v24);

  }
  else
  {
    objc_msgSend(v14, "setAttributedText:", v20);
  }
  objc_msgSend(v14, "setUserInteractionEnabled:", 1);
  v25 = -[HUStringInLabelTapGestureRecognizer initWithTarget:action:hitBoxString:userInfo:]([HUStringInLabelTapGestureRecognizer alloc], "initWithTarget:action:hitBoxString:userInfo:", v11, a5, v15, v10);

  objc_msgSend(v14, "addGestureRecognizer:", v25);
}

- (void)openURL:()HUAdditions
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0CD5600];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithURL:", v5);

  objc_msgSend(v7, "setModalPresentationStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredControlTintColor:", v6);

  objc_msgSend(a1, "presentViewController:animated:completion:", v7, 1, 0);
}

- (void)_handleSubtitleTouchForOpenURL:()HUAdditions
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("URL_KEY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "openURL:", v5);
  }
  else
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "learn more pressed w/ url intention but no url found", v7, 2u);
    }

    NSLog(CFSTR("learn more pressed w/ url intention but no url found"));
  }

}

@end
