@implementation RAWCropFilter

- (id)outputImage
{
  CIImage *inputImage;
  NSObject *v4;
  NSObject *v5;
  void (**v6)(_QWORD);
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CIImage *v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CIImage *v26;
  CGAffineTransform v28;
  _QWORD v29[5];
  uint8_t buf[16];

  inputImage = self->inputImage;
  if (inputImage)
  {
    if (self->inputCropRect)
    {
      sub_1D52EB19C();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D527F000, v5, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWCropFilter", (const char *)&unk_1D548AF1A, buf, 2u);
      }

      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = sub_1D543F548;
      v29[3] = &unk_1E996F870;
      v29[4] = self;
      v6 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v29);
      objc_msgSend_CGRectValue(self->inputCropRect, v7, v8, v9, v10);
      v12 = v11;
      v14 = v13;
      v15 = self->inputImage;
      CGAffineTransformMakeTranslation(&v28, -v16, -v17);
      objc_msgSend_imageByApplyingTransform_(v15, v18, (uint64_t)&v28, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByCroppingToRect_(v21, v22, v23, v24, v25, 0.0, 0.0, v12, v14);
      v26 = (CIImage *)objc_claimAutoreleasedReturnValue();

      v6[2](v6);
    }
    else
    {
      v26 = inputImage;
    }
  }
  else
  {
    v26 = 0;
  }
  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputCropRect, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
