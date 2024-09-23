@implementation ADJasperColorInfieldCalibrationFlow

- (ADJasperColorInfieldCalibrationFlow)initWithExecutor:(id)a3 andIntersessionData:(id)a4
{
  id v7;
  id v8;
  ADJasperColorInfieldCalibrationFlow *v9;
  ADJasperColorInfieldCalibrationFlow *v10;
  uint64_t v11;
  ADJasperColorInFieldCalibrationResult *lastExecutionResult;
  uint64_t v13;
  ADStreamSync *streamSync;
  ADStreamSync *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ADJasperColorInfieldCalibrationFlow;
  v9 = -[ADJasperColorInfieldCalibrationFlow init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intersessionData, a4);
    objc_storeStrong((id *)&v10->_executor, a3);
    v11 = objc_opt_new();
    lastExecutionResult = v10->_lastExecutionResult;
    v10->_lastExecutionResult = (ADJasperColorInFieldCalibrationResult *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE06020]), "initWithStreamCount:allowedMatchTimeInterval:", 2, 0.0170000009);
    streamSync = v10->_streamSync;
    v10->_streamSync = (ADStreamSync *)v13;

    -[ADStreamSync setStream:queueSize:](v10->_streamSync, "setStream:queueSize:", 0, 10);
    v15 = v10->_streamSync;
    -[ADJasperColorInFieldCalibrationExecutor pipeline](v10->_executor, "pipeline");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pipelineParameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pcAggregationParameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADStreamSync setStream:queueSize:aggregationCount:allowedAggregationInterval:](v15, "setStream:queueSize:aggregationCount:allowedAggregationInterval:", 1, 10, objc_msgSend(v18, "aggregationSize"), 0.0549999997);

  }
  return v10;
}

- (void)pushPointCloud:(double)a3 pose:(double)a4 calibration:(double)a5 timestamp:(double)a6
{
  id v10;

  objc_msgSend(a1[2], "pushData:streamIndex:timestamp:pose:calibration:", a8, 1, a9, a6, a2, a3, a4, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(a1, "handleMatch:", v10);

}

- (void)handleMatch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int i;
  uint64_t v16;
  void *v17;
  _OWORD *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  ADJasperColorInFieldCalibrationExecutor *executor;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  int64_t v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;

  v51 = a3;
  -[ADJasperColorInFieldCalibrationResult setExecuted:](self->_lastExecutionResult, "setExecuted:", 0);
  objc_msgSend(v51, "matchedObjectsForStream:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v51, "matchedObjectsForStream:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "count");
  v7 = operator new[]();
  objc_msgSend(v5, "pose");
  v44 = v9;
  v46 = v8;
  v41 = v11;
  v42 = v10;
  objc_msgSend(v5, "calibration");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v5;

  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  for (i = 0; ; i = v16 + 1)
  {
    v16 = i;
    if (objc_msgSend(v6, "count") <= (unint64_t)i)
      break;
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pose");
    v18 = (_OWORD *)(v7 + ((unint64_t)i << 6));
    *v18 = v19;
    v18[1] = v20;
    v18[2] = v21;
    v18[3] = v22;

    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v24);

    objc_msgSend(v6, "objectAtIndexedSubscript:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "calibration");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v26);

  }
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v50, "timestamp");
    v28 = v27;
    executor = self->_executor;
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[ADJasperColorInFieldCalibrationExecutor preprocessInputColorFrame:colorPose:jasperPointClouds:jasperPoses:jasperCameraCalibration:colorCameraCalibration:timestamp:colorMetadata:](executor, "preprocessInputColorFrame:colorPose:jasperPointClouds:jasperPoses:jasperCameraCalibration:colorCameraCalibration:timestamp:colorMetadata:", v12, v13, v7, v30, v49, v48, v46, v44, v42, v41, v28);

    v43 = (void *)objc_opt_new();
    v47 = (void *)objc_opt_new();
    objc_msgSend(v47, "setColor:", v12);
    objc_msgSend(v47, "setPointClouds:", v13);
    -[ADFlow delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      -[ADFlow delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_opt_respondsToSelector();

    }
    else
    {
      v33 = 0;
    }

    -[ADFlow delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      -[ADFlow delegate](self, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_opt_respondsToSelector();

    }
    else
    {
      v36 = 0;
    }

    if (v45)
    {
      v37 = v47;
      if ((v33 & 1) != 0)
      {
        -[ADFlow delegate](self, "delegate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v47;
        objc_msgSend(v50, "timestamp");
        objc_msgSend(v38, "didFailOnFrame:input:message:error:", v47, CFSTR("failed preprocessing input stage"), v45);
LABEL_19:

      }
    }
    else
    {
      v39 = -[ADJasperColorInFieldCalibrationExecutor executePreprocessedInputsWithInterSessionData:outResult:](self->_executor, "executePreprocessedInputsWithInterSessionData:outResult:", self->_intersessionData, self->_lastExecutionResult);
      if (v39)
      {
        v37 = v47;
        if ((v33 & 1) != 0)
        {
          -[ADFlow delegate](self, "delegate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v47;
          objc_msgSend(v50, "timestamp");
          objc_msgSend(v38, "didFailOnFrame:input:message:error:", v47, CFSTR("failed execute preprocessed stage"), v39);
          goto LABEL_19;
        }
      }
      else
      {
        v37 = v47;
        if ((v36 & 1) != 0)
        {
          -[ADJasperColorInFieldCalibrationResult dictionaryRepresentation](self->_lastExecutionResult, "dictionaryRepresentation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setFiguresOfMerit:", v40);

          -[ADFlow delegate](self, "delegate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v47;
          objc_msgSend(v38, "didProcessFrame:input:output:", v47, v43, v28);
          goto LABEL_19;
        }
      }
    }

  }
  MEMORY[0x20BD36480](v7, 0x1000C80FA0F61DDLL);

}

- (void)pushColor:(double)a3 pose:(double)a4 calibration:(double)a5 metadata:(double)a6 timestamp:(uint64_t)a7
{
  id v11;

  objc_msgSend(a1[2], "pushData:streamIndex:timestamp:pose:calibration:meta:", a8, 0, a9, a10, a6, a2, a3, a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(a1, "handleMatch:", v11);

}

- (ADJasperColorInFieldCalibrationExecutor)executor
{
  return self->_executor;
}

- (ADJasperColorInFieldCalibrationResult)lastExecutionResult
{
  return self->_lastExecutionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastExecutionResult, 0);
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_intersessionData, 0);
  objc_storeStrong((id *)&self->_streamSync, 0);
}

@end
