@implementation HMIHomeTask

- (HMIHomeTask)initWithTaskID:(int)a3 homeUUID:(id)a4 timeout:(double)a5
{
  uint64_t v7;
  id v9;
  HMIHomeTask *v10;
  HMIHomeTask *v11;
  objc_super v13;

  v7 = *(_QWORD *)&a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMIHomeTask;
  v10 = -[HMITask initWithTaskID:timeout:](&v13, sel_initWithTaskID_timeout_, v7, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_homeUUID, a4);

  return v11;
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 328, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
}

@end
