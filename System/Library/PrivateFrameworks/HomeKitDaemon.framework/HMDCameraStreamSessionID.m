@implementation HMDCameraStreamSessionID

- (HMDCameraStreamSessionID)initWithAccessory:(id)a3 service:(id)a4 sessionID:(id)a5 message:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCameraStreamSessionID *v17;

  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  objc_msgSend(a3, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "instanceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@/%@"), v14, v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[HMDCameraSessionID initWithSessionID:message:description:](self, "initWithSessionID:message:description:", v12, v11, v16);
  return v17;
}

@end
