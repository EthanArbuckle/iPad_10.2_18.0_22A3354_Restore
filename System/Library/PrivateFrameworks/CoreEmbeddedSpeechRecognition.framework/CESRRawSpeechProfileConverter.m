@implementation CESRRawSpeechProfileConverter

- (CESRRawSpeechProfileConverter)init
{
  return -[CESRRawSpeechProfileConverter initWithOmittedItemTypes:](self, "initWithOmittedItemTypes:", 0);
}

- (CESRRawSpeechProfileConverter)initWithOmittedItemTypes:(id)a3
{
  id v5;
  CESRRawSpeechProfileConverter *v6;
  CESRRawSpeechProfileConverter *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *companionProfiles;
  NSMutableDictionary *v10;
  NSMutableDictionary *companionPriors;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CESRRawSpeechProfileConverter;
  v6 = -[CESRRawSpeechProfileConverter init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_omitItemTypes, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    companionProfiles = v7->_companionProfiles;
    v7->_companionProfiles = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    companionPriors = v7->_companionPriors;
    v7->_companionPriors = v10;

  }
  return v7;
}

- (BOOL)setPrimaryRawSpeechProfile:(id)a3 error:(id *)a4
{
  return -[CESRRawSpeechProfileConverter _processRawSpeechProfile:deviceId:userId:error:](self, "_processRawSpeechProfile:deviceId:userId:error:", a3, 0, 0, a4);
}

- (BOOL)addCompanionRawSpeechProfile:(id)a3 deviceId:(id)a4 userId:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v11, "length"))
  {
    if (objc_msgSend(v12, "length"))
    {
      v13 = -[CESRRawSpeechProfileConverter _processRawSpeechProfile:deviceId:userId:error:](self, "_processRawSpeechProfile:deviceId:userId:error:", v10, v11, v12, a6);
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("userId must be nonempty string: %@"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[CESRRawSpeechProfileConverter addCompanionRawSpeechProfile:deviceId:userId:error:]";
      v31 = 2112;
      v32 = v14;
      _os_log_error_impl(&dword_1B3E5F000, v20, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v21;
    v19 = 8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("deviceId must be nonempty string: %@"), v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[CESRRawSpeechProfileConverter addCompanionRawSpeechProfile:deviceId:userId:error:]";
      v31 = 2112;
      v32 = v14;
      _os_log_error_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v19 = 7;
  }
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), v19, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (a6 && v22)
    *a6 = objc_retainAutorelease(v22);

  v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)_processRawSpeechProfile:(id)a3 deviceId:(id)a4 userId:(id)a5 error:(id *)a6
{
  unint64_t v10;
  unint64_t v11;
  NSSet *omitItemTypes;
  void *v13;
  id v14;
  NSObject *v15;
  __CFString *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = (unint64_t)a4;
  v11 = (unint64_t)a5;
  omitItemTypes = self->_omitItemTypes;
  v18 = 0;
  +[CESRRawSpeechProfileTools convertRawSpeechProfile:deviceId:userId:omitItemTypes:error:](CESRRawSpeechProfileTools, "convertRawSpeechProfile:deviceId:userId:omitItemTypes:error:", a3, v10, v11, omitItemTypes, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v18;
  if (v13)
  {
    if (v11)
      -[NSMutableDictionary setObject:forKey:](self->_companionProfiles, "setObject:forKey:", v13, v11);
    else
      objc_storeStrong((id *)&self->_primaryProfile, v13);
  }
  else
  {
    v15 = (id)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (v10 | v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[companion: {deviceId: %@ userId: %@}]"), v10, v11);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = CFSTR("[primary]");
      }
      *(_DWORD *)buf = 136315650;
      v20 = "-[CESRRawSpeechProfileConverter _processRawSpeechProfile:deviceId:userId:error:]";
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v14;
      _os_log_error_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_ERROR, "%s Failed to convert rawSpeechProfile %@ to KVProfile, error: %@", buf, 0x20u);

    }
    if (a6 && v14)
      *a6 = objc_retainAutorelease(v14);
  }

  return v13 != 0;
}

- (id)convertToKVProfileWithError:(id *)a3
{
  KVProfile *primaryProfile;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  NSMutableDictionary *companionProfiles;
  NSObject *v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (self->_primaryProfile)
  {
    if (!-[NSMutableDictionary count](self->_companionProfiles, "count"))
      return self->_primaryProfile;
    primaryProfile = self->_primaryProfile;
    -[NSMutableDictionary allValues](self->_companionProfiles, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    +[CESRRawSpeechProfileTools mergeMultiUserPrimaryProfile:withCompanionProfiles:error:](CESRRawSpeechProfileTools, "mergeMultiUserPrimaryProfile:withCompanionProfiles:error:", primaryProfile, v6, &v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;

    if (v7)
    {
      v9 = v7;
LABEL_16:

      return v7;
    }
    v16 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      companionProfiles = self->_companionProfiles;
      v18 = v16;
      v19 = -[NSMutableDictionary count](companionProfiles, "count");
      *(_DWORD *)buf = 136315650;
      v22 = "-[CESRRawSpeechProfileConverter convertToKVProfileWithError:]";
      v23 = 2048;
      v24 = (const __CFString *)v19;
      v25 = 2112;
      v26 = v8;
      _os_log_error_impl(&dword_1B3E5F000, v18, OS_LOG_TYPE_ERROR, "%s Failed to merge primary and %lu companion profile(s), error: %@", buf, 0x20u);

      if (!a3)
        goto LABEL_16;
    }
    else if (!a3)
    {
      goto LABEL_16;
    }
    if (v8)
      *a3 = objc_retainAutorelease(v8);
    goto LABEL_16;
  }
  v10 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[CESRRawSpeechProfileConverter convertToKVProfileWithError:]";
    v23 = 2112;
    v24 = CFSTR("No primary profile data has been successfuly added to the builder.");
    _os_log_error_impl(&dword_1B3E5F000, v10, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v27 = *MEMORY[0x1E0CB2D50];
  v28[0] = CFSTR("No primary profile data has been successfuly added to the builder.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a3 && v13)
    *a3 = objc_retainAutorelease(v13);

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionPriors, 0);
  objc_storeStrong((id *)&self->_primaryPriors, 0);
  objc_storeStrong((id *)&self->_companionProfiles, 0);
  objc_storeStrong((id *)&self->_primaryProfile, 0);
  objc_storeStrong((id *)&self->_omitItemTypes, 0);
}

@end
