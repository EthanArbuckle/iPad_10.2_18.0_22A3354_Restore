@implementation RAWDemosaicFilter

- (int)forceVersion
{
  char *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v2 = getenv((const char *)qword_1EFF32480);
  if (!v2)
    return -1;
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v3, (uint64_t)v2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_intValue(v6, v7, v8, v9, v10);

  return v11;
}

- (CGRect)regionOf:(int)a3 destRect:(CGRect)a4 userInfo:(id)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  float v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  float v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  float v52;
  float v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect result;
  CGRect v67;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a5;
  objc_msgSend_objectAtIndexedSubscript_(v9, v10, 2, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v13, v14, v15, v16, v17);
  v19 = v18;

  objc_msgSend_objectAtIndexedSubscript_(v9, v20, 3, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v23, v24, v25, v26, v27);
  v29 = v28;

  v62.origin.x = x + v19;
  v62.origin.y = y + v29;
  v62.size.width = width;
  v62.size.height = height;
  v63 = CGRectInset(v62, -1.0, -1.0);
  v30 = v63.origin.x;
  v31 = v63.origin.y;
  v32 = v63.size.width;
  v33 = v63.size.height;
  objc_msgSend_objectAtIndexedSubscript_(v9, v34, 0, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v37, v38, v39, v40, v41);
  v43 = v42;

  objc_msgSend_objectAtIndexedSubscript_(v9, v44, 1, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v47, v48, v49, v50, v51);
  v53 = v52;

  v67.size.width = v43;
  v67.size.height = v53;
  v67.origin.x = 0.0;
  v67.origin.y = 0.0;
  v64.origin.x = v30;
  v64.origin.y = v31;
  v64.size.width = v32;
  v64.size.height = v33;
  v65 = CGRectIntersection(v64, v67);
  v54 = v65.origin.x;
  v55 = v65.origin.y;
  v56 = v65.size.width;
  v57 = v65.size.height;

  v58 = v54;
  v59 = v55;
  v60 = v56;
  v61 = v57;
  result.size.height = v61;
  result.size.width = v60;
  result.origin.y = v59;
  result.origin.x = v58;
  return result;
}

- (id)crop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CIVector *inputCropRect;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;

  objc_msgSend_extent(self->inputImage, a2, v2, v3, v4);
  v14 = v13;
  inputCropRect = self->inputCropRect;
  if (inputCropRect)
  {
    objc_msgSend_X(inputCropRect, v6, v7, v8, v9);
    v17 = v16;
    objc_msgSend_Y(self->inputCropRect, v18, v19, v20, v21);
    v23 = v22;
    objc_msgSend_W(self->inputCropRect, v24, v25, v26, v27);
    v29 = v14 - (v23 + v28);
    objc_msgSend_Z(self->inputCropRect, v30, v31, v32, v33);
    v35 = v34;
    objc_msgSend_W(self->inputCropRect, v36, v37, v38, v39);
    v14 = v40;
  }
  else
  {
    v17 = v10;
    v29 = v11;
    v35 = v12;
  }
  return (id)objc_msgSend_vectorWithX_Y_Z_W_(MEMORY[0x1E0C9DDF8], v6, v7, v8, v9, v17, v29, v35, v14);
}

- (id)range
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  float v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_floatValue(self->inputRange, a2, v2, v3, v4);
  *(float *)&v7 = 65535.0 / v6;
  return (id)objc_msgSend_numberWithFloat_(v5, v8, v9, v10, v11, v7);
}

- (id)blacks
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend_X(self->inputBlacks, a2, v2, v3, v4);
  v8 = fmax(v7, 0.0) / 65535.0;
  objc_msgSend_Y(self->inputBlacks, v9, v10, v11, v12);
  v14 = fmax(v13, 0.0) / 65535.0;
  objc_msgSend_Z(self->inputBlacks, v15, v16, v17, v18);
  v20 = fmax(v19, 0.0) / 65535.0;
  objc_msgSend_W(self->inputBlacks, v21, v22, v23, v24);
  return (id)objc_msgSend_vectorWithX_Y_Z_W_(v6, v26, v27, v28, v29, v8, v14, v20, fmax(v25, 0.0) / 65535.0);
}

- (id)noiseModel
{
  NSNumber *inputRepresentativeNoise;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSNumber *v8;
  CIVector *inputNoiseModel;
  CIVector *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  float v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  float v24;
  float v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  void *v41;

  inputRepresentativeNoise = self->inputRepresentativeNoise;
  if (!inputRepresentativeNoise)
    inputRepresentativeNoise = (NSNumber *)&unk_1E99CC358;
  v8 = inputRepresentativeNoise;
  inputNoiseModel = self->inputNoiseModel;
  if (inputNoiseModel)
  {
    v10 = inputNoiseModel;
  }
  else
  {
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v4, v5, v6, v7, 0.0, 0.0);
    v10 = (CIVector *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v10;
  if (!self->inputNoiseModel && self->inputRepresentativeNoise)
  {
    v16 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend_floatValue(v8, v11, v12, v13, v14);
    objc_msgSend_vectorWithX_Y_(v16, v18, v19, v20, v21, 0.0, (float)((float)(v17 / 100.0) * 1.0954));
    v22 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v22;
  }
  v23 = (void *)MEMORY[0x1E0C9DDF8];
  objc_msgSend_floatValue(v8, v11, v12, v13, v14);
  v25 = v24;
  objc_msgSend_X(v15, v26, v27, v28, v29);
  v31 = v30;
  objc_msgSend_Y(v15, v32, v33, v34, v35);
  objc_msgSend_vectorWithX_Y_Z_(v23, v36, v37, v38, v39, v25, v31, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)exposureFactor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  float v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_floatValue(self->inputBaselineExposure, a2, v2, v3, v4);
  *(float *)&v7 = exp2f(v6) + 1.0;
  return (id)objc_msgSend_numberWithFloat_(v5, v8, v9, v10, v11, v7);
}

- (int)versionfor:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  int v6;
  int v7;
  int v8;

  v6 = objc_msgSend_intValue(self->inputVersion, a2, *(uint64_t *)&a3, v3, v4);
  if (v6)
    v7 = v6;
  else
    v7 = -1;
  if (v7 <= 7)
    v8 = 7;
  else
    v8 = 8;
  if (!a3)
    v7 = v8;
  if (a3 == 1)
    v7 = v8;
  if (a3 == 2)
    return v8;
  else
    return v7;
}

- (id)phaseFor:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 == 2)
  {
    objc_msgSend_phaseForXtrans(self, a2, *(uint64_t *)&a3, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    objc_msgSend_phaseForQuadra(self, a2, *(uint64_t *)&a3, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], a2, *(uint64_t *)&a3, v3, v4, 0.0, 0.0);
    else
      objc_msgSend_phaseForBayer(self, a2, *(uint64_t *)&a3, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)phaseForXtrans
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  double v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  _QWORD v118[20];

  v118[18] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend_intValue(self->inputPattern, a2, v2, v3, v4);
  v11 = v6 & 0x7F;
  if (v11 < 0x13)
  {
    objc_msgSend_extent(self->inputImage, v7, v8, v9, v10);
    v18 = (uint64_t)llround(v17) % 6;
    v19 = (double)~v18;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v20, v21, v22, v23, 1.0, v19);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118[0] = v117;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v24, v25, v26, v27, 2.0, v19);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v118[1] = v116;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v28, v29, v30, v31, 3.0, v19);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v118[2] = v115;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v32, v33, v34, v35, 4.0, v19);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v118[3] = v114;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v36, v37, v38, v39, 5.0, v19);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v118[4] = v113;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v40, v41, v42, v43, 0.0, v19);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v118[5] = v112;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v44, v45, v46, v47, 1.0, (double)(-2 - v18));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v118[6] = v111;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v48, v49, v50, v51, 2.0, (double)(-2 - v18));
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v118[7] = v110;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v52, v53, v54, v55, 3.0, (double)(-2 - v18));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v118[8] = v109;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v56, v57, v58, v59, 4.0, (double)(-2 - v18));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v118[9] = v108;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v60, v61, v62, v63, 5.0, (double)(-2 - v18));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v118[10] = v64;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v65, v66, v67, v68, 0.0, (double)(-2 - v18));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v118[11] = v69;
    v70 = (double)(-3 - v18);
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v71, v72, v73, v74, 1.0, v70);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v118[12] = v75;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v76, v77, v78, v79, 2.0, v70);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v118[13] = v80;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v81, v82, v83, v84, 3.0, v70);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v118[14] = v85;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v86, v87, v88, v89, 4.0, v70);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v118[15] = v90;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v91, v92, v93, v94, 5.0, v70);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v118[16] = v95;
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v96, v97, v98, v99, 0.0, v70);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v118[17] = v100;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v101, (uint64_t)v118, 18, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v103, v104, v11, v105, v106);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    printf("unexpected xtrans pattern %d 0x%x\n", v6, v6);
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v12, v13, v14, v15, 0.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v16;
}

- (id)phaseForQuadra
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
  int v12;
  int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  objc_msgSend_extent(self->inputImage, a2, v2, v3, v4);
  v7 = v6;
  v12 = objc_msgSend_intValue(self->inputPattern, v8, v9, v10, v11);
  v13 = llround(v7) & 1;
  objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v14, v15, v16, v17, 0.0, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 > 1094795584)
  {
    if (v12 == 1094795585)
    {
      objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v18, v19, v20, v21, 2.0, (double)(2 * v13));
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (v12 == 1364283729)
    {
      objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v18, v19, v20, v21, 0.0, (double)(2 * v13));
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  else
  {
    if (v12 == 336860180)
    {
      objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v18, v19, v20, v21, 2.0, (double)((2 * v13) ^ 2));
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (v12 == 353703189)
    {
      objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v18, v19, v20, v21, 0.0, (double)((2 * v13) ^ 2));
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v24 = (void *)v23;

      v22 = v24;
      return v22;
    }
  }
  printf("unsupported bayer pattern %d 0x%x\n", v12, v12);
  return v22;
}

- (id)phaseForBayer
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
  int v12;
  char v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;

  objc_msgSend_extent(self->inputImage, a2, v2, v3, v4);
  v7 = v6;
  v12 = objc_msgSend_intValue(self->inputPattern, v8, v9, v10, v11);
  v13 = llround(v7);
  objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v14, v15, v16, v17, 0.0, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 > 1229539656)
  {
    if (v12 == 1229539657)
    {
      objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v18, v19, v20, v21, 0.0, (double)(v13 & 1));
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (v12 == 1633771873)
    {
      v24 = 1.0;
      if ((v13 & 1) != 0)
        v24 = 0.0;
      objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v18, v19, v20, v21, 1.0, v24);
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else
  {
    if (v12 == -1802201964)
    {
      v25 = 1.0;
      if ((v13 & 1) != 0)
        v25 = 0.0;
      objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v18, v19, v20, v21, 0.0, v25);
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (v12 == 370546198)
    {
      objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v18, v19, v20, v21, 1.0, (double)(v13 & 1));
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v26 = (void *)v23;

      v22 = v26;
      return v22;
    }
  }
  printf("unsupported bayer pattern %d 0x%x\n", v12, v12);
  return v22;
}

- (int)sensorType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;

  v5 = objc_msgSend_intValue(self->inputPattern, a2, v2, v3, v4);
  v6 = 0;
  if (v5 <= 1094795584)
  {
    if (v5 <= 353703188)
    {
      if (v5 != -1802201964)
      {
        v7 = 336860180;
        goto LABEL_14;
      }
      return v6;
    }
    if (v5 != 353703189)
    {
      v8 = 370546198;
LABEL_10:
      if (v5 != v8)
        return 2 * (v5 >> 8 == 8487297);
      return v6;
    }
    return 1;
  }
  if (v5 <= 1364283728)
  {
    if (v5 != 1094795585)
    {
      v8 = 1229539657;
      goto LABEL_10;
    }
    return 1;
  }
  if (v5 != 1633771873)
  {
    v7 = 1364283729;
LABEL_14:
    if (v5 == v7)
      return 1;
    return 2 * (v5 >> 8 == 8487297);
  }
  return v6;
}

- (id)outputImage
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  double v83;
  double v84;
  double v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  double v108;
  double v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  float v119;
  float v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  double v140;
  float v141;
  void *v142;
  float v143;
  double v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  float v158;
  float v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  id v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  id v184;
  void *v185;
  NSNumber *inputScaleFactor;
  double v187;
  const char *v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  double v208;
  double v209;
  double v210;
  double v211;
  const char *v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  NSNumber *v229;
  void *v230;
  double v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  int v242;
  void (**v243)(_QWORD);
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  _QWORD v263[8];
  _QWORD v264[8];
  _QWORD v265[8];
  _QWORD v266[5];
  uint8_t buf[8];
  _QWORD v268[9];
  _QWORD v269[6];
  _QWORD v270[6];
  _QWORD v271[6];
  _QWORD v272[6];
  _QWORD v273[9];
  _QWORD v274[7];
  _QWORD v275[6];
  _QWORD v276[5];
  _QWORD v277[5];

  v277[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
  {
    v185 = 0;
    return v185;
  }
  sub_1D52EB19C();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D527F000, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWDemosaicFilter", (const char *)&unk_1D548AF1A, buf, 2u);
  }

  v5 = MEMORY[0x1E0C809B0];
  v266[0] = MEMORY[0x1E0C809B0];
  v266[1] = 3221225472;
  v266[2] = sub_1D53C692C;
  v266[3] = &unk_1E996F870;
  v266[4] = self;
  v243 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v266);
  v10 = objc_msgSend_sensorType(self, v6, v7, v8, v9);
  v14 = objc_msgSend_versionfor_(self, v11, v10, v12, v13);
  objc_msgSend_phaseFor_(self, v15, v10, v16, v17);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_forceVersion(self, v18, v19, v20, v21);
  if (v22 >= 0)
    v26 = v22;
  else
    v26 = v14;
  v242 = v26;
  objc_msgSend_kernelWithName_(DMKernels, v23, (uint64_t)CFSTR("deXtrans_v7"), v24, v25);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_(DMKernels, v27, (uint64_t)CFSTR("deXtrans_v8"), v28, v29);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_(DMKernels, v30, (uint64_t)CFSTR("deXtrans_v7_8bit"), v31, v32);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_(DMKernels, v33, (uint64_t)CFSTR("deXtrans_draft"), v34, v35);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_(DMKernels, v36, (uint64_t)CFSTR("deBayer_v7"), v37, v38);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_(DMKernels, v39, (uint64_t)CFSTR("deBayer_v7_8bit"), v40, v41);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_(DMKernels, v42, (uint64_t)CFSTR("deBayer_draft"), v43, v44);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_(DMKernels, v45, (uint64_t)CFSTR("despeckle_v7"), v46, v47);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_(DMKernels, v48, (uint64_t)CFSTR("despeckle_v8"), v49, v50);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_(DMKernels, v51, (uint64_t)CFSTR("deBayer_v8"), v52, v53);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_(DMKernels, v54, (uint64_t)CFSTR("deQuadra_draft"), v55, v56);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_range(self, v57, v58, v59, v60);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exposureFactor(self, v61, v62, v63, v64);
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_crop(self, v65, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_blacks(self, v70, v71, v72, v73);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_noiseModel(self, v74, v75, v76, v77);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extent(self->inputImage, v78, v79, v80, v81);
  v83 = v82;
  v85 = v84;
  objc_msgSend_X(v69, v86, v87, v88, v89);
  v91 = v90;
  objc_msgSend_Y(v69, v92, v93, v94, v95);
  v97 = v96;
  objc_msgSend_Z(v69, v98, v99, v100, v101);
  v103 = v102;
  objc_msgSend_W(v69, v104, v105, v106, v107);
  v109 = v108;
  objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v110, v111, v112, v113, v83, v85);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(self->inputDespeckle, v115, v116, v117, v118);
  v120 = v119;
  v265[0] = v5;
  v265[1] = 3221225472;
  v265[2] = sub_1D53C69B0;
  v265[3] = &unk_1E999A430;
  *(double *)&v265[4] = v83;
  *(double *)&v265[5] = v85;
  v265[6] = v91;
  v265[7] = v97;
  v259 = (void *)MEMORY[0x1D82721B4](v265);
  v264[0] = v5;
  v264[1] = 3221225472;
  v264[2] = sub_1D53C6A28;
  v264[3] = &unk_1E999A430;
  *(double *)&v264[4] = v83;
  *(double *)&v264[5] = v85;
  v264[6] = v91;
  v264[7] = v97;
  v257 = (void *)MEMORY[0x1D82721B4](v264);
  v263[0] = v5;
  v263[1] = 3221225472;
  v263[2] = sub_1D53C6A54;
  v263[3] = &unk_1E999A430;
  *(double *)&v263[4] = v83;
  *(double *)&v263[5] = v85;
  v263[6] = v91;
  v263[7] = v97;
  v254 = (void *)MEMORY[0x1D82721B4](v263);
  objc_msgSend__imageBySamplingNearest(self->inputImage, v121, v122, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = sub_1D543E528(v125);
  objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v125, v127, v126, v128, v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  switch((_DWORD)v10)
  {
    case 2:
      if (objc_msgSend_BOOLValue(self->inputDraftMode, v131, v132, v133, v134))
      {
        v167 = v256;
        v271[0] = v130;
        v271[1] = v260;
        v271[2] = v261;
        v271[3] = v262;
        v271[4] = v114;
        v271[5] = v69;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v178, (uint64_t)v271, 6, v179);
        v180 = objc_claimAutoreleasedReturnValue();
        v168 = (void *)MEMORY[0x1D82721B4](v257);
        v181 = (void *)v180;
        objc_msgSend_applyWithExtent_roiCallback_arguments_(v167, v182, (uint64_t)v168, v180, v183, 0.0, 0.0, v103, v109);
LABEL_41:
        v184 = (id)objc_claimAutoreleasedReturnValue();

        v235 = sub_1D543E528(v234);
        objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v184, v236, v235, v237, v238);
        v185 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_42;
      }
      inputScaleFactor = self->inputScaleFactor;
      if (inputScaleFactor && (objc_msgSend_doubleValue(inputScaleFactor, v174, v175, v176, v177), v187 < 0.6))
      {
        v167 = v245;
        v168 = (void *)MEMORY[0x1D82721B4](v254);
        v270[0] = v130;
        v270[1] = v260;
        v270[2] = v261;
        v270[3] = v262;
        v270[4] = v114;
        v270[5] = v69;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v188, (uint64_t)v270, 6, v189);
        v171 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v242 == 8)
        {
          v167 = v247;
          v168 = (void *)MEMORY[0x1D82721B4](v254);
          v268[0] = v130;
          v268[1] = v260;
          v268[2] = v261;
          v268[3] = v262;
          v268[4] = v114;
          v268[5] = v69;
          v268[6] = v252;
          v268[7] = v253;
          v268[8] = self->inputFactors;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v190, (uint64_t)v268, 9, v191);
        }
        else
        {
          v167 = v248;
          v168 = (void *)MEMORY[0x1D82721B4](v254);
          v269[0] = v130;
          v269[1] = v260;
          v269[2] = v261;
          v269[3] = v262;
          v269[4] = v114;
          v269[5] = v69;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v239, (uint64_t)v269, 6, v240);
        }
        v171 = objc_claimAutoreleasedReturnValue();
      }
LABEL_40:
      v181 = (void *)v171;
      objc_msgSend_applyWithExtent_roiCallback_arguments_(v167, v172, (uint64_t)v168, v171, v173, 0.0, 0.0, v103, v109);
      goto LABEL_41;
    case 1:
      objc_msgSend__imageBySamplingNearest(v130, v131, v132, v133, v134);
      v166 = objc_claimAutoreleasedReturnValue();

      v167 = v258;
      v168 = (void *)MEMORY[0x1D82721B4](v259);
      v272[0] = v166;
      v272[1] = v260;
      v272[2] = v261;
      v272[3] = v262;
      v272[4] = v114;
      v272[5] = v69;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v169, (uint64_t)v272, 6, v170);
      v171 = objc_claimAutoreleasedReturnValue();
LABEL_39:
      v130 = (void *)v166;
      goto LABEL_40;
    case 0:
      v135 = objc_msgSend_BOOLValue(self->inputDraftMode, v131, v132, v133, v134);
      LODWORD(v140) = 1.0;
      v141 = fminf(v120, 1.0);
      if ((v135 & 1) == 0 && (v140 = v141, v141 > 0.01) || v242 == 8)
      {
        v142 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_floatValue(self->inputDespeckle, v136, v137, v138, v139, v140);
        *(float *)&v144 = (float)(v143 * 1.25) + (float)(v143 * 1.25);
        objc_msgSend_numberWithFloat_(v142, v145, v146, v147, v148, v144);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_floatValue(self->inputDespeckle, v150, v151, v152, v153);
        if (v158 <= 0.5)
        {
          v165 = &unk_1E99CC358;
        }
        else
        {
          objc_msgSend_floatValue(self->inputDespeckle, v154, v155, v156, v157);
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v160, v161, v162, v163, fmax(v159 * -4.99394315 * v159 + v159 * 20.886197 * v159 * v159 + v159 * -11.5599299 + 5.66767614, 1.25));
          v164 = objc_claimAutoreleasedReturnValue();

          v165 = &unk_1E99CC368;
          v149 = (void *)v164;
        }
        objc_msgSend_extent(v130, v154, v155, v156, v157);
        if (v242 == 8)
        {
          v200 = v196;
          v201 = v197;
          v202 = v198;
          v203 = v199;
          v276[0] = v130;
          v276[1] = v114;
          v276[2] = v262;
          v276[3] = v149;
          v276[4] = v165;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v192, (uint64_t)v276, 5, v195);
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_applyWithExtent_roiCallback_arguments_(v250, v205, (uint64_t)&unk_1E999A470, (uint64_t)v204, v206, v200, v201, v202, v203);
          v207 = v130;
          v130 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v208 = v196;
          v209 = v197;
          v210 = v198;
          v211 = v199;
          v277[0] = v130;
          v277[1] = v114;
          *(float *)&v196 = v141;
          objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v192, v193, v194, v195, v196);
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          v277[2] = v204;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v212, (uint64_t)v277, 3, v213);
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_applyWithExtent_roiCallback_arguments_(v251, v214, (uint64_t)&unk_1E999A450, (uint64_t)v207, v215, v208, v209, v210, v211);
          v216 = objc_claimAutoreleasedReturnValue();

          v130 = (void *)v216;
        }

      }
      objc_msgSend__imageBySamplingNearest(v130, v136, v137, v138, v139);
      v166 = objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_BOOLValue(self->inputDraftMode, v217, v218, v219, v220))
      {
        v167 = v255;
        v168 = (void *)MEMORY[0x1D82721B4](v259);
        v275[0] = v166;
        v275[1] = v260;
        v275[2] = v261;
        v275[3] = v262;
        v275[4] = v114;
        v275[5] = v69;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v225, (uint64_t)v275, 6, v226);
        v171 = objc_claimAutoreleasedReturnValue();
      }
      else if (v242 == 8)
      {
        v167 = v249;
        v168 = (void *)MEMORY[0x1D82721B4](v257);
        v273[0] = v166;
        v273[1] = v260;
        v273[2] = v261;
        v273[3] = v262;
        v273[4] = v114;
        v273[5] = v69;
        v273[6] = v252;
        v273[7] = v253;
        v273[8] = self->inputFactors;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v227, (uint64_t)v273, 9, v228);
        v171 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v229 = self->inputScaleFactor;
        if (!v229 || (objc_msgSend_doubleValue(v229, v221, v222, v223, v224), v230 = v244, v231 >= 0.6))
          v230 = v246;
        v167 = v230;
        v168 = (void *)MEMORY[0x1D82721B4](v257);
        v274[0] = v166;
        v274[1] = v260;
        v274[2] = v261;
        v274[3] = v262;
        v274[4] = v114;
        v274[5] = v69;
        v274[6] = self->inputRepresentativeNoise;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v232, (uint64_t)v274, 7, v233);
        v171 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_39;
  }
  v184 = v130;
  v185 = v184;
LABEL_42:

  v243[2](v243);
  return v185;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputBaselineExposure, 0);
  objc_storeStrong((id *)&self->inputNoiseModel, 0);
  objc_storeStrong((id *)&self->inputScaleFactor, 0);
  objc_storeStrong((id *)&self->inputDraftMode, 0);
  objc_storeStrong((id *)&self->inputRepresentativeNoise, 0);
  objc_storeStrong((id *)&self->inputCropRect, 0);
  objc_storeStrong((id *)&self->inputDespeckle, 0);
  objc_storeStrong((id *)&self->inputPattern, 0);
  objc_storeStrong((id *)&self->inputFactors, 0);
  objc_storeStrong((id *)&self->inputRange, 0);
  objc_storeStrong((id *)&self->inputBlacks, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
