@implementation SKOverlay

- (SKOverlay)initWithConfiguration:(SKOverlayConfiguration *)configuration
{
  SKOverlayConfiguration *v5;
  SKOverlay *v6;
  SKOverlay *v7;
  objc_super v9;

  v5 = configuration;
  v9.receiver = self;
  v9.super_class = (Class)SKOverlay;
  v6 = -[SKOverlay init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, configuration);

  return v7;
}

- (void)presentInScene:(UIWindowScene *)scene
{
  void *v4;
  UIWindowScene *v5;

  v5 = scene;
  if (-[SKOverlay isReadyToPresentInScene:](self, "isReadyToPresentInScene:"))
  {
    -[UIWindowScene _aso_appOverlayManager](v5, "_aso_appOverlayManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentOverlay:", self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ASOErrorDomain"), 7, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKOverlay storeOverlay:didFailToLoadWithError:](self, "storeOverlay:didFailToLoadWithError:", self, v4);
  }

}

+ (void)dismissOverlayInScene:(UIWindowScene *)scene
{
  id v3;

  -[UIWindowScene _aso_appOverlayManager](scene, "_aso_appOverlayManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissOverlay");

}

- (BOOL)isReadyToPresentInScene:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;

  v4 = a3;
  -[SKOverlay configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v7 = (isKindOfClass & 1) == 0 || !objc_msgSend(v4, "activationState") || objc_msgSend(v4, "activationState") == 1;
  return v7;
}

- (ASOOverlayConfiguration)overlayConfiguration
{
  void *v2;
  void *v3;

  -[SKOverlay configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_backing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASOOverlayConfiguration *)v3;
}

- (void)storeOverlay:(id)a3 willStartPresentation:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  SKOverlayTransitionContext *v8;
  id v9;

  v9 = a4;
  -[SKOverlay delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SKOverlay delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKOverlayTransitionContext initWithASOOverlayTransitionContext:]([SKOverlayTransitionContext alloc], "initWithASOOverlayTransitionContext:", v9);
    objc_msgSend(v7, "storeOverlay:willStartPresentation:", self, v8);

  }
}

- (void)storeOverlay:(id)a3 didFinishPresentation:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  SKOverlayTransitionContext *v8;
  id v9;

  v9 = a4;
  -[SKOverlay delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SKOverlay delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKOverlayTransitionContext initWithASOOverlayTransitionContext:]([SKOverlayTransitionContext alloc], "initWithASOOverlayTransitionContext:", v9);
    objc_msgSend(v7, "storeOverlay:didFinishPresentation:", self, v8);

  }
}

- (void)storeOverlay:(id)a3 willStartDismissal:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  SKOverlayTransitionContext *v8;
  id v9;

  v9 = a4;
  -[SKOverlay delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SKOverlay delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKOverlayTransitionContext initWithASOOverlayTransitionContext:]([SKOverlayTransitionContext alloc], "initWithASOOverlayTransitionContext:", v9);
    objc_msgSend(v7, "storeOverlay:willStartDismissal:", self, v8);

  }
}

- (void)storeOverlay:(id)a3 didFinishDismissal:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  SKOverlayTransitionContext *v8;
  id v9;

  v9 = a4;
  -[SKOverlay delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SKOverlay delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKOverlayTransitionContext initWithASOOverlayTransitionContext:]([SKOverlayTransitionContext alloc], "initWithASOOverlayTransitionContext:", v9);
    objc_msgSend(v7, "storeOverlay:didFinishDismissal:", self, v8);

  }
}

- (void)storeOverlay:(id)a3 didFailToLoadWithError:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[SKOverlay tranformToPublicError:](self, "tranformToPublicError:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SKOverlay storeOverlay:didFailToLoadWithError:].cold.1(v5);
  -[SKOverlay delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SKOverlay delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storeOverlay:didFailToLoadWithError:", self, v5);

  }
}

- (id)tranformToPublicError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ASOErrorDomain"));

  if (v5)
  {
    switch(objc_msgSend(v3, "code"))
    {
      case 1:
      case 2:
        v6 = (void *)MEMORY[0x1E0CB35C8];
        v7 = 16;
        goto LABEL_5;
      case 3:
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v19 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INVALID_OVERLAY_CONFIGURATION_APP_CLIP"), &stru_1E5B2D460, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v10;
        v15 = 16;
        break;
      case 4:
        v6 = (void *)MEMORY[0x1E0CB35C8];
        v7 = 15;
        goto LABEL_5;
      case 6:
        v6 = (void *)MEMORY[0x1E0CB35C8];
        v7 = 17;
        goto LABEL_5;
      case 7:
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v17 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OVERLAY_PRESENTED_IN_BACKGROUND_SCENE"), &stru_1E5B2D460, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v16;
        v15 = 20;
        break;
      default:
        goto LABEL_4;
    }
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), v15, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = 0;
LABEL_5:
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)unsupportedPlatformErrorWithAPIName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not supported on this platform."), a3, *MEMORY[0x1E0CB2D50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 19, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (SKOverlayConfiguration)configuration
{
  return (SKOverlayConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)storeOverlay:(void *)a1 didFailToLoadWithError:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OVERLAY_FAILED_TO_LOAD"), &stru_1E5B2D460, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543362;
  v8 = v6;
  _os_log_error_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);

}

@end
