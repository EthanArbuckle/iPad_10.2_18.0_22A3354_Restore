@implementation _SFLinkPreviewHeader

- (_SFLinkPreviewHeader)initWithMinimumPreviewUI:(BOOL)a3
{
  return (_SFLinkPreviewHeader *)-[_SFLinkPreviewHeader _initWithMinimumPreviewUI:isOnNativeHost:](self, "_initWithMinimumPreviewUI:isOnNativeHost:", a3, 1);
}

- (id)_initWithMinimumPreviewUI:(BOOL)a3 isOnNativeHost:(BOOL)a4
{
  char *v5;
  id v6;
  __int128 v7;
  id v8;
  void *v9;
  void *v10;
  SFLinkPreviewHeaderContentView *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;
  _QWORD v47[4];
  _QWORD v48[5];

  v48[4] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)_SFLinkPreviewHeader;
  v5 = -[_SFLinkPreviewHeader initWithFrame:](&v46, sel_initWithFrame_, a3, a4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v5[432] = a3;
    v7 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v5 + 440) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v5 + 456) = v7;
    v8 = objc_alloc_init(MEMORY[0x1E0D4EF60]);
    v9 = (void *)*((_QWORD *)v6 + 62);
    *((_QWORD *)v6 + 62) = v8;

    objc_msgSend(*((id *)v6 + 62), "setDelegate:", v6);
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v6 + 62), "setProgressBarFillColor:", v10);

    objc_msgSend(v6, "setClipsToBounds:", 0);
    *((_QWORD *)v6 + 59) = 0;
    if (!*((_BYTE *)v6 + 432))
    {
      v11 = -[SFLinkPreviewHeaderContentView initWithStyle:]([SFLinkPreviewHeaderContentView alloc], "initWithStyle:", *((_QWORD *)v6 + 59));
      v12 = (void *)*((_QWORD *)v6 + 52);
      *((_QWORD *)v6 + 52) = v11;

      objc_msgSend(*((id *)v6 + 52), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v6, "setLinkPreviewEnabled:", 1);
      objc_msgSend(*((id *)v6 + 52), "setDelegate:", v6);
      objc_msgSend(v6, "addSubview:", *((_QWORD *)v6 + 52));
      if (!*((_QWORD *)v6 + 59))
      {
        v13 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v14 = (void *)*((_QWORD *)v6 + 53);
        *((_QWORD *)v6 + 53) = v13;

        objc_msgSend(v6, "opaqueSeparatorColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)v6 + 53), "setBackgroundColor:", v15);

        objc_msgSend(*((id *)v6 + 53), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v6, "addSubview:", *((_QWORD *)v6 + 53));
        v35 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(*((id *)v6 + 53), "leadingAnchor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "leadingAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "constraintEqualToAnchor:", v42);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v40;
        objc_msgSend(*((id *)v6 + 53), "trailingAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "trailingAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "constraintEqualToAnchor:", v36);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = v16;
        objc_msgSend(*((id *)v6 + 53), "bottomAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bottomAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "constraintEqualToAnchor:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v48[2] = v19;
        objc_msgSend(*((id *)v6 + 53), "heightAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        _SFOnePixel();
        objc_msgSend(v20, "constraintEqualToConstant:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v48[3] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "activateConstraints:", v22);

      }
      v37 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(*((id *)v6 + 52), "leadingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "leadingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:", v43);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v41;
      objc_msgSend(*((id *)v6 + 52), "trailingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trailingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v47[1] = v24;
      objc_msgSend(*((id *)v6 + 52), "topAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v47[2] = v27;
      objc_msgSend(*((id *)v6 + 52), "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v47[3] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "activateConstraints:", v31);

      if (!*((_QWORD *)v6 + 59))
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setBackgroundColor:", v32);

      }
    }
    v33 = v6;
  }

  return v6;
}

- (id)opaqueSeparatorColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
}

- (double)defaultHeight
{
  double result;

  if (!self->_isMinimumPreviewUI)
    return 44.0;
  objc_msgSend(MEMORY[0x1E0D4EF60], "defaultHeight");
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  -[_SFLinkPreviewHeader defaultHeight](self, "defaultHeight");
  v4 = v3;
  v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setLinkPreviewEnabled:(BOOL)a3
{
  -[SFLinkPreviewHeaderContentView setPreviewEnabled:](self->_contentView, "setPreviewEnabled:", a3);
}

- (BOOL)isLinkPreviewEnabled
{
  return -[SFLinkPreviewHeaderContentView isPreviewEnabled](self->_contentView, "isPreviewEnabled");
}

- (BOOL)linkPreviewEnabled
{
  return -[SFLinkPreviewHeaderContentView isPreviewEnabled](self->_contentView, "isPreviewEnabled");
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat Width;
  double v15;
  CGFloat v16;
  id WeakRetained;
  CGFloat rect;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v19.receiver = self;
  v19.super_class = (Class)_SFLinkPreviewHeader;
  -[_SFLinkPreviewHeader layoutSubviews](&v19, sel_layoutSubviews);
  -[_SFLinkPreviewHeader bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_SFFluidProgressView frame](self->_progressView, "frame");
  v12 = v11;
  rect = v13;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  Width = CGRectGetWidth(v20);
  objc_msgSend(MEMORY[0x1E0D4EF60], "defaultHeight");
  _SFFloorFloatToPixels();
  v16 = v15;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  CGRectGetMaxY(v21);
  v22.origin.x = v12;
  v22.origin.y = rect;
  v22.size.width = Width;
  v22.size.height = v16;
  CGRectGetHeight(v22);
  _SFRoundRectToPixels();
  -[_SFFluidProgressView setFrame:](self->_progressView, "setFrame:");
  -[_SFFluidProgressView setCornerRadius:](self->_progressView, "setCornerRadius:", 0.0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  if (!CGRectEqualToRect(self->_lastLayoutBounds, v23) && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "linkPreviewHeaderBoundsDidChange:", self);
  self->_lastLayoutBounds.origin.x = v4;
  self->_lastLayoutBounds.origin.y = v6;
  self->_lastLayoutBounds.size.width = v8;
  self->_lastLayoutBounds.size.height = v10;

}

- (void)setDomain:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_domain, a3);
  v5 = a3;
  -[SFLinkPreviewHeaderContentView setDomain:](self->_contentView, "setDomain:", v5);

}

- (void)fluidProgressViewWillShowProgress:(id)a3
{
  _SFLinkPreviewHeader *v4;

  -[_SFFluidProgressView superview](self->_progressView, "superview", a3);
  v4 = (_SFLinkPreviewHeader *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
    -[_SFLinkPreviewHeader addSubview:](self, "addSubview:", self->_progressView);
}

- (void)fluidProgressViewDidShowProgress:(id)a3
{
  -[_SFFluidProgressView removeFromSuperview](self->_progressView, "removeFromSuperview", a3);
}

- (void)linkPreviewHeaderContentView:(id)a3 didEnableLinkPreview:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "linkPreviewHeader:didEnableLinkPreview:", self, v4);

}

- (_SFLinkPreviewHeaderDelegate)delegate
{
  return (_SFLinkPreviewHeaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (_SFFluidProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hairline, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
