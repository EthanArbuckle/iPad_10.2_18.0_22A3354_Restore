@implementation AMSUIPurchaseQueue

- (void)purchase:(id)a3 handleSceneBundleIdentifierRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[AMSPurchaseQueue config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AMSPurchaseQueue config](self, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "purchase:handleSceneBundleIdentifierRequest:purchaseQueue:completion:", v15, v8, self, v9);

    v9 = v14;
  }
  else
  {
    AMSError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);
  }

}

- (void)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[AMSPurchaseQueue config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AMSPurchaseQueue config](self, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "purchase:handleSceneIdentifierRequest:purchaseQueue:completion:", v15, v8, self, v9);

    v9 = v14;
  }
  else
  {
    AMSError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);
  }

}

- (id)purchase:(id)a3 handleSceneIdentifierRequest:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  -[AMSPurchaseQueue config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AMSPurchaseQueue config](self, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "purchase:handleSceneIdentifierRequest:purchaseQueue:error:", v8, v9, self, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
    AMSError();
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)purchase:(id)a3 handleWindowRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[AMSPurchaseQueue config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AMSPurchaseQueue config](self, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "purchase:handleWindowRequest:purchaseQueue:completion:", v15, v8, self, v9);

    v9 = v14;
  }
  else
  {
    AMSError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);
  }

}

- (id)purchase:(id)a3 handleWindowRequest:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  -[AMSPurchaseQueue config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AMSPurchaseQueue config](self, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "purchase:handleWindowRequest:purchaseQueue:error:", v8, v9, self, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
    AMSError();
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
