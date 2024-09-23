@implementation AVTStickerRecentsOverlayViewLayout

+ (id)standardPortraitLayout
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithImageToTopPadding:imageToTitlePadding:titleToSubtitlePadding:subtitleToButtonPadding:imageHeight:horizontalEdgePadding:", 24.0, 12.0, 4.0, 0.0, 40.0, 16.0);
}

+ (id)standardLandscapeLayout
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithImageToTopPadding:imageToTitlePadding:titleToSubtitlePadding:subtitleToButtonPadding:imageHeight:horizontalEdgePadding:", 12.0, 4.0, 2.0, 0.0, 38.0, 16.0);
}

+ (id)buttonsPortraitLayout
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithImageToTopPadding:imageToTitlePadding:titleToSubtitlePadding:subtitleToButtonPadding:imageHeight:horizontalEdgePadding:", 4.0, 12.0, 4.0, 16.0, 40.0, 16.0);
}

+ (id)buttonsLandscapeLayout
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithImageToTopPadding:imageToTitlePadding:titleToSubtitlePadding:subtitleToButtonPadding:imageHeight:horizontalEdgePadding:", 0.0, 4.0, 2.0, 0.0, 38.0, 16.0);
}

- (AVTStickerRecentsOverlayViewLayout)initWithImageToTopPadding:(double)a3 imageToTitlePadding:(double)a4 titleToSubtitlePadding:(double)a5 subtitleToButtonPadding:(double)a6 imageHeight:(double)a7 horizontalEdgePadding:(double)a8
{
  AVTStickerRecentsOverlayViewLayout *v14;
  AVTStickerRecentsOverlayViewLayout *v15;
  AVTStickerRecentsOverlayViewLayout *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AVTStickerRecentsOverlayViewLayout;
  v14 = -[AVTStickerRecentsOverlayViewLayout init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_imageToTopPadding = a3;
    v14->_imageToTitlePadding = a4;
    v14->_titleToSubtitlePadding = a5;
    v14->_subtitleToButtonPadding = a6;
    v14->_imageHeight = a7;
    v14->_horizontalEdgePadding = a8;
    v16 = v14;
  }

  return v15;
}

- (double)imageToTopPadding
{
  return self->_imageToTopPadding;
}

- (double)imageToTitlePadding
{
  return self->_imageToTitlePadding;
}

- (double)titleToSubtitlePadding
{
  return self->_titleToSubtitlePadding;
}

- (double)subtitleToButtonPadding
{
  return self->_subtitleToButtonPadding;
}

- (double)imageHeight
{
  return self->_imageHeight;
}

- (double)horizontalEdgePadding
{
  return self->_horizontalEdgePadding;
}

@end
