@implementation PKMathRecognitionError

- (NSString)errorString
{
  return self->_errorString;
}

- (void)setErrorString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorString, 0);
}

@end
