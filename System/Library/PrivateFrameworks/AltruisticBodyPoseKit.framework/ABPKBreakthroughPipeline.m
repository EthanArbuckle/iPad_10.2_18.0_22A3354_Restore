@implementation ABPKBreakthroughPipeline

- (ABPKBreakthroughPipeline)init
{
  return -[ABPKBreakthroughPipeline initWithFrequency:](self, "initWithFrequency:", 30);
}

- (ABPKBreakthroughPipeline)initWithFrequency:(unsigned int)a3
{
  uint64_t v3;
  ABPKBreakthroughPipeline *v4;
  ABPKGestureDetectionPipeline *v5;
  ABPKGestureDetectionPipeline *gestureDetection;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)ABPKBreakthroughPipeline;
  v4 = -[ABPKBreakthroughPipeline init](&v8, sel_init);
  if (v4)
  {
    v5 = -[ABPKGestureDetectionPipeline initWithFrequency:]([ABPKGestureDetectionPipeline alloc], "initWithFrequency:", v3);
    gestureDetection = v4->_gestureDetection;
    v4->_gestureDetection = v5;

  }
  return v4;
}

- (int)runWithInput:(__CVBuffer *)a3 atTimeStamp:(double)a4 andOutput:(id)a5
{
  id v8;
  __int128 v9;
  NSObject *v10;
  int v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  char v17;
  char v18;
  char v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  id v34;
  ABPKBreakthroughResult *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v34 = a5;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[ABPKGestureDetectionPipeline runWithInput:abpkDeviceOrientation:atTimeStamp:andOutput:](self->_gestureDetection, "runWithInput:abpkDeviceOrientation:atTimeStamp:andOutput:", a3, 3, v8, a4))
  {
    __ABPKLogSharedInstance();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210836000, v10, OS_LOG_TYPE_ERROR, " Gesture detection failed ", buf, 2u);
    }

    v11 = 1;
  }
  else
  {
    v12 = 0;
    *(_QWORD *)&v9 = 138412290;
    v33 = v9;
    while (objc_msgSend(v8, "count", v33) > v12)
    {
      v35 = objc_alloc_init(ABPKBreakthroughResult);
      __ABPKLogSharedInstance();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "gestureTypes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v33;
        v37 = v15;
        _os_log_impl(&dword_210836000, v13, OS_LOG_TYPE_DEBUG, " Gestures detected: %@ ", buf, 0xCu);

      }
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      while (1)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "gestureTypes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count") > v16;

        if (!v22)
          break;
        objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "gestureTypes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", v16);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "integerValue");

        if (v26)
        {
          if (v26 == 1)
          {
            v18 = 1;
          }
          else if (v26 == 2)
          {
            v17 = 1;
          }
        }
        else
        {
          v19 = 1;
        }
        ++v16;
      }
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "skeleton2D");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isPoseValid");
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[ABPKBreakthroughResult set2dSkeleton:isPoseValid:trackingId:isFaceVisible:isRaisingHand:isWavingHand:](v35, "set2dSkeleton:isPoseValid:trackingId:isFaceVisible:isRaisingHand:isWavingHand:", v28, v30, objc_msgSend(v31, "trackingId"), v17 & 1, v18 & 1, v19 & 1);

      objc_msgSend(v34, "addObject:", v35);
      ++v12;
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)overlayResult:(id)a3 OnImage:(__CVBuffer *)a4 andGenerateOverlayImage:(__CVBuffer *)a5
{
  id v7;
  _OWORD *v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  NSObject *v12;
  void *v13;
  int v14;
  unsigned int v15;
  NSObject *v16;
  __int128 v17;
  __CVBuffer *v18;
  __int128 v20;
  uint8_t buf[4];
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = operator new(0xC0uLL);
  v9 = 0;
  *v8 = xmmword_210881570;
  v8[1] = xmmword_210881580;
  *(_QWORD *)&v10 = 255;
  *((_QWORD *)&v10 + 1) = 255;
  v8[2] = xmmword_210881590;
  v8[3] = v10;
  v8[4] = xmmword_2108815A0;
  v8[5] = xmmword_2108815B0;
  *(_QWORD *)&v11 = 0xFF000000FFLL;
  *((_QWORD *)&v11 + 1) = 0xFF000000FFLL;
  LOBYTE(v10) = 0;
  BYTE8(v10) = 0;
  v8[6] = v11;
  v8[7] = v10;
  v8[8] = xmmword_2108815C0;
  v8[9] = xmmword_2108815D0;
  v8[10] = xmmword_2108815E0;
  v8[11] = xmmword_2108815F0;
  v20 = 0x8000100uLL;
  while (v9 < objc_msgSend(v7, "count", v20))
  {
    __ABPKLogSharedInstance();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v20;
      v22 = v9;
      _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_DEBUG, " \x10Overlaying result for Person: %lu ", buf, 0xCu);
    }

    objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isFaceVisible"))
    {
      if ((objc_msgSend(v13, "isWavingHand") & 1) != 0)
        v14 = 1;
      else
        v14 = objc_msgSend(v13, "isRaisingHand");
    }
    else
    {
      v14 = 0;
    }
    v15 = objc_msgSend(v13, "trackingId");
    if (v14)
    {
      __ABPKLogSharedInstance();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v16, OS_LOG_TYPE_DEBUG, " Breakthrough detected ", buf, 2u);
      }

      *(_QWORD *)&v17 = 0xFF00000000;
    }
    else
    {
      v17 = v8[v15 % 0xC];
    }
    if (v9)
      v18 = a5;
    else
      v18 = a4;
    objc_msgSend(v13, "overlayResultOnImage:withResult:withColor:", v18, a5, *(double *)&v17);

    ++v9;
  }
  operator delete(v8);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureDetection, 0);
}

@end
