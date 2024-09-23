@implementation IMNickname

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  void *v43;
  BOOL v45;
  BOOL v46;

  v4 = a3;
  -[IMNickname firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[IMNickname firstName](self, "firstName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v4, "firstName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9 == 0;

    }
  }

  -[IMNickname lastName](self, "lastName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    -[IMNickname lastName](self, "lastName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v4, "lastName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14 == 0;

    }
  }

  -[IMNickname avatar](self, "avatar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageFilePath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageFilePath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqual:", v18) & 1) != 0)
  {
    v46 = 1;
  }
  else
  {
    -[IMNickname avatar](self, "avatar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageFilePath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v46 = 0;
    }
    else
    {
      objc_msgSend(v4, "avatar");
      v45 = v12;
      v21 = v7;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "imageFilePath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v23 == 0;

      v7 = v21;
      v12 = v45;
    }

  }
  -[IMNickname handle](self, "handle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqual:", v25) & 1) != 0)
  {
    v26 = 1;
  }
  else
  {
    -[IMNickname handle](self, "handle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v26 = 0;
    }
    else
    {
      objc_msgSend(v4, "handle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v28 == 0;

    }
  }

  -[IMNickname recordID](self, "recordID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v29, "isEqual:", v30) & 1) != 0)
  {
    v31 = 1;
  }
  else
  {
    -[IMNickname recordID](self, "recordID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v31 = 0;
    }
    else
    {
      objc_msgSend(v4, "recordID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v33 == 0;

    }
  }

  -[IMNickname wallpaper](self, "wallpaper");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wallpaper");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v34, "isEqual:", v35) & 1) != 0)
  {
    v36 = 1;
  }
  else
  {
    -[IMNickname wallpaper](self, "wallpaper");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v36 = 0;
    }
    else
    {
      objc_msgSend(v4, "wallpaper");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v38 == 0;

    }
  }

  -[IMNickname pronouns](self, "pronouns");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pronouns");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v39, "isEqual:", v40) & 1) != 0)
  {
    v41 = 1;
  }
  else
  {
    -[IMNickname pronouns](self, "pronouns");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      v41 = 0;
    }
    else
    {
      objc_msgSend(v4, "pronouns");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v43 == 0;

    }
  }

  return v7 && v12 && v46 && v26 && v31 && v36 && v41;
}

- (IMNickname)init
{
  NSObject *v3;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "IMNickname. Calling init directly is not supported", v5, 2u);
    }

  }
  return 0;
}

- (IMNickname)initWithFirstName:(id)a3 lastName:(id)a4 avatar:(id)a5 pronouns:(id)a6 wallpaper:(id)a7
{
  IMWallpaper *v12;
  IMNickname *v13;
  IMWallpaper *wallpaper;

  v12 = (IMWallpaper *)a7;
  v13 = -[IMNickname initWithFirstName:lastName:avatar:pronouns:](self, "initWithFirstName:lastName:avatar:pronouns:", a3, a4, a5, a6);
  wallpaper = v13->_wallpaper;
  v13->_wallpaper = v12;

  return v13;
}

- (IMNickname)initWithFirstName:(id)a3 lastName:(id)a4 avatar:(id)a5 pronouns:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IMNickname *v14;
  uint64_t v15;
  NSString *firstName;
  uint64_t v17;
  NSString *lastName;
  uint64_t v19;
  NSString *displayName;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)IMNickname;
  v14 = -[IMNickname init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    firstName = v14->_firstName;
    v14->_firstName = (NSString *)v15;

    objc_storeStrong((id *)&v14->_avatar, a5);
    v17 = objc_msgSend(v11, "copy");
    lastName = v14->_lastName;
    v14->_lastName = (NSString *)v17;

    objc_storeStrong((id *)&v14->_pronouns, a6);
    if (-[NSString length](v14->_firstName, "length") && -[NSString length](v14->_lastName, "length"))
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), v14->_firstName, v14->_lastName);
LABEL_7:
      displayName = v14->_displayName;
      v14->_displayName = (NSString *)v19;

      goto LABEL_8;
    }
    if (-[NSString length](v14->_firstName, "length"))
    {
      v19 = objc_msgSend(v10, "copy");
      goto LABEL_7;
    }
  }
LABEL_8:

  return v14;
}

- (IMNickname)initWithMeContact:(id)a3
{
  id v4;
  IMNickname *v5;
  void *v6;
  uint64_t v7;
  NSString *firstName;
  void *v9;
  uint64_t v10;
  NSString *lastName;
  uint64_t v12;
  NSString *displayName;
  IMWallpaper *v14;
  NSObject *v15;
  IMNicknameAvatarImage *v16;
  IMNicknameAvatarImage *avatar;
  void *v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  IMWallpaperMetadata *v30;
  IMWallpaper *v31;
  id v32;
  NSObject *v33;
  IMWallpaper *wallpaper;
  uint64_t v36;
  IMWallpaperMetadata *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  objc_super v47;
  uint8_t buf[4];
  IMWallpaper *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)IMNickname;
  v5 = -[IMNickname init](&v47, sel_init);
  if (!v5)
    goto LABEL_24;
  objc_msgSend(v4, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  firstName = v5->_firstName;
  v5->_firstName = (NSString *)v7;

  objc_msgSend(v4, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  lastName = v5->_lastName;
  v5->_lastName = (NSString *)v10;

  if (-[NSString length](v5->_firstName, "length") && -[NSString length](v5->_lastName, "length"))
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), v5->_firstName, v5->_lastName);
LABEL_7:
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v12;

    goto LABEL_8;
  }
  if (-[NSString length](v5->_firstName, "length"))
  {
    v12 = -[NSString copy](v5->_firstName, "copy");
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v4, "imageData");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    objc_msgSend((id)objc_opt_class(), "uniqueFilePathForWritingImageData");
    v14 = (IMWallpaper *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v14;
        _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Writing nickname image to path: %@", buf, 0xCu);
      }

    }
    v16 = -[IMNicknameAvatarImage initWithImageName:imageData:imageFilePath:contentIsSensitive:]([IMNicknameAvatarImage alloc], "initWithImageName:imageData:imageFilePath:contentIsSensitive:", CFSTR("NickNameImage"), v45, v14, 0);
    avatar = v5->_avatar;
    v5->_avatar = v16;

  }
  objc_msgSend(v4, "wallpaper");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend((id)objc_opt_class(), "uniqueFilePathForWritingWallpaperData");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "uniqueFilePathForWritingWallpaperData");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "posterArchiveData");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "watchWallpaperImageData");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v37 = [IMWallpaperMetadata alloc];
      objc_msgSend(v18, "fontDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("name"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fontDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("point-size"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v21 = v20;
      objc_msgSend(v18, "fontDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("weight"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      v25 = v24;
      objc_msgSend(v18, "fontColorDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v18, "isVertical");
      objc_msgSend(v18, "extensionBundleID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "backgroundColorDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[IMWallpaperMetadata initWithFontName:fontSize:fontWeight:fontColor:isVertical:type:backgroundColor:](v37, "initWithFontName:fontSize:fontWeight:fontColor:isVertical:type:backgroundColor:", v38, v26, v27, v28, v29, v21, v25);

    }
    else
    {
      v30 = 0;
    }
    v46 = 0;
    LOBYTE(v36) = 0;
    v31 = -[IMWallpaper initWithFileName:filePath:data:lowResFileName:lowResFilePath:lowResData:metadata:contentIsSensitive:error:]([IMWallpaper alloc], "initWithFileName:filePath:data:lowResFileName:lowResFilePath:lowResData:metadata:contentIsSensitive:error:", CFSTR("Wallpaper"), v44, v43, CFSTR("Wallpaper"), v41, v42, v30, v36, &v46);
    v32 = v46;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v49 = v31;
        v50 = 2112;
        v51 = v32;
        _os_log_impl(&dword_19E239000, v33, OS_LOG_TYPE_INFO, "Created wallpaper %@ with error: %@", buf, 0x16u);
      }

    }
    wallpaper = v5->_wallpaper;
    v5->_wallpaper = v31;

  }
LABEL_24:

  return v5;
}

+ (id)uniqueFilePathForWritingImageData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  IMSafeTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("com.apple.messages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createUniqueDirectoryWithName:atPath:ofType:", v6, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("NickNameImage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)uniqueFilePathForWritingWallpaperData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  IMSafeTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("com.apple.messages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createUniqueDirectoryWithName:atPath:ofType:", v6, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Wallpaper"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p rid: %@ displayName: %@ firstName: %@ lastName: %@ avatar: %@ handle %@ pronouns %@ wallpaper:%@>"), objc_opt_class(), self, self->_recordID, self->_displayName, self->_firstName, self->_lastName, self->_avatar, self->_handle, self->_pronouns, self->_wallpaper);
}

- (IMNickname)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  IMNicknameAvatarImage *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  IMWallpaper *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  IMNickname *v32;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char v40;
  id v41;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {

    self = 0;
    goto LABEL_15;
  }
  v5 = [IMNicknameAvatarImage alloc];
  objc_msgSend(v4, "objectForKey:", CFSTR("ai"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMNicknameAvatarImage initWithDictionaryRepresentation:](v5, "initWithDictionaryRepresentation:", v6);

  objc_msgSend(v4, "objectForKey:", CFSTR("rid"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("hid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("fn"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ln"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("pb"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("wp"));
  v13 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v13;
  if (v13)
    v14 = -[IMWallpaper initWithDictionaryRepresentation:]([IMWallpaper alloc], "initWithDictionaryRepresentation:", v13);
  else
    v14 = 0;
  objc_msgSend(v4, "objectForKey:", CFSTR("ad"));
  v37 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("pn"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)v7;
  if (!v15)
  {
    v31 = v7;
    v28 = (void *)v8;
    v30 = 0;
    v29 = (void *)v37;
LABEL_13:
    self = -[IMNickname initWithFirstName:lastName:avatar:pronouns:](self, "initWithFirstName:lastName:avatar:pronouns:", v10, v11, v31, v30);
    -[IMNickname setRecordID:](self, "setRecordID:", v28);
    -[IMNickname setHandle:](self, "setHandle:", v9);
    -[IMNickname setWallpaper:](self, "setWallpaper:", v14);
    -[IMNickname setArchivedDate:](self, "setArchivedDate:", v29);
    -[IMNickname setPreBlastDoorPayloadData:](self, "setPreBlastDoorPayloadData:", v12);
    v40 = 1;
    goto LABEL_14;
  }
  v36 = v10;
  v35 = (void *)v8;
  v16 = v7;
  v17 = objc_alloc(MEMORY[0x1E0CB3B68]);
  objc_msgSend(v4, "objectForKey:", CFSTR("pn"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v34 = objc_msgSend(v17, "initWithExternalRepresentationDictionary:error:", v18, &v41);
  v19 = v41;

  if (!v19)
  {
    v31 = v16;
    v28 = v35;
    v10 = v36;
    v29 = (void *)v37;
    v30 = (void *)v34;
    goto LABEL_13;
  }
  IMLogHandleForCategory("Nicknames");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    sub_19E36C0B8(v20, v21, v22, v23, v24, v25, v26, v27);

  v40 = 0;
  v28 = v35;
  v10 = v36;
  v29 = (void *)v37;
  v30 = (void *)v34;
LABEL_14:

  if ((v40 & 1) == 0)
  {
    v32 = 0;
    goto LABEL_17;
  }
LABEL_15:
  self = self;
  v32 = self;
LABEL_17:

  return v32;
}

- (IMNickname)initWithPublicDictionaryRepresentationWithoutAvatar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  IMNickname *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("fn"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ln"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("pn"));
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7
    && (v8 = objc_alloc(MEMORY[0x1E0CB3B68]),
        objc_msgSend(v4, "objectForKey:", CFSTR("pn")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = 0,
        v7 = objc_msgSend(v8, "initWithExternalRepresentationDictionary:error:", v9, &v19),
        v9,
        !v7))
  {
    IMLogHandleForCategory("Nicknames");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_19E36C0B8(v7, v11, v12, v13, v14, v15, v16, v17);
    v10 = 0;
  }
  else
  {
    self = -[IMNickname initWithFirstName:lastName:avatar:pronouns:](self, "initWithFirstName:lastName:avatar:pronouns:", v5, v6, 0, v7);
    v10 = self;
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDate *archivedDate;
  void *v14;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMNickname displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    CFDictionarySetValue(v3, CFSTR("dn"), v4);

  -[IMNicknameAvatarImage dictionaryRepresentation](self->_avatar, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    CFDictionarySetValue(v3, CFSTR("ai"), v5);

  -[IMNickname recordID](self, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFDictionarySetValue(v3, CFSTR("rid"), v6);

  -[IMNickname handle](self, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("hid"), v7);

  -[IMNickname firstName](self, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    CFDictionarySetValue(v3, CFSTR("fn"), v8);

  -[IMNickname lastName](self, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(v3, CFSTR("ln"), v9);

  -[IMNickname wallpaper](self, "wallpaper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    CFDictionarySetValue(v3, CFSTR("wp"), v11);

  -[_NSAttributedStringGrammarInflection externalRepresentationDictionary](self->_pronouns, "externalRepresentationDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    CFDictionarySetValue(v3, CFSTR("pn"), v12);

  archivedDate = self->_archivedDate;
  if (archivedDate)
    CFDictionarySetValue(v3, CFSTR("ad"), archivedDate);
  -[IMNickname preBlastDoorPayloadData](self, "preBlastDoorPayloadData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    CFDictionarySetValue(v3, CFSTR("pb"), v14);

  return v3;
}

- (id)publicDictionaryRepresentation
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSString *displayName;
  void *v6;
  NSString *firstName;
  NSString *lastName;
  void *v9;
  void *v10;
  NSDate *archivedDate;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  displayName = self->_displayName;
  if (displayName)
    CFDictionarySetValue(v3, CFSTR("dn"), displayName);
  -[IMNicknameAvatarImage publicDictionaryRepresentation](self->_avatar, "publicDictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFDictionarySetValue(v4, CFSTR("ai"), v6);

  firstName = self->_firstName;
  if (firstName)
    CFDictionarySetValue(v4, CFSTR("fn"), firstName);
  lastName = self->_lastName;
  if (lastName)
    CFDictionarySetValue(v4, CFSTR("ln"), lastName);
  -[IMWallpaper publicDictionaryRepresentation](self->_wallpaper, "publicDictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(v4, CFSTR("wp"), v9);

  -[_NSAttributedStringGrammarInflection externalRepresentationDictionary](self->_pronouns, "externalRepresentationDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    CFDictionarySetValue(v4, CFSTR("pn"), v10);

  archivedDate = self->_archivedDate;
  if (archivedDate)
    CFDictionarySetValue(v4, CFSTR("ad"), archivedDate);
  return v4;
}

- (id)publicDictionaryRepresentationWithoutAvatar
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSString *displayName;
  NSString *firstName;
  NSString *lastName;
  void *v8;
  NSDate *archivedDate;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  displayName = self->_displayName;
  if (displayName)
    CFDictionarySetValue(v3, CFSTR("dn"), displayName);
  firstName = self->_firstName;
  if (firstName)
    CFDictionarySetValue(v4, CFSTR("fn"), firstName);
  lastName = self->_lastName;
  if (lastName)
    CFDictionarySetValue(v4, CFSTR("ln"), lastName);
  -[_NSAttributedStringGrammarInflection externalRepresentationDictionary](self->_pronouns, "externalRepresentationDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    CFDictionarySetValue(v4, CFSTR("pn"), v8);

  archivedDate = self->_archivedDate;
  if (archivedDate)
    CFDictionarySetValue(v4, CFSTR("ad"), archivedDate);
  return v4;
}

- (void)setFirstName:(id)a3
{
  NSString *v4;
  NSString *firstName;
  NSString *nameHash;

  if (self->_firstName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    firstName = self->_firstName;
    self->_firstName = v4;

    nameHash = self->_nameHash;
    self->_nameHash = 0;

  }
}

- (void)setLastName:(id)a3
{
  NSString *v4;
  NSString *lastName;
  NSString *nameHash;

  if (self->_lastName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    lastName = self->_lastName;
    self->_lastName = v4;

    nameHash = self->_nameHash;
    self->_nameHash = 0;

  }
}

- (void)setAvatar:(id)a3
{
  IMNicknameAvatarImage *v5;
  NSData *imageHash;
  NSString *concatenatedImageHash;
  IMNicknameAvatarImage *v8;

  v5 = (IMNicknameAvatarImage *)a3;
  if (self->_avatar != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_avatar, a3);
    imageHash = self->_imageHash;
    self->_imageHash = 0;

    concatenatedImageHash = self->_concatenatedImageHash;
    self->_concatenatedImageHash = 0;

    v5 = v8;
  }

}

- (void)setWallpaper:(id)a3
{
  IMWallpaper *v5;
  NSData *wallpaperImageHash;
  NSData *wallpaperLowResImageHash;
  NSString *concatenatedImageHash;
  IMWallpaper *v9;

  v5 = (IMWallpaper *)a3;
  if (self->_wallpaper != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_wallpaper, a3);
    wallpaperImageHash = self->_wallpaperImageHash;
    self->_wallpaperImageHash = 0;

    wallpaperLowResImageHash = self->_wallpaperLowResImageHash;
    self->_wallpaperLowResImageHash = 0;

    concatenatedImageHash = self->_concatenatedImageHash;
    self->_concatenatedImageHash = 0;

    v5 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  IMNickname *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  IMNickname *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = [IMNickname alloc];
  -[IMNickname firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNickname lastName](self, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNickname avatar](self, "avatar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNickname pronouns](self, "pronouns");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IMNickname initWithFirstName:lastName:avatar:pronouns:](v4, "initWithFirstName:lastName:avatar:pronouns:", v5, v6, v7, v8);

  -[IMNickname recordID](self, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNickname setRecordID:](v9, "setRecordID:", v10);

  -[IMNickname handle](self, "handle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNickname setHandle:](v9, "setHandle:", v11);

  -[IMNickname wallpaper](self, "wallpaper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNickname setWallpaper:](v9, "setWallpaper:", v12);

  -[IMNickname archivedDate](self, "archivedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNickname setArchivedDate:](v9, "setArchivedDate:", v13);

  -[IMNickname preBlastDoorPayloadData](self, "preBlastDoorPayloadData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNickname setPreBlastDoorPayloadData:](v9, "setPreBlastDoorPayloadData:", v14);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMNickname)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  IMNickname *v16;
  IMNickname *v17;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avatar"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handleID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("preBlastdoorData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wallpaper"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("archivedDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pronouns"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)v6;
  v16 = -[IMNickname initWithFirstName:lastName:avatar:pronouns:](self, "initWithFirstName:lastName:avatar:pronouns:", v6, v7, v19, v15);
  v17 = v16;
  if (v5)
    -[IMNickname setRecordID:](v16, "setRecordID:", v5);
  if (v20)
    -[IMNickname setHandle:](v17, "setHandle:", v20);
  if (v13)
    -[IMNickname setWallpaper:](v17, "setWallpaper:", v13);
  if (v14)
    -[IMNickname setArchivedDate:](v17, "setArchivedDate:", v14);
  if (v12)
    -[IMNickname setPreBlastDoorPayloadData:](v17, "setPreBlastDoorPayloadData:", v12);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[IMNickname displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("displayName"));

  -[IMNickname avatar](self, "avatar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("avatar"));

  -[IMNickname recordID](self, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("recordID"));

  -[IMNickname handle](self, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("handleID"));

  -[IMNickname firstName](self, "firstName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("firstName"));

  -[IMNickname lastName](self, "lastName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("lastName"));

  -[IMNickname wallpaper](self, "wallpaper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("wallpaper"));

  -[IMNickname pronouns](self, "pronouns");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("pronouns"));

  -[IMNickname archivedDate](self, "archivedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("archivedDate"));

  -[IMNickname preBlastDoorPayloadData](self, "preBlastDoorPayloadData");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("preBlastdoorData"));

}

- (IMNicknameAvatarImage)avatar
{
  return self->_avatar;
}

- (id)dataRepresentation
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (v3 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Error creating nickname archive: %@", buf, 0xCu);
    }

  }
  return v2;
}

+ (id)nameHashWithFirstName:(id)a3 lastName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") || objc_msgSend(v6, "length"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@+%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "dataUsingEncoding:", 10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    IMSharedHelperMD5OfData(v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = &stru_1E3FBBA48;
  }

  return v12;
}

- (NSString)nameHash
{
  NSString *nameHash;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  nameHash = self->_nameHash;
  if (!nameHash)
  {
    v4 = (void *)objc_opt_class();
    -[IMNickname firstName](self, "firstName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNickname lastName](self, "lastName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nameHashWithFirstName:lastName:", v5, v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_nameHash;
    self->_nameHash = v7;

    nameHash = self->_nameHash;
  }
  return nameHash;
}

- (NSData)imageHash
{
  NSData *imageHash;
  void *v4;
  void *v5;
  NSData *v6;
  NSData *v7;

  imageHash = self->_imageHash;
  if (!imageHash)
  {
    -[IMNickname avatar](self, "avatar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageFilePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNickname _imageHashCreatedInChunks:](self, "_imageHashCreatedInChunks:", v5);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    v7 = self->_imageHash;
    self->_imageHash = v6;

    imageHash = self->_imageHash;
  }
  return imageHash;
}

- (NSData)wallpaperImageHash
{
  NSData *wallpaperImageHash;
  void *v4;
  void *v5;
  NSData *v6;
  NSData *v7;

  wallpaperImageHash = self->_wallpaperImageHash;
  if (!wallpaperImageHash)
  {
    -[IMNickname wallpaper](self, "wallpaper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNickname _imageHashCreatedInChunks:](self, "_imageHashCreatedInChunks:", v5);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    v7 = self->_wallpaperImageHash;
    self->_wallpaperImageHash = v6;

    wallpaperImageHash = self->_wallpaperImageHash;
  }
  return wallpaperImageHash;
}

- (NSData)wallpaperLowResImageHash
{
  NSData *wallpaperLowResImageHash;
  void *v4;
  void *v5;
  NSData *v6;
  NSData *v7;

  wallpaperLowResImageHash = self->_wallpaperLowResImageHash;
  if (!wallpaperLowResImageHash)
  {
    -[IMNickname wallpaper](self, "wallpaper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowResFilePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNickname _imageHashCreatedInChunks:](self, "_imageHashCreatedInChunks:", v5);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    v7 = self->_wallpaperLowResImageHash;
    self->_wallpaperLowResImageHash = v6;

    wallpaperLowResImageHash = self->_wallpaperLowResImageHash;
  }
  return wallpaperLowResImageHash;
}

- (NSString)concatenatedImageHash
{
  NSString *concatenatedImageHash;
  void *v4;
  id v5;
  __CFString *v6;
  void *v7;
  id v8;
  __CFString *v9;
  NSString *v10;
  NSString *v11;

  concatenatedImageHash = self->_concatenatedImageHash;
  if (!concatenatedImageHash)
  {
    -[IMNickname imageHash](self, "imageHash");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[IMNickname imageHash](self, "imageHash");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      IMSharedHelperMd5ToString((unsigned __int8 *)objc_msgSend(v5, "bytes"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = &stru_1E3FBBA48;
    }
    -[IMNickname wallpaperImageHash](self, "wallpaperImageHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[IMNickname wallpaperImageHash](self, "wallpaperImageHash");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      IMSharedHelperMd5ToString((unsigned __int8 *)objc_msgSend(v8, "bytes"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = &stru_1E3FBBA48;
    }
    -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_concatenatedImageHash;
    self->_concatenatedImageHash = v10;

    concatenatedImageHash = self->_concatenatedImageHash;
  }
  return concatenatedImageHash;
}

- (id)_imageHashCreatedInChunks:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    IMSharedHelperMD5DataHashOfFileAtPath((uint64_t)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_sharingState
{
  return +[IMMeCardSharingStateController sharedInstance](IMMeCardSharingStateController, "sharedInstance");
}

- (BOOL)isUpdateFromNickname:(id)a3 withOptions:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  char v57;
  BOOL v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  BOOL v64;
  int v66;
  int v67;
  int v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  uint8_t buf[4];
  _BYTE v74[10];
  _BYTE v75[20];
  void *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v4 = a4;
  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v36, OS_LOG_TYPE_INFO, "No other nickname to compare to, bailing!", buf, 2u);
      }

    }
    goto LABEL_57;
  }
  if ((v4 & 0xC) == 0)
    goto LABEL_8;
  -[IMNickname nameHash](self, "nameHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nameHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  -[IMNickname firstName](self, "firstName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  -[IMNickname lastName](self, "lastName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  -[IMNickname firstName](self, "firstName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  -[IMNickname lastName](self, "lastName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v74 = v9 ^ 1;
      *(_WORD *)&v74[4] = 1024;
      *(_DWORD *)&v74[6] = v12;
      *(_WORD *)v75 = 1024;
      *(_DWORD *)&v75[2] = v15;
      *(_WORD *)&v75[6] = 1024;
      *(_DWORD *)&v75[8] = v17 == 0;
      *(_WORD *)&v75[12] = 1024;
      *(_DWORD *)&v75[14] = v19 == 0;
      _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "Name change detected: %d (FN: %d) (LN: %d) (FNE: %d) (LNE: %d)", buf, 0x20u);
    }

  }
  if ((v9 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        -[IMNickname firstName](self, "firstName");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "firstName");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMNickname lastName](self, "lastName");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastName");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)v74 = self;
        *(_WORD *)&v74[8] = 2112;
        *(_QWORD *)v75 = v72;
        *(_WORD *)&v75[8] = 2112;
        *(_QWORD *)&v75[10] = v61;
        *(_WORD *)&v75[18] = 2112;
        v76 = v62;
        v77 = 2112;
        v78 = v63;
        _os_log_impl(&dword_19E239000, v60, OS_LOG_TYPE_INFO, "Name has changed for nickname: %@. Self first name: %@, other first name name: %@, self last name: %@, other last name: %@", buf, 0x34u);

      }
    }
    if (v15)
    {
      v64 = v17 == 0;
    }
    else if (v12)
    {
      v64 = v19 == 0;
    }
    else
    {
      v64 = (v17 | v19) == 0;
    }
    v58 = !v64;
  }
  else
  {
LABEL_8:
    if ((v4 & 0xA) != 0)
    {
      -[IMNickname avatar](self, "avatar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "imageExists");

      objc_msgSend(v6, "avatar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "imageExists");

      -[IMNickname imageHash](self, "imageHash");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      IMSharedHelperMd5ToString((unsigned __int8 *)objc_msgSend(v25, "bytes"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "imageHash");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      IMSharedHelperMd5ToString((unsigned __int8 *)objc_msgSend(v27, "bytes"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v74 = v22;
          *(_WORD *)&v74[4] = 1024;
          *(_DWORD *)&v74[6] = v24;
          *(_WORD *)v75 = 2112;
          *(_QWORD *)&v75[2] = v26;
          *(_WORD *)&v75[10] = 2112;
          *(_QWORD *)&v75[12] = v28;
          _os_log_impl(&dword_19E239000, v29, OS_LOG_TYPE_INFO, "Photo (LE: %d) (OE: %d) (LH: %@) (OH: %@)", buf, 0x22u);
        }

      }
      if (v22 && (objc_msgSend(v26, "isEqualToString:", v28) & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v74 = self;
            _os_log_impl(&dword_19E239000, v59, OS_LOG_TYPE_INFO, "Photo has changed for nickname: %@", buf, 0xCu);
          }

        }
        goto LABEL_57;
      }

    }
    if ((v4 & 0x18) != 0)
    {
      -[IMNickname pronouns](self, "pronouns");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pronouns");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30 == v31)
      {

      }
      else
      {
        -[IMNickname pronouns](self, "pronouns");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "pronouns");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqual:", v33);

        if ((v34 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v74 = self;
              _os_log_impl(&dword_19E239000, v35, OS_LOG_TYPE_INFO, "Pronouns have changed for nickname: %@", buf, 0xCu);
            }

          }
LABEL_57:
          v58 = 1;
          goto LABEL_70;
        }
      }
    }
    if ((v4 & 0x28) != 0)
    {
      -[IMNickname wallpaper](self, "wallpaper");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v37, "wallpaperExists");

      objc_msgSend(v6, "wallpaper");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v38, "wallpaperExists");

      -[IMNickname wallpaperImageHash](self, "wallpaperImageHash");
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      IMSharedHelperMd5ToString((unsigned __int8 *)objc_msgSend(v39, "bytes"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "wallpaperImageHash");
      v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      IMSharedHelperMd5ToString((unsigned __int8 *)objc_msgSend(v40, "bytes"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMNickname wallpaper](self, "wallpaper");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v42, "lowResWallpaperExists");

      objc_msgSend(v6, "wallpaper");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v43, "lowResWallpaperExists");

      -[IMNickname wallpaperLowResImageHash](self, "wallpaperLowResImageHash");
      v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      IMSharedHelperMd5ToString((unsigned __int8 *)objc_msgSend(v44, "bytes"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "wallpaperLowResImageHash");
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      IMSharedHelperMd5ToString((unsigned __int8 *)objc_msgSend(v45, "bytes"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMNickname wallpaper](self, "wallpaper");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "metadata");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMNickname wallpaper](self, "wallpaper");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "metadata");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "wallpaper");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "metadata");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v50, "isEqual:", v52);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v74 = v69;
          *(_WORD *)&v74[4] = 1024;
          *(_DWORD *)&v74[6] = v67;
          *(_WORD *)v75 = 2112;
          *(_QWORD *)&v75[2] = v71;
          *(_WORD *)&v75[10] = 2112;
          *(_QWORD *)&v75[12] = v41;
          _os_log_impl(&dword_19E239000, v54, OS_LOG_TYPE_INFO, "Wallpaper (LE: %d) (OE: %d) (LH: %@) (OH: %@)", buf, 0x22u);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v74 = v68;
          *(_WORD *)&v74[4] = 1024;
          *(_DWORD *)&v74[6] = v66;
          *(_WORD *)v75 = 2112;
          *(_QWORD *)&v75[2] = v71;
          *(_WORD *)&v75[10] = 2112;
          *(_QWORD *)&v75[12] = v41;
          _os_log_impl(&dword_19E239000, v55, OS_LOG_TYPE_INFO, "Low Res Wallpaper (LE: %d) (OE: %d) (LH: %@) (OH: %@)", buf, 0x22u);
        }

      }
      if (v69 && !objc_msgSend(v71, "isEqualToString:", v41))
        goto LABEL_41;
      if (v68)
      {
        if ((objc_msgSend(v70, "isEqualToString:", v46) & ((v48 == 0) | v53) & 1) == 0)
        {
LABEL_41:
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v74 = self;
              _os_log_impl(&dword_19E239000, v56, OS_LOG_TYPE_INFO, "Wallpaper has changed for nickname: %@", buf, 0xCu);
            }

          }
          goto LABEL_57;
        }
      }
      else
      {
        if (v48)
          v57 = v53;
        else
          v57 = 1;
        if ((v57 & 1) == 0)
          goto LABEL_41;
      }

    }
    v58 = 0;
  }
LABEL_70:

  return v58;
}

- (void)updateNameFromContact:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  -[IMNickname firstName](self, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    objc_msgSend(v10, "givenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNickname setFirstName:](self, "setFirstName:", v6);

  }
  -[IMNickname lastName](self, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    objc_msgSend(v10, "familyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNickname setLastName:](self, "setLastName:", v9);

  }
}

- (NSDate)archivedDate
{
  return self->_archivedDate;
}

- (void)setArchivedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (IMWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (_NSAttributedStringGrammarInflection)pronouns
{
  return self->_pronouns;
}

- (void)setPronouns:(id)a3
{
  objc_storeStrong((id *)&self->_pronouns, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (NSDictionary)preBlastDoorPayloadData
{
  return self->_preBlastDoorPayloadData;
}

- (void)setPreBlastDoorPayloadData:(id)a3
{
  objc_storeStrong((id *)&self->_preBlastDoorPayloadData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preBlastDoorPayloadData, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_pronouns, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_archivedDate, 0);
  objc_storeStrong((id *)&self->_nameHash, 0);
  objc_storeStrong((id *)&self->_concatenatedImageHash, 0);
  objc_storeStrong((id *)&self->_wallpaperLowResImageHash, 0);
  objc_storeStrong((id *)&self->_wallpaperImageHash, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
}

@end
