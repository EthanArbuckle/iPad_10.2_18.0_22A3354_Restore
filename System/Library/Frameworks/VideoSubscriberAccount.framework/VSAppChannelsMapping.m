@implementation VSAppChannelsMapping

- (VSAppChannelsMapping)init
{
  VSAppChannelsMapping *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSAppChannelsMapping;
  v2 = -[VSAppChannelsMapping init](&v5, sel_init);
  if (v2)
  {
    VSAppChannelsMappingValueType();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInit(v3, v2);

  }
  return v2;
}

- (VSAppChannelsMapping)initWithCoder:(id)a3
{
  id v4;
  VSAppChannelsMapping *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAppChannelsMapping;
  v5 = -[VSAppChannelsMapping init](&v8, sel_init);
  if (v5)
  {
    VSAppChannelsMappingValueType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInitWithCoder(v6, v5, v4);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  VSAppChannelsMappingValueType();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  VSAppChannelsMappingValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  VSAppChannelsMappingValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  VSAppChannelsMappingValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  void *v3;
  void *v4;

  VSAppChannelsMappingValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeDescription(v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)appAdamID
{
  return self->_appAdamID;
}

- (void)setAppAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)channelIDs
{
  return self->_channelIDs;
}

- (void)setChannelIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelIDs, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
}

@end
