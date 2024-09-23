@implementation CSAssetDownloadingOption

- (CSAssetDownloadingOption)init
{
  CSAssetDownloadingOption *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSAssetDownloadingOption;
  result = -[CSAssetDownloadingOption init](&v3, sel_init);
  if (result)
  {
    result->_allowGibraltarVoiceTriggerAssetDownloading = 0;
    *(_DWORD *)&result->_allowVoiceTriggerAssetDownloading = 0;
    result->_allowSpeakerRecognitionAssetDownloading = 0;
  }
  return result;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  v2 = CFSTR("YES");
  if (self->_allowVoiceTriggerAssetDownloading)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (self->_allowEndpointAssetDownloading)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (self->_allowLanguageDetectorAssetDownloading)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (self->_allowAdBlockerAssetDownloading)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (self->_allowSpeakerRecognitionAssetDownloading)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (!self->_allowGibraltarVoiceTriggerAssetDownloading)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set option : allowVoiceTriggerAssetsDownload ? %@;           allowEndpointAssetDownload ? %@;           allowLanguageDetectorAssetDownload ? %@;           allowAdBlockerAssetDownload ? %@;           allowSpeakerRecognitionAssetDownload ? %@;           allowGibraltarVoiceTriggerAssetDownloading ? %@"),
               v3,
               v4,
               v5,
               v6,
               v7,
               v2);
}

- (BOOL)allowVoiceTriggerAssetDownloading
{
  return self->_allowVoiceTriggerAssetDownloading;
}

- (void)setAllowVoiceTriggerAssetDownloading:(BOOL)a3
{
  self->_allowVoiceTriggerAssetDownloading = a3;
}

- (BOOL)allowEndpointAssetDownloading
{
  return self->_allowEndpointAssetDownloading;
}

- (void)setAllowEndpointAssetDownloading:(BOOL)a3
{
  self->_allowEndpointAssetDownloading = a3;
}

- (BOOL)allowLanguageDetectorAssetDownloading
{
  return self->_allowLanguageDetectorAssetDownloading;
}

- (void)setAllowLanguageDetectorAssetDownloading:(BOOL)a3
{
  self->_allowLanguageDetectorAssetDownloading = a3;
}

- (BOOL)allowAdBlockerAssetDownloading
{
  return self->_allowAdBlockerAssetDownloading;
}

- (void)setAllowAdBlockerAssetDownloading:(BOOL)a3
{
  self->_allowAdBlockerAssetDownloading = a3;
}

- (BOOL)allowSpeakerRecognitionAssetDownloading
{
  return self->_allowSpeakerRecognitionAssetDownloading;
}

- (void)setAllowSpeakerRecognitionAssetDownloading:(BOOL)a3
{
  self->_allowSpeakerRecognitionAssetDownloading = a3;
}

- (BOOL)allowVoiceTriggerAccessoryAssetDownloading
{
  return self->_allowVoiceTriggerAccessoryAssetDownloading;
}

- (void)setAllowVoiceTriggerAccessoryAssetDownloading:(BOOL)a3
{
  self->_allowVoiceTriggerAccessoryAssetDownloading = a3;
}

- (BOOL)allowGibraltarVoiceTriggerAssetDownloading
{
  return self->_allowGibraltarVoiceTriggerAssetDownloading;
}

- (void)setAllowGibraltarVoiceTriggerAssetDownloading:(BOOL)a3
{
  self->_allowGibraltarVoiceTriggerAssetDownloading = a3;
}

@end
