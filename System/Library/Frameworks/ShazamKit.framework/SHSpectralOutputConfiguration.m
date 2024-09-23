@implementation SHSpectralOutputConfiguration

- (SHSpectralOutputConfiguration)init
{
  return -[SHSpectralOutputConfiguration initWithNumberOfBins:callbackFrequency:](self, "initWithNumberOfBins:callbackFrequency:", 4, 8);
}

- (SHSpectralOutputConfiguration)initWithNumberOfBins:(int64_t)a3 callbackFrequency:(int64_t)a4
{
  SHSpectralOutputConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SHSpectralOutputConfiguration;
  result = -[SHSpectralOutputConfiguration init](&v7, sel_init);
  if (result)
  {
    result->_numberOfBins = a3;
    result->_callbackFrequency = a4;
  }
  return result;
}

+ (BOOL)validateNumberOfBins:(int64_t)a3
{
  return (unint64_t)(a3 - 1) <= 0x3FF && (a3 & (a3 - 1)) == 0;
}

+ (BOOL)validateCallbackFrequency:(int64_t)a3
{
  return a3 >= 8 && (a3 & (a3 - 1)) == 0;
}

- (int64_t)numberOfBins
{
  return self->_numberOfBins;
}

- (int64_t)callbackFrequency
{
  return self->_callbackFrequency;
}

@end
