@implementation VNDetectTextRectanglesRequestConfiguration

- (VNDetectTextRectanglesRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNDetectTextRectanglesRequestConfiguration *v3;
  VNDetectTextRectanglesRequestConfiguration *v4;
  NSString *textRecognition;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectTextRectanglesRequestConfiguration;
  v3 = -[VNImageBasedRequestConfiguration initWithRequestClass:](&v7, sel_initWithRequestClass_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_reportCharacterBoxes = 0;
    v3->_algorithm = 0;
    v3->_minimumCharacterPixelHeight = 10;
    v3->_detectDiacritics = 1;
    v3->_minimizeFalseDetections = 1;
    textRecognition = v3->_textRecognition;
    v3->_textRecognition = (NSString *)CFSTR("VNTextRecognitionOptionNone");

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectTextRectanglesRequestConfiguration;
  v4 = -[VNImageBasedRequestConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setReportCharacterBoxes:", self->_reportCharacterBoxes);
    objc_msgSend(v5, "setAlgorithm:", self->_algorithm);
    objc_msgSend(v5, "setMinimumCharacterPixelHeight:", self->_minimumCharacterPixelHeight);
    objc_msgSend(v5, "setDetectDiacritics:", self->_detectDiacritics);
    objc_msgSend(v5, "setMinimizeFalseDetections:", self->_minimizeFalseDetections);
    objc_msgSend(v5, "setTextRecognition:", self->_textRecognition);
    objc_msgSend(v5, "setAdditionalCharacters:", self->_additionalCharacters);
  }
  return v5;
}

- (BOOL)reportCharacterBoxes
{
  return self->_reportCharacterBoxes;
}

- (void)setReportCharacterBoxes:(BOOL)a3
{
  self->_reportCharacterBoxes = a3;
}

- (unint64_t)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(unint64_t)a3
{
  self->_algorithm = a3;
}

- (unint64_t)minimumCharacterPixelHeight
{
  return self->_minimumCharacterPixelHeight;
}

- (void)setMinimumCharacterPixelHeight:(unint64_t)a3
{
  self->_minimumCharacterPixelHeight = a3;
}

- (BOOL)detectDiacritics
{
  return self->_detectDiacritics;
}

- (void)setDetectDiacritics:(BOOL)a3
{
  self->_detectDiacritics = a3;
}

- (BOOL)minimizeFalseDetections
{
  return self->_minimizeFalseDetections;
}

- (void)setMinimizeFalseDetections:(BOOL)a3
{
  self->_minimizeFalseDetections = a3;
}

- (NSString)textRecognition
{
  return self->_textRecognition;
}

- (void)setTextRecognition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)additionalCharacters
{
  return self->_additionalCharacters;
}

- (void)setAdditionalCharacters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalCharacters, 0);
  objc_storeStrong((id *)&self->_textRecognition, 0);
}

@end
