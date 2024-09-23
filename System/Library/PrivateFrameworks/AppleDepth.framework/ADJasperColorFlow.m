@implementation ADJasperColorFlow

- (ADJasperColorFlow)initWithExecutor:(id)a3
{
  id v5;
  ADJasperColorFlow *v6;
  ADJasperColorFlow *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  ADStreamSync *streamSync;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ADJasperColorFlow;
  v6 = -[ADJasperColorFlow init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_executor, a3);
    -[ADJasperColorExecutor executorParameters](v7->_executor, "executorParameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pipelineParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aggregationParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE06020]), "initWithStreamCount:allowedMatchTimeInterval:", 2, 0.05);
    streamSync = v7->_streamSync;
    v7->_streamSync = (ADStreamSync *)v11;

    -[ADStreamSync setStream:queueSize:](v7->_streamSync, "setStream:queueSize:", 0, 1);
    -[ADStreamSync setStream:queueSize:aggregationCount:allowedAggregationInterval:](v7->_streamSync, "setStream:queueSize:aggregationCount:allowedAggregationInterval:", 1, 4, objc_msgSend(v10, "aggregationSize"), 0.07);

  }
  return v7;
}

- (void)pushColor:(double)a3 pose:(double)a4 calibration:(double)a5 metadata:(double)a6 timestamp:(uint64_t)a7
{
  id v10;

  objc_msgSend(a1[2], "pushData:streamIndex:timestamp:pose:calibration:", a8, 0, a9, a6, a2, a3, a4, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "processIfMatch:");

}

- (void)pushPointCloud:(double)a3 pose:(double)a4 calibration:(double)a5 timestamp:(double)a6
{
  id v10;

  objc_msgSend(a1[2], "pushData:streamIndex:timestamp:pose:calibration:", a8, 1, a9, a6, a2, a3, a4, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "processIfMatch:");

}

- (void)processIfMatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 *v7;
  void *v8;
  unsigned int i;
  uint64_t v10;
  void *v11;
  __int128 *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  ADJasperColorExecutor *executor;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 *v41;
  id v42;
  id v43;
  CVPixelBufferRef v44;
  CVPixelBufferRef v45[2];

  v45[1] = *(CVPixelBufferRef *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v42 = (id)objc_opt_new();
    objc_msgSend(v4, "matchedObjectsForStream:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v43 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "matchedObjectsForStream:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = &v37;
    v7 = &v37 - 4 * objc_msgSend(v6, "count");
    v8 = (void *)objc_opt_new();
    for (i = 0; ; i = v10 + 1)
    {
      v10 = i;
      if (objc_msgSend(v6, "count") <= (unint64_t)i)
        break;
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pose");
      v12 = &v7[4 * v10];
      *v12 = v13;
      v12[1] = v14;
      v12[2] = v15;
      v12[3] = v16;

      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v18);

    }
    v19 = v42;
    objc_msgSend(v43, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setColor:", v20);

    objc_msgSend(v19, "setPointClouds:", v8);
    v44 = 0;
    v45[0] = 0;
    executor = self->_executor;
    v22 = objc_msgSend(v19, "color");
    objc_msgSend(v43, "calibration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "pose");
    v39 = v25;
    v40 = v24;
    v37 = v27;
    v38 = v26;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "calibration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[ADJasperColorExecutor executeWithColor:colorCameraCalibration:colorWorldToPlatformTransform:pointClouds:lidarCameraCalibration:pointCloudWorldToPlatformTransforms:outDepthMap:outConfMap:outNormalsMap:](executor, "executeWithColor:colorCameraCalibration:colorWorldToPlatformTransform:pointClouds:lidarCameraCalibration:pointCloudWorldToPlatformTransforms:outDepthMap:outConfMap:outNormalsMap:", v22, v23, v8, v29, v7, v45, *(double *)&v40, *(double *)&v39, *(double *)&v38, *(double *)&v37, &v44, 0);

    if (v30)
    {
      -[ADFlow delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31 == 0;

      if (v32)
      {
LABEL_12:

        goto LABEL_13;
      }
      -[ADFlow delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "timestamp");
      objc_msgSend(v33, "didFailOnFrame:input:message:error:", v42, CFSTR("failed executing point cloud"), v30);
    }
    else
    {
      v33 = (void *)objc_opt_new();
      objc_msgSend(v33, "setDepth:", v45[0]);
      objc_msgSend(v33, "setConfidence:", v44);
      -[ADFlow delegate](self, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 == 0;

      if (!v35)
      {
        -[ADFlow delegate](self, "delegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "timestamp");
        objc_msgSend(v36, "didProcessFrame:input:output:", v42, v33);

      }
      CVPixelBufferRelease(v45[0]);
      CVPixelBufferRelease(v44);
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (ADJasperColorExecutor)executor
{
  return self->_executor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_streamSync, 0);
}

@end
