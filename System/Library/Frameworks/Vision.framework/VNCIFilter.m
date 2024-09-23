@implementation VNCIFilter

- (VNCIFilter)initWithKernelName:(id)a3
{
  id v4;
  VNCIFilter *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CIColorKernel *kernel;
  VNCIFilter *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNCIFilter;
  v5 = -[VNCIFilter init](&v13, sel_init);
  if (!v5)
    goto LABEL_6;
  v6 = v4;
  objc_opt_self();
  if (getVNBundle(void)::onceToken != -1)
    dispatch_once(&getVNBundle(void)::onceToken, &__block_literal_global_13199);
  objc_msgSend((id)getVNBundle(void)::bundle, "URLForResource:withExtension:", CFSTR("ImageFilters"), CFSTR("metallib"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v7);
  objc_msgSend(MEMORY[0x1E0C9DD88], "kernelWithFunctionName:fromMetalLibraryData:error:", v6, v8, 0);
  v9 = objc_claimAutoreleasedReturnValue();

  kernel = v5->_kernel;
  v5->_kernel = (CIColorKernel *)v9;

  if (v5->_kernel)
    v11 = v5;
  else
LABEL_6:
    v11 = 0;

  return v11;
}

- (VNCIFilter)initWithKernelName:(id)a3 inputParameters:(id)a4
{
  id v6;
  id v7;
  VNCIFilter *v8;
  VNCIFilter *v9;
  VNCIFilter *v10;
  VNCIFilter *v11;
  _QWORD v13[4];
  VNCIFilter *v14;

  v6 = a3;
  v7 = a4;
  v8 = -[VNCIFilter initWithKernelName:](self, "initWithKernelName:", v6);
  v9 = v8;
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__VNCIFilter_initWithKernelName_inputParameters___block_invoke;
    v13[3] = &unk_1E45489E0;
    v10 = v8;
    v14 = v10;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);
    v11 = v10;

  }
  return v9;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_kernel, 0);
}

uint64_t __49__VNCIFilter_initWithKernelName_inputParameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", a3, a2);
}

- (id)applyWithArguments:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "inputImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v5, "addObject:", v4);
      if (v3)
        objc_msgSend(v5, "addObjectsFromArray:", v3);
      objc_msgSend(v4, "imageByUnpremultiplyingAlpha");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = a1[10];
      objc_msgSend(v6, "extent");
      objc_msgSend(v7, "applyWithExtent:arguments:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "imageByPremultiplyingAlpha");
      a1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

@end
