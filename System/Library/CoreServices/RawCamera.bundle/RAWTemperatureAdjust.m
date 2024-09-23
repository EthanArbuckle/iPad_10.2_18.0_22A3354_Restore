@implementation RAWTemperatureAdjust

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
    || (objc_msgSend_isEqualToString_(v4, v8, (uint64_t)CFSTR("inputWhitePoint"), v9, v10) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___RAWTemperatureAdjust;
    v11 = objc_msgSendSuper2(&v13, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v11;
}

- (void)setInputExposure:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setPrimitiveNumberValue_inVariable_forKey_, a3, &self->inputExposure, CFSTR("inputExposure"));
}

- (void)setInputWhitePoint:(id)a3
{
  void **p_inputWhitePoint;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;

  p_inputWhitePoint = (void **)&self->inputWhitePoint;
  v31 = a3;
  if (*p_inputWhitePoint != v31)
  {
    objc_msgSend_X(v31, v6, v7, v8, v9);
    v11 = v10;
    objc_msgSend_X(*p_inputWhitePoint, v12, v13, v14, v15);
    if (v11 != v20
      || (objc_msgSend_Y(v31, v16, v17, v18, v19),
          v22 = v21,
          objc_msgSend_Y(*p_inputWhitePoint, v23, v24, v25, v26),
          v22 != v27))
    {
      objc_msgSend_willChangeValueForKey_(self, v16, (uint64_t)CFSTR("inputWhitePoint"), v18, v19);
      objc_storeStrong((id *)&self->inputWhitePoint, a3);
      objc_msgSend_didChangeValueForKey_(self, v28, (uint64_t)CFSTR("inputWhitePoint"), v29, v30);
    }
  }

}

+ (id)customAttributes
{
  uint64_t v2;
  objc_class *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  objc_class *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[5];
  _QWORD v36[4];
  uint64_t v37;
  _QWORD v38[4];
  _QWORD v39[6];

  v39[4] = *MEMORY[0x1E0C80C00];
  v38[0] = CFSTR("inputExposure");
  v35[0] = *MEMORY[0x1E0C9DE08];
  v2 = v35[0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C9DE50];
  v30 = (void *)v4;
  v36[0] = v4;
  v36[1] = &unk_1E99CC468;
  v6 = *MEMORY[0x1E0C9DE48];
  v35[1] = v5;
  v35[2] = v6;
  v7 = *MEMORY[0x1E0C9DE10];
  v36[2] = &unk_1E99CC478;
  v36[3] = &unk_1E99CC488;
  v8 = *MEMORY[0x1E0C9DE68];
  v35[3] = v7;
  v35[4] = v8;
  v37 = *MEMORY[0x1E0C9DED0];
  v9 = v37;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v10, (uint64_t)v36, (uint64_t)v35, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v29;
  v38[1] = CFSTR("inputWhitePoint");
  v33[0] = v2;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v33[1] = v7;
  objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v12, v13, v14, v15, 0.332399994, 0.34740001);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v8;
  v17 = *MEMORY[0x1E0C9DEB8];
  v34[1] = v16;
  v34[2] = v17;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v34, (uint64_t)v33, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v19;
  v38[2] = CFSTR("inputVersion");
  v31[0] = v2;
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v21;
  v32[1] = &unk_1E99CC488;
  v31[1] = v5;
  v31[2] = v6;
  v32[2] = &unk_1E99CC498;
  v32[3] = &unk_1E99CC498;
  v31[3] = v7;
  v31[4] = v8;
  v32[4] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v32, (uint64_t)v31, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = CFSTR("kCIRAWFilterDoesClip");
  v24 = *MEMORY[0x1E0C9AE40];
  v39[2] = v23;
  v39[3] = v24;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)v39, (uint64_t)v38, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
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
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  long double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  double *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  double *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *__p;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  _QWORD v78[3];
  _QWORD v79[4];

  v79[3] = *MEMORY[0x1E0C80C00];
  sub_1D5338F84(3u, (uint64_t)&v75);
  objc_msgSend_doubleValue(self->inputExposure, v3, v4, v5, v6);
  v8 = exp2(v7);
  sub_1D5339590((unsigned int *)&v75, (uint64_t)&v72, v8);
  sub_1D53393A8(&v75, (uint64_t)&v72);
  if (__p)
  {
    v74 = __p;
    operator delete(__p);
  }
  v13 = objc_msgSend_intValue(self->inputVersion, v9, v10, v11, v12) != 0;
  objc_msgSend_X(self->inputWhitePoint, v14, v15, v16, v17);
  v19 = v18;
  objc_msgSend_Y(self->inputWhitePoint, v20, v21, v22, v23);
  v25 = v24;
  sub_1D5338BF8(&v69, (uint64_t)&v75);
  sub_1D53F3CDC(v13, &v69, (uint64_t)&v72, v19, v25);
  sub_1D53393A8(&v75, (uint64_t)&v72);
  if (__p)
  {
    v74 = __p;
    operator delete(__p);
  }
  if (v70)
  {
    v71 = v70;
    operator delete(v70);
  }
  v26 = (void *)MEMORY[0x1E0C9DDF8];
  v72 = sub_1D5339044((uint64_t)&v75, 0);
  __p = v27;
  v28 = *(double *)sub_1D53390D4((uint64_t)&v72, 0);
  v67 = sub_1D5339044((uint64_t)&v75, 0);
  v68 = v29;
  v30 = *(double *)sub_1D53390D4((uint64_t)&v67, 1u);
  v65 = sub_1D5339044((uint64_t)&v75, 0);
  v66 = v31;
  v32 = (double *)sub_1D53390D4((uint64_t)&v65, 2u);
  objc_msgSend_vectorWithX_Y_Z_(v26, v33, v34, v35, v36, v28, v30, *v32);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x1E0C9DDF8];
  v72 = sub_1D5339044((uint64_t)&v75, 1u);
  __p = v39;
  v40 = *(double *)sub_1D53390D4((uint64_t)&v72, 0);
  v67 = sub_1D5339044((uint64_t)&v75, 1u);
  v68 = v41;
  v42 = *(double *)sub_1D53390D4((uint64_t)&v67, 1u);
  v65 = sub_1D5339044((uint64_t)&v75, 1u);
  v66 = v43;
  v44 = (double *)sub_1D53390D4((uint64_t)&v65, 2u);
  objc_msgSend_vectorWithX_Y_Z_(v38, v45, v46, v47, v48, v40, v42, *v44);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)MEMORY[0x1E0C9DDF8];
  v72 = sub_1D5339044((uint64_t)&v75, 2u);
  __p = v51;
  v52 = *(double *)sub_1D53390D4((uint64_t)&v72, 0);
  v67 = sub_1D5339044((uint64_t)&v75, 2u);
  v68 = v53;
  v54 = *(double *)sub_1D53390D4((uint64_t)&v67, 1u);
  v65 = sub_1D5339044((uint64_t)&v75, 2u);
  v66 = v55;
  v56 = (double *)sub_1D53390D4((uint64_t)&v65, 2u);
  objc_msgSend_vectorWithX_Y_Z_(v50, v57, v58, v59, v60, v52, v54, *v56);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = CFSTR("inputRVector");
  v78[1] = CFSTR("inputGVector");
  v79[0] = v37;
  v79[1] = v49;
  v78[2] = CFSTR("inputBVector");
  v79[2] = v61;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v62, (uint64_t)v79, (uint64_t)v78, 3);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }
  return v63;
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
  uint64_t v27;
  uint64_t v28;
  CFTypeRef v29;
  const char *v30;
  void *v31;
  _QWORD v33[5];
  uint8_t buf[16];

  if (!self->inputImage)
    return 0;
  sub_1D52EB19C();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWTemperatureAdjust", (const char *)&unk_1D548AF1A, buf, 2u);
  }

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1D53EDAF0;
  v33[3] = &unk_1E996F870;
  v33[4] = self;
  v5 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v33);
  objc_msgSend_outputMatrix(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  inputImage = self->inputImage;
  objc_msgSend_objectForKeyedSubscript_(v10, v12, (uint64_t)CFSTR("inputRVector"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v16, (uint64_t)CFSTR("inputGVector"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v20, (uint64_t)CFSTR("inputBVector"), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_colorSpace(self->inputImage, v24, v25, v26, v27);
  v29 = sub_1D543E884();
  objc_msgSend_applyMatrixToImage_vectorR_vectorG_vectorB_vectorBias_inSpace_outSpace_(self, v30, (uint64_t)inputImage, (uint64_t)v15, (uint64_t)v19, v23, 0, v28, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v5[2](v5);
  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->defaultWhitePoint, 0);
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputExposure, 0);
  objc_storeStrong((id *)&self->inputWhitePoint, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
