@implementation CSUVisualGenerationTextEncoderV1Input

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)shouldReturnMask
{
  return self->_shouldReturnMask;
}

- (void)setShouldReturnMask:(BOOL)a3
{
  self->_shouldReturnMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
