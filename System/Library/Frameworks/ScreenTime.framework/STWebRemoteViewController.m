@implementation STWebRemoteViewController

+ (void)instantiateWebViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v11 = *MEMORY[0x24BDD0C30];
  v12[0] = 0x24D997060;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionsWithMatchingAttributes:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __79__STWebRemoteViewController_instantiateWebViewControllerWithConnectionHandler___block_invoke;
    v8[3] = &unk_24D996EB0;
    v9 = v3;
    objc_msgSend(v7, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x24BDBD1A8], v8);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v3 + 2))(v3, 0, v6);
  }

}

uint64_t __79__STWebRemoteViewController_instantiateWebViewControllerWithConnectionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)serviceViewControllerInterface
{
  return +[STWebService newServiceInterface](STWebService, "newServiceInterface");
}

+ (id)exportedInterface
{
  return +[STWebService newDelegateInterface](STWebService, "newDelegateInterface");
}

- (void)setURLIsBlocked:(BOOL)a3 replyHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__STWebRemoteViewController_setURLIsBlocked_replyHandler___block_invoke;
  v9[3] = &unk_24D996ED8;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "addOperationWithBlock:", v9);

}

uint64_t __58__STWebRemoteViewController_setURLIsBlocked_replyHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setURLIsBlocked:", *(unsigned __int8 *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)URLIsBlocked
{
  return self->_URLIsBlocked;
}

- (void)setURLIsBlocked:(BOOL)a3
{
  self->_URLIsBlocked = a3;
}

@end
