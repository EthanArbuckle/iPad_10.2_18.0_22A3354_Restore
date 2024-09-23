@implementation WFImagePickerController

- (BOOL)accessibilityPerformMagicTap
{
  void *v3;
  uint64_t (**v4)(void);
  char v5;
  objc_super v7;

  -[WFImagePickerController magicTapHandler](self, "magicTapHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFImagePickerController magicTapHandler](self, "magicTapHandler");
    v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v5 = v4[2]();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFImagePickerController;
    return -[WFImagePickerController accessibilityPerformMagicTap](&v7, sel_accessibilityPerformMagicTap);
  }
}

- (id)magicTapHandler
{
  return self->_magicTapHandler;
}

- (void)setMagicTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1544);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_magicTapHandler, 0);
}

@end
