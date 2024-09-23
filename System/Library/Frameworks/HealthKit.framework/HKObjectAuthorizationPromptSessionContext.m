@implementation HKObjectAuthorizationPromptSessionContext

- (HKObjectAuthorizationPromptSessionContext)initWithSamplesRequiringAuthorization:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  HKObjectAuthorizationPromptSessionContext *v8;
  uint64_t v9;
  NSDictionary *samplesRequiringAuthorization;
  uint64_t v11;
  HKObjectAuthorizationPromptSessionMetadata *metadata;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKObjectAuthorizationPromptSessionContext;
  v8 = -[HKObjectAuthorizationPromptSessionContext init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    samplesRequiringAuthorization = v8->_samplesRequiringAuthorization;
    v8->_samplesRequiringAuthorization = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    metadata = v8->_metadata;
    v8->_metadata = (HKObjectAuthorizationPromptSessionMetadata *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKObjectAuthorizationPromptSessionContext)initWithCoder:(id)a3
{
  id v4;
  HKObjectAuthorizationPromptSessionContext *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *samplesRequiringAuthorization;
  uint64_t v11;
  HKObjectAuthorizationPromptSessionMetadata *metadata;
  objc_super v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKObjectAuthorizationPromptSessionContext;
  v5 = -[HKObjectAuthorizationPromptSessionContext init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("SamplesRequiringAuthorization"));
    v9 = objc_claimAutoreleasedReturnValue();
    samplesRequiringAuthorization = v5->_samplesRequiringAuthorization;
    v5->_samplesRequiringAuthorization = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Metadata"));
    v11 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (HKObjectAuthorizationPromptSessionMetadata *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *samplesRequiringAuthorization;
  id v5;

  samplesRequiringAuthorization = self->_samplesRequiringAuthorization;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", samplesRequiringAuthorization, CFSTR("SamplesRequiringAuthorization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));

}

- (NSDictionary)samplesRequiringAuthorization
{
  return self->_samplesRequiringAuthorization;
}

- (HKObjectAuthorizationPromptSessionMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_samplesRequiringAuthorization, 0);
}

@end
