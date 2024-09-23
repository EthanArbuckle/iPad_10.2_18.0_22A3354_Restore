@implementation CLSArchivedHandoutAttachment

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D406A5FC;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB428 != -1)
    dispatch_once(&qword_1ED0FB428, block);
  return (id)qword_1ED0FB420;
}

- (id)_init
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_initWithType_title_, 0);
}

- (CLSArchivedHandoutAttachment)initWithType:(int)a3 title:(id)a4
{
  id v7;
  CLSArchivedHandoutAttachment *v8;
  CLSArchivedHandoutAttachment *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CLSArchivedHandoutAttachment;
  v8 = -[CLSObject _init](&v11, sel__init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_title, a4);
  }

  return v9;
}

- (NSArray)assets
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)archivedAssets
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (CLSArchivedSurvey)archivedSurvey
{
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v3 = objc_opt_class();
  objc_msgSend_childrenOfClass_(self, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLSArchivedSurvey *)v8;
}

- (CLSArchivedHandoutAttachment)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSArchivedHandoutAttachment *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSURL *URL;
  id v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSArray *contextPath;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  NSString *contextSummary;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSString *contextCustomTypeName;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSString *title;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  NSString *bundleIdentifier;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSString *storeIdentifier;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  NSString *contentStoreIdentifier;
  const char *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  int type;
  uint64_t v51;
  uint64_t v52;
  NSString *v53;
  double v54;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)CLSArchivedHandoutAttachment;
  v6 = -[CLSObject initWithCoder:](&v56, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_type = objc_msgSend_decodeInt32ForKey_(v4, v5, (uint64_t)CFSTR("type"));
    v6->_shareType = objc_msgSend_decodeInt32ForKey_(v4, v7, (uint64_t)CFSTR("shareType"));
    v6->_permissionType = objc_msgSend_decodeInt32ForKey_(v4, v8, (uint64_t)CFSTR("permissionType"));
    v9 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, CFSTR("URL"));
    v11 = objc_claimAutoreleasedReturnValue();
    URL = v6->_URL;
    v6->_URL = (NSURL *)v11;

    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v17 = (void *)objc_msgSend_initWithObjects_(v13, v16, v14, v15, 0);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v17, CFSTR("contextPath"));
    v19 = objc_claimAutoreleasedReturnValue();
    contextPath = v6->_contextPath;
    v6->_contextPath = (NSArray *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, CFSTR("contextSummary"));
    v23 = objc_claimAutoreleasedReturnValue();
    contextSummary = v6->_contextSummary;
    v6->_contextSummary = (NSString *)v23;

    v25 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, CFSTR("contextCustomTypeName"));
    v27 = objc_claimAutoreleasedReturnValue();
    contextCustomTypeName = v6->_contextCustomTypeName;
    v6->_contextCustomTypeName = (NSString *)v27;

    v6->_contextSourceIsCatalog = objc_msgSend_decodeBoolForKey_(v4, v29, (uint64_t)CFSTR("contextSourceIsCatalog"));
    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, CFSTR("title"));
    v32 = objc_claimAutoreleasedReturnValue();
    title = v6->_title;
    v6->_title = (NSString *)v32;

    v34 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, CFSTR("bundleIdentifier"));
    v36 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v36;

    v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, CFSTR("storeIdentifier"));
    v40 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v6->_storeIdentifier;
    v6->_storeIdentifier = (NSString *)v40;

    v42 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, CFSTR("contentStoreIdentifier"));
    v44 = objc_claimAutoreleasedReturnValue();
    contentStoreIdentifier = v6->_contentStoreIdentifier;
    v6->_contentStoreIdentifier = (NSString *)v44;

    v6->_displayOrder = objc_msgSend_decodeIntegerForKey_(v4, v46, (uint64_t)CFSTR("displayOrder"));
    v6->_contextType = objc_msgSend_decodeIntegerForKey_(v4, v47, (uint64_t)CFSTR("contextType"));
    type = v6->_type;
    if (type != 2 && type != 4 && !objc_msgSend_length(v6->_bundleIdentifier, v48, v49))
    {
      objc_msgSend_firstObject(v6->_contextPath, v48, v51);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = v6->_bundleIdentifier;
      v6->_bundleIdentifier = (NSString *)v52;

    }
    objc_msgSend_decodeDoubleForKey_(v4, v48, (uint64_t)CFSTR("timeExpectation"));
    v6->_timeExpectation = v54;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CLSArchivedHandoutAttachment;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v20, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInt32_forKey_(v4, v5, self->_type, CFSTR("type"), v20.receiver, v20.super_class);
  objc_msgSend_encodeInt32_forKey_(v4, v6, self->_shareType, CFSTR("shareType"));
  objc_msgSend_encodeInt32_forKey_(v4, v7, self->_permissionType, CFSTR("permissionType"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_URL, CFSTR("URL"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_contextPath, CFSTR("contextPath"));
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)self->_contextSummary, CFSTR("contextSummary"));
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_contextCustomTypeName, CFSTR("contextCustomTypeName"));
  objc_msgSend_encodeBool_forKey_(v4, v12, self->_contextSourceIsCatalog, CFSTR("contextSourceIsCatalog"));
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)self->_title, CFSTR("title"));
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)self->_storeIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)self->_contentStoreIdentifier, CFSTR("contentStoreIdentifier"));
  objc_msgSend_encodeInteger_forKey_(v4, v17, self->_displayOrder, CFSTR("displayOrder"));
  objc_msgSend_encodeInteger_forKey_(v4, v18, self->_contextType, CFSTR("contextType"));
  objc_msgSend_encodeDouble_forKey_(v4, v19, (uint64_t)CFSTR("timeExpectation"), self->_timeExpectation);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setURL:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSURL *URL;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  id v18;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (unint64_t)v5;
  URL = self->_URL;
  v18 = (id)v8;
  if (v8 | (unint64_t)URL)
  {
    if (!v8
      || !URL
      || (objc_msgSend_absoluteString(URL, (const char *)v8, v9),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_absoluteString(v18, v12, v13),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend_caseInsensitiveCompare_(v11, v15, (uint64_t)v14),
          v14,
          v11,
          v16))
    {
      objc_storeStrong((id *)&self->_URL, a3);
      objc_msgSend_setModified_(self, v17, 1);
    }
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setTitle:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *title;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  title = self->_title;
  v12 = (id)v8;
  if (v8 | (unint64_t)title
    && (!v8 || !title || (objc_msgSend_isEqualToString_(title, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_title, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setBundleIdentifier:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  bundleIdentifier = self->_bundleIdentifier;
  v12 = (id)v8;
  if (v8 | (unint64_t)bundleIdentifier
    && (!v8 || !bundleIdentifier || (objc_msgSend_isEqualToString_(bundleIdentifier, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_bundleIdentifier, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setShareType:(int)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, *(uint64_t *)&a3);
  if (self->_shareType != a3)
  {
    self->_shareType = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (void)setContextPath:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *contextPath;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  contextPath = self->_contextPath;
  v12 = (id)v8;
  if (v8 | (unint64_t)contextPath
    && (!v8 || !contextPath || (objc_msgSend_isEqualToArray_(contextPath, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_contextPath, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setContextSummary:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *contextSummary;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  contextSummary = self->_contextSummary;
  v12 = (id)v8;
  if (v8 | (unint64_t)contextSummary
    && (!v8 || !contextSummary || (objc_msgSend_isEqualToString_(contextSummary, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_contextSummary, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setContextCustomTypeName:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *contextCustomTypeName;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  contextCustomTypeName = self->_contextCustomTypeName;
  v12 = (id)v8;
  if (v8 | (unint64_t)contextCustomTypeName
    && (!v8
     || !contextCustomTypeName
     || (objc_msgSend_isEqualToString_(contextCustomTypeName, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_contextCustomTypeName, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setContextSourceIsCatalog:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend_lock(self, a2, a3);
  if (self->_contextSourceIsCatalog != v3)
  {
    self->_contextSourceIsCatalog = v3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (void)setContextType:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_contextType != a3)
  {
    self->_contextType = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (void)setDisplayOrder:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_displayOrder != a3)
  {
    self->_displayOrder = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (void)setPermissionType:(int)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, *(uint64_t *)&a3);
  if (self->_permissionType != a3)
  {
    self->_permissionType = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (void)setStoreIdentifier:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *storeIdentifier;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  storeIdentifier = self->_storeIdentifier;
  v12 = (id)v8;
  if (v8 | (unint64_t)storeIdentifier
    && (!v8 || !storeIdentifier || (objc_msgSend_isEqualToString_(storeIdentifier, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_storeIdentifier, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setContentStoreIdentifier:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *contentStoreIdentifier;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  contentStoreIdentifier = self->_contentStoreIdentifier;
  v12 = (id)v8;
  if (v8 | (unint64_t)contentStoreIdentifier
    && (!v8
     || !contentStoreIdentifier
     || (objc_msgSend_isEqualToString_(contentStoreIdentifier, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_contentStoreIdentifier, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setTimeExpectation:(double)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_lock(self, a2, v3);
  if (self->_timeExpectation != a3)
  {
    self->_timeExpectation = a3;
    objc_msgSend_setModified_(self, v6, 1);
  }
  objc_msgSend_unlock(self, v6, v7);
}

- (int)type
{
  return self->_type;
}

- (int)shareType
{
  return self->_shareType;
}

- (int)permissionType
{
  return self->_permissionType;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (int64_t)displayOrder
{
  return self->_displayOrder;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSArray)contextPath
{
  return self->_contextPath;
}

- (NSString)contextSummary
{
  return self->_contextSummary;
}

- (NSString)contextCustomTypeName
{
  return self->_contextCustomTypeName;
}

- (BOOL)contextSourceIsCatalog
{
  return self->_contextSourceIsCatalog;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)contentStoreIdentifier
{
  return self->_contentStoreIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (double)timeExpectation
{
  return self->_timeExpectation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_contentStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contextCustomTypeName, 0);
  objc_storeStrong((id *)&self->_contextSummary, 0);
  objc_storeStrong((id *)&self->_contextPath, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
