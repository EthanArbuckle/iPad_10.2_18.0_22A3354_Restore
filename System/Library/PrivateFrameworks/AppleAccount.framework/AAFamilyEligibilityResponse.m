@implementation AAFamilyEligibilityResponse

- (AAFamilyEligibilityResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AAFamilyEligibilityResponse *v4;
  AAFamilyEligibilityResponse *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *familyFeaturePrimaryDescriptions;
  uint64_t v10;
  NSArray *familyFeatureSecondaryDescriptions;
  uint64_t v12;
  NSString *familyFeatureSecondaryTitle;
  uint64_t v14;
  NSString *underageEligibilityAlertTitle;
  uint64_t v16;
  NSString *underageEligibilityAlertMessage;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AAFamilyEligibilityResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v20, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AAResponse responseDictionary](v4, "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("family-meta-info"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("primary-family-feature-description"));
      v8 = objc_claimAutoreleasedReturnValue();
      familyFeaturePrimaryDescriptions = v5->_familyFeaturePrimaryDescriptions;
      v5->_familyFeaturePrimaryDescriptions = (NSArray *)v8;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("secondary-family-feature-description"));
      v10 = objc_claimAutoreleasedReturnValue();
      familyFeatureSecondaryDescriptions = v5->_familyFeatureSecondaryDescriptions;
      v5->_familyFeatureSecondaryDescriptions = (NSArray *)v10;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("secondary-family-feature-description-title"));
      v12 = objc_claimAutoreleasedReturnValue();
      familyFeatureSecondaryTitle = v5->_familyFeatureSecondaryTitle;
      v5->_familyFeatureSecondaryTitle = (NSString *)v12;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("not-eligible-family-feature-title"));
      v14 = objc_claimAutoreleasedReturnValue();
      underageEligibilityAlertTitle = v5->_underageEligibilityAlertTitle;
      v5->_underageEligibilityAlertTitle = (NSString *)v14;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("not-eligible-family-feature-description"));
      v16 = objc_claimAutoreleasedReturnValue();
      underageEligibilityAlertMessage = v5->_underageEligibilityAlertMessage;
      v5->_underageEligibilityAlertMessage = (NSString *)v16;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("has-pending-invites"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_hasPendingInvites = objc_msgSend(v18, "BOOLValue");

    }
  }
  return v5;
}

- (BOOL)eligible
{
  void *v2;
  void *v3;
  char v4;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("eligible"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int64_t)eligibilityStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[AAResponse responseDictionary](self, "responseDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("eligible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAResponse responseDictionary](self, "responseDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
    v7 = 1;
  else
    v7 = 2 * (objc_msgSend(v6, "integerValue") == 61);

  return v7;
}

- (BOOL)hasPendingInvites
{
  return self->_hasPendingInvites;
}

- (NSArray)familyFeaturePrimaryDescriptions
{
  return self->_familyFeaturePrimaryDescriptions;
}

- (NSArray)familyFeatureSecondaryDescriptions
{
  return self->_familyFeatureSecondaryDescriptions;
}

- (NSString)familyFeatureSecondaryTitle
{
  return self->_familyFeatureSecondaryTitle;
}

- (NSString)underageEligibilityAlertTitle
{
  return self->_underageEligibilityAlertTitle;
}

- (NSString)underageEligibilityAlertMessage
{
  return self->_underageEligibilityAlertMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underageEligibilityAlertMessage, 0);
  objc_storeStrong((id *)&self->_underageEligibilityAlertTitle, 0);
  objc_storeStrong((id *)&self->_familyFeatureSecondaryTitle, 0);
  objc_storeStrong((id *)&self->_familyFeatureSecondaryDescriptions, 0);
  objc_storeStrong((id *)&self->_familyFeaturePrimaryDescriptions, 0);
}

@end
