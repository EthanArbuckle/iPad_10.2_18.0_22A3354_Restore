@implementation HMDHAPAccessoryLocalReadTask

- (void)_dispatchToAccessory:(id)a3 requests:(id)a4 logEvent:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[HMDHAPAccessoryTask sourceType](self, "sourceType");
  -[HMDHAPAccessoryTask context](self, "context");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "requestMessage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask workQueue](self, "workQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "readCharacteristicValues:source:message:queue:logEvent:completionHandler:", v12, v14, v15, v16, v11, v10);

}

@end
