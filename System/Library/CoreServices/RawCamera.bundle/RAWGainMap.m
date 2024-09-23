@implementation RAWGainMap

- (void)setDefaults
{
  NSNumber *inputGainMapRowPitch;
  NSNumber *inputGainMapColPitch;
  CIImage *gainMapImg;
  uint64_t v6;
  void *v7;
  id inputColorSpace;

  inputGainMapRowPitch = self->inputGainMapRowPitch;
  self->inputGainMapRowPitch = (NSNumber *)&unk_1E99CC0C0;

  inputGainMapColPitch = self->inputGainMapColPitch;
  self->inputGainMapColPitch = (NSNumber *)&unk_1E99CC0C0;

  gainMapImg = self->_gainMapImg;
  self->_gainMapImg = 0;

  sub_1D543E528(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  inputColorSpace = self->inputColorSpace;
  self->inputColorSpace = v7;

}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CIImage *gainMapImg;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend_hasPrefix_(v7, v8, (uint64_t)CFSTR("inputGainMapData"), v9, v10))
  {
    gainMapImg = self->_gainMapImg;
    self->_gainMapImg = 0;

  }
  v12.receiver = self;
  v12.super_class = (Class)RAWGainMap;
  -[RAWGainMap setValue:forKey:](&v12, sel_setValue_forKey_, v6, v7);

}

- (id)makeMapSampler
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _WORD *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  __int128 v64;
  vImage_Buffer dest;
  vImage_Buffer src;
  _QWORD v67[3];
  _QWORD v68[4];

  v68[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend_X(self->inputGainMapSize, a2, v2, v3, v4);
  v7 = (unint64_t)v6;
  objc_msgSend_Y(self->inputGainMapSize, v8, v9, v10, v11);
  v13 = (unint64_t)v12;
  v18 = objc_msgSend_intValue(self->inputGainMapNumPlanes, v14, v15, v16, v17);
  v19 = v13 * v7;
  v27 = (char *)objc_msgSend_bytes(self->inputGainMapData, v20, v21, v22, v23);
  if (v18 == 1)
  {
    v28 = 2 * v7;
    objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v24, 2 * v7 * v13, v25, v26);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v34 = (void *)objc_msgSend_mutableBytes(v29, v30, v31, v32, v33);
    src.data = v27;
    src.height = 1;
    src.width = v13 * v7;
    src.rowBytes = objc_msgSend_length(self->inputGainMapData, v35, v36, v37, v38);
    dest.data = v34;
    dest.height = 1;
    dest.width = v13 * v7;
    dest.rowBytes = objc_msgSend_length(v29, v39, v40, v41, v42);
    vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0x10u);
    v47 = (unsigned int *)MEMORY[0x1E0C9E098];
  }
  else
  {
    v28 = 8 * v7;
    objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v24, 8 * v7 * v13, v25, v26);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v52 = objc_msgSend_mutableBytes(v29, v48, v49, v50, v51);
    if (v19)
    {
      v53 = (_WORD *)v52;
      v64 = xmmword_1D545D6B0;
      do
      {
        dest.rowBytes = 6;
        src.data = v27;
        *(_OWORD *)&src.height = xmmword_1D545D6B0;
        src.rowBytes = 12;
        dest.data = v53;
        *(_OWORD *)&dest.height = xmmword_1D545D6B0;
        vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0);
        v53[3] = 15360;
        v27 += 12;
        v53 += 4;
        --v19;
      }
      while (v19);
    }
    v47 = (unsigned int *)MEMORY[0x1E0C9E080];
  }
  v54 = *v47;
  v67[0] = *MEMORY[0x1E0C9E110];
  objc_msgSend_null(MEMORY[0x1E0C99E38], v43, v44, v45, v46, v64);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = *MEMORY[0x1E0C9E2D0];
  v57 = *MEMORY[0x1E0C9E2C8];
  v68[0] = v55;
  v68[1] = v57;
  v58 = *MEMORY[0x1E0C9E2C0];
  v67[1] = v56;
  v67[2] = v58;
  v68[2] = *MEMORY[0x1E0C9E2B8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v59, (uint64_t)v68, (uint64_t)v67, 3);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_imageWithBitmapData_bytesPerRow_size_format_options_(MEMORY[0x1E0C9DDC8], v61, (uint64_t)v29, v28, v54, v60, (double)v7, (double)v13);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return v62;
}

- (id)outputImage
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
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CIImage *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  _BOOL4 v58;
  NSObject *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  CIImage *v65;
  CIImage *gainMapImg;
  CIImage *v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  double v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  double MinX;
  double MaxY;
  double MaxX;
  CGFloat MinY;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  CGFloat v164;
  CGFloat v165;
  void (**v166)(_QWORD);
  CGAffineTransform v167;
  CGAffineTransform v168;
  CGAffineTransform v169;
  CGAffineTransform v170;
  _QWORD v171[5];
  _QWORD v172[4];
  _QWORD v173[4];
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;

  v173[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
  {
    v51 = 0;
    return v51;
  }
  objc_msgSend_X(self->inputGainMapSize, a2, v2, v3, v4);
  v7 = v6;
  objc_msgSend_Y(self->inputGainMapSize, v8, v9, v10, v11);
  v13 = v12;
  v18 = objc_msgSend_intValue(self->inputGainMapNumPlanes, v14, v15, v16, v17);
  v23 = objc_msgSend_intValue(self->inputGainMapRowPitch, v19, v20, v21, v22);
  v28 = objc_msgSend_intValue(self->inputGainMapColPitch, v24, v25, v26, v27);
  if (!objc_msgSend_BOOLValue(self->inputGainMapExecute, v29, v30, v31, v32) || !self->inputGainMapData)
    goto LABEL_20;
  v37 = (unint64_t)v7;
  v38 = (unint64_t)v13;
  if ((unint64_t)v7 < 2 || v38 < 2 || v23 == 0 || v28 == 0 || (v18 & 0xFFFFFFFD) != 1)
  {
    NSLog(CFSTR("RAWGainMap disabled because of incorrect arguments"));
LABEL_20:
    v51 = self->inputImage;
    return v51;
  }
  objc_msgSend_extent(self->inputImage, v33, v34, v35, v36);
  x = v174.origin.x;
  y = v174.origin.y;
  width = v174.size.width;
  height = v174.size.height;
  if (CGRectIsInfinite(v174))
  {
    NSLog(CFSTR("RAWGainMap disabled because inputImage is infinite"));
    goto LABEL_20;
  }
  objc_msgSend_CGRectValue(self->inputGainMapApplyRegion, v47, v48, v49, v50);
  v53 = width * v52;
  v55 = height * v54;
  v175.size.width = width * v56;
  v175.size.height = height * v57;
  v175.origin.x = width * v52;
  v175.origin.y = height * v54;
  v164 = v175.size.height;
  v165 = v175.size.width;
  v180.origin.x = x;
  v180.origin.y = y;
  v180.size.width = width;
  v180.size.height = height;
  v58 = CGRectContainsRect(v175, v180);
  sub_1D52EB19C();
  v59 = objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if ((unint64_t)&self->super.super.super.isa + 1 >= 2 && os_signpost_enabled(v59))
  {
    LOWORD(v170.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D527F000, v60, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "RAWGainMap", (const char *)&unk_1D548AF1A, (uint8_t *)&v170, 2u);
  }

  v171[0] = MEMORY[0x1E0C809B0];
  v171[1] = 3221225472;
  v171[2] = sub_1D544012C;
  v171[3] = &unk_1E996F870;
  v171[4] = self;
  v166 = (void (**)(_QWORD))MEMORY[0x1D82721B4](v171);
  if (!self->_gainMapImg)
  {
    objc_msgSend_makeMapSampler(self, v61, v62, v63, v64);
    v65 = (CIImage *)objc_claimAutoreleasedReturnValue();
    gainMapImg = self->_gainMapImg;
    self->_gainMapImg = v65;

  }
  v67 = self->inputImage;
  v68 = self->inputColorSpace;
  v73 = (uint64_t)v68;
  if (v68)
  {
    CFAutorelease(v68);
    objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v67, v74, v73, v75, v76);
    v77 = objc_claimAutoreleasedReturnValue();

    v67 = (CIImage *)v77;
  }
  objc_msgSend_CGRectValue(self->inputGainMapRegion, v69, v70, v71, v72);
  v79 = v78;
  v81 = v80;
  v83 = v82;
  v85 = v84;
  objc_msgSend_imageByClampingToExtent(self->_gainMapImg, v86, v87, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = height * v85;
  memset(&v170, 0, sizeof(v170));
  CGAffineTransformMakeScale(&v170, width * v83 / (double)(v37 - 1), v91 / (double)(v38 - 1));
  CGAffineTransformMakeTranslation(&v169, -0.5, -0.5);
  objc_msgSend_imageByApplyingTransform_(v90, v92, (uint64_t)&v169, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v170;
  objc_msgSend_imageByApplyingTransform_(v95, v96, (uint64_t)&v168, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  CGAffineTransformMakeTranslation(&v167, width * v79, height - v91 - height * v81);
  objc_msgSend_imageByApplyingTransform_(v99, v100, (uint64_t)&v167, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23 == 1 && v28 == 1 && v58)
  {
    objc_msgSend_kernelWithName_(GainMapKernels, v104, (uint64_t)CFSTR("GainMap"), v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extent(v67, v108, v109, v110, v111);
    v113 = v112;
    v115 = v114;
    v117 = v116;
    v119 = v118;
    v173[0] = v67;
    v173[1] = v103;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v120, (uint64_t)v173, 2, v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_(v107, v123, (uint64_t)v122, v124, v125, v113, v115, v117, v119);
    v126 = v67;
    v51 = (CIImage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_kernelWithName_(GainMapKernels, v104, (uint64_t)CFSTR("GainMapWithPitch"), v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorWithX_Y_(MEMORY[0x1E0C9DDF8], v127, v128, v129, v130, (double)(unint64_t)v23, (double)(unint64_t)v28);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = (void *)MEMORY[0x1E0C9DDF8];
    v176.origin.x = v53;
    v176.origin.y = v55;
    v176.size.width = v165;
    v176.size.height = v164;
    MinX = CGRectGetMinX(v176);
    v177.origin.x = v53;
    v177.origin.y = v55;
    v177.size.width = v165;
    v177.size.height = v164;
    MaxY = CGRectGetMaxY(v177);
    v178.origin.x = v53;
    v178.origin.y = v55;
    v178.size.width = v165;
    v178.size.height = v164;
    MaxX = CGRectGetMaxX(v178);
    v179.origin.x = v53;
    v179.origin.y = v55;
    v179.size.width = v165;
    v179.size.height = v164;
    MinY = CGRectGetMinY(v179);
    objc_msgSend_vectorWithX_Y_Z_W_(v131, v136, v137, v138, v139, MinX, height - MaxY, MaxX, height - MinY);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extent(v67, v140, v141, v142, v143);
    v145 = v144;
    v147 = v146;
    v149 = v148;
    v151 = v150;
    v172[0] = v67;
    v172[1] = v103;
    v172[2] = v122;
    v172[3] = v126;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v152, (uint64_t)v172, 4, v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applyWithExtent_arguments_(v107, v155, (uint64_t)v154, v156, v157, v145, v147, v149, v151);
    v158 = objc_claimAutoreleasedReturnValue();

    v51 = (CIImage *)v158;
  }

  if (v73)
  {
    objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v51, v159, v73, v160, v161);
    v162 = objc_claimAutoreleasedReturnValue();

    v51 = (CIImage *)v162;
  }

  v166[2](v166);
  return v51;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gainMapImg, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputGainMapExecute, 0);
  objc_storeStrong((id *)&self->inputGainMapNumPlanes, 0);
  objc_storeStrong((id *)&self->inputGainMapColPitch, 0);
  objc_storeStrong((id *)&self->inputGainMapRowPitch, 0);
  objc_storeStrong((id *)&self->inputGainMapSize, 0);
  objc_storeStrong((id *)&self->inputGainMapRegion, 0);
  objc_storeStrong((id *)&self->inputGainMapApplyRegion, 0);
  objc_storeStrong((id *)&self->inputGainMapData, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
