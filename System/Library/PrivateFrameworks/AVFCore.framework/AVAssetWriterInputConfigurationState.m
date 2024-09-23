@implementation AVAssetWriterInputConfigurationState

- (void)dealloc
{
  opaqueCMFormatDescription *sourceFormatHint;
  objc_super v4;

  sourceFormatHint = self->_sourceFormatHint;
  if (sourceFormatHint)
    CFRelease(sourceFormatHint);

  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputConfigurationState;
  -[AVAssetWriterInputConfigurationState dealloc](&v4, sel_dealloc);
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (AVOutputSettings)outputSettings
{
  return self->_outputSettings;
}

- (void)setOutputSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (opaqueCMFormatDescription)sourceFormatHint
{
  return self->_sourceFormatHint;
}

- (void)setSourceFormatHint:(opaqueCMFormatDescription *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)trackID
{
  return self->_trackID;
}

- (void)setTrackID:(int)a3
{
  self->_trackID = a3;
}

- (NSDictionary)sourcePixelBufferAttributes
{
  return self->_sourcePixelBufferAttributes;
}

- (void)setSourcePixelBufferAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)metadataItems
{
  return self->_metadataItems;
}

- (void)setMetadataItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (int)mediaTimeScale
{
  return self->_mediaTimeScale;
}

- (void)setMediaTimeScale:(int)a3
{
  self->_mediaTimeScale = a3;
}

- (BOOL)expectsMediaDataInRealTime
{
  return self->_expectsMediaDataInRealTime;
}

- (void)setExpectsMediaDataInRealTime:(BOOL)a3
{
  self->_expectsMediaDataInRealTime = a3;
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_naturalSize.width;
  height = self->_naturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  self->_naturalSize = a3;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)extendedLanguageTag
{
  return self->_extendedLanguageTag;
}

- (void)setExtendedLanguageTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)marksOutputTrackAsEnabled
{
  return self->_marksOutputTrackAsEnabled;
}

- (void)setMarksOutputTrackAsEnabled:(BOOL)a3
{
  self->_marksOutputTrackAsEnabled = a3;
}

- (float)preferredVolume
{
  return self->_preferredVolume;
}

- (void)setPreferredVolume:(float)a3
{
  self->_preferredVolume = a3;
}

- (int64_t)layer
{
  return self->_layer;
}

- (void)setLayer:(int64_t)a3
{
  self->_layer = a3;
}

- (signed)alternateGroupID
{
  return self->_alternateGroupID;
}

- (void)setAlternateGroupID:(signed __int16)a3
{
  self->_alternateGroupID = a3;
}

- (signed)provisionalAlternateGroupID
{
  return self->_provisionalAlternateGroupID;
}

- (void)setProvisionalAlternateGroupID:(signed __int16)a3
{
  self->_provisionalAlternateGroupID = a3;
}

- (NSDictionary)trackReferences
{
  return self->_trackReferences;
}

- (void)setTrackReferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)performsMultiPassEncodingIfSupported
{
  return self->_performsMultiPassEncodingIfSupported;
}

- (void)setPerformsMultiPassEncodingIfSupported:(BOOL)a3
{
  self->_performsMultiPassEncodingIfSupported = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredMediaChunkDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[7].var2;
  retstr->var3 = *(int64_t *)((char *)&self[8].var0 + 4);
  return self;
}

- (void)setPreferredMediaChunkDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_chunkDuration.flags = a3->var3;
  *(_OWORD *)(&self->_performsMultiPassEncodingIfSupported + 4) = v3;
}

- (int64_t)preferredMediaChunkAlignment
{
  return self->_chunkAlignment;
}

- (void)setPreferredMediaChunkAlignment:(int64_t)a3
{
  self->_chunkAlignment = a3;
}

- (int64_t)preferredMediaChunkSize
{
  return self->_chunkSize;
}

- (void)setPreferredMediaChunkSize:(int64_t)a3
{
  self->_chunkSize = a3;
}

- (NSString)mediaDataLocation
{
  return self->_mediaDataLocation;
}

- (void)setMediaDataLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSURL)sampleReferenceBaseURL
{
  return self->_sampleReferenceBaseURL;
}

- (void)setSampleReferenceBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)maximizePowerEfficiency
{
  return self->_maximizePowerEfficiency;
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
  self->_maximizePowerEfficiency = a3;
}

@end
