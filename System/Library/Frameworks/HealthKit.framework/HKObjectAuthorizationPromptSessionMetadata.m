@implementation HKObjectAuthorizationPromptSessionMetadata

- (HKObjectAuthorizationPromptSessionMetadata)initWithExpectedObjectType:(id)a3
{
  id v5;
  HKObjectAuthorizationPromptSessionMetadata *v6;
  HKObjectAuthorizationPromptSessionMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKObjectAuthorizationPromptSessionMetadata;
  v6 = -[HKObjectAuthorizationPromptSessionMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_expectedObjectType, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKObjectAuthorizationPromptSessionMetadata)initWithCoder:(id)a3
{
  id v4;
  HKObjectAuthorizationPromptSessionMetadata *v5;
  uint64_t v6;
  HKObjectType *expectedObjectType;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *recordTypes;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKObjectAuthorizationPromptSessionMetadata;
  v5 = -[HKObjectAuthorizationPromptSessionMetadata init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExpectedObjectType"));
    v6 = objc_claimAutoreleasedReturnValue();
    expectedObjectType = v5->_expectedObjectType;
    v5->_expectedObjectType = (HKObjectType *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("RecordTypes"));
    v11 = objc_claimAutoreleasedReturnValue();
    recordTypes = v5->_recordTypes;
    v5->_recordTypes = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  HKObjectType *expectedObjectType;
  id v5;

  expectedObjectType = self->_expectedObjectType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", expectedObjectType, CFSTR("ExpectedObjectType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordTypes, CFSTR("RecordTypes"));

}

- (HKObjectType)expectedObjectType
{
  return self->_expectedObjectType;
}

- (NSArray)recordTypes
{
  return self->_recordTypes;
}

- (void)setRecordTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordTypes, 0);
  objc_storeStrong((id *)&self->_expectedObjectType, 0);
}

@end
