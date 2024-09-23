@implementation AXMVisionFeatureFaceAttributes

- (AXMVisionFeatureFaceAttributes)initWithVisionFaceAttributes:(id)a3
{
  id v4;
  AXMVisionFeatureFaceAttributes *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  float v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  float v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  float v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  float v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  float v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  float v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  float v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  float v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  float v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  float v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  float v95;
  objc_super v97;

  v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)AXMVisionFeatureFaceAttributes;
  v5 = -[AXMVisionFeatureFaceAttributes init](&v97, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ageCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axAgeCategory = -[AXMVisionFeatureFaceAttributes _AXMAgeCategoryForVisionCategoryIdentifier:](v5, "_AXMAgeCategoryForVisionCategoryIdentifier:", v8);

    objc_msgSend(v4, "ageCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "confidence");
    v5->_axAgeCategoryConfidence = v11;

    objc_msgSend(v4, "VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axGenderCategory = -[AXMVisionFeatureFaceAttributes _AXMGenderCategoryForVisionCategoryIdentifier:](v5, "_AXMGenderCategoryForVisionCategoryIdentifier:", v14);

    objc_msgSend(v4, "VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "confidence");
    v5->_axGenderCategoryConfidence = v17;

    objc_msgSend(v4, "eyesCategory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "label");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axEyesCategory = -[AXMVisionFeatureFaceAttributes _AXMEyesCategoryForVisionCategoryIdentifier:](v5, "_AXMEyesCategoryForVisionCategoryIdentifier:", v20);

    objc_msgSend(v4, "eyesCategory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "confidence");
    v5->_axEyesCategoryConfidence = v23;

    objc_msgSend(v4, "hairColorCategory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "label");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axHairColorCategory = -[AXMVisionFeatureFaceAttributes _AXMHairColorCategoryForVisionCategoryIdentifier:](v5, "_AXMHairColorCategoryForVisionCategoryIdentifier:", v26);

    objc_msgSend(v4, "hairColorCategory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "label");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "confidence");
    v5->_axHairColorCategoryConfidence = v29;

    objc_msgSend(v4, "glassesCategory");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "label");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axGlassesCategory = -[AXMVisionFeatureFaceAttributes _AXMGlassesCategoryForVisionCategoryIdentifier:](v5, "_AXMGlassesCategoryForVisionCategoryIdentifier:", v32);

    objc_msgSend(v4, "glassesCategory");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "label");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "confidence");
    v5->_axGlassesCategoryConfidence = v35;

    objc_msgSend(v4, "makeupEyesCategory");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "label");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axMakeupEyesCategory = -[AXMVisionFeatureFaceAttributes _AXMMakeupEyesCategoryForVisionCategoryIdentifier:](v5, "_AXMMakeupEyesCategoryForVisionCategoryIdentifier:", v38);

    objc_msgSend(v4, "makeupEyesCategory");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "label");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "confidence");
    v5->_axMakeupEyesCategoryConfidence = v41;

    objc_msgSend(v4, "makeupLipsCategory");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "label");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "identifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axMakeupLipsCategory = -[AXMVisionFeatureFaceAttributes _AXMMakeupLipsCategoryForVisionCategoryIdentifier:](v5, "_AXMMakeupLipsCategoryForVisionCategoryIdentifier:", v44);

    objc_msgSend(v4, "makeupLipsCategory");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "label");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "confidence");
    v5->_axMakeupLipsCategoryConfidence = v47;

    objc_msgSend(v4, "facemaskCategory");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "label");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "identifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axFacemaskCategory = -[AXMVisionFeatureFaceAttributes _AXMFacemaskCategoryForVisionCategoryIdentifier:](v5, "_AXMFacemaskCategoryForVisionCategoryIdentifier:", v50);

    objc_msgSend(v4, "facemaskCategory");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "label");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "confidence");
    v5->_axFacemaskCategoryConfidence = v53;

    objc_msgSend(v4, "VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "label");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "identifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axEthnicityCategory = -[AXMVisionFeatureFaceAttributes _AXMEthnicityCategoryForVisionCategoryIdentifier:](v5, "_AXMEthnicityCategoryForVisionCategoryIdentifier:", v56);

    objc_msgSend(v4, "VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "label");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "confidence");
    v5->_axEthnicityCategoryConfidence = v59;

    objc_msgSend(v4, "VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "label");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "identifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axExpressionCategory = -[AXMVisionFeatureFaceAttributes _AXMExpressionCategoryForVisionCategoryIdentifier:](v5, "_AXMExpressionCategoryForVisionCategoryIdentifier:", v62);

    objc_msgSend(v4, "VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "label");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "confidence");
    v5->_axExpressionCategoryConfidence = v65;

    objc_msgSend(v4, "VN2riiZbQrloRhCzYW56f0rk4N3ROe151S");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "label");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "identifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axFaceHairV2Category = -[AXMVisionFeatureFaceAttributes _AXMFaceHairV2CategoryForVisionCategoryIdentifier:](v5, "_AXMFaceHairV2CategoryForVisionCategoryIdentifier:", v68);

    objc_msgSend(v4, "VN2riiZbQrloRhCzYW56f0rk4N3ROe151S");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "label");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "confidence");
    v5->_axFaceHairV2CategoryConfidence = v71;

    objc_msgSend(v4, "VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "label");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "identifier");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axHairTypeCategory = -[AXMVisionFeatureFaceAttributes _AXMHairtypeCategoryForVisionCategoryIdentifier:](v5, "_AXMHairtypeCategoryForVisionCategoryIdentifier:", v74);

    objc_msgSend(v4, "VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "label");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "confidence");
    v5->_axHairTypeCategoryConfidence = v77;

    objc_msgSend(v4, "VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "label");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "identifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axHeadgearCategory = -[AXMVisionFeatureFaceAttributes _AXMHeadgearCategoryForVisionCategoryIdentifier:](v5, "_AXMHeadgearCategoryForVisionCategoryIdentifier:", v80);

    objc_msgSend(v4, "VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "label");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "confidence");
    v5->_axHeadgearCategoryConfidence = v83;

    objc_msgSend(v4, "VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "label");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "identifier");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axPoseCategory = -[AXMVisionFeatureFaceAttributes _AXMPoseCategoryForVisionCategoryIdentifier:](v5, "_AXMPoseCategoryForVisionCategoryIdentifier:", v86);

    objc_msgSend(v4, "VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "label");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "confidence");
    v5->_axPoseCategoryConfidence = v89;

    objc_msgSend(v4, "VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "label");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "identifier");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_axSkintoneCategory = -[AXMVisionFeatureFaceAttributes _AXMSkintoneCategoryForVisionCategoryIdentifier:](v5, "_AXMSkintoneCategoryForVisionCategoryIdentifier:", v92);

    objc_msgSend(v4, "VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "label");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "confidence");
    v5->_axSkintoneCategoryConfidence = v95;

  }
  return v5;
}

- (AXMVisionFeatureFaceAttributes)initWithAVMetadataFaceObject:(id)a3
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axAgeCategory](self, "axAgeCategory"), CFSTR("age"));
  -[AXMVisionFeatureFaceAttributes axAgeCategoryConfidence](self, "axAgeCategoryConfidence");
  *(float *)&v4 = v4;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("ageConfidence"), v4);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axGenderCategory](self, "axGenderCategory"), CFSTR("gender"));
  -[AXMVisionFeatureFaceAttributes axGenderCategoryConfidence](self, "axGenderCategoryConfidence");
  *(float *)&v5 = v5;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("genderConfidence"), v5);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axEyesCategory](self, "axEyesCategory"), CFSTR("eyes"));
  -[AXMVisionFeatureFaceAttributes axEyesCategoryConfidence](self, "axEyesCategoryConfidence");
  *(float *)&v6 = v6;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("eyesConfidence"), v6);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axSmilingCategory](self, "axSmilingCategory"), CFSTR("smiling"));
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axFaceHairCategory](self, "axFaceHairCategory"), CFSTR("faceHair"));
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axHairColorCategory](self, "axHairColorCategory"), CFSTR("hairColor"));
  -[AXMVisionFeatureFaceAttributes axHairColorCategoryConfidence](self, "axHairColorCategoryConfidence");
  *(float *)&v7 = v7;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("hairColorConfidence"), v7);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axBaldCategory](self, "axBaldCategory"), CFSTR("bald"));
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axGlassesCategory](self, "axGlassesCategory"), CFSTR("glasses"));
  -[AXMVisionFeatureFaceAttributes axGlassesCategoryConfidence](self, "axGlassesCategoryConfidence");
  *(float *)&v8 = v8;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("glassesConfidence"), v8);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axMakeupEyesCategory](self, "axMakeupEyesCategory"), CFSTR("makeupEyes"));
  -[AXMVisionFeatureFaceAttributes axMakeupEyesCategoryConfidence](self, "axMakeupEyesCategoryConfidence");
  *(float *)&v9 = v9;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("makeupEyesConfidence"), v9);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axMakeupLipsCategory](self, "axMakeupLipsCategory"), CFSTR("makeupLips"));
  -[AXMVisionFeatureFaceAttributes axMakeupLipsCategoryConfidence](self, "axMakeupLipsCategoryConfidence");
  *(float *)&v10 = v10;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("makeupLipsConfidence"), v10);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axFacemaskCategory](self, "axFacemaskCategory"), CFSTR("facemask"));
  -[AXMVisionFeatureFaceAttributes axFacemaskCategoryConfidence](self, "axFacemaskCategoryConfidence");
  *(float *)&v11 = v11;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("facemaskConfidence"), v11);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axEthnicityCategory](self, "axEthnicityCategory"), CFSTR("ethnicity"));
  -[AXMVisionFeatureFaceAttributes axEthnicityCategoryConfidence](self, "axEthnicityCategoryConfidence");
  *(float *)&v12 = v12;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("ethnicityConfidence"), v12);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axExpressionCategory](self, "axExpressionCategory"), CFSTR("expression"));
  -[AXMVisionFeatureFaceAttributes axExpressionCategoryConfidence](self, "axExpressionCategoryConfidence");
  *(float *)&v13 = v13;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("expressionConfidence"), v13);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axFaceHairV2Category](self, "axFaceHairV2Category"), CFSTR("faceHairV2"));
  -[AXMVisionFeatureFaceAttributes axFaceHairV2CategoryConfidence](self, "axFaceHairV2CategoryConfidence");
  *(float *)&v14 = v14;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("faceHairV2Confidence"), v14);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axHairTypeCategory](self, "axHairTypeCategory"), CFSTR("hairType"));
  -[AXMVisionFeatureFaceAttributes axHairTypeCategoryConfidence](self, "axHairTypeCategoryConfidence");
  *(float *)&v15 = v15;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("hairTypeConfidence"), v15);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axHeadgearCategory](self, "axHeadgearCategory"), CFSTR("headgear"));
  -[AXMVisionFeatureFaceAttributes axHeadgearCategoryConfidence](self, "axHeadgearCategoryConfidence");
  *(float *)&v16 = v16;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("headgearConfidence"), v16);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axPoseCategory](self, "axPoseCategory"), CFSTR("pose"));
  -[AXMVisionFeatureFaceAttributes axPoseCategoryConfidence](self, "axPoseCategoryConfidence");
  *(float *)&v17 = v17;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("poseConfidence"), v17);
  objc_msgSend(v19, "encodeInteger:forKey:", -[AXMVisionFeatureFaceAttributes axSkintoneCategory](self, "axSkintoneCategory"), CFSTR("skintone"));
  -[AXMVisionFeatureFaceAttributes axSkintoneCategoryConfidence](self, "axSkintoneCategoryConfidence");
  *(float *)&v18 = v18;
  objc_msgSend(v19, "encodeFloat:forKey:", CFSTR("skintoneConfidence"), v18);

}

- (AXMVisionFeatureFaceAttributes)initWithCoder:(id)a3
{
  id v4;
  AXMVisionFeatureFaceAttributes *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AXMVisionFeatureFaceAttributes;
  v5 = -[AXMVisionFeatureFaceAttributes init](&v22, sel_init);
  if (v5)
  {
    v5->_axAgeCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("age"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ageConfidence"));
    v5->_axAgeCategoryConfidence = v6;
    v5->_axGenderCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("gender"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("genderConfidence"));
    v5->_axGenderCategoryConfidence = v7;
    v5->_axEyesCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eyes"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("eyesConfidence"));
    v5->_axEyesCategoryConfidence = v8;
    v5->_axSmilingCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("smiling"));
    v5->_axFaceHairCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("faceHair"));
    v5->_axHairColorCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hairColor"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("hairColorConfidence"));
    v5->_axHairColorCategoryConfidence = v9;
    v5->_axBaldCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bald"));
    v5->_axGlassesCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("glasses"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("glassesConfidence"));
    v5->_axGlassesCategoryConfidence = v10;
    v5->_axMakeupEyesCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("makeupEyes"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("makeupEyesConfidence"));
    v5->_axMakeupEyesCategoryConfidence = v11;
    v5->_axMakeupLipsCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("makeupLips"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("makeupLipsConfidence"));
    v5->_axMakeupLipsCategoryConfidence = v12;
    v5->_axFacemaskCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("facemask"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("facemaskConfidence"));
    v5->_axFacemaskCategoryConfidence = v13;
    v5->_axEthnicityCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ethnicity"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ethnicityConfidence"));
    v5->_axEthnicityCategoryConfidence = v14;
    v5->_axExpressionCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("expression"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("expressionConfidence"));
    v5->_axExpressionCategoryConfidence = v15;
    v5->_axFaceHairV2Category = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("faceHairV2"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("faceHairV2Confidence"));
    v5->_axFaceHairV2CategoryConfidence = v16;
    v5->_axHairTypeCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hairType"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("hairTypeConfidence"));
    v5->_axHairTypeCategoryConfidence = v17;
    v5->_axHeadgearCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("headgear"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("headgearConfidence"));
    v5->_axHeadgearCategoryConfidence = v18;
    v5->_axPoseCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pose"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("poseConfidence"));
    v5->_axPoseCategoryConfidence = v19;
    v5->_axSkintoneCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("skintone"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("skintoneConfidence"));
    v5->_axSkintoneCategoryConfidence = v20;
  }

  return v5;
}

+ (int64_t)defaultExcludeOptions
{
  return 22556;
}

- (int64_t)_AXMAgeCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMAgeCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMAgeCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_0);
  objc_msgSend((id)_AXMAgeCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMAgeCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v0 = (id *)getVNFaceAttributeAgeBabySymbolLoc_ptr;
  v21 = getVNFaceAttributeAgeBabySymbolLoc_ptr;
  if (!getVNFaceAttributeAgeBabySymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VNFaceAttributeAgeBaby");
    v19[3] = (uint64_t)v0;
    getVNFaceAttributeAgeBabySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v18, 8);
  if (!v0)
    goto LABEL_17;
  v2 = *v0;
  v22[0] = v2;
  v24[0] = &unk_1E6288078;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v3 = (id *)getVNFaceAttributeAgeChildSymbolLoc_ptr;
  v21 = getVNFaceAttributeAgeChildSymbolLoc_ptr;
  if (!getVNFaceAttributeAgeChildSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VNFaceAttributeAgeChild");
    v19[3] = (uint64_t)v3;
    getVNFaceAttributeAgeChildSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v18, 8);
  if (!v3)
    goto LABEL_17;
  v5 = *v3;
  v22[1] = v5;
  v24[1] = &unk_1E6288090;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v6 = (id *)getVNFaceAttributeAgeYoungAdultSymbolLoc_ptr;
  v21 = getVNFaceAttributeAgeYoungAdultSymbolLoc_ptr;
  if (!getVNFaceAttributeAgeYoungAdultSymbolLoc_ptr)
  {
    v7 = (void *)VisionLibrary();
    v6 = (id *)dlsym(v7, "VNFaceAttributeAgeYoungAdult");
    v19[3] = (uint64_t)v6;
    getVNFaceAttributeAgeYoungAdultSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v18, 8);
  if (!v6)
    goto LABEL_17;
  v8 = *v6;
  v22[2] = v8;
  v24[2] = &unk_1E62880A8;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v9 = (id *)getVNFaceAttributeAgeAdultSymbolLoc_ptr;
  v21 = getVNFaceAttributeAgeAdultSymbolLoc_ptr;
  if (!getVNFaceAttributeAgeAdultSymbolLoc_ptr)
  {
    v10 = (void *)VisionLibrary();
    v9 = (id *)dlsym(v10, "VNFaceAttributeAgeAdult");
    v19[3] = (uint64_t)v9;
    getVNFaceAttributeAgeAdultSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v18, 8);
  if (!v9)
    goto LABEL_17;
  v11 = *v9;
  v22[3] = v11;
  v24[3] = &unk_1E62880C0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v12 = (id *)getVNFaceAttributeAgeSeniorSymbolLoc_ptr;
  v21 = getVNFaceAttributeAgeSeniorSymbolLoc_ptr;
  if (!getVNFaceAttributeAgeSeniorSymbolLoc_ptr)
  {
    v13 = (void *)VisionLibrary();
    v12 = (id *)dlsym(v13, "VNFaceAttributeAgeSenior");
    v19[3] = (uint64_t)v12;
    getVNFaceAttributeAgeSeniorSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v18, 8);
  if (!v12)
  {
LABEL_17:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v23 = *v12;
  v24[4] = &unk_1E62880D8;
  v14 = (void *)MEMORY[0x1E0C99D80];
  v15 = v23;
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v24, v22, 5);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)_AXMAgeCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMAgeCategoryForVisionCategoryIdentifier__categoryMap = v16;

}

- (int64_t)_AXMGenderCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMGenderCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMGenderCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_95);
  objc_msgSend((id)_AXMGenderCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMGenderCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __80__AXMVisionFeatureFaceAttributes__AXMGenderCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v0 = (id *)getVN1yPD9G185LIMKFd9RgandG6vUu4B3DZkSymbolLoc_ptr;
  v12 = getVN1yPD9G185LIMKFd9RgandG6vUu4B3DZkSymbolLoc_ptr;
  if (!getVN1yPD9G185LIMKFd9RgandG6vUu4B3DZkSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VN1yPD9G185LIMKFd9RgandG6vUu4B3DZk");
    v10[3] = (uint64_t)v0;
    getVN1yPD9G185LIMKFd9RgandG6vUu4B3DZkSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v9, 8);
  if (!v0)
    goto LABEL_8;
  v2 = *v0;
  v13 = v2;
  v15[0] = &unk_1E6288078;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = (id *)getVN6cM1E1jfvMnUZoEeDjinPOtJKpacqIprSymbolLoc_ptr;
  v12 = getVN6cM1E1jfvMnUZoEeDjinPOtJKpacqIprSymbolLoc_ptr;
  if (!getVN6cM1E1jfvMnUZoEeDjinPOtJKpacqIprSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VN6cM1E1jfvMnUZoEeDjinPOtJKpacqIpr");
    v10[3] = (uint64_t)v3;
    getVN6cM1E1jfvMnUZoEeDjinPOtJKpacqIprSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v9, 8);
  if (!v3)
  {
LABEL_8:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v14 = *v3;
  v15[1] = &unk_1E6288090;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = v14;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v15, &v13, 2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_AXMGenderCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMGenderCategoryForVisionCategoryIdentifier__categoryMap = v7;

}

- (int64_t)_AXMEyesCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMEyesCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMEyesCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_96);
  objc_msgSend((id)_AXMEyesCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMEyesCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __78__AXMVisionFeatureFaceAttributes__AXMEyesCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v0 = (id *)getVNFaceAttributeEyesClosedSymbolLoc_ptr;
  v12 = getVNFaceAttributeEyesClosedSymbolLoc_ptr;
  if (!getVNFaceAttributeEyesClosedSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VNFaceAttributeEyesClosed");
    v10[3] = (uint64_t)v0;
    getVNFaceAttributeEyesClosedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v9, 8);
  if (!v0)
    goto LABEL_8;
  v2 = *v0;
  v13 = v2;
  v15[0] = &unk_1E6288078;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = (id *)getVNFaceAttributeEyesOpenSymbolLoc_ptr;
  v12 = getVNFaceAttributeEyesOpenSymbolLoc_ptr;
  if (!getVNFaceAttributeEyesOpenSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VNFaceAttributeEyesOpen");
    v10[3] = (uint64_t)v3;
    getVNFaceAttributeEyesOpenSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v9, 8);
  if (!v3)
  {
LABEL_8:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v14 = *v3;
  v15[1] = &unk_1E6288090;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = v14;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v15, &v13, 2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_AXMEyesCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMEyesCategoryForVisionCategoryIdentifier__categoryMap = v7;

}

- (int64_t)_AXMHairColorCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMHairColorCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMHairColorCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_97);
  objc_msgSend((id)_AXMHairColorCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMHairColorCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __83__AXMVisionFeatureFaceAttributes__AXMHairColorCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v0 = (id *)getVNFaceAttributeHairColorBlackSymbolLoc_ptr;
  v24 = getVNFaceAttributeHairColorBlackSymbolLoc_ptr;
  if (!getVNFaceAttributeHairColorBlackSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VNFaceAttributeHairColorBlack");
    v22[3] = (uint64_t)v0;
    getVNFaceAttributeHairColorBlackSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v21, 8);
  if (!v0)
    goto LABEL_20;
  v2 = *v0;
  v25[0] = v2;
  v27[0] = &unk_1E6288078;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v3 = (id *)getVNFaceAttributeHairColorBlondeSymbolLoc_ptr;
  v24 = getVNFaceAttributeHairColorBlondeSymbolLoc_ptr;
  if (!getVNFaceAttributeHairColorBlondeSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VNFaceAttributeHairColorBlonde");
    v22[3] = (uint64_t)v3;
    getVNFaceAttributeHairColorBlondeSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v21, 8);
  if (!v3)
    goto LABEL_20;
  v5 = *v3;
  v25[1] = v5;
  v27[1] = &unk_1E6288090;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v6 = (id *)getVNFaceAttributeHairColorBrownSymbolLoc_ptr;
  v24 = getVNFaceAttributeHairColorBrownSymbolLoc_ptr;
  if (!getVNFaceAttributeHairColorBrownSymbolLoc_ptr)
  {
    v7 = (void *)VisionLibrary();
    v6 = (id *)dlsym(v7, "VNFaceAttributeHairColorBrown");
    v22[3] = (uint64_t)v6;
    getVNFaceAttributeHairColorBrownSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v21, 8);
  if (!v6)
    goto LABEL_20;
  v8 = *v6;
  v25[2] = v8;
  v27[2] = &unk_1E62880A8;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v9 = (id *)getVNFaceAttributeHairColorGraySymbolLoc_ptr;
  v24 = getVNFaceAttributeHairColorGraySymbolLoc_ptr;
  if (!getVNFaceAttributeHairColorGraySymbolLoc_ptr)
  {
    v10 = (void *)VisionLibrary();
    v9 = (id *)dlsym(v10, "VNFaceAttributeHairColorGray");
    v22[3] = (uint64_t)v9;
    getVNFaceAttributeHairColorGraySymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v21, 8);
  if (!v9)
    goto LABEL_20;
  v11 = *v9;
  v25[3] = v11;
  v27[3] = &unk_1E62880C0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v12 = (id *)getVNFaceAttributeHairColorRedSymbolLoc_ptr;
  v24 = getVNFaceAttributeHairColorRedSymbolLoc_ptr;
  if (!getVNFaceAttributeHairColorRedSymbolLoc_ptr)
  {
    v13 = (void *)VisionLibrary();
    v12 = (id *)dlsym(v13, "VNFaceAttributeHairColorRed");
    v22[3] = (uint64_t)v12;
    getVNFaceAttributeHairColorRedSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v21, 8);
  if (!v12)
    goto LABEL_20;
  v14 = *v12;
  v25[4] = v14;
  v27[4] = &unk_1E62880D8;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v15 = (id *)getVNFaceAttributeHairColorWhiteSymbolLoc_ptr;
  v24 = getVNFaceAttributeHairColorWhiteSymbolLoc_ptr;
  if (!getVNFaceAttributeHairColorWhiteSymbolLoc_ptr)
  {
    v16 = (void *)VisionLibrary();
    v15 = (id *)dlsym(v16, "VNFaceAttributeHairColorWhite");
    v22[3] = (uint64_t)v15;
    getVNFaceAttributeHairColorWhiteSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v21, 8);
  if (!v15)
  {
LABEL_20:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v26 = *v15;
  v27[5] = &unk_1E62880F0;
  v17 = (void *)MEMORY[0x1E0C99D80];
  v18 = v26;
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v27, v25, 6);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)_AXMHairColorCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMHairColorCategoryForVisionCategoryIdentifier__categoryMap = v19;

}

- (int64_t)_AXMGlassesCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMGlassesCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMGlassesCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_99);
  objc_msgSend((id)_AXMGlassesCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMGlassesCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __81__AXMVisionFeatureFaceAttributes__AXMGlassesCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  id v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v0 = (id *)getVNFaceAttributeGlassesPrescriptionSymbolLoc_ptr;
  v15 = getVNFaceAttributeGlassesPrescriptionSymbolLoc_ptr;
  if (!getVNFaceAttributeGlassesPrescriptionSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VNFaceAttributeGlassesPrescription");
    v13[3] = (uint64_t)v0;
    getVNFaceAttributeGlassesPrescriptionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v12, 8);
  if (!v0)
    goto LABEL_11;
  v2 = *v0;
  v16[0] = v2;
  v18[0] = &unk_1E6288078;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v3 = (id *)getVNFaceAttributeGlassesSunglassesSymbolLoc_ptr;
  v15 = getVNFaceAttributeGlassesSunglassesSymbolLoc_ptr;
  if (!getVNFaceAttributeGlassesSunglassesSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VNFaceAttributeGlassesSunglasses");
    v13[3] = (uint64_t)v3;
    getVNFaceAttributeGlassesSunglassesSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v12, 8);
  if (!v3)
    goto LABEL_11;
  v5 = *v3;
  v16[1] = v5;
  v18[1] = &unk_1E6288090;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v6 = (id *)getVNFaceAttributeGlassesNoneSymbolLoc_ptr;
  v15 = getVNFaceAttributeGlassesNoneSymbolLoc_ptr;
  if (!getVNFaceAttributeGlassesNoneSymbolLoc_ptr)
  {
    v7 = (void *)VisionLibrary();
    v6 = (id *)dlsym(v7, "VNFaceAttributeGlassesNone");
    v13[3] = (uint64_t)v6;
    getVNFaceAttributeGlassesNoneSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v12, 8);
  if (!v6)
  {
LABEL_11:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v17 = *v6;
  v18[2] = &unk_1E62880A8;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v17;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v18, v16, 3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_AXMGlassesCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMGlassesCategoryForVisionCategoryIdentifier__categoryMap = v10;

}

- (int64_t)_AXMMakeupEyesCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMMakeupEyesCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMMakeupEyesCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_100);
  objc_msgSend((id)_AXMMakeupEyesCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMMakeupEyesCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __84__AXMVisionFeatureFaceAttributes__AXMMakeupEyesCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  id v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v0 = (id *)getVNFaceAttributeMakeupEyesUnsureSymbolLoc_ptr;
  v15 = getVNFaceAttributeMakeupEyesUnsureSymbolLoc_ptr;
  if (!getVNFaceAttributeMakeupEyesUnsureSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VNFaceAttributeMakeupEyesUnsure");
    v13[3] = (uint64_t)v0;
    getVNFaceAttributeMakeupEyesUnsureSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v12, 8);
  if (!v0)
    goto LABEL_11;
  v2 = *v0;
  v16[0] = v2;
  v18[0] = &unk_1E6288108;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v3 = (id *)getVNFaceAttributeMakeupEyesNoneSymbolLoc_ptr;
  v15 = getVNFaceAttributeMakeupEyesNoneSymbolLoc_ptr;
  if (!getVNFaceAttributeMakeupEyesNoneSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VNFaceAttributeMakeupEyesNone");
    v13[3] = (uint64_t)v3;
    getVNFaceAttributeMakeupEyesNoneSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v12, 8);
  if (!v3)
    goto LABEL_11;
  v5 = *v3;
  v16[1] = v5;
  v18[1] = &unk_1E6288078;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v6 = (id *)getVNFaceAttributeMakeupEyesSymbolLoc_ptr;
  v15 = getVNFaceAttributeMakeupEyesSymbolLoc_ptr;
  if (!getVNFaceAttributeMakeupEyesSymbolLoc_ptr)
  {
    v7 = (void *)VisionLibrary();
    v6 = (id *)dlsym(v7, "VNFaceAttributeMakeupEyes");
    v13[3] = (uint64_t)v6;
    getVNFaceAttributeMakeupEyesSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v12, 8);
  if (!v6)
  {
LABEL_11:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v17 = *v6;
  v18[2] = &unk_1E6288090;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v17;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v18, v16, 3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_AXMMakeupEyesCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMMakeupEyesCategoryForVisionCategoryIdentifier__categoryMap = v10;

}

- (int64_t)_AXMMakeupLipsCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMMakeupLipsCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMMakeupLipsCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_102);
  objc_msgSend((id)_AXMMakeupLipsCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMMakeupLipsCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __84__AXMVisionFeatureFaceAttributes__AXMMakeupLipsCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  id v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v0 = (id *)getVNFaceAttributeMakeupLipsUnsureSymbolLoc_ptr;
  v15 = getVNFaceAttributeMakeupLipsUnsureSymbolLoc_ptr;
  if (!getVNFaceAttributeMakeupLipsUnsureSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VNFaceAttributeMakeupLipsUnsure");
    v13[3] = (uint64_t)v0;
    getVNFaceAttributeMakeupLipsUnsureSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v12, 8);
  if (!v0)
    goto LABEL_11;
  v2 = *v0;
  v16[0] = v2;
  v18[0] = &unk_1E6288108;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v3 = (id *)getVNFaceAttributeMakeupLipsNoneSymbolLoc_ptr;
  v15 = getVNFaceAttributeMakeupLipsNoneSymbolLoc_ptr;
  if (!getVNFaceAttributeMakeupLipsNoneSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VNFaceAttributeMakeupLipsNone");
    v13[3] = (uint64_t)v3;
    getVNFaceAttributeMakeupLipsNoneSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v12, 8);
  if (!v3)
    goto LABEL_11;
  v5 = *v3;
  v16[1] = v5;
  v18[1] = &unk_1E6288078;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v6 = (id *)getVNFaceAttributeMakeupLipsSymbolLoc_ptr;
  v15 = getVNFaceAttributeMakeupLipsSymbolLoc_ptr;
  if (!getVNFaceAttributeMakeupLipsSymbolLoc_ptr)
  {
    v7 = (void *)VisionLibrary();
    v6 = (id *)dlsym(v7, "VNFaceAttributeMakeupLips");
    v13[3] = (uint64_t)v6;
    getVNFaceAttributeMakeupLipsSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v12, 8);
  if (!v6)
  {
LABEL_11:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v17 = *v6;
  v18[2] = &unk_1E6288090;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v17;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v18, v16, 3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_AXMMakeupLipsCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMMakeupLipsCategoryForVisionCategoryIdentifier__categoryMap = v10;

}

- (int64_t)_AXMFacemaskCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMFacemaskCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMFacemaskCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_103);
  objc_msgSend((id)_AXMFacemaskCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMFacemaskCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __82__AXMVisionFeatureFaceAttributes__AXMFacemaskCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v0 = (id *)getVNFaceAttributeFacemaskNoneSymbolLoc_ptr;
  v12 = getVNFaceAttributeFacemaskNoneSymbolLoc_ptr;
  if (!getVNFaceAttributeFacemaskNoneSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VNFaceAttributeFacemaskNone");
    v10[3] = (uint64_t)v0;
    getVNFaceAttributeFacemaskNoneSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v9, 8);
  if (!v0)
    goto LABEL_8;
  v2 = *v0;
  v13 = v2;
  v15[0] = &unk_1E6288078;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = (id *)getVNFaceAttributeFacemaskSymbolLoc_ptr;
  v12 = getVNFaceAttributeFacemaskSymbolLoc_ptr;
  if (!getVNFaceAttributeFacemaskSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VNFaceAttributeFacemask");
    v10[3] = (uint64_t)v3;
    getVNFaceAttributeFacemaskSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v9, 8);
  if (!v3)
  {
LABEL_8:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v14 = *v3;
  v15[1] = &unk_1E6288090;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = v14;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v15, &v13, 2);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_AXMFacemaskCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMFacemaskCategoryForVisionCategoryIdentifier__categoryMap = v7;

}

- (int64_t)_AXMEthnicityCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMEthnicityCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMEthnicityCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_104);
  objc_msgSend((id)_AXMEthnicityCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMEthnicityCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __83__AXMVisionFeatureFaceAttributes__AXMEthnicityCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v0 = (id *)getVN7yMsLB9ggBYLDbJYIMGMSW6YBgi5uH2pSymbolLoc_ptr;
  v21 = getVN7yMsLB9ggBYLDbJYIMGMSW6YBgi5uH2pSymbolLoc_ptr;
  if (!getVN7yMsLB9ggBYLDbJYIMGMSW6YBgi5uH2pSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VN7yMsLB9ggBYLDbJYIMGMSW6YBgi5uH2p");
    v19[3] = (uint64_t)v0;
    getVN7yMsLB9ggBYLDbJYIMGMSW6YBgi5uH2pSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v18, 8);
  if (!v0)
    goto LABEL_17;
  v2 = *v0;
  v22[0] = v2;
  v24[0] = &unk_1E6288078;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v3 = (id *)getVN2eECeAuLQ8wnXvvNNkc5XEtpjqyiYvIpSymbolLoc_ptr;
  v21 = getVN2eECeAuLQ8wnXvvNNkc5XEtpjqyiYvIpSymbolLoc_ptr;
  if (!getVN2eECeAuLQ8wnXvvNNkc5XEtpjqyiYvIpSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VN2eECeAuLQ8wnXvvNNkc5XEtpjqyiYvIp");
    v19[3] = (uint64_t)v3;
    getVN2eECeAuLQ8wnXvvNNkc5XEtpjqyiYvIpSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v18, 8);
  if (!v3)
    goto LABEL_17;
  v5 = *v3;
  v22[1] = v5;
  v24[1] = &unk_1E6288090;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v6 = (id *)getVN2AhEqI0IOCJAaCX6zovlg85aFZ80JfESSymbolLoc_ptr;
  v21 = getVN2AhEqI0IOCJAaCX6zovlg85aFZ80JfESSymbolLoc_ptr;
  if (!getVN2AhEqI0IOCJAaCX6zovlg85aFZ80JfESSymbolLoc_ptr)
  {
    v7 = (void *)VisionLibrary();
    v6 = (id *)dlsym(v7, "VN2AhEqI0IOCJAaCX6zovlg85aFZ80JfES");
    v19[3] = (uint64_t)v6;
    getVN2AhEqI0IOCJAaCX6zovlg85aFZ80JfESSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v18, 8);
  if (!v6)
    goto LABEL_17;
  v8 = *v6;
  v22[2] = v8;
  v24[2] = &unk_1E62880A8;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v9 = (id *)getVN6a4sQBuQ5pSiUEd6p9iQflpz8xkWOnD2SymbolLoc_ptr;
  v21 = getVN6a4sQBuQ5pSiUEd6p9iQflpz8xkWOnD2SymbolLoc_ptr;
  if (!getVN6a4sQBuQ5pSiUEd6p9iQflpz8xkWOnD2SymbolLoc_ptr)
  {
    v10 = (void *)VisionLibrary();
    v9 = (id *)dlsym(v10, "VN6a4sQBuQ5pSiUEd6p9iQflpz8xkWOnD2");
    v19[3] = (uint64_t)v9;
    getVN6a4sQBuQ5pSiUEd6p9iQflpz8xkWOnD2SymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v18, 8);
  if (!v9)
    goto LABEL_17;
  v11 = *v9;
  v22[3] = v11;
  v24[3] = &unk_1E62880C0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v12 = (id *)getVN6pbJdmseepvIGYzcDyryle1xGdZEWhHNSymbolLoc_ptr;
  v21 = getVN6pbJdmseepvIGYzcDyryle1xGdZEWhHNSymbolLoc_ptr;
  if (!getVN6pbJdmseepvIGYzcDyryle1xGdZEWhHNSymbolLoc_ptr)
  {
    v13 = (void *)VisionLibrary();
    v12 = (id *)dlsym(v13, "VN6pbJdmseepvIGYzcDyryle1xGdZEWhHN");
    v19[3] = (uint64_t)v12;
    getVN6pbJdmseepvIGYzcDyryle1xGdZEWhHNSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v18, 8);
  if (!v12)
  {
LABEL_17:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v23 = *v12;
  v24[4] = &unk_1E62880D8;
  v14 = (void *)MEMORY[0x1E0C99D80];
  v15 = v23;
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v24, v22, 5);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)_AXMEthnicityCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMEthnicityCategoryForVisionCategoryIdentifier__categoryMap = v16;

}

- (int64_t)_AXMExpressionCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMExpressionCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMExpressionCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_105);
  objc_msgSend((id)_AXMExpressionCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMExpressionCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __84__AXMVisionFeatureFaceAttributes__AXMExpressionCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v0 = (id *)getVN607hNga4JKRc1ljftiy9QfPCqbXQmLP4SymbolLoc_ptr;
  v24 = getVN607hNga4JKRc1ljftiy9QfPCqbXQmLP4SymbolLoc_ptr;
  if (!getVN607hNga4JKRc1ljftiy9QfPCqbXQmLP4SymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VN607hNga4JKRc1ljftiy9QfPCqbXQmLP4");
    v22[3] = (uint64_t)v0;
    getVN607hNga4JKRc1ljftiy9QfPCqbXQmLP4SymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v21, 8);
  if (!v0)
    goto LABEL_20;
  v2 = *v0;
  v25[0] = v2;
  v27[0] = &unk_1E6288078;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v3 = (id *)getVN2TVJG6FfNTt72vwVKOv1Jf5dWtEHvQISSymbolLoc_ptr;
  v24 = getVN2TVJG6FfNTt72vwVKOv1Jf5dWtEHvQISSymbolLoc_ptr;
  if (!getVN2TVJG6FfNTt72vwVKOv1Jf5dWtEHvQISSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VN2TVJG6FfNTt72vwVKOv1Jf5dWtEHvQIS");
    v22[3] = (uint64_t)v3;
    getVN2TVJG6FfNTt72vwVKOv1Jf5dWtEHvQISSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v21, 8);
  if (!v3)
    goto LABEL_20;
  v5 = *v3;
  v25[1] = v5;
  v27[1] = &unk_1E6288090;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v6 = (id *)getVN7ja3fTi9TZDyKN8NdYJaWqla1NRFdcRXSymbolLoc_ptr;
  v24 = getVN7ja3fTi9TZDyKN8NdYJaWqla1NRFdcRXSymbolLoc_ptr;
  if (!getVN7ja3fTi9TZDyKN8NdYJaWqla1NRFdcRXSymbolLoc_ptr)
  {
    v7 = (void *)VisionLibrary();
    v6 = (id *)dlsym(v7, "VN7ja3fTi9TZDyKN8NdYJaWqla1NRFdcRX");
    v22[3] = (uint64_t)v6;
    getVN7ja3fTi9TZDyKN8NdYJaWqla1NRFdcRXSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v21, 8);
  if (!v6)
    goto LABEL_20;
  v8 = *v6;
  v25[2] = v8;
  v27[2] = &unk_1E62880A8;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v9 = (id *)getVN4lC1NTVMt6oWugtej0fqgS3z5p60aMupSymbolLoc_ptr;
  v24 = getVN4lC1NTVMt6oWugtej0fqgS3z5p60aMupSymbolLoc_ptr;
  if (!getVN4lC1NTVMt6oWugtej0fqgS3z5p60aMupSymbolLoc_ptr)
  {
    v10 = (void *)VisionLibrary();
    v9 = (id *)dlsym(v10, "VN4lC1NTVMt6oWugtej0fqgS3z5p60aMup");
    v22[3] = (uint64_t)v9;
    getVN4lC1NTVMt6oWugtej0fqgS3z5p60aMupSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v21, 8);
  if (!v9)
    goto LABEL_20;
  v11 = *v9;
  v25[3] = v11;
  v27[3] = &unk_1E62880C0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v12 = (id *)getVN1VQUXOcXrfZPXtaGgfZBhujM6uH6hvmISymbolLoc_ptr;
  v24 = getVN1VQUXOcXrfZPXtaGgfZBhujM6uH6hvmISymbolLoc_ptr;
  if (!getVN1VQUXOcXrfZPXtaGgfZBhujM6uH6hvmISymbolLoc_ptr)
  {
    v13 = (void *)VisionLibrary();
    v12 = (id *)dlsym(v13, "VN1VQUXOcXrfZPXtaGgfZBhujM6uH6hvmI");
    v22[3] = (uint64_t)v12;
    getVN1VQUXOcXrfZPXtaGgfZBhujM6uH6hvmISymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v21, 8);
  if (!v12)
    goto LABEL_20;
  v14 = *v12;
  v25[4] = v14;
  v27[4] = &unk_1E62880D8;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v15 = (id *)getVN6i04vrZluouTItkCUMtS916cLgTyvODXSymbolLoc_ptr;
  v24 = getVN6i04vrZluouTItkCUMtS916cLgTyvODXSymbolLoc_ptr;
  if (!getVN6i04vrZluouTItkCUMtS916cLgTyvODXSymbolLoc_ptr)
  {
    v16 = (void *)VisionLibrary();
    v15 = (id *)dlsym(v16, "VN6i04vrZluouTItkCUMtS916cLgTyvODX");
    v22[3] = (uint64_t)v15;
    getVN6i04vrZluouTItkCUMtS916cLgTyvODXSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v21, 8);
  if (!v15)
  {
LABEL_20:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v26 = *v15;
  v27[5] = &unk_1E6288108;
  v17 = (void *)MEMORY[0x1E0C99D80];
  v18 = v26;
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v27, v25, 6);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)_AXMExpressionCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMExpressionCategoryForVisionCategoryIdentifier__categoryMap = v19;

}

- (int64_t)_AXMFaceHairV2CategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMFaceHairV2CategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMFaceHairV2CategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_106);
  objc_msgSend((id)_AXMFaceHairV2CategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMFaceHairV2CategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __84__AXMVisionFeatureFaceAttributes__AXMFaceHairV2CategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  id v29;
  _QWORD v30[8];

  v30[7] = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v0 = (id *)getVN42tJSMaSWdsAnZKXv8XcZg2j2AIS7gjmSymbolLoc_ptr;
  v27 = getVN42tJSMaSWdsAnZKXv8XcZg2j2AIS7gjmSymbolLoc_ptr;
  if (!getVN42tJSMaSWdsAnZKXv8XcZg2j2AIS7gjmSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VN42tJSMaSWdsAnZKXv8XcZg2j2AIS7gjm");
    v25[3] = (uint64_t)v0;
    getVN42tJSMaSWdsAnZKXv8XcZg2j2AIS7gjmSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v24, 8);
  if (!v0)
    goto LABEL_23;
  v2 = *v0;
  v28[0] = v2;
  v30[0] = &unk_1E6288090;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v3 = (id *)getVN7vELTVTtPH26ptfCYi9dUHH8NxJ7O3cFSymbolLoc_ptr;
  v27 = getVN7vELTVTtPH26ptfCYi9dUHH8NxJ7O3cFSymbolLoc_ptr;
  if (!getVN7vELTVTtPH26ptfCYi9dUHH8NxJ7O3cFSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VN7vELTVTtPH26ptfCYi9dUHH8NxJ7O3cF");
    v25[3] = (uint64_t)v3;
    getVN7vELTVTtPH26ptfCYi9dUHH8NxJ7O3cFSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v24, 8);
  if (!v3)
    goto LABEL_23;
  v5 = *v3;
  v28[1] = v5;
  v30[1] = &unk_1E62880A8;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v6 = (id *)getVN5ijZTfHVHp6ubCHBh4oIZR1SW4xbvQ00SymbolLoc_ptr;
  v27 = getVN5ijZTfHVHp6ubCHBh4oIZR1SW4xbvQ00SymbolLoc_ptr;
  if (!getVN5ijZTfHVHp6ubCHBh4oIZR1SW4xbvQ00SymbolLoc_ptr)
  {
    v7 = (void *)VisionLibrary();
    v6 = (id *)dlsym(v7, "VN5ijZTfHVHp6ubCHBh4oIZR1SW4xbvQ00");
    v25[3] = (uint64_t)v6;
    getVN5ijZTfHVHp6ubCHBh4oIZR1SW4xbvQ00SymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v24, 8);
  if (!v6)
    goto LABEL_23;
  v8 = *v6;
  v28[2] = v8;
  v30[2] = &unk_1E62880D8;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v9 = (id *)getVN3WbFaDRN3PTBiMaMEq5ttCx7hmmfySmRSymbolLoc_ptr;
  v27 = getVN3WbFaDRN3PTBiMaMEq5ttCx7hmmfySmRSymbolLoc_ptr;
  if (!getVN3WbFaDRN3PTBiMaMEq5ttCx7hmmfySmRSymbolLoc_ptr)
  {
    v10 = (void *)VisionLibrary();
    v9 = (id *)dlsym(v10, "VN3WbFaDRN3PTBiMaMEq5ttCx7hmmfySmR");
    v25[3] = (uint64_t)v9;
    getVN3WbFaDRN3PTBiMaMEq5ttCx7hmmfySmRSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v24, 8);
  if (!v9)
    goto LABEL_23;
  v11 = *v9;
  v28[3] = v11;
  v30[3] = &unk_1E62880F0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v12 = (id *)getVN4lCLwxDV30rFLSeoihd8yM1zdbka3cVuSymbolLoc_ptr;
  v27 = getVN4lCLwxDV30rFLSeoihd8yM1zdbka3cVuSymbolLoc_ptr;
  if (!getVN4lCLwxDV30rFLSeoihd8yM1zdbka3cVuSymbolLoc_ptr)
  {
    v13 = (void *)VisionLibrary();
    v12 = (id *)dlsym(v13, "VN4lCLwxDV30rFLSeoihd8yM1zdbka3cVu");
    v25[3] = (uint64_t)v12;
    getVN4lCLwxDV30rFLSeoihd8yM1zdbka3cVuSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v24, 8);
  if (!v12)
    goto LABEL_23;
  v14 = *v12;
  v28[4] = v14;
  v30[4] = &unk_1E6288120;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v15 = (id *)getVN4qKg9nfl3p0M4juXFIsbUb7tpfCv9epxSymbolLoc_ptr;
  v27 = getVN4qKg9nfl3p0M4juXFIsbUb7tpfCv9epxSymbolLoc_ptr;
  if (!getVN4qKg9nfl3p0M4juXFIsbUb7tpfCv9epxSymbolLoc_ptr)
  {
    v16 = (void *)VisionLibrary();
    v15 = (id *)dlsym(v16, "VN4qKg9nfl3p0M4juXFIsbUb7tpfCv9epx");
    v25[3] = (uint64_t)v15;
    getVN4qKg9nfl3p0M4juXFIsbUb7tpfCv9epxSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v24, 8);
  if (!v15)
    goto LABEL_23;
  v17 = *v15;
  v28[5] = v17;
  v30[5] = &unk_1E62880C0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v18 = (id *)getVN31UxDngUK44hDexm8CSuZnlLxECLb0yUSymbolLoc_ptr;
  v27 = getVN31UxDngUK44hDexm8CSuZnlLxECLb0yUSymbolLoc_ptr;
  if (!getVN31UxDngUK44hDexm8CSuZnlLxECLb0yUSymbolLoc_ptr)
  {
    v19 = (void *)VisionLibrary();
    v18 = (id *)dlsym(v19, "VN31UxDngUK44hDexm8CSuZnlLxECLb0yU");
    v25[3] = (uint64_t)v18;
    getVN31UxDngUK44hDexm8CSuZnlLxECLb0yUSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v24, 8);
  if (!v18)
  {
LABEL_23:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v29 = *v18;
  v30[6] = &unk_1E6288078;
  v20 = (void *)MEMORY[0x1E0C99D80];
  v21 = v29;
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v30, v28, 7);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)_AXMFaceHairV2CategoryForVisionCategoryIdentifier__categoryMap;
  _AXMFaceHairV2CategoryForVisionCategoryIdentifier__categoryMap = v22;

}

- (int64_t)_AXMHairtypeCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMHairtypeCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMHairtypeCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_108);
  objc_msgSend((id)_AXMHairtypeCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMHairtypeCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __82__AXMVisionFeatureFaceAttributes__AXMHairtypeCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  id v29;
  _QWORD v30[8];

  v30[7] = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v0 = (id *)getVN5JBEfctS0JUWeTVUxBAKOSXCUuMqPxTgSymbolLoc_ptr;
  v27 = getVN5JBEfctS0JUWeTVUxBAKOSXCUuMqPxTgSymbolLoc_ptr;
  if (!getVN5JBEfctS0JUWeTVUxBAKOSXCUuMqPxTgSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VN5JBEfctS0JUWeTVUxBAKOSXCUuMqPxTg");
    v25[3] = (uint64_t)v0;
    getVN5JBEfctS0JUWeTVUxBAKOSXCUuMqPxTgSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v24, 8);
  if (!v0)
    goto LABEL_23;
  v2 = *v0;
  v28[0] = v2;
  v30[0] = &unk_1E62880A8;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v3 = (id *)getVN7CY11MLEimaE8WoiQ4opgi5HOi84j0UHSymbolLoc_ptr;
  v27 = getVN7CY11MLEimaE8WoiQ4opgi5HOi84j0UHSymbolLoc_ptr;
  if (!getVN7CY11MLEimaE8WoiQ4opgi5HOi84j0UHSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VN7CY11MLEimaE8WoiQ4opgi5HOi84j0UH");
    v25[3] = (uint64_t)v3;
    getVN7CY11MLEimaE8WoiQ4opgi5HOi84j0UHSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v24, 8);
  if (!v3)
    goto LABEL_23;
  v5 = *v3;
  v28[1] = v5;
  v30[1] = &unk_1E62880F0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v6 = (id *)getVN5SpoOVxahuTheCrHGepAYKTVB1baFLhQSymbolLoc_ptr;
  v27 = getVN5SpoOVxahuTheCrHGepAYKTVB1baFLhQSymbolLoc_ptr;
  if (!getVN5SpoOVxahuTheCrHGepAYKTVB1baFLhQSymbolLoc_ptr)
  {
    v7 = (void *)VisionLibrary();
    v6 = (id *)dlsym(v7, "VN5SpoOVxahuTheCrHGepAYKTVB1baFLhQ");
    v25[3] = (uint64_t)v6;
    getVN5SpoOVxahuTheCrHGepAYKTVB1baFLhQSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v24, 8);
  if (!v6)
    goto LABEL_23;
  v8 = *v6;
  v28[2] = v8;
  v30[2] = &unk_1E62880C0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v9 = (id *)getVN6YAJH4UBXYDBoH6cemKhJR7fPi2dt5QdSymbolLoc_ptr;
  v27 = getVN6YAJH4UBXYDBoH6cemKhJR7fPi2dt5QdSymbolLoc_ptr;
  if (!getVN6YAJH4UBXYDBoH6cemKhJR7fPi2dt5QdSymbolLoc_ptr)
  {
    v10 = (void *)VisionLibrary();
    v9 = (id *)dlsym(v10, "VN6YAJH4UBXYDBoH6cemKhJR7fPi2dt5Qd");
    v25[3] = (uint64_t)v9;
    getVN6YAJH4UBXYDBoH6cemKhJR7fPi2dt5QdSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v24, 8);
  if (!v9)
    goto LABEL_23;
  v11 = *v9;
  v28[3] = v11;
  v30[3] = &unk_1E6288120;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v12 = (id *)getVN21VM8NbCJMJjpepNo1kZkxteFybpDwlBSymbolLoc_ptr;
  v27 = getVN21VM8NbCJMJjpepNo1kZkxteFybpDwlBSymbolLoc_ptr;
  if (!getVN21VM8NbCJMJjpepNo1kZkxteFybpDwlBSymbolLoc_ptr)
  {
    v13 = (void *)VisionLibrary();
    v12 = (id *)dlsym(v13, "VN21VM8NbCJMJjpepNo1kZkxteFybpDwlB");
    v25[3] = (uint64_t)v12;
    getVN21VM8NbCJMJjpepNo1kZkxteFybpDwlBSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v24, 8);
  if (!v12)
    goto LABEL_23;
  v14 = *v12;
  v28[4] = v14;
  v30[4] = &unk_1E62880D8;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v15 = (id *)getVN6lDi9hTBjr2vdjAJ5rwdun4YEH09u5F5SymbolLoc_ptr;
  v27 = getVN6lDi9hTBjr2vdjAJ5rwdun4YEH09u5F5SymbolLoc_ptr;
  if (!getVN6lDi9hTBjr2vdjAJ5rwdun4YEH09u5F5SymbolLoc_ptr)
  {
    v16 = (void *)VisionLibrary();
    v15 = (id *)dlsym(v16, "VN6lDi9hTBjr2vdjAJ5rwdun4YEH09u5F5");
    v25[3] = (uint64_t)v15;
    getVN6lDi9hTBjr2vdjAJ5rwdun4YEH09u5F5SymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v24, 8);
  if (!v15)
    goto LABEL_23;
  v17 = *v15;
  v28[5] = v17;
  v30[5] = &unk_1E6288078;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v18 = (id *)getVN2X5h7waRTqk71pInqK4dnT6sZ6dRElxeSymbolLoc_ptr;
  v27 = getVN2X5h7waRTqk71pInqK4dnT6sZ6dRElxeSymbolLoc_ptr;
  if (!getVN2X5h7waRTqk71pInqK4dnT6sZ6dRElxeSymbolLoc_ptr)
  {
    v19 = (void *)VisionLibrary();
    v18 = (id *)dlsym(v19, "VN2X5h7waRTqk71pInqK4dnT6sZ6dRElxe");
    v25[3] = (uint64_t)v18;
    getVN2X5h7waRTqk71pInqK4dnT6sZ6dRElxeSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v24, 8);
  if (!v18)
  {
LABEL_23:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v29 = *v18;
  v30[6] = &unk_1E6288090;
  v20 = (void *)MEMORY[0x1E0C99D80];
  v21 = v29;
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v30, v28, 7);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)_AXMHairtypeCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMHairtypeCategoryForVisionCategoryIdentifier__categoryMap = v22;

}

- (int64_t)_AXMHeadgearCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMHeadgearCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMHeadgearCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_109);
  objc_msgSend((id)_AXMHeadgearCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMHeadgearCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __82__AXMVisionFeatureFaceAttributes__AXMHeadgearCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v0 = (id *)getVNPdH78Lr962vQvRIq2JApX2QJZtbR3fviSymbolLoc_ptr;
  v21 = getVNPdH78Lr962vQvRIq2JApX2QJZtbR3fviSymbolLoc_ptr;
  if (!getVNPdH78Lr962vQvRIq2JApX2QJZtbR3fviSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VNPdH78Lr962vQvRIq2JApX2QJZtbR3fvi");
    v19[3] = (uint64_t)v0;
    getVNPdH78Lr962vQvRIq2JApX2QJZtbR3fviSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v18, 8);
  if (!v0)
    goto LABEL_17;
  v2 = *v0;
  v22[0] = v2;
  v24[0] = &unk_1E6288090;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v3 = (id *)getVN2nEhtfck4KB7KsvJeCeSEPcGLfKzeUKiSymbolLoc_ptr;
  v21 = getVN2nEhtfck4KB7KsvJeCeSEPcGLfKzeUKiSymbolLoc_ptr;
  if (!getVN2nEhtfck4KB7KsvJeCeSEPcGLfKzeUKiSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VN2nEhtfck4KB7KsvJeCeSEPcGLfKzeUKi");
    v19[3] = (uint64_t)v3;
    getVN2nEhtfck4KB7KsvJeCeSEPcGLfKzeUKiSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v18, 8);
  if (!v3)
    goto LABEL_17;
  v5 = *v3;
  v22[1] = v5;
  v24[1] = &unk_1E6288078;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v6 = (id *)getVN465E5iEqlR2tknJ0qZkyAn3yIDrmUpJwSymbolLoc_ptr;
  v21 = getVN465E5iEqlR2tknJ0qZkyAn3yIDrmUpJwSymbolLoc_ptr;
  if (!getVN465E5iEqlR2tknJ0qZkyAn3yIDrmUpJwSymbolLoc_ptr)
  {
    v7 = (void *)VisionLibrary();
    v6 = (id *)dlsym(v7, "VN465E5iEqlR2tknJ0qZkyAn3yIDrmUpJw");
    v19[3] = (uint64_t)v6;
    getVN465E5iEqlR2tknJ0qZkyAn3yIDrmUpJwSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v18, 8);
  if (!v6)
    goto LABEL_17;
  v8 = *v6;
  v22[2] = v8;
  v24[2] = &unk_1E62880C0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v9 = (id *)getVN4oD9MSPBdmmSq6KG3k7nYqdSMT5aNp6pSymbolLoc_ptr;
  v21 = getVN4oD9MSPBdmmSq6KG3k7nYqdSMT5aNp6pSymbolLoc_ptr;
  if (!getVN4oD9MSPBdmmSq6KG3k7nYqdSMT5aNp6pSymbolLoc_ptr)
  {
    v10 = (void *)VisionLibrary();
    v9 = (id *)dlsym(v10, "VN4oD9MSPBdmmSq6KG3k7nYqdSMT5aNp6p");
    v19[3] = (uint64_t)v9;
    getVN4oD9MSPBdmmSq6KG3k7nYqdSMT5aNp6pSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v18, 8);
  if (!v9)
    goto LABEL_17;
  v11 = *v9;
  v22[3] = v11;
  v24[3] = &unk_1E62880A8;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v12 = (id *)getVN34LMYSFC7onytwsvH0y6uz2QaYvqY9qiSymbolLoc_ptr;
  v21 = getVN34LMYSFC7onytwsvH0y6uz2QaYvqY9qiSymbolLoc_ptr;
  if (!getVN34LMYSFC7onytwsvH0y6uz2QaYvqY9qiSymbolLoc_ptr)
  {
    v13 = (void *)VisionLibrary();
    v12 = (id *)dlsym(v13, "VN34LMYSFC7onytwsvH0y6uz2QaYvqY9qi");
    v19[3] = (uint64_t)v12;
    getVN34LMYSFC7onytwsvH0y6uz2QaYvqY9qiSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v18, 8);
  if (!v12)
  {
LABEL_17:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v23 = *v12;
  v24[4] = &unk_1E62880D8;
  v14 = (void *)MEMORY[0x1E0C99D80];
  v15 = v23;
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v24, v22, 5);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)_AXMHeadgearCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMHeadgearCategoryForVisionCategoryIdentifier__categoryMap = v16;

}

- (int64_t)_AXMPoseCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMPoseCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMPoseCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_110);
  objc_msgSend((id)_AXMPoseCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMPoseCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __78__AXMVisionFeatureFaceAttributes__AXMPoseCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v0 = (id *)getVN5iEOkR2NrIkLsZRvJTn61k1ovk3hvuxYSymbolLoc_ptr;
  v21 = getVN5iEOkR2NrIkLsZRvJTn61k1ovk3hvuxYSymbolLoc_ptr;
  if (!getVN5iEOkR2NrIkLsZRvJTn61k1ovk3hvuxYSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VN5iEOkR2NrIkLsZRvJTn61k1ovk3hvuxY");
    v19[3] = (uint64_t)v0;
    getVN5iEOkR2NrIkLsZRvJTn61k1ovk3hvuxYSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v18, 8);
  if (!v0)
    goto LABEL_17;
  v2 = *v0;
  v22[0] = v2;
  v24[0] = &unk_1E6288078;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v3 = (id *)getVN7ICFqxCpgr8BTWkFrFGYTQ3INUhxhYXRSymbolLoc_ptr;
  v21 = getVN7ICFqxCpgr8BTWkFrFGYTQ3INUhxhYXRSymbolLoc_ptr;
  if (!getVN7ICFqxCpgr8BTWkFrFGYTQ3INUhxhYXRSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VN7ICFqxCpgr8BTWkFrFGYTQ3INUhxhYXR");
    v19[3] = (uint64_t)v3;
    getVN7ICFqxCpgr8BTWkFrFGYTQ3INUhxhYXRSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v18, 8);
  if (!v3)
    goto LABEL_17;
  v5 = *v3;
  v22[1] = v5;
  v24[1] = &unk_1E6288090;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v6 = (id *)getVN3rKrpi4DELvo8AgM5Y3C68ryFlgB1grkSymbolLoc_ptr;
  v21 = getVN3rKrpi4DELvo8AgM5Y3C68ryFlgB1grkSymbolLoc_ptr;
  if (!getVN3rKrpi4DELvo8AgM5Y3C68ryFlgB1grkSymbolLoc_ptr)
  {
    v7 = (void *)VisionLibrary();
    v6 = (id *)dlsym(v7, "VN3rKrpi4DELvo8AgM5Y3C68ryFlgB1grk");
    v19[3] = (uint64_t)v6;
    getVN3rKrpi4DELvo8AgM5Y3C68ryFlgB1grkSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v18, 8);
  if (!v6)
    goto LABEL_17;
  v8 = *v6;
  v22[2] = v8;
  v24[2] = &unk_1E62880A8;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v9 = (id *)getVN7ar6bR0PqRvM9BZ0nqEdwh61tXzue1UtSymbolLoc_ptr;
  v21 = getVN7ar6bR0PqRvM9BZ0nqEdwh61tXzue1UtSymbolLoc_ptr;
  if (!getVN7ar6bR0PqRvM9BZ0nqEdwh61tXzue1UtSymbolLoc_ptr)
  {
    v10 = (void *)VisionLibrary();
    v9 = (id *)dlsym(v10, "VN7ar6bR0PqRvM9BZ0nqEdwh61tXzue1Ut");
    v19[3] = (uint64_t)v9;
    getVN7ar6bR0PqRvM9BZ0nqEdwh61tXzue1UtSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v18, 8);
  if (!v9)
    goto LABEL_17;
  v11 = *v9;
  v22[3] = v11;
  v24[3] = &unk_1E62880C0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v12 = (id *)getVN1I7oR8JHxER2i7d6nQxNtHhGXxkJuH7cSymbolLoc_ptr;
  v21 = getVN1I7oR8JHxER2i7d6nQxNtHhGXxkJuH7cSymbolLoc_ptr;
  if (!getVN1I7oR8JHxER2i7d6nQxNtHhGXxkJuH7cSymbolLoc_ptr)
  {
    v13 = (void *)VisionLibrary();
    v12 = (id *)dlsym(v13, "VN1I7oR8JHxER2i7d6nQxNtHhGXxkJuH7c");
    v19[3] = (uint64_t)v12;
    getVN1I7oR8JHxER2i7d6nQxNtHhGXxkJuH7cSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v18, 8);
  if (!v12)
  {
LABEL_17:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v23 = *v12;
  v24[4] = &unk_1E62880D8;
  v14 = (void *)MEMORY[0x1E0C99D80];
  v15 = v23;
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v24, v22, 5);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)_AXMPoseCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMPoseCategoryForVisionCategoryIdentifier__categoryMap = v16;

}

- (int64_t)_AXMSkintoneCategoryForVisionCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;

  v3 = a3;
  if (_AXMSkintoneCategoryForVisionCategoryIdentifier__onceToken != -1)
    dispatch_once(&_AXMSkintoneCategoryForVisionCategoryIdentifier__onceToken, &__block_literal_global_111);
  objc_msgSend((id)_AXMSkintoneCategoryForVisionCategoryIdentifier__categoryMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureFaceAttributes _AXMSkintoneCategoryForVisionCategoryIdentifier:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __82__AXMVisionFeatureFaceAttributes__AXMSkintoneCategoryForVisionCategoryIdentifier___block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v0 = (id *)getVNDGCsUiwnQwGz0qSSQPGGd177EyoSaoGNSymbolLoc_ptr;
  v24 = getVNDGCsUiwnQwGz0qSSQPGGd177EyoSaoGNSymbolLoc_ptr;
  if (!getVNDGCsUiwnQwGz0qSSQPGGd177EyoSaoGNSymbolLoc_ptr)
  {
    v1 = (void *)VisionLibrary();
    v0 = (id *)dlsym(v1, "VNDGCsUiwnQwGz0qSSQPGGd177EyoSaoGN");
    v22[3] = (uint64_t)v0;
    getVNDGCsUiwnQwGz0qSSQPGGd177EyoSaoGNSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v21, 8);
  if (!v0)
    goto LABEL_20;
  v2 = *v0;
  v25[0] = v2;
  v27[0] = &unk_1E6288078;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v3 = (id *)getVN6LhAjooMZpZkrkhS48XbQt7602EpEAxvSymbolLoc_ptr;
  v24 = getVN6LhAjooMZpZkrkhS48XbQt7602EpEAxvSymbolLoc_ptr;
  if (!getVN6LhAjooMZpZkrkhS48XbQt7602EpEAxvSymbolLoc_ptr)
  {
    v4 = (void *)VisionLibrary();
    v3 = (id *)dlsym(v4, "VN6LhAjooMZpZkrkhS48XbQt7602EpEAxv");
    v22[3] = (uint64_t)v3;
    getVN6LhAjooMZpZkrkhS48XbQt7602EpEAxvSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v21, 8);
  if (!v3)
    goto LABEL_20;
  v5 = *v3;
  v25[1] = v5;
  v27[1] = &unk_1E6288090;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v6 = (id *)getVN1HsiXmKrxTsH8TYOuN5s7G3uHSP75iYSSymbolLoc_ptr;
  v24 = getVN1HsiXmKrxTsH8TYOuN5s7G3uHSP75iYSSymbolLoc_ptr;
  if (!getVN1HsiXmKrxTsH8TYOuN5s7G3uHSP75iYSSymbolLoc_ptr)
  {
    v7 = (void *)VisionLibrary();
    v6 = (id *)dlsym(v7, "VN1HsiXmKrxTsH8TYOuN5s7G3uHSP75iYS");
    v22[3] = (uint64_t)v6;
    getVN1HsiXmKrxTsH8TYOuN5s7G3uHSP75iYSSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v21, 8);
  if (!v6)
    goto LABEL_20;
  v8 = *v6;
  v25[2] = v8;
  v27[2] = &unk_1E62880A8;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v9 = (id *)getVN1kD4zwSpSn6esc2wHjyAeZ2IRmwqjgttSymbolLoc_ptr;
  v24 = getVN1kD4zwSpSn6esc2wHjyAeZ2IRmwqjgttSymbolLoc_ptr;
  if (!getVN1kD4zwSpSn6esc2wHjyAeZ2IRmwqjgttSymbolLoc_ptr)
  {
    v10 = (void *)VisionLibrary();
    v9 = (id *)dlsym(v10, "VN1kD4zwSpSn6esc2wHjyAeZ2IRmwqjgtt");
    v22[3] = (uint64_t)v9;
    getVN1kD4zwSpSn6esc2wHjyAeZ2IRmwqjgttSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v21, 8);
  if (!v9)
    goto LABEL_20;
  v11 = *v9;
  v25[3] = v11;
  v27[3] = &unk_1E62880C0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v12 = (id *)getVN1PwKd46IDZj2ErCN9d1fTn3FuN3h4d9pSymbolLoc_ptr;
  v24 = getVN1PwKd46IDZj2ErCN9d1fTn3FuN3h4d9pSymbolLoc_ptr;
  if (!getVN1PwKd46IDZj2ErCN9d1fTn3FuN3h4d9pSymbolLoc_ptr)
  {
    v13 = (void *)VisionLibrary();
    v12 = (id *)dlsym(v13, "VN1PwKd46IDZj2ErCN9d1fTn3FuN3h4d9p");
    v22[3] = (uint64_t)v12;
    getVN1PwKd46IDZj2ErCN9d1fTn3FuN3h4d9pSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v21, 8);
  if (!v12)
    goto LABEL_20;
  v14 = *v12;
  v25[4] = v14;
  v27[4] = &unk_1E62880D8;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v15 = (id *)getVN4bzonkXHYlzBnJNXcyyPd8WLw1wAI1PvSymbolLoc_ptr;
  v24 = getVN4bzonkXHYlzBnJNXcyyPd8WLw1wAI1PvSymbolLoc_ptr;
  if (!getVN4bzonkXHYlzBnJNXcyyPd8WLw1wAI1PvSymbolLoc_ptr)
  {
    v16 = (void *)VisionLibrary();
    v15 = (id *)dlsym(v16, "VN4bzonkXHYlzBnJNXcyyPd8WLw1wAI1Pv");
    v22[3] = (uint64_t)v15;
    getVN4bzonkXHYlzBnJNXcyyPd8WLw1wAI1PvSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v21, 8);
  if (!v15)
  {
LABEL_20:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    __break(1u);
  }
  v26 = *v15;
  v27[5] = &unk_1E62880F0;
  v17 = (void *)MEMORY[0x1E0C99D80];
  v18 = v26;
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v27, v25, 6);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)_AXMSkintoneCategoryForVisionCategoryIdentifier__categoryMap;
  _AXMSkintoneCategoryForVisionCategoryIdentifier__categoryMap = v19;

}

- (id)_accessibilityIdentifierForPoseCategory
{
  int64_t v3;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x20) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axPoseCategory](self, "axPoseCategory");
  if ((unint64_t)(v3 - 1) > 4)
    return 0;
  else
    return off_1E625C6E8[v3 - 1];
}

- (id)_accessibilityIdentifierForSkintoneCategory
{
  int64_t v3;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 8) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axSkintoneCategory](self, "axSkintoneCategory");
  if ((unint64_t)(v3 - 1) > 5)
    return 0;
  else
    return off_1E625C710[v3 - 1];
}

- (id)_accessibilityIdentifierForEthnicityCategory
{
  int64_t v3;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x10) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axEthnicityCategory](self, "axEthnicityCategory");
  if ((unint64_t)(v3 - 1) > 4)
    return 0;
  else
    return off_1E625C740[v3 - 1];
}

- (id)_accessibilityIdentifierForGenderCategory
{
  int64_t v3;
  const __CFString *v4;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 4) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axGenderCategory](self, "axGenderCategory");
  v4 = CFSTR("Gender_Female");
  if (v3 != 2)
    v4 = 0;
  if (v3 == 1)
    return CFSTR("Gender_Male");
  else
    return (id)v4;
}

- (id)_accessibilityIdentifierForAgeCategory
{
  int64_t v3;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 2) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axAgeCategory](self, "axAgeCategory");
  if ((unint64_t)(v3 - 1) > 4)
    return 0;
  else
    return off_1E625C768[v3 - 1];
}

- (id)_accessibilityIdentifierForHairColorCategory
{
  int64_t v3;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x40) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axHairColorCategory](self, "axHairColorCategory");
  if ((unint64_t)(v3 - 1) > 5)
    return 0;
  else
    return off_1E625C790[v3 - 1];
}

- (id)_accessibilityIdentifierForHairTypeCategory
{
  int64_t v2;

  v2 = -[AXMVisionFeatureFaceAttributes axHairTypeCategory](self, "axHairTypeCategory");
  if ((unint64_t)(v2 - 1) > 6)
    return 0;
  else
    return off_1E625C7C0[v2 - 1];
}

- (id)_accessibilityIdentifierForFaceHairV2Category
{
  int64_t v3;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x100) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axFaceHairV2Category](self, "axFaceHairV2Category");
  if ((unint64_t)(v3 - 2) > 5)
    return 0;
  else
    return off_1E625C7F8[v3 - 2];
}

- (id)_accessibilityIdentifierForGlassesCategory
{
  int64_t v3;
  const __CFString *v4;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x200) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axGlassesCategory](self, "axGlassesCategory");
  v4 = CFSTR("Glasses_Sunglasses");
  if (v3 != 2)
    v4 = 0;
  if (v3 == 1)
    return CFSTR("Glasses_Prescription");
  else
    return (id)v4;
}

- (id)_accessibilityIdentifierForFacemaskCategory
{
  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x400) != 0)
    return 0;
  if (-[AXMVisionFeatureFaceAttributes axFacemaskCategory](self, "axFacemaskCategory") == 2)
    return CFSTR("Facemask_Available");
  return 0;
}

- (id)_accessibilityIdentifierForHeadgearCategory
{
  int64_t v3;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x800) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axHeadgearCategory](self, "axHeadgearCategory");
  if ((unint64_t)(v3 - 1) > 3)
    return 0;
  else
    return off_1E625C828[v3 - 1];
}

- (id)_accessibilityIdentifierForMakeupEyesCategory
{
  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x1000) != 0)
    return 0;
  if (-[AXMVisionFeatureFaceAttributes axMakeupEyesCategory](self, "axMakeupEyesCategory") == 2)
    return CFSTR("MakeupEyes_Available");
  return 0;
}

- (id)_accessibilityIdentifierForMakeupLipsCategory
{
  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x1000) != 0)
    return 0;
  if (-[AXMVisionFeatureFaceAttributes axMakeupLipsCategory](self, "axMakeupLipsCategory") == 2)
    return CFSTR("MakeupLips_Available");
  return 0;
}

- (id)_accessibilityIdentifierForExpressionCategory
{
  int64_t v3;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x2000) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axExpressionCategory](self, "axExpressionCategory");
  if ((unint64_t)(v3 - 1) > 4)
    return 0;
  else
    return off_1E625C848[v3 - 1];
}

- (id)_accessibilityIdentifierForEyesCategory
{
  int64_t v3;
  const __CFString *v4;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x4000) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axEyesCategory](self, "axEyesCategory");
  v4 = CFSTR("Eyes_Open");
  if (v3 != 2)
    v4 = 0;
  if (v3 == 1)
    return CFSTR("Eyes_Closed");
  else
    return (id)v4;
}

- (id)_accessibilityLabelFormatterForPoseCategory
{
  int64_t v3;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x20) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axPoseCategory](self, "axPoseCategory");
  if ((unint64_t)(v3 - 2) > 3)
    return 0;
  else
    return off_1E625C870[v3 - 2];
}

- (id)_accessibilityLabelFormatterForAgeCategory
{
  unint64_t v3;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 2) != 0)
    return CFSTR(".age.person");
  v3 = -[AXMVisionFeatureFaceAttributes axAgeCategory](self, "axAgeCategory");
  if (v3 > 5)
    return CFSTR(".age.baby");
  else
    return off_1E625C890[v3];
}

- (id)_accessibilityLabelFormatterForHairColorCategory
{
  int64_t v3;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x40) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axHairColorCategory](self, "axHairColorCategory");
  if ((unint64_t)(v3 - 1) > 5)
    return 0;
  else
    return off_1E625C8C0[v3 - 1];
}

- (id)_accessibilityLabelFormatterForHairTypeCategory
{
  int64_t v3;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x80) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axHairTypeCategory](self, "axHairTypeCategory");
  if ((unint64_t)(v3 - 1) > 3)
    return 0;
  else
    return off_1E625C8F0[v3 - 1];
}

- (id)_accessibilityLabelFormatterForFaceHairV2Category
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  BOOL v12;
  void *v13;
  const __CFString *v14;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x100) != 0)
  {
    -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterForHairColorCategory](self, "_accessibilityLabelFormatterForHairColorCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterForHairTypeCategory](self, "_accessibilityLabelFormatterForHairTypeCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }
  else
  {
    v3 = -[AXMVisionFeatureFaceAttributes axFaceHairV2Category](self, "axFaceHairV2Category");
    -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterForHairColorCategory](self, "_accessibilityLabelFormatterForHairColorCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterForHairTypeCategory](self, "_accessibilityLabelFormatterForHairTypeCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5 | v4)
      v6 = v5;
    else
      v6 = 0;
    v7 = CFSTR(".facehair.present");
    if (v5 | v4)
      v8 = v4;
    else
      v8 = 0;
    if (v5 | v4)
      v7 = CFSTR(".facehair.included");
    if (((1 << v3) & 0xEC) != 0)
      v9 = v6;
    else
      v9 = v5;
    if (((1 << v3) & 0xEC) != 0)
      v10 = (void *)v8;
    else
      v10 = (void *)v4;
    if (((1 << v3) & 0xEC) != 0)
      v11 = v7;
    else
      v11 = 0;
    v12 = v3 > 7;
    if (v3 > 7)
    {
      v13 = (void *)v4;
    }
    else
    {
      v5 = v9;
      v13 = v10;
    }
    if (v12)
      v14 = 0;
    else
      v14 = v11;
  }

  return (id)v14;
}

- (id)_accessibilityLabelFormatterForGlassesCategory
{
  int64_t v3;
  const __CFString *v4;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x200) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axGlassesCategory](self, "axGlassesCategory");
  v4 = CFSTR(".sunglasses");
  if (v3 != 2)
    v4 = 0;
  if (v3 == 1)
    return CFSTR(".prescription");
  else
    return (id)v4;
}

- (id)_accessibilityLabelFormatterForFaceMaskCategory
{
  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x400) != 0)
    return 0;
  if (-[AXMVisionFeatureFaceAttributes axFacemaskCategory](self, "axFacemaskCategory") == 2)
    return CFSTR(".facemask");
  return 0;
}

- (id)_accessibilityLabelFormatterForExpressionCategory
{
  int64_t v3;
  const __CFString *v4;

  if ((-[AXMVisionFeatureFaceAttributes excludeOptions](self, "excludeOptions") & 0x2000) != 0)
    return 0;
  v3 = -[AXMVisionFeatureFaceAttributes axExpressionCategory](self, "axExpressionCategory");
  v4 = CFSTR(".smiling");
  if (v3 != 5)
    v4 = 0;
  if (v3 == 2)
    return CFSTR(".laughing");
  else
    return (id)v4;
}

- (id)_accessibilityLabelFormatterBeginning
{
  return CFSTR("faceattributes");
}

- (id)_accessibilityLabelForDemographics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterBeginning](self, "_accessibilityLabelFormatterBeginning");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterForPoseCategory](self, "_accessibilityLabelFormatterForPoseCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "appendString:", v6);
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterForAgeCategory](self, "_accessibilityLabelFormatterForAgeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "appendString:", v7);
  }
  else if (!v6)
  {
    v9 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v5, &stru_1E6260C18, CFSTR("Accessibility"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

- (id)_accessibilityLabelForHairDetails
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterBeginning](self, "_accessibilityLabelFormatterBeginning");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterForHairColorCategory](self, "_accessibilityLabelFormatterForHairColorCategory");
  v6 = objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterForHairTypeCategory](self, "_accessibilityLabelFormatterForHairTypeCategory");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    objc_msgSend(v5, "appendString:", v6);
    v9 = v8;
  }
  else
  {
    if (v6)
      v9 = (void *)v6;
    else
      v9 = (void *)v7;
    if (!(v6 | v7))
    {
      v11 = 0;
      goto LABEL_10;
    }
  }
  objc_msgSend(v5, "appendString:", v9);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v5, &stru_1E6260C18, CFSTR("Accessibility"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v11;
}

- (id)_accessibilityLabelForFacialHairDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterBeginning](self, "_accessibilityLabelFormatterBeginning");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterForFaceHairV2Category](self, "_accessibilityLabelFormatterForFaceHairV2Category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "appendString:", v6);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v5, &stru_1E6260C18, CFSTR("Accessibility"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_accessibilityLabelForAccessoryDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterBeginning](self, "_accessibilityLabelFormatterBeginning");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", CFSTR(".accessories"));
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterForGlassesCategory](self, "_accessibilityLabelFormatterForGlassesCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "appendString:", v6);
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterForFaceMaskCategory](self, "_accessibilityLabelFormatterForFaceMaskCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "appendString:", v7);
  }
  else if (!v6)
  {
    v9 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v5, &stru_1E6260C18, CFSTR("Accessibility"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

- (id)_accessibilityLabelForExpressionDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterBeginning](self, "_accessibilityLabelFormatterBeginning");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", CFSTR(".expression"));
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelFormatterForExpressionCategory](self, "_accessibilityLabelFormatterForExpressionCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "appendString:", v6);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v5, &stru_1E6260C18, CFSTR("Accessibility"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)accessibilityLabelForAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[AXMVisionFeatureFaceAttributes _accessibilityLabelForDemographics](self, "_accessibilityLabelForDemographics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelForHairDetails](self, "_accessibilityLabelForHairDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelForFacialHairDetails](self, "_accessibilityLabelForFacialHairDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelForAccessoryDetails](self, "_accessibilityLabelForAccessoryDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureFaceAttributes _accessibilityLabelForExpressionDetails](self, "_accessibilityLabelForExpressionDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "axmArrayByIgnoringNilElementsWithCount:", 5, v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AXMLabelForNSStringElements(v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)accessibilityLabelAndConfidenceMappingForAttributes
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForPoseCategory](self, "_accessibilityIdentifierForPoseCategory");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axPoseCategoryConfidence](self, "axPoseCategoryConfidence");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v4);

  }
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForAgeCategory](self, "_accessibilityIdentifierForAgeCategory");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axAgeCategoryConfidence](self, "axAgeCategoryConfidence");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v7);

  }
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForGenderCategory](self, "_accessibilityIdentifierForGenderCategory");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axGenderCategoryConfidence](self, "axGenderCategoryConfidence");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);

  }
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForGlassesCategory](self, "_accessibilityIdentifierForGlassesCategory");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axGlassesCategoryConfidence](self, "axGlassesCategoryConfidence");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v13);

  }
  v55 = (void *)v10;
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForHairColorCategory](self, "_accessibilityIdentifierForHairColorCategory");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axHairColorCategoryConfidence](self, "axHairColorCategoryConfidence");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, v16);

  }
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForHairTypeCategory](self, "_accessibilityIdentifierForHairTypeCategory");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axHairTypeCategoryConfidence](self, "axHairTypeCategoryConfidence");
    objc_msgSend(v20, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, v19);

  }
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForFaceHairV2Category](self, "_accessibilityIdentifierForFaceHairV2Category");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axFaceHairV2CategoryConfidence](self, "axFaceHairV2CategoryConfidence");
    objc_msgSend(v23, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, v22);

  }
  v51 = (void *)v22;
  v57 = (void *)v4;
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForHeadgearCategory](self, "_accessibilityIdentifierForHeadgearCategory");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axHeadgearCategoryConfidence](self, "axHeadgearCategoryConfidence");
    objc_msgSend(v26, "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, v25);

  }
  v56 = (void *)v7;
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForFacemaskCategory](self, "_accessibilityIdentifierForFacemaskCategory", v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axFacemaskCategoryConfidence](self, "axFacemaskCategoryConfidence");
    objc_msgSend(v29, "numberWithDouble:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, v28);

  }
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForExpressionCategory](self, "_accessibilityIdentifierForExpressionCategory");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axExpressionCategoryConfidence](self, "axExpressionCategoryConfidence");
    objc_msgSend(v32, "numberWithDouble:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, v31);

  }
  v54 = (void *)v13;
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForEthnicityCategory](self, "_accessibilityIdentifierForEthnicityCategory");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axEthnicityCategoryConfidence](self, "axEthnicityCategoryConfidence");
    objc_msgSend(v35, "numberWithDouble:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, v34);

  }
  v53 = (void *)v16;
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForEyesCategory](self, "_accessibilityIdentifierForEyesCategory");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axEyesCategoryConfidence](self, "axEyesCategoryConfidence");
    objc_msgSend(v38, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, v37);

  }
  v52 = (void *)v19;
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForMakeupEyesCategory](self, "_accessibilityIdentifierForMakeupEyesCategory");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axMakeupEyesCategoryConfidence](self, "axMakeupEyesCategoryConfidence");
    objc_msgSend(v41, "numberWithDouble:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, v40);

  }
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForMakeupLipsCategory](self, "_accessibilityIdentifierForMakeupLipsCategory");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axMakeupLipsCategoryConfidence](self, "axMakeupLipsCategoryConfidence");
    objc_msgSend(v44, "numberWithDouble:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, v43);

  }
  -[AXMVisionFeatureFaceAttributes _accessibilityIdentifierForSkintoneCategory](self, "_accessibilityIdentifierForSkintoneCategory");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)MEMORY[0x1E0CB37E8];
    -[AXMVisionFeatureFaceAttributes axSkintoneCategoryConfidence](self, "axSkintoneCategoryConfidence");
    objc_msgSend(v47, "numberWithDouble:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, v46);

  }
  return v3;
}

+ (id)unitTestingFaceAttributesForAge:(int64_t)a3 gender:(int64_t)a4 eyes:(int64_t)a5 smiling:(int64_t)a6 facialHair:(int64_t)a7 hairColor:(int64_t)a8 baldness:(int64_t)a9 glasses:(int64_t)a10 eyeMakeup:(int64_t)a11 lipMakeup:(int64_t)a12 faceMask:(int64_t)a13 ethnicity:(int64_t)a14 expression:(int64_t)a15 facialHairV2:(int64_t)a16 hairType:(int64_t)a17 headGear:(int64_t)a18 pose:(int64_t)a19 skinTone:(int64_t)a20 excludeOptions:(int64_t)a21
{
  AXMVisionFeatureFaceAttributes *v24;

  v24 = objc_alloc_init(AXMVisionFeatureFaceAttributes);
  -[AXMVisionFeatureFaceAttributes setExcludeOptions:](v24, "setExcludeOptions:", a21);
  v24->_axAgeCategory = a3;
  v24->_axGenderCategory = a4;
  v24->_axEyesCategory = a5;
  v24->_axSmilingCategory = a6;
  v24->_axFaceHairCategory = a7;
  v24->_axHairColorCategory = a8;
  v24->_axBaldCategory = a9;
  v24->_axGlassesCategory = a10;
  v24->_axMakeupEyesCategory = a11;
  v24->_axMakeupLipsCategory = a12;
  v24->_axFacemaskCategory = a13;
  v24->_axEthnicityCategory = a14;
  v24->_axExpressionCategory = a15;
  v24->_axFaceHairV2Category = a16;
  v24->_axHairTypeCategory = a17;
  v24->_axHeadgearCategory = a18;
  v24->_axPoseCategory = a19;
  v24->_axSkintoneCategory = a20;
  return v24;
}

+ (id)unitTestingFaceAttributes
{
  AXMVisionFeatureFaceAttributes *v2;

  v2 = objc_alloc_init(AXMVisionFeatureFaceAttributes);
  v2->_axAgeCategory = 3;
  *(int64x2_t *)&v2->_axSmilingCategory = vdupq_n_s64(2uLL);
  v2->_axHairColorCategory = 3;
  *(int64x2_t *)&v2->_axBaldCategory = vdupq_n_s64(1uLL);
  return v2;
}

- (int64_t)axAgeCategory
{
  return self->_axAgeCategory;
}

- (double)axAgeCategoryConfidence
{
  return self->_axAgeCategoryConfidence;
}

- (void)setAxAgeCategoryConfidence:(double)a3
{
  self->_axAgeCategoryConfidence = a3;
}

- (int64_t)axGenderCategory
{
  return self->_axGenderCategory;
}

- (double)axGenderCategoryConfidence
{
  return self->_axGenderCategoryConfidence;
}

- (void)setAxGenderCategoryConfidence:(double)a3
{
  self->_axGenderCategoryConfidence = a3;
}

- (int64_t)axEyesCategory
{
  return self->_axEyesCategory;
}

- (double)axEyesCategoryConfidence
{
  return self->_axEyesCategoryConfidence;
}

- (void)setAxEyesCategoryConfidence:(double)a3
{
  self->_axEyesCategoryConfidence = a3;
}

- (int64_t)axSmilingCategory
{
  return self->_axSmilingCategory;
}

- (int64_t)axFaceHairCategory
{
  return self->_axFaceHairCategory;
}

- (int64_t)axHairColorCategory
{
  return self->_axHairColorCategory;
}

- (double)axHairColorCategoryConfidence
{
  return self->_axHairColorCategoryConfidence;
}

- (void)setAxHairColorCategoryConfidence:(double)a3
{
  self->_axHairColorCategoryConfidence = a3;
}

- (int64_t)axBaldCategory
{
  return self->_axBaldCategory;
}

- (int64_t)axGlassesCategory
{
  return self->_axGlassesCategory;
}

- (double)axGlassesCategoryConfidence
{
  return self->_axGlassesCategoryConfidence;
}

- (void)setAxGlassesCategoryConfidence:(double)a3
{
  self->_axGlassesCategoryConfidence = a3;
}

- (int64_t)axMakeupEyesCategory
{
  return self->_axMakeupEyesCategory;
}

- (double)axMakeupEyesCategoryConfidence
{
  return self->_axMakeupEyesCategoryConfidence;
}

- (void)setAxMakeupEyesCategoryConfidence:(double)a3
{
  self->_axMakeupEyesCategoryConfidence = a3;
}

- (int64_t)axMakeupLipsCategory
{
  return self->_axMakeupLipsCategory;
}

- (double)axMakeupLipsCategoryConfidence
{
  return self->_axMakeupLipsCategoryConfidence;
}

- (void)setAxMakeupLipsCategoryConfidence:(double)a3
{
  self->_axMakeupLipsCategoryConfidence = a3;
}

- (int64_t)axFacemaskCategory
{
  return self->_axFacemaskCategory;
}

- (double)axFacemaskCategoryConfidence
{
  return self->_axFacemaskCategoryConfidence;
}

- (void)setAxFacemaskCategoryConfidence:(double)a3
{
  self->_axFacemaskCategoryConfidence = a3;
}

- (int64_t)axEthnicityCategory
{
  return self->_axEthnicityCategory;
}

- (double)axEthnicityCategoryConfidence
{
  return self->_axEthnicityCategoryConfidence;
}

- (void)setAxEthnicityCategoryConfidence:(double)a3
{
  self->_axEthnicityCategoryConfidence = a3;
}

- (int64_t)axExpressionCategory
{
  return self->_axExpressionCategory;
}

- (double)axExpressionCategoryConfidence
{
  return self->_axExpressionCategoryConfidence;
}

- (void)setAxExpressionCategoryConfidence:(double)a3
{
  self->_axExpressionCategoryConfidence = a3;
}

- (int64_t)axFaceHairV2Category
{
  return self->_axFaceHairV2Category;
}

- (double)axFaceHairV2CategoryConfidence
{
  return self->_axFaceHairV2CategoryConfidence;
}

- (void)setAxFaceHairV2CategoryConfidence:(double)a3
{
  self->_axFaceHairV2CategoryConfidence = a3;
}

- (int64_t)axHairTypeCategory
{
  return self->_axHairTypeCategory;
}

- (double)axHairTypeCategoryConfidence
{
  return self->_axHairTypeCategoryConfidence;
}

- (void)setAxHairTypeCategoryConfidence:(double)a3
{
  self->_axHairTypeCategoryConfidence = a3;
}

- (int64_t)axHeadgearCategory
{
  return self->_axHeadgearCategory;
}

- (double)axHeadgearCategoryConfidence
{
  return self->_axHeadgearCategoryConfidence;
}

- (void)setAxHeadgearCategoryConfidence:(double)a3
{
  self->_axHeadgearCategoryConfidence = a3;
}

- (int64_t)axPoseCategory
{
  return self->_axPoseCategory;
}

- (double)axPoseCategoryConfidence
{
  return self->_axPoseCategoryConfidence;
}

- (void)setAxPoseCategoryConfidence:(double)a3
{
  self->_axPoseCategoryConfidence = a3;
}

- (int64_t)axSkintoneCategory
{
  return self->_axSkintoneCategory;
}

- (double)axSkintoneCategoryConfidence
{
  return self->_axSkintoneCategoryConfidence;
}

- (void)setAxSkintoneCategoryConfidence:(double)a3
{
  self->_axSkintoneCategoryConfidence = a3;
}

- (int64_t)excludeOptions
{
  return self->_excludeOptions;
}

- (void)setExcludeOptions:(int64_t)a3
{
  self->_excludeOptions = a3;
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)_AXMAgeCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureAgeCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[AXMVisionFeatureFaceAttributes _AXMGenderCategoryForVisionCategoryIdentifier:].cold.1(v0);
}

- (void)_AXMGenderCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureGenderCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMEyesCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureEyesCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMHairColorCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureHairColorCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMGlassesCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureGlassesCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMMakeupEyesCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureMakeupEyesCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMMakeupLipsCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureMakeupLipsCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMFacemaskCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureFacemaskCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMEthnicityCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureEthnicityCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMExpressionCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureExpressionCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMFaceHairV2CategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureFaceHairV2Category", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMHairtypeCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureHairtypeCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMHeadgearCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureHeadgearCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMPoseCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeaturePoseCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_AXMSkintoneCategoryForVisionCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Unhandled mapping for AXMVisionFeatureSkintoneCategory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
