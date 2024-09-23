@implementation HMDUnpairedHAPAccessoryProgressHandler

- (HMDUnpairedHAPAccessoryProgressHandler)initWithAccessoryUUID:(id)a3 progressHandler:(id)a4
{
  id v7;
  id v8;
  HMDUnpairedHAPAccessoryProgressHandler *v9;
  HMDUnpairedHAPAccessoryProgressHandler *v10;
  void *v11;
  id progressHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDUnpairedHAPAccessoryProgressHandler;
  v9 = -[HMDUnpairedHAPAccessoryProgressHandler init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryUUID, a3);
    v11 = _Block_copy(v8);
    progressHandler = v10->_progressHandler;
    v10->_progressHandler = v11;

  }
  return v10;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setAccessoryUUID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUUID, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

@end
