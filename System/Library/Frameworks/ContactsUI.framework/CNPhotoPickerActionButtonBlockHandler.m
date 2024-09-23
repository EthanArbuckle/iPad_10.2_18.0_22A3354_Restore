@implementation CNPhotoPickerActionButtonBlockHandler

- (CNPhotoPickerActionButtonBlockHandler)initWithActionBlock:(id)a3
{
  id v4;
  CNPhotoPickerActionButtonBlockHandler *v5;
  uint64_t v6;
  id actionBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerActionButtonBlockHandler;
  v5 = -[CNPhotoPickerActionButtonBlockHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    actionBlock = v5->_actionBlock;
    v5->_actionBlock = (id)v6;

  }
  return v5;
}

- (void)performAction
{
  void *v3;
  void (**v4)(void);

  -[CNPhotoPickerActionButtonBlockHandler actionBlock](self, "actionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNPhotoPickerActionButtonBlockHandler actionBlock](self, "actionBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
}

@end
