@implementation SFTabStateData

- (SFTabStateData)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  SFTabStateData *v5;
  uint64_t v6;
  NSString *UUIDString;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *url;
  uint64_t v12;
  NSString *userVisibleURL;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSData *sessionStateData;
  uint64_t v21;
  NSString *owningBrowserWindowUUIDString;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  NSData *v29;
  SFTabStateData *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SFTabStateData;
  v5 = -[SFTabStateData init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("SafariStateDocumentUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUIDString = v5->_UUIDString;
    v5->_UUIDString = (NSString *)v6;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("SafariStateDocumentTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("SafariStateDocumentURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v10;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("SafariStateDocumentUserVisibleURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    userVisibleURL = v5->_userVisibleURL;
    v5->_userVisibleURL = (NSString *)v12;

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("SafariStateDocumentOrderIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_orderIndex = objc_msgSend(v14, "integerValue");

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("SafariStateDocumentLastViewedTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v5->_lastViewedTime = v16;

    objc_msgSend(v4, "safari_numberForKey:", CFSTR("SafariStateDocumentBookmark"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_readingListBookmarkID = objc_msgSend(v17, "intValue");

    v5->_wasOpenedFromLink = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("SafariStateDocumentWasOpenedFromLink"));
    v5->_showingReader = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("SafariStateDocumentShouldRestoreReader"));
    objc_msgSend(v4, "safari_numberForKey:", CFSTR("SafariStateDocumentReaderViewTopScrollOffset"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_readerViewTopScrollOffset = objc_msgSend(v18, "integerValue");

    v5->_privateBrowsing = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("SafariStateDocumentUsesPrivateBrowsingStyle"));
    v5->_displayingStandaloneImage = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("SafariStateDocumentDisplayingStandaloneImage"));
    objc_msgSend(v4, "safari_dataForKey:", CFSTR("SafariStateDocumentSessionState"));
    v19 = objc_claimAutoreleasedReturnValue();
    sessionStateData = v5->_sessionStateData;
    v5->_sessionStateData = (NSData *)v19;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("SafariStateDocumentOwningBrowserWindowUUID"));
    v21 = objc_claimAutoreleasedReturnValue();
    owningBrowserWindowUUIDString = v5->_owningBrowserWindowUUIDString;
    v5->_owningBrowserWindowUUIDString = (NSString *)v21;

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("SafariStateDocumentTabGroupUUID"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (__CFString *)v23;
    else
      v25 = &stru_1E21FE780;
    objc_storeStrong((id *)&v5->_tabGroupUUID, v25);

    objc_msgSend(v4, "safari_stringForKey:", CFSTR("SafariStateDocumentProfileUUID"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (__CFString *)v26;
    else
      v28 = &stru_1E21FE780;
    objc_storeStrong((id *)&v5->_profileIdentifier, v28);

    v5->_uncompressedSessionStateDataSize = -[NSData length](v5->_sessionStateData, "length");
    if (-[NSData length](v5->_sessionStateData, "length") > 0x200000)
    {
      v29 = v5->_sessionStateData;
      v5->_sessionStateData = 0;

      v5->_uncompressedSessionStateDataSize = 0;
    }
    v30 = v5;
  }

  return v5;
}

- (SFTabStateData)initWithSQLiteRow:(id)a3
{
  id v4;
  SFTabStateData *v5;
  uint64_t v6;
  NSString *UUIDString;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *url;
  uint64_t v12;
  NSString *userVisibleURL;
  double v14;
  uint64_t v15;
  NSString *owningBrowserWindowUUIDString;
  uint64_t v17;
  NSString *tabGroupUUID;
  uint64_t v19;
  NSString *profileIdentifier;
  SFTabStateData *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFTabStateData;
  v5 = -[SFTabStateData init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "stringAtIndex:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    UUIDString = v5->_UUIDString;
    v5->_UUIDString = (NSString *)v6;

    objc_msgSend(v4, "stringAtIndex:", 2);
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "stringAtIndex:", 3);
    v10 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v10;

    objc_msgSend(v4, "stringAtIndex:", 4);
    v12 = objc_claimAutoreleasedReturnValue();
    userVisibleURL = v5->_userVisibleURL;
    v5->_userVisibleURL = (NSString *)v12;

    v5->_orderIndex = (int)objc_msgSend(v4, "intAtIndex:", 5);
    objc_msgSend(v4, "doubleAtIndex:", 6);
    v5->_lastViewedTime = v14;
    v5->_readingListBookmarkID = objc_msgSend(v4, "intAtIndex:", 7);
    v5->_wasOpenedFromLink = objc_msgSend(v4, "intAtIndex:", 8) != 0;
    v5->_showingReader = objc_msgSend(v4, "BOOLAtIndex:", 9);
    v5->_readerViewTopScrollOffset = (int)objc_msgSend(v4, "intAtIndex:", 10);
    v5->_privateBrowsing = objc_msgSend(v4, "BOOLAtIndex:", 11);
    v5->_displayingStandaloneImage = objc_msgSend(v4, "BOOLAtIndex:", 12);
    objc_msgSend(v4, "stringAtIndex:", 13);
    v15 = objc_claimAutoreleasedReturnValue();
    owningBrowserWindowUUIDString = v5->_owningBrowserWindowUUIDString;
    v5->_owningBrowserWindowUUIDString = (NSString *)v15;

    objc_msgSend(v4, "stringAtIndex:", 15);
    v17 = objc_claimAutoreleasedReturnValue();
    tabGroupUUID = v5->_tabGroupUUID;
    v5->_tabGroupUUID = (NSString *)v17;

    objc_msgSend(v4, "stringAtIndex:", 16);
    v19 = objc_claimAutoreleasedReturnValue();
    profileIdentifier = v5->_profileIdentifier;
    v5->_profileIdentifier = (NSString *)v19;

    v21 = v5;
  }

  return v5;
}

- (NSData)compressedSessionStateData
{
  NSUInteger v3;
  NSData *sessionStateData;
  NSData *v5;
  uint8_t *v6;
  size_t v7;
  void *v8;

  v3 = -[NSData length](self->_sessionStateData, "length");
  sessionStateData = self->_sessionStateData;
  if (!(v3 >> 20))
  {
    v5 = sessionStateData;
LABEL_6:
    v8 = v5;
    return (NSData *)v8;
  }
  v6 = (uint8_t *)malloc_type_malloc(-[NSData length](sessionStateData, "length"), 0x33F8DD09uLL);
  v7 = compression_encode_buffer(v6, -[NSData length](self->_sessionStateData, "length"), (const uint8_t *)-[NSData bytes](self->_sessionStateData, "bytes"), -[NSData length](self->_sessionStateData, "length"), 0, COMPRESSION_LZ4);
  if (!v7)
  {
    free(v6);
    v5 = self->_sessionStateData;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  free(v6);
  return (NSData *)v8;
}

- (void)_uncompressSessionStateDataIfNeeded
{
  NSData *v3;
  NSData *sessionStateData;

  if (-[SFTabStateData isSessionStateDataCompressed](self, "isSessionStateDataCompressed"))
  {
    objc_msgSend((id)objc_opt_class(), "uncompressedDataWithRawData:uncompressedSize:", self->_sessionStateData, self->_uncompressedSessionStateDataSize);
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();
    sessionStateData = self->_sessionStateData;
    self->_sessionStateData = v3;

  }
}

- (BOOL)isSessionStateDataCompressed
{
  unint64_t uncompressedSessionStateDataSize;

  uncompressedSessionStateDataSize = self->_uncompressedSessionStateDataSize;
  return uncompressedSessionStateDataSize
      && uncompressedSessionStateDataSize != -[NSData length](self->_sessionStateData, "length");
}

+ (id)uncompressedDataWithRawData:(id)a3 uncompressedSize:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint8_t *v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (a4 && objc_msgSend(v5, "length") && objc_msgSend(v6, "length") != a4)
  {
    v10 = (uint8_t *)malloc_type_malloc(a4, 0x1072897uLL);
    v11 = objc_retainAutorelease(v6);
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v10, compression_decode_buffer(v10, a4, (const uint8_t *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), 0, COMPRESSION_LZ4));
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  const __CFString *UUIDString;
  NSString *title;
  const __CFString *v5;
  const __CFString *url;
  NSString *userVisibleURL;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSData *sessionStateData;
  void *v16;
  const __CFString *owningBrowserWindowUUIDString;
  const __CFString *tabGroupUUID;
  const __CFString *profileIdentifier;
  void *v20;
  void *v22;
  void *v23;
  _QWORD v24[16];
  _QWORD v25[4];
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  UUIDString = (const __CFString *)self->_UUIDString;
  title = self->_title;
  if (!UUIDString)
    UUIDString = &stru_1E21FE780;
  v24[0] = CFSTR("SafariStateDocumentUUID");
  v24[1] = CFSTR("SafariStateDocumentTitle");
  if (title)
    v5 = (const __CFString *)title;
  else
    v5 = &stru_1E21FE780;
  v25[0] = UUIDString;
  v25[1] = v5;
  url = (const __CFString *)self->_url;
  userVisibleURL = self->_userVisibleURL;
  if (!url)
    url = &stru_1E21FE780;
  v24[2] = CFSTR("SafariStateDocumentURL");
  v24[3] = CFSTR("SafariStateDocumentUserVisibleURL");
  if (userVisibleURL)
    v8 = (const __CFString *)userVisibleURL;
  else
    v8 = &stru_1E21FE780;
  v25[2] = url;
  v25[3] = v8;
  v24[4] = CFSTR("SafariStateDocumentOrderIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_orderIndex);
  v26 = objc_claimAutoreleasedReturnValue();
  v24[5] = CFSTR("SafariStateDocumentLastViewedTime");
  v23 = (void *)v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastViewedTime);
  v27 = objc_claimAutoreleasedReturnValue();
  v24[6] = CFSTR("SafariStateDocumentBookmark");
  v22 = (void *)v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_readingListBookmarkID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v9;
  v24[7] = CFSTR("SafariStateDocumentWasOpenedFromLink");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wasOpenedFromLink);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v10;
  v24[8] = CFSTR("SafariStateDocumentShouldRestoreReader");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_showingReader);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v11;
  v24[9] = CFSTR("SafariStateDocumentReaderViewTopScrollOffset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_readerViewTopScrollOffset);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v12;
  v24[10] = CFSTR("SafariStateDocumentUsesPrivateBrowsingStyle");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_privateBrowsing);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v13;
  v24[11] = CFSTR("SafariStateDocumentDisplayingStandaloneImage");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_displayingStandaloneImage);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v14;
  v24[12] = CFSTR("SafariStateDocumentSessionState");
  sessionStateData = self->_sessionStateData;
  v16 = sessionStateData;
  if (!sessionStateData)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  owningBrowserWindowUUIDString = (const __CFString *)self->_owningBrowserWindowUUIDString;
  if (!owningBrowserWindowUUIDString)
    owningBrowserWindowUUIDString = &stru_1E21FE780;
  v34 = v16;
  v35 = owningBrowserWindowUUIDString;
  v24[13] = CFSTR("SafariStateDocumentOwningBrowserWindowUUID");
  v24[14] = CFSTR("SafariStateDocumentTabGroupUUID");
  v24[15] = CFSTR("SafariStateDocumentProfileUUID");
  tabGroupUUID = (const __CFString *)self->_tabGroupUUID;
  profileIdentifier = (const __CFString *)self->_profileIdentifier;
  if (!tabGroupUUID)
    tabGroupUUID = &stru_1E21FE780;
  if (!profileIdentifier)
    profileIdentifier = &stru_1E21FE780;
  v36 = tabGroupUUID;
  v37 = profileIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!sessionStateData)

  return (NSDictionary *)v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SFTabStateData *v4;
  void *v5;
  SFTabStateData *v6;

  v4 = +[SFTabStateData allocWithZone:](SFTabStateData, "allocWithZone:", a3);
  -[SFTabStateData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFTabStateData initWithDictionaryRepresentation:](v4, "initWithDictionaryRepresentation:", v5);

  return v6;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (void)setUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)userVisibleURL
{
  return self->_userVisibleURL;
}

- (void)setUserVisibleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)orderIndex
{
  return self->_orderIndex;
}

- (void)setOrderIndex:(int64_t)a3
{
  self->_orderIndex = a3;
}

- (double)lastViewedTime
{
  return self->_lastViewedTime;
}

- (void)setLastViewedTime:(double)a3
{
  self->_lastViewedTime = a3;
}

- (int64_t)readerViewTopScrollOffset
{
  return self->_readerViewTopScrollOffset;
}

- (void)setReaderViewTopScrollOffset:(int64_t)a3
{
  self->_readerViewTopScrollOffset = a3;
}

- (BOOL)showingReader
{
  return self->_showingReader;
}

- (void)setShowingReader:(BOOL)a3
{
  self->_showingReader = a3;
}

- (BOOL)displayingStandaloneImage
{
  return self->_displayingStandaloneImage;
}

- (void)setDisplayingStandaloneImage:(BOOL)a3
{
  self->_displayingStandaloneImage = a3;
}

- (BOOL)wasOpenedFromLink
{
  return self->_wasOpenedFromLink;
}

- (void)setWasOpenedFromLink:(BOOL)a3
{
  self->_wasOpenedFromLink = a3;
}

- (BOOL)privateBrowsing
{
  return self->_privateBrowsing;
}

- (void)setPrivateBrowsing:(BOOL)a3
{
  self->_privateBrowsing = a3;
}

- (NSData)sessionStateData
{
  return self->_sessionStateData;
}

- (void)setSessionStateData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)owningBrowserWindowDatabaseID
{
  return self->_owningBrowserWindowDatabaseID;
}

- (void)setOwningBrowserWindowDatabaseID:(int64_t)a3
{
  self->_owningBrowserWindowDatabaseID = a3;
}

- (NSString)owningBrowserWindowUUIDString
{
  return self->_owningBrowserWindowUUIDString;
}

- (void)setOwningBrowserWindowUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)skipUpdate
{
  return self->_skipUpdate;
}

- (void)setSkipUpdate:(BOOL)a3
{
  self->_skipUpdate = a3;
}

- (unint64_t)uncompressedSessionStateDataSize
{
  return self->_uncompressedSessionStateDataSize;
}

- (void)setUncompressedSessionStateDataSize:(unint64_t)a3
{
  self->_uncompressedSessionStateDataSize = a3;
}

- (BOOL)skipSavingSessionState
{
  return self->_skipSavingSessionState;
}

- (void)setSkipSavingSessionState:(BOOL)a3
{
  self->_skipSavingSessionState = a3;
}

- (NSString)tabGroupUUID
{
  return self->_tabGroupUUID;
}

- (void)setTabGroupUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int)readingListBookmarkID
{
  return self->_readingListBookmarkID;
}

- (void)setReadingListBookmarkID:(int)a3
{
  self->_readingListBookmarkID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_tabGroupUUID, 0);
  objc_storeStrong((id *)&self->_owningBrowserWindowUUIDString, 0);
  objc_storeStrong((id *)&self->_sessionStateData, 0);
  objc_storeStrong((id *)&self->_userVisibleURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
}

@end
