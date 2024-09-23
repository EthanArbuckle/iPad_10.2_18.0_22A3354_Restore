@implementation AVTMSStickerView

- (AVTMSStickerView)initWithFrame:(CGRect)a3
{
  AVTMSStickerView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTMSStickerView;
  result = -[MSStickerView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_allowsPeel = 1;
  return result;
}

- (void)handleTap:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  -[AVTMSStickerView disclosureValidationDelegate](self, "disclosureValidationDelegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_9;
  v6 = (void *)v5;
  -[AVTMSStickerView disclosureValidationDelegate](self, "disclosureValidationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSStickerView sticker](self, "sticker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "shouldAllowUserActionOnSticker:", v8);

  if (v9)
  {
LABEL_9:
    if (objc_msgSend(v4, "state") == 3)
    {
      v12.receiver = self;
      v12.super_class = (Class)AVTMSStickerView;
      -[MSStickerView handleTap:](&v12, sel_handleTap_, v4);
      -[AVTMSStickerView delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[AVTMSStickerView delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stickerViewWasTapped:", self);

      }
    }
  }

}

- (void)handleLongPress:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  if (-[AVTMSStickerView allowsPeel](self, "allowsPeel"))
  {
    -[AVTMSStickerView disclosureValidationDelegate](self, "disclosureValidationDelegate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_4;
    v6 = (void *)v5;
    -[AVTMSStickerView disclosureValidationDelegate](self, "disclosureValidationDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSStickerView sticker](self, "sticker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "shouldAllowUserActionOnSticker:", v8);

    if (v9)
    {
LABEL_4:
      v14.receiver = self;
      v14.super_class = (Class)AVTMSStickerView;
      -[MSStickerView handleLongPress:](&v14, sel_handleLongPress_, v4);
      -[AVTMSStickerView delegate](self, "delegate");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = objc_msgSend(v4, "state");

        if (v12 == 1)
        {
          -[AVTMSStickerView delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stickerViewDidBeginPeel:", self);

        }
      }
    }
  }

}

- (void)_prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTMSStickerView;
  -[MSStickerView _prepareForReuse](&v3, sel__prepareForReuse);
  -[MSStickerView setImageData:](self, "setImageData:", 0);
}

- (BOOL)allowsPeel
{
  return self->_allowsPeel;
}

- (void)setAllowsPeel:(BOOL)a3
{
  self->_allowsPeel = a3;
}

- (AVTMSStickerViewDelegate)delegate
{
  return (AVTMSStickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate
{
  return (AVTStickerDisclosureValidationDelegate *)objc_loadWeakRetained((id *)&self->_disclosureValidationDelegate);
}

- (void)setDisclosureValidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_disclosureValidationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_disclosureValidationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
