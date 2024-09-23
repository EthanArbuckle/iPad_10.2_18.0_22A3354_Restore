@implementation IMSPIAttachment

- (IMSPIAttachment)initWithGuid:(id)a3 fileUrl:(id)a4 transferState:(int64_t)a5 uti:(id)a6 isSticker:(BOOL)a7 isOutgoing:(BOOL)a8 stickerUserInfo:(id)a9 attributionInfo:(id)a10 creationDate:(id)a11 adaptiveImageGlyphContentIdentifier:(id)a12 adaptiveImageGlyphContentDescription:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  IMSPIAttachment *v25;
  uint64_t v26;
  NSString *guid;
  uint64_t v28;
  NSURL *fileUrl;
  uint64_t v30;
  NSString *uti;
  uint64_t v32;
  NSDictionary *stickerUserInfo;
  uint64_t v34;
  NSDictionary *attributionInfo;
  uint64_t v36;
  NSDate *creationDate;
  uint64_t v38;
  NSString *adaptiveImageGlyphContentIdentifier;
  uint64_t v40;
  NSString *adaptiveImageGlyphContentDescription;
  objc_super v45;

  v17 = a3;
  v18 = a4;
  v19 = a6;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v45.receiver = self;
  v45.super_class = (Class)IMSPIAttachment;
  v25 = -[IMSPIAttachment init](&v45, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v17, "copy");
    guid = v25->_guid;
    v25->_guid = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    fileUrl = v25->_fileUrl;
    v25->_fileUrl = (NSURL *)v28;

    v25->_fileTransferState = a5;
    v30 = objc_msgSend(v19, "copy");
    uti = v25->_uti;
    v25->_uti = (NSString *)v30;

    v25->_isSticker = a7;
    v25->_isOutgoing = a8;
    v32 = objc_msgSend(v20, "copy");
    stickerUserInfo = v25->_stickerUserInfo;
    v25->_stickerUserInfo = (NSDictionary *)v32;

    v34 = objc_msgSend(v21, "copy");
    attributionInfo = v25->_attributionInfo;
    v25->_attributionInfo = (NSDictionary *)v34;

    v36 = objc_msgSend(v22, "copy");
    creationDate = v25->_creationDate;
    v25->_creationDate = (NSDate *)v36;

    v38 = objc_msgSend(v23, "copy");
    adaptiveImageGlyphContentIdentifier = v25->_adaptiveImageGlyphContentIdentifier;
    v25->_adaptiveImageGlyphContentIdentifier = (NSString *)v38;

    v40 = objc_msgSend(v24, "copy");
    adaptiveImageGlyphContentDescription = v25->_adaptiveImageGlyphContentDescription;
    v25->_adaptiveImageGlyphContentDescription = (NSString *)v40;

  }
  return v25;
}

- (id)bundleID
{
  return -[NSDictionary objectForKey:](self->_attributionInfo, "objectForKey:", *MEMORY[0x1E0D37F30]);
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_isSticker)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_isOutgoing)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IMSPIAttachment: %p [guid: %@ FileUrl: %@ TransferState: %tu uti: %@ isSticker: %@ isOutgoing: %@ attributionInfo: %@ creationDate: %@]"), self, self->_guid, self->_fileUrl, self->_fileTransferState, self->_uti, v3, v2, self->_attributionInfo, self->_creationDate);
}

- (BOOL)isAdaptiveImageGlyph
{
  return -[NSString length](self->_adaptiveImageGlyphContentIdentifier, "length") != 0;
}

- (NSURL)fileUrl
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)fileTransferState
{
  return self->_fileTransferState;
}

- (void)setFileTransferState:(int64_t)a3
{
  self->_fileTransferState = a3;
}

- (NSString)guid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)uti
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUti:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (void)setIsSticker:(BOOL)a3
{
  self->_isSticker = a3;
}

- (BOOL)isOutgoing
{
  return self->_isOutgoing;
}

- (void)setIsOutgoing:(BOOL)a3
{
  self->_isOutgoing = a3;
}

- (NSDictionary)stickerUserInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)attributionInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAttributionInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)adaptiveImageGlyphContentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)adaptiveImageGlyphContentDescription
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentDescription, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_stickerUserInfo, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_fileUrl, 0);
}

@end
