@implementation CKMenuItemObject

- (CKMenuItemObject)initWithTitle:(id)a3 imageName:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKMenuItemObject *v11;
  CKMenuItemObject *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKMenuItemObject;
  v11 = -[CKMenuItemObject init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[CKMenuItemObject setTitle:](v11, "setTitle:", v8);
    -[CKMenuItemObject setImageName:](v12, "setImageName:", v9);
    -[CKMenuItemObject setHandler:](v12, "setHandler:", v10);
  }

  return v12;
}

- (id)uiAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = (void *)MEMORY[0x1E0CEA638];
  -[CKMenuItemObject imageName](self, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEA2A8];
  -[CKMenuItemObject title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __28__CKMenuItemObject_uiAction__block_invoke;
  v10[3] = &unk_1E274B178;
  v10[4] = self;
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, v5, 0, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __28__CKMenuItemObject_uiAction__block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
