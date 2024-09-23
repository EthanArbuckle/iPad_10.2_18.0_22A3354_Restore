@implementation CHFreeformRecognitionResult

- (CHFreeformRecognitionResult)initWithScore:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHFreeformRecognitionResult;
  return -[CHSketchRecognitionResult initWithString:score:rotation:](&v4, sel_initWithString_score_rotation_, CFSTR("Freeform"), a3, 0.0);
}

@end
