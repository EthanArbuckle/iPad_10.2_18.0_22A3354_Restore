@implementation MLCYOLOLossLayer

+ (MLCYOLOLossLayer)layerWithDescriptor:(MLCYOLOLossDescriptor *)lossDescriptor
{
  MLCYOLOLossDescriptor *v4;
  void *v5;

  v4 = lossDescriptor;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLossDescriptor:", v4);

  return (MLCYOLOLossLayer *)v5;
}

- (MLCYOLOLossLayer)initWithLossDescriptor:(id)a3
{
  id v5;
  void *v6;
  MLCYOLOLossLayer *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "spatialPositionLossDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)MLCYOLOLossLayer;
  v7 = -[MLCLossLayer initWithDescriptor:weights:](&v9, sel_initWithDescriptor_weights_, v6, 0);

  if (v7)
    objc_storeStrong((id *)&v7->_yoloLossDescriptor, a3);

  return v7;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  float v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  float v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  unint64_t v34;
  NSObject *v35;
  void *v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "dataType");

  if (!+[MLCLayer supportsDataType:onDevice:](MLCYOLOLossLayer, "supportsDataType:onDevice:", v14, v9))
  {
    +[MLCLog framework](MLCLog, "framework");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v40 = v37;
      v41 = 1024;
      v42 = v14;
      v43 = 2112;
      v44 = v9;
      _os_log_error_impl(&dword_1D4999000, v35, OS_LOG_TYPE_ERROR, "%@: YOLOLoss layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);

    }
    v29 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedIntegerValue");

  v20 = 1.0 / (float)v19;
  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scaleNoObjectConfidenceLoss");
  *(float *)&v23 = v20 * v22;
  objc_msgSend(v21, "setScaleNoObjectConfidenceLoss:", v23);

  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "scaleObjectConfidenceLoss");
  *(float *)&v26 = v20 * v25;
  objc_msgSend(v24, "setScaleObjectConfidenceLoss:", v26);

  objc_msgSend(v9, "computeEngine");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lossYOLOLayerWithDescriptor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29 || !objc_msgSend(v29, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(a2, (uint64_t)v29, v35);
LABEL_11:
    v31 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v9, "computeEngine");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "compileLayerDeviceOps:sourceTensors:resultTensor:", v29, v10, v11);

  v38.receiver = self;
  v38.super_class = (Class)MLCYOLOLossLayer;
  -[MLCLayer bindDevice:deviceOps:](&v38, sel_bindDevice_deviceOps_, v9, v29);
  objc_msgSend(v9, "engine");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "deviceList");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34 >= 2)
  {
    -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMultiDeviceReductionType:", -[NSObject reductionType](v35, "reductionType"));
LABEL_12:

  }
  return v31;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  unint64_t result;
  unint64_t v7;
  void *v8;
  int v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MLCYOLOLossLayer;
  result = -[MLCLossLayer resultSizeFromSourceSize:dimension:](&v10, sel_resultSizeFromSourceSize_dimension_, a3);
  v7 = result;
  if (a4 == 1)
  {
    -[MLCLossLayer descriptor](self, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "reductionType");

    if (v9)
      return 1;
    else
      return v7;
  }
  else if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    return 1;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { lossDescriptor=%@ : resultTensor=%@ }"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)summarizedDOTDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  float v14;
  double v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  float v26;
  void *v27;
  uint64_t v29;
  NSUInteger v30;
  void *v31;
  void *v32;

  v31 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[MLCLayer layerID](self, "layerID");
  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v32, "anchorBoxCount");
  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldRescore");
  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaleSpatialPositionLoss");
  v9 = v8;
  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scaleSpatialSizeLoss");
  v12 = v11;
  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scaleNoObjectConfidenceLoss");
  v15 = v14;
  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scaleObjectConfidenceLoss");
  v18 = v17;
  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scaleClassLoss");
  v21 = v20;
  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "minimumIOUForObjectPresence");
  v24 = v23;
  -[MLCYOLOLossLayer yoloLossDescriptor](self, "yoloLossDescriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "maximumIOUForObjectAbsence");
  objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Anchor Box Count: %lu    Should Rescore: %hhd<BR />Scale Spatial Position Loss: %.03f    Scale Spatial Size Loss: %.03f<BR />Scale No Object Confidence Loss: %.03f    Scale Object Confidence Loss: %.03f<BR />Scale Class Loss: %.03f    Minimum IOU For Object Presence: %.03f<BR />Maximum IOU For Object Absence: %.03f</FONT>>"), v4, v30, v29, v6, *(_QWORD *)&v9, *(_QWORD *)&v12, *(_QWORD *)&v15, *(_QWORD *)&v18, *(_QWORD *)&v21, *(_QWORD *)&v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (MLCYOLOLossDescriptor)yoloLossDescriptor
{
  return self->_yoloLossDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yoloLossDescriptor, 0);
}

@end
