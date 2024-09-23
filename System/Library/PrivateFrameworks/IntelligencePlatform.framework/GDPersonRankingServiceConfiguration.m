@implementation GDPersonRankingServiceConfiguration

- (GDPersonRankingServiceConfiguration)initWithIsFavoriteMultiplier:(double)a3 emergencyContactMultiplier:(double)a4 iCloudFamilyMemberMultiplier:(double)a5 relationshipTagMultplier:(double)a6
{
  GDPersonRankingServiceConfiguration *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GDPersonRankingServiceConfiguration;
  result = -[GDPersonRankingServiceConfiguration init](&v11, sel_init);
  if (result)
  {
    result->_isFavoriteMultiplier = a3;
    result->_emergencyContactMultiplier = a4;
    result->_iCloudFamilyMemberMultiplier = a5;
    result->_relationshipTagMultiplier = a6;
  }
  return result;
}

- (GDPersonRankingServiceConfiguration)init
{
  return (GDPersonRankingServiceConfiguration *)((uint64_t (*)(GDPersonRankingServiceConfiguration *, char *))MEMORY[0x1E0DE7D20])(self, sel_initWithIsFavoriteMultiplier_emergencyContactMultiplier_iCloudFamilyMemberMultiplier_relationshipTagMultplier_);
}

- (double)isFavoriteMultiplier
{
  return self->_isFavoriteMultiplier;
}

- (double)emergencyContactMultiplier
{
  return self->_emergencyContactMultiplier;
}

- (double)iCloudFamilyMemberMultiplier
{
  return self->_iCloudFamilyMemberMultiplier;
}

- (double)relationshipTagMultiplier
{
  return self->_relationshipTagMultiplier;
}

@end
