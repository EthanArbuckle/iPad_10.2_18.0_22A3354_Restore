@implementation AVAssetInspector

- (NSArray)trackIDs
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  objc_class *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  v6 = (objc_class *)objc_opt_class();
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)AVRequestConcreteImplementation((objc_class *)self, a3, v6);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return result;
}

- (float)preferredRate
{
  return 1.0;
}

- (float)preferredVolume
{
  return 1.0;
}

- (float)preferredSoundCheckVolumeNormalization
{
  return 0.0;
}

- (CGAffineTransform)preferredTransform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumTimeOffsetFromLive
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int)naturalTimeScale
{
  return 600;
}

- (BOOL)providesPreciseDurationAndTiming
{
  return 0;
}

- (int64_t)trackCount
{
  return 0;
}

- (NSArray)alternateTrackGroups
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSDictionary)trackReferences
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (NSArray)_mediaSelectionGroupDictionaries
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSDictionary)_localizedMediaSelectionOptionDisplayNames
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (AVMetadataItem)creationDate
{
  return 0;
}

- (NSString)lyrics
{
  return 0;
}

- (NSArray)commonMetadata
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (NSArray)availableMetadataFormats
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)metadataForFormat:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", a3);
}

- (NSString)identifyingTagClass
{
  return 0;
}

- (NSString)identifyingTag
{
  return 0;
}

- (NSUUID)httpSessionIdentifier
{
  return 0;
}

- (BOOL)hasProtectedContent
{
  return 0;
}

- (BOOL)isPlayable
{
  return 0;
}

- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3
{
  return 0;
}

- (BOOL)isExportable
{
  return 0;
}

- (BOOL)isReadable
{
  return 0;
}

- (BOOL)isComposable
{
  return 0;
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  return 0;
}

- (BOOL)isCompatibleWithAirPlayVideo
{
  return 0;
}

- (NSData)SHA1Digest
{
  return 0;
}

- (BOOL)canContainFragments
{
  return 0;
}

- (BOOL)containsFragments
{
  return 0;
}

- (int64_t)firstFragmentSequenceNumber
{
  return 0;
}

- (int64_t)fragmentCount
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overallDurationHint
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return self;
}

- (BOOL)supportsAnalysisReporting
{
  return 0;
}

- (NSArray)_assetAnalysisMessages
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (int64_t)_moovAtomSize
{
  return 0;
}

- (id)propertyListForProxy
{
  return 0;
}

- (id)makePropertyListForProxyWithOptions:(id)a3
{
  return 0;
}

- (BOOL)_isDefunct
{
  return 0;
}

- (CGSize)maximumVideoResolution
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSArray)availableVideoDynamicRanges
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (AVDisplayCriteria)preferredDisplayCriteria
{
  AVDisplayCriteria *v2;
  double v3;

  v2 = [AVDisplayCriteria alloc];
  LODWORD(v3) = 0;
  return -[AVDisplayCriteria initWithRefreshRate:videoDynamicRange:](v2, "initWithRefreshRate:videoDynamicRange:", 0, v3);
}

@end
