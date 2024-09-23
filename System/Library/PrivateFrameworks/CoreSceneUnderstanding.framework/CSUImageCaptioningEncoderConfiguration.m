@implementation CSUImageCaptioningEncoderConfiguration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  int64_t v3;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = a3;
  if (a3 == -1)
    return 1;
  else
    return v3;
}

+ (id)CSUImageCaptioningEncoderConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  void *inited;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;

  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = objc_opt_class();
  objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__resolvedRevision_(a1, v13, a3, v14, v15) == 1)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v16, (uint64_t)CFSTR("ImageCaptioning-ax_v1.0.0_encoder"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("ImageCaptioning-ax_v1.0.0"));
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc((Class)a1);
    inited = (void *)objc_msgSend_initImageCaptioningEncoderConfigurationForRevision_espressoNetPath_inputImageTensorName_inputImageDimension_inputImageBytesPerRowAlignment_imageEmbeddingTensorName_(v19, v20, 1, (uint64_t)a4, (uint64_t)CFSTR("image/Placeholder:0"), 448, 4096, CFSTR("att_feats"));
  }
  else
  {
    if (a4)
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v16, a3, v17, v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v22, v24, (uint64_t)CFSTR("Unsupported captioning image encoder revision %@"), v25, v26, v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v28, (uint64_t)v27, v29, v30);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
    inited = 0;
  }

  return inited;
}

+ (id)createCSUImageCaptioningEncoderConfigurationWithConfigPath:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  char v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;

  v6 = a3;
  *a4 = 0;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_fileExistsAtPath_(v11, v12, (uint64_t)v6, v13, v14);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v16, (uint64_t)CFSTR("encoder config file does not exist at path %@"), v17, v18, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v20, v15, (uint64_t)a4, (uint64_t)v19);

  if ((v21 & 1) != 0)
  {
    objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v22, (uint64_t)v6, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v26, v25 != 0, (uint64_t)a4, (uint64_t)CFSTR("encoder config path could not be read!")) & 1) != 0)
    {
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v27, (uint64_t)v25, 0, (uint64_t)a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v29, *a4 == 0, (uint64_t)a4, (uint64_t)CFSTR("encoder config path could not be read!")))
      {
        objc_msgSend_valueForKey_(v28, v30, (uint64_t)CFSTR("encoderNetworkPath"), v31, v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          objc_msgSend_valueForKey_(v28, v33, (uint64_t)CFSTR("encoderNetworkParams"), v34, v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            objc_msgSend_stringByDeletingLastPathComponent(v6, v38, v39, v40, v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v28, v43, (uint64_t)CFSTR("encoderNetworkPath"), v44, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByAppendingPathComponent_(v42, v47, (uint64_t)v46, v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_objectForKeyedSubscript_(v28, v51, (uint64_t)CFSTR("encoderNetworkParams"), v52, v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_createCSUImageCaptioningEncoderConfigurationWithEspressoPath_andNetworkParams_error_(a1, v55, (uint64_t)v50, (uint64_t)v54, (uint64_t)a4);
            v56 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
            goto LABEL_11;
          }
        }
      }
    }
    else
    {
      v28 = 0;
    }
    v56 = 0;
    goto LABEL_10;
  }
  v56 = 0;
LABEL_11:

  return v56;
}

+ (id)createCSUImageCaptioningEncoderConfigurationWithEspressoPath:(id)a3 andNetworkParams:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *inited;
  unsigned int hasSuffix;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;

  v8 = a3;
  v9 = a4;
  *a5 = 0;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_fileExistsAtPath_(v14, v15, (uint64_t)v8, v16, v17);
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v19, (uint64_t)CFSTR("encoder network file does not exist %@"), v20, v21, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CSUAssert_log_(CSUError, v23, v18, (uint64_t)v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorFromErrors_And_(CSUError, v26, (uint64_t)v25, (uint64_t)*a5, v27);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  v28 = *a5;
  objc_msgSend_valueForKey_(v9, v29, (uint64_t)CFSTR("inputImageTensorName"), v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CSUAssert_log_(CSUError, v33, v32 != 0, (uint64_t)CFSTR("Name for input encoded features tensor for decoder not specified"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorFromErrors_And_(CSUError, v36, (uint64_t)v28, (uint64_t)v35, v37);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  v38 = *a5;
  objc_msgSend_valueForKey_(v9, v39, (uint64_t)CFSTR("inputImageDimension"), v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CSUAssert_log_(CSUError, v43, v42 != 0, (uint64_t)CFSTR("Name for input word IDs tensor for decoder not specified"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorFromErrors_And_(CSUError, v46, (uint64_t)v38, (uint64_t)v45, v47);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  v48 = *a5;
  objc_msgSend_valueForKey_(v9, v49, (uint64_t)CFSTR("imageEmbeddingTensorName"), v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CSUAssert_log_(CSUError, v53, v52 != 0, (uint64_t)CFSTR("Name for output words probability tensor for decoder not specified"), v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorFromErrors_And_(CSUError, v56, (uint64_t)v48, (uint64_t)v55, v57);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  if (*a5)
  {
    inited = 0;
  }
  else
  {
    hasSuffix = objc_msgSend_hasSuffix_(v8, v58, (uint64_t)CFSTR(".net"), v59, v60);
    v63 = objc_alloc((Class)a1);
    objc_msgSend_objectForKeyedSubscript_(v9, v64, (uint64_t)CFSTR("inputImageTensorName"), v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v9, v68, (uint64_t)CFSTR("inputImageDimension"), v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend_unsignedLongValue(v71, v72, v73, v74, v75);
    objc_msgSend_objectForKeyedSubscript_(v9, v77, (uint64_t)CFSTR("imageEmbeddingTensorName"), v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    inited = (void *)objc_msgSend_initImageCaptioningEncoderConfigurationForRevision_espressoNetPath_inputImageTensorName_inputImageDimension_inputImageBytesPerRowAlignment_imageEmbeddingTensorName_(v63, v81, hasSuffix, (uint64_t)v8, (uint64_t)v67, v76, 4096, v80);

  }
  return inited;
}

- (id)initImageCaptioningEncoderConfigurationForRevision:(int64_t)a3 espressoNetPath:(id)a4 inputImageTensorName:(id)a5 inputImageDimension:(unint64_t)a6 inputImageBytesPerRowAlignment:(unint64_t)a7 imageEmbeddingTensorName:(id)a8
{
  id v14;
  id v15;
  id v16;
  CSUImageCaptioningEncoderConfiguration *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CSUImageCaptioningEncoderConfiguration *v22;
  uint64_t v23;
  NSString *encoderNetworkPath;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSString *inputImageTensorName;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSString *imageEmbeddingTensorName;
  CSUPixelBufferDescriptor *v37;
  CSUPixelBufferDescriptor *inputPixelBufferDescriptor;
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
  objc_super v55;

  v14 = a4;
  v15 = a5;
  v16 = a8;
  v55.receiver = self;
  v55.super_class = (Class)CSUImageCaptioningEncoderConfiguration;
  v17 = -[CSUImageCaptioningEncoderConfiguration init](&v55, sel_init);
  v22 = v17;
  if (v17)
  {
    v17->_revision = a3;
    v23 = objc_msgSend_copy(v14, v18, v19, v20, v21);
    encoderNetworkPath = v22->_encoderNetworkPath;
    v22->_encoderNetworkPath = (NSString *)v23;

    v29 = objc_msgSend_copy(v15, v25, v26, v27, v28);
    inputImageTensorName = v22->_inputImageTensorName;
    v22->_inputImageTensorName = (NSString *)v29;

    v35 = objc_msgSend_copy(v16, v31, v32, v33, v34);
    imageEmbeddingTensorName = v22->_imageEmbeddingTensorName;
    v22->_imageEmbeddingTensorName = (NSString *)v35;

    v22->_espressoExecutionEngine = 0x7FFFFFFF;
    v37 = objc_alloc_init(CSUPixelBufferDescriptor);
    inputPixelBufferDescriptor = v22->_inputPixelBufferDescriptor;
    v22->_inputPixelBufferDescriptor = v37;

    objc_msgSend_setWidth_(v22->_inputPixelBufferDescriptor, v39, a6, v40, v41);
    objc_msgSend_setHeight_(v22->_inputPixelBufferDescriptor, v42, a6, v43, v44);
    objc_msgSend_setPixelFormat_(v22->_inputPixelBufferDescriptor, v45, 1111970369, v46, v47);
    objc_msgSend_setBytesPerRowAlignment_(v22->_inputPixelBufferDescriptor, v48, a7, v49, v50);
    objc_msgSend_setIsIOSurfaceBacked_(v22->_inputPixelBufferDescriptor, v51, 1, v52, v53);
  }

  return v22;
}

+ (id)availableRevisions
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

- (int)espressoExecutionEngine
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int result;
  void *v7;

  result = self->_espressoExecutionEngine;
  if (result == 0x7FFFFFFF)
  {
    objc_msgSend_computeDevice(self, a2, v2, v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_espressoExecutionEngine = sub_23A00ACE4(v7);

    return self->_espressoExecutionEngine;
  }
  return result;
}

- (void)setEspressoExecutionEngine:(int)a3
{
  self->_espressoExecutionEngine = a3;
}

- (CSUPixelBufferDescriptor)inputPixelBufferDescriptor
{
  return self->_inputPixelBufferDescriptor;
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (void)setComputeDevice:(id)a3
{
  objc_storeStrong((id *)&self->_computeDevice, a3);
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSString)encoderNetworkPath
{
  return self->_encoderNetworkPath;
}

- (NSString)inputImageTensorName
{
  return self->_inputImageTensorName;
}

- (NSString)imageEmbeddingTensorName
{
  return self->_imageEmbeddingTensorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageEmbeddingTensorName, 0);
  objc_storeStrong((id *)&self->_inputImageTensorName, 0);
  objc_storeStrong((id *)&self->_encoderNetworkPath, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
  objc_storeStrong((id *)&self->_inputPixelBufferDescriptor, 0);
}

@end
