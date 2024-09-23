@implementation AUUIAlert

- (AUUIAlert)initWithViewController:(id)a3
{
  return (AUUIAlert *)MEMORY[0x24BEDD108](self, sel_initWithViewController_actionSheet_, a3);
}

- (AUUIAlert)initWithViewController:(id)a3 actionSheet:(BOOL)a4
{
  _BOOL4 v4;
  const char *v6;
  AUUIAlert *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  objc_super v16;

  v4 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AUUIAlert;
  v7 = -[AUUIAlert init](&v16, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_alertControllerWithTitle_message_preferredStyle_(MEMORY[0x24BDF67F0], v6, 0, 0, !v4);
    objc_msgSend_setAlert_(v7, v9, v8);
    objc_msgSend_setViewController_(v7, v10, (uint64_t)a3);
    v7->okButtonIndex = -1;
    v7->cancelButtonIndex = -1;
    v7->alternateButtonIndex = -1;
    v7->destructiveButtonIndex = -1;
    v13 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v11, v12);
    objc_msgSend_addObserver_selector_name_object_(v13, v14, (uint64_t)v7, sel_applicationDidEnterBackgroundNotification_, *MEMORY[0x24BDF7528], 0);
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  objc_super v11;

  v4 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, *MEMORY[0x24BDF7528], 0);

  self->title = 0;
  self->message = 0;

  self->okButtonTitle = 0;
  self->cancelButtonTitle = 0;

  self->alternateButtonTitle = 0;
  self->destructiveButtonTitle = 0;
  objc_msgSend_setOkAction_(self, v6, 0);
  objc_msgSend_setCancelAction_(self, v7, 0);
  objc_msgSend_setDestructiveAction_(self, v8, 0);
  objc_msgSend_setAlternateAction_(self, v9, 0);
  objc_msgSend_dismissWithNoActionAnimated_(self, v10, 0);

  self->alert = 0;
  v11.receiver = self;
  v11.super_class = (Class)AUUIAlert;
  -[AUUIAlert dealloc](&v11, sel_dealloc);
}

- (void)prepareToShow
{
  id alert;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *destructiveButtonTitle;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  NSString *cancelButtonTitle;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  NSString *alternateButtonTitle;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  NSString *okButtonTitle;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t ok;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];

  self->prepared = 1;
  alert = self->alert;
  objc_msgSend_setTitle_(alert, a2, (uint64_t)self->title);
  objc_msgSend_setMessage_(alert, v4, (uint64_t)self->message);
  v7 = objc_msgSend_length(self->destructiveButtonTitle, v5, v6);
  v10 = MEMORY[0x24BDAC760];
  if (v7)
  {
    destructiveButtonTitle = self->destructiveButtonTitle;
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = sub_21A69BDB8;
    v60[3] = &unk_24DD07040;
    v60[4] = self;
    v12 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x24BDF67E8], v8, (uint64_t)destructiveButtonTitle, 2, v60);
    objc_msgSend_setDestructiveAction_(self, v13, v12);
  }
  if (objc_msgSend_length(self->cancelButtonTitle, v8, v9))
  {
    cancelButtonTitle = self->cancelButtonTitle;
    v59[0] = v10;
    v59[1] = 3221225472;
    v59[2] = sub_21A69BE00;
    v59[3] = &unk_24DD07040;
    v59[4] = self;
    v17 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x24BDF67E8], v14, (uint64_t)cancelButtonTitle, 1, v59);
    objc_msgSend_setCancelAction_(self, v18, v17);
  }
  if (objc_msgSend_length(self->alternateButtonTitle, v14, v15))
  {
    alternateButtonTitle = self->alternateButtonTitle;
    v58[0] = v10;
    v58[1] = 3221225472;
    v58[2] = sub_21A69BE48;
    v58[3] = &unk_24DD07040;
    v58[4] = self;
    v22 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x24BDF67E8], v19, (uint64_t)alternateButtonTitle, 0, v58);
    objc_msgSend_setAlternateAction_(self, v23, v22);
  }
  if (objc_msgSend_length(self->okButtonTitle, v19, v20))
  {
    okButtonTitle = self->okButtonTitle;
    v57[0] = v10;
    v57[1] = 3221225472;
    v57[2] = sub_21A69BE90;
    v57[3] = &unk_24DD07040;
    v57[4] = self;
    v27 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x24BDF67E8], v24, (uint64_t)okButtonTitle, 0, v57);
    objc_msgSend_setOkAction_(self, v28, v27);
  }
  if (objc_msgSend_destructiveAction(self, v24, v25))
  {
    v31 = objc_msgSend_destructiveAction(self, v29, v30);
    objc_msgSend_addAction_(alert, v32, v31);
    if (objc_msgSend_alternateAction(self, v33, v34))
    {
      v37 = objc_msgSend_alternateAction(self, v35, v36);
      objc_msgSend_addAction_(alert, v38, v37);
    }
    if (objc_msgSend_okAction(self, v35, v36))
    {
      ok = objc_msgSend_okAction(self, v39, v40);
      objc_msgSend_addAction_(alert, v42, ok);
    }
    if (objc_msgSend_cancelAction(self, v39, v40))
    {
      v45 = objc_msgSend_cancelAction(self, v43, v44);
LABEL_22:
      objc_msgSend_addAction_(alert, v46, v45);
    }
  }
  else
  {
    if (objc_msgSend_cancelAction(self, v29, v30))
    {
      v49 = objc_msgSend_cancelAction(self, v47, v48);
      objc_msgSend_addAction_(alert, v50, v49);
    }
    if (objc_msgSend_alternateAction(self, v47, v48))
    {
      v53 = objc_msgSend_alternateAction(self, v51, v52);
      objc_msgSend_addAction_(alert, v54, v53);
    }
    if (objc_msgSend_okAction(self, v51, v52))
    {
      v45 = objc_msgSend_okAction(self, v55, v56);
      goto LABEL_22;
    }
  }
}

- (void)show
{
  uint64_t v2;
  id alert;
  uint64_t v5;

  if (!self->prepared)
    objc_msgSend_prepareToShow(self, a2, v2);
  alert = self->alert;
  v5 = objc_msgSend_viewController(self, a2, v2);
  MEMORY[0x24BEDD108](v5, sel_presentViewController_animated_completion_, alert);
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  int64_t cancelButtonIndex;
  int64_t okButtonIndex;
  int64_t alternateButtonIndex;
  int64_t destructiveButtonIndex;

  cancelButtonIndex = self->cancelButtonIndex;
  if (cancelButtonIndex != -1 && cancelButtonIndex == a4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      MEMORY[0x24BEDD108](self->delegate, sel_auUIAlertCancelAction_, self);
  }
  else
  {
    okButtonIndex = self->okButtonIndex;
    if (okButtonIndex != -1 && okButtonIndex == a4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        MEMORY[0x24BEDD108](self->delegate, sel_auUIAlertOKAction_, self);
    }
    else
    {
      alternateButtonIndex = self->alternateButtonIndex;
      if (alternateButtonIndex != -1 && alternateButtonIndex == a4)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          MEMORY[0x24BEDD108](self->delegate, sel_auUIAlertAlternateAction_, self->context);
      }
      else
      {
        destructiveButtonIndex = self->destructiveButtonIndex;
        if (destructiveButtonIndex != -1 && destructiveButtonIndex == a4 && (objc_opt_respondsToSelector() & 1) != 0)
          MEMORY[0x24BEDD108](self->delegate, sel_auUIAlertDestructiveAction_, self);
      }
    }
  }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(id)a3
{
  BOOL v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  char v16;
  id v17;

  v17 = a3;
  v4 = 1;
  v16 = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend_methodSignatureForSelector_(self->delegate, v5, (uint64_t)sel_alertViewShouldEnableFirstOtherButton_);
    v8 = (void *)objc_msgSend_invocationWithMethodSignature_(MEMORY[0x24BDBCE98], v7, v6);
    objc_msgSend_setTarget_(v8, v9, (uint64_t)self->delegate);
    objc_msgSend_setSelector_(v8, v10, (uint64_t)sel_alertViewShouldEnableFirstOtherButton_);
    objc_msgSend_setArgument_atIndex_(v8, v11, (uint64_t)&v17, 2);
    objc_msgSend_invoke(v8, v12, v13);
    objc_msgSend_getReturnValue_(v8, v14, (uint64_t)&v16);
    return v16 != 0;
  }
  return v4;
}

- (void)dismissWithOKActionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const char *v6;
  _QWORD v7[5];

  v3 = a3;
  v5 = (void *)objc_msgSend_alert(self, a2, a3);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_21A69C138;
  v7[3] = &unk_24DD04D48;
  v7[4] = self;
  objc_msgSend_dismissViewControllerAnimated_completion_(v5, v6, v3, v7);
}

- (void)dismissWithCancelActionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const char *v6;
  _QWORD v7[5];

  v3 = a3;
  v5 = (void *)objc_msgSend_alert(self, a2, a3);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_21A69C1E8;
  v7[3] = &unk_24DD04D48;
  v7[4] = self;
  objc_msgSend_dismissViewControllerAnimated_completion_(v5, v6, v3, v7);
}

- (void)enableOKAction:(BOOL)a3
{
  _BOOL8 v3;
  void *ok;
  const char *v5;

  v3 = a3;
  ok = (void *)objc_msgSend_okAction(self, a2, a3);
  objc_msgSend_setEnabled_(ok, v5, v3);
}

- (void)enableCancelAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  const char *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend_cancelAction(self, a2, a3);
  objc_msgSend_setEnabled_(v4, v5, v3);
}

- (void)enableDestructiveAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  const char *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend_destructiveAction(self, a2, a3);
  objc_msgSend_setEnabled_(v4, v5, v3);
}

- (void)enableAlternateAction:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  const char *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend_alternateAction(self, a2, a3);
  objc_msgSend_setEnabled_(v4, v5, v3);
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  const char *v4;

  objc_msgSend_setDelegate_(self, a2, 0);
  objc_msgSend_dismissWithNoActionAnimated_(self, v4, 0);
}

- (id)viewController
{
  return self->viewController;
}

- (void)setViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (AUUIAlertDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (AUUIAlertDelegate *)a3;
}

- (id)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int64_t)tag
{
  return self->tag;
}

- (void)setTag:(int64_t)a3
{
  self->tag = a3;
}

- (id)alert
{
  return self->alert;
}

- (void)setAlert:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)message
{
  return self->message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)okButtonTitle
{
  return self->okButtonTitle;
}

- (void)setOkButtonTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)cancelButtonTitle
{
  return self->cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)alternateButtonTitle
{
  return self->alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSString)destructiveButtonTitle
{
  return self->destructiveButtonTitle;
}

- (void)setDestructiveButtonTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (BOOL)stackButtons
{
  return self->stackButtons;
}

- (void)setStackButtons:(BOOL)a3
{
  self->stackButtons = a3;
}

- (UIAlertAction)okAction
{
  return self->okAction;
}

- (void)setOkAction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (UIAlertAction)cancelAction
{
  return self->cancelAction;
}

- (void)setCancelAction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (UIAlertAction)alternateAction
{
  return self->alternateAction;
}

- (void)setAlternateAction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (UIAlertAction)destructiveAction
{
  return self->destructiveAction;
}

- (void)setDestructiveAction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

@end
