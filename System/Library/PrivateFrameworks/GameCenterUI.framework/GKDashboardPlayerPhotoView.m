@implementation GKDashboardPlayerPhotoView

- (void)commonInit
{
  void *v3;
  void *v4;
  void *v5;

  -[GKDashboardPlayerPhotoView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_opt_new();
  -[GKDashboardPlayerPhotoView setAvatarImageView:](self, "setAvatarImageView:", v3);

  -[GKDashboardPlayerPhotoView avatarImageView](self, "avatarImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.GKDashboardPlayerPhotoView.avatarImageView"));

  -[GKDashboardPlayerPhotoView avatarImageView](self, "avatarImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardPlayerPhotoView addSubview:](self, "addSubview:", v5);

  -[GKDashboardPlayerPhotoView setAvatarSize:](self, "setAvatarSize:", 65537);
  -[GKDashboardPlayerPhotoView setFocusable:](self, "setFocusable:", 0);
}

- (GKDashboardPlayerPhotoView)initWithCoder:(id)a3
{
  GKDashboardPlayerPhotoView *v3;
  GKDashboardPlayerPhotoView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDashboardPlayerPhotoView;
  v3 = -[GKDashboardPlayerPhotoView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[GKDashboardPlayerPhotoView commonInit](v3, "commonInit");
  return v4;
}

- (GKDashboardPlayerPhotoView)initWithFrame:(CGRect)a3
{
  GKDashboardPlayerPhotoView *v3;
  GKDashboardPlayerPhotoView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDashboardPlayerPhotoView;
  v3 = -[GKDashboardPlayerPhotoView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[GKDashboardPlayerPhotoView commonInit](v3, "commonInit");
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)GKDashboardPlayerPhotoView;
  -[GKDashboardPlayerPhotoView layoutSubviews](&v21, sel_layoutSubviews);
  -[GKDashboardPlayerPhotoView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[GKDashboardPlayerPhotoView avatarImageView](self, "avatarImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[GKDashboardPlayerPhotoView bounds](self, "bounds");
  v13 = v12 * 0.5;
  -[GKDashboardPlayerPhotoView avatarImageView](self, "avatarImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", v13);

  -[GKDashboardPlayerPhotoView bounds](self, "bounds");
  -[GKDashboardPlayerPhotoView _setCornerRadius:](self, "_setCornerRadius:", v16 * 0.5);
  -[GKDashboardPlayerPhotoView setClipsToBounds:](self, "setClipsToBounds:", 1);
  -[GKDashboardPlayerPhotoView avatarImageView](self, "avatarImageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClipsToBounds:", 1);

  -[GKDashboardPlayerPhotoView avatarImageView](self, "avatarImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMasksToBounds:", 1);

  -[GKDashboardPlayerPhotoView avatarImageView](self, "avatarImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContentMode:", 2);

}

- (BOOL)hasImage
{
  void *v2;
  char v3;

  -[GKDashboardPlayerPhotoView player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPhoto");

  return v3;
}

- (void)setPlayer:(id)a3
{
  -[GKDashboardPlayerPhotoView setPlayer:completionHandler:](self, "setPlayer:completionHandler:", a3, 0);
}

- (void)setPlayer:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v7 = a3;
  v8 = a4;
  -[GKPlayer internal](self->_player, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "playerID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v12)
  {
    objc_storeStrong((id *)&self->_player, a3);
    if (v7)
    {
      dispatch_get_global_queue(0, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __58__GKDashboardPlayerPhotoView_setPlayer_completionHandler___block_invoke;
      v15[3] = &unk_1E59C53C8;
      v15[4] = self;
      v16 = v8;
      dispatch_async(v13, v15);

    }
  }
  if (!self->_player)
  {
    -[GKDashboardPlayerPhotoView avatarImageView](self, "avatarImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", 0);

  }
}

void __58__GKDashboardPlayerPhotoView_setPlayer_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__GKDashboardPlayerPhotoView_setPlayer_completionHandler___block_invoke_2;
  v2[3] = &unk_1E59C4DA8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "refreshImageWithCompletionHandler:", v2);

}

uint64_t __58__GKDashboardPlayerPhotoView_setPlayer_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setAccessibilityLabel:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKDashboardPlayerPhotoView;
  v4 = a3;
  -[GKDashboardPlayerPhotoView setAccessibilityLabel:](&v6, sel_setAccessibilityLabel_, v4);
  -[GKDashboardPlayerPhotoView avatarImageView](self, "avatarImageView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

- (void)setDimmed:(BOOL)a3
{
  float v3;
  double v4;
  id v5;

  self->_dimmed = a3;
  if (a3)
    v3 = 0.5;
  else
    v3 = 1.0;
  -[GKDashboardPlayerPhotoView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = v3;
  objc_msgSend(v5, "setOpacity:", v4);

}

- (void)refreshImageWithCompletionHandler:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  GKDashboardPlayerPhotoView *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id location;

  v4 = a3;
  v5 = (NSObject **)MEMORY[0x1E0D25460];
  v6 = *MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
  {
    v7 = (id)GKOSLoggers();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[GKDashboardPlayerPhotoView refreshImageWithCompletionHandler:].cold.1(v6, v8, v9, v10, v11, v12, v13, v14);
  v15 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardPlayerPhotoView.m", 180, "-[GKDashboardPlayerPhotoView refreshImageWithCompletionHandler:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dispatchGroupWithName:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKDashboardPlayerPhotoView player](self, "player");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "internal");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "playerID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v21 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke;
  v32[3] = &unk_1E59C5660;
  objc_copyWeak(&v35, &location);
  v22 = v20;
  v33 = v22;
  v23 = v17;
  v34 = v23;
  objc_msgSend(v23, "perform:", v32);
  v27[0] = v21;
  v27[1] = 3221225472;
  v27[2] = __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_17;
  v27[3] = &unk_1E59C5688;
  v24 = v23;
  v28 = v24;
  v29 = self;
  v25 = v22;
  v30 = v25;
  v26 = v4;
  v31 = v26;
  objc_msgSend(v24, "notifyOnMainQueueWithBlock:", v27);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

void __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke(id *a1, void *a2)
{
  void (**v3)(_QWORD);
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD);

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E59C5638;
    v8 = a1[4];
    v9 = v5;
    v10 = a1[5];
    v11 = v3;
    objc_msgSend(v6, "playerAvatarImageWithSize:completionHandler:", 65537, v7);

  }
  else
  {
    v3[2](v3);
  }

}

void __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject **v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a2;
  v7 = a4;
  v8 = (NSObject **)MEMORY[0x1E0D25460];
  v9 = *MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
  {
    v10 = (id)GKOSLoggers();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_2_cold_2(a1, v9, (uint64_t)v6);
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "playerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "isEqualToString:", v14);

  if ((_DWORD)v11)
  {
    objc_msgSend(*(id *)(a1 + 48), "setResult:", v6);
  }
  else
  {
    v15 = *v8;
    if (!*v8)
    {
      v16 = (id)GKOSLoggers();
      v15 = *v8;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_2_cold_1(v15, v17, v18, v19, v20, v21, v22, v23);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_17(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "size");
    v5 = v4;
    objc_msgSend(v3, "size");
    if (v5 != v6)
    {
      objc_msgSend(v3, "size");
      v8 = v7;
      objc_msgSend(v3, "size");
      if (v8 >= v9)
        v10 = v9;
      else
        v10 = v8;
      objc_msgSend(v3, "_gkCropImageIntoSquare:", v10, v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v11;
    }
    objc_msgSend(*(id *)(a1 + 40), "avatarImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v3);
  }
  else
  {
    v13 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "player");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playerID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v13, "isEqualToString:", v16);

    if (!(_DWORD)v13)
      goto LABEL_11;
    objc_msgSend(*(id *)(a1 + 40), "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeholderImageWithPhotoSize:", 65537);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "avatarImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:", v12);

  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "didSetPlayerAvatarImage:", *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "avatarContentIsReady");

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)invalidatePhoto
{
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, a1, a3, "GKDashboardPlayerPhotoView.invalidatePhoto: going to call refreshImageWithCompletionHandler", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  id v6;

  if (-[GKDashboardPlayerPhotoView isUserInteractionEnabled](self, "isUserInteractionEnabled", a3, a4))
  {
    -[GKDashboardPlayerPhotoView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[GKDashboardPlayerPhotoView setTintColor:](self, "setTintColor:", v6);

    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  id v8;

  if (-[GKDashboardPlayerPhotoView isUserInteractionEnabled](self, "isUserInteractionEnabled", a3, a4))
  {
    -[GKDashboardPlayerPhotoView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[GKDashboardPlayerPhotoView setTintColor:](self, "setTintColor:", 0);
      -[GKDashboardPlayerPhotoView delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        -[GKDashboardPlayerPhotoView delegate](self, "delegate");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "didSelectPlayerAvatarView:", self);

      }
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;

  if (-[GKDashboardPlayerPhotoView isUserInteractionEnabled](self, "isUserInteractionEnabled", a3, a4))
  {
    -[GKDashboardPlayerPhotoView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[GKDashboardPlayerPhotoView setTintColor:](self, "setTintColor:", 0);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GKDashboardPlayerPhotoView;
  -[GKDashboardPlayerPhotoView pressesEnded:withEvent:](&v19, sel_pressesEnded_withEvent_, v6, a4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "type", (_QWORD)v15) == 4)
        {
          if (-[GKDashboardPlayerPhotoView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
          {
            -[GKDashboardPlayerPhotoView delegate](self, "delegate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_opt_respondsToSelector();

            if ((v13 & 1) != 0)
            {
              -[GKDashboardPlayerPhotoView delegate](self, "delegate");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "didSelectPlayerAvatarView:", self);

            }
          }
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

}

- (BOOL)canBecomeFocused
{
  return self->_focusable;
}

- (GKPlayer)player
{
  return self->_player;
}

- (BOOL)useDarkerPlaceholder
{
  return self->_useDarkerPlaceholder;
}

- (void)setUseDarkerPlaceholder:(BOOL)a3
{
  self->_useDarkerPlaceholder = a3;
}

- (BOOL)dimmed
{
  return self->_dimmed;
}

- (BOOL)isUsingPlaceholder
{
  return self->_usingPlaceholder;
}

- (void)setUsingPlaceholder:(BOOL)a3
{
  self->_usingPlaceholder = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)focusable
{
  return self->_focusable;
}

- (void)setFocusable:(BOOL)a3
{
  self->_focusable = a3;
}

- (GKPlayerAvatarViewDelegate)delegate
{
  return (GKPlayerAvatarViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)avatarSize
{
  return self->_avatarSize;
}

- (void)setAvatarSize:(int64_t)a3
{
  self->_avatarSize = a3;
}

- (UIImageView)avatarImageView
{
  return self->_avatarImageView;
}

- (void)setAvatarImageView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_player, 0);
}

- (void)refreshImageWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, a1, a3, "GKDashboardPlayerPhotoView.refreshImageWithCompletionHandler", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AB361000, a1, a3, "Discarding image because we requested a new one for a different playerid", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __64__GKDashboardPlayerPhotoView_refreshImageWithCompletionHandler___block_invoke_2_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v4, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v5;
  v12 = 2112;
  v13 = v9;
  v14 = 2112;
  v15 = a3;
  _os_log_debug_impl(&dword_1AB361000, v6, OS_LOG_TYPE_DEBUG, "GKDashboardPlayerPhotoView.refreshImageWithCompletionHandler.playerAvatarImageWithSize: currentPlayerID=%@ strongSelf.player.internal.playerID=%@ || image=%@", (uint8_t *)&v10, 0x20u);

}

@end
