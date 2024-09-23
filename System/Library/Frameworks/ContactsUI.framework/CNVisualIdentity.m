@implementation CNVisualIdentity

- (CNVisualIdentity)initWithContact:(id)a3
{
  id v4;
  CNVisualIdentity *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSData *imageData;
  uint64_t v11;
  NSData *imageHash;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  NSData *thumbnailImageData;
  uint64_t v19;
  NSData *fullscreenImageData;
  uint64_t v21;
  NSData *memojiMetadata;
  uint64_t v23;
  CNWallpaper *wallpaper;
  uint64_t v25;
  NSString *identifier;
  uint64_t v27;
  NSArray *linkedContacts;
  uint64_t v29;
  NSObject *p_super;
  NSArray *contacts;
  CNVisualIdentity *v32;
  __int16 v34;
  objc_super v35;
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CNVisualIdentity;
  v5 = -[CNVisualIdentity init](&v35, sel_init);
  if (v5)
  {
    +[CNVisualIdentity descriptorForImageKeys](CNVisualIdentity, "descriptorForImageKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "areKeysAvailable:", v7);

    if (v8)
    {
      objc_msgSend(v4, "imageData");
      v9 = objc_claimAutoreleasedReturnValue();
      imageData = v5->_imageData;
      v5->_imageData = (NSData *)v9;

      objc_msgSend(v4, "imageHash");
      v11 = objc_claimAutoreleasedReturnValue();
      imageHash = v5->_imageHash;
      v5->_imageHash = (NSData *)v11;

      objc_msgSend(v4, "cropRect");
      v5->_cropRect.origin.x = v13;
      v5->_cropRect.origin.y = v14;
      v5->_cropRect.size.width = v15;
      v5->_cropRect.size.height = v16;
      v5->_imageType = (NSString *)(id)objc_msgSend(v4, "imageType");
      objc_msgSend(v4, "thumbnailImageData");
      v17 = objc_claimAutoreleasedReturnValue();
      thumbnailImageData = v5->_thumbnailImageData;
      v5->_thumbnailImageData = (NSData *)v17;

      objc_msgSend(v4, "fullscreenImageData");
      v19 = objc_claimAutoreleasedReturnValue();
      fullscreenImageData = v5->_fullscreenImageData;
      v5->_fullscreenImageData = (NSData *)v19;

      objc_msgSend(v4, "memojiMetadata");
      v21 = objc_claimAutoreleasedReturnValue();
      memojiMetadata = v5->_memojiMetadata;
      v5->_memojiMetadata = (NSData *)v21;

      objc_msgSend(v4, "wallpaper");
      v23 = objc_claimAutoreleasedReturnValue();
      wallpaper = v5->_wallpaper;
      v5->_wallpaper = (CNWallpaper *)v23;

    }
    objc_msgSend(v4, "identifier");
    v25 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v25;

    objc_msgSend(v4, "linkedContacts");
    v27 = objc_claimAutoreleasedReturnValue();
    linkedContacts = v5->_linkedContacts;
    v5->_linkedContacts = (NSArray *)v27;

    if (v4)
    {
      v36 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v29 = objc_claimAutoreleasedReturnValue();
      p_super = &v5->_contacts->super;
      v5->_contacts = (NSArray *)v29;
    }
    else
    {
      contacts = v5->_contacts;
      v5->_contacts = (NSArray *)MEMORY[0x1E0C9AA60];

      objc_msgSend((id)objc_opt_class(), "log");
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v34 = 0;
      }
    }

    v5->_identityType = 0;
    v32 = v5;
  }

  return v5;
}

- (CNVisualIdentity)initWithGroupIdentity:(id)a3
{
  id v4;
  CNVisualIdentity *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSData *imageData;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  void *v13;
  void *abbreviatedName;
  void *v15;
  uint64_t v16;
  NSString *v17;
  NSData *imageHash;
  CGSize v19;
  uint64_t v20;
  NSString *identifier;
  uint64_t v22;
  NSData *thumbnailImageData;
  NSData *fullscreenImageData;
  NSArray *linkedContacts;
  uint64_t v26;
  NSArray *contacts;
  NSData *memojiMetadata;
  NSObject *v29;
  __int16 v31[8];
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CNVisualIdentity;
  v5 = -[CNVisualIdentity init](&v32, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "numberOfContacts") == 1)
    {
      objc_msgSend(v4, "contacts");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[CNVisualIdentity initWithContact:](v5, "initWithContact:", v7);

    }
    else
    {
      objc_msgSend(v4, "groupPhoto");
      v8 = objc_claimAutoreleasedReturnValue();
      imageData = v5->_imageData;
      v5->_imageData = (NSData *)v8;

      objc_msgSend(v4, "groupName");
      v10 = objc_claimAutoreleasedReturnValue();
      name = v5->_name;
      v5->_name = (NSString *)v10;

      v12 = *MEMORY[0x1E0D13848];
      objc_msgSend(v4, "groupName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(unsigned int (**)(uint64_t, void *))(v12 + 16))(v12, v13))
      {
        abbreviatedName = v5->_abbreviatedName;
        v5->_abbreviatedName = 0;
      }
      else
      {
        v15 = (void *)objc_opt_class();
        objc_msgSend(v4, "groupName");
        abbreviatedName = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "abbreviatedNameForGroupName:", abbreviatedName);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v5->_abbreviatedName;
        v5->_abbreviatedName = (NSString *)v16;

      }
      imageHash = v5->_imageHash;
      v5->_imageHash = 0;

      v19 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      v5->_cropRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      v5->_cropRect.size = v19;
      v5->_imageType = 0;
      objc_msgSend(v4, "identifier");
      v20 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v20;

      objc_msgSend(v4, "groupPhoto");
      v22 = objc_claimAutoreleasedReturnValue();
      thumbnailImageData = v5->_thumbnailImageData;
      v5->_thumbnailImageData = (NSData *)v22;

      fullscreenImageData = v5->_fullscreenImageData;
      v5->_fullscreenImageData = 0;

      linkedContacts = v5->_linkedContacts;
      v5->_linkedContacts = 0;

      objc_msgSend(v4, "contacts");
      v26 = objc_claimAutoreleasedReturnValue();
      contacts = v5->_contacts;
      v5->_contacts = (NSArray *)v26;

      memojiMetadata = v5->_memojiMetadata;
      v5->_memojiMetadata = 0;

      if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
      {
        objc_msgSend((id)objc_opt_class(), "log");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v31[0] = 0;
          _os_log_impl(&dword_18AC56000, v29, OS_LOG_TYPE_DEFAULT, "[CNVisualIdentity] Attempting to create a group visual identity from a group containing 0 contacts.", (uint8_t *)v31, 2u);
        }

      }
      v5->_identityType = 1;
    }
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CNVisualIdentity *v4;
  void *v5;
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
  void *v16;

  v4 = objc_alloc_init(CNVisualIdentity);
  -[CNVisualIdentity imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setImageData:](v4, "setImageData:", v5);

  -[CNVisualIdentity name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setName:](v4, "setName:", v6);

  -[CNVisualIdentity abbreviatedName](self, "abbreviatedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setAbbreviatedName:](v4, "setAbbreviatedName:", v7);

  -[CNVisualIdentity imageHash](self, "imageHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setImageHash:](v4, "setImageHash:", v8);

  -[CNVisualIdentity cropRect](self, "cropRect");
  -[CNVisualIdentity setCropRect:](v4, "setCropRect:");
  -[CNVisualIdentity imageType](self, "imageType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setImageType:](v4, "setImageType:", v9);

  -[CNVisualIdentity identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setIdentifier:](v4, "setIdentifier:", v10);

  -[CNVisualIdentity thumbnailImageData](self, "thumbnailImageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setThumbnailImageData:](v4, "setThumbnailImageData:", v11);

  -[CNVisualIdentity fullscreenImageData](self, "fullscreenImageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setFullscreenImageData:](v4, "setFullscreenImageData:", v12);

  -[CNVisualIdentity linkedContacts](self, "linkedContacts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setLinkedContacts:](v4, "setLinkedContacts:", v13);

  -[CNVisualIdentity contacts](self, "contacts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setContacts:](v4, "setContacts:", v14);

  -[CNVisualIdentity setIdentityType:](v4, "setIdentityType:", -[CNVisualIdentity identityType](self, "identityType"));
  -[CNVisualIdentity memojiMetadata](self, "memojiMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setMemojiMetadata:](v4, "setMemojiMetadata:", v15);

  -[CNVisualIdentity wallpaper](self, "wallpaper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setWallpaper:](v4, "setWallpaper:", v16);

  return v4;
}

- (void)setThumbnailImageData:(id)a3
{
  UIImage *avatarImage;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToData:", self->_thumbnailImageData) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_thumbnailImageData, a3);
    avatarImage = self->_avatarImage;
    self->_avatarImage = 0;

  }
}

- (void)setImageData:(id)a3
{
  UIImage *avatarImage;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToData:", self->_imageData) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_imageData, a3);
    avatarImage = self->_avatarImage;
    self->_avatarImage = 0;

  }
}

- (void)setCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIImage *avatarImage;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_cropRect))
  {
    self->_cropRect.origin.x = x;
    self->_cropRect.origin.y = y;
    self->_cropRect.size.width = width;
    self->_cropRect.size.height = height;
    avatarImage = self->_avatarImage;
    self->_avatarImage = 0;

  }
}

- (NSString)name
{
  NSString **p_name;
  void *v4;
  NSString *v5;
  NSString *name;

  if (-[NSArray count](self->_contacts, "count") == 1)
  {
    p_name = &self->_name;
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
    {
      -[NSArray firstObject](self->_contacts, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 0);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      self->_name = v5;

    }
  }
  else
  {
    p_name = &self->_name;
  }
  return *p_name;
}

- (NSString)shortenedDisplayName
{
  NSString **p_shortenedDisplayName;
  void *v4;
  NSString *v5;
  NSString *shortenedDisplayName;

  if (-[NSArray count](self->_contacts, "count") == 1)
  {
    p_shortenedDisplayName = &self->_shortenedDisplayName;
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
    {
      -[NSArray firstObject](self->_contacts, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "givenName");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      shortenedDisplayName = self->_shortenedDisplayName;
      self->_shortenedDisplayName = v5;

    }
  }
  else
  {
    p_shortenedDisplayName = &self->_shortenedDisplayName;
  }
  return *p_shortenedDisplayName;
}

- (NSString)abbreviatedName
{
  NSString **p_abbreviatedName;
  void *v4;
  NSString *v5;
  NSString *abbreviatedName;

  if (-[NSArray count](self->_contacts, "count") == 1)
  {
    p_abbreviatedName = &self->_abbreviatedName;
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
    {
      -[NSArray firstObject](self->_contacts, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 1002);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      abbreviatedName = self->_abbreviatedName;
      self->_abbreviatedName = v5;

    }
  }
  else
  {
    p_abbreviatedName = &self->_abbreviatedName;
  }
  return *p_abbreviatedName;
}

- (BOOL)hasLinkedContacts
{
  uint64_t v2;
  void *v3;

  v2 = *MEMORY[0x1E0D137F8];
  -[CNVisualIdentity linkedContacts](self, "linkedContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3) ^ 1;

  return v2;
}

- (unint64_t)contactImageType
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)MEMORY[0x1E0C97200];
  -[CNVisualIdentity imageType](self, "imageType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "rawImageTypeForIdentifier:", v3);

  return v4;
}

- (int64_t)contactImageSource
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)MEMORY[0x1E0C97200];
  -[CNVisualIdentity imageType](self, "imageType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "rawImageSourceForIdentifier:", v3);

  return v4;
}

- (void)clearImage
{
  -[CNVisualIdentity setImageData:](self, "setImageData:", 0);
  -[CNVisualIdentity setThumbnailImageData:](self, "setThumbnailImageData:", 0);
  -[CNVisualIdentity setFullscreenImageData:](self, "setFullscreenImageData:", 0);
  -[CNVisualIdentity setCropRect:](self, "setCropRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CNVisualIdentity setImageHash:](self, "setImageHash:", 0);
  -[CNVisualIdentity setImageType:](self, "setImageType:", 0);
  -[CNVisualIdentity setMemojiMetadata:](self, "setMemojiMetadata:", 0);
}

- (void)clearWallpaper
{
  -[CNVisualIdentity setWallpaper:](self, "setWallpaper:", 0);
}

- (void)clearImageAndWallpaper
{
  -[CNVisualIdentity clearImage](self, "clearImage");
  -[CNVisualIdentity clearWallpaper](self, "clearWallpaper");
}

- (void)updateContactWithGivenName:(id)a3 familyName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *name;
  NSString *v18;
  NSString *abbreviatedName;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CNVisualIdentity contacts](self, "contacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    objc_msgSend(v10, "setGivenName:", v6);
    objc_msgSend(v10, "setFamilyName:", v7);
    objc_msgSend(v10, "freeze");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentity contacts](self, "contacts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_cn_tail");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentity setContacts:](self, "setContacts:", v15);

    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v10, 0);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    self->_name = v16;

    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v10, 1002);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    abbreviatedName = self->_abbreviatedName;
    self->_abbreviatedName = v18;

  }
}

- (void)updateImageForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CNVisualIdentity imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageData:", v5);

  -[CNVisualIdentity thumbnailImageData](self, "thumbnailImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setThumbnailImageData:", v6);

  -[CNVisualIdentity fullscreenImageData](self, "fullscreenImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFullscreenImageData:", v7);

  -[CNVisualIdentity cropRect](self, "cropRect");
  objc_msgSend(v4, "setCropRect:");
  -[CNVisualIdentity imageHash](self, "imageHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageHash:", v8);

  -[CNVisualIdentity imageType](self, "imageType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageType:", v9);

  -[CNVisualIdentity memojiMetadata](self, "memojiMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMemojiMetadata:", v10);

  -[CNVisualIdentity wallpaper](self, "wallpaper");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWallpaper:", v11);

}

- (void)updateImageType:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C97200], "stringIdentifierForImageType:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentity setImageType:](self, "setImageType:", v4);

}

- (void)updateGroupName:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[CNVisualIdentity canUpdateGroupName](self, "canUpdateGroupName"))
  {
    -[CNVisualIdentity setName:](self, "setName:", v5);
    objc_msgSend((id)objc_opt_class(), "abbreviatedNameForGroupName:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentity setAbbreviatedName:](self, "setAbbreviatedName:", v4);

  }
}

- (BOOL)hasImageDataAvailable
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CNVisualIdentity thumbnailImageData](self, "thumbnailImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[CNVisualIdentity imageData](self, "imageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (UIImage)avatarImage
{
  UIImage *avatarImage;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  UIImage *v8;
  UIImage *v9;
  void *v11;
  _BOOL4 v12;
  void *v13;
  UIImage *v14;
  UIImage *v15;
  UIImage *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  UIImage *v34;
  CGImage *v35;
  CGImage *v36;
  void *v37;
  double v38;
  UIImage *v39;
  UIImage *v40;
  int v41;
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  double v52;
  uint64_t v53;
  CGRect v54;
  CGRect v55;

  v53 = *MEMORY[0x1E0C80C00];
  avatarImage = self->_avatarImage;
  if (avatarImage)
    goto LABEL_5;
  -[CNVisualIdentity thumbnailImageData](self, "thumbnailImageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0DC3870];
    -[CNVisualIdentity thumbnailImageData](self, "thumbnailImageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithData:", v6);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v8 = self->_avatarImage;
    self->_avatarImage = v7;
LABEL_4:

    avatarImage = self->_avatarImage;
LABEL_5:
    v9 = avatarImage;
    return v9;
  }
  -[CNVisualIdentity imageData](self, "imageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v16 = self->_avatarImage;
    self->_avatarImage = 0;

    v9 = 0;
    return v9;
  }
  -[CNVisualIdentity cropRect](self, "cropRect");
  v12 = CGRectEqualToRect(v54, *MEMORY[0x1E0C9D648]);
  v13 = (void *)MEMORY[0x1E0DC3870];
  -[CNVisualIdentity imageData](self, "imageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageWithData:", v6);
  v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12)
  {
    v8 = self->_avatarImage;
    self->_avatarImage = v14;
    goto LABEL_4;
  }

  -[CNVisualIdentity cropRect](self, "cropRect");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[UIImage size](v15, "size");
  v26 = v25;
  -[UIImage size](v15, "size");
  v28 = v27;
  if ((objc_msgSend(MEMORY[0x1E0D13A80], "cropRect:fitsWithinSize:", v18, v20, v22, v24, v26, v27) & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v41 = 134219264;
      v42 = v18;
      v43 = 2048;
      v44 = v20;
      v45 = 2048;
      v46 = v22;
      v47 = 2048;
      v48 = v24;
      v49 = 2048;
      v50 = v26;
      v51 = 2048;
      v52 = v28;
      _os_log_error_impl(&dword_18AC56000, v29, OS_LOG_TYPE_ERROR, "[Likeness] Attempting to crop image with cropRect (%.2f, %.2f, %.2f, %.2f) extending beyond image of size (%.2f x %.2f). Displaying with a centered square cropRect instead.", (uint8_t *)&v41, 0x3Eu);
    }

    objc_msgSend(MEMORY[0x1E0D13A80], "centeredSquareCropRectInRect:", 0.0, 0.0, v26, v28);
    v18 = v30;
    v20 = v31;
    v22 = v32;
    v24 = v33;
  }
  v34 = objc_retainAutorelease(v15);
  v35 = -[UIImage CGImage](v34, "CGImage");
  v55.origin.x = v18;
  v55.origin.y = v20;
  v55.size.width = v22;
  v55.size.height = v24;
  v36 = CGImageCreateWithImageInRect(v35, v55);
  v37 = (void *)MEMORY[0x1E0DC3870];
  -[UIImage scale](v34, "scale");
  objc_msgSend(v37, "imageWithCGImage:scale:orientation:", v36, -[UIImage imageOrientation](v34, "imageOrientation"), v38);
  v39 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v40 = self->_avatarImage;
  self->_avatarImage = v39;

  CGImageRelease(v36);
  v9 = self->_avatarImage;

  return v9;
}

- (BOOL)canUpdateGroupName
{
  return -[CNVisualIdentity identityType](self, "identityType") == 1;
}

- (BOOL)imageAllowsEditing
{
  return -[CNVisualIdentity identityType](self, "identityType") != 1;
}

- (id)wallpaperType
{
  void *v3;
  void *v4;
  char v5;
  id *v6;
  void *v7;
  void *v8;
  int v9;

  -[CNVisualIdentity imageType](self, "imageType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "stringIdentifierForImageType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0C97188];
  }
  else
  {
    -[CNVisualIdentity imageType](self, "imageType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97200], "stringIdentifierForImageType:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    v6 = (id *)MEMORY[0x1E0C97190];
    if (v9)
      v6 = (id *)MEMORY[0x1E0C97180];
  }
  return *v6;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (NSData)fullscreenImageData
{
  return self->_fullscreenImageData;
}

- (void)setFullscreenImageData:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenImageData, a3);
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAvatarImage:(id)a3
{
  objc_storeStrong((id *)&self->_avatarImage, a3);
}

- (void)setAbbreviatedName:(id)a3
{
  objc_storeStrong((id *)&self->_abbreviatedName, a3);
}

- (void)setShortenedDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_shortenedDisplayName, a3);
}

- (NSData)imageHash
{
  return self->_imageHash;
}

- (void)setImageHash:(id)a3
{
  objc_storeStrong((id *)&self->_imageHash, a3);
}

- (NSString)imageType
{
  return self->_imageType;
}

- (void)setImageType:(id)a3
{
  self->_imageType = (NSString *)a3;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (NSArray)linkedContacts
{
  return self->_linkedContacts;
}

- (void)setLinkedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_linkedContacts, a3);
}

- (int64_t)identityType
{
  return self->_identityType;
}

- (void)setIdentityType:(int64_t)a3
{
  self->_identityType = a3;
}

- (NSData)memojiMetadata
{
  return self->_memojiMetadata;
}

- (void)setMemojiMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_memojiMetadata, a3);
}

- (CNWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void)setWallpaper:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_memojiMetadata, 0);
  objc_storeStrong((id *)&self->_linkedContacts, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_shortenedDisplayName, 0);
  objc_storeStrong((id *)&self->_abbreviatedName, 0);
  objc_storeStrong((id *)&self->_avatarImage, 0);
  objc_storeStrong((id *)&self->_fullscreenImageData, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)log
{
  if (log_cn_once_token_1_30007 != -1)
    dispatch_once(&log_cn_once_token_1_30007, &__block_literal_global_30008);
  return (id)log_cn_once_object_1_30009;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_2_30004 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_2_30004, &__block_literal_global_3_30005);
  return (id)descriptorForRequiredKeys_cn_once_object_2_30006;
}

+ (id)descriptorForImageKeys
{
  if (descriptorForImageKeys_cn_once_token_3 != -1)
    dispatch_once(&descriptorForImageKeys_cn_once_token_3, &__block_literal_global_7_30002);
  return (id)descriptorForImageKeys_cn_once_object_3;
}

+ (id)firstComposedCharacterFromString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;

  v3 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    v4 = objc_msgSend(v3, "rangeOfComposedCharacterSequenceAtIndex:", 0);
    objc_msgSend(v3, "substringWithRange:", v4, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E20507A8;
  }

  return v6;
}

+ (id)abbreviatedNameForGroupName:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  _BOOL4 v15;
  int v16;
  uint64_t v17;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D13848];
  if (((*(uint64_t (**)(_QWORD, id))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v3) & 1) == 0)
  {
    v19 = v3;
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_take:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (!v9)
    {
      v5 = &stru_1E20507A8;
      goto LABEL_19;
    }
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = *MEMORY[0x1E0D13850];
    v5 = &stru_1E20507A8;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        objc_msgSend((id)objc_opt_class(), "firstComposedCharacterFromString:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = +[CNUIStringUtilities stringIsSingleEmoji:](CNUIStringUtilities, "stringIsSingleEmoji:", v14);
        v16 = objc_msgSend(v14, "_cn_containsCharacterInSet:", v8);
        if (v15)
        {
          if ((((*(unsigned int (**)(uint64_t, __CFString *))(v4 + 16))(v4, v5) | v16) & 1) == 0)
            goto LABEL_15;
        }
        else if (!v16)
        {
          goto LABEL_15;
        }
        if (!(*(unsigned int (**)(uint64_t, __CFString *))(v12 + 16))(v12, v5)
          || +[CNUIStringUtilities stringContainsEmoji:](CNUIStringUtilities, "stringContainsEmoji:", v5) == v15)
        {
          -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v14);
          v17 = objc_claimAutoreleasedReturnValue();

          v5 = (__CFString *)v17;
        }
LABEL_15:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v10)
      {
LABEL_19:

        v3 = v19;
        goto LABEL_20;
      }
    }
  }
  v5 = 0;
LABEL_20:

  return v5;
}

void __42__CNVisualIdentity_descriptorForImageKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[9];

  v9[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  v1 = *MEMORY[0x1E0C96890];
  v9[0] = *MEMORY[0x1E0C96708];
  v9[1] = v1;
  v2 = *MEMORY[0x1E0C96710];
  v9[2] = *MEMORY[0x1E0C96688];
  v9[3] = v2;
  v3 = *MEMORY[0x1E0C966C8];
  v9[4] = *MEMORY[0x1E0C96728];
  v9[5] = v3;
  v4 = *MEMORY[0x1E0C968A8];
  v9[6] = *MEMORY[0x1E0C96778];
  v9[7] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNVisualIdentity descriptorForImageKeys]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)descriptorForImageKeys_cn_once_object_3;
  descriptorForImageKeys_cn_once_object_3 = v7;

}

void __45__CNVisualIdentity_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0, *MEMORY[0x1E0C966E8], *MEMORY[0x1E0C96768]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNVisualIdentity descriptorForRequiredKeys]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)descriptorForRequiredKeys_cn_once_object_2_30006;
  descriptorForRequiredKeys_cn_once_object_2_30006 = v4;

}

void __23__CNVisualIdentity_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNVisualIdentity");
  v1 = (void *)log_cn_once_object_1_30009;
  log_cn_once_object_1_30009 = (uint64_t)v0;

}

@end
