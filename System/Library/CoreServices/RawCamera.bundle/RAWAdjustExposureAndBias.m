@implementation RAWAdjustExposureAndBias

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  objc_super v13;

  v4 = a3;
  if ((objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("inputExposure"), v6, v7) & 1) != 0
    || (objc_msgSend_isEqualToString_(v4, v8, (uint64_t)CFSTR("inputBias"), v9, v10) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___RAWAdjustExposureAndBias;
    v11 = objc_msgSendSuper2(&v13, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v11;
}

- (void)setInputExposure:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setPrimitiveNumberValue_inVariable_forKey_, a3, &self->inputExposure, CFSTR("inputExposure"));
}

- (void)setInputBias:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setPrimitiveNumberValue_inVariable_forKey_, a3, &self->inputBias, CFSTR("inputBias"));
}

+ (id)customAttributes
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  objc_class *v11;
  void *v12;
  const char *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[4];
  uint64_t v31;
  uint64_t v32;
  CFTypeRef v33;
  _QWORD v34[5];
  _QWORD v35[7];

  v35[5] = *MEMORY[0x1E0C80C00];
  v34[0] = CFSTR("inputColorSpace");
  v32 = *MEMORY[0x1E0C9DE10];
  v2 = v32;
  v33 = sub_1D543E884();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v3, (uint64_t)&v33, (uint64_t)&v32, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v24;
  v34[1] = CFSTR("inputBaselineExposure");
  v29[0] = *MEMORY[0x1E0C9DE08];
  v4 = v29[0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v22;
  v30[1] = &unk_1E99CC4B8;
  v6 = *MEMORY[0x1E0C9DE50];
  v29[1] = v2;
  v29[2] = v6;
  v7 = *MEMORY[0x1E0C9DE48];
  v30[2] = &unk_1E99CC4A8;
  v30[3] = &unk_1E99CC4C8;
  v8 = *MEMORY[0x1E0C9DE68];
  v29[3] = v7;
  v29[4] = v8;
  v31 = *MEMORY[0x1E0C9DED0];
  v9 = v31;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v30, (uint64_t)v29, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v23;
  v34[2] = CFSTR("inputExposure");
  v27[0] = v4;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  v28[1] = &unk_1E99CC4B8;
  v27[1] = v2;
  v27[2] = v6;
  v28[2] = &unk_1E99CC4A8;
  v28[3] = &unk_1E99CC4C8;
  v27[3] = v7;
  v27[4] = v8;
  v28[4] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v28, (uint64_t)v27, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v14;
  v34[3] = CFSTR("inputBias");
  v25[0] = v4;
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v26[1] = &unk_1E99CC4D8;
  v25[1] = v2;
  v25[2] = v6;
  v26[2] = &unk_1E99CC4B8;
  v26[3] = &unk_1E99CC4E8;
  v25[3] = v7;
  v25[4] = v8;
  v26[4] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v17, (uint64_t)v26, (uint64_t)v25, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = CFSTR("kCIRAWFilterDoesClip");
  v35[3] = v18;
  v35[4] = MEMORY[0x1E0C9AAA0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v35, (uint64_t)v34, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
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

- (id)outputMatrix
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  long double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  long double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  _QWORD v44[4];
  _QWORD v45[5];

  v45[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend_doubleValue(self->inputExposure, a2, v2, v3, v4);
  v7 = v6;
  objc_msgSend_doubleValue(self->inputBaselineExposure, v8, v9, v10, v11);
  v13 = 1.0 / exp2(v7 + v12);
  objc_msgSend_doubleValue(self->inputBias, v14, v15, v16, v17);
  v19 = v18 * 0.001;
  v20 = 1.0 / (v13 - v18 * 0.001);
  v44[0] = CFSTR("inputRVector");
  objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v21, v22, v23, v24, (double)v20, 0.0, 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v25;
  v44[1] = CFSTR("inputGVector");
  objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v26, v27, v28, v29, 0.0, (double)v20, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v30;
  v44[2] = CFSTR("inputBVector");
  objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v31, v32, v33, v34, 0.0, 0.0, (double)v20);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v35;
  v44[3] = CFSTR("inputBiasVector");
  objc_msgSend_vectorWithX_Y_Z_(MEMORY[0x1E0C9DDF8], v36, v37, v38, v39, (double)-(v19 * v20), (double)-(v19 * v20), (double)-(v19 * v20));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v40;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v41, (uint64_t)v45, (uint64_t)v44, 4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (id)outputImage
{
  NSObject *v3;
  NSObject *v4;
  void (**v5)(_QWORD);
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CIImage *inputImage;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  _QWORD v31[5];
  uint8_t buf[16];

  if (!self->inputImage)
    return 0;
  sub_1D52EB19C();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWAdjustExposureAndBias", (const char *)&unk_1D548AF1A, buf, 2u);
  }

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1D53EE418;
  v31[3] = &unk_1E996F870;
  v31[4] = self;
  v5 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v31);
  objc_msgSend_outputMatrix(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  inputImage = self->inputImage;
  objc_msgSend_objectForKeyedSubscript_(v10, v12, (uint64_t)CFSTR("inputRVector"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v16, (uint64_t)CFSTR("inputGVector"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v20, (uint64_t)CFSTR("inputBVector"), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v24, (uint64_t)CFSTR("inputBiasVector"), v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applyMatrixToImage_vectorR_vectorG_vectorB_vectorBias_inSpace_outSpace_(self, v28, (uint64_t)inputImage, (uint64_t)v15, (uint64_t)v19, v23, v27, self->inputColorSpace);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5);
  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputBias, 0);
  objc_storeStrong((id *)&self->inputExposure, 0);
  objc_storeStrong((id *)&self->inputBaselineExposure, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
