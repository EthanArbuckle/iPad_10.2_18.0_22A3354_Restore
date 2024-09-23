@implementation AXAlertAction

+ (id)actionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___AXAlertAction;
  objc_msgSendSuper2(&v9, sel_actionWithTitle_style_handler_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4 == 1)
    objc_msgSend(v6, "setButtonIndex:", 0x7FFFFFFFFFFFFFFFLL);
  return v7;
}

- (int64_t)buttonIndex
{
  return self->buttonIndex;
}

- (void)setButtonIndex:(int64_t)a3
{
  self->buttonIndex = a3;
}

@end
