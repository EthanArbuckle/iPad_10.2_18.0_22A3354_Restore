@implementation HUStringInLabelTapGestureRecognizer

- (HUStringInLabelTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 hitBoxString:(id)a5 userInfo:(id)a6
{
  id v11;
  id v12;
  HUStringInLabelTapGestureRecognizer *v13;
  HUStringInLabelTapGestureRecognizer *v14;
  void *v15;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HUStringInLabelTapGestureRecognizer;
  v13 = -[HUStringInLabelTapGestureRecognizer initWithTarget:action:](&v17, sel_initWithTarget_action_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_hitboxString, a5);
    if (v12)
      v15 = v12;
    else
      v15 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v14->_userInfo, v15);
  }

  return v14;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v19[16];
  uint8_t buf[16];

  v4 = a3;
  objc_opt_class();
  -[HUStringInLabelTapGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "attributedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUStringInLabelTapGestureRecognizer hitboxString](self, "hitboxString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "rangeOfString:options:", v11, 4);
      v14 = v13;

      v15 = -[HUStringInLabelTapGestureRecognizer _didTapAttributedTextInLabel:targetRange:event:](self, "_didTapAttributedTextInLabel:targetRange:event:", v7, v12, v14, v4);
    }
    else
    {
      HFLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_ERROR, "This class currently only supports search in label.attributedText, feel free to add label.text support too!", v19, 2u);
      }

      NSLog(CFSTR("This class currently only supports search in label.attributedText, feel free to add label.text support too!"));
      v15 = 0;
    }

  }
  else
  {
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_ERROR, "This class currently only supports UILabel", buf, 2u);
    }

    NSLog(CFSTR("This class currently only supports UILabel"));
    v15 = 0;
  }

  return v15;
}

- (BOOL)_didTapAttributedTextInLabel:(id)a3 targetRange:(_NSRange)a4 event:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  BOOL v31;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0CEA228]);
  v11 = objc_alloc(MEMORY[0x1E0CEA260]);
  v12 = (void *)objc_msgSend(v11, "initWithSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  objc_msgSend(v8, "attributedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA268]), "initWithAttributedString:", v13);
    objc_msgSend(v10, "addTextContainer:", v12);
    objc_msgSend(v14, "addLayoutManager:", v10);
    objc_msgSend(v12, "setLineFragmentPadding:", 0.0);
    objc_msgSend(v12, "setLineBreakMode:", objc_msgSend(v8, "lineBreakMode"));
    objc_msgSend(v12, "setMaximumNumberOfLines:", objc_msgSend(v8, "numberOfLines"));
    objc_msgSend(v8, "bounds");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v12, "setSize:", v15, v17);
    objc_msgSend(v9, "allTouches");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "anyObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "locationInView:", v8);
    v22 = v21;
    v24 = v23;

    objc_msgSend(v10, "usedRectForTextContainer:", v12);
    v29 = objc_msgSend(v10, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v12, 0, v22 - -(v26 - (v16 - v25) * 0.5), v24 - -(v28 - (v18 - v27) * 0.5));
    v31 = v29 >= location && v29 - location < length;

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)hitboxString
{
  return self->_hitboxString;
}

- (void)setHitboxString:(id)a3
{
  objc_storeStrong((id *)&self->_hitboxString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitboxString, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
