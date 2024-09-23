@implementation MOSuggestion

- (MOSuggestion)initWithBundle:(id)a3 modifiedTitle:(id)a4 isPromptElligibleForTransfer:(BOOL)a5 assetPrototypes:(id)a6
{
  id v11;
  id v12;
  id v13;
  MOSuggestion *v14;
  MOSuggestion *v15;
  uint64_t v16;
  NSUUID *suggestionIdentifier;
  uint64_t v18;
  NSDate *startDate;
  uint64_t v20;
  NSDate *endDate;
  uint64_t v22;
  NSDate *creationDate;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSString *title;
  NSObject *v29;
  objc_super v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)MOSuggestion;
  v14 = -[MOSuggestion init](&v31, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_isPromptElligibleForTransfer = a5;
    objc_msgSend(v11, "bundleIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    suggestionIdentifier = v15->_suggestionIdentifier;
    v15->_suggestionIdentifier = (NSUUID *)v16;

    objc_msgSend(v11, "startDate");
    v18 = objc_claimAutoreleasedReturnValue();
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v18;

    objc_msgSend(v11, "endDate");
    v20 = objc_claimAutoreleasedReturnValue();
    endDate = v15->_endDate;
    v15->_endDate = (NSDate *)v20;

    objc_msgSend(v11, "creationDate");
    v22 = objc_claimAutoreleasedReturnValue();
    creationDate = v15->_creationDate;
    v15->_creationDate = (NSDate *)v22;

    objc_storeStrong((id *)&v15->_assetPrototypes, a6);
    objc_msgSend(v11, "labels");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      objc_msgSend(v11, "labels");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = objc_claimAutoreleasedReturnValue();
      title = v15->_title;
      v15->_title = (NSString *)v27;

      if ((objc_msgSend(v12, "isEqualToString:", v15->_title) & 1) == 0)
      {
        _mo_log_facility_get_os_log(MOLogFacilityUIService);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v12;
          _os_log_impl(&dword_1CAE42000, v29, OS_LOG_TYPE_DEFAULT, "(MOSuggestion) Setting modifiedTitle: %@", buf, 0xCu);
        }

        objc_storeStrong((id *)&v15->_title, a4);
      }
    }
    objc_storeStrong((id *)&v15->_baseBundle, a3);
    v15->_type = objc_msgSend(v11, "interfaceType");
    -[MOSuggestion packMetadata](v15, "packMetadata");
  }

  return v15;
}

- (MOSuggestion)initWithBundle:(id)a3 modifiedTitle:(id)a4 isPromptElligibleForTransfer:(BOOL)a5
{
  return -[MOSuggestion initWithBundle:modifiedTitle:isPromptElligibleForTransfer:assetPrototypes:](self, "initWithBundle:modifiedTitle:isPromptElligibleForTransfer:assetPrototypes:", a3, a4, a5, 0);
}

- (MOSuggestion)initWithBundle:(id)a3 isPromptElligibleForTransfer:(BOOL)a4 suggestionDeletate:(id)a5
{
  id v9;
  MOSuggestion *v10;
  MOSuggestion *v11;
  uint64_t v12;
  NSUUID *suggestionIdentifier;
  uint64_t v14;
  NSDate *startDate;
  uint64_t v16;
  NSDate *endDate;
  uint64_t v18;
  NSDate *creationDate;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSString *title;
  id v25;
  objc_super v27;
  id location;

  v9 = a3;
  objc_initWeak(&location, a5);
  v27.receiver = self;
  v27.super_class = (Class)MOSuggestion;
  v10 = -[MOSuggestion init](&v27, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_isPromptElligibleForTransfer = a4;
    objc_msgSend(v9, "bundleIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    suggestionIdentifier = v11->_suggestionIdentifier;
    v11->_suggestionIdentifier = (NSUUID *)v12;

    objc_msgSend(v9, "startDate");
    v14 = objc_claimAutoreleasedReturnValue();
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v14;

    objc_msgSend(v9, "endDate");
    v16 = objc_claimAutoreleasedReturnValue();
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v16;

    objc_msgSend(v9, "creationDate");
    v18 = objc_claimAutoreleasedReturnValue();
    creationDate = v11->_creationDate;
    v11->_creationDate = (NSDate *)v18;

    objc_msgSend(v9, "labels");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      objc_msgSend(v9, "labels");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = objc_claimAutoreleasedReturnValue();
      title = v11->_title;
      v11->_title = (NSString *)v23;

    }
    objc_storeStrong((id *)&v11->_baseBundle, a3);
    v25 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v11->_delegate, v25);

    v11->_type = objc_msgSend(v9, "interfaceType");
    -[MOSuggestion packMetadata](v11, "packMetadata");
  }
  objc_destroyWeak(&location);

  return v11;
}

- (void)packMetadata
{
  NSObject *v3;
  void *v4;
  NSArray *v5;
  NSArray *writingPrompts;
  uint8_t v7[16];

  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CAE42000, v3, OS_LOG_TYPE_DEFAULT, "(MOSuggestion) Packing prompts", v7, 2u);
  }

  if (self->_isPromptElligibleForTransfer)
  {
    -[MOEventBundle promptLanguages](self->_baseBundle, "promptLanguages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    writingPrompts = self->_writingPrompts;
    self->_writingPrompts = v5;

  }
  else
  {
    v4 = self->_writingPrompts;
    self->_writingPrompts = (NSArray *)MEMORY[0x1E0C9AA60];
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MOSuggestion encodeWithCoder:].cold.11();

  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestionIdentifier, CFSTR("identifier"));
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[MOSuggestion encodeWithCoder:].cold.10();

  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("label"));
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[MOSuggestion encodeWithCoder:].cold.9();

  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MOSuggestion encodeWithCoder:].cold.8();

  objc_msgSend(v4, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[MOSuggestion encodeWithCoder:].cold.7();

  objc_msgSend(v4, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[MOSuggestion encodeWithCoder:].cold.6();

  objc_msgSend(v4, "encodeObject:forKey:", self->_baseBundle, CFSTR("bundle"));
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[MOSuggestion encodeWithCoder:].cold.5();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("type"));

  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[MOSuggestion encodeWithCoder:].cold.4();

  objc_msgSend(v4, "encodeObject:forKey:", self->_writingPrompts, CFSTR("promptLanguages"));
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[MOSuggestion encodeWithCoder:].cold.3();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPromptElligibleForTransfer);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("promptElligible"));

  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[MOSuggestion encodeWithCoder:].cold.2();

  objc_msgSend(v4, "encodeObject:forKey:", self->_assetPrototypes, CFSTR("assetPrototypes"));
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[MOSuggestion encodeWithCoder:].cold.1();

}

- (MOSuggestion)initWithCoder:(id)a3
{
  id v4;
  MOSuggestion *v5;
  uint64_t v6;
  NSUUID *suggestionIdentifier;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  NSDate *endDate;
  uint64_t v12;
  NSDate *creationDate;
  uint64_t v14;
  NSString *title;
  void *v16;
  uint64_t v17;
  MOEventBundle *baseBundle;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *writingPrompts;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *assetPrototypes;
  NSArray *attachments;
  NSArray *imageAssets;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MOSuggestion;
  v5 = -[MOSuggestion init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    suggestionIdentifier = v5->_suggestionIdentifier;
    v5->_suggestionIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v14 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v14;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("bundle"));
    v17 = objc_claimAutoreleasedReturnValue();
    baseBundle = v5->_baseBundle;
    v5->_baseBundle = (MOEventBundle *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("promptLanguages"));
    v22 = objc_claimAutoreleasedReturnValue();
    writingPrompts = v5->_writingPrompts;
    v5->_writingPrompts = (NSArray *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("promptElligible"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isPromptElligibleForTransfer = v24 != 0;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = (int)objc_msgSend(v25, "intValue");

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("assetPrototypes"));
    v29 = objc_claimAutoreleasedReturnValue();
    assetPrototypes = v5->_assetPrototypes;
    v5->_assetPrototypes = (NSArray *)v29;

    objc_storeStrong((id *)&v5->_prompt, v5->_title);
    objc_storeStrong((id *)&v5->_promptLanguages, v5->_writingPrompts);
    objc_storeStrong((id *)&v5->_date, v5->_startDate);
    attachments = v5->_attachments;
    v5->_attachments = 0;

    imageAssets = v5->_imageAssets;
    v5->_imageAssets = 0;

  }
  return v5;
}

- (NSUUID)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)writingPrompts
{
  return self->_writingPrompts;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSArray)assetPrototypes
{
  return self->_assetPrototypes;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (NSArray)promptLanguages
{
  return self->_promptLanguages;
}

- (NSDate)date
{
  return self->_date;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (NSArray)imageAssets
{
  return self->_imageAssets;
}

- (MOEventBundle)baseBundle
{
  return self->_baseBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseBundle, 0);
  objc_storeStrong((id *)&self->_imageAssets, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_promptLanguages, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_assetPrototypes, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_writingPrompts, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)encodeWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, v0, v1, "encoding COMPLETE", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)encodeWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, v0, v1, "encoding _assetTypes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)encodeWithCoder:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, v0, v1, "encoding _isPromptElligibleForTransfer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)encodeWithCoder:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, v0, v1, "encoding _writingPrompts", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)encodeWithCoder:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, v0, v1, "encoding _type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)encodeWithCoder:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, v0, v1, "encoding _bundle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)encodeWithCoder:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, v0, v1, "encoding _creationDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)encodeWithCoder:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, v0, v1, "encoding _endDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)encodeWithCoder:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, v0, v1, "encoding _startDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)encodeWithCoder:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, v0, v1, "encoding _title", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)encodeWithCoder:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, v0, v1, "encoding _suggestionIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
