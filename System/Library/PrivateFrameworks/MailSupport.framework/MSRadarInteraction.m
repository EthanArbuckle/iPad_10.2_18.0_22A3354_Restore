@implementation MSRadarInteraction

+ (id)interactionWithTitle:(id)a3 message:(id)a4 radarURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:message:radarURL:", v8, v9, v10);

  return v11;
}

+ (id)interactionWithTitle:(id)a3 message:(id)a4 builder:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  +[MSRadarURLBuilder radarURLWithBuilder:](MSRadarURLBuilder, "radarURLWithBuilder:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "interactionWithTitle:message:radarURL:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (MSRadarInteraction)initWithTitle:(id)a3 message:(id)a4 radarURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSRadarInteraction *v11;
  uint64_t v12;
  NSURL *radarURL;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSString *message;
  NSString *cancelButtonTitle;
  NSString *openButtonTitle;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MSRadarInteraction;
  v11 = -[MSRadarInteraction init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    radarURL = v11->_radarURL;
    v11->_radarURL = (NSURL *)v12;

    v14 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v14;

    v16 = objc_msgSend(v9, "copy");
    message = v11->_message;
    v11->_message = (NSString *)v16;

    cancelButtonTitle = v11->_cancelButtonTitle;
    v11->_cancelButtonTitle = (NSString *)CFSTR("Never mind");

    openButtonTitle = v11->_openButtonTitle;
    v11->_openButtonTitle = (NSString *)CFSTR("Open Tap-to-Radar");

  }
  return v11;
}

- (UIAlertController)interactionViewController
{
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  Class v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  Class v12;
  void *v13;
  void *v14;
  Class v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  v3 = (Class)getUIAlertControllerClass[0]();
  -[MSRadarInteraction title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSRadarInteraction message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class alertControllerWithTitle:message:preferredStyle:](v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (Class)getUIAlertActionClass[0]();
  -[MSRadarInteraction openButtonTitle](self, "openButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __47__MSRadarInteraction_interactionViewController__block_invoke;
  v21[3] = &unk_1E716E268;
  v21[4] = self;
  -[objc_class actionWithTitle:style:handler:](v7, "actionWithTitle:style:handler:", v8, 0, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v10);

  -[MSRadarInteraction maybeLaterButtonTitle](self, "maybeLaterButtonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (Class)getUIAlertActionClass[0]();
    -[MSRadarInteraction maybeLaterButtonTitle](self, "maybeLaterButtonTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __47__MSRadarInteraction_interactionViewController__block_invoke_2;
    v20[3] = &unk_1E716E268;
    v20[4] = self;
    -[objc_class actionWithTitle:style:handler:](v12, "actionWithTitle:style:handler:", v13, 0, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v14);

  }
  v15 = (Class)getUIAlertActionClass[0]();
  -[MSRadarInteraction cancelButtonTitle](self, "cancelButtonTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __47__MSRadarInteraction_interactionViewController__block_invoke_3;
  v19[3] = &unk_1E716E268;
  v19[4] = self;
  -[objc_class actionWithTitle:style:handler:](v15, "actionWithTitle:style:handler:", v16, 1, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v17);

  return (UIAlertController *)v6;
}

void __47__MSRadarInteraction_interactionViewController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void (**v5)(id, _QWORD);

  objc_msgSend((Class)getUIApplicationClass[0](), "sharedApplication");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "radarURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:options:completionHandler:", v2, MEMORY[0x1E0C9AA70], 0);

  objc_msgSend(*(id *)(a1 + 32), "openHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "openHandler");
    v5 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, *(_QWORD *)(a1 + 32));

  }
}

void __47__MSRadarInteraction_interactionViewController__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "maybeLaterHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "maybeLaterHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 32));

  }
}

void __47__MSRadarInteraction_interactionViewController__block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "cancelHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelHandler");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 32));

  }
}

- (void)promptToFile
{
  -[MSRadarInteraction promptToFileWithCompletionHandler:](self, "promptToFileWithCompletionHandler:", &__block_literal_global_7);
}

- (void)promptToFileWithCompletionHandler:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  _QWORD v13[4];
  id v14;
  CFOptionFlags v15;

  v4 = a3;
  v15 = 0;
  -[MSRadarInteraction title](self, "title");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[MSRadarInteraction message](self, "message");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFUserNotificationDisplayAlert(30.0, 3uLL, 0, 0, 0, v5, v6, CFSTR("File Radar"), CFSTR("Don't File"), 0, &v15);

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSRadarInteraction radarURL](self, "radarURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__MSRadarInteraction_promptToFileWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E716E290;
    v14 = v4;
    objc_msgSend(v9, "openURL:configuration:completionHandler:", v10, 0, v13);

    -[MSRadarInteraction openHandler](self, "openHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[MSRadarInteraction openHandler](self, "openHandler");
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, MSRadarInteraction *))v12)[2](v12, self);

    }
    v8 = (void (**)(_QWORD, _QWORD))v14;
    goto LABEL_7;
  }
  -[MSRadarInteraction cancelHandler](self, "cancelHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MSRadarInteraction cancelHandler](self, "cancelHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, MSRadarInteraction *))v8)[2](v8, self);
LABEL_7:

  }
}

uint64_t __56__MSRadarInteraction_promptToFileWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)openTapToRadar
{
  void *v3;
  void *v4;
  id v5;
  void (**v6)(id, MSRadarInteraction *);

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MSRadarInteraction radarURL](self, "radarURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:configuration:completionHandler:", v3, 0, 0);

  -[MSRadarInteraction openHandler](self, "openHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSRadarInteraction openHandler](self, "openHandler");
    v6 = (void (**)(id, MSRadarInteraction *))objc_claimAutoreleasedReturnValue();
    v6[2](v6, self);

  }
}

- (NSURL)radarURL
{
  return self->_radarURL;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)openButtonTitle
{
  return self->_openButtonTitle;
}

- (void)setOpenButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)openHandler
{
  return self->_openHandler;
}

- (void)setOpenHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)maybeLaterButtonTitle
{
  return self->_maybeLaterButtonTitle;
}

- (void)setMaybeLaterButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)maybeLaterHandler
{
  return self->_maybeLaterHandler;
}

- (void)setMaybeLaterHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_maybeLaterHandler, 0);
  objc_storeStrong((id *)&self->_maybeLaterButtonTitle, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong(&self->_openHandler, 0);
  objc_storeStrong((id *)&self->_openButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_radarURL, 0);
}

@end
