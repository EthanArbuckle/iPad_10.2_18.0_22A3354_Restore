@implementation MCWebClipPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.webClip.managed"));
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("WEBCLIP_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("WEBCLIP_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCWebClipPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCWebClipPayload *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSURL *URL;
  uint64_t v15;
  id v16;
  NSString *label;
  uint64_t v18;
  NSNumber *fullScreenNum;
  uint64_t v20;
  NSString *savedIdentifier;
  uint64_t v22;
  NSNumber *isRemovableNum;
  NSNumber *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v34;
  NSURL *v35;
  uint64_t v36;
  NSString *v37;
  NSData *v38;
  uint64_t v39;
  const void *v40;
  const void *ImageAtIndex;
  uint64_t v42;
  NSNumber *v43;
  NSNumber *v44;
  BOOL v45;
  NSData *iconData;
  NSData *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSNumber *precomposedNum;
  uint64_t v59;
  NSNumber *v60;
  uint64_t v61;
  NSNumber *v62;
  uint64_t v63;
  NSString *v64;
  uint64_t v65;
  NSString *v66;
  uint64_t v67;
  NSNumber *ignoreManifestScopeNum;
  uint64_t v69;
  NSString *contentMode;
  uint64_t v71;
  NSString *targetApplicationBundleIdentifier;
  void *v73;
  NSObject *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  objc_super v93;
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  id v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v93.receiver = self;
  v93.super_class = (Class)MCWebClipPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v93, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_20;
  if ((objc_msgSend(v9, "isStub") & 1) != 0)
  {
    v83 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("URL"), 0, &v83);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v83;
    if (!v12)
    {
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
        v13 = objc_claimAutoreleasedReturnValue();
        URL = v10->_URL;
        v10->_URL = (NSURL *)v13;

      }
      v82 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Label"), 0, &v82);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v82;
      label = v10->_label;
      v10->_label = (NSString *)v15;

      if (!v16)
      {
        v81 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("FullScreen"), 0, &v81);
        v18 = objc_claimAutoreleasedReturnValue();
        v16 = v81;
        fullScreenNum = v10->_fullScreenNum;
        v10->_fullScreenNum = (NSNumber *)v18;

        if (!v16)
        {
          v10->_fullScreen = -[NSNumber BOOLValue](v10->_fullScreenNum, "BOOLValue");
          v80 = 0;
          objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("SavedIdentifier"), 0, &v80);
          v20 = objc_claimAutoreleasedReturnValue();
          v16 = v80;
          savedIdentifier = v10->_savedIdentifier;
          v10->_savedIdentifier = (NSString *)v20;

          if (!v16)
          {
            v79 = 0;
            objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("IsRemovable"), 0, &v79);
            v22 = objc_claimAutoreleasedReturnValue();
            v16 = v79;
            isRemovableNum = v10->_isRemovableNum;
            v10->_isRemovableNum = (NSNumber *)v22;

            if (!v16)
            {
              v24 = v10->_isRemovableNum;
              v25 = !v24 || -[NSNumber BOOLValue](v24, "BOOLValue");
              v10->_isRemovable = v25;
              v78 = 0;
              objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("IgnoreManifestScope"), 0, &v78);
              v67 = objc_claimAutoreleasedReturnValue();
              v16 = v78;
              ignoreManifestScopeNum = v10->_ignoreManifestScopeNum;
              v10->_ignoreManifestScopeNum = (NSNumber *)v67;

              if (!v16)
              {
                v10->_ignoreManifestScope = -[NSNumber BOOLValue](v10->_ignoreManifestScopeNum, "BOOLValue");
                v77 = 0;
                objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ContentMode"), 0, &v77);
                v69 = objc_claimAutoreleasedReturnValue();
                v16 = v77;
                contentMode = v10->_contentMode;
                v10->_contentMode = (NSString *)v69;

                if (!v16)
                {
                  v76 = 0;
                  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("TargetApplicationBundleIdentifier"), 0, &v76);
                  v71 = objc_claimAutoreleasedReturnValue();
                  v16 = v76;
                  targetApplicationBundleIdentifier = v10->_targetApplicationBundleIdentifier;
                  v10->_targetApplicationBundleIdentifier = (NSString *)v71;

                  if (!v16)
                    goto LABEL_46;
                }
              }
            }
          }
        }
      }
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v92 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("URL"), 1, &v92);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v92;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v10->_URL;
    v10->_URL = (NSURL *)v34;

    v91 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Label"), 1, &v91);
    v36 = objc_claimAutoreleasedReturnValue();
    v16 = v91;
    v37 = v10->_label;
    v10->_label = (NSString *)v36;

    if (v16)
      goto LABEL_14;
    v90 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Icon"), 0, &v90);
    v38 = (NSData *)objc_claimAutoreleasedReturnValue();
    v16 = v90;
    if (v16)
    {
LABEL_23:

      goto LABEL_14;
    }
    if (v38)
    {
      v39 = MCCGImageSourceCreateWithData((uint64_t)v38, 0);
      if (v39)
      {
        v40 = (const void *)v39;
        if (MCCGImageSourceGetCount(v39))
        {
          ImageAtIndex = (const void *)MCCGImageSourceCreateImageAtIndex((uint64_t)v40, 0, 0);
          if (ImageAtIndex)
          {
            CFRelease(ImageAtIndex);
            CFRelease(v40);
            objc_storeStrong((id *)&v10->_iconData, v38);
            goto LABEL_29;
          }
        }
        CFRelease(v40);
      }
      iconData = v10->_iconData;
      v10->_iconData = v38;
      v47 = v38;

      v48 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), v49, v50, v51, v52, v53, v54, v55, CFSTR("Icon"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1003, v56, CFSTR("MCFatalError"));
      v16 = (id)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_20;
      goto LABEL_15;
    }
LABEL_29:
    v89 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("IsRemovable"), 0, &v89);
    v42 = objc_claimAutoreleasedReturnValue();
    v16 = v89;
    v43 = v10->_isRemovableNum;
    v10->_isRemovableNum = (NSNumber *)v42;

    if (!v16)
    {
      v44 = v10->_isRemovableNum;
      v45 = !v44 || -[NSNumber BOOLValue](v44, "BOOLValue");
      v10->_isRemovable = v45;
      v88 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Precomposed"), 0, &v88);
      v57 = objc_claimAutoreleasedReturnValue();
      v16 = v88;
      precomposedNum = v10->_precomposedNum;
      v10->_precomposedNum = (NSNumber *)v57;

      if (!v16)
      {
        v10->_precomposed = -[NSNumber BOOLValue](v10->_precomposedNum, "BOOLValue");
        v87 = 0;
        objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("FullScreen"), 0, &v87);
        v59 = objc_claimAutoreleasedReturnValue();
        v16 = v87;
        v60 = v10->_fullScreenNum;
        v10->_fullScreenNum = (NSNumber *)v59;

        if (!v16)
        {
          v10->_fullScreen = -[NSNumber BOOLValue](v10->_fullScreenNum, "BOOLValue");
          v86 = 0;
          objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("IgnoreManifestScope"), 0, &v86);
          v61 = objc_claimAutoreleasedReturnValue();
          v16 = v86;
          v62 = v10->_ignoreManifestScopeNum;
          v10->_ignoreManifestScopeNum = (NSNumber *)v61;

          if (!v16)
          {
            v10->_ignoreManifestScope = -[NSNumber BOOLValue](v10->_ignoreManifestScopeNum, "BOOLValue");
            v85 = 0;
            objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("ContentMode"), 0, &v85);
            v63 = objc_claimAutoreleasedReturnValue();
            v16 = v85;
            v64 = v10->_contentMode;
            v10->_contentMode = (NSString *)v63;

            if (!v16)
            {
              v84 = 0;
              objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("TargetApplicationBundleIdentifier"), 0, &v84);
              v65 = objc_claimAutoreleasedReturnValue();
              v16 = v84;
              v66 = v10->_targetApplicationBundleIdentifier;
              v10->_targetApplicationBundleIdentifier = (NSString *)v65;

              if (!v16)
              {

LABEL_46:
                if (objc_msgSend(v8, "count"))
                {
                  v73 = (void *)_MCLogObjects;
                  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
                  {
                    v74 = v73;
                    -[MCPayload friendlyName](v10, "friendlyName");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v95 = v75;
                    v96 = 2114;
                    v97 = v8;
                    _os_log_impl(&dword_19ECC4000, v74, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);

                  }
                }
                goto LABEL_20;
              }
            }
          }
        }
      }
    }
    goto LABEL_23;
  }
LABEL_13:
  v16 = v12;
LABEL_14:

LABEL_15:
  -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (a5)
    *a5 = objc_retainAutorelease(v26);
  v28 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v29 = v28;
    v30 = (void *)objc_opt_class();
    v31 = v30;
    objc_msgSend(v27, "MCVerboseDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v95 = v30;
    v96 = 2114;
    v97 = v32;
    _os_log_impl(&dword_19ECC4000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

  }
  v10 = 0;
LABEL_20:

  return v10;
}

- (id)stubDictionary
{
  void *v3;
  NSURL *URL;
  void *v5;
  void *v6;
  NSString *savedIdentifier;
  void *v8;
  void *v9;
  NSString *contentMode;
  NSString *targetApplicationBundleIdentifier;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MCWebClipPayload;
  -[MCPayload stubDictionary](&v13, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  URL = self->_URL;
  if (URL)
  {
    -[NSURL absoluteString](URL, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", v5, CFSTR("URL"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fullScreen);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", v6, CFSTR("FullScreen"));

  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_label, CFSTR("Label"));
  savedIdentifier = self->_savedIdentifier;
  if (savedIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", savedIdentifier, CFSTR("SavedIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCWebClipPayload isRemovable](self, "isRemovable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("IsRemovable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCWebClipPayload ignoreManifestScope](self, "ignoreManifestScope"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("IgnoreManifestScope"));

  contentMode = self->_contentMode;
  if (contentMode)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", contentMode, CFSTR("ContentMode"));
  targetApplicationBundleIdentifier = self->_targetApplicationBundleIdentifier;
  if (targetApplicationBundleIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", targetApplicationBundleIdentifier, CFSTR("TargetApplicationBundleIdentifier"));
  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v15.receiver = self;
  v15.super_class = (Class)MCWebClipPayload;
  -[MCPayload verboseDescription](&v15, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCPayload profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isStub");

  if ((v7 & 1) == 0)
  {
    if (self->_URL)
      objc_msgSend(v5, "appendFormat:", CFSTR("URL         : %@\n"), self->_URL);
    if (self->_label)
      objc_msgSend(v5, "appendFormat:", CFSTR("Label       : %@\n"), self->_label);
    if (self->_iconData)
      objc_msgSend(v5, "appendFormat:", CFSTR("Icon        : Present\n"));
    MCStringForBool(self->_isRemovable);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Removable   : %@\n"), v8);

    MCStringForBool(self->_precomposed);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Precomposed : %@\n"), v9);

    MCStringForBool(self->_fullScreen);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Full screen : %@\n"), v10);

    MCStringForBool(self->_ignoreManifestScope);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Ignore scope: %@\n"), v11);

    if (self->_contentMode)
      objc_msgSend(v5, "appendFormat:", CFSTR("Content mode: %@\n"), self->_contentMode);
    if (self->_targetApplicationBundleIdentifier)
      objc_msgSend(v5, "appendFormat:", CFSTR("Target App: %@\n"), self->_targetApplicationBundleIdentifier);
    -[MCWebClipPayload savedIdentifier](self, "savedIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[MCWebClipPayload savedIdentifier](self, "savedIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("Identifier  : %@\n"), v13);

    }
  }
  return v5;
}

- (id)title
{
  return MCLocalizedString(CFSTR("WEBCLIP_HEADING"));
}

- (id)subtitle1Label
{
  return MCLocalizedString(CFSTR("WEBCLIP_URL_COLON"));
}

- (id)subtitle1Description
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[MCWebClipPayload URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    MCLocalizedString(CFSTR("WEBCLIP_URL_MISSING"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)subtitle2Label
{
  return MCLocalizedString(CFSTR("WEBCLIP_LABEL_COLON"));
}

- (id)subtitle2Description
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[MCWebClipPayload label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    MCLocalizedString(CFSTR("WEBCLIP_LABEL_MISSING"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  MCKeyValue *v4;
  NSString *label;
  void *v6;
  MCKeyValue *v7;
  MCKeyValue *v8;
  void *v9;
  void *v10;
  MCKeyValue *v11;
  MCKeyValue *v12;
  void *v13;
  void *v14;
  MCKeyValue *v15;
  MCKeyValue *v16;
  void *v17;
  void *v18;
  MCKeyValue *v19;
  MCKeyValue *v20;
  void *v21;
  void *v22;
  MCKeyValue *v23;
  MCKeyValue *v24;
  NSString *contentMode;
  void *v26;
  MCKeyValue *v27;
  MCKeyValue *v28;
  NSString *targetApplicationBundleIdentifier;
  void *v30;
  MCKeyValue *v31;
  void *v32;
  void *v33;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (self->_label)
  {
    v4 = [MCKeyValue alloc];
    label = self->_label;
    MCLocalizedString(CFSTR("WEB_CLIP_LABEL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MCKeyValue initWithLocalizedString:localizedKey:](v4, "initWithLocalizedString:localizedKey:", label, v6);

    objc_msgSend(v3, "addObject:", v7);
  }
  if (self->_URL)
  {
    v8 = [MCKeyValue alloc];
    -[NSURL absoluteString](self->_URL, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("URL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MCKeyValue initWithLocalizedString:localizedKey:](v8, "initWithLocalizedString:localizedKey:", v9, v10);

    objc_msgSend(v3, "addObject:", v11);
  }
  if (self->_isRemovableNum)
  {
    v12 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_isRemovableNum, "BOOLValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WEB_CLIP_REMOVABLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MCKeyValue initWithLocalizedString:localizedKey:](v12, "initWithLocalizedString:localizedKey:", v13, v14);

    objc_msgSend(v3, "addObject:", v15);
  }
  if (self->_fullScreenNum)
  {
    v16 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_fullScreenNum, "BOOLValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WEB_CLIP_FULLSCREEN"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MCKeyValue initWithLocalizedString:localizedKey:](v16, "initWithLocalizedString:localizedKey:", v17, v18);

    objc_msgSend(v3, "addObject:", v19);
  }
  if (-[NSNumber BOOLValue](self->_ignoreManifestScopeNum, "BOOLValue"))
  {
    v20 = [MCKeyValue alloc];
    MCLocalizedStringForBool(-[NSNumber BOOLValue](self->_ignoreManifestScopeNum, "BOOLValue"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("WEB_CLIP_IGNORE_MANIFEST_SCOPE"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MCKeyValue initWithLocalizedString:localizedKey:](v20, "initWithLocalizedString:localizedKey:", v21, v22);

    objc_msgSend(v3, "addObject:", v23);
  }
  if (self->_contentMode)
  {
    v24 = [MCKeyValue alloc];
    contentMode = self->_contentMode;
    MCLocalizedString(CFSTR("WEB_CLIP_CONTENT_MODE"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[MCKeyValue initWithLocalizedString:localizedKey:](v24, "initWithLocalizedString:localizedKey:", contentMode, v26);

    objc_msgSend(v3, "addObject:", v27);
  }
  if (self->_targetApplicationBundleIdentifier)
  {
    v28 = [MCKeyValue alloc];
    targetApplicationBundleIdentifier = self->_targetApplicationBundleIdentifier;
    MCLocalizedString(CFSTR("WEB_CLIP_TARGET_APP_BUNDLE_IDENTIFIER"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[MCKeyValue initWithLocalizedString:localizedKey:](v28, "initWithLocalizedString:localizedKey:", targetApplicationBundleIdentifier, v30);

    objc_msgSend(v3, "addObject:", v31);
  }
  if (objc_msgSend(v3, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)label
{
  return self->_label;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (BOOL)isRemovable
{
  return self->_isRemovable;
}

- (BOOL)precomposed
{
  return self->_precomposed;
}

- (BOOL)fullScreen
{
  return self->_fullScreen;
}

- (BOOL)ignoreManifestScope
{
  return self->_ignoreManifestScope;
}

- (NSString)contentMode
{
  return self->_contentMode;
}

- (NSString)targetApplicationBundleIdentifier
{
  return self->_targetApplicationBundleIdentifier;
}

- (void)setTargetApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_targetApplicationBundleIdentifier, a3);
}

- (NSString)savedIdentifier
{
  return self->_savedIdentifier;
}

- (void)setSavedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_savedIdentifier, a3);
}

- (NSNumber)isRemovableNum
{
  return self->_isRemovableNum;
}

- (NSNumber)precomposedNum
{
  return self->_precomposedNum;
}

- (NSNumber)fullScreenNum
{
  return self->_fullScreenNum;
}

- (NSNumber)ignoreManifestScopeNum
{
  return self->_ignoreManifestScopeNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreManifestScopeNum, 0);
  objc_storeStrong((id *)&self->_fullScreenNum, 0);
  objc_storeStrong((id *)&self->_precomposedNum, 0);
  objc_storeStrong((id *)&self->_isRemovableNum, 0);
  objc_storeStrong((id *)&self->_savedIdentifier, 0);
  objc_storeStrong((id *)&self->_targetApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contentMode, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
