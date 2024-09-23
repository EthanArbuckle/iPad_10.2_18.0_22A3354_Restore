@implementation BWStillImageFocusPixelBlurScoreResult

- (BWStillImageFocusPixelBlurScoreResult)initWithStatus:(int)a3 score:(float)a4
{
  BWStillImageFocusPixelBlurScoreResult *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWStillImageFocusPixelBlurScoreResult;
  result = -[BWStillImageFocusPixelBlurScoreResult init](&v7, sel_init);
  if (result)
  {
    result->_status = a3;
    result->_score = a4;
  }
  return result;
}

- (int)status
{
  return self->_status;
}

- (float)score
{
  return self->_score;
}

@end
