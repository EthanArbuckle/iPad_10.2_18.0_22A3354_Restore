@implementation UNNotificationAttachment

+ (UNNotificationAttachment)attachmentWithIdentifier:(NSString *)identifier URL:(NSURL *)URL options:(NSDictionary *)options error:(NSError *)error
{
  return (UNNotificationAttachment *)objc_msgSend(a1, "attachmentWithIdentifier:URL:options:userInfo:error:", identifier, URL, options, 0, error);
}

+ (UNNotificationAttachment)attachmentWithIdentifier:(id)a3 URL:(id)a4 options:(id)a5 userInfo:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  UNMutableNotificationAttachmentOptions *v28;
  void *v29;
  char v30;
  uint64_t v31;
  objc_class *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  objc_class *v44;
  void *v45;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v14, "bs_safeStringForKey:", CFSTR("typeHint"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(v13, "pathExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17
      || (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v17),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v18, "identifier"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v18,
          !v16))
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  v19 = UNNotificationAttachmentFamilyFromTypeIdentifier(v16);
  if (v19)
  {
    v20 = v19;
    objc_msgSend(v15, "objectForKey:", CFSTR("data"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:URL:type:options:userInfo:", v12, v13, v16, 0, v15);
      goto LABEL_27;
    }
    v44 = (objc_class *)a1;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "attributesOfItemAtPath:error:", v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v25;
    objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0CB2AF0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = UNNotificationAttachmentFamilyMaximumSize(v20);
    if (objc_msgSend(v26, "unsignedLongValue") > v27)
    {
      if (a7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "un_errorWithUNErrorCode:userInfo:", 102, 0);
        v22 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
      v39 = v45;
LABEL_26:

      goto LABEL_27;
    }
    v43 = v26;
    v28 = objc_alloc_init(UNMutableNotificationAttachmentOptions);
    objc_msgSend(v14, "bs_safeNumberForKey:", CFSTR("hidden"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    if ((v30 & 1) != 0)
    {
      v31 = 1;
      v32 = v44;
    }
    else
    {
      objc_msgSend(v14, "bs_safeNumberForKey:", CFSTR("thumbnailHidden"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "BOOLValue");

      v32 = v44;
      if (!v34)
      {
LABEL_20:
        objc_msgSend(v14, "bs_safeDictionaryForKey:", CFSTR("thumbnailClippingRect"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bs_safeDictionaryForKey:", CFSTR("thumbnailTime"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v36)
        {
          v38 = v36;
        }
        else
        {
          objc_msgSend(v14, "bs_safeNumberForKey:", CFSTR("thumbnailTime"));
          v38 = (id)objc_claimAutoreleasedReturnValue();
        }
        v40 = v38;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "bs_setSafeObject:forKey:", v35, CFSTR("thumbnailClippingRect"));
        objc_msgSend(v41, "bs_setSafeObject:forKey:", v40, CFSTR("thumbnailTime"));
        -[UNMutableNotificationAttachmentOptions setThumbnailGeneratorUserInfo:](v28, "setThumbnailGeneratorUserInfo:", v41);
        v22 = (void *)objc_msgSend([v32 alloc], "initWithIdentifier:URL:type:options:userInfo:", v12, v13, v16, v28, v15);

        v39 = v45;
        v26 = v43;
        goto LABEL_26;
      }
      v31 = 2;
    }
    -[UNMutableNotificationAttachmentOptions setDisplayLocation:](v28, "setDisplayLocation:", v31);
    goto LABEL_20;
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "un_errorWithUNErrorCode:userInfo:", 101, 0);
    v22 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_27:

  return (UNNotificationAttachment *)v22;
}

- (UNNotificationAttachment)init
{
  -[UNNotificationAttachment doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UNNotificationAttachment)initWithIdentifier:(id)a3 URL:(id)a4 type:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UNNotificationAttachment *v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *identifier;
  uint64_t v19;
  NSString *v20;
  void *v21;
  void *v22;
  NSURL *v23;
  NSURL *URL;
  void *v25;
  void *v26;
  NSString *v27;
  NSString *type;
  uint64_t v29;
  UNNotificationAttachmentOptions *options;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)UNNotificationAttachment;
  v14 = -[UNNotificationAttachment init](&v32, sel_init);
  if (v14)
  {
    v15 = (void *)objc_msgSend(v10, "copy");
    v16 = v15;
    if (v15)
    {
      v17 = v15;
      identifier = v14->_identifier;
      v14->_identifier = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(identifier, "UUIDString");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v14->_identifier;
      v14->_identifier = (NSString *)v19;

    }
    v21 = (void *)objc_msgSend(v11, "copy");
    v22 = v21;
    if (v21)
      v23 = v21;
    else
      v23 = (NSURL *)objc_alloc_init(MEMORY[0x1E0C99E98]);
    URL = v14->_URL;
    v14->_URL = v23;

    v25 = (void *)objc_msgSend(v12, "copy");
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    type = v14->_type;
    v14->_type = v27;

    v29 = objc_msgSend(v13, "copy");
    options = v14->_options;
    v14->_options = (UNNotificationAttachmentOptions *)v29;

  }
  return v14;
}

- (UNNotificationAttachment)initWithIdentifier:(id)a3 family:(unint64_t)a4 URL:(id)a5 type:(id)a6 options:(id)a7
{
  return -[UNNotificationAttachment initWithIdentifier:URL:type:options:](self, "initWithIdentifier:URL:type:options:", a3, a5, a6, a7);
}

- (UNNotificationAttachment)initWithIdentifier:(id)a3 URL:(id)a4 type:(id)a5 options:(id)a6 userInfo:(id)a7
{
  id v12;
  UNNotificationAttachment *v13;
  uint64_t v14;
  NSDictionary *userInfo;

  v12 = a7;
  v13 = -[UNNotificationAttachment initWithIdentifier:URL:type:options:](self, "initWithIdentifier:URL:type:options:", a3, a4, a5, a6);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    userInfo = v13->_userInfo;
    v13->_userInfo = (NSDictionary *)v14;

  }
  return v13;
}

- (unint64_t)family
{
  void *v2;
  unint64_t v3;

  -[UNNotificationAttachment type](self, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UNNotificationAttachmentFamilyFromTypeIdentifier(v2);

  return v3;
}

- (void)_withSecurityScopeLock:(id)a3
{
  os_unfair_lock_s *p_securityScopeLock;
  void (**v4)(_QWORD);

  p_securityScopeLock = &self->_securityScopeLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_securityScopeLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_securityScopeLock);
}

- (void)addSecurityScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  -[UNNotificationAttachment URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__UNNotificationAttachment_addSecurityScope___block_invoke;
    v7[3] = &unk_1E57EFAC8;
    v7[4] = self;
    v8 = v6;
    v9 = v4;
    -[UNNotificationAttachment _withSecurityScopeLock:](self, "_withSecurityScopeLock:", v7);

  }
}

void __45__UNNotificationAttachment_addSecurityScope___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = -[UNSecurityScopedURL initFileURLWithPath:sandboxExtensionClass:]([UNSecurityScopedURL alloc], "initFileURLWithPath:sandboxExtensionClass:", a1[5], a1[6]);
  v3 = a1[4];
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (id)_encodableURL
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  -[UNNotificationAttachment URL](self, "URL");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__UNNotificationAttachment__encodableURL__block_invoke;
  v5[3] = &unk_1E57EFDA0;
  v5[4] = self;
  v5[5] = &v6;
  -[UNNotificationAttachment _withSecurityScopeLock:](self, "_withSecurityScopeLock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__UNNotificationAttachment__encodableURL__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v1)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v1);
}

- (void)removeSecurityScope
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__UNNotificationAttachment_removeSecurityScope__block_invoke;
  v2[3] = &unk_1E57EFDC8;
  v2[4] = self;
  -[UNNotificationAttachment _withSecurityScopeLock:](self, "_withSecurityScopeLock:", v2);
}

void __47__UNNotificationAttachment_removeSecurityScope__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void)enterSecurityScope
{
  id v2;

  -[UNNotificationAttachment URL](self, "URL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAccessingSecurityScopedResource");

}

- (void)leaveSecurityScope
{
  id v2;

  -[UNNotificationAttachment URL](self, "URL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAccessingSecurityScopedResource");

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNNotificationAttachment identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationAttachment URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationAttachment type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationAttachment options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@, URL: %@, type: %@, options: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[UNNotificationAttachment identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UNNotificationAttachment URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[UNNotificationAttachment type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[UNNotificationAttachment options](self, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[UNNotificationAttachment userInfo](self, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v18;
  void *v19;

  if (self == a3)
    return 1;
  v4 = a3;
  v5 = objc_opt_class();
  UNSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UNNotificationAttachment URL](self, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (UNEqualObjects(v7, v8))
    {
      -[UNNotificationAttachment identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (UNEqualObjects(v9, v10))
      {
        -[UNNotificationAttachment type](self, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (UNEqualObjects(v11, v12))
        {
          -[UNNotificationAttachment options](self, "options");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "options");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (UNEqualObjects(v13, v14))
          {
            -[UNNotificationAttachment userInfo](self, "userInfo");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "userInfo");
            v19 = v13;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = UNEqualObjects(v18, v15);

            v13 = v19;
          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[UNNotificationAttachment identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[UNNotificationAttachment _encodableURL](self, "_encodableURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("URL"));

  -[UNNotificationAttachment type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("type"));

  -[UNNotificationAttachment options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("options"));

  -[UNNotificationAttachment userInfo](self, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("userInfo"));

}

- (UNNotificationAttachment)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UNNotificationAttachment *v23;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v7, CFSTR("URL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v11, v15, CFSTR("userInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("data"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bs_setSafeObject:forKey:", v18, CFSTR("data"));

    objc_msgSend(v16, "objectForKey:", CFSTR("purpose"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bs_setSafeObject:forKey:", v19, CFSTR("purpose"));

    objc_msgSend(v16, "objectForKey:", CFSTR("relocationUUID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bs_setSafeObject:forKey:", v20, CFSTR("relocationUUID"));

    objc_msgSend(v16, "objectForKey:", CFSTR("identityImageStyle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bs_setSafeObject:forKey:", v21, CFSTR("identityImageStyle"));

    v22 = (void *)objc_msgSend(v17, "copy");
  }
  else
  {
    v22 = 0;
  }
  v23 = -[UNNotificationAttachment initWithIdentifier:URL:type:options:userInfo:](self, "initWithIdentifier:URL:type:options:userInfo:", v4, v8, v9, v10, v22);

  return v23;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)type
{
  return self->_type;
}

- (UNNotificationAttachmentOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_securityScopedURL, 0);
}

@end
