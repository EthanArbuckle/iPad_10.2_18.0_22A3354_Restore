@implementation RAWLinearSpacePlaceholder

- (id)outputImage
{
  NSObject *v3;
  NSObject *v4;
  void (**v5)(_QWORD);
  CIImage *v6;
  _QWORD v8[5];
  uint8_t buf[16];

  sub_1D52EB19C();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWLinearSpacePlaceholder", (const char *)&unk_1D548AF1A, buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D53CA14C;
  v8[3] = &unk_1E996F870;
  v8[4] = self;
  v5 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v8);
  v6 = self->inputImage;
  v5[2](v5);

  return v6;
}

+ (id)customAttributes
{
  CFTypeRef v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("inputColorSpace");
  v9[0] = *MEMORY[0x1E0C9DE10];
  v2 = sub_1D543E884();
  v9[1] = *MEMORY[0x1E0C9DE18];
  v10[0] = v2;
  v10[1] = CFSTR("inputColorSpace");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v3, (uint64_t)v10, (uint64_t)v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("kCIRAWFilterDoesClip");
  v5 = *MEMORY[0x1E0C9AE40];
  v12[0] = v4;
  v12[1] = v5;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v12, (uint64_t)v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)customAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_opt_class();
  return (id)MEMORY[0x1E0DE7D20](v2, sel_customAttributes, v3, v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
