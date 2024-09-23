@implementation HMDMROutputDeviceStatus

- (HMDMROutputDeviceStatus)initWithOutputUID:(id)a3
{
  return -[HMDMROutputDeviceStatus initWithOutputUID:error:](self, "initWithOutputUID:error:", a3, 0);
}

- (HMDMROutputDeviceStatus)initWithOutputEndpoint:(id)a3
{
  return -[HMDMROutputDeviceStatus initWithOutputEndpoint:error:](self, "initWithOutputEndpoint:error:", a3, 0);
}

- (HMDMROutputDeviceStatus)initWithOutputUID:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  HMDMROutputDeviceStatus *v9;
  HMDMROutputDeviceStatus *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMROutputDeviceStatus;
  v9 = -[HMDMROutputDeviceStatus init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a4);
    objc_storeStrong((id *)&v10->_outputUID, a3);
  }

  return v10;
}

- (HMDMROutputDeviceStatus)initWithOutputEndpoint:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  HMDMROutputDeviceStatus *v9;
  HMDMROutputDeviceStatus *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMROutputDeviceStatus;
  v9 = -[HMDMROutputDeviceStatus init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a4);
    objc_storeStrong((id *)&v10->_outputEndpoint, a3);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HMDMROutputDeviceStatus *v4;
  HMDMROutputDeviceStatus *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (HMDMROutputDeviceStatus *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMDMROutputDeviceStatus outputUID](self, "outputUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDMROutputDeviceStatus outputUID](v5, "outputUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = HMFEqualObjects();

      if (v8
        && (-[HMDMROutputDeviceStatus outputEndpoint](self, "outputEndpoint"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            -[HMDMROutputDeviceStatus outputEndpoint](v5, "outputEndpoint"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = HMFEqualObjects(),
            v10,
            v9,
            v11))
      {
        -[HMDMROutputDeviceStatus error](self, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDMROutputDeviceStatus error](v5, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = HMFEqualObjects();

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMDMROutputDeviceStatus outputUID](self, "outputUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMDMROutputDeviceStatus outputEndpoint](self, "outputEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (HMDMRAVEndpoint)outputEndpoint
{
  return self->_outputEndpoint;
}

- (NSString)outputUID
{
  return self->_outputUID;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_outputUID, 0);
  objc_storeStrong((id *)&self->_outputEndpoint, 0);
}

@end
