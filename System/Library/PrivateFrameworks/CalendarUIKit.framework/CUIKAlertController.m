@implementation CUIKAlertController

+ (id)alertControllerWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:message:", v7, v6);

  return v8;
}

- (CUIKAlertController)initWithTitle:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  CUIKAlertController *v9;
  CUIKAlertController *v10;
  uint64_t v11;
  NSMutableArray *actions;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CUIKAlertController;
  v9 = -[CUIKAlertController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_message, a4);
    v11 = objc_opt_new();
    actions = v10->_actions;
    v10->_actions = (NSMutableArray *)v11;

  }
  return v10;
}

- (void)addAction:(id)a3
{
  -[NSMutableArray addObject:](self->_actions, "addObject:", a3);
}

- (NSArray)actions
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_actions, "copy");
}

- (void)presentFromSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  id obj;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v19 = v4;
    v6 = (void *)MEMORY[0x1E0DC3450];
    -[CUIKAlertController title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKAlertController message](self, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[CUIKAlertController actions](self, "actions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1E0DC3448];
          objc_msgSend(v14, "title");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[CUIKAlertController _actionStyleForActionStyle:](self, "_actionStyleForActionStyle:", objc_msgSend(v14, "style"));
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __41__CUIKAlertController_presentFromSource___block_invoke;
          v21[3] = &unk_1E6EB6908;
          v21[4] = v14;
          objc_msgSend(v15, "actionWithTitle:style:handler:", v16, v17, v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addAction:", v18);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    v5 = v19;
    objc_msgSend(v19, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

void __41__CUIKAlertController_presentFromSource___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 32));

}

- (int64_t)_actionStyleForActionStyle:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
