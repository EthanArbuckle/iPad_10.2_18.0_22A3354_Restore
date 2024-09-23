@implementation CalAlarmMetadata

+ (BOOL)isRecognizedProperty:(id)a3 inComponent:(id)a4
{
  uint64_t v4;
  id v5;
  char v6;

  v4 = isRecognizedProperty_inComponent__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&isRecognizedProperty_inComponent__onceToken, &__block_literal_global_17);
  v6 = objc_msgSend((id)isRecognizedProperty_inComponent__recognizedProperties, "containsObject:", v5);

  return v6;
}

void __53__CalAlarmMetadata_isRecognizedProperty_inComponent___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0DDBA08], *MEMORY[0x1E0DDBA10], *MEMORY[0x1E0DDBB20], *MEMORY[0x1E0DDBB88], *MEMORY[0x1E0DDBBA8], *MEMORY[0x1E0DDB8B0], *MEMORY[0x1E0DDB8D0], *MEMORY[0x1E0DDB920], *MEMORY[0x1E0DDB968], *MEMORY[0x1E0DDB9F0], 0);
  v2 = (void *)isRecognizedProperty_inComponent__recognizedProperties;
  isRecognizedProperty_inComponent__recognizedProperties = v1;

}

+ (BOOL)isRecognizedParameter:(id)a3 forProperty:(id)a4 inComponent:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v6 = isRecognizedParameter_forProperty_inComponent__onceToken;
  v7 = a4;
  v8 = a3;
  if (v6 != -1)
    dispatch_once(&isRecognizedParameter_forProperty_inComponent__onceToken, &__block_literal_global_1_0);
  objc_msgSend((id)isRecognizedParameter_forProperty_inComponent__recognizedParametersByPropertyName, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "containsObject:", v8);
  return v10;
}

void __66__CalAlarmMetadata_isRecognizedParameter_forProperty_inComponent___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DDBA00], *MEMORY[0x1E0DDB9F8], *MEMORY[0x1E0DDB928], 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *MEMORY[0x1E0DDBB88];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DDBBB8], 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = *MEMORY[0x1E0DDB968];
  v5[0] = v1;
  v5[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isRecognizedParameter_forProperty_inComponent__recognizedParametersByPropertyName;
  isRecognizedParameter_forProperty_inComponent__recognizedParametersByPropertyName = v2;

}

+ (BOOL)shouldSkipSavingUnrecognizedParametersForProperty:(id)a3 inComponent:(id)a4
{
  uint64_t v4;
  id v5;
  char v6;

  v4 = shouldSkipSavingUnrecognizedParametersForProperty_inComponent__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&shouldSkipSavingUnrecognizedParametersForProperty_inComponent__onceToken, &__block_literal_global_3);
  v6 = objc_msgSend((id)shouldSkipSavingUnrecognizedParametersForProperty_inComponent__propertiesToSkipSavingUnrecognizedParameters, "containsObject:", v5);

  return v6;
}

void __82__CalAlarmMetadata_shouldSkipSavingUnrecognizedParametersForProperty_inComponent___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0DDB8B0], 0);
  v2 = (void *)shouldSkipSavingUnrecognizedParametersForProperty_inComponent__propertiesToSkipSavingUnrecognizedParameters;
  shouldSkipSavingUnrecognizedParametersForProperty_inComponent__propertiesToSkipSavingUnrecognizedParameters = v1;

}

+ (id)metadataWithData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___CalAlarmMetadata;
  objc_msgSendSuper2(&v10, sel_metadataWithData_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (!v5)
    {
      v7 = CDBiCalendarConversionHandle;
      if (os_log_type_enabled((os_log_t)CDBiCalendarConversionHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v6;
        _os_log_impl(&dword_1A5CCB000, v7, OS_LOG_TYPE_ERROR, "Error unarchiving alarm metadata: %@", buf, 0xCu);
      }
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalAlarmMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  CalAlarmMetadata *v10;
  id v11;
  objc_super v13;
  objc_super v14;

  v4 = a3;
  if (initWithCoder__onceToken != -1)
    dispatch_once(&initWithCoder__onceToken, &__block_literal_global_13);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__attachmentClasses, CFSTR("Attach"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__attendeeClasses, CFSTR("Attendee"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Summary"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5 || v6 || v7 || v8)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0DDB7A0]);
    objc_msgSend(v11, "setAttach:", v5);
    objc_msgSend(v11, "setAttendee:", v6);
    objc_msgSend(v11, "setDescription:", v7);
    objc_msgSend(v11, "setSummary:", v9);
    v13.receiver = self;
    v13.super_class = (Class)CalAlarmMetadata;
    v10 = -[CalItemMetadata initWithICSComponent:](&v13, sel_initWithICSComponent_, v11);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CalAlarmMetadata;
    v10 = -[CalItemMetadata initWithCoder:](&v14, sel_initWithCoder_, v4);
  }

  return v10;
}

void __34__CalAlarmMetadata_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__attachmentClasses;
  initWithCoder__attachmentClasses = v2;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)initWithCoder__attendeeClasses;
  initWithCoder__attendeeClasses = v6;

}

@end
