@implementation ADPearlColorInfieldCalibrationFlow

- (ADPearlColorInfieldCalibrationFlow)initWithExecutor:(id)a3 andIntersessionData:(id)a4
{
  id v7;
  id v8;
  ADPearlColorInfieldCalibrationFlow *v9;
  uint64_t v10;
  NSString *transformKey;
  uint64_t v12;
  ADPearlColorInFieldCalibrationResult *lastExecutionResult;
  uint64_t v14;
  ADStreamSync *streamSync;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ADPearlColorInfieldCalibrationFlow;
  v9 = -[ADPearlColorInfieldCalibrationFlow init](&v17, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", "inputIrToDepthTransform", 4);
    v10 = objc_claimAutoreleasedReturnValue();
    transformKey = v9->_transformKey;
    v9->_transformKey = (NSString *)v10;

    objc_storeStrong((id *)&v9->_intersessionData, a4);
    objc_storeStrong((id *)&v9->_executor, a3);
    v12 = objc_opt_new();
    lastExecutionResult = v9->_lastExecutionResult;
    v9->_lastExecutionResult = (ADPearlColorInFieldCalibrationResult *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE06020]), "initWithStreamCount:allowedMatchTimeInterval:", 2, 0.00999999978);
    streamSync = v9->_streamSync;
    v9->_streamSync = (ADStreamSync *)v14;

    -[ADStreamSync setStream:queueSize:](v9->_streamSync, "setStream:queueSize:", 0, 10);
    -[ADStreamSync setStream:queueSize:aggregationCount:allowedAggregationInterval:](v9->_streamSync, "setStream:queueSize:aggregationCount:allowedAggregationInterval:", 1, 10, 1, 0.0);
  }

  return v9;
}

- (void)pushPearlDepth:(double)a3 pose:(double)a4 depthCalibration:(double)a5 irToDepthTransform:(__n128)a6 timestamp:(__n128)a7
{
  id v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v19 = a12;
  v20 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a6.n128_f64[0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v21);

  HIDWORD(v22) = a6.n128_u32[1];
  LODWORD(v22) = a6.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v23);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a6.n128_u32[1], a6.n128_u32[2])));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v24);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a6.n128_u32[1], a6.n128_u32[3])));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v25);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a7.n128_f64[0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v26);

  HIDWORD(v27) = a7.n128_u32[1];
  LODWORD(v27) = a7.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v28);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a7.n128_u32[1], a7.n128_u32[2])));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v29);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a7.n128_u32[1], a7.n128_u32[3])));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v30);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a8.n128_f64[0]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v31);

  HIDWORD(v32) = a8.n128_u32[1];
  LODWORD(v32) = a8.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v33);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a8.n128_u32[1], a8.n128_u32[2])));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v34);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a8.n128_u32[1], a8.n128_u32[3])));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v35);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a9.n128_f64[0]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v36);

  HIDWORD(v37) = a9.n128_u32[1];
  LODWORD(v37) = a9.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v38);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a9.n128_u32[1], a9.n128_u32[2])));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v39);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a9.n128_u32[1], a9.n128_u32[3])));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v40);

  v51 = *(_QWORD *)(a1 + 32);
  v52[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 16), "pushData:streamIndex:timestamp:pose:calibration:meta:", a11, 1, v19, v41, a13, a2, a3, a4, a5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
    objc_msgSend((id)a1, "handleMatch:", v42);

}

- (void)pushColor:(double)a3 pose:(double)a4 calibration:(double)a5 metadata:(double)a6 timestamp:(uint64_t)a7
{
  id v10;

  objc_msgSend(a1[2], "pushData:streamIndex:timestamp:pose:calibration:", a8, 0, a9, a6, a2, a3, a4, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(a1, "handleMatch:", v10);

}

- (void)handleMatch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  int64_t v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  int64_t v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  void *v63;
  unsigned int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;

  v69 = a3;
  -[ADPearlColorInFieldCalibrationResult setExecuted:](self->_lastExecutionResult, "setExecuted:", 0);
  objc_msgSend(v69, "matchedObjectsForStream:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "matchedObjectsForStream:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = v7;
  objc_msgSend(v5, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "calibration");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "calibration");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadata");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "objectForKeyedSubscript:", self->_transformKey);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v64 = v12;

  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v62 = v14;

  objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");

  objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");

  objc_msgSend(v10, "objectAtIndexedSubscript:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v61 = v18;

  objc_msgSend(v10, "objectAtIndexedSubscript:", 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v60 = v20;

  objc_msgSend(v10, "objectAtIndexedSubscript:", 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");

  objc_msgSend(v10, "objectAtIndexedSubscript:", 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");

  objc_msgSend(v10, "objectAtIndexedSubscript:", 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v59 = v24;

  objc_msgSend(v10, "objectAtIndexedSubscript:", 9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v58 = v26;

  objc_msgSend(v10, "objectAtIndexedSubscript:", 10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");

  objc_msgSend(v10, "objectAtIndexedSubscript:", 11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");

  objc_msgSend(v10, "objectAtIndexedSubscript:", 12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  v57 = v30;

  objc_msgSend(v10, "objectAtIndexedSubscript:", 13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "floatValue");
  v56 = v32;

  objc_msgSend(v10, "objectAtIndexedSubscript:", 14);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "floatValue");

  objc_msgSend(v10, "objectAtIndexedSubscript:", 15);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "floatValue");

  objc_msgSend(v68, "pose");
  v54 = v36;
  v55 = v35;
  v52 = v38;
  v53 = v37;
  objc_msgSend(v5, "timestamp");
  v40 = v39;
  v41 = -[ADPearlColorInFieldCalibrationExecutor preprocessInputColorFrame:pearlDepth:pearlPoses:pceCameraCalibration:pearlCameraCalibrationTransform:colorCameraCalibration:timestamp:](self->_executor, "preprocessInputColorFrame:pearlDepth:pearlPoses:pceCameraCalibration:pearlCameraCalibrationTransform:colorCameraCalibration:timestamp:", v8, v9, v66, v67, v55, v54, v53, v52, COERCE_DOUBLE(__PAIR64__(v62, v64)), COERCE_DOUBLE(__PAIR64__(v60, v61)), COERCE_DOUBLE(__PAIR64__(v58, v59)), COERCE_DOUBLE(__PAIR64__(v56, v57)), *(_QWORD *)&v39);
  v65 = (void *)objc_opt_new();
  v42 = (void *)objc_opt_new();
  objc_msgSend(v42, "setColor:", v8);
  objc_msgSend(v42, "setPearl:", v9);
  -[ADFlow delegate](self, "delegate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    -[ADFlow delegate](self, "delegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_opt_respondsToSelector();

  }
  else
  {
    v45 = 0;
  }

  -[ADFlow delegate](self, "delegate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    -[ADFlow delegate](self, "delegate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_opt_respondsToSelector();

    if (v41)
      goto LABEL_6;
  }
  else
  {
    v48 = 0;

    if (v41)
    {
LABEL_6:
      if ((v45 & 1) != 0)
      {
        -[ADFlow delegate](self, "delegate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timestamp");
        objc_msgSend(v49, "didFailOnFrame:input:message:error:", v42, CFSTR("failed preprocessing input stage"), v41);
LABEL_14:

        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  v50 = -[ADPearlColorInFieldCalibrationExecutor executePreprocessedInputsWithInterSessionData:outResult:](self->_executor, "executePreprocessedInputsWithInterSessionData:outResult:", self->_intersessionData, self->_lastExecutionResult);
  if (v50)
  {
    if ((v45 & 1) != 0)
    {
      -[ADFlow delegate](self, "delegate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      objc_msgSend(v49, "didFailOnFrame:input:message:error:", v42, CFSTR("failed execute preprocessed stage"), v50);
      goto LABEL_14;
    }
  }
  else if ((v48 & 1) != 0)
  {
    -[ADPearlColorInFieldCalibrationResult dictionaryRepresentation](self->_lastExecutionResult, "dictionaryRepresentation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setFiguresOfMerit:", v51);

    objc_msgSend(v65, "setDepth:", v9);
    -[ADFlow delegate](self, "delegate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "didProcessFrame:input:output:", v42, v65, v40);
    goto LABEL_14;
  }
LABEL_15:

}

- (ADPearlColorInFieldCalibrationExecutor)executor
{
  return self->_executor;
}

- (ADPearlColorInFieldCalibrationResult)lastExecutionResult
{
  return self->_lastExecutionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastExecutionResult, 0);
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_transformKey, 0);
  objc_storeStrong((id *)&self->_intersessionData, 0);
  objc_storeStrong((id *)&self->_streamSync, 0);
}

@end
