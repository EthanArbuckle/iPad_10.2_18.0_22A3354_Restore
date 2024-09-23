@implementation PUPickerRemoteViewController

+ (void)requestViewControllerForExtension:(id)a3 proposedSize:(CGSize)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a5;
  if (v6)
  {
    if (v7)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __97__PUPickerRemoteViewController_requestViewControllerForExtension_proposedSize_completionHandler___block_invoke;
      v10[3] = &unk_24C62C0D0;
      v11 = v7;
      v8 = v7;
      objc_msgSend(v6, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x24BDBD1A8], v10);

      return;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  v9 = _PFAssertFailHandler();
  __97__PUPickerRemoteViewController_requestViewControllerForExtension_proposedSize_completionHandler___block_invoke(v9);
}

uint64_t __97__PUPickerRemoteViewController_requestViewControllerForExtension_proposedSize_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
