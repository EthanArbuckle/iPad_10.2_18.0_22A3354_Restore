@implementation VNCIMultiplicationFilter

- (VNCIMultiplicationFilter)init
{
  void *v3;
  VNCIMultiplicationFilter *v4;
  NSNumber *inputFactor1;
  NSNumber *inputFactor2;
  NSNumber *inputFactor3;
  NSNumber *inputFactor4;
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "multiplyByFactor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)VNCIMultiplicationFilter;
  v4 = -[VNCIFilter initWithKernelName:](&v10, sel_initWithKernelName_, v3);

  if (v4)
  {
    inputFactor1 = v4->_inputFactor1;
    v4->_inputFactor1 = (NSNumber *)&unk_1E459E548;

    inputFactor2 = v4->_inputFactor2;
    v4->_inputFactor2 = (NSNumber *)&unk_1E459E548;

    inputFactor3 = v4->_inputFactor3;
    v4->_inputFactor3 = (NSNumber *)&unk_1E459E548;

    inputFactor4 = v4->_inputFactor4;
    v4->_inputFactor4 = (NSNumber *)&unk_1E459E548;

  }
  return v4;
}

- (id)outputImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  -[VNCIMultiplicationFilter inputFactor1](self, "inputFactor1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  -[VNCIMultiplicationFilter inputFactor2](self, "inputFactor2");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  -[VNCIMultiplicationFilter inputFactor3](self, "inputFactor3");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  -[VNCIMultiplicationFilter inputFactor4](self, "inputFactor4");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNCIFilter applyWithArguments:]((id *)&self->super.super.super.isa, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSNumber)inputFactor1
{
  return self->_inputFactor1;
}

- (void)setInputFactor1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)inputFactor2
{
  return self->_inputFactor2;
}

- (void)setInputFactor2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)inputFactor3
{
  return self->_inputFactor3;
}

- (void)setInputFactor3:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)inputFactor4
{
  return self->_inputFactor4;
}

- (void)setInputFactor4:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFactor4, 0);
  objc_storeStrong((id *)&self->_inputFactor3, 0);
  objc_storeStrong((id *)&self->_inputFactor2, 0);
  objc_storeStrong((id *)&self->_inputFactor1, 0);
}

@end
