@implementation CRKConcreteOutputDevice

- (CRKConcreteOutputDevice)initWithOutputDevice:(id)a3 outputContext:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_outputDevice, a3);
    objc_storeStrong((id *)&self->_outputContext, a4);
  }

  return self;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[CRKConcreteOutputDevice outputDevice](self, "outputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)displayToDeviceWithPassword:(id)a3 suppressPrompt:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend((id)objc_opt_class(), "outputOptionsWithPassword:suppressPrompt:", v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteOutputDevice outputContext](self, "outputContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteOutputDevice outputDevice](self, "outputDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__CRKConcreteOutputDevice_displayToDeviceWithPassword_suppressPrompt_completion___block_invoke;
  v15[3] = &unk_24D9C85C0;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "setOutputDevice:options:completionHandler:", v12, v10, v15);

}

void __81__CRKConcreteOutputDevice_displayToDeviceWithPassword_suppressPrompt_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  extractErrorFromChange(a2, *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)outputOptionsWithPassword:(id)a3 suppressPrompt:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDB1F20]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDB1F18]);
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

- (AVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (AVOutputContext)outputContext
{
  return self->_outputContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong((id *)&self->_outputDevice, 0);
}

@end
