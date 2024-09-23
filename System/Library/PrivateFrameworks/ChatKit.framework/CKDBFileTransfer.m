@implementation CKDBFileTransfer

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDBFileTransfer;
  -[CKDBFileTransfer description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDBFileTransfer guid](self, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDBFileTransfer fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDBFileTransfer transcoderUserInfo](self, "transcoderUserInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDBFileTransfer filename](self, "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ transferGUID:%@ fileURL:%@ transcoderUserInfo:%@ filename:%@]"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (CKDBFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 adaptiveImageGlyphContentIdentifier:(id)a6 adaptiveImageGlyphContentDescription:(id)a7 hideAttachment:(BOOL)a8 isScreenshot:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CKDBFileTransfer *v20;
  void *v21;
  uint64_t v22;
  NSString *guid;
  uint64_t v24;
  NSURL *fileURL;
  uint64_t v26;
  NSDictionary *transcoderUserInfo;
  uint64_t v28;
  NSDictionary *attributionInfo;
  uint64_t v30;
  NSString *adaptiveImageGlyphContentIdentifier;
  uint64_t v32;
  NSString *adaptiveImageGlyphContentDescription;
  objc_super v35;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v35.receiver = self;
  v35.super_class = (Class)CKDBFileTransfer;
  v20 = -[CKDBFileTransfer init](&v35, sel_init);
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    guid = v20->_guid;
    v20->_guid = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    fileURL = v20->_fileURL;
    v20->_fileURL = (NSURL *)v24;

    v26 = objc_msgSend(v16, "copy");
    transcoderUserInfo = v20->_transcoderUserInfo;
    v20->_transcoderUserInfo = (NSDictionary *)v26;

    v28 = objc_msgSend(v17, "copy");
    attributionInfo = v20->_attributionInfo;
    v20->_attributionInfo = (NSDictionary *)v28;

    v20->_isSticker = 0;
    v30 = objc_msgSend(v18, "copy");
    adaptiveImageGlyphContentIdentifier = v20->_adaptiveImageGlyphContentIdentifier;
    v20->_adaptiveImageGlyphContentIdentifier = (NSString *)v30;

    v32 = objc_msgSend(v19, "copy");
    adaptiveImageGlyphContentDescription = v20->_adaptiveImageGlyphContentDescription;
    v20->_adaptiveImageGlyphContentDescription = (NSString *)v32;

    v20->_isScreenshot = 0;
    v20->_commSafetySensitive = 0;
    v20->_hideAttachment = a8;
  }

  return v20;
}

- (CKDBFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  CKDBFileTransfer *v13;
  uint64_t v15;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  LOBYTE(v15) = IMIsImageURLAScreenshot();
  v13 = -[CKDBFileTransfer initWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:](self, "initWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", v12, v11, v10, 0, 0, v6, v15);

  return v13;
}

- (CKDBFileTransfer)initWithTransferGUID:(id)a3 imMessage:(id)a4
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0CB3488];
  v7 = a3;
  objc_msgSend(v6, "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKDBFileTransfer.m"), 70, CFSTR("-initWithTransferGUID (%@) should not be called for CKDBFileTransfer"), v7);

  return 0;
}

- (BOOL)fileIsAnimated
{
  void *v2;
  char v3;

  IMUTITypeForFilename();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMUTTypeIsSupportedAnimatedImage())
    v3 = IMFileURLIsActuallyAnimated();
  else
    v3 = 0;

  return v3;
}

- (NSString)filename
{
  void *v3;
  NSString *v4;

  -[CKDBFileTransfer fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    v4 = self->_filename;
  return v4;
}

- (NSString)originalFilename
{
  void *v3;
  NSString *v4;

  -[CKDBFileTransfer fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    v4 = self->_originalFilename;
  return v4;
}

- (NSError)error
{
  void *v2;

  if (-[CKDBFileTransfer transferState](self, "transferState") == 6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CKFileTransferErrorDomain"), 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSError *)v2;
}

- (unint64_t)currentBytes
{
  return 0;
}

- (unint64_t)totalBytes
{
  return 0;
}

- (BOOL)isFileURLFinalized
{
  return CKFileTransferIsFileURLFinalized(-[CKDBFileTransfer transferState](self, "transferState"));
}

- (BOOL)isFileDataReady
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = -[CKDBFileTransfer isFileURLFinalized](self, "isFileURLFinalized");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDBFileTransfer fileURL](self, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "fileExistsAtPath:", v6);

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (BOOL)isRejected
{
  return -[CKDBFileTransfer transferState](self, "transferState") == 8;
}

- (BOOL)isThumbnail
{
  return -[CKDBFileTransfer transferState](self, "transferState") == 9;
}

- (BOOL)isDownloadable
{
  return CKFileTransferIsDownloadable(-[CKDBFileTransfer isFileDataReady](self, "isFileDataReady"), -[CKDBFileTransfer transferState](self, "transferState"));
}

- (BOOL)isDownloading
{
  return CKFileTransferIsDownloading(-[CKDBFileTransfer isFileDataReady](self, "isFileDataReady"), -[CKDBFileTransfer transferState](self, "transferState"));
}

- (BOOL)isRestoring
{
  return 0;
}

- (BOOL)isAdaptiveImageGlyph
{
  return -[NSString length](self->_adaptiveImageGlyphContentIdentifier, "length") != 0;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (NSDictionary)transcoderUserInfo
{
  return self->_transcoderUserInfo;
}

- (NSDictionary)stickerUserInfo
{
  return self->_stickerUserInfo;
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (NSString)adaptiveImageGlyphContentIdentifier
{
  return self->_adaptiveImageGlyphContentIdentifier;
}

- (NSString)adaptiveImageGlyphContentDescription
{
  return self->_adaptiveImageGlyphContentDescription;
}

- (int64_t)commSafetySensitive
{
  return self->_commSafetySensitive;
}

- (int64_t)updateReason
{
  return self->_updateReason;
}

- (BOOL)hideAttachment
{
  return self->_hideAttachment;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (BOOL)isFromMomentShare
{
  return self->_isFromMomentShare;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (NSString)audioTranscriptionText
{
  return self->_audioTranscriptionText;
}

- (BOOL)isScreenshot
{
  return self->_isScreenshot;
}

- (unint64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  self->_stickerEffectType = a3;
}

- (NSURL)animatedImageCacheURL
{
  return self->_animatedImageCacheURL;
}

- (int64_t)transferState
{
  return self->_transferState;
}

- (void)setTransferState:(int64_t)a3
{
  self->_transferState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedImageCacheURL, 0);
  objc_storeStrong((id *)&self->_audioTranscriptionText, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentDescription, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentIdentifier, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_stickerUserInfo, 0);
  objc_storeStrong((id *)&self->_transcoderUserInfo, 0);
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
