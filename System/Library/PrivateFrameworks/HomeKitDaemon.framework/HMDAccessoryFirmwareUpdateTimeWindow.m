@implementation HMDAccessoryFirmwareUpdateTimeWindow

- (HMDAccessoryFirmwareUpdateTimeWindow)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v6;
  id v7;
  HMDAccessoryFirmwareUpdateTimeWindow *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  NSDateComponents *startTimeComponents;
  void *v17;
  uint64_t v18;
  NSDateComponents *endTimeComponents;
  NSDateComponents *v20;
  HMDAccessoryFirmwareUpdateTimeWindow *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HMDAccessoryFirmwareUpdateTimeWindow;
  v8 = -[HMDAccessoryFirmwareUpdateTimeWindow init](&v23, sel_init);
  if (!v8)
    goto LABEL_8;
  v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v9, "setDateFormat:", CFSTR("HH:mm:ss"));
  objc_msgSend(v9, "dateFromString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateFromString:", v7);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (v13)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "components:fromDate:", 224, v10);
  v15 = objc_claimAutoreleasedReturnValue();
  startTimeComponents = v8->_startTimeComponents;
  v8->_startTimeComponents = (NSDateComponents *)v15;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "components:fromDate:", 224, v12);
  v18 = objc_claimAutoreleasedReturnValue();
  endTimeComponents = v8->_endTimeComponents;
  v8->_endTimeComponents = (NSDateComponents *)v18;

  if (!v8->_startTimeComponents)
  {
LABEL_9:

    goto LABEL_10;
  }
  v20 = v8->_endTimeComponents;

  if (!v20)
  {
LABEL_10:
    v21 = 0;
    goto LABEL_11;
  }
LABEL_8:
  v21 = v8;
LABEL_11:

  return v21;
}

- (NSDateComponents)startTimeComponents
{
  return (NSDateComponents *)objc_getProperty(self, a2, 8, 1);
}

- (NSDateComponents)endTimeComponents
{
  return (NSDateComponents *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimeComponents, 0);
  objc_storeStrong((id *)&self->_startTimeComponents, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_163740 != -1)
    dispatch_once(&logCategory__hmf_once_t0_163740, &__block_literal_global_163741);
  return (id)logCategory__hmf_once_v1_163742;
}

void __51__HMDAccessoryFirmwareUpdateTimeWindow_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_163742;
  logCategory__hmf_once_v1_163742 = v0;

}

@end
