@implementation EARSpeechModelInfo

- (EARSpeechModelInfo)initWithModelInfo:(id)a3
{
  id v4;
  EARSpeechModelInfo *v5;
  uint64_t v6;
  NSString *version;
  void *v8;
  uint64_t v9;
  NSSet *samplingRates;
  void *v11;
  uint64_t v12;
  NSSet *tasks;
  uint64_t v14;
  NSString *language;
  uint64_t v16;
  NSString *phoneSetVersion;
  uint64_t v18;
  NSString *acousticProfileVersion;
  uint64_t v20;
  NSString *acousticModelVersion;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EARSpeechModelInfo;
  v5 = -[EARSpeechModelInfo init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "version");
    v6 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v6;

    objc_msgSend(v4, "samplingRates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    samplingRates = v5->_samplingRates;
    v5->_samplingRates = (NSSet *)v9;

    objc_msgSend(v4, "tasks");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    tasks = v5->_tasks;
    v5->_tasks = (NSSet *)v12;

    objc_msgSend(v4, "language");
    v14 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v14;

    objc_msgSend(v4, "phoneSetVersion");
    v16 = objc_claimAutoreleasedReturnValue();
    phoneSetVersion = v5->_phoneSetVersion;
    v5->_phoneSetVersion = (NSString *)v16;

    objc_msgSend(v4, "acousticProfileVersion");
    v18 = objc_claimAutoreleasedReturnValue();
    acousticProfileVersion = v5->_acousticProfileVersion;
    v5->_acousticProfileVersion = (NSString *)v18;

    objc_msgSend(v4, "acousticModelVersion");
    v20 = objc_claimAutoreleasedReturnValue();
    acousticModelVersion = v5->_acousticModelVersion;
    v5->_acousticModelVersion = (NSString *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_samplingRates, CFSTR("samplingRates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tasks, CFSTR("tasks"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_language, CFSTR("language"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneSetVersion, CFSTR("phoneSetVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_acousticProfileVersion, CFSTR("acousticProfileVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_acousticModelVersion, CFSTR("acousticModelVersion"));

}

- (EARSpeechModelInfo)initWithCoder:(id)a3
{
  id v4;
  EARSpeechModelInfo *v5;
  uint64_t v6;
  NSString *version;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *samplingRates;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSSet *tasks;
  uint64_t v18;
  NSString *language;
  uint64_t v20;
  NSString *phoneSetVersion;
  uint64_t v22;
  NSString *acousticProfileVersion;
  uint64_t v24;
  NSString *acousticModelVersion;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)EARSpeechModelInfo;
  v5 = -[EARSpeechModelInfo init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v6 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("samplingRates"));
    v11 = objc_claimAutoreleasedReturnValue();
    samplingRates = v5->_samplingRates;
    v5->_samplingRates = (NSSet *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("tasks"));
    v16 = objc_claimAutoreleasedReturnValue();
    tasks = v5->_tasks;
    v5->_tasks = (NSSet *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
    v18 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneSetVersion"));
    v20 = objc_claimAutoreleasedReturnValue();
    phoneSetVersion = v5->_phoneSetVersion;
    v5->_phoneSetVersion = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acousticProfileVersion"));
    v22 = objc_claimAutoreleasedReturnValue();
    acousticProfileVersion = v5->_acousticProfileVersion;
    v5->_acousticProfileVersion = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acousticModelVersion"));
    v24 = objc_claimAutoreleasedReturnValue();
    acousticModelVersion = v5->_acousticModelVersion;
    v5->_acousticModelVersion = (NSString *)v24;

  }
  return v5;
}

- (NSString)version
{
  return self->_version;
}

- (NSSet)samplingRates
{
  return self->_samplingRates;
}

- (NSSet)tasks
{
  return self->_tasks;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)phoneSetVersion
{
  return self->_phoneSetVersion;
}

- (NSString)acousticProfileVersion
{
  return self->_acousticProfileVersion;
}

- (NSString)acousticModelVersion
{
  return self->_acousticModelVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acousticModelVersion, 0);
  objc_storeStrong((id *)&self->_acousticProfileVersion, 0);
  objc_storeStrong((id *)&self->_phoneSetVersion, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_samplingRates, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
