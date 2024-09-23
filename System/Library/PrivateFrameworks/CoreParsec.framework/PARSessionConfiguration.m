@implementation PARSessionConfiguration

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)parsecEnabled
{
  return self->_parsecEnabled;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userAgent, CFSTR("_userAgent"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_dontPreloadImages, CFSTR("_dontPreloadImages"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_parsecEnabled, CFSTR("_parsecEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_experimentNamespaceId, CFSTR("experimentNamespaceId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_experimentId, CFSTR("experimentId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_experimentTreatmentId, CFSTR("experimentTreatmentId"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_experimentDeploymentId, CFSTR("experimentDeploymentId"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_experimentVersion, CFSTR("experimentVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_overrideFeatureFlags, CFSTR("_overrideFeatureFlags"));

}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@, %@)"), self->_identifier, self->_userAgent);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PARSessionConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PARSessionConfiguration *v7;
  uint64_t v8;
  NSString *experimentNamespaceId;
  uint64_t v10;
  NSString *experimentId;
  uint64_t v12;
  NSString *experimentTreatmentId;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *overrideFeatureFlags;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userAgent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PARSessionConfiguration initWithId:userAgent:](self, "initWithId:userAgent:", v5, v6);

  v7->_dontPreloadImages = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_dontPreloadImages"));
  v7->_parsecEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_parsecEnabled"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experimentNamespaceId"));
  v8 = objc_claimAutoreleasedReturnValue();
  experimentNamespaceId = v7->_experimentNamespaceId;
  v7->_experimentNamespaceId = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experimentId"));
  v10 = objc_claimAutoreleasedReturnValue();
  experimentId = v7->_experimentId;
  v7->_experimentId = (NSString *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experimentTreatmentId"));
  v12 = objc_claimAutoreleasedReturnValue();
  experimentTreatmentId = v7->_experimentTreatmentId;
  v7->_experimentTreatmentId = (NSString *)v12;

  v7->_experimentDeploymentId = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("experimentDeploymentId"));
  v7->_experimentVersion = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("experimentVersion"));
  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_overrideFeatureFlags"));
  v18 = objc_claimAutoreleasedReturnValue();

  overrideFeatureFlags = v7->_overrideFeatureFlags;
  v7->_overrideFeatureFlags = (NSDictionary *)v18;

  return v7;
}

- (PARSessionConfiguration)initWithId:(id)a3 userAgent:(id)a4
{
  return -[PARSessionConfiguration initWithId:userAgent:factory:](self, "initWithId:userAgent:factory:", a3, a4, 0);
}

- (PARSessionConfiguration)initWithId:(id)a3 userAgent:(id)a4 factory:(id)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  PARSessionConfiguration *v15;
  void *v16;
  pid_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  NSString *identifier;
  PARDefaultFactory *v26;
  PARResultFactory *factory;
  uint64_t v28;
  NSString *userAgent;
  NSObject *v31;
  int *v32;
  char *v33;
  const __CFString *v34;
  void *v35;
  int v36;
  NSObject *v37;
  objc_super v38;
  uint8_t buf[8];
  _QWORD v40[3];
  _OWORD buffer[256];
  uint64_t v42;

  v5 = MEMORY[0x1E0C80A78](self, a2, a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v10 = (void *)v5;
  v42 = *MEMORY[0x1E0C80C00];
  v12 = v11;
  v13 = v9;
  v14 = v7;
  v38.receiver = v10;
  v38.super_class = (Class)PARSessionConfiguration;
  v15 = -[PARSessionConfiguration init](&v38, sel_init);
  if (!v15)
    goto LABEL_29;
  if (v12 && v13)
  {
    v16 = 0;
    goto LABEL_21;
  }
  v17 = getpid();
  if (proc_pidpath(v17, buffer, 0x1000u) <= 0)
  {
    if (PARLogHandleForCategory_onceToken != -1)
      dispatch_once(&PARLogHandleForCategory_onceToken, &__block_literal_global_253);
    v20 = (void *)PARLogHandleForCategory_logHandles_2;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2, OS_LOG_TYPE_ERROR))
    {
      v31 = v20;
      v32 = __error();
      v33 = strerror(*v32);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v17;
      LOWORD(v40[0]) = 2080;
      *(_QWORD *)((char *)v40 + 2) = v33;
      _os_log_error_impl(&dword_19A825000, v31, OS_LOG_TYPE_ERROR, "error getting path for pid [%d] %s", buf, 0x12u);

    }
    v19 = CFSTR("com.apple.parsec.defaultClient");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastPathComponent");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v21 = v19;
  if ((-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("searchd")) & 1) != 0
    || (-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("SpringBoard")) & 1) != 0
    || (-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("Spotlight Test")) & 1) != 0
    || (-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("Spotlight")) & 1) != 0
    || (-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("Spotlight2")) & 1) != 0
    || -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("Search")))
  {
    v22 = CFSTR("com.apple.spotlight");
    *(_QWORD *)buf = CFSTR("_identifier");
    v40[0] = CFSTR("_userAgent");
    v23 = CFSTR("Spotlight/1");
LABEL_19:
    *(_QWORD *)&buffer[0] = v22;
    goto LABEL_20;
  }
  v34 = CFSTR("Safari");
  if (-[__CFString containsString:](v21, "containsString:", CFSTR("Safari")))
  {
    *(_QWORD *)buf = CFSTR("_identifier");
    v40[0] = CFSTR("_userAgent");
    v23 = CFSTR("Safari/1");
  }
  else
  {
    if ((-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("DDActionsService")) & 1) != 0
      || -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("LookupViewService")))
    {
      v22 = CFSTR("com.apple.lookup");
      *(_QWORD *)buf = CFSTR("_identifier");
      v40[0] = CFSTR("_userAgent");
      v23 = CFSTR("Lookup/1");
      goto LABEL_19;
    }
    if (-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("HashtagImagesExtension")))
    {
      v22 = CFSTR("Messages-searchToShare-session");
      *(_QWORD *)buf = CFSTR("_identifier");
      v40[0] = CFSTR("_userAgent");
      v23 = CFSTR("Messages/1");
      goto LABEL_19;
    }
    -[__CFString lowercaseString](v21, "lowercaseString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "containsString:", CFSTR("news"));

    if (v36)
    {
      v22 = CFSTR("com.apple.news");
      *(_QWORD *)buf = CFSTR("_identifier");
      v40[0] = CFSTR("_userAgent");
      v23 = CFSTR("News/1");
      goto LABEL_19;
    }
    if ((-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("assistantd")) & 1) != 0
      || (-[__CFString parsec_hasPrefix:](v21, "parsec_hasPrefix:", CFSTR("Siri")) & 1) != 0
      || -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("assistant_service")))
    {
      v22 = CFSTR("com.apple.siri");
      *(_QWORD *)buf = CFSTR("_identifier");
      v40[0] = CFSTR("_userAgent");
      v23 = CFSTR("Siri/1");
      goto LABEL_19;
    }
    if (-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("suggestd")))
    {
      v22 = CFSTR("com.apple.proactive.trystero");
      *(_QWORD *)buf = CFSTR("_identifier");
      v40[0] = CFSTR("_userAgent");
      v23 = CFSTR("Trystero/1");
      goto LABEL_19;
    }
    v34 = CFSTR("reversetemplated");
    if ((-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("reversetemplated")) & 1) == 0
      && !-[__CFString containsString:](v21, "containsString:", CFSTR("suggest_tool")))
    {
      if (-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("duetexpertd")))
      {
        v22 = CFSTR("com.apple.notifications.logging");
        *(_QWORD *)buf = CFSTR("_identifier");
        v40[0] = CFSTR("_userAgent");
        v23 = CFSTR("DuetExpert/1");
      }
      else if (-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("mediaanalysisd")))
      {
        v22 = CFSTR("com.apple.mediaanalysisd");
        *(_QWORD *)buf = CFSTR("_identifier");
        v40[0] = CFSTR("_userAgent");
        v23 = CFSTR("VisualIntelligence/1");
      }
      else if ((-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("PhotosMessagesApp")) & 1) != 0
             || (-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("PhotoPicker")) & 1) != 0
             || -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("PhotosPicker")))
      {
        v22 = CFSTR("com.apple.photopicker");
        *(_QWORD *)buf = CFSTR("_identifier");
        v40[0] = CFSTR("_userAgent");
        v23 = CFSTR("PhotoPicker/1");
      }
      else if ((-[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("MobileSlideShow")) & 1) != 0
             || -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("Photos")))
      {
        v22 = CFSTR("com.apple.photos");
        *(_QWORD *)buf = CFSTR("_identifier");
        v40[0] = CFSTR("_userAgent");
        v23 = CFSTR("Photos/1");
      }
      else
      {
        if (PARLogHandleForCategory_onceToken != -1)
          dispatch_once(&PARLogHandleForCategory_onceToken, &__block_literal_global_253);
        v37 = PARLogHandleForCategory_logHandles_2;
        if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_2, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buffer[0]) = 138412290;
          *(_QWORD *)((char *)buffer + 4) = v21;
          _os_log_error_impl(&dword_19A825000, v37, OS_LOG_TYPE_ERROR, "unhandled process %@", (uint8_t *)buffer, 0xCu);
        }
        v22 = CFSTR("default");
        *(_QWORD *)buf = CFSTR("_identifier");
        v40[0] = CFSTR("_userAgent");
        v23 = CFSTR("parsecd/1.0");
      }
      goto LABEL_19;
    }
    *(_QWORD *)buf = CFSTR("_identifier");
    v40[0] = CFSTR("_userAgent");
    v23 = CFSTR("CoreSuggestions/1");
  }
  *(_QWORD *)&buffer[0] = v34;
LABEL_20:
  *((_QWORD *)&buffer[0] + 1) = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buffer, buf, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("_identifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
LABEL_21:
  v24 = objc_msgSend(v12, "copy");
LABEL_22:
  identifier = v15->_identifier;
  v15->_identifier = (NSString *)v24;

  if (v14)
    v26 = (PARDefaultFactory *)v14;
  else
    v26 = objc_alloc_init(PARDefaultFactory);
  factory = v15->_factory;
  v15->_factory = (PARResultFactory *)v26;

  if (v13)
  {
    v28 = objc_msgSend(v13, "copy");
  }
  else
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("_userAgent"));
    v28 = objc_claimAutoreleasedReturnValue();
  }
  userAgent = v15->_userAgent;
  v15->_userAgent = (NSString *)v28;

  v15->_dontPreloadImages = 1;
  v15->_parsecEnabled = 1;

LABEL_29:
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideFeatureFlags, 0);
  objc_storeStrong((id *)&self->_experimentTreatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_experimentNamespaceId, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setParsecEnabled:(BOOL)a3
{
  self->_parsecEnabled = a3;
}

- (PARSessionConfiguration)init
{
  return -[PARSessionConfiguration initWithId:userAgent:](self, "initWithId:userAgent:", 0, 0);
}

- (PARResultFactory)factory
{
  return (PARResultFactory *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)dontPreloadImages
{
  return self->_dontPreloadImages;
}

- (void)setDontPreloadImages:(BOOL)a3
{
  self->_dontPreloadImages = a3;
}

- (BOOL)enablePersonalizedRanking
{
  return self->_enablePersonalizedRanking;
}

- (void)setEnablePersonalizedRanking:(BOOL)a3
{
  self->_enablePersonalizedRanking = a3;
}

- (NSString)experimentNamespaceId
{
  return self->_experimentNamespaceId;
}

- (void)setExperimentNamespaceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)experimentTreatmentId
{
  return self->_experimentTreatmentId;
}

- (void)setExperimentTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int)experimentDeploymentId
{
  return self->_experimentDeploymentId;
}

- (void)setExperimentDeploymentId:(int)a3
{
  self->_experimentDeploymentId = a3;
}

- (int)experimentVersion
{
  return self->_experimentVersion;
}

- (void)setExperimentVersion:(int)a3
{
  self->_experimentVersion = a3;
}

- (NSDictionary)overrideFeatureFlags
{
  return self->_overrideFeatureFlags;
}

- (void)setOverrideFeatureFlags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

+ (id)defaultSessionConfiguration
{
  if (defaultSessionConfiguration_once != -1)
    dispatch_once(&defaultSessionConfiguration_once, &__block_literal_global_7);
  return (id)defaultSessionConfiguration__defaultSession;
}

void __54__PARSessionConfiguration_defaultSessionConfiguration__block_invoke()
{
  PARSessionConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(PARSessionConfiguration);
  v1 = (void *)defaultSessionConfiguration__defaultSession;
  defaultSessionConfiguration__defaultSession = (uint64_t)v0;

}

@end
