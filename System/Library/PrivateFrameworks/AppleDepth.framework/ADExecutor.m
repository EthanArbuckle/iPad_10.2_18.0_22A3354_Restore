@implementation ADExecutor

- (ADExecutor)init
{
  char *v2;
  ADExecutor *v3;
  __int128 v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ADExecutor;
  v2 = -[ADExecutor init](&v8, sel_init);
  v3 = (ADExecutor *)v2;
  if (v2)
  {
    v4 = *MEMORY[0x24BDBF090];
    *(_OWORD *)(v2 + 24) = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    *(_OWORD *)(v2 + 8) = v4;
    *((_QWORD *)v2 + 5) = 255;
    *((_DWORD *)v2 + 12) = 1;
    v5 = objc_msgSend(MEMORY[0x24BE086D8], "hasANE");
    v6 = 2;
    if (v5)
      v6 = 4;
    v3->_engineType = v6;
  }
  return v3;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t framesCompleted;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  char v15;
  objc_super v16;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21;
  uint8_t buf[4];
  const __CFString *v23;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x24BDAC8D0];
  v24[0] = CFSTR("ExecutorName");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v4;
  v24[1] = CFSTR("FramesStarted");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_framesStarted);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v5;
  v24[2] = CFSTR("FramesCompleted");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_framesCompleted);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v6;
  v24[3] = CFSTR("AverageFrameTime");
  framesCompleted = self->_framesCompleted;
  if (framesCompleted)
    v8 = self->_totalFrameTime / (double)framesCompleted * 1000.0;
  else
    v8 = 0.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v9;
  v24[4] = CFSTR("Process");
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "processName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __21__ADExecutor_dealloc__block_invoke;
  v20 = &unk_24C421728;
  v13 = v12;
  v21 = v13;
  v14 = AnalyticsSendEventLazy();
  if (ADDebugUtilsADVerboseLogsEnabled)
    v15 = v14;
  else
    v15 = 1;
  if ((v15 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = CFSTR("com.apple.AppleDepth.ExecutorStatistics");
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed sending event %@ to CoreAnalytics", buf, 0xCu);
  }

  v16.receiver = self;
  v16.super_class = (Class)ADExecutor;
  -[ADExecutor dealloc](&v16, sel_dealloc);
}

- (void)frameExecutionStart
{
  NSDate *v3;
  NSDate *currFrameStartTime;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  currFrameStartTime = self->_currFrameStartTime;
  self->_currFrameStartTime = v3;

  ++self->_framesStarted;
}

- (void)frameExecutionEnd
{
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_currFrameStartTime);
  self->_totalFrameTime = v4 + self->_totalFrameTime;

  ++self->_framesCompleted;
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 descriptorForROI:(id)a5 exifOrientation:(unsigned int)a6 rotationPreference:(unint64_t)a7 inferenceDescriptor:(id)a8
{
  uint64_t v10;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v21;
  ADEspressoRunner *v22;
  ADEspressoRunner *v23;
  ADEspressoRunner *espressoRunner;
  ADEspressoRunner *v25;
  void *v26;
  void *v27;
  unint64_t engineType;
  void *v29;
  ADEspressoRunner *v30;
  ADEspressoRunner *v31;
  int v33;
  unint64_t v34;
  __int16 v35;
  CGFloat v36;
  __int16 v37;
  CGFloat v38;
  __int16 v39;
  CGFloat v40;
  __int16 v41;
  CGFloat v42;
  __int16 v43;
  int v44;
  __int16 v45;
  unint64_t v46;
  uint64_t v47;
  CGRect v48;

  v10 = *(_QWORD *)&a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v47 = *MEMORY[0x24BDAC8D0];
  v17 = a5;
  v18 = a8;
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v33 = 134219520;
      v34 = a3;
      v35 = 2048;
      v36 = x;
      v37 = 2048;
      v38 = y;
      v39 = 2048;
      v40 = width;
      v41 = 2048;
      v42 = height;
      v43 = 1024;
      v44 = v10;
      v45 = 2048;
      v46 = a7;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "preparing executor with engine %lu, roi: (%f,%f,%f,%f) orientation %d, rotation preference %lu", (uint8_t *)&v33, 0x44u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v33 = 134219520;
    v34 = a3;
    v35 = 2048;
    v36 = x;
    v37 = 2048;
    v38 = y;
    v39 = 2048;
    v40 = width;
    v41 = 2048;
    v42 = height;
    v43 = 1024;
    v44 = v10;
    v45 = 2048;
    v46 = a7;
    _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "preparing executor with engine %lu, roi: (%f,%f,%f,%f) orientation %d, rotation preference %lu", (uint8_t *)&v33, 0x44u);
  }
  self->_inputRoi.origin.x = x;
  self->_inputRoi.origin.y = y;
  self->_inputRoi.size.width = width;
  self->_inputRoi.size.height = height;
  self->_inputOrientation = v10;
  self->_rotationPreference = a7;
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  if (CGRectIsEmpty(v48))
  {
    v19 = 255;
    goto LABEL_12;
  }
  v20 = objc_msgSend(v17, "layoutForSize:", self->_inputRoi.size.width, self->_inputRoi.size.height);
  v19 = objc_msgSend(MEMORY[0x24BE05FF0], "adjustLayout:sourceOrientation:toRotationPreference:", v20, v10, a7);
  if (v19 != 254)
  {
LABEL_12:
    if (self->_layout != v19 || self->_engineType != a3 || (v22 = self->_espressoRunner) == 0)
    {
      self->_engineType = a3;
      self->_layout = v19;
      v23 = (ADEspressoRunner *)objc_alloc(MEMORY[0x24BE05FB0]);
      espressoRunner = self->_espressoRunner;
      self->_espressoRunner = v23;

      v25 = self->_espressoRunner;
      objc_msgSend(v18, "networkURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "absoluteString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      engineType = self->_engineType;
      objc_msgSend(v18, "configurationNameForLayout:", self->_layout);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[ADEspressoRunner initWithPath:forEngine:configurationName:](v25, "initWithPath:forEngine:configurationName:", v27, engineType, v29);
      v31 = self->_espressoRunner;
      self->_espressoRunner = v30;

      self->_rotationConstant = -[ADExecutor solveRotationPreference:](self, "solveRotationPreference:", self->_rotationPreference);
      v22 = self->_espressoRunner;
    }
    if (v22)
      v21 = 0;
    else
      v21 = -22960;
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v33) = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot prepare executor with unknown layout", (uint8_t *)&v33, 2u);
  }
  v21 = -22957;
LABEL_19:

  return v21;
}

- (int64_t)solveRotationPreference:(unint64_t)a3
{
  int v5;
  int v6;
  unsigned int v7;
  unsigned int inputOrientation;

  v5 = objc_msgSend(MEMORY[0x24BE05FF0], "isLandscapeSize:", self->_inputRoi.size.width, self->_inputRoi.size.height);
  v6 = v5 ^ objc_msgSend(MEMORY[0x24BE05FF0], "isLandscape:", self->_layout);
  if (self->_layout == 255)
    v6 = 0;
  if (a3 == 2)
  {
    if (v6)
      return 3;
    else
      return 0;
  }
  else
  {
    if (a3 != 1)
    {
      if (!a3)
      {
        v7 = self->_inputOrientation - 2;
        if (v7 < 7)
          return qword_20B6D3998[v7];
      }
      return 0;
    }
    inputOrientation = self->_inputOrientation;
    if (v6)
    {
      if (inputOrientation - 5 < 4)
        return qword_20B6D2C58[inputOrientation - 5];
      return 0;
    }
    return 2 * (inputOrientation - 3 < 2);
  }
}

- (NSString)networkVersionString
{
  return (NSString *)-[ADEspressoRunner networkVersionString](self->_espressoRunner, "networkVersionString");
}

- (int64_t)convertIntrinsicsFrom:(__CVBuffer *)a3 cropBy:(CGRect)a4 to:(__CVBuffer *)a5
{
  double y;
  double x;
  CFTypeRef Attachment;
  void *v10;
  CFTypeID v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  size_t Width;
  size_t Height;
  size_t v37;
  size_t v38;
  double v39;
  double v40;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint8_t buf[8];
  void *v52;
  const __CFString *v53;
  void *v54;
  _QWORD v55[2];
  const __CFString *v56;
  void *v57;
  _QWORD v58[2];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return -22953;
  y = a4.origin.y;
  x = a4.origin.x;
  Attachment = CVBufferGetAttachment(a3, CFSTR("Calibration Data"), 0);
  if (!Attachment)
    return -22953;
  v10 = (void *)Attachment;
  CFRetain(Attachment);
  v11 = CFGetTypeID(v10);
  if (v11 != CFDictionaryGetTypeID())
  {
    CFRelease(v10);
    return -22953;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Sensors"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Intrinsics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Sensors"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Intrinsics"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Pinhole"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Principal Point"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Data"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("Pinhole"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Focal Length"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Data"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = -22953;
    if (v21 && v24)
    {
      objc_msgSend(v24, "objectAtIndex:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v28 = v27;

      objc_msgSend(v21, "objectAtIndex:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      v31 = v30;
      objc_msgSend(v21, "objectAtIndex:", 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "doubleValue");
      v34 = v33;

      Width = CVPixelBufferGetWidth(a3);
      Height = CVPixelBufferGetHeight(a3);
      v37 = CVPixelBufferGetWidth(a5);
      v38 = CVPixelBufferGetHeight(a5);
      v39 = (double)Width;
      v40 = (double)v37;
      if ((double)Width / (double)Height == (double)v37 / (double)v38)
      {
        v42 = v31 - x;
        v43 = v40 / v39;
        v58[0] = CFSTR("Principal Point");
        v56 = CFSTR("Data");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v42 * (v40 / v39));
        v55[0] = objc_claimAutoreleasedReturnValue();
        v50 = (void *)v55[0];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (v34 - y) * v43);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = v49;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v48;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v58[1] = CFSTR("Focal Length");
        v59[0] = v47;
        v53 = CFSTR("Data");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v28 * v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v44;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v45;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = v46;
        CVBufferSetAttachment(a5, CFSTR("Calibration Data"), (CFTypeRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 2), kCVAttachmentMode_ShouldPropagate);

        v25 = 0;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot convert intrinsics when aspect ratios don't match", buf, 2u);
        }
        v25 = -22951;
      }
    }

  }
  else
  {
    v25 = -22953;
  }

  return v25;
}

- (id)getIntermediates
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)getIntermediateWithName:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = v4;
  -[ADExecutor getIntermediates](self, "getIntermediates");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      v19 = v6;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v4))
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v9, "allKeys");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v7;
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v23;
            while (2)
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v23 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
                if ((objc_msgSend(v16, "isEqualToString:", CFSTR("name")) & 1) == 0)
                {
                  objc_msgSend(v9, "objectForKeyedSubscript:", v16);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  v4 = v20;
                  v5 = v21;

                  goto LABEL_21;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v13)
                continue;
              break;
            }
          }

          v4 = v20;
          v5 = v21;
          v7 = v12;
          v6 = v19;
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v17 = 0;
    }
    while (v6);
  }
  else
  {
    v17 = 0;
  }
LABEL_21:

  return v17;
}

- (int64_t)numberOfExecutionSteps
{
  return 999;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currFrameStartTime, 0);
  objc_storeStrong((id *)&self->_espressoRunner, 0);
}

id __21__ADExecutor_dealloc__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
