@implementation CIDVUIBindingDetails

- (NSArray)templateUUIDs
{
  return self->_templateUUIDs;
}

- (void)setTemplateUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_templateUUIDs, a3);
}

- (NSArray)passDescriptions
{
  return self->_passDescriptions;
}

- (void)setPassDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_passDescriptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passDescriptions, 0);
  objc_storeStrong((id *)&self->_templateUUIDs, 0);
}

@end
