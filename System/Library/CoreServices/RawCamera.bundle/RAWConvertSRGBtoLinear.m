@implementation RAWConvertSRGBtoLinear

- (id)outputImage
{
  NSObject *v3;
  NSObject *v4;
  void (**v5)(_QWORD);
  CIImage *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  _QWORD v14[5];
  uint8_t buf[16];

  if (!self->inputImage)
    return 0;
  sub_1D52EB19C();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWConvertSRGBtoLinear", (const char *)&unk_1D548AF1A, buf, 2u);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D53CD048;
  v14[3] = &unk_1E996F870;
  v14[4] = self;
  v5 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v14);
  v6 = self->inputImage;
  objc_msgSend_kernelWithName_(RAWKernels, v7, (uint64_t)CFSTR("raw_srgb_to_linear"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apply_image_arguments_inoutSpace_isPremultiplied_(self, v11, (uint64_t)v10, (uint64_t)v6, 0, self->inputColorSpace, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5);
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
