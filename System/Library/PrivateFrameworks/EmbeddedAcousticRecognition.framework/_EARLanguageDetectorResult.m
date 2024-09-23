@implementation _EARLanguageDetectorResult

- (NSDictionary)confidences
{
  return self->_confidences;
}

- (void)setConfidences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isConfident
{
  return self->_isConfident;
}

- (void)setIsConfident:(BOOL)a3
{
  self->_isConfident = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidences, 0);
}

@end
