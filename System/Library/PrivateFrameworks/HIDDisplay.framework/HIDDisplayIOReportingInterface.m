@implementation HIDDisplayIOReportingInterface

- (HIDDisplayIOReportingInterface)initWithContainerID:(id)a3
{
  HIDDisplayIOReportingInterface *v3;
  HIDDisplayIOReportingInterface *v4;
  HIDDisplayIOReportingInterface *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HIDDisplayIOReportingInterface;
  v3 = -[HIDDisplayInterface initWithContainerID:](&v7, sel_initWithContainerID_, a3);
  v4 = v3;
  if (v3 && -[HIDDisplayIOReportingInterface setupIOReporting](v3, "setupIOReporting"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (HIDDisplayIOReportingInterface)initWithService:(unsigned int)a3
{

  return 0;
}

- (BOOL)setupIOReporting
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HIDDisplayInterface getDeviceElements:](self, "getDeviceElements:", &unk_24D5003C0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_storeStrong((id *)&self->_usageElementMap, v4);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getHIDDevices
{
  return -[HIDDisplayInterface getHIDDevicesForMatching:](self, "getHIDDevicesForMatching:", &unk_24D500410);
}

- (void)setInputDataHandler:(id)a3
{
  void *v4;
  id dataHandler;

  v4 = (void *)MEMORY[0x2199F5C90](a3, a2);
  dataHandler = self->_dataHandler;
  self->_dataHandler = v4;

}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setCancelHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HIDDisplayInterface device](self, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCancelHandler:", v4);

}

- (BOOL)setOutputData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSDictionary objectForKey:](self->_usageElementMap, "objectForKey:", &unk_24D5000F8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setDataValue:", v6);
    v12[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HIDDisplayInterface commit:error:](self, "commit:error:", v9, a4);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870201, 0);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)activate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[HIDDisplayInterface device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputElementMatching:", &unk_24D500438);

  -[HIDDisplayInterface device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __42__HIDDisplayIOReportingInterface_activate__block_invoke;
  v10 = &unk_24D4FF278;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "setInputElementHandler:", &v7);

  -[HIDDisplayInterface device](self, "device", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDispatchQueue:", self->_queue);

  -[HIDDisplayInterface device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activate");

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __42__HIDDisplayIOReportingInterface_activate__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_msgSend(v7, "usage");
    if (objc_msgSend(v7, "usagePage") == 65315 || v4 == 1)
    {
      v5 = WeakRetained[6];
      if (v5)
      {
        objc_msgSend(v7, "dataValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

      }
    }
  }

}

- (void)cancel
{
  id v2;

  -[HIDDisplayInterface device](self, "device");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_dataHandler, 0);
  objc_storeStrong((id *)&self->_usageElementMap, 0);
}

@end
