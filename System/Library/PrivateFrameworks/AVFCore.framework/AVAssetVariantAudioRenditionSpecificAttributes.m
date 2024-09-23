@implementation AVAssetVariantAudioRenditionSpecificAttributes

- (NSInteger)channelCount
{
  return objc_msgSend((id)objc_msgSend((id)-[FigAlternateObjC audioAttributes](self->_figAlternateObjC, "audioAttributes"), "channelCountForMediaOption:", -[AVMediaSelectionOption dictionary](self->_mediaSelectionOption, "dictionary")), "integerValue");
}

- (BOOL)isBinaural
{
  return objc_msgSend((id)objc_msgSend((id)-[FigAlternateObjC audioAttributes](self->_figAlternateObjC, "audioAttributes"), "isBinauralMediaOption:", -[AVMediaSelectionOption dictionary](self->_mediaSelectionOption, "dictionary")), "BOOLValue");
}

- (BOOL)isImmersive
{
  return objc_msgSend((id)objc_msgSend((id)-[FigAlternateObjC audioAttributes](self->_figAlternateObjC, "audioAttributes"), "isImmersiveMediaOption:", -[AVMediaSelectionOption dictionary](self->_mediaSelectionOption, "dictionary")), "BOOLValue");
}

- (BOOL)isDownmix
{
  return objc_msgSend((id)objc_msgSend((id)-[FigAlternateObjC audioAttributes](self->_figAlternateObjC, "audioAttributes"), "isDownmixMediaOption:", -[AVMediaSelectionOption dictionary](self->_mediaSelectionOption, "dictionary")), "BOOLValue");
}

- (double)sampleRate
{
  double result;

  objc_msgSend((id)objc_msgSend((id)-[FigAlternateObjC audioAttributes](self->_figAlternateObjC, "audioAttributes"), "sampleRateForMediaOption:", -[AVMediaSelectionOption dictionary](self->_mediaSelectionOption, "dictionary")), "doubleValue");
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantAudioRenditionSpecificAttributes;
  -[AVAssetVariantAudioRenditionSpecificAttributes dealloc](&v3, sel_dealloc);
}

- (AVAssetVariantAudioRenditionSpecificAttributes)initWithFigAlternateObjC:(id)a3 mediaSelectionOption:(id)a4
{
  AVAssetVariantAudioRenditionSpecificAttributes *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVAssetVariantAudioRenditionSpecificAttributes;
  v6 = -[AVAssetVariantAudioRenditionSpecificAttributes init](&v8, sel_init);
  if (v6)
  {
    v6->_figAlternateObjC = (FigAlternateObjC *)a3;
    v6->_mediaSelectionOption = (AVMediaSelectionOption *)a4;
  }
  return v6;
}

@end
