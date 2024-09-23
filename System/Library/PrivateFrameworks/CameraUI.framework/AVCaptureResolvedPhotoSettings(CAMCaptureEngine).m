@implementation AVCaptureResolvedPhotoSettings(CAMCaptureEngine)

- (BOOL)cam_isRecordingMovieForLivePhoto
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "livePhotoMovieDimensions");
  return (int)v1 > 0 && SHIDWORD(v1) > 0;
}

@end
