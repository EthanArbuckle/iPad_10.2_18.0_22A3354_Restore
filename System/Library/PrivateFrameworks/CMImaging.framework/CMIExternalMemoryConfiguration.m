@implementation CMIExternalMemoryConfiguration

- (CMIExternalMemoryConfiguration)initWithMaxInputDimensions:(id)a3 inputPixelFormat:(unsigned int)a4 maxOutputDimensions:(id)a5 cmiResourceEnabled:(BOOL)a6 processorSpecificOptions:(id)a7
{
  id v13;
  CMIExternalMemoryConfiguration *v14;
  CMIExternalMemoryConfiguration *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)CMIExternalMemoryConfiguration;
  v14 = -[CMIExternalMemoryConfiguration init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_inputPixelFormat = a4;
    v14->_maxInputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    v14->_maxOutputDimensions = ($470D365275581EF16070F5A11344F73E)a5;
    v14->_cmiResourceEnabled = a6;
    objc_storeStrong((id *)&v14->_processorSpecificOptions, a7);
  }

  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t width;
  uint64_t height;
  unsigned int inputPixelFormat;
  __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  width = self->_maxInputDimensions.width;
  height = self->_maxInputDimensions.height;
  inputPixelFormat = self->_inputPixelFormat;
  if (inputPixelFormat)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), HIBYTE(self->_inputPixelFormat), BYTE2(self->_inputPixelFormat), BYTE1(self->_inputPixelFormat), self->_inputPixelFormat);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("0");
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: maxInputDimensions:%dx%d inputPixelFormat:%@ maxOutputDimensions:%dx%d cmiResourceEnabled:%d processorSpecificOptions:%@"), v4, self, width, height, v8, self->_maxOutputDimensions.width, self->_maxOutputDimensions.height, self->_cmiResourceEnabled, self->_processorSpecificOptions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (inputPixelFormat)

  return v9;
}

- ($2825F4736939C4A6D3AD43837233062D)maxInputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_maxInputDimensions;
}

- (unsigned)inputPixelFormat
{
  return self->_inputPixelFormat;
}

- ($2825F4736939C4A6D3AD43837233062D)maxOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_maxOutputDimensions;
}

- (BOOL)cmiResourceEnabled
{
  return self->_cmiResourceEnabled;
}

- (NSDictionary)processorSpecificOptions
{
  return self->_processorSpecificOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processorSpecificOptions, 0);
}

@end
