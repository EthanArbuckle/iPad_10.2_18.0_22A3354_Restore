@implementation HMDUserCloudShareRequest

- (HMDUserCloudShareRequest)initWithStartDate:(id)a3 containerID:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDUserCloudShareRequest *v12;
  uint64_t v13;
  NSUUID *identifier;
  uint64_t v15;
  NSString *containerID;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDUserCloudShareRequest;
  v12 = -[HMDUserCloudShareRequest init](&v18, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_startDate, a3);
    v15 = objc_msgSend(v10, "copy");
    containerID = v12->_containerID;
    v12->_containerID = (NSString *)v15;

    objc_storeWeak((id *)&v12->_home, v11);
  }

  return v12;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
