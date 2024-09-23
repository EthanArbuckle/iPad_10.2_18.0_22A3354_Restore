@implementation CLSFavorite

- (CLSFavorite)initWithTitle:(id)a3 contextIdentifierPath:(id)a4 URL:(id)a5 type:(int)a6 contextType:(int64_t)a7 andBundleIdentifier:(id)a8 contentStoreIdentifier:(id)a9 contextSummary:(id)a10 contextCustomTypeName:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  CLSFavorite *v23;
  uint64_t v24;
  NSString *title;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSString *bundleIdentifier;
  NSString *storeIdentifier;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSString *contentStoreIdentifier;
  id v38;
  id v39;
  id v40;

  v40 = a3;
  v39 = a4;
  v38 = a5;
  v15 = a8;
  v16 = a9;
  v17 = a10;
  v18 = a11;
  v23 = (CLSFavorite *)objc_msgSend__init(self, v19, v20);
  if (v23)
  {
    v24 = objc_msgSend_copy(v40, v21, v22);
    title = v23->_title;
    v23->_title = (NSString *)v24;

    objc_storeStrong((id *)&v23->_contextIdentifierPath, a4);
    objc_storeStrong((id *)&v23->_contextSummary, a10);
    objc_storeStrong((id *)&v23->_contextCustomTypeName, a11);
    objc_storeStrong((id *)&v23->_URL, a5);
    v28 = objc_msgSend_copy(v15, v26, v27);
    bundleIdentifier = v23->_bundleIdentifier;
    v23->_bundleIdentifier = (NSString *)v28;

    v23->_type = a6;
    v23->_contextType = a7;
    storeIdentifier = v23->_storeIdentifier;
    v23->_storeIdentifier = (NSString *)&stru_1E974C8A0;

    v33 = objc_msgSend_copy(v16, v31, v32);
    contentStoreIdentifier = v23->_contentStoreIdentifier;
    v23->_contentStoreIdentifier = (NSString *)v33;

  }
  return v23;
}

- (CLSFavorite)initWithTitle:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  CLSFavorite *v30;

  v6 = a4;
  v7 = a3;
  objc_msgSend_identifierPath(v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_universalLinkURL(v6, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_type(v6, v14, v15);
  objc_msgSend_appIdentifier(v6, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentStoreIdentifier(v6, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_summary(v6, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_customTypeName(v6, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (CLSFavorite *)objc_msgSend_initWithTitle_contextIdentifierPath_URL_type_contextType_andBundleIdentifier_contentStoreIdentifier_contextSummary_contextCustomTypeName_(self, v29, (uint64_t)v7, v10, v13, 0, v16, v19, v22, v25, v28);
  return v30;
}

- (CLSFavorite)initWithTitle:(id)a3 URL:(id)a4 andBundleIdentifier:(id)a5
{
  return (CLSFavorite *)objc_msgSend_initWithTitle_contextIdentifierPath_URL_type_contextType_andBundleIdentifier_contentStoreIdentifier_contextSummary_contextCustomTypeName_(self, a2, (uint64_t)a3, 0, a4, 1, 0, a5, 0, 0, 0);
}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  void *v39;
  const char *v40;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CLSFavorite;
  v5 = -[CLSObject validateObject:](&v42, sel_validateObject_);
  if (v5)
  {
    if ((unint64_t)objc_msgSend_length(self->_title, v6, v7) >= 0x101)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (void *)MEMORY[0x1E0CB34D0];
      v12 = objc_opt_class();
      objc_msgSend_bundleForClass_(v11, v13, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v14, v15, (uint64_t)CFSTR("ERROR_DESCRIPTION_FAVORITE_TITLE_TOO_LONG_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v10, v17, (uint64_t)v16, 256);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v19, (uint64_t)a3, 2, self, v18);
LABEL_15:

      LOBYTE(v5) = 0;
      return v5;
    }
    if (!objc_msgSend_length(self->_title, v8, v9))
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v27 = (void *)MEMORY[0x1E0CB34D0];
      v28 = objc_opt_class();
      objc_msgSend_bundleForClass_(v27, v29, v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v18, v30, (uint64_t)CFSTR("ERROR_DESCRIPTION_FAVORITE_NO_TITLE"), &stru_1E974C8A0, CFSTR("ClassKit"));
      goto LABEL_14;
    }
    if (!objc_msgSend_length(self->_bundleIdentifier, v20, v21))
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v31 = (void *)MEMORY[0x1E0CB34D0];
      v32 = objc_opt_class();
      objc_msgSend_bundleForClass_(v31, v33, v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v18, v34, (uint64_t)CFSTR("ERROR_DESCRIPTION_FAVORITE_NO_BUNDLE_ID"), &stru_1E974C8A0, CFSTR("ClassKit"));
      goto LABEL_14;
    }
    if (self->_type)
    {
      if (!self->_URL)
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v23 = (void *)MEMORY[0x1E0CB34D0];
        v24 = objc_opt_class();
        objc_msgSend_bundleForClass_(v23, v25, v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v18, v26, (uint64_t)CFSTR("ERROR_DESCRIPTION_FAVORITE_NO_URL"), &stru_1E974C8A0, CFSTR("ClassKit"));
LABEL_14:
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_cls_assignError_code_errorObject_description_(v22, v40, (uint64_t)a3, 2, self, v39);

        goto LABEL_15;
      }
    }
    else if (!self->_contextIdentifierPath)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v35 = (void *)MEMORY[0x1E0CB34D0];
      v36 = objc_opt_class();
      objc_msgSend_bundleForClass_(v35, v37, v36);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v18, v38, (uint64_t)CFSTR("ERROR_DESCRIPTION_FAVORITE_NO_CONTEXT_PATH"), &stru_1E974C8A0, CFSTR("ClassKit"));
      goto LABEL_14;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (NSString)title
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_title;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
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

- (NSString)storeIdentifier
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_storeIdentifier;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
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

- (CLSFavorite)initWithCoder:(id)a3
{
  id v4;
  CLSFavorite *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSArray *contextIdentifierPath;
  const char *v14;
  uint64_t v15;
  NSString *contextSummary;
  const char *v17;
  uint64_t v18;
  NSString *contextCustomTypeName;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  NSURL *URL;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSString *title;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSString *bundleIdentifier;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  NSString *storeIdentifier;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSString *contentStoreIdentifier;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CLSFavorite;
  v5 = -[CLSObject initWithCoder:](&v43, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v10, CFSTR("contextIdentifierPath"));
    v12 = objc_claimAutoreleasedReturnValue();
    contextIdentifierPath = v5->_contextIdentifierPath;
    v5->_contextIdentifierPath = (NSArray *)v12;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v10, CFSTR("contextSummary"));
    v15 = objc_claimAutoreleasedReturnValue();
    contextSummary = v5->_contextSummary;
    v5->_contextSummary = (NSString *)v15;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v10, CFSTR("contextCustomTypeName"));
    v18 = objc_claimAutoreleasedReturnValue();
    contextCustomTypeName = v5->_contextCustomTypeName;
    v5->_contextCustomTypeName = (NSString *)v18;

    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, CFSTR("URL"));
    v22 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v22;

    v24 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, CFSTR("title"));
    v26 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v26;

    v5->_type = objc_msgSend_decodeInt32ForKey_(v4, v28, (uint64_t)CFSTR("type"));
    v5->_contextType = (int)objc_msgSend_decodeInt32ForKey_(v4, v29, (uint64_t)CFSTR("contextType"));
    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, CFSTR("bundleIdentifier"));
    v32 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v32;

    v34 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, CFSTR("storeIdentifier"));
    v36 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v36;

    v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, CFSTR("contentStoreIdentifier"));
    v40 = objc_claimAutoreleasedReturnValue();
    contentStoreIdentifier = v5->_contentStoreIdentifier;
    v5->_contentStoreIdentifier = (NSString *)v40;

  }
  return v5;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLSFavorite;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_contextIdentifierPath, CFSTR("contextIdentifierPath"), v15.receiver, v15.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_URL, CFSTR("URL"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_contextSummary, CFSTR("contextSummary"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_contextCustomTypeName, CFSTR("contextCustomTypeName"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_title, CFSTR("title"));
  objc_msgSend_encodeInteger_forKey_(v4, v10, self->_type, CFSTR("type"));
  objc_msgSend_encodeInteger_forKey_(v4, v11, self->_contextType, CFSTR("contextType"));
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)self->_storeIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)self->_contentStoreIdentifier, CFSTR("contentStoreIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  void *v5;
  NSArray *contextIdentifierPath;
  void *v7;
  const char *v8;
  NSString *contextSummary;
  NSString *contextCustomTypeName;
  NSURL *URL;
  void *v12;
  const char *v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  NSString *bundleIdentifier;
  const char *v20;
  void *v21;
  NSString *contentStoreIdentifier;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CLSFavorite;
  -[CLSObject dictionaryRepresentation](&v24, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  contextIdentifierPath = self->_contextIdentifierPath;
  if (contextIdentifierPath)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)contextIdentifierPath, CFSTR("contextIdentifierPath"));
    DefaultNameFromContextType(self->_contextType);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v8, (uint64_t)v7, CFSTR("contextType"));

  }
  contextSummary = self->_contextSummary;
  if (contextSummary)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)contextSummary, CFSTR("contextSummary"));
  contextCustomTypeName = self->_contextCustomTypeName;
  if (contextCustomTypeName)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v4, (uint64_t)contextCustomTypeName, CFSTR("contextCustomTypeName"));
  URL = self->_URL;
  if (URL)
  {
    objc_msgSend_absoluteString(URL, v4, (uint64_t)contextCustomTypeName);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v13, (uint64_t)v12, CFSTR("URL"));

  }
  objc_msgSend_title(self, v4, (uint64_t)contextCustomTypeName);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v14, (uint64_t)v15, CFSTR("title"));
  NSStringFromFavoriteType(self->_type, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v17, (uint64_t)v16, CFSTR("type"));

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v18, (uint64_t)bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend_storeIdentifier(self, v18, (uint64_t)bundleIdentifier);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v20, (uint64_t)v21, CFSTR("storeIdentifier"));
  contentStoreIdentifier = self->_contentStoreIdentifier;
  if (contentStoreIdentifier)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v20, (uint64_t)contentStoreIdentifier, CFSTR("contentStoreIdentifier"));

  return v5;
}

- (NSArray)contextIdentifierPath
{
  return self->_contextIdentifierPath;
}

- (void)setContextIdentifierPath:(id)a3
{
  objc_storeStrong((id *)&self->_contextIdentifierPath, a3);
}

- (NSString)contextSummary
{
  return self->_contextSummary;
}

- (void)setContextSummary:(id)a3
{
  objc_storeStrong((id *)&self->_contextSummary, a3);
}

- (NSString)contextCustomTypeName
{
  return self->_contextCustomTypeName;
}

- (void)setContextCustomTypeName:(id)a3
{
  objc_storeStrong((id *)&self->_contextCustomTypeName, a3);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int64_t)a3
{
  self->_contextType = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)contentStoreIdentifier
{
  return self->_contentStoreIdentifier;
}

- (void)setContentStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_contextCustomTypeName, 0);
  objc_storeStrong((id *)&self->_contextSummary, 0);
  objc_storeStrong((id *)&self->_contextIdentifierPath, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
