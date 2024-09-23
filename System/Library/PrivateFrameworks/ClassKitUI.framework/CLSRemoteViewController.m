@implementation CLSRemoteViewController

+ (id)instantiateViewControllerWithInputItems:(id)a3 identifier:(id)a4 connectionHandler:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id *v17;
  const char *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x24BDBCED8], v9, (uint64_t)a4, *MEMORY[0x24BDD0C30]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend_extensionsWithMatchingAttributes_error_(MEMORY[0x24BDD1550], v11, (uint64_t)v10, &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v26;
  if (v15 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2114;
    v30 = v15;
    _os_log_error_impl(&dword_21EBFD000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to get privacy disclosure extension for attributes: %{public}@. Error: %{public}@", buf, 0x16u);
  }
  objc_msgSend_firstObject(v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = sub_21EC0148C;
    v21[3] = &unk_24E357280;
    v17 = &v22;
    v22 = v8;
    objc_msgSend_instantiateViewControllerWithInputItems_listenerEndpoint_connectionHandler_(v16, v18, (uint64_t)v7, 0, v21);
    v19 = v16;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21EC01478;
    block[3] = &unk_24E3572D0;
    v17 = &v25;
    v25 = v8;
    v24 = v15;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  return v16;
}

- (void)viewDidInvalidateIntrinsicContentSize
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_serviceViewControllerProxy(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_viewDidInvalidateIntrinsicContentSize(v5, v3, v4);

}

+ (id)serviceViewControllerInterface
{
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDD1990], sel_interfaceWithProtocol_, &unk_255492578);
}

+ (id)exportedInterface
{
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDD1990], sel_interfaceWithProtocol_, &unk_255497BA0);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7 = v4;
  if (v4 && objc_msgSend_code(v4, v5, v6) != 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_error_impl(&dword_21EBFD000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "viewServiceDidTerminateWithError Terminated with error: %@", buf, 0xCu);
  }
  v8.receiver = self;
  v8.super_class = (Class)CLSRemoteViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v8, sel_viewServiceDidTerminateWithError_, v7);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_21EC016C8;
  v9[3] = &unk_24E3572A8;
  v7 = v6;
  v10 = v7;
  objc_copyWeak(&v11, &location);
  v8.receiver = self;
  v8.super_class = (Class)CLSRemoteViewController;
  -[CLSRemoteViewController dismissViewControllerAnimated:completion:](&v8, sel_dismissViewControllerAnimated_completion_, v4, v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)presentModallyInNewWindowWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_21EC01808;
  v6[3] = &unk_24E3572D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (UIWindow)previousKeyWindow
{
  return self->_previousKeyWindow;
}

- (void)setPreviousKeyWindow:(id)a3
{
  objc_storeStrong((id *)&self->_previousKeyWindow, a3);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_previousKeyWindow, 0);
}

@end
