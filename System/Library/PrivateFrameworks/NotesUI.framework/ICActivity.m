@implementation ICActivity

- (ICActivity)init
{
  ICActivity *v2;
  ICActivity *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICActivity;
  v2 = -[UIActivity init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ICActivity commonInit](v2, "commonInit");
  return v3;
}

- (ICActivity)initWithPerformActivity:(id)a3
{
  id v4;
  ICActivity *v5;
  void *v6;
  id performActivityBlock;

  v4 = a3;
  v5 = -[ICActivity init](self, "init");
  if (v5)
  {
    v6 = _Block_copy(v4);
    performActivityBlock = v5->_performActivityBlock;
    v5->_performActivityBlock = v6;

    -[ICActivity commonInit](v5, "commonInit");
  }

  return v5;
}

- (void)commonInit
{
  self->_contextPathEnum = 0;
}

- (id)actionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3428];
  -[UIActivity activityTitle](self, "activityTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivity activityImage](self, "activityImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICActivity actionIdentifier](self, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__ICActivity_actionWithCompletion___block_invoke;
  v12[3] = &unk_1E5C22620;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, v7, v8, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __35__ICActivity_actionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "presentationSourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPresentationSourceItem:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "performActivityWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (id)menuWithCompletion:(id)a3
{
  return 0;
}

- (void)performActivityWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(void);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ICActivity performActivityBlock](self, "performActivityBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICActivity performActivityBlock](self, "performActivityBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
  v6 = v8;
  if (v8)
  {
    -[UIActivity activityType](self, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v8 + 2))(v8, 1, v7);

    v6 = v8;
  }

}

- (int64_t)contextPathEnum
{
  return self->_contextPathEnum;
}

- (void)setContextPathEnum:(int64_t)a3
{
  self->_contextPathEnum = a3;
}

- (UIPopoverPresentationControllerSourceItem)presentationSourceItem
{
  return self->_presentationSourceItem;
}

- (void)setPresentationSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_presentationSourceItem, a3);
}

- (id)performActivityBlock
{
  return self->_performActivityBlock;
}

- (void)setPerformActivityBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_performActivityBlock, 0);
  objc_storeStrong((id *)&self->_presentationSourceItem, 0);
}

@end
