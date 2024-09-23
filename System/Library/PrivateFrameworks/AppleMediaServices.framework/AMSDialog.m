@implementation AMSDialog

- (AMSDialog)initWithTitle:(id)a3 message:(id)a4 style:(int64_t)a5
{
  id v9;
  id v10;
  AMSDialog *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *systemDialogQueue;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AMSDialog;
  v11 = -[AMSDialog init](&v15, sel_init);
  if (v11)
  {
    v12 = dispatch_queue_create("com.apple.AMSDialog.systemDialogs", 0);
    systemDialogQueue = v11->_systemDialogQueue;
    v11->_systemDialogQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v11->_title, a3);
    objc_storeStrong((id *)&v11->_message, a4);
    v11->_style = a5;
  }

  return v11;
}

+ (id)dialogWithTitle:(id)a3 message:(id)a4
{
  return (id)objc_msgSend(a1, "dialogWithTitle:message:style:", a3, a4, 0);
}

+ (id)dialogWithTitle:(id)a3 message:(id)a4 style:(int64_t)a5
{
  id v7;
  id v8;
  AMSDialog *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[AMSDialog initWithTitle:message:style:]([AMSDialog alloc], "initWithTitle:message:style:", v8, v7, a5);

  return v9;
}

- (void)addButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[AMSDialog buttons](self, "buttons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = v8;

  objc_msgSend(v9, "addObject:", v4);
  -[AMSDialog setButtons:](self, "setButtons:", v9);

}

- (void)addTextField:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[AMSDialog textFields](self, "textFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = v8;

  objc_msgSend(v9, "addObject:", v4);
  -[AMSDialog setTextFields:](self, "setTextFields:", v9);

}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)selectedButtonIndex
{
  return self->_selectedButtonIndex;
}

- (void)setSelectedButtonIndex:(int64_t)a3
{
  self->_selectedButtonIndex = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSArray)textFields
{
  return self->_textFields;
}

- (void)setTextFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textFields, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_systemDialogQueue, 0);
}

@end
