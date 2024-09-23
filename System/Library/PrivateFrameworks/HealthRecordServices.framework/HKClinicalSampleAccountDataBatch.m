@implementation HKClinicalSampleAccountDataBatch

- (NSDictionary)resourceObjectsByResourceType
{
  return self->_resourceObjectsByResourceType;
}

- (void)setResourceObjectsByResourceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceObjectsByResourceType, 0);
}

@end
