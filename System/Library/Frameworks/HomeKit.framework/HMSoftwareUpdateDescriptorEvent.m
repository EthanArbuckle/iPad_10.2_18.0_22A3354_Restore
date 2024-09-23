@implementation HMSoftwareUpdateDescriptorEvent

- (HMSoftwareUpdateDescriptorEvent)initWithDescriptor:(id)a3 eventSource:(id)a4 eventTimestamp:(double)a5
{
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  HMSoftwareUpdateDescriptorEvent *v13;
  HMSoftwareUpdateDescriptorEvent *v14;
  objc_super v16;

  v9 = a3;
  v10 = (objc_class *)MEMORY[0x1E0D32D38];
  v11 = a4;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithSource:cachePolicy:combineType:timestamp:", v11, 2, 2, a5);

  v16.receiver = self;
  v16.super_class = (Class)HMSoftwareUpdateDescriptorEvent;
  v13 = -[HMEEvent initWithSubclassedEventMetadata:](&v16, sel_initWithSubclassedEventMetadata_, v12);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_descriptor, a3);

  return v14;
}

- (id)encodedData
{
  void *v2;
  void *v3;
  void *v4;

  -[HMSoftwareUpdateDescriptorEvent descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "protoPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMSoftwareUpdateDescriptor)descriptor
{
  return (HMSoftwareUpdateDescriptor *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
