@implementation RAWBayerInterleavedFilter

- (id)outputImage
{
  NSObject *v3;
  NSObject *v4;
  void (**v5)(_QWORD);
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double x;
  double y;
  double width;
  double height;
  const char *v18;
  uint64_t v19;
  void *v20;
  CIImage *inputImage01;
  CIImage *inputImage11;
  void *v23;
  const char *v24;
  uint64_t v25;
  _QWORD v27[5];
  uint8_t buf[8];
  _QWORD v29[5];
  CGRect v30;
  CGRect v31;

  v29[4] = *MEMORY[0x1E0C80C00];
  if (self->inputExtent && self->inputImage00 && self->inputImage01 && self->inputImage10 && self->inputImage11)
  {
    sub_1D52EB19C();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWBayerInterleavedFilter", (const char *)&unk_1D548AF1A, buf, 2u);
    }

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1D53C4B30;
    v27[3] = &unk_1E996F870;
    v27[4] = self;
    v5 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v27);
    objc_msgSend_kernelWithName_(DMKernels, v6, (uint64_t)CFSTR("_interleaveRGGB"), v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_10;
    objc_msgSend_CGRectValue(self->inputExtent, v9, v10, v11, v12);
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
    if (CGRectIsNull(v30)
      || (v31.origin.x = x, v31.origin.y = y, v31.size.width = width, v31.size.height = height, CGRectIsInfinite(v31)))
    {
LABEL_10:
      v20 = 0;
    }
    else
    {
      inputImage01 = self->inputImage01;
      v29[0] = self->inputImage00;
      v29[1] = inputImage01;
      inputImage11 = self->inputImage11;
      v29[2] = self->inputImage10;
      v29[3] = inputImage11;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v29, 4, v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v13, v24, (uint64_t)&unk_1E999A410, (uint64_t)v23, v25, x, y, width, height);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v5[2](v5);

  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputExtent, 0);
  objc_storeStrong((id *)&self->inputImage11, 0);
  objc_storeStrong((id *)&self->inputImage10, 0);
  objc_storeStrong((id *)&self->inputImage01, 0);
  objc_storeStrong((id *)&self->inputImage00, 0);
}

@end
