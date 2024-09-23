@implementation VCPVideoCNNBackbone

+ (id)sharedModel:(id)a3 outputNames:(id)a4 properties:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__VCPVideoCNNBackbone_sharedModel_outputNames_properties___block_invoke;
  v16[3] = &unk_1E6B17910;
  v11 = v7;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  objc_msgSend(v10, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPVideoCNNBackboneEspresso"), v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

VCPCNNModelEspresso *__58__VCPVideoCNNBackbone_sharedModel_outputNames_properties___block_invoke(_QWORD *a1)
{
  return -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", a1[4], 0, a1[5], a1[6]);
}

- (VCPVideoCNNBackbone)initWithConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  VCPVideoCNNBackbone *v8;
  VCPVideoCNNBackbone *v9;
  NSArray *outputNames;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  VCPCNNModelEspresso *v15;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v17;
  int v18;
  VCPVideoCNNBackbone *v19;
  VCPVideoCNNBackbone *v20;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_outputBeforeFc = 0;
  self->_outputBeforeFcSettling = 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("video_backbone.espresso.net"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)VCPVideoCNNBackbone;
  v8 = -[VCPVideoCNNBackbone init](&v22, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_7;
  outputNames = v8->_outputNames;
  v8->_outputNames = (NSArray *)&unk_1E6B763B0;

  v11 = DeviceGeqD5x();
  v23[0] = CFSTR("forceNNGraph");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11 ^ 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v12;
  v23[1] = CFSTR("sharedContext");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (DeviceHasANE())
  {
    objc_msgSend((id)objc_opt_class(), "sharedModel:outputNames:properties:", v7, v9->_outputNames, v14);
    v15 = (VCPCNNModelEspresso *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", v7, 0, v9->_outputNames, v14);
  }
  modelEspresso = v9->_modelEspresso;
  v9->_modelEspresso = v15;

  v17 = v9->_modelEspresso;
  if (!v17)
  {

    goto LABEL_9;
  }
  v18 = -[VCPCNNModelEspresso prepareModelWithConfig:](v17, "prepareModelWithConfig:", v4);

  if (v18)
  {
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
LABEL_7:
  v19 = v9;
LABEL_10:
  v20 = v19;

  return v20;
}

- (int)inference:(float *)a3 settling:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSData *v13;
  NSData *tensorBeforeTemporalPooling;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *__p;

  v4 = a4;
  v6 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", a3);
  if (!v6)
  {
    if (v4)
    {
      -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
      self->_outputBeforeFcSettling = (float *)__p[21];
      operator delete(__p);
    }
    else
    {
      -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
      self->_outputBeforeSpatiialPooling = (float *)*__p;
      operator delete(__p);
      -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
      self->_outputBeforeFc = (float *)__p[21];
      operator delete(__p);
      -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
      self->_outputRes4 = (float *)__p[42];
      operator delete(__p);
      -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
      self->_outputBeforeTemporalPooling = (float *)__p[63];
      operator delete(__p);
      -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
      v7 = __p[65];
      -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
      v8 = v18[66];
      -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
      v9 = v17[67];
      -[VCPCNNModelEspresso outputBlobs](self->_modelEspresso, "outputBlobs");
      v10 = v16[68];
      operator delete(v16);
      if (v17)
        operator delete(v17);
      v11 = v8 * v7;
      if (v18)
        operator delete(v18);
      v12 = v9 * v11;
      if (__p)
        operator delete(__p);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_outputBeforeTemporalPooling, 4 * v12 * v10);
      v13 = (NSData *)objc_claimAutoreleasedReturnValue();
      tensorBeforeTemporalPooling = self->_tensorBeforeTemporalPooling;
      self->_tensorBeforeTemporalPooling = v13;

    }
  }
  return v6;
}

- (float)outputBeforeFc
{
  return self->_outputBeforeFc;
}

- (float)outputBeforeFcSettling
{
  return self->_outputBeforeFcSettling;
}

- (float)outputBeforeSpatiialPooling
{
  return self->_outputBeforeSpatiialPooling;
}

- (float)outputRes4
{
  return self->_outputRes4;
}

- (float)outputBeforeTemporalPooling
{
  return self->_outputBeforeTemporalPooling;
}

- (NSData)tensorBeforeTemporalPooling
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tensorBeforeTemporalPooling, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end
