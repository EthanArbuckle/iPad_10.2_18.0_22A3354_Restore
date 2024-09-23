@implementation FPUIActionExtensionViewController

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25591FC08);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FPUIActionExtensionViewController;
  -[FPUIActionExtensionViewController beginRequestWithExtensionContext:](&v6, sel_beginRequestWithExtensionContext_, v4);
  v5 = (void *)gExtensionContext;
  gExtensionContext = (uint64_t)v4;

}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255922DF0);
}

- (void)_setBrowserUserInterfaceStyle:(unint64_t)a3
{
  if (self->_browserUserInterfaceStyle != a3)
  {
    self->_browserUserInterfaceStyle = a3;
    -[FPUIActionExtensionViewController _browserUserInterfaceStyleDidChange](self, "_browserUserInterfaceStyleDidChange");
  }
}

- (BOOL)_extensionImplementsSelector:(SEL)a3
{
  uint64_t v4;

  v4 = -[FPUIActionExtensionViewController methodForSelector:](self, "methodForSelector:");
  return v4 != +[FPUIActionExtensionViewController instanceMethodForSelector:](FPUIActionExtensionViewController, "instanceMethodForSelector:", a3);
}

- (void)_prepareForActionWithIdentifier:(id)a3 items:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__FPUIActionExtensionViewController__prepareForActionWithIdentifier_items___block_invoke;
  v10[3] = &unk_24EFEE120;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  CallBlockOnMainThread(v10);

}

uint64_t __75__FPUIActionExtensionViewController__prepareForActionWithIdentifier_items___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareForActionWithIdentifier:itemIdentifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_prepareForServerCreation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __62__FPUIActionExtensionViewController__prepareForServerCreation__block_invoke;
  v2[3] = &unk_24EFEDFA0;
  v2[4] = self;
  CallBlockOnMainThread(v2);
}

uint64_t __62__FPUIActionExtensionViewController__prepareForServerCreation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareForServerCreation");
}

- (void)_prepareAuthenticationUsingURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__FPUIActionExtensionViewController__prepareAuthenticationUsingURL___block_invoke;
  v6[3] = &unk_24EFEDF00;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  CallBlockOnMainThread(v6);

}

uint64_t __68__FPUIActionExtensionViewController__prepareAuthenticationUsingURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareAuthenticationUsingURL:", *(_QWORD *)(a1 + 40));
}

- (void)_prepareAuthenticationUsingServerURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__FPUIActionExtensionViewController__prepareAuthenticationUsingServerURL___block_invoke;
  v6[3] = &unk_24EFEDF00;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  CallBlockOnMainThread(v6);

}

uint64_t __74__FPUIActionExtensionViewController__prepareAuthenticationUsingServerURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareAuthenticationUsingServerURL:", *(_QWORD *)(a1 + 40));
}

- (void)_configureWithDomainIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__FPUIActionExtensionViewController__configureWithDomainIdentifier___block_invoke;
  v6[3] = &unk_24EFEDF00;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  CallBlockOnMainThread(v6);

}

void __68__FPUIActionExtensionViewController__configureWithDomainIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "extensionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDomainIdentifier:", v1);

}

- (void)_prepareForError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__FPUIActionExtensionViewController__prepareForError___block_invoke;
  v6[3] = &unk_24EFEDF00;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  CallBlockOnMainThread(v6);

}

uint64_t __54__FPUIActionExtensionViewController__prepareForError___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_extensionImplementsSelector:", sel_prepareForError_) & 1) != 0
    || !objc_msgSend(*(id *)(a1 + 32), "_extensionImplementsSelector:", sel_prepareForAuthentication))
  {
    return objc_msgSend(*(id *)(a1 + 32), "prepareForError:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    return objc_msgSend(*(id *)(a1 + 32), "prepareForAuthentication");
  }
}

- (void)prepareAuthenticationUsingServerURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__FPUIActionExtensionViewController_prepareAuthenticationUsingServerURL___block_invoke;
  v6[3] = &unk_24EFEDF00;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  CallBlockOnMainThread(v6);

}

void __73__FPUIActionExtensionViewController_prepareAuthenticationUsingServerURL___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "extensionContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInitialURL:", v1);

}

- (unint64_t)_browserUserInterfaceStyle
{
  return self->_browserUserInterfaceStyle;
}

@end
