@implementation MKPOSTProgressRouter

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id WeakRetained;
  double v17;
  uint64_t v18;

  objc_msgSend(a4, "body", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v18)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("progress"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      v11 = v10;

      objc_msgSend(v8, "objectForKey:", CFSTR("remaining_time"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedLongLongValue");

      objc_msgSend(v8, "objectForKey:", CFSTR("state"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "intValue");

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      LODWORD(v17) = v11;
      objc_msgSend(WeakRetained, "router:didUpdateProgress:remainingTime:state:", self, v13, v15, v17);

    }
  }

}

- (MKPOSTProgressRouterDelegate)delegate
{
  return (MKPOSTProgressRouterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
