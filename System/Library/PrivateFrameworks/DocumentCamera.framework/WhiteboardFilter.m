@implementation WhiteboardFilter

- (id)whiteboardFilterKernel
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__WhiteboardFilter_whiteboardFilterKernel__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  if (whiteboardFilterKernel_once != -1)
    dispatch_once(&whiteboardFilterKernel_once, block);
  return (id)whiteboardFilterKernel_kernel;
}

void __42__WhiteboardFilter_whiteboardFilterKernel__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("WhiteboardFilter"), CFSTR("cikernel"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v1, 4, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  objc_msgSend(MEMORY[0x24BDBF668], "kernelWithString:", v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)whiteboardFilterKernel_kernel;
  whiteboardFilterKernel_kernel = v4;

}

+ (id)customAttributes
{
  return 0;
}

- (id)outputImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  -[WhiteboardFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extent");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __31__WhiteboardFilter_outputImage__block_invoke;
  v19[3] = &unk_24C5B8870;
  v19[4] = self;
  v12 = (void *)MEMORY[0x212B988FC](v19);
  -[WhiteboardFilter whiteboardFilterKernel](self, "whiteboardFilterKernel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WhiteboardFilter inputImage](self, "inputImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  -[WhiteboardFilter stride](self, "stride");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:", v12, v16, v5, v7, v9, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

double __31__WhiteboardFilter_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  void *v10;
  float v11;
  CGFloat v12;
  void *v13;
  float v14;
  CGFloat v15;
  double v16;
  CGRect v18;

  objc_msgSend(*(id *)(a1 + 32), "stride");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = (float)-v11;
  objc_msgSend(*(id *)(a1 + 32), "stride");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = (float)-v14;
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  *(_QWORD *)&v16 = (unint64_t)CGRectInset(v18, v12, v15);

  return v16;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (NSNumber)stride
{
  return self->_stride;
}

- (void)setStride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stride, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
