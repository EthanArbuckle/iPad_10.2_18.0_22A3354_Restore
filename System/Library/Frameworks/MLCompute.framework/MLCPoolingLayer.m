@implementation MLCPoolingLayer

+ (MLCPoolingLayer)layerWithDescriptor:(MLCPoolingDescriptor *)descriptor
{
  MLCPoolingDescriptor *v4;
  void *v5;

  v4 = descriptor;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDescriptor:", v4);

  return (MLCPoolingLayer *)v5;
}

- (MLCPoolingLayer)initWithDescriptor:(id)a3
{
  id v5;
  MLCPoolingLayer *v6;
  MLCPoolingLayer *v7;
  objc_super v9;
  objc_super v10;
  objc_super v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;
  objc_super v16;
  objc_super v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MLCPoolingLayer;
  v6 = -[MLCLayer initWithLabel:](&v18, sel_initWithLabel_, CFSTR("Pooling"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_descriptor, a3);
    v17.receiver = v7;
    v17.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setKernelWidth:](&v17, sel_setKernelWidth_, objc_msgSend(v5, "kernelWidth"));
    v16.receiver = v7;
    v16.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setKernelHeight:](&v16, sel_setKernelHeight_, objc_msgSend(v5, "kernelHeight"));
    v15.receiver = v7;
    v15.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setDilationRateInX:](&v15, sel_setDilationRateInX_, objc_msgSend(v5, "dilationRateInX"));
    v14.receiver = v7;
    v14.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setDilationRateInY:](&v14, sel_setDilationRateInY_, objc_msgSend(v5, "dilationRateInY"));
    v13.receiver = v7;
    v13.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setStrideInX:](&v13, sel_setStrideInX_, objc_msgSend(v5, "strideInX"));
    v12.receiver = v7;
    v12.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setStrideInY:](&v12, sel_setStrideInY_, objc_msgSend(v5, "strideInY"));
    v11.receiver = v7;
    v11.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setPaddingPolicy:](&v11, sel_setPaddingPolicy_, objc_msgSend(v5, "paddingPolicy"));
    v10.receiver = v7;
    v10.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setPaddingSizeInX:](&v10, sel_setPaddingSizeInX_, objc_msgSend(v5, "paddingSizeInX"));
    v9.receiver = v7;
    v9.super_class = (Class)MLCPoolingLayer;
    -[MLCLayer setPaddingSizeInY:](&v9, sel_setPaddingSizeInY_, objc_msgSend(v5, "paddingSizeInY"));
  }

  return v7;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  if (objc_msgSend(a4, "type"))
    return a3 == 1;
  else
    return ((a3 - 1) & 0xFFFFFFFD) == 0;
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
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  int v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  unint64_t v56;
  float v57;
  float v58;
  unint64_t v59;
  float v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  NSObject *v65;
  const char *v67;
  unint64_t v68;
  objc_super v69;
  _BYTE buf[32];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "dataType");

  if (!+[MLCPoolingLayer supportsDataType:onDevice:](MLCPoolingLayer, "supportsDataType:onDevice:", v14, v9))
  {
    +[MLCLog framework](MLCLog, "framework");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v14;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v9;
      _os_log_error_impl(&dword_1D4999000, v29, OS_LOG_TYPE_ERROR, "%@: pooling layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);

    }
    goto LABEL_28;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 == 4)
  {
    v67 = a2;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "descriptor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "shape");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v34, "unsignedIntegerValue");

    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "descriptor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "shape");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectAtIndexedSubscript:", 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "unsignedIntegerValue");

    objc_msgSend(v11, "descriptor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "shape");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectAtIndexedSubscript:", 3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v42, "unsignedIntegerValue");

    objc_msgSend(v11, "descriptor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "shape");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndexedSubscript:", 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v45, "unsignedIntegerValue");

    v27 = (float)v39;
  }
  else
  {
    if (v18 != 3)
    {
      +[MLCLog framework](MLCLog, "framework");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:].cold.1(a2, v29);
      goto LABEL_28;
    }
    v67 = a2;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "descriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "shape");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v22, "unsignedIntegerValue");

    objc_msgSend(v11, "descriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "shape");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "unsignedIntegerValue");

    v27 = 1.0;
    v28 = 1;
  }
  if (-[MLCLayer paddingPolicy](self, "paddingPolicy") == 2)
  {
    *(_QWORD *)buf = -[MLCLayer paddingSizeInX](self, "paddingSizeInX");
    *(_QWORD *)&buf[8] = -[MLCLayer paddingSizeInX](self, "paddingSizeInX");
    *(_QWORD *)&buf[16] = -[MLCLayer paddingSizeInY](self, "paddingSizeInY");
    v46 = -[MLCLayer paddingSizeInY](self, "paddingSizeInY");
  }
  else
  {
    -[MLCPoolingLayer descriptor](self, "descriptor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "poolingType");

    v49 = (float)(-[MLCLayer strideInX](self, "strideInX") * v26);
    v50 = (float)v68;
    if (v48 == 2)
    {
      v51 = v50 - (float)-[MLCLayer kernelWidth](self, "kernelWidth");
      v52 = v49 - (float)(v51 + (float)-[MLCLayer strideInX](self, "strideInX"));
      if (v52 < 0.0)
        v52 = 0.0;
      v53 = 0.5;
      *(_QWORD *)buf = (unint64_t)(float)(v52 * 0.5);
      *(_QWORD *)&buf[8] = (unint64_t)(float)(v52 - (float)*(unint64_t *)buf);
      v54 = (float)(-[MLCLayer strideInY](self, "strideInY") * v28);
      v55 = (float)-[MLCLayer kernelHeight](self, "kernelHeight");
    }
    else
    {
      v56 = -[MLCLayer dilationRateInX](self, "dilationRateInX");
      v57 = v50 - (float)((-[MLCLayer kernelWidth](self, "kernelWidth") - 1) * v56 + 1);
      v58 = v49 - (float)(v57 + (float)-[MLCLayer strideInX](self, "strideInX"));
      if (v58 < 0.0)
        v58 = 0.0;
      v53 = 0.5;
      *(_QWORD *)buf = (unint64_t)(float)(v58 * 0.5);
      *(_QWORD *)&buf[8] = (unint64_t)(float)(v58 - (float)*(unint64_t *)buf);
      v54 = (float)(-[MLCLayer strideInY](self, "strideInY") * v28);
      v59 = -[MLCLayer dilationRateInY](self, "dilationRateInY");
      v55 = (float)((-[MLCLayer kernelHeight](self, "kernelHeight") - 1) * v59 + 1);
    }
    v60 = v54 - (float)((float)(v27 - v55) + (float)-[MLCLayer strideInY](self, "strideInY"));
    if (v60 < 0.0)
      v60 = 0.0;
    *(_QWORD *)&buf[16] = (unint64_t)(float)(v60 * v53);
    v46 = (unint64_t)(float)(v60 - (float)*(unint64_t *)&buf[16]);
  }
  *(_QWORD *)&buf[24] = v46;
  objc_msgSend(v9, "computeEngine");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCPoolingLayer descriptor](self, "descriptor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "poolingLayerWithDescriptor:paddingSizes:", v62, buf);
  v29 = objc_claimAutoreleasedReturnValue();

  if (!v29 || !-[NSObject count](v29, "count"))
  {
    +[MLCLog framework](MLCLog, "framework");
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:].cold.2(v67, (uint64_t)v29, v65);

LABEL_28:
    v64 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v9, "computeEngine");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "compileLayerDeviceOps:sourceTensors:resultTensor:", v29, v10, v11);

  v69.receiver = self;
  v69.super_class = (Class)MLCPoolingLayer;
  -[MLCLayer bindDevice:deviceOps:](&v69, sel_bindDevice_deviceOps_, v9, v29);
LABEL_29:

  return v64;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCPoolingLayer descriptor](self, "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer conditionalTreeNode](self, "conditionalTreeNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCLayer resultTensors](self, "resultTensors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { poolingDescriptor=%@ : conditionalTreeNode=%@ : resultTensor=%@ }"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)summarizedDOTDescription
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  const __CFString *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  NSUInteger v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  -[MLCPoolingLayer descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "paddingPolicy");

  if (v4 >= 2)
  {
    if (v4 != 2)
    {
      v36 = 0;
      goto LABEL_7;
    }
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[MLCPoolingLayer descriptor](self, "descriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MLCPaddingPolicyDebugDescription((MLCPaddingPolicy)objc_msgSend(v5, "paddingPolicy"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLCPoolingLayer descriptor](self, "descriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "paddingSizeInX");
    -[MLCPoolingLayer descriptor](self, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (%lu, %lu)"), v7, v9, objc_msgSend(v10, "paddingSizeInY"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MLCPoolingLayer descriptor](self, "descriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MLCPaddingPolicyDebugDescription((MLCPaddingPolicy)objc_msgSend(v5, "paddingPolicy"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  v34 = (void *)MEMORY[0x1E0CB37A0];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[MLCLayer layerID](self, "layerID");
  -[MLCPoolingLayer descriptor](self, "descriptor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  MLCPoolingTypeDebugDescription((MLCPoolingType)objc_msgSend(v35, "poolingType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLCPoolingLayer descriptor](self, "descriptor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v33, "kernelWidth");
  -[MLCPoolingLayer descriptor](self, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "kernelHeight");
  -[MLCPoolingLayer descriptor](self, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "dilationRateInX");
  -[MLCPoolingLayer descriptor](self, "descriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "dilationRateInY");
  -[MLCPoolingLayer descriptor](self, "descriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "strideInX");
  -[MLCPoolingLayer descriptor](self, "descriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Pooling Type: %@     Kernel: (%lu, %lu)<BR />Dilation: (%lu, %lu)  Stride: (%lu, %lu)<BR />Padding: %@"), v32, v31, v30, v29, v13, v15, v17, v19, objc_msgSend(v20, "strideInY"), v36);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLCPoolingLayer descriptor](self, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v22, "poolingType");

  if ((_DWORD)v15 == 2)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    -[MLCPoolingLayer descriptor](self, "descriptor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countIncludesPadding");
    v26 = CFSTR("NO");
    if (v25)
      v26 = CFSTR("YES");
    objc_msgSend(v23, "stringWithFormat:", CFSTR("<BR />Count Includes Padding: %@"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendString:", v27);

  }
  objc_msgSend(v21, "appendString:", CFSTR("</FONT>>"));

  return v21;
}

- (MLCPoolingDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(NSObject *)a2 resultTensor:.cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%@: source tensor shape is not supported.  must be a tensor of shape 3 or higher", (uint8_t *)&v4, 0xCu);

}

- (void)compileForDevice:(const char *)a1 sourceTensors:(uint64_t)a2 resultTensor:(NSObject *)a3 .cold.2(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1D4999000, a3, OS_LOG_TYPE_ERROR, "%@: failure to create deviceOps=%@", (uint8_t *)&v6, 0x16u);

}

@end
