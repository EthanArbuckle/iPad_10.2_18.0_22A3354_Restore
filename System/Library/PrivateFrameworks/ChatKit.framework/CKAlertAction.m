@implementation CKAlertAction

+ (id)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___CKAlertAction;
  v7 = a5;
  objc_msgSendSuper2(&v10, sel_actionWithTitle_style_handler_, a3, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "set__ck_handler:", v7, v10.receiver, v10.super_class);

  return v8;
}

- (id)__ck_handler
{
  return self->___ck_handler;
}

- (void)set__ck_handler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->___ck_handler, 0);
}

@end
