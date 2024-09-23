@implementation HMDCameraRecordingBulkSessionStartLogEvent

- (HMDCameraRecordingBulkSessionStartLogEvent)initWithAccessoryIdentifier:(id)a3
{
  id v4;
  HMDCameraRecordingBulkSessionStartLogEvent *v5;
  uint64_t v6;
  NSString *accessoryIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraRecordingBulkSessionStartLogEvent;
  v5 = -[HMMLogEvent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    accessoryIdentifier = v5->_accessoryIdentifier;
    v5->_accessoryIdentifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end
