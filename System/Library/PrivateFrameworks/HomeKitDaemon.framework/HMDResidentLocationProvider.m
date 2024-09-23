@implementation HMDResidentLocationProvider

- (void)requestResidentLocation
{
  void *v3;
  HMDResidentLocationProvider *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HMFFuture *locationUpdatedFuture;
  void *v10;
  _BYTE obj[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)obj = 138543362;
    *(_QWORD *)&obj[4] = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Requesting resident location", obj, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  *(_QWORD *)obj = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeout:", 30.0);
  v8 = objc_claimAutoreleasedReturnValue();
  locationUpdatedFuture = v4->_locationUpdatedFuture;
  v4->_locationUpdatedFuture = (HMFFuture *)v8;

  objc_storeStrong((id *)&v4->_residentLocationUpdatedPromise, *(id *)obj);
  +[HMDLocation sharedManager](HMDLocation, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startExtractingSingleLocationForDelegate:", v4);

}

- (void)didDetermineLocation:(id)a3
{
  id v4;
  void *v5;
  HMDResidentLocationProvider *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@didDetermineLocation: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDResidentLocationProvider setLocation:](v6, "setLocation:", v4);
  -[HMDResidentLocationProvider residentLocationUpdatedPromise](v6, "residentLocationUpdatedPromise");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fulfillWithNoValue");

}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HMFFuture)locationUpdatedFuture
{
  return self->_locationUpdatedFuture;
}

- (void)setLocationUpdatedFuture:(id)a3
{
  objc_storeStrong((id *)&self->_locationUpdatedFuture, a3);
}

- (HMFPromise)residentLocationUpdatedPromise
{
  return self->_residentLocationUpdatedPromise;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentLocationUpdatedPromise, 0);
  objc_storeStrong((id *)&self->_locationUpdatedFuture, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
