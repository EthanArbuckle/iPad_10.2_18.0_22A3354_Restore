@implementation MUDocumentPickerViewController

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[UIDocumentPickerViewController delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "documentPickerWasCancelled:", self);
      v5 = v7;
    }
  }

}

@end
