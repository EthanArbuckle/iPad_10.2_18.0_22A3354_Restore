@implementation CSUDetectionPrintNetworkConfiguration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 != 1)
    v3 = a3;
  if (a3 == 2)
    v3 = 2;
  if (a3 == -1)
    return 2;
  else
    return v3;
}

+ (id)detectionPrintConfigurationForRevision:(int64_t)a3 error:(id *)a4
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
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CSUDetectionPrintShape *v22;
  const char *v23;
  void *v24;
  CSUDetectionPrintShape *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  CSUDetectionPrintShape *v30;
  const char *v31;
  CSUDetectionPrintShape *v32;
  const char *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = objc_opt_class();
  objc_msgSend_bundleForClass_(v7, v9, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend__resolvedRevision_(a1, v13, a3, v14, v15);
  v20 = v16;
  if (v16 == 1)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v17, (uint64_t)CFSTR("OD_TAP_POINTS"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("scenenet_v5_model/SceneNet_v5.11.1_47tazbjgzq_fe1.3_sc3.3_sa2.4_ae2.4_so2.4_od1.5_fp1.5_en0.1"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = [CSUDetectionPrintShape alloc];
    v24 = (void *)objc_msgSend_initWithHeight_width_channels_(v30, v31, 45, 45, 128);
    v32 = [CSUDetectionPrintShape alloc];
    v27 = (void *)objc_msgSend_initWithHeight_width_channels_(v32, v33, 23, 23, 168);
    v47[0] = CFSTR("6186");
    v47[1] = CFSTR("5507");
    v48[0] = v24;
    v48[1] = v27;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v34, (uint64_t)v48, (uint64_t)v47, 2);
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v16 == 2)
  {
    objc_msgSend_pathForResource_ofType_inDirectory_(v12, v17, (uint64_t)CFSTR("OD_TAP_POINTS"), (uint64_t)CFSTR("espresso.net"), (uint64_t)CFSTR("scenenet_v5_model/SceneNet_v5.13.0_8wiqmpbbig_fe1.3_sc3.3_sa2.4_ae2.4_so2.4_od1.5_fp1.5_en0.2"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = [CSUDetectionPrintShape alloc];
    v24 = (void *)objc_msgSend_initWithHeight_width_channels_(v22, v23, 45, 45, 128);
    v25 = [CSUDetectionPrintShape alloc];
    v27 = (void *)objc_msgSend_initWithHeight_width_channels_(v25, v26, 23, 23, 168);
    v49[0] = CFSTR("6316");
    v49[1] = CFSTR("5637");
    v50[0] = v24;
    v50[1] = v27;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v28, (uint64_t)v50, (uint64_t)v49, 2);
    v29 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v35 = (void *)v29;

    objc_msgSend_validateAndInitDetectionPrintForRevision_forNetworkPath_withInputImageTensorName_withInputImageWidth_withInputImageHeight_withInputImageBytesPerRow_withInputFeaturesDict_error_(a1, v36, v20, (uint64_t)v21, (uint64_t)CFSTR("image"), 360, 360, 4096, v35, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (a4)
  {
    v37 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v17, a3, v18, v19);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v37, v39, (uint64_t)CFSTR("Unsupported detection print revision %@"), v40, v41, v38);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v43, (uint64_t)v42, v44, v45);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_8:

  return a4;
}

+ (id)validateAndInitDetectionPrintForRevision:(int64_t)a3 forNetworkPath:(id)a4 withInputImageTensorName:(id)a5 withInputImageWidth:(unint64_t)a6 withInputImageHeight:(unint64_t)a7 withInputImageBytesPerRow:(unint64_t)a8 withInputFeaturesDict:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  const char *v23;
  void *v24;

  v16 = a4;
  v17 = a5;
  v21 = a9;
  if (v16)
  {
    v22 = objc_alloc((Class)a1);
    v24 = (void *)objc_msgSend_initWithConfigurationForRevision_espressoNetworkPath_inputImageTensorName_imageWidth_imageHeight_imageBytesPerRow_featuresDict_(v22, v23, a3, (uint64_t)v16, (uint64_t)v17, a6, a7, a8, v21);
  }
  else if (a10)
  {
    objc_msgSend_errorForDataUnavailableWithLocalizedDescription_(CSUError, v18, (uint64_t)CFSTR("Missing detection print network files"), v19, v20);
    v24 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)availableRevisions
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1698]);
  objc_msgSend_addIndex_(v2, v3, 2, v4, v5);
  return v2;
}

- (CSUDetectionPrintNetworkConfiguration)initWithConfigurationForRevision:(int64_t)a3 espressoNetworkPath:(id)a4 inputImageTensorName:(id)a5 imageWidth:(unint64_t)a6 imageHeight:(unint64_t)a7 imageBytesPerRow:(unint64_t)a8 featuresDict:(id)a9
{
  id v15;
  id v16;
  id v17;
  CSUDetectionPrintNetworkConfiguration *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CSUDetectionPrintNetworkConfiguration *v23;
  uint64_t v24;
  NSString *espressoNetworkPath;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString *inputImageTensorName;
  CSUPixelBufferDescriptor *v32;
  CSUPixelBufferDescriptor *inputPixelBufferDescriptor;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v50;

  v15 = a4;
  v16 = a5;
  v17 = a9;
  v50.receiver = self;
  v50.super_class = (Class)CSUDetectionPrintNetworkConfiguration;
  v18 = -[CSUDetectionPrintNetworkConfiguration init](&v50, sel_init);
  v23 = v18;
  if (v18)
  {
    v18->_revision = a3;
    v24 = objc_msgSend_copy(v15, v19, v20, v21, v22);
    espressoNetworkPath = v23->_espressoNetworkPath;
    v23->_espressoNetworkPath = (NSString *)v24;

    v30 = objc_msgSend_copy(v16, v26, v27, v28, v29);
    inputImageTensorName = v23->_inputImageTensorName;
    v23->_inputImageTensorName = (NSString *)v30;

    v32 = objc_alloc_init(CSUPixelBufferDescriptor);
    inputPixelBufferDescriptor = v23->_inputPixelBufferDescriptor;
    v23->_inputPixelBufferDescriptor = v32;

    objc_msgSend_setWidth_(v23->_inputPixelBufferDescriptor, v34, a6, v35, v36);
    objc_msgSend_setHeight_(v23->_inputPixelBufferDescriptor, v37, a7, v38, v39);
    objc_msgSend_setPixelFormat_(v23->_inputPixelBufferDescriptor, v40, 1111970369, v41, v42);
    objc_msgSend_setBytesPerRowAlignment_(v23->_inputPixelBufferDescriptor, v43, a8, v44, v45);
    objc_msgSend_setIsIOSurfaceBacked_(v23->_inputPixelBufferDescriptor, v46, 1, v47, v48);
    objc_storeStrong((id *)&v23->_outputTapPointFeatures, a9);
  }

  return v23;
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

- (NSDictionary)outputTapPointFeatures
{
  return self->_outputTapPointFeatures;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputImageTensorName, 0);
  objc_storeStrong((id *)&self->_espressoNetworkPath, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
  objc_storeStrong((id *)&self->_inputPixelBufferDescriptor, 0);
  objc_storeStrong((id *)&self->_outputTapPointFeatures, 0);
}

@end
