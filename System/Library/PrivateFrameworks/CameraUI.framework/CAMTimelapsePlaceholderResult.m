@implementation CAMTimelapsePlaceholderResult

- (CAMTimelapsePlaceholderResult)initWithAssetUUID:(id)a3 captureSession:(unsigned __int16)a4 creationDate:(id)a5 captureOrientation:(int64_t)a6 captureDevice:(int64_t)a7 videoDimensions:(CGSize)a8 duration:(double)a9 previewImageSurface:(void *)a10 localPrivateMetadataFileURL:(id)a11
{
  CGFloat height;
  CGFloat width;
  id v20;
  id v21;
  id v22;
  CAMTimelapsePlaceholderResult *v23;
  uint64_t v24;
  NSString *assetUUID;
  uint64_t v26;
  NSURL *localPrivateMetadataFileURL;
  CAMTimelapsePlaceholderResult *v28;
  objc_super v30;

  height = a8.height;
  width = a8.width;
  v20 = a3;
  v21 = a5;
  v22 = a11;
  v30.receiver = self;
  v30.super_class = (Class)CAMTimelapsePlaceholderResult;
  v23 = -[CAMTimelapsePlaceholderResult init](&v30, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v20, "copy");
    assetUUID = v23->_assetUUID;
    v23->_assetUUID = (NSString *)v24;

    v23->_sessionIdentifier = a4;
    objc_storeStrong((id *)&v23->_creationDate, a5);
    v23->_captureOrientation = a6;
    v23->_captureDevice = a7;
    v23->_videoDimensions.width = width;
    v23->_videoDimensions.height = height;
    v23->_timelapseDuration = a9;
    if (a10)
    {
      v23->_previewImageSurface = a10;
      CFRetain(a10);
    }
    v26 = objc_msgSend(v22, "copy");
    localPrivateMetadataFileURL = v23->_localPrivateMetadataFileURL;
    v23->_localPrivateMetadataFileURL = (NSURL *)v26;

    v28 = v23;
  }

  return v23;
}

- (void)dealloc
{
  void *previewImageSurface;
  objc_super v4;

  previewImageSurface = self->_previewImageSurface;
  if (previewImageSurface)
  {
    CFRelease(previewImageSurface);
    self->_previewImageSurface = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMTimelapsePlaceholderResult;
  -[CAMTimelapsePlaceholderResult dealloc](&v4, sel_dealloc);
}

- (unint64_t)mediaType
{
  return 2;
}

- (unint64_t)mediaSubtypes
{
  return 0x40000;
}

- (NSURL)persistenceURL
{
  return 0;
}

- (UIImage)placeholderImage
{
  void *v2;

  v2 = -[CAMTimelapsePlaceholderResult previewImageSurface](self, "previewImageSurface");
  if (v2)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "_initWithIOSurface:scale:orientation:", v2, 0, 1.0);
  return (UIImage *)v2;
}

- (NSDictionary)stillImageMetadata
{
  return 0;
}

- (NSString)burstIdentifier
{
  return 0;
}

- (unint64_t)numberOfRepresentedAssets
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  return self;
}

- (CGSize)finalExpectedPixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_videoDimensions.width;
  height = self->_videoDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)irisStillImageUUID
{
  return 0;
}

- (BOOL)isExpectingPairedVideo
{
  return 0;
}

- (NSURL)irisVideoPersistenceURL
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisStillDisplayTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (BOOL)isTransientAssetTemporaryPlaceholder
{
  return 1;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)captureOrientation
{
  return self->_captureOrientation;
}

- (int64_t)captureDevice
{
  return self->_captureDevice;
}

- (CGSize)videoDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_videoDimensions.width;
  height = self->_videoDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)timelapseDuration
{
  return self->_timelapseDuration;
}

- (void)previewImageSurface
{
  return self->_previewImageSurface;
}

- (NSURL)localPrivateMetadataFileURL
{
  return self->_localPrivateMetadataFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPrivateMetadataFileURL, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

@end
