@implementation CKTransientFileTransfer

- (CKTransientFileTransfer)initWithAttributionInfo:(id)a3
{
  id v4;
  CKTransientFileTransfer *v5;
  CKTransientFileTransfer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKTransientFileTransfer;
  v5 = -[CKTransientFileTransfer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CKTransientFileTransfer setAttributionInfo:](v5, "setAttributionInfo:", v4);

  return v6;
}

- (CKTransientFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 adaptiveImageGlyphContentIdentifier:(id)a6 adaptiveImageGlyphContentDescription:(id)a7 hideAttachment:(BOOL)a8 isScreenshot:(BOOL)a9
{
  return -[CKTransientFileTransfer initWithAttributionInfo:](self, "initWithAttributionInfo:", a5, a4);
}

- (CKTransientFileTransfer)initWithFileURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5 hideAttachment:(BOOL)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return -[CKTransientFileTransfer initWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:](self, "initWithFileURL:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", a3, a4, a5, 0, 0, a6, v7);
}

- (CKTransientFileTransfer)initWithTransferGUID:(id)a3 imMessage:(id)a4
{
  return -[CKTransientFileTransfer initWithAttributionInfo:](self, "initWithAttributionInfo:", self->attributionInfo, a4);
}

- (NSDictionary)attributionInfo
{
  return self->attributionInfo;
}

- (void)setAttributionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)currentBytes
{
  return self->currentBytes;
}

- (NSError)error
{
  return self->error;
}

- (NSString)filename
{
  return self->filename;
}

- (NSString)originalFilename
{
  return self->originalFilename;
}

- (NSURL)fileURL
{
  return self->fileURL;
}

- (NSURL)thumbnailURL
{
  return self->thumbnailURL;
}

- (BOOL)fileIsAnimated
{
  return self->fileIsAnimated;
}

- (NSString)guid
{
  return self->guid;
}

- (IMMessage)IMMessage
{
  return self->IMMessage;
}

- (void)setIMMessage:(id)a3
{
  objc_storeStrong((id *)&self->IMMessage, a3);
}

- (NSDictionary)stickerUserInfo
{
  return self->stickerUserInfo;
}

- (NSDictionary)transcoderUserInfo
{
  return self->transcoderUserInfo;
}

- (int64_t)commSafetySensitive
{
  return self->commSafetySensitive;
}

- (BOOL)isThumbnail
{
  return self->thumbnail;
}

- (BOOL)isDownloadable
{
  return self->downloadable;
}

- (BOOL)isDownloading
{
  return self->downloading;
}

- (BOOL)isFileDataReady
{
  return self->fileDataReady;
}

- (BOOL)isRejected
{
  return self->rejected;
}

- (BOOL)isFileURLFinalized
{
  return self->fileURLFinalized;
}

- (BOOL)hideAttachment
{
  return self->hideAttachment;
}

- (BOOL)isDirectory
{
  return self->isDirectory;
}

- (BOOL)isSticker
{
  return self->isSticker;
}

- (NSString)adaptiveImageGlyphContentIdentifier
{
  return self->adaptiveImageGlyphContentIdentifier;
}

- (NSString)adaptiveImageGlyphContentDescription
{
  return self->adaptiveImageGlyphContentDescription;
}

- (BOOL)isAdaptiveImageGlyph
{
  return self->isAdaptiveImageGlyph;
}

- (unint64_t)totalBytes
{
  return self->totalBytes;
}

- (BOOL)isFromMomentShare
{
  return self->isFromMomentShare;
}

- (NSURL)shareURL
{
  return self->shareURL;
}

- (NSString)audioTranscriptionText
{
  return self->audioTranscriptionText;
}

- (BOOL)isRestoring
{
  return self->restoring;
}

- (BOOL)isScreenshot
{
  return self->isScreenshot;
}

- (int64_t)updateReason
{
  return self->updateReason;
}

- (unint64_t)stickerEffectType
{
  return self->stickerEffectType;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  self->stickerEffectType = a3;
}

- (NSURL)animatedImageCacheURL
{
  return self->animatedImageCacheURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->animatedImageCacheURL, 0);
  objc_storeStrong((id *)&self->audioTranscriptionText, 0);
  objc_storeStrong((id *)&self->shareURL, 0);
  objc_storeStrong((id *)&self->adaptiveImageGlyphContentDescription, 0);
  objc_storeStrong((id *)&self->adaptiveImageGlyphContentIdentifier, 0);
  objc_storeStrong((id *)&self->transcoderUserInfo, 0);
  objc_storeStrong((id *)&self->stickerUserInfo, 0);
  objc_storeStrong((id *)&self->IMMessage, 0);
  objc_storeStrong((id *)&self->guid, 0);
  objc_storeStrong((id *)&self->thumbnailURL, 0);
  objc_storeStrong((id *)&self->fileURL, 0);
  objc_storeStrong((id *)&self->originalFilename, 0);
  objc_storeStrong((id *)&self->filename, 0);
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong((id *)&self->attributionInfo, 0);
}

@end
