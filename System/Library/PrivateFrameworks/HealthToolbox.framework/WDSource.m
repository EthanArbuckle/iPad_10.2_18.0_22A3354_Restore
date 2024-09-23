@implementation WDSource

- (WDSource)initWithSource:(id)a3 device:(id)a4
{
  id v7;
  id v8;
  WDSource *v9;
  WDSource *v10;
  void *v11;
  void *name;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSString *v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WDSource;
  v9 = -[WDSource init](&v29, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceModel, a3);
    objc_storeStrong((id *)&v10->_device, a4);
    if (v7)
    {
      objc_msgSend(v7, "source");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      name = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(name, "copy");
      v14 = (void *)v13;
      if (v13)
        v15 = (__CFString *)v13;
      else
        v15 = &stru_24D38E7C8;
      objc_storeStrong((id *)&v10->_name, v15);
    }
    else
    {
      if (objc_msgSend(v8, "_isConnectedGymDevice"))
      {
        objc_msgSend(v8, "manufacturer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v8, "_connectedGymDeviceFullName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v17;
          if (v17)
          {
            v18 = v17;
            v11 = v18;
          }
          else
          {
            objc_msgSend(v8, "manufacturer");
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          name = v10->_name;
          v10->_name = (NSString *)v18;
          goto LABEL_23;
        }
      }
      objc_msgSend(v8, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v11, "copy");
      name = v19;
      if (v19)
      {
        v20 = v19;
        v14 = v10->_name;
        v10->_name = v20;
      }
      else
      {
        objc_msgSend(v8, "model");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v14, "copy");
        v22 = v21;
        if (v21)
        {
          v23 = v21;
          v24 = v10->_name;
          v10->_name = v23;
        }
        else
        {
          objc_msgSend(v8, "manufacturer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "copy");
          v26 = (void *)v25;
          if (v25)
            v27 = (__CFString *)v25;
          else
            v27 = &stru_24D38E7C8;
          objc_storeStrong((id *)&v10->_name, v27);

        }
      }
    }

LABEL_23:
  }

  return v10;
}

- (HKSourceDataModel)sourceModel
{
  return self->_sourceModel;
}

- (HKDevice)device
{
  return self->_device;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_sourceModel, 0);
}

@end
