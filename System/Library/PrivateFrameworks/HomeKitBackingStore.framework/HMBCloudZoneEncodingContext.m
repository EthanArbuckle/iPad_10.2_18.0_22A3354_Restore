@implementation HMBCloudZoneEncodingContext

- (HMBCloudZoneEncodingContext)initWithModelContainer:(id)a3
{
  HMBCloudZoneEncodingContext *v3;
  uint64_t v4;
  NSMutableDictionary *createdRecords;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMBCloudZoneEncodingContext;
  v3 = -[HMBModelContainerEncodingContext initWithModelContainer:](&v7, sel_initWithModelContainer_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    createdRecords = v3->_createdRecords;
    v3->_createdRecords = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (NSMutableDictionary)createdRecords
{
  return self->_createdRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdRecords, 0);
}

@end
