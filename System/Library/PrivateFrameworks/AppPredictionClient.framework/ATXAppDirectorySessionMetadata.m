@implementation ATXAppDirectorySessionMetadata

- (ATXAppDirectorySessionMetadata)init
{
  return -[ATXAppDirectorySessionMetadata initWithEngagedBundleId:engagedBundleIdInTopAppsVisible:didSearchDuringSession:](self, "initWithEngagedBundleId:engagedBundleIdInTopAppsVisible:didSearchDuringSession:", 0, 0, 0);
}

- (ATXAppDirectorySessionMetadata)initWithEngagedBundleId:(id)a3 engagedBundleIdInTopAppsVisible:(id)a4 didSearchDuringSession:(BOOL)a5
{
  id v9;
  id v10;
  ATXAppDirectorySessionMetadata *v11;
  ATXAppDirectorySessionMetadata *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAppDirectorySessionMetadata;
  v11 = -[ATXAppDirectorySessionMetadata init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_engagedBundleId, a3);
    objc_storeStrong((id *)&v12->_engagedBundleIdInTopAppsVisible, a4);
    v12->_didSearchDuringSession = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *engagedBundleId;
  id v5;

  engagedBundleId = self->_engagedBundleId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", engagedBundleId, CFSTR("engagedBundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_engagedBundleIdInTopAppsVisible, CFSTR("bundleIdInTopAppsVisible"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didSearchDuringSession, CFSTR("appDirDidSearchDuringSession"));

}

- (ATXAppDirectorySessionMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXAppDirectorySessionMetadata *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_feedback();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("engagedBundleId"), v4, 0, CFSTR("com.apple.ATXFeedbackSessionMetadata"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_feedback();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("bundleIdInTopAppsVisible"), v4, 0, CFSTR("com.apple.ATXFeedbackSessionMetadata"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      self = -[ATXAppDirectorySessionMetadata initWithEngagedBundleId:engagedBundleIdInTopAppsVisible:didSearchDuringSession:](self, "initWithEngagedBundleId:engagedBundleIdInTopAppsVisible:didSearchDuringSession:", v8, v14, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("appDirDidSearchDuringSession")));
      v10 = self;
    }

  }
  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_engagedBundleId, "hash");
  v4 = -[NSNumber hash](self->_engagedBundleIdInTopAppsVisible, "hash");
  return self->_didSearchDuringSession - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
}

- (BOOL)isEqual:(id)a3
{
  ATXAppDirectorySessionMetadata *v4;
  ATXAppDirectorySessionMetadata *v5;
  BOOL v6;

  v4 = (ATXAppDirectorySessionMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXAppDirectorySessionMetadata isEqualToATXAppDirectorySessionMetadata:](self, "isEqualToATXAppDirectorySessionMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToATXAppDirectorySessionMetadata:(id)a3
{
  id *v4;
  NSString *engagedBundleId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSNumber *engagedBundleIdInTopAppsVisible;
  NSNumber *v11;
  NSNumber *v12;
  NSNumber *v13;
  char v14;
  BOOL v15;

  v4 = (id *)a3;
  engagedBundleId = self->_engagedBundleId;
  v6 = (NSString *)v4[2];
  if (engagedBundleId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = engagedBundleId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_7;
  }
  engagedBundleIdInTopAppsVisible = self->_engagedBundleIdInTopAppsVisible;
  v11 = (NSNumber *)v4[3];
  if (engagedBundleIdInTopAppsVisible == v11)
  {

    goto LABEL_9;
  }
  v12 = v11;
  v13 = engagedBundleIdInTopAppsVisible;
  v14 = -[NSNumber isEqual:](v13, "isEqual:", v12);

  if ((v14 & 1) != 0)
  {
LABEL_9:
    v15 = self->_didSearchDuringSession == *((unsigned __int8 *)v4 + 8);
    goto LABEL_10;
  }
LABEL_7:
  v15 = 0;
LABEL_10:

  return v15;
}

- (NSString)description
{
  void *v3;
  id v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1A85A4F90](self, a2);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_didSearchDuringSession)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@: \nengagedBundleId: %@ \nengagedBundleIdInTopAppsVisible: %@ \ndidSearchDuringSession: %@ \n"), v6, self->_engagedBundleId, self->_engagedBundleIdInTopAppsVisible, v8);

  objc_autoreleasePoolPop(v3);
  return (NSString *)v9;
}

- (NSString)engagedBundleId
{
  return self->_engagedBundleId;
}

- (void)setEngagedBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_engagedBundleId, a3);
}

- (NSNumber)engagedBundleIdInTopAppsVisible
{
  return self->_engagedBundleIdInTopAppsVisible;
}

- (void)setEngagedBundleIdInTopAppsVisible:(id)a3
{
  objc_storeStrong((id *)&self->_engagedBundleIdInTopAppsVisible, a3);
}

- (BOOL)didSearchDuringSession
{
  return self->_didSearchDuringSession;
}

- (void)setDidSearchDuringSession:(BOOL)a3
{
  self->_didSearchDuringSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagedBundleIdInTopAppsVisible, 0);
  objc_storeStrong((id *)&self->_engagedBundleId, 0);
}

@end
