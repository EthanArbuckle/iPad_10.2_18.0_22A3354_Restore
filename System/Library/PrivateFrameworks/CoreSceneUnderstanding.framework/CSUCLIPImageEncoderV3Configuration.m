@implementation CSUCLIPImageEncoderV3Configuration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  if (a3 == -1)
    return 1;
  else
    return a3;
}

+ (id)CLIPImageEncoderV3ConfigurationForRevision:(int64_t)a3 error:(id *)a4
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
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v16, (uint64_t)CFSTR("SceneNet_v5.13.0_8wiqmpbbig_fe1.3_sc3.3_sa2.4_ae2.4_so2.4_od1.5_fp1.5_en0.2"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("scenenet_v5_model/SceneNet_v5.13.0_8wiqmpbbig_fe1.3_sc3.3_sa2.4_ae2.4_so2.4_od1.5_fp1.5_en0.2"));
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc((Class)a1);
    inited = (void *)objc_msgSend_initCLIPImageEncoderV3ConfigurationForRevision_espressoNetPath_inputImageTensorName_inputImageDimension_inputImageBytesPerRowAlignment_imageEmbeddingTensorName_(v19, v20, 1, (uint64_t)a4, (uint64_t)CFSTR("image"), 360, 4096, CFSTR("inner/sceneprint"));
  }
  else
  {
    if (a4)
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v16, a3, v17, v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v22, v24, (uint64_t)CFSTR("Unsupported CLIPImageEncoderV3 revision %@"), v25, v26, v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorForUnsupportedRevision_(CSUError, v28, (uint64_t)v27, v29, v30);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
    inited = 0;
  }

  return inited;
}

- (id)initCLIPImageEncoderV3ConfigurationForRevision:(int64_t)a3 espressoNetPath:(id)a4 inputImageTensorName:(id)a5 inputImageDimension:(unint64_t)a6 inputImageBytesPerRowAlignment:(unint64_t)a7 imageEmbeddingTensorName:(id)a8
{
  id v14;
  id v15;
  id v16;
  CSUCLIPImageEncoderV3Configuration *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CSUCLIPImageEncoderV3Configuration *v22;
  uint64_t v23;
  NSString *espressoNetworkPath;
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
  v55.super_class = (Class)CSUCLIPImageEncoderV3Configuration;
  v17 = -[CSUCLIPImageEncoderV3Configuration init](&v55, sel_init);
  v22 = v17;
  if (v17)
  {
    v17->_revision = a3;
    v23 = objc_msgSend_copy(v14, v18, v19, v20, v21);
    espressoNetworkPath = v22->_espressoNetworkPath;
    v22->_espressoNetworkPath = (NSString *)v23;

    v29 = objc_msgSend_copy(v15, v25, v26, v27, v28);
    inputImageTensorName = v22->_inputImageTensorName;
    v22->_inputImageTensorName = (NSString *)v29;

    v35 = objc_msgSend_copy(v16, v31, v32, v33, v34);
    imageEmbeddingTensorName = v22->_imageEmbeddingTensorName;
    v22->_imageEmbeddingTensorName = (NSString *)v35;

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
  void *v5;
  int v6;

  objc_msgSend_computeDevice(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sub_23A00ACE4(v5);

  return v6;
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

- (NSString)espressoNetworkPath
{
  return self->_espressoNetworkPath;
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
  objc_storeStrong((id *)&self->_espressoNetworkPath, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
  objc_storeStrong((id *)&self->_inputPixelBufferDescriptor, 0);
}

@end
