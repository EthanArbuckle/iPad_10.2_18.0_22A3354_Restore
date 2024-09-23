@implementation BKUIAlertController

- (void)addAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  objc_msgSend(v4, "handler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(v4, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "style");

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __33__BKUIAlertController_addAction___block_invoke;
  v13[3] = &unk_1EA27FD18;
  v13[4] = self;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)BKUIAlertController;
  -[BKUIAlertController addAction:](&v12, sel_addAction_, v11);

}

void __33__BKUIAlertController_addAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "alertListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertActionTappedFromAlert");

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (void)bkui_addPreferredAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  objc_super v12;
  objc_super v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  objc_msgSend(v4, "handler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(v4, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "style");

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__BKUIAlertController_bkui_addPreferredAction___block_invoke;
  v14[3] = &unk_1EA27FD18;
  v14[4] = self;
  v15 = v6;
  v10 = v6;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, v9, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)BKUIAlertController;
  -[BKUIAlertController addAction:](&v13, sel_addAction_, v11);
  v12.receiver = self;
  v12.super_class = (Class)BKUIAlertController;
  -[BKUIAlertController setPreferredAction:](&v12, sel_setPreferredAction_, v11);

}

void __47__BKUIAlertController_bkui_addPreferredAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "alertListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertActionTappedFromAlert");

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (BKUIAlertControllerListener)alertListener
{
  return (BKUIAlertControllerListener *)objc_loadWeakRetained((id *)&self->_alertListener);
}

- (void)setAlertListener:(id)a3
{
  objc_storeWeak((id *)&self->_alertListener, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertListener);
}

@end
