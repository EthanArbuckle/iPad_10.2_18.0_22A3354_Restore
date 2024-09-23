@implementation LPAppLinkPresentationProperties

- (int64_t)style
{
  return 26;
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

- (NSString)topCaption
{
  return self->_topCaption;
}

- (void)setTopCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bottomCaption
{
  return self->_bottomCaption;
}

- (void)setBottomCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)trailingTopCaption
{
  return self->_trailingTopCaption;
}

- (void)setTrailingTopCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)trailingBottomCaption
{
  return self->_trailingBottomCaption;
}

- (void)setTrailingBottomCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)mediaTopCaption
{
  return self->_mediaTopCaption;
}

- (void)setMediaTopCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)mediaBottomCaption
{
  return self->_mediaBottomCaption;
}

- (void)setMediaBottomCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (LPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (LPVideo)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
  objc_storeStrong((id *)&self->_video, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mediaBottomCaption, 0);
  objc_storeStrong((id *)&self->_mediaTopCaption, 0);
  objc_storeStrong((id *)&self->_trailingBottomCaption, 0);
  objc_storeStrong((id *)&self->_trailingTopCaption, 0);
  objc_storeStrong((id *)&self->_bottomCaption, 0);
  objc_storeStrong((id *)&self->_topCaption, 0);
  objc_storeStrong((id *)&self->_mediaBottomCaptionBar, 0);
  objc_storeStrong((id *)&self->_mediaTopCaptionBar, 0);
  objc_storeStrong((id *)&self->_captionBar, 0);
}

@end
