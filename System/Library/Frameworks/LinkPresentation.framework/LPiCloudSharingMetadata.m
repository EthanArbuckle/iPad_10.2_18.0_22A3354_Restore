@implementation LPiCloudSharingMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiCloudSharingMetadata)initWithCoder:(id)a3
{
  id v4;
  LPiCloudSharingMetadata *v5;
  uint64_t v6;
  NSString *application;
  uint64_t v8;
  NSString *kind;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  LPImage *icon;
  uint64_t v14;
  LPImage *thumbnail;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *encodedTokens;
  LPiCloudSharingMetadata *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)LPiCloudSharingMetadata;
  v5 = -[LPiCloudSharingMetadata init](&v21, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("application"));
    v6 = objc_claimAutoreleasedReturnValue();
    application = v5->_application;
    v5->_application = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("kind"));
    v8 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v12 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (LPImage *)v12;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("thumbnail"));
    v14 = objc_claimAutoreleasedReturnValue();
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (LPImage *)v14;

    v16 = objc_opt_class();
    objc_msgSend(v4, "_lp_strictlyDecodeDictionaryOfObjectsWithKeysOfClass:andObjectsOfClass:forKey:", v16, objc_opt_class(), CFSTR("encodedTokens"));
    v17 = objc_claimAutoreleasedReturnValue();
    encodedTokens = v5->_encodedTokens;
    v5->_encodedTokens = (NSDictionary *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_application, CFSTR("application"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_thumbnail, CFSTR("thumbnail"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_encodedTokens, CFSTR("encodedTokens"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPiCloudSharingMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LPiCloudSharingMetadata *v11;

  v4 = +[LPiCloudSharingMetadata allocWithZone:](LPiCloudSharingMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPiCloudSharingMetadata application](self, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata setApplication:](v4, "setApplication:", v5);

    -[LPiCloudSharingMetadata kind](self, "kind");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata setKind:](v4, "setKind:", v6);

    -[LPiCloudSharingMetadata title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata setTitle:](v4, "setTitle:", v7);

    -[LPiCloudSharingMetadata icon](self, "icon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata setIcon:](v4, "setIcon:", v8);

    -[LPiCloudSharingMetadata thumbnail](self, "thumbnail");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata setThumbnail:](v4, "setThumbnail:", v9);

    -[LPiCloudSharingMetadata encodedTokens](self, "encodedTokens");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata setEncodedTokens:](v4, "setEncodedTokens:", v10);

    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiCloudSharingMetadata;
  if (-[LPiCloudSharingMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[3], self->_application) & 1) != 0
        && objectsAreEqual_0(v6[4], self->_kind)
        && objectsAreEqual_0(v6[5], self->_title)
        && objectsAreEqual_0(v6[6], self->_icon)
        && objectsAreEqual_0(v6[7], self->_thumbnail))
      {
        v5 = objectsAreEqual_0(v6[8], self->_encodedTokens);
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_title, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (**v3)(id, const __CFString *);

  v3 = (void (**)(id, const __CFString *))a3;
  v3[2](v3, CFSTR("icon"));
  v3[2](v3, CFSTR("thumbnail"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("application"), CFSTR("kind"), CFSTR("title"), CFSTR("icon"), CFSTR("thumbnail"), CFSTR("encodedTokens"), 0);
}

- (NSString)applicationBundleIdenfier
{
  return self->_applicationBundleIdenfier;
}

- (void)setApplicationBundleIdenfier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (LPImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
}

- (NSDictionary)encodedTokens
{
  return self->_encodedTokens;
}

- (void)setEncodedTokens:(id)a3
{
  objc_storeStrong((id *)&self->_encodedTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedTokens, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdenfier, 0);
}

+ (id)_applicationNameMap
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[9];
  _QWORD v7[10];

  v7[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)_applicationNameMap_map;
  if (!_applicationNameMap_map)
  {
    v6[0] = CFSTR("notes");
    v6[1] = CFSTR("pages");
    v7[0] = CFSTR("Notes");
    v7[1] = CFSTR("Pages");
    v6[2] = CFSTR("numbers");
    v6[3] = CFSTR("keynote");
    v7[2] = CFSTR("Numbers");
    v7[3] = CFSTR("Keynote");
    v6[4] = CFSTR("freeform");
    v6[5] = CFSTR("freeform-copy");
    v7[4] = CFSTR("Freeform");
    v7[5] = CFSTR("Freeform");
    v6[6] = CFSTR("reminders");
    v6[7] = CFSTR("iclouddrive");
    v7[6] = CFSTR("Reminders");
    v7[7] = CFSTR("iCloud Drive");
    v6[8] = CFSTR("safari-tab-groups");
    v7[8] = CFSTR("Safari");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 9);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_applicationNameMap_map;
    _applicationNameMap_map = v3;

    v2 = (void *)_applicationNameMap_map;
  }
  return v2;
}

+ (id)_bundleIdentifierMap
{
  return &unk_1E44F05C8;
}

+ (id)extractApplicationFromURL:(id)a3
{
  objc_msgSend(a3, "_lp_pathComponentAtIndex:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)extractApplicationNameFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "extractApplicationFromURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPiCloudSharingMetadata _applicationNameMap](LPiCloudSharingMetadata, "_applicationNameMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)extractKindFromURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  __CFString *v7;

  v4 = a3;
  objc_msgSend(a1, "extractApplicationFromURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("freeform-copy"));

  if ((v6 & 1) != 0)
  {
    v7 = CFSTR("copy");
  }
  else
  {
    objc_msgSend(v4, "_lp_pathComponentAtIndex:", 2);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)extractTitleFromURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "fragment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByRemovingPercentEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)firstPartyAppIcon
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;

  -[LPiCloudSharingMetadata application](self, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Pages"));

  if (v4)
  {
    +[LPResources pagesIcon](LPResources, "pagesIcon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LPiCloudSharingMetadata application](self, "application");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Notes"));

    if (v7)
    {
      +[LPResources notesIcon](LPResources, "notesIcon");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[LPiCloudSharingMetadata application](self, "application");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Numbers"));

      if (v9)
      {
        +[LPResources numbersIcon](LPResources, "numbersIcon");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[LPiCloudSharingMetadata application](self, "application");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Keynote"));

        if (v11)
        {
          +[LPResources keynoteIcon](LPResources, "keynoteIcon");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[LPiCloudSharingMetadata application](self, "application");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("iCloud Drive"));

          if (v13)
          {
            +[LPResources iCloudDriveIcon](LPResources, "iCloudDriveIcon");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[LPiCloudSharingMetadata application](self, "application");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Reminders"));

            if (v15)
            {
              +[LPResources remindersIcon](LPResources, "remindersIcon");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              -[LPiCloudSharingMetadata application](self, "application");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Safari"));

              if (v17)
              {
                +[LPResources safariAppIcon](LPResources, "safariAppIcon");
                v5 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                -[LPiCloudSharingMetadata application](self, "application");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Freeform"));

                if (v19)
                {
                  +[LPResources freeformIcon](LPResources, "freeformIcon");
                  v5 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v5 = 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (id)computeThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[LPiCloudSharingMetadata icon](self, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPiCloudSharingMetadata icon](self, "icon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LPiCloudSharingMetadata firstPartyAppIcon](self, "firstPartyAppIcon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      +[LPResources iCloudDriveIcon](LPResources, "iCloudDriveIcon");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v7;

  }
  return v4;
}

- (id)computeIcon
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[LPiCloudSharingMetadata firstPartyAppIcon](self, "firstPartyAppIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[LPiCloudSharingMetadata icon](self, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[LPiCloudSharingMetadata icon](self, "icon");
    else
      +[LPResources iCloudDriveIcon](LPResources, "iCloudDriveIcon");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;

  return v7;
}

- (BOOL)isSafariTabGroupLinkWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  -[LPiCloudSharingMetadata application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LPiCloudSharingMetadata application](self, "application");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Safari"));
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "extractApplicationFromURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("safari-tab-groups"));
  }
  v8 = v7;

  return v8;
}

- (BOOL)isFreeformBoardLinkWithURL:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[LPiCloudSharingMetadata application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "extractApplicationNameFromURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Freeform"));

  return v6;
}

- (id)localizedApplicationNameWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  -[LPiCloudSharingMetadata application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "extractApplicationNameFromURL:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LPLocalizedString(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[LPiCloudSharingMetadata application](self, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("iCloud Drive"));

  if (!v7)
  {
    +[LPiCloudSharingMetadata _bundleIdentifierMap](LPiCloudSharingMetadata, "_bundleIdentifierMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata application](self, "application");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 1, 0);
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "localizedName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v15;
        }
        else
        {
          -[LPiCloudSharingMetadata application](self, "application");
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v8 = v17;

      }
      else
      {
        -[LPiCloudSharingMetadata application](self, "application");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_15;
    }
    -[LPiCloudSharingMetadata application](self, "application");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v8 = (void *)v10;
LABEL_15:

    goto LABEL_16;
  }
  LPLocalizedString(CFSTR("iCloud Drive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v8;
}

- (id)localizedKind
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  __CFString *v7;
  void *v8;
  char v9;
  void *v10;

  -[LPiCloudSharingMetadata application](self, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Reminders"));

  if (!v4)
    goto LABEL_7;
  -[LPiCloudSharingMetadata kind](self, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Shared List"));

  if ((v6 & 1) == 0)
  {
    -[LPiCloudSharingMetadata kind](self, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Template"));

    if ((v9 & 1) != 0)
    {
      v7 = CFSTR("Template");
      goto LABEL_6;
    }
LABEL_7:
    v10 = 0;
    return v10;
  }
  v7 = CFSTR("Shared List");
LABEL_6:
  LPLocalizedString(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (id)_topLeadingCaptionStringWithApplicationName:(id)a3 originalURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[LPiCloudSharingMetadata title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[LPiCloudSharingMetadata title](self, "title");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v13 = (void *)v9;
    goto LABEL_10;
  }
  if (-[LPiCloudSharingMetadata isFreeformBoardLinkWithURL:](self, "isFreeformBoardLinkWithURL:", v7))
  {
    v10 = CFSTR("Freeform Board");
LABEL_8:
    LPLocalizedString(v10);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!v6)
  {
    v10 = CFSTR("Shared using iCloud Sharing");
    goto LABEL_8;
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Shared from %@"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v13;
}

- (id)_bottomLeadingCaptionStringWithApplicationName:(id)a3 originalURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  __CFString *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[LPiCloudSharingMetadata title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[LPiCloudSharingMetadata application](self, "application");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Reminders"));

    if (v10)
    {
      -[LPiCloudSharingMetadata kind](self, "kind");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Shared List"));

      if ((v12 & 1) != 0)
      {
        v13 = CFSTR("Reminders Shared List");
LABEL_14:
        LPLocalizedString(v13);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      -[LPiCloudSharingMetadata kind](self, "kind");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("Template"));

      if ((v16 & 1) != 0)
      {
        v13 = CFSTR("Reminders Template");
        goto LABEL_14;
      }
    }
    if (-[LPiCloudSharingMetadata isSafariTabGroupLinkWithURL:](self, "isSafariTabGroupLinkWithURL:", v7))
    {
      v13 = CFSTR("Safari Tab Group");
      goto LABEL_14;
    }
    if (!v6)
    {
      v13 = CFSTR("Shared using iCloud Sharing");
      goto LABEL_14;
    }
LABEL_12:
    v17 = v6;
LABEL_15:
    v14 = v17;
    goto LABEL_16;
  }
  if (-[LPiCloudSharingMetadata isFreeformBoardLinkWithURL:](self, "isFreeformBoardLinkWithURL:", v7))
    goto LABEL_12;
  v14 = 0;
LABEL_16:

  return v14;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  LPCaptionBarPresentationProperties *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a3;
  objc_msgSend(v5, "commonPresentationPropertiesForStyle:", 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v6, "setCaptionBar:", v7);

  -[LPiCloudSharingMetadata thumbnail](self, "thumbnail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(v5, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "_populateProperties:withPrimaryImage:", v6, v9);
  if (!v8)
  {

  }
  -[LPiCloudSharingMetadata computeIcon](self, "computeIcon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_populateProperties:withPrimaryIcon:iconProperties:canBecomeImage:", v6, v10, 0, 0);

  objc_msgSend(v5, "originalURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiCloudSharingMetadata localizedApplicationNameWithURL:](self, "localizedApplicationNameWithURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "originalURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiCloudSharingMetadata _topLeadingCaptionStringWithApplicationName:originalURL:](self, "_topLeadingCaptionStringWithApplicationName:originalURL:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "captionBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "top");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leading");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v14);

  objc_msgSend(v5, "originalURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiCloudSharingMetadata _bottomLeadingCaptionStringWithApplicationName:originalURL:](self, "_bottomLeadingCaptionStringWithApplicationName:originalURL:", v12, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "captionBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottom");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leading");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v19);

  return v6;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiCloudURL:](LPPresentationSpecializations, "isiCloudURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiCloudSharingMetadata localizedApplicationNameWithURL:](self, "localizedApplicationNameWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[LPiCloudSharingMetadata title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("Link: “%@” shared from %@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v9, v5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (v5)
  {
    -[LPiCloudSharingMetadata localizedKind](self, "localizedKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3940];
    if (v8)
    {
      LPLocalizedString(CFSTR("Link: %@ shared from %@"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v9, v8, v5);
    }
    else
    {
      LPLocalizedString(CFSTR("Link: Document shared from %@"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v9, v5);
    }
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LPiCloudSharingMetadata title](self, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      LPLocalizedString(CFSTR("Link: Document shared using iCloud Sharing"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("Link: “%@” shared using iCloud Sharing"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v10;

LABEL_12:
  return v14;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (id)fallbackIconForTransformer:(id)a3
{
  +[LPResources iCloudIcon](LPResources, "iCloudIcon", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
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
  id v16;

  v16 = a3;
  objc_msgSend(v16, "originalURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiCloudSharingMetadata localizedApplicationNameWithURL:](self, "localizedApplicationNameWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[LPiCloudSharingMetadata title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("“%@” shared from %@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:", v10);
  }
  else
  {
    if (v5)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      LPLocalizedString(CFSTR("Document shared from %@"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v9);
      goto LABEL_7;
    }
    -[LPiCloudSharingMetadata title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      LPLocalizedString(CFSTR("Document shared using iCloud Sharing"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v8);
      goto LABEL_8;
    }
    v15 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("“%@” shared using iCloud Sharing"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPiCloudSharingMetadata title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:", v10);
  }

LABEL_7:
LABEL_8:

  -[LPiCloudSharingMetadata icon](self, "icon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setIcon:", v12);

  -[LPiCloudSharingMetadata thumbnail](self, "thumbnail");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setImage:", v13);

}

- (id)sharedObjectTitleForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "originalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiCloudSharingMetadata localizedApplicationNameWithURL:](self, "localizedApplicationNameWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "originalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiCloudSharingMetadata _topLeadingCaptionStringWithApplicationName:originalURL:](self, "_topLeadingCaptionStringWithApplicationName:originalURL:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)sharedObjectSubtitleForTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "originalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiCloudSharingMetadata localizedApplicationNameWithURL:](self, "localizedApplicationNameWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "originalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiCloudSharingMetadata _bottomLeadingCaptionStringWithApplicationName:originalURL:](self, "_bottomLeadingCaptionStringWithApplicationName:originalURL:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)sharedObjectInformationForTransformer:(id)a3
{
  -[LPiCloudSharingMetadata localizedKind](self, "localizedKind", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sharedObjectIconForTransformer:(id)a3
{
  -[LPiCloudSharingMetadata computeThumbnail](self, "computeThumbnail", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)sharedObjectPrefersIconAsImageForTransformer:(id)a3
{
  return 0;
}

@end
