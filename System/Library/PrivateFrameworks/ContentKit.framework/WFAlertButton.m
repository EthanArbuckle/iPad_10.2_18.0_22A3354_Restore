@implementation WFAlertButton

- (WFAlertButton)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5 preferred:(BOOL)a6
{
  id v10;
  id v11;
  WFAlertButton *v12;
  uint64_t v13;
  NSString *title;
  uint64_t v15;
  id handler;
  WFAlertButton *v17;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WFAlertButton;
  v12 = -[WFAlertButton init](&v19, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    title = v12->_title;
    v12->_title = (NSString *)v13;

    v12->_style = a4;
    v15 = objc_msgSend(v11, "copy");
    handler = v12->_handler;
    v12->_handler = (id)v15;

    v12->_preferred = a6;
    v17 = v12;
  }

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isPreferred
{
  return self->_preferred;
}

- (id)handler
{
  return self->_handler;
}

- (WFAlert)alert
{
  return (WFAlert *)objc_loadWeakRetained((id *)&self->_alert);
}

- (void)setAlert:(id)a3
{
  objc_storeWeak((id *)&self->_alert, a3);
}

- (NSArray)alternativeSpeakableMatches
{
  return self->_alternativeSpeakableMatches;
}

- (void)setAlternativeSpeakableMatches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeSpeakableMatches, 0);
  objc_destroyWeak((id *)&self->_alert);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)buttonWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:style:handler:preferred:", v9, a4, v8, 0);

  return v10;
}

+ (id)buttonWithTitle:(id)a3 style:(int64_t)a4 preferred:(BOOL)a5 handler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:style:handler:preferred:", v11, a4, v10, v6);

  return v12;
}

+ (id)cancelButtonWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  WFLocalizedString(CFSTR("Cancel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buttonWithTitle:style:handler:", v5, 1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)okButtonWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  WFLocalizedString(CFSTR("OK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "buttonWithTitle:style:handler:", v5, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cancelButtonWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  SEL v13;

  v6 = a3;
  WFLocalizedString(CFSTR("Cancel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__WFAlertButton_Convenience__cancelButtonWithTarget_action___block_invoke;
  v11[3] = &unk_24C4E2138;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  objc_msgSend(a1, "buttonWithTitle:style:handler:", v7, 1, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)okButtonWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  SEL v13;

  v6 = a3;
  WFLocalizedString(CFSTR("OK"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__WFAlertButton_Convenience__okButtonWithTarget_action___block_invoke;
  v11[3] = &unk_24C4E2138;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  objc_msgSend(a1, "buttonWithTitle:style:handler:", v7, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __56__WFAlertButton_Convenience__okButtonWithTarget_action___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__WFAlertButton_Convenience__cancelButtonWithTarget_action___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:", *(_QWORD *)(a1 + 40));
}

@end
