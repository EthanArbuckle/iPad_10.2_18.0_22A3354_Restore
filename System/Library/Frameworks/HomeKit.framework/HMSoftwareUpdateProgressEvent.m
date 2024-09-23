@implementation HMSoftwareUpdateProgressEvent

- (HMSoftwareUpdateProgressEvent)initWithProgress:(id)a3 eventSource:(id)a4 eventTimestamp:(double)a5
{
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  HMSoftwareUpdateProgressEvent *v13;
  HMSoftwareUpdateProgressEvent *v14;
  objc_super v16;

  v9 = a3;
  v10 = (objc_class *)MEMORY[0x1E0D32D38];
  v11 = a4;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithSource:cachePolicy:combineType:timestamp:", v11, 1, 2, a5);

  v16.receiver = self;
  v16.super_class = (Class)HMSoftwareUpdateProgressEvent;
  v13 = -[HMEEvent initWithSubclassedEventMetadata:](&v16, sel_initWithSubclassedEventMetadata_, v12);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_progress, a3);

  return v14;
}

- (id)encodedData
{
  void *v2;
  void *v3;
  void *v4;

  -[HMSoftwareUpdateProgressEvent progress](self, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "protoPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMSoftwareUpdateProgress)progress
{
  return (HMSoftwareUpdateProgress *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
