@implementation CCUIConnectivityButtonViewController

- (void)stopObservingStateChangesIfNecessary
{
  if (self->_observingStateChanges)
    MEMORY[0x24BEDD108]();
}

- (CCUIConnectivityButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIConnectivityButtonViewController;
  return -[CCUILabeledRoundButtonViewController initWithGlyphImage:highlightColor:useLightStyle:](&v5, sel_initWithGlyphImage_highlightColor_useLightStyle_, a3, a4, 1);
}

- (CCUIConnectivityButtonViewController)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIConnectivityButtonViewController;
  return -[CCUILabeledRoundButtonViewController initWithGlyphPackageDescription:highlightColor:useLightStyle:](&v5, sel_initWithGlyphPackageDescription_highlightColor_useLightStyle_, a3, a4, 1);
}

+ (BOOL)isSupported
{
  return 1;
}

- (id)displayName
{
  return &stru_24FFCAEF8;
}

- (id)identifier
{
  return &stru_24FFCAEF8;
}

- (id)statusText
{
  return 0;
}

- (void)buttonTapped:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  id v10;

  objc_msgSend_statusText(self, a2, (uint64_t)a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_contentModuleContext(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_statusUpdateWithMessage_type_(MEMORY[0x24BE19B78], v7, (uint64_t)v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enqueueStatusUpdate_(v6, v9, (uint64_t)v8);

  }
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  const char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  id v24;

  v24 = a5;
  objc_msgSend_alertControllerWithTitle_message_preferredStyle_(MEMORY[0x24BDF67F0], v8, (uint64_t)a3, a4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1488];
  v11 = objc_opt_class();
  objc_msgSend_bundleForClass_(v10, v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v13, v14, (uint64_t)CFSTR("CONTROL_CENTER_ALERT_OK"), &stru_24FFCAEF8, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x24BDF67E8], v16, (uint64_t)v15, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addAction_(v9, v18, (uint64_t)v17);

  objc_msgSend_presentationController(v9, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("_UIAlertControllerPresentationController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend__setShouldRespectNearestCurrentContextPresenter_(v21, v23, 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend__setIsCurrentContext_(v21, v22, 1);
  }
  objc_msgSend_presentViewController_animated_completion_(self, v22, (uint64_t)v9, 1, v24);

}

- (void)startObservingStateChanges
{
  self->_observingStateChanges = 1;
}

- (void)startObservingStateChangesIfNecessary
{
  if (!self->_observingStateChanges)
    ((void (*)(CCUIConnectivityButtonViewController *, char *))MEMORY[0x24BEDD108])(self, sel_startObservingStateChanges);
}

- (void)stopObservingStateChanges
{
  self->_observingStateChanges = 0;
}

- (void)setTemplateView:(id)a3
{
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  int isInoperative;
  const char *v20;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_templateView);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_templateView, obj);
    objc_msgSend_view(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCustomGlyphView_(obj, v8, (uint64_t)v7);

    objc_msgSend_title(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitle_(obj, v12, (uint64_t)v11);

    objc_msgSend_subtitle(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSubtitle_(obj, v16, (uint64_t)v15);

    isInoperative = objc_msgSend_isInoperative(self, v17, v18);
    objc_msgSend_setEnabled_(obj, v20, isInoperative ^ 1u);
  }

}

- (void)setTitle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CCUIConnectivityButtonViewController;
  v4 = a3;
  -[CCUILabeledRoundButtonViewController setTitle:](&v9, sel_setTitle_, v4);
  objc_msgSend_templateView(self, v5, v6, v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(v7, v8, (uint64_t)v4);

}

- (void)setSubtitle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CCUIConnectivityButtonViewController;
  v4 = a3;
  -[CCUILabeledRoundButtonViewController setSubtitle:](&v9, sel_setSubtitle_, v4);
  objc_msgSend_templateView(self, v5, v6, v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubtitle_(v7, v8, (uint64_t)v4);

}

- (void)setInoperative:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIConnectivityButtonViewController;
  -[CCUILabeledRoundButtonViewController setInoperative:](&v9, sel_setInoperative_);
  objc_msgSend_templateView(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnabled_(v7, v8, !v3);

}

- (int64_t)_contextMenuItemStateFromMenuItem:(id)a3
{
  return objc_msgSend_isSelected(a3, a2, (uint64_t)a3);
}

- (void)viewDidLoad
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityButtonViewController;
  -[CCUIConnectivityButtonViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend_displayName(self, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(self, v6, (uint64_t)v5);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)performPrimaryActionForControlTemplateView:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v11;
  const char *v12;

  if ((objc_msgSend_showsMenuAsPrimaryAction(self, a2, (uint64_t)a3) & 1) != 0
    || (objc_msgSend_showsMenuModuleAsPrimaryAction(self, v4, v5) & 1) != 0
    || (objc_msgSend_isPresentingMenuModuleViewController(self, v6, v7) & 1) != 0)
  {
    return 1;
  }
  objc_msgSend_button(self, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_buttonTapped_(self, v12, (uint64_t)v11);

  return 0;
}

- (NSString)menuDisplayName
{
  return (NSString *)&stru_24FFCAEF8;
}

- (BOOL)showsMenuAsPrimaryAction
{
  return 0;
}

- (id)contextMenuItems
{
  return 0;
}

- (UIMenu)contextMenu
{
  return 0;
}

- (BOOL)showsMenuModuleAsPrimaryAction
{
  return 0;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentModuleContext, a3);
}

- (CCUIControlTemplateView)templateView
{
  return (CCUIControlTemplateView *)objc_loadWeakRetained((id *)&self->_templateView);
}

- (BOOL)isObservingStateChanges
{
  return self->_observingStateChanges;
}

- (void)setObservingStateChanges:(BOOL)a3
{
  self->_observingStateChanges = a3;
}

- (BOOL)isPresentingMenuModuleViewController
{
  return self->_presentingMenuModuleViewController;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_templateView);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
}

@end
