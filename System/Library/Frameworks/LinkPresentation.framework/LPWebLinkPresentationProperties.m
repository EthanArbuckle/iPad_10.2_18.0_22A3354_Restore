@implementation LPWebLinkPresentationProperties

- (BOOL)isPreliminary
{
  return self->_preliminary;
}

- (void)setPreliminary:(BOOL)a3
{
  self->_preliminary = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (LPCaptionBarPresentationProperties)captionBar
{
  return self->_captionBar;
}

- (void)setCaptionBar:(id)a3
{
  objc_storeStrong((id *)&self->_captionBar, a3);
}

- (LPCaptionBarPresentationProperties)mediaTopCaptionBar
{
  return self->_mediaTopCaptionBar;
}

- (void)setMediaTopCaptionBar:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTopCaptionBar, a3);
}

- (LPCaptionBarPresentationProperties)mediaBottomCaptionBar
{
  return self->_mediaBottomCaptionBar;
}

- (void)setMediaBottomCaptionBar:(id)a3
{
  objc_storeStrong((id *)&self->_mediaBottomCaptionBar, a3);
}

- (NSString)quotedText
{
  return self->_quotedText;
}

- (void)setQuotedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (LPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (LPImagePresentationProperties)imageProperties
{
  return self->_imageProperties;
}

- (void)setImageProperties:(id)a3
{
  objc_storeStrong((id *)&self->_imageProperties, a3);
}

- (NSArray)alternateImages
{
  return self->_alternateImages;
}

- (void)setAlternateImages:(id)a3
{
  objc_storeStrong((id *)&self->_alternateImages, a3);
}

- (LPVideo)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
  objc_storeStrong((id *)&self->_video, a3);
}

- (LPAudio)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
  objc_storeStrong((id *)&self->_audio, a3);
}

- (LPARAsset)arAsset
{
  return self->_arAsset;
}

- (void)setArAsset:(id)a3
{
  objc_storeStrong((id *)&self->_arAsset, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)dominantImageBackgroundColor
{
  return self->_dominantImageBackgroundColor;
}

- (void)setDominantImageBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_dominantImageBackgroundColor, a3);
}

- (LPImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (LPImagePresentationProperties)backgroundImageProperties
{
  return self->_backgroundImageProperties;
}

- (void)setBackgroundImageProperties:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImageProperties, a3);
}

- (NSNumber)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(id)a3
{
  objc_storeStrong((id *)&self->_minimumHeight, a3);
}

- (LPInlineMediaPlaybackInformation)inlinePlaybackInformation
{
  return self->_inlinePlaybackInformation;
}

- (void)setInlinePlaybackInformation:(id)a3
{
  objc_storeStrong((id *)&self->_inlinePlaybackInformation, a3);
}

- (NSString)domainNameForIndicator
{
  return self->_domainNameForIndicator;
}

- (void)setDomainNameForIndicator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSURL)overrideURL
{
  return self->_overrideURL;
}

- (void)setOverrideURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)overrideAllowOpeningSensitiveURLs
{
  return self->_overrideAllowOpeningSensitiveURLs;
}

- (void)setOverrideAllowOpeningSensitiveURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (LPIndeterminateProgressSpinnerPresentationProperties)progressSpinner
{
  return self->_progressSpinner;
}

- (void)setProgressSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_progressSpinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressSpinner, 0);
  objc_storeStrong((id *)&self->_overrideAllowOpeningSensitiveURLs, 0);
  objc_storeStrong((id *)&self->_overrideURL, 0);
  objc_storeStrong((id *)&self->_domainNameForIndicator, 0);
  objc_storeStrong((id *)&self->_inlinePlaybackInformation, 0);
  objc_storeStrong((id *)&self->_minimumHeight, 0);
  objc_storeStrong((id *)&self->_backgroundImageProperties, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_dominantImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_arAsset, 0);
  objc_storeStrong((id *)&self->_audio, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_alternateImages, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_quotedText, 0);
  objc_storeStrong((id *)&self->_mediaBottomCaptionBar, 0);
  objc_storeStrong((id *)&self->_mediaTopCaptionBar, 0);
  objc_storeStrong((id *)&self->_captionBar, 0);
}

@end
