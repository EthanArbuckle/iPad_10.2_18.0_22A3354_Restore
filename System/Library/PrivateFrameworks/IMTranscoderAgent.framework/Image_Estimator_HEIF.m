@implementation Image_Estimator_HEIF

+ (id)URLOfModelInThisBundle
{
  void *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = objc_opt_class();
  objc_msgSend_bundleForClass_(v2, v4, v3, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_(v9, v10, (uint64_t)CFSTR("Image_Estimator_HEIF"), (uint64_t)CFSTR("mlmodelc"), v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v15, (uint64_t)v14, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_21DFCF72C();
    v20 = 0;
  }

  return v20;
}

- (Image_Estimator_HEIF)initWithMLModel:(id)a3
{
  id v5;
  Image_Estimator_HEIF *v6;
  Image_Estimator_HEIF *v7;
  Image_Estimator_HEIF *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)Image_Estimator_HEIF;
    v6 = -[Image_Estimator_HEIF init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_model, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (Image_Estimator_HEIF)init
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Image_Estimator_HEIF *v15;

  v3 = (void *)objc_opt_class();
  objc_msgSend_URLOfModelInThisBundle(v3, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (Image_Estimator_HEIF *)objc_msgSend_initWithContentsOfURL_error_(self, v11, (uint64_t)v10, 0, v12, v13, v14);

  return v15;
}

- (Image_Estimator_HEIF)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  Image_Estimator_HEIF *v18;

  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend_URLOfModelInThisBundle(v7, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (Image_Estimator_HEIF *)objc_msgSend_initWithContentsOfURL_configuration_error_(self, v15, (uint64_t)v14, (uint64_t)v6, (uint64_t)a4, v16, v17);

  return v18;
}

- (Image_Estimator_HEIF)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  Image_Estimator_HEIF *v14;

  objc_msgSend_modelWithContentsOfURL_error_(MEMORY[0x24BDBFFC8], a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    self = (Image_Estimator_HEIF *)(id)objc_msgSend_initWithMLModel_(self, v8, (uint64_t)v13, v9, v10, v11, v12);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (Image_Estimator_HEIF)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  Image_Estimator_HEIF *v14;

  objc_msgSend_modelWithContentsOfURL_configuration_error_(MEMORY[0x24BDBFFC8], a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    self = (Image_Estimator_HEIF *)(id)objc_msgSend_initWithMLModel_(self, v8, (uint64_t)v13, v9, v10, v11, v12);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend_URLOfModelInThisBundle(a1, v8, v9, v10, v11, v12, v13);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadContentsOfURL_configuration_completionHandler_(a1, v14, (uint64_t)v17, (uint64_t)v7, (uint64_t)v6, v15, v16);

}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BDBFFC8];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_21DFCEB14;
  v13[3] = &unk_24E1FFD08;
  v14 = v7;
  v9 = v7;
  objc_msgSend_loadContentsOfURL_configuration_completionHandler_(v8, v10, (uint64_t)a3, (uint64_t)a4, (uint64_t)v13, v11, v12);

}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = (objc_class *)MEMORY[0x24BDC0018];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend_predictionFromFeatures_options_error_(self, v9, (uint64_t)v7, (uint64_t)v8, (uint64_t)a4, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  Image_Estimator_HEIFOutput *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;

  v8 = a4;
  v9 = a3;
  objc_msgSend_model(self, v10, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predictionFromFeatures_options_error_(v16, v17, (uint64_t)v9, (uint64_t)v8, (uint64_t)a5, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = [Image_Estimator_HEIFOutput alloc];
    objc_msgSend_featureValueForName_(v20, v22, (uint64_t)CFSTR("Target Quality Factor"), v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v27, v28, v29, v30, v31, v32, v33);
    v40 = (void *)objc_msgSend_initWithTarget_Quality_Factor_(v21, v34, v35, v36, v37, v38, v39);

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;

  v6 = a4;
  v7 = a3;
  objc_msgSend_model(self, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_21DFCED6C;
  v20[3] = &unk_24E1FFD30;
  v21 = v6;
  v15 = v6;
  objc_msgSend_predictionFromFeatures_completionHandler_(v14, v16, (uint64_t)v7, (uint64_t)v20, v17, v18, v19);

}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_model(self, v11, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_21DFCEEF4;
  v22[3] = &unk_24E1FFD30;
  v23 = v8;
  v18 = v8;
  objc_msgSend_predictionFromFeatures_options_completionHandler_(v17, v19, (uint64_t)v10, (uint64_t)v9, (uint64_t)v22, v20, v21);

}

- (id)predictionFromInput_File_Size:(double)a3 Input_Height:(double)a4 Input_Entropy:(double)a5 Aspect_Ratio:(double)a6 Target_File_Size:(double)a7 Target_Max_Dimension_4032:(int64_t)a8 Target_Max_Dimension_3000:(int64_t)a9 Target_Max_Dimension_2048:(int64_t)a10 Target_Max_Dimension_1600:(int64_t)a11 Target_Max_Dimension_1280:(int64_t)a12 Target_Max_Dimension_1024:(int64_t)a13 Target_Max_Dimension_800:(int64_t)a14 Compression_Ratio:(double)a15 Input_H_x_W__NumOfPixels_:(double)a16 Target_Height:(double)a17 Target_Width:(double)a18 Input_log_NumOfPixels_:(double)a19 Ratio_of_NumOfPixels:(double)a20 Exponential_Entropy:(double)a21 error:(id *)a22
{
  Image_Estimator_HEIFInput *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;

  v35 = [Image_Estimator_HEIFInput alloc];
  v37 = (void *)objc_msgSend_initWithInput_File_Size_Input_Height_Input_Entropy_Aspect_Ratio_Target_File_Size_Target_Max_Dimension_4032_Target_Max_Dimension_3000_Target_Max_Dimension_2048_Target_Max_Dimension_1600_Target_Max_Dimension_1280_Target_Max_Dimension_1024_Target_Max_Dimension_800_Compression_Ratio_Input_H_x_W__NumOfPixels__Target_Height_Target_Width_Input_log_NumOfPixels__Ratio_of_NumOfPixels_Exponential_Entropy_(v35, v36, a8, a9, a10, a11, a12, a13, a3, a4, a5, a6, a7, a15, a16, a17, a14, *(_QWORD *)&a18, *(_QWORD *)&a19,
                  *(_QWORD *)&a20,
                  *(_QWORD *)&a21);
  objc_msgSend_predictionFromFeatures_error_(self, v38, (uint64_t)v37, (uint64_t)a22, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  Image_Estimator_HEIFOutput *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc(MEMORY[0x24BDBFF60]);
  v16 = (void *)objc_msgSend_initWithFeatureProviderArray_(v10, v11, (uint64_t)v8, v12, v13, v14, v15);
  objc_msgSend_model(self, v17, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predictionsFromBatch_options_error_(v23, v24, (uint64_t)v16, (uint64_t)v9, (uint64_t)a5, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v34 = (void *)MEMORY[0x24BDBCEB8];
    v35 = objc_msgSend_count(v27, v28, v29, v30, v31, v32, v33);
    objc_msgSend_arrayWithCapacity_(v34, v36, v35, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v27, v42, v43, v44, v45, v46, v47) >= 1)
    {
      v53 = 0;
      do
      {
        objc_msgSend_featuresAtIndex_(v27, v48, v53, v49, v50, v51, v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = [Image_Estimator_HEIFOutput alloc];
        objc_msgSend_featureValueForName_(v54, v56, (uint64_t)CFSTR("Target Quality Factor"), v57, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v61, v62, v63, v64, v65, v66, v67);
        v74 = (void *)objc_msgSend_initWithTarget_Quality_Factor_(v55, v68, v69, v70, v71, v72, v73);

        objc_msgSend_addObject_(v41, v75, (uint64_t)v74, v76, v77, v78, v79);
        ++v53;
      }
      while (v53 < objc_msgSend_count(v27, v80, v81, v82, v83, v84, v85));
    }
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
