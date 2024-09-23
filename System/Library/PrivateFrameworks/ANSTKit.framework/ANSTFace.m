@implementation ANSTFace

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTFace)init
{
  ANSTFace *result;

  result = (ANSTFace *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTFace)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7
{
  id v9;
  const char *v10;
  ANSTFace *result;

  v9 = a5;
  result = (ANSTFace *)objc_msgSend_doesNotRecognizeSelector_(self, v10, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTFace)initWithAcObject:(id *)a3
{
  ANSTFace *result;

  result = (ANSTFace *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTFace)initWithAcFace:(id *)a3
{
  ANST3DPoseEstimate *v5;
  const char *v6;
  void *v7;
  ANSTSkinToneEstimate *v8;
  const char *v9;
  void *v10;
  ANSTSmileEstimate *v11;
  const char *v12;
  void *v13;
  ANSTEyeBlinkEstimate *v14;
  const char *v15;
  void *v16;
  ANSTEyeRectEstimate *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t var0;
  uint64_t var1;
  void *v23;
  const char *v24;
  ANSTFace *v25;

  if (a3->var15)
  {
    v5 = [ANST3DPoseEstimate alloc];
    v7 = (void *)objc_msgSend_initWithYaw_roll_refinedYaw_refinedRoll_refinedPitch_(v5, v6, a3->var5, a3->var6, a3->var7, a3->var8, a3->var9);
  }
  else
  {
    v7 = 0;
  }
  if (a3->var38)
  {
    v8 = [ANSTSkinToneEstimate alloc];
    v10 = (void *)objc_msgSend_initWithTypeIConfidence_typeIIConfidence_typeIIIConfidence_typeIVConfidence_typeVConfidence_typeVIConfidence_(v8, v9, a3->var27, a3->var28, a3->var29, a3->var30, a3->var31, a3->var32);
  }
  else
  {
    v10 = 0;
  }
  if (a3->var18)
  {
    v11 = [ANSTSmileEstimate alloc];
    v13 = (void *)objc_msgSend_initWithSmile_(v11, v12, a3->var10);
  }
  else
  {
    v13 = 0;
  }
  if (a3->var17)
  {
    v14 = [ANSTEyeBlinkEstimate alloc];
    v16 = (void *)objc_msgSend_initWithBlinkLeft_blinkRight_(v14, v15, a3->var11, a3->var12);
  }
  else
  {
    v16 = 0;
  }
  if (a3->var16)
  {
    v17 = [ANSTEyeRectEstimate alloc];
    v20 = (void *)objc_msgSend_initWithEyeRectLeft_eyeRectRight_(v17, v18, v19, a3->var13.var0, a3->var13.var1, a3->var13.var2, a3->var13.var3, a3->var14.var0, a3->var14.var1, a3->var14.var2, a3->var14.var3);
  }
  else
  {
    v20 = 0;
  }
  var0 = a3->var0;
  var1 = a3->var1;
  ANSTObjectCategoryFromAcDetCategory(a3->var2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (ANSTFace *)objc_msgSend_initWithObjectID_groupID_category_boundingBox_confidence_frontal_faceMaskConfidence_eyeCoveringConfidence_poseEstimate_skinToneEstimate_smileEstimate_eyeBlinkEstimate_eyeRectEstimate_(self, v24, var0, var1, v23, a3->var4, a3->var19 != 0, a3->var23, a3->var3.var0, a3->var3.var1, a3->var3.var2, a3->var3.var3, a3->var26, v7, v10, v13, v16, v20);

  return v25;
}

- (ANSTFace)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7 frontal:(BOOL)a8 faceMaskConfidence:(int64_t)a9 eyeCoveringConfidence:(int64_t)a10 poseEstimate:(id)a11 skinToneEstimate:(id)a12 smileEstimate:(id)a13 eyeBlinkEstimate:(id)a14 eyeRectEstimate:(id)a15
{
  double height;
  double width;
  double y;
  double x;
  ANST3DPoseEstimate *v24;
  ANSTSkinToneEstimate *v25;
  ANSTSmileEstimate *v26;
  ANSTEyeBlinkEstimate *v27;
  ANSTFace *v28;
  ANST3DPoseEstimate *poseEstimate;
  ANST3DPoseEstimate *v30;
  ANSTSkinToneEstimate *skinToneEstimate;
  ANSTSkinToneEstimate *v32;
  ANSTSmileEstimate *smileEstimate;
  ANSTSmileEstimate *v34;
  ANSTEyeBlinkEstimate *eyeBlinkEstimate;
  ANSTEyeBlinkEstimate *v36;
  ANSTEyeRectEstimate *eyeRectEstimate;
  ANSTEyeRectEstimate *v41;
  objc_super v42;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v24 = (ANST3DPoseEstimate *)a11;
  v25 = (ANSTSkinToneEstimate *)a12;
  v26 = (ANSTSmileEstimate *)a13;
  v27 = (ANSTEyeBlinkEstimate *)a14;
  v41 = (ANSTEyeRectEstimate *)a15;
  v42.receiver = self;
  v42.super_class = (Class)ANSTFace;
  v28 = -[ANSTObject initWithObjectID:groupID:category:boundingBox:confidence:](&v42, sel_initWithObjectID_groupID_category_boundingBox_confidence_, a3, a4, a5, a7, x, y, width, height);
  v28->_frontal = a8;
  v28->_faceMaskConfidence = a9;
  v28->_eyeCoveringConfidence = a10;
  poseEstimate = v28->_poseEstimate;
  v28->_poseEstimate = v24;
  v30 = v24;

  v28->_poseEstimateExists = v30 != 0;
  skinToneEstimate = v28->_skinToneEstimate;
  v28->_skinToneEstimate = v25;
  v32 = v25;

  v28->_skinToneEstimateExists = v32 != 0;
  smileEstimate = v28->_smileEstimate;
  v28->_smileEstimate = v26;
  v34 = v26;

  v28->_smileEstimateExists = v34 != 0;
  eyeBlinkEstimate = v28->_eyeBlinkEstimate;
  v28->_eyeBlinkEstimate = v27;
  v36 = v27;

  v28->_eyeBlinkEstimateExists = v36 != 0;
  eyeRectEstimate = v28->_eyeRectEstimate;
  v28->_eyeRectEstimate = v41;

  v28->_eyeRectEstimateExists = v41 != 0;
  return v28;
}

- (ANSTFace)initWithCoder:(id)a3
{
  id v4;
  ANSTFace *v5;
  ANSTFace *v6;
  ANST3DPoseEstimate *v7;
  const char *v8;
  uint64_t v9;
  ANST3DPoseEstimate *poseEstimate;
  ANSTSkinToneEstimate *v11;
  const char *v12;
  uint64_t v13;
  ANSTSkinToneEstimate *skinToneEstimate;
  ANSTSmileEstimate *v15;
  const char *v16;
  uint64_t v17;
  ANSTSmileEstimate *smileEstimate;
  ANSTEyeBlinkEstimate *v19;
  const char *v20;
  uint64_t v21;
  ANSTEyeBlinkEstimate *eyeBlinkEstimate;
  ANSTEyeRectEstimate *v23;
  const char *v24;
  uint64_t v25;
  ANSTEyeRectEstimate *eyeRectEstimate;
  ANSTFace *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ANSTFace;
  v5 = -[ANSTObject initWithCoder:](&v29, sel_initWithCoder_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_21;
  if (!sub_2358E2A14(v4, &v5->_frontal, sel_isFrontal))
    goto LABEL_21;
  if (!sub_2358E124C(v4, &v6->_faceMaskConfidence, sel_faceMaskConfidence))
    goto LABEL_21;
  if (!sub_2358E124C(v4, &v6->_eyeCoveringConfidence, sel_eyeCoveringConfidence))
    goto LABEL_21;
  if (!sub_2358E2A14(v4, &v6->_poseEstimateExists, sel_poseEstimateExists))
    goto LABEL_21;
  if (!sub_2358E2A14(v4, &v6->_skinToneEstimateExists, sel_skinToneEstimateExists))
    goto LABEL_21;
  if (!sub_2358E2A14(v4, &v6->_smileEstimateExists, sel_smileEstimateExists))
    goto LABEL_21;
  if (!sub_2358E2A14(v4, &v6->_eyeBlinkEstimateExists, sel_eyeBlinkEstimateExists))
    goto LABEL_21;
  if (!sub_2358E2A14(v4, &v6->_eyeRectEstimateExists, sel_eyeRectEstimateExists))
    goto LABEL_21;
  if (v6->_poseEstimateExists)
  {
    v7 = [ANST3DPoseEstimate alloc];
    v9 = objc_msgSend_initWithCoder_(v7, v8, (uint64_t)v4);
    poseEstimate = v6->_poseEstimate;
    v6->_poseEstimate = (ANST3DPoseEstimate *)v9;

    if (!v6->_poseEstimate)
      goto LABEL_21;
  }
  if (v6->_skinToneEstimateExists)
  {
    v11 = [ANSTSkinToneEstimate alloc];
    v13 = objc_msgSend_initWithCoder_(v11, v12, (uint64_t)v4);
    skinToneEstimate = v6->_skinToneEstimate;
    v6->_skinToneEstimate = (ANSTSkinToneEstimate *)v13;

    if (!v6->_skinToneEstimate)
      goto LABEL_21;
  }
  if (v6->_smileEstimateExists)
  {
    v15 = [ANSTSmileEstimate alloc];
    v17 = objc_msgSend_initWithCoder_(v15, v16, (uint64_t)v4);
    smileEstimate = v6->_smileEstimate;
    v6->_smileEstimate = (ANSTSmileEstimate *)v17;

    if (!v6->_smileEstimate)
      goto LABEL_21;
  }
  if (v6->_eyeBlinkEstimateExists)
  {
    v19 = [ANSTEyeBlinkEstimate alloc];
    v21 = objc_msgSend_initWithCoder_(v19, v20, (uint64_t)v4);
    eyeBlinkEstimate = v6->_eyeBlinkEstimate;
    v6->_eyeBlinkEstimate = (ANSTEyeBlinkEstimate *)v21;

    if (!v6->_eyeBlinkEstimate)
      goto LABEL_21;
  }
  if (!v6->_eyeRectEstimateExists
    || (v23 = [ANSTEyeRectEstimate alloc],
        v25 = objc_msgSend_initWithCoder_(v23, v24, (uint64_t)v4),
        eyeRectEstimate = v6->_eyeRectEstimate,
        v6->_eyeRectEstimate = (ANSTEyeRectEstimate *)v25,
        eyeRectEstimate,
        v6->_eyeRectEstimate))
  {
    v27 = v6;
  }
  else
  {
LABEL_21:
    v27 = 0;
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  ANST3DPoseEstimate *poseEstimate;
  void *v6;
  const char *v7;
  ANSTSkinToneEstimate *skinToneEstimate;
  void *v9;
  const char *v10;
  ANSTSmileEstimate *smileEstimate;
  void *v12;
  const char *v13;
  ANSTEyeBlinkEstimate *eyeBlinkEstimate;
  void *v15;
  const char *v16;
  ANSTEyeRectEstimate *eyeRectEstimate;
  void *v18;
  const char *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ANSTFace;
  -[ANSTObject encodeWithCoder:](&v20, sel_encodeWithCoder_, v4);
  sub_2358E2D00(v4, self->_frontal, sel_isFrontal);
  sub_2358E1360(v4, self->_faceMaskConfidence, sel_faceMaskConfidence);
  sub_2358E1360(v4, self->_eyeCoveringConfidence, sel_eyeCoveringConfidence);
  sub_2358E2D00(v4, self->_poseEstimateExists, sel_poseEstimateExists);
  poseEstimate = self->_poseEstimate;
  if (poseEstimate)
  {
    NSStringFromSelector(sel_poseEstimate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)poseEstimate, v6);

  }
  sub_2358E2D00(v4, self->_skinToneEstimateExists, sel_skinToneEstimateExists);
  skinToneEstimate = self->_skinToneEstimate;
  if (skinToneEstimate)
  {
    NSStringFromSelector(sel_skinToneEstimate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)skinToneEstimate, v9);

  }
  sub_2358E2D00(v4, self->_smileEstimateExists, sel_smileEstimateExists);
  smileEstimate = self->_smileEstimate;
  if (smileEstimate)
  {
    NSStringFromSelector(sel_smileEstimate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)smileEstimate, v12);

  }
  sub_2358E2D00(v4, self->_eyeBlinkEstimateExists, sel_eyeBlinkEstimateExists);
  eyeBlinkEstimate = self->_eyeBlinkEstimate;
  if (eyeBlinkEstimate)
  {
    NSStringFromSelector(sel_eyeBlinkEstimate);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)eyeBlinkEstimate, v15);

  }
  sub_2358E2D00(v4, self->_eyeRectEstimateExists, sel_eyeRectEstimateExists);
  eyeRectEstimate = self->_eyeRectEstimate;
  if (eyeRectEstimate)
  {
    NSStringFromSelector(sel_eyeRectEstimate);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)eyeRectEstimate, v18);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  CGFloat v134;
  void *v135;
  const char *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  CGFloat v142;
  CGFloat v143;
  CGFloat v144;
  CGFloat v145;
  void *v146;
  const char *v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  void *v151;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend_appendFormat_(v3, v4, (uint64_t)CFSTR("<ANSTFace %p> {\n"), self);
  v7 = objc_msgSend_objectID(self, v5, v6);
  objc_msgSend_appendFormat_(v3, v8, (uint64_t)CFSTR("    objectID            %lu\n"), v7);
  objc_msgSend_category(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v12, (uint64_t)CFSTR("    category            %@\n"), v11);

  objc_msgSend_boundingBox(self, v13, v14);
  sub_2358E0C58(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v20, (uint64_t)CFSTR("    boundingBox         %@\n"), v19);

  v23 = objc_msgSend_confidence(self, v21, v22);
  objc_msgSend_appendFormat_(v3, v24, (uint64_t)CFSTR("    confidence          %lu\n\n"), v23);
  if (self->_frontal)
    objc_msgSend_appendFormat_(v3, v25, (uint64_t)CFSTR("    isFrontal           %@\n"), CFSTR("YES"));
  else
    objc_msgSend_appendFormat_(v3, v25, (uint64_t)CFSTR("    isFrontal           %@\n"), CFSTR("NO"));
  objc_msgSend_appendFormat_(v3, v26, (uint64_t)CFSTR("    faceMaskConf        %ld\n"), self->_faceMaskConfidence);
  objc_msgSend_appendFormat_(v3, v27, (uint64_t)CFSTR("    eyeCoverConf        %ld\n\n"), self->_eyeCoveringConfidence);
  if (self->_poseEstimate)
  {
    objc_msgSend_poseEstimate(self, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_yaw(v30, v31, v32);
    objc_msgSend_appendFormat_(v3, v34, (uint64_t)CFSTR("    yaw                 %ld\n"), v33);

    objc_msgSend_poseEstimate(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_roll(v37, v38, v39);
    objc_msgSend_appendFormat_(v3, v41, (uint64_t)CFSTR("    roll                %ld\n"), v40);

    objc_msgSend_poseEstimate(self, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_refinedYaw(v44, v45, v46);
    objc_msgSend_appendFormat_(v3, v48, (uint64_t)CFSTR("    refinedYaw          %ld\n"), v47);

    objc_msgSend_poseEstimate(self, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend_refinedRoll(v51, v52, v53);
    objc_msgSend_appendFormat_(v3, v55, (uint64_t)CFSTR("    refinedRoll         %ld\n"), v54);

    objc_msgSend_poseEstimate(self, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend_refinedPitch(v58, v59, v60);
    objc_msgSend_appendFormat_(v3, v62, (uint64_t)CFSTR("    refinedPitch        %ld\n\n"), v61);

  }
  else
  {
    objc_msgSend_appendString_(v3, v28, (uint64_t)CFSTR("    poseEstimate        nil\n\n"));
  }
  if (self->_skinToneEstimate)
  {
    objc_msgSend_skinToneEstimate(self, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend_typeIConfidence(v65, v66, v67);
    objc_msgSend_appendFormat_(v3, v69, (uint64_t)CFSTR("    skinToneTypeIConf   %ld\n"), v68);

    objc_msgSend_skinToneEstimate(self, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend_typeIIConfidence(v72, v73, v74);
    objc_msgSend_appendFormat_(v3, v76, (uint64_t)CFSTR("    skinToneTypeIIConf  %ld\n"), v75);

    objc_msgSend_skinToneEstimate(self, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend_typeIIIConfidence(v79, v80, v81);
    objc_msgSend_appendFormat_(v3, v83, (uint64_t)CFSTR("    skinToneTypeIIIConf %ld\n"), v82);

    objc_msgSend_skinToneEstimate(self, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend_typeIVConfidence(v86, v87, v88);
    objc_msgSend_appendFormat_(v3, v90, (uint64_t)CFSTR("    skinToneTypeIVConf  %ld\n"), v89);

    objc_msgSend_skinToneEstimate(self, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend_typeVConfidence(v93, v94, v95);
    objc_msgSend_appendFormat_(v3, v97, (uint64_t)CFSTR("    skinToneTypeVConf   %ld\n"), v96);

    objc_msgSend_skinToneEstimate(self, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend_typeVIConfidence(v100, v101, v102);
    objc_msgSend_appendFormat_(v3, v104, (uint64_t)CFSTR("    skinToneTypeVIConf  %ld\n\n"), v103);

  }
  else
  {
    objc_msgSend_appendString_(v3, v63, (uint64_t)CFSTR("    skinToneEstimate    nil\n\n"));
  }
  if (self->_smileEstimate)
  {
    objc_msgSend_smileEstimate(self, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend_smile(v107, v108, v109);
    objc_msgSend_appendFormat_(v3, v111, (uint64_t)CFSTR("    smile               %ld\n\n"), v110);

  }
  else
  {
    objc_msgSend_appendString_(v3, v105, (uint64_t)CFSTR("    smileEstimate       nil\n\n"));
  }
  if (self->_eyeBlinkEstimate)
  {
    objc_msgSend_eyeBlinkEstimate(self, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend_blinkLeft(v114, v115, v116);
    objc_msgSend_appendFormat_(v3, v118, (uint64_t)CFSTR("    blinkLeft           %ld\n"), v117);

    objc_msgSend_eyeBlinkEstimate(self, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend_blinkRight(v121, v122, v123);
    objc_msgSend_appendFormat_(v3, v125, (uint64_t)CFSTR("    blinkRight          %ld\n\n"), v124);

  }
  else
  {
    objc_msgSend_appendString_(v3, v112, (uint64_t)CFSTR("    eyeBlinkEstimate    nil\n\n"));
  }
  if (self->_eyeRectEstimate)
  {
    objc_msgSend_eyeRectEstimate(self, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_eyeRectLeft(v128, v129, v130);
    sub_2358E0C58(v131, v132, v133, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v3, v136, (uint64_t)CFSTR("    eyeRectLeft         %@\n"), v135);

    objc_msgSend_eyeRectEstimate(self, v137, v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_eyeRectRight(v139, v140, v141);
    sub_2358E0C58(v142, v143, v144, v145);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v3, v147, (uint64_t)CFSTR("    eyeRectRight        %@\n"), v146);

  }
  else
  {
    objc_msgSend_appendString_(v3, v126, (uint64_t)CFSTR("    eyeRectEstimate     nil\n\n"));
  }
  objc_msgSend_appendString_(v3, v148, (uint64_t)CFSTR("}"));
  v151 = (void *)objc_msgSend_copy(v3, v149, v150);

  return v151;
}

- (id)debugJSONDictionary
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  void *v89;
  const char *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  void *v96;
  const char *v97;
  void *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  const char *v104;
  void *v105;
  const char *v106;
  void *v107;
  const char *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  const char *v113;
  void *v114;
  const char *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  void *v121;
  const char *v122;
  void *v123;
  const char *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  double v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  const char *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  double v141;
  double v142;
  double v143;
  double v144;
  void *v145;
  const char *v146;
  void *v147;
  objc_super v149;

  v149.receiver = self;
  v149.super_class = (Class)ANSTFace;
  -[ANSTObject debugJSONDictionary](&v149, sel_debugJSONDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v7, self->_frontal);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v9, (uint64_t)v8, CFSTR("isFrontal"));

  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v10, self->_faceMaskConfidence);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v12, (uint64_t)v11, CFSTR("faceMaskConfidence"));

  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v13, self->_eyeCoveringConfidence);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v15, (uint64_t)v14, CFSTR("eyeCoveringConfidence"));

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v16, self->_poseEstimateExists);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v18, (uint64_t)v17, CFSTR("hasPoseData"));

  if (self->_poseEstimateExists)
  {
    v21 = (void *)MEMORY[0x24BDD16E0];
    v22 = objc_msgSend_yaw(self->_poseEstimate, v19, v20);
    objc_msgSend_numberWithInteger_(v21, v23, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v25, (uint64_t)v24, CFSTR("yaw"));

    v26 = (void *)MEMORY[0x24BDD16E0];
    v29 = objc_msgSend_roll(self->_poseEstimate, v27, v28);
    objc_msgSend_numberWithInteger_(v26, v30, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v32, (uint64_t)v31, CFSTR("roll"));

    v33 = (void *)MEMORY[0x24BDD16E0];
    v36 = objc_msgSend_refinedYaw(self->_poseEstimate, v34, v35);
    objc_msgSend_numberWithInteger_(v33, v37, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v39, (uint64_t)v38, CFSTR("refinedYaw"));

    v40 = (void *)MEMORY[0x24BDD16E0];
    v43 = objc_msgSend_refinedRoll(self->_poseEstimate, v41, v42);
    objc_msgSend_numberWithInteger_(v40, v44, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v46, (uint64_t)v45, CFSTR("refinedRoll"));

    v47 = (void *)MEMORY[0x24BDD16E0];
    v50 = objc_msgSend_refinedPitch(self->_poseEstimate, v48, v49);
    objc_msgSend_numberWithInteger_(v47, v51, v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v52, CFSTR("refinedPitch"));

  }
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v19, self->_skinToneEstimateExists);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v55, (uint64_t)v54, CFSTR("hasSkinToneData"));

  if (self->_skinToneEstimateExists)
  {
    v58 = (void *)MEMORY[0x24BDD16E0];
    v59 = objc_msgSend_typeIConfidence(self->_skinToneEstimate, v56, v57);
    objc_msgSend_numberWithInteger_(v58, v60, v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v62, (uint64_t)v61, CFSTR("skintoneTypeI"));

    v63 = (void *)MEMORY[0x24BDD16E0];
    v66 = objc_msgSend_typeIIConfidence(self->_skinToneEstimate, v64, v65);
    objc_msgSend_numberWithInteger_(v63, v67, v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v69, (uint64_t)v68, CFSTR("skintoneTypeII"));

    v70 = (void *)MEMORY[0x24BDD16E0];
    v73 = objc_msgSend_typeIIIConfidence(self->_skinToneEstimate, v71, v72);
    objc_msgSend_numberWithInteger_(v70, v74, v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v76, (uint64_t)v75, CFSTR("skintoneTypeIII"));

    v77 = (void *)MEMORY[0x24BDD16E0];
    v80 = objc_msgSend_typeIVConfidence(self->_skinToneEstimate, v78, v79);
    objc_msgSend_numberWithInteger_(v77, v81, v80);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v83, (uint64_t)v82, CFSTR("skintoneTypeIV"));

    v84 = (void *)MEMORY[0x24BDD16E0];
    v87 = objc_msgSend_typeVConfidence(self->_skinToneEstimate, v85, v86);
    objc_msgSend_numberWithInteger_(v84, v88, v87);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v90, (uint64_t)v89, CFSTR("skintoneTypeV"));

    v91 = (void *)MEMORY[0x24BDD16E0];
    v94 = objc_msgSend_typeVIConfidence(self->_skinToneEstimate, v92, v93);
    objc_msgSend_numberWithInteger_(v91, v95, v94);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v97, (uint64_t)v96, CFSTR("skintoneTypeVI"));

  }
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v56, self->_smileEstimateExists);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v99, (uint64_t)v98, CFSTR("hasSmileData"));

  if (self->_smileEstimateExists)
  {
    v102 = (void *)MEMORY[0x24BDD16E0];
    v103 = objc_msgSend_smile(self->_smileEstimate, v100, v101);
    objc_msgSend_numberWithInteger_(v102, v104, v103);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v106, (uint64_t)v105, CFSTR("smile"));

  }
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v100, self->_eyeBlinkEstimateExists);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v108, (uint64_t)v107, CFSTR("hasBlinkData"));

  if (self->_eyeBlinkEstimateExists)
  {
    v111 = (void *)MEMORY[0x24BDD16E0];
    v112 = objc_msgSend_blinkLeft(self->_eyeBlinkEstimate, v109, v110);
    objc_msgSend_numberWithInteger_(v111, v113, v112);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v115, (uint64_t)v114, CFSTR("blinkLeft"));

    v116 = (void *)MEMORY[0x24BDD16E0];
    v119 = objc_msgSend_blinkRight(self->_eyeBlinkEstimate, v117, v118);
    objc_msgSend_numberWithInteger_(v116, v120, v119);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v122, (uint64_t)v121, CFSTR("blinkRight"));

  }
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v109, self->_eyeRectEstimateExists);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v124, (uint64_t)v123, CFSTR("hasEyeData"));

  if (self->_eyeRectEstimateExists)
  {
    v127 = objc_msgSend_eyeRectLeft(self->_eyeRectEstimate, v125, v126);
    sub_2358E0F0C(v130, v131, v132, v133, v127, v128, v129);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v135, (uint64_t)v134, CFSTR("eyeRectLeft"));

    v138 = objc_msgSend_eyeRectRight(self->_eyeRectEstimate, v136, v137);
    sub_2358E0F0C(v141, v142, v143, v144, v138, v139, v140);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v146, (uint64_t)v145, CFSTR("eyeRectRight"));

  }
  v147 = (void *)objc_msgSend_copy(v6, v125, v126);

  return v147;
}

- (BOOL)isFrontal
{
  return self->_frontal;
}

- (int64_t)faceMaskConfidence
{
  return self->_faceMaskConfidence;
}

- (int64_t)eyeCoveringConfidence
{
  return self->_eyeCoveringConfidence;
}

- (ANST3DPoseEstimate)poseEstimate
{
  return self->_poseEstimate;
}

- (ANSTSkinToneEstimate)skinToneEstimate
{
  return self->_skinToneEstimate;
}

- (ANSTSmileEstimate)smileEstimate
{
  return self->_smileEstimate;
}

- (ANSTEyeBlinkEstimate)eyeBlinkEstimate
{
  return self->_eyeBlinkEstimate;
}

- (ANSTEyeRectEstimate)eyeRectEstimate
{
  return self->_eyeRectEstimate;
}

- (BOOL)poseEstimateExists
{
  return self->_poseEstimateExists;
}

- (BOOL)skinToneEstimateExists
{
  return self->_skinToneEstimateExists;
}

- (BOOL)smileEstimateExists
{
  return self->_smileEstimateExists;
}

- (BOOL)eyeBlinkEstimateExists
{
  return self->_eyeBlinkEstimateExists;
}

- (BOOL)eyeRectEstimateExists
{
  return self->_eyeRectEstimateExists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eyeRectEstimate, 0);
  objc_storeStrong((id *)&self->_eyeBlinkEstimate, 0);
  objc_storeStrong((id *)&self->_smileEstimate, 0);
  objc_storeStrong((id *)&self->_skinToneEstimate, 0);
  objc_storeStrong((id *)&self->_poseEstimate, 0);
}

@end
