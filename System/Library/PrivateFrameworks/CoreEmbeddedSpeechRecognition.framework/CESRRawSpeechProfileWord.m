@implementation CESRRawSpeechProfileWord

- (CESRRawSpeechProfileWord)initWithSpeechWordDictionary:(id)a3
{
  id v4;
  CESRRawSpeechProfileWord *v5;
  void *v6;
  uint64_t v7;
  NSString *tagValue;
  void *v9;
  uint64_t v10;
  NSString *orthography;
  CESRRawSpeechProfileWord *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CESRRawSpeechProfileWord;
  v5 = -[CESRRawSpeechProfileWord init](&v15, sel_init);
  if (!v5)
    goto LABEL_5;
  if (!v4 || !objc_msgSend(v4, "count"))
  {
    v13 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CESRRawSpeechProfileWord initWithSpeechWordDictionary:]";
      v18 = 2112;
      v19 = v4;
      _os_log_error_impl(&dword_1B3E5F000, v13, OS_LOG_TYPE_ERROR, "%s Cannot construct speech word from empty dictionary: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  -[CESRRawSpeechProfileWord _extractTagFromSpeechWord:](v5, "_extractTagFromSpeechWord:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  tagValue = v5->_tagValue;
  v5->_tagValue = (NSString *)v7;

  v5->_tagType = CESRRawSpeechProfileWordTagFromString(v5->_tagValue);
  -[CESRRawSpeechProfileWord _extractOrthographyFromSpeechWord:](v5, "_extractOrthographyFromSpeechWord:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  orthography = v5->_orthography;
  v5->_orthography = (NSString *)v10;

  if (!v5->_orthography)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
LABEL_5:
  v12 = v5;
LABEL_9:

  return v12;
}

- (CESRRawSpeechProfileWord)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use -initWithSpeechWordDictionary"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)_extractTagFromSpeechWord:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("tag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      goto LABEL_6;
    }
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("string"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v5 = v4;
LABEL_8:

  return v5;
}

- (id)_extractOrthographyFromSpeechWord:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("orthography"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v6 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[CESRRawSpeechProfileWord _extractOrthographyFromSpeechWord:]";
      v10 = 2112;
      v11 = v3;
      _os_log_error_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_ERROR, "%s Missing orthography string value in speech word: %@", (uint8_t *)&v8, 0x16u);
    }
    v5 = 0;
  }

  return v5;
}

- (NSString)orthography
{
  return self->_orthography;
}

- (int64_t)tagType
{
  return self->_tagType;
}

- (NSString)tagValue
{
  return self->_tagValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagValue, 0);
  objc_storeStrong((id *)&self->_orthography, 0);
}

@end
