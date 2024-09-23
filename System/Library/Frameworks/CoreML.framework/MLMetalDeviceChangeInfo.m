@implementation MLMetalDeviceChangeInfo

- (MLMetalDeviceChangeInfo)initWithMetalDevice:(id)a3 changeType:(int64_t)a4
{
  id v7;
  MLMetalDeviceChangeInfo *v8;
  MLMetalDeviceChangeInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLMetalDeviceChangeInfo;
  v8 = -[MLMetalDeviceChangeInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metalDevice, a3);
    v9->_changeType = a4;
  }

  return v9;
}

- (MTLDevice)metalDevice
{
  return self->_metalDevice;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDevice, 0);
}

@end
