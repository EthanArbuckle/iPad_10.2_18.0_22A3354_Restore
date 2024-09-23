@implementation AVVideoCallPlayerController

- (BOOL)isPlaying
{
  return 1;
}

- (int64_t)status
{
  return 2;
}

- (int64_t)timeControlStatus
{
  return 2;
}

- (double)rate
{
  return 1.0;
}

- (AVPictureInPictureControllerContentSource)contentSource
{
  return (AVPictureInPictureControllerContentSource *)objc_loadWeakRetained((id *)&self->_pictureInPicturePossible);
}

- (void)setContentSource:(id)a3
{
  objc_storeWeak((id *)&self->_pictureInPicturePossible, a3);
}

- (CGSize)contentDimensions
{
  AVPictureInPictureControllerContentSource *contentSource;
  double width;
  CGSize result;

  contentSource = self->_contentSource;
  width = self->_contentDimensions.width;
  result.height = width;
  result.width = *(double *)&contentSource;
  return result;
}

- (void)setContentDimensions:(CGSize)a3
{
  *(CGSize *)&self->_contentSource = a3;
}

- (BOOL)isPictureInPicturePossible
{
  return self->super._seekToTimeInternal.epoch;
}

- (void)setPictureInPicturePossible:(BOOL)a3
{
  LOBYTE(self->super._seekToTimeInternal.epoch) = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pictureInPicturePossible);
}

@end
