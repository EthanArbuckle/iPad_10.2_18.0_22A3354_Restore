@implementation HUTappableTextView

- (HUTappableTextView)initWithFrame:(CGRect)a3
{
  HUTappableTextView *v3;
  HUTappableTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUTappableTextView;
  v3 = -[HUTappableTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUTappableTextView configureTapRecognizer](v3, "configureTapRecognizer");
  return v4;
}

- (HUTappableTextView)initWithCoder:(id)a3
{
  HUTappableTextView *v3;
  HUTappableTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUTappableTextView;
  v3 = -[HUTappableTextView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[HUTappableTextView configureTapRecognizer](v3, "configureTapRecognizer");
  return v4;
}

- (void)setTappableTextViewDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tappableTextViewDelegate);
  v5 = objc_msgSend(WeakRetained, "isEqual:", obj);

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_tappableTextViewDelegate, obj);
    -[HUTappableTextView configureTapRecognizer](self, "configureTapRecognizer");
  }

}

- (void)configureTapRecognizer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HUTappableTextView tapRecognizer](self, "tapRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleTap_);
    -[HUTappableTextView setTapRecognizer:](self, "setTapRecognizer:", v4);

    -[HUTappableTextView tapRecognizer](self, "tapRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[HUTappableTextView tapRecognizer](self, "tapRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTappableTextView addGestureRecognizer:](self, "addGestureRecognizer:", v6);

  }
  -[HUTappableTextView tappableTextViewDelegate](self, "tappableTextViewDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTappableTextView tapRecognizer](self, "tapRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v8 != 0);

}

- (void)_handleTap:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  int v30;
  HUTappableTextView *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  -[HUTappableTextView textContainerInset](self, "textContainerInset");
  v10 = v6 - v9;
  -[HUTappableTextView textContainerInset](self, "textContainerInset");
  v12 = v8 - v11;
  -[HUTappableTextView layoutManager](self, "layoutManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTappableTextView textContainer](self, "textContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v14, 0, v10, v12);

  -[HUTappableTextView textStorage](self, "textStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v15 < v17)
  {
    -[HUTappableTextView attributedText](self, "attributedText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "attributesAtIndex:effectiveRange:", v15, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = (void *)MEMORY[0x1E0C9AA70];
    if (v19)
      v21 = (void *)v19;
    v22 = v21;

    HFLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTappableTextView attributedText](self, "attributedText");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "string");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138413314;
      v31 = self;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v26;
      v36 = 2048;
      v37 = v15;
      v38 = 2112;
      v39 = v22;
      _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped string: \"%@\" at index: %lu with attributes: %@", (uint8_t *)&v30, 0x34u);

    }
    -[HUTappableTextView tappableTextViewDelegate](self, "tappableTextViewDelegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_opt_respondsToSelector();

    if ((v28 & 1) != 0)
    {
      -[HUTappableTextView tappableTextViewDelegate](self, "tappableTextViewDelegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "tappableTextView:tappedAtIndex:withAttributes:", self, v15, v22);

    }
  }
}

- (HUTappableTextViewDelegate)tappableTextViewDelegate
{
  return (HUTappableTextViewDelegate *)objc_loadWeakRetained((id *)&self->_tappableTextViewDelegate);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_tappableTextViewDelegate);
}

@end
