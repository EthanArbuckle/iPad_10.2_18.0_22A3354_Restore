@implementation HMDUserCloudShareRepairRequest

- (HMDUserCloudShareRepairRequest)initWithStartDate:(id)a3 containerID:(id)a4 home:(id)a5 repairInfo:(id)a6
{
  id v11;
  HMDUserCloudShareRepairRequest *v12;
  HMDUserCloudShareRepairRequest *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HMDUserCloudShareRepairRequest;
  v12 = -[HMDUserCloudShareRequest initWithStartDate:containerID:home:](&v15, sel_initWithStartDate_containerID_home_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_repairInfo, a6);

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUserCloudShareRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserCloudShareRequest containerID](self, "containerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserCloudShareRequest startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDUserCloudShareRepairRequest id = %@, container = %@, startDate = %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMUserCloudShareRepairInfo)repairInfo
{
  return (HMUserCloudShareRepairInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairInfo, 0);
}

@end
