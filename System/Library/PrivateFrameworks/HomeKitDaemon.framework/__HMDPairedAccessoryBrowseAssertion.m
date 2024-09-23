@implementation __HMDPairedAccessoryBrowseAssertion

- (void)invalidate
{
  void *v3;
  objc_super v4;

  if (-[HMFAssertion isValid](self, "isValid"))
  {
    v4.receiver = self;
    v4.super_class = (Class)__HMDPairedAccessoryBrowseAssertion;
    -[HMFAssertion invalidate](&v4, sel_invalidate);
    -[__HMDPairedAccessoryBrowseAssertion accessoryBrowser](self, "accessoryBrowser");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "__inactivate");

  }
}

- (__HMDPairedAccessoryBrowseAssertion)initWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (__HMDPairedAccessoryBrowseAssertion)initWithAccessoryBrowser:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  __HMDPairedAccessoryBrowseAssertion *v12;
  __HMDPairedAccessoryBrowseAssertion *v13;
  __HMDPairedAccessoryBrowseAssertion *v15;
  SEL v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_9:
    v15 = (__HMDPairedAccessoryBrowseAssertion *)_HMFPreconditionFailure();
    return (__HMDPairedAccessoryBrowseAssertion *)-[__HMDPairedAccessoryBrowseAssertion accessoryBrowser](v15, v16);
  }
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(".%@"), v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  v17.receiver = self;
  v17.super_class = (Class)__HMDPairedAccessoryBrowseAssertion;
  v12 = -[HMFAssertion initWithName:](&v17, sel_initWithName_, v10);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_accessoryBrowser, v6);
    objc_msgSend(v6, "__activate");
  }

  return v13;
}

- (HMDAccessoryBrowser)accessoryBrowser
{
  return (HMDAccessoryBrowser *)objc_loadWeakRetained((id *)&self->_accessoryBrowser);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessoryBrowser);
}

@end
