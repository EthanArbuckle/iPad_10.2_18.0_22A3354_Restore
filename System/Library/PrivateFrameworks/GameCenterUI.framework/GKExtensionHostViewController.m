@implementation GKExtensionHostViewController

- (void)finishExtension
{
  id v2;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishExtension");

}

- (void)extensionWillFinish
{
  id v2;

  -[GKExtensionHostViewController hostViewController](self, "hostViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionWillFinish");

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[GKExtensionHostViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionDidTerminateWithError:", v8);

  -[GKExtensionHostViewController hostViewController](self, "hostViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[GKExtensionHostViewController hostViewController](self, "hostViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extensionDidTerminateWithError:", v8);

  }
}

- (void)addTarget:(id)a3 forProtocol:(id)a4 toLookup:(id)a5
{
  id v7;
  Protocol *v8;
  id v9;
  objc_method_description *v10;
  objc_method_description *v11;
  unsigned int v12;
  SEL *p_name;
  void *v14;
  void *v15;
  objc_method_description *v16;
  objc_method_description *v17;
  unsigned int v18;
  SEL *v19;
  void *v20;
  void *v21;
  unsigned int outCount;

  v7 = a3;
  v8 = (Protocol *)a4;
  v9 = a5;
  if (v7)
  {
    outCount = 0;
    v10 = protocol_copyMethodDescriptionList(v8, 1, 1, &outCount);
    v11 = v10;
    if (outCount)
    {
      v12 = 0;
      p_name = &v10->name;
      do
      {
        NSStringFromSelector(*p_name);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          objc_msgSend(v9, "setObject:forKey:", v7, v14);

        ++v12;
        p_name += 2;
      }
      while (v12 < outCount);
    }
    free(v11);
    v16 = protocol_copyMethodDescriptionList(v8, 0, 1, &outCount);
    v17 = v16;
    if (outCount)
    {
      v18 = 0;
      v19 = &v16->name;
      do
      {
        NSStringFromSelector(*v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          objc_msgSend(v9, "setObject:forKey:", v7, v20);

        ++v18;
        v19 += 2;
      }
      while (v18 < outCount);
    }
    free(v17);
  }

}

- (void)buildLookupForHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[GKExtensionHostViewController setHostViewController:](self, "setHostViewController:", v4);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[GKExtensionHostViewController addTarget:forProtocol:toLookup:](self, "addTarget:forProtocol:toLookup:", v4, &unk_1EECAE138, v11);
  objc_msgSend((id)objc_opt_class(), "exportedInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protocol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionHostViewController addTarget:forProtocol:toLookup:](self, "addTarget:forProtocol:toLookup:", v4, v6, v11);

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionHostViewController addTarget:forProtocol:toLookup:](self, "addTarget:forProtocol:toLookup:", v7, &unk_1EECAE1A8, v11);

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "serviceViewControllerInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "protocol");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionHostViewController addTarget:forProtocol:toLookup:](self, "addTarget:forProtocol:toLookup:", v8, v10, v11);

  -[GKExtensionHostViewController setTargetForSelector:](self, "setTargetForSelector:", v11);
}

- (id)methodSignatureForProtocol:(id)a3 selector:(SEL)a4
{
  Protocol *v5;
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v8;
  void *v9;

  v5 = (Protocol *)a3;
  MethodDescription = protocol_getMethodDescription(v5, a4, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name || (v8 = protocol_getMethodDescription(v5, a4, 0, 1), types = v8.types, v8.name))
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GKExtensionHostViewController;
  -[GKExtensionHostViewController methodSignatureForSelector:](&v15, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    NSStringFromSelector(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKExtensionHostViewController targetForSelector](self, "targetForSelector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKExtensionHostViewController hostViewController](self, "hostViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      objc_msgSend((id)objc_opt_class(), "exportedInterface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 != v10)
      {
        v5 = 0;
LABEL_8:

        return v5;
      }
      objc_msgSend((id)objc_opt_class(), "serviceViewControllerInterface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    objc_msgSend(v11, "protocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKExtensionHostViewController methodSignatureForProtocol:selector:](self, "methodSignatureForProtocol:selector:", v13, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKExtensionHostViewController targetForSelector](self, "targetForSelector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "invokeWithTarget:", v7);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GKExtensionHostViewController;
    -[GKExtensionHostViewController forwardInvocation:](&v8, sel_forwardInvocation_, v4);
  }

}

- (GKExtensionHostViewControllerDelegate)delegate
{
  return (GKExtensionHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (GKSocialGamingHostInterface)hostViewController
{
  return (GKSocialGamingHostInterface *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void)setHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

- (NSMapTable)targetForSelector
{
  return self->_targetForSelector;
}

- (void)setTargetForSelector:(id)a3
{
  objc_storeStrong((id *)&self->_targetForSelector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetForSelector, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
