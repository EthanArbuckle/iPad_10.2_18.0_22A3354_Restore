@implementation VCPCNNHandKeypointsDetectorEspresso

- (id)init:(BOOL)a3 sharedModel:(BOOL)a4 modelName:(id)a5 enableHandObject:(BOOL)a6 options:(id)a7
{
  _BOOL4 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  VCPCNNHandKeypointsDetectorEspresso *v27;
  void *v28;
  void *v29;
  void *v30;
  VCPCNNModelEspresso *v31;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v33;
  VCPCNNHandKeypointsDetectorEspresso *v34;
  VCPCNNModelEspresso *v35;
  VCPCNNModelEspresso *v36;
  uint64_t v37;
  VCPCNNModelEspresso *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  size_t v42;
  float *v43;
  VCPCNNHandKeypointsDetectorEspresso *v44;
  id v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;
  uint64_t v53;

  v8 = a6;
  v9 = a4;
  v10 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  v46 = a5;
  v12 = a7;
  v13 = &unk_1E6B761A0;
  if (!v8)
    v13 = 0;
  v14 = v13;
  self->_enableHandObject = v8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("forceCPU"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("forceCPU"));

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("planPriority"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("planPriority"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "intValue") == 1)
    {

LABEL_7:
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("planPriority"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "intValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v24, CFSTR("planPriority"));

      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v51 = v25;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPCNNHandKeypointsDetectorEspresso - espresso plan priority is set to %@", buf, 0xCu);

      }
      goto LABEL_13;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("planPriority"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "intValue");

    if (v21 == 0x2000)
      goto LABEL_7;
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("planPriority"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      LODWORD(v51) = objc_msgSend(v26, "intValue");
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPCNNHandKeypointsDetectorEspresso - invalid input espresso plan priority %d", buf, 8u);

    }
  }
LABEL_13:
  v49.receiver = self;
  v49.super_class = (Class)VCPCNNHandKeypointsDetectorEspresso;
  v27 = -[VCPCNNHandKeypointsDetectorEspresso init](&v49, sel_init);
  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "resourceURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v46, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", v30, 0, v14, v15);
    modelEspresso = v27->_modelEspresso;
    v27->_modelEspresso = v31;

    v33 = v27->_modelEspresso;
    if (!v33 || -[VCPCNNModelEspresso prepareModelWithConfig:](v33, "prepareModelWithConfig:", &stru_1E6B1C190))
    {
      v34 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v35 = v27->_modelEspresso;
    if (v35 && (-[VCPCNNModelEspresso inputBlob](v35, "inputBlob"), (v36 = v27->_modelEspresso) != 0))
    {
      v37 = v52;
      -[VCPCNNModelEspresso inputBlob](v36, "inputBlob");
      v38 = v27->_modelEspresso;
      v39 = v48 * v37;
      if (v38)
      {
        -[VCPCNNModelEspresso inputBlob](v38, "inputBlob");
        v40 = v47;
LABEL_24:
        v41 = v39 * v40;
        if (v41 >> 62)
          v42 = -1;
        else
          v42 = 4 * v41;
        v43 = (float *)operator new[](v42, MEMORY[0x1E0DE4E10]);
        v27->_inputData = v43;
        v27->_forceCPU = v10;
        if (v43)
          v34 = v27;
        else
          v34 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      v39 = 0;
    }
    v40 = 0;
    goto LABEL_24;
  }
  v34 = 0;
LABEL_31:
  v44 = v34;

  return v44;
}

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPCNNHandKeypointsDetectorEspresso;
  -[VCPCNNHandKeypointsDetectorEspresso dealloc](&v4, sel_dealloc);
}

- (float)getInputBuffer:(int)a3 srcWidth:(int)a4 cnnInputHeight:(int *)a5 cnnInputWidth:(int *)a6 offset:(float *)a7
{
  VCPCNNModelEspresso *modelEspresso;
  int v12;
  VCPCNNModelEspresso *v13;
  int v14;
  float v15;
  int v17;
  int v18;

  modelEspresso = self->_modelEspresso;
  if (modelEspresso)
  {
    -[VCPCNNModelEspresso inputBlob](modelEspresso, "inputBlob", *(_QWORD *)&a3, *(_QWORD *)&a4);
    v12 = v18;
  }
  else
  {
    v12 = 0;
  }
  *a5 = v12;
  v13 = self->_modelEspresso;
  if (v13)
  {
    -[VCPCNNModelEspresso inputBlob](v13, "inputBlob");
    v14 = v17;
  }
  else
  {
    v14 = 0;
  }
  *a6 = v14;
  v15 = 0.0;
  if (!self->_forceCPU)
    v15 = 2.0;
  *a7 = v15;
  return self->_inputData;
}

- (int)generateHandKeypoints:(CGPoint *)a3 keypointConfidence:(float *)a4 offset:(float)a5 handHoldsObjectConfidence:(float *)a6
{
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  int result;
  NSObject *v15;
  NSObject *v16;
  double v17;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  VCPCNNModelEspresso *v25;
  VCPCNNModelEspresso *v26;
  VCPCNNModelEspresso *v27;
  VCPCNNModelEspresso *v28;
  float v29;
  float v30;
  double v31;
  unsigned int v32;
  _OWORD buf[5];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  VCPSignPostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "inferenceHandKeypointCallFromSPI", ", (uint8_t *)buf, 2u);
  }

  result = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", self->_inputData);
  if (result)
    return result;
  VCPSignPostLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v11 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v15))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v16, OS_SIGNPOST_INTERVAL_END, v11, "inferenceHandKeypointCallFromSPI", ", (uint8_t *)buf, 2u);
  }

  modelEspresso = self->_modelEspresso;
  if (modelEspresso)
  {
    -[VCPCNNModelEspresso inputBlob](modelEspresso, "inputBlob");
    v19 = self->_modelEspresso;
    v32 = v36;
    if (v19)
    {
      -[VCPCNNModelEspresso inputBlob](v19, "inputBlob");
      v20 = v35;
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
    v32 = 0;
  }
  if (self->_enableHandObject)
  {
    -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
    v21 = *(_QWORD *)(*(_QWORD *)&buf[0] + 96);
    *((_QWORD *)&buf[0] + 1) = *(_QWORD *)&buf[0];
    operator delete(*(void **)&buf[0]);
    -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
    v22 = *(_QWORD *)(*(_QWORD *)&buf[0] + 88);
    *((_QWORD *)&buf[0] + 1) = *(_QWORD *)&buf[0];
    operator delete(*(void **)&buf[0]);
    -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
    v23 = *(_QWORD *)(*(_QWORD *)&buf[0] + 80);
    *((_QWORD *)&buf[0] + 1) = *(_QWORD *)&buf[0];
    operator delete(*(void **)&buf[0]);
    -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
    v24 = **(_QWORD **)&buf[0];
    *((_QWORD *)&buf[0] + 1) = *(_QWORD *)&buf[0];
    operator delete(*(void **)&buf[0]);
    goto LABEL_23;
  }
  v25 = self->_modelEspresso;
  if (!v25)
  {
    v21 = 0;
    goto LABEL_21;
  }
  -[VCPCNNModelEspresso outputBlob](v25, "outputBlob");
  v26 = self->_modelEspresso;
  v21 = v37;
  if (!v26)
  {
LABEL_21:
    v22 = 0;
    goto LABEL_22;
  }
  -[VCPCNNModelEspresso outputBlob](v26, "outputBlob");
  v22 = v36;
  v27 = self->_modelEspresso;
  if (!v27)
  {
LABEL_22:
    v24 = 0;
    v23 = 0;
    goto LABEL_23;
  }
  -[VCPCNNModelEspresso outputBlob](v27, "outputBlob");
  v28 = self->_modelEspresso;
  v23 = v35;
  if (v28)
  {
    -[VCPCNNModelEspresso outputBlob](v28, "outputBlob");
    v24 = *(_QWORD *)&buf[0];
  }
  else
  {
    v24 = 0;
  }
LABEL_23:
  *(float *)&v17 = a5;
  result = -[VCPCNNHandKeypointsDetector cvtHeatmaps2Keypoints:outHeight:outWidth:inHeight:inWidth:outChannel:keypoints:keypointConfidence:offset:](self, "cvtHeatmaps2Keypoints:outHeight:outWidth:inHeight:inWidth:outChannel:keypoints:keypointConfidence:offset:", v24, v22, v23, v32, v20, v21, v17, a3, a4);
  if (!result && a6 && self->_enableHandObject)
  {
    -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
    v29 = **(float **)(*(_QWORD *)&buf[0] + 168);
    *((_QWORD *)&buf[0] + 1) = *(_QWORD *)&buf[0];
    operator delete(*(void **)&buf[0]);
    v30 = expf(v29);
    *a6 = v30 / (float)(v30 + 1.0);
    if ((int)MediaAnalysisLogLevel() < 7)
      return 0;
    result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (result)
    {
      v31 = *a6;
      LODWORD(buf[0]) = 134217984;
      *(double *)((char *)buf + 4) = v31;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPCNNHandKeypointsDetectorEspresso - handHoldsObjectConfidence = %f", (uint8_t *)buf, 0xCu);
      return 0;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end
