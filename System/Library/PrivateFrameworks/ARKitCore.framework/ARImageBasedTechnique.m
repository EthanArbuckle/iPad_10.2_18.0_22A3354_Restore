@implementation ARImageBasedTechnique

- (ARImageBasedTechnique)init
{
  ARImageBasedTechnique *v2;
  uint64_t v3;
  NSMutableArray *pendingResultData;
  uint64_t v5;
  NSMutableArray *pendingFrameReferences;
  uint64_t v7;
  NSMutableArray *pendingRequestContexts;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *pendingRequestsSemaphore;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ARImageBasedTechnique;
  v2 = -[ARTechnique init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    pendingResultData = v2->_pendingResultData;
    v2->_pendingResultData = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    pendingFrameReferences = v2->_pendingFrameReferences;
    v2->_pendingFrameReferences = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    pendingRequestContexts = v2->_pendingRequestContexts;
    v2->_pendingRequestContexts = (NSMutableArray *)v7;

    v9 = dispatch_semaphore_create(1);
    pendingRequestsSemaphore = v2->_pendingRequestsSemaphore;
    v2->_pendingRequestsSemaphore = (OS_dispatch_semaphore *)v9;

  }
  return v2;
}

- (id)processData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "timestamp");
    -[ARTechnique traceKey](self, "traceKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (ARTechnique_Image_to_Result_Timestamp_onceToken != -1)
      dispatch_once(&ARTechnique_Image_to_Result_Timestamp_onceToken, &__block_literal_global_13);
    objc_msgSend((id)ARTechnique_Image_to_Result_Timestamp_keyToCode, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intValue");

    kdebug_trace();
    -[ARTechnique traceKey](self, "traceKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (ARTechnique_Image_to_Result_Frame_onceToken != -1)
      dispatch_once(&ARTechnique_Image_to_Result_Frame_onceToken, &__block_literal_global_130);
    objc_msgSend((id)ARTechnique_Image_to_Result_Frame_keyToCode, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intValue");

    objc_msgSend(v5, "pixelBuffer");
    kdebug_trace();

  }
  return v4;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSMutableArray *pendingResultData;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  uint64_t v38;
  NSMutableArray *pendingRequestContexts;
  void *v40;
  int v41;
  void *v42;
  __int16 v43;
  ARImageBasedTechnique *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  NSMutableArray *v48;
  __int16 v49;
  NSMutableArray *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_pendingRequestsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v7 = -[NSMutableArray count](self->_pendingResultData, "count");
  if (!v7)
  {
LABEL_9:
    if ((unint64_t)-[NSMutableArray count](self->_pendingRequestContexts, "count") >= 2)
    {
      -[NSMutableArray firstObject](self->_pendingRequestContexts, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "imageData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timestamp");
      v21 = a3 - v20;
      -[ARTechnique requiredTimeInterval](self, "requiredTimeInterval");
      v23 = v22 + v22;

      if (v21 > v23)
      {
        _ARLogTechnique();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray firstObject](self->_pendingRequestContexts, "firstObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "imageData");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "timestamp");
          v41 = 138543874;
          v42 = v26;
          v43 = 2048;
          v44 = self;
          v45 = 2048;
          v46 = v29;
          _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping timed-out context: %f", (uint8_t *)&v41, 0x20u);

        }
        -[NSMutableArray removeObjectAtIndex:](self->_pendingRequestContexts, "removeObjectAtIndex:", 0);
      }
    }
    -[NSMutableArray addObject:](self->_pendingRequestContexts, "addObject:", v6);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingRequestsSemaphore);
    goto LABEL_15;
  }
  v8 = v7;
  if (v7 < 1)
  {
LABEL_6:
    _ARLogTechnique();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timestamp");
      pendingResultData = self->_pendingResultData;
      v41 = 138544386;
      v42 = v14;
      v43 = 2048;
      v44 = self;
      v45 = 2048;
      v46 = v17;
      v47 = 2048;
      v48 = (NSMutableArray *)v8;
      v49 = 2112;
      v50 = pendingResultData;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Enqueuing context (%f) even though %ld results (%@) are pending", (uint8_t *)&v41, 0x34u);

    }
    goto LABEL_9;
  }
  v9 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_pendingFrameReferences, "objectAtIndexedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ARImageBasedTechnique context:matchesFrameReference:](self, "context:matchesFrameReference:", v6, v10);

    if (v11)
      break;
    if (v8 == ++v9)
      goto LABEL_6;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_pendingResultData, "objectAtIndexedSubscript:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    _ARLogTechnique();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 138543874;
      v42 = v33;
      v43 = 2048;
      v44 = self;
      v45 = 2048;
      v46 = v9;
      _os_log_impl(&dword_1B3A68000, v31, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping %ld received result datas - newer data available", (uint8_t *)&v41, 0x20u);

    }
  }
  v34 = v9 + 1;
  -[NSMutableArray removeObjectsInRange:](self->_pendingFrameReferences, "removeObjectsInRange:", 0, v34);
  -[NSMutableArray removeObjectsInRange:](self->_pendingResultData, "removeObjectsInRange:", 0, v34);
  if (!v30)
    goto LABEL_9;
  if (objc_msgSend(v30, "count") && -[NSMutableArray count](self->_pendingRequestContexts, "count"))
  {
    _ARLogTechnique();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[NSMutableArray count](self->_pendingRequestContexts, "count");
      pendingRequestContexts = self->_pendingRequestContexts;
      v41 = 138544130;
      v42 = v37;
      v43 = 2048;
      v44 = self;
      v45 = 2048;
      v46 = v38;
      v47 = 2112;
      v48 = pendingRequestContexts;
      _os_log_impl(&dword_1B3A68000, v35, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping %ld skipped contexts (%@)", (uint8_t *)&v41, 0x2Au);

    }
    -[NSMutableArray removeAllObjects](self->_pendingRequestContexts, "removeAllObjects");
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingRequestsSemaphore);
  -[ARImageBasedTechnique prepareResultData:forContext:](self, "prepareResultData:forContext:", v30, v6);
  -[ARTechnique delegate](self, "delegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "technique:didOutputResultData:timestamp:context:", self, v30, v6, a3);

LABEL_15:
}

- (void)pushResultData:(id)a3 forFrameReference:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  NSMutableArray *pendingRequestContexts;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  NSMutableArray *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  NSMutableArray *pendingResultData;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  ARImageBasedTechnique *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  NSMutableArray *v34;
  __int16 v35;
  NSMutableArray *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_pendingRequestsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v8 = -[NSMutableArray count](self->_pendingRequestContexts, "count");
  if (!v8)
  {
LABEL_9:
    -[NSMutableArray addObject:](self->_pendingResultData, "addObject:", v6);
    -[NSMutableArray addObject:](self->_pendingFrameReferences, "addObject:", v7);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingRequestsSemaphore);
    goto LABEL_10;
  }
  v9 = v8;
  if (v8 < 1)
  {
LABEL_6:
    _ARLogTechnique();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      pendingRequestContexts = self->_pendingRequestContexts;
      v27 = 138544386;
      v28 = v14;
      v29 = 2048;
      v30 = self;
      v31 = 2112;
      v32 = (uint64_t)v6;
      v33 = 2048;
      v34 = (NSMutableArray *)v9;
      v35 = 2112;
      v36 = pendingRequestContexts;
      _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Enqueuing result data (%@) even though %ld contexts are pending (%@)", (uint8_t *)&v27, 0x34u);

    }
    goto LABEL_9;
  }
  v10 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_pendingRequestContexts, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ARImageBasedTechnique context:matchesFrameReference:](self, "context:matchesFrameReference:", v11, v7))
      break;

    if ((char *)v9 == ++v10)
      goto LABEL_6;
  }
  if (v10)
  {
    _ARLogTechnique();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = self->_pendingRequestContexts;
      v27 = 138544130;
      v28 = v18;
      v29 = 2048;
      v30 = self;
      v31 = 2048;
      v32 = (uint64_t)v10;
      v33 = 2112;
      v34 = v19;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Result data received, skipped %ld contexts (%@)", (uint8_t *)&v27, 0x2Au);

    }
  }
  -[NSMutableArray removeObjectsInRange:](self->_pendingRequestContexts, "removeObjectsInRange:", 0, v10 + 1);
  if (!v11)
    goto LABEL_9;
  if (-[NSMutableArray count](self->_pendingResultData, "count"))
  {
    _ARLogTechnique();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[NSMutableArray count](self->_pendingResultData, "count");
      pendingResultData = self->_pendingResultData;
      v27 = 138544130;
      v28 = v22;
      v29 = 2048;
      v30 = self;
      v31 = 2048;
      v32 = v23;
      v33 = 2112;
      v34 = pendingResultData;
      _os_log_impl(&dword_1B3A68000, v20, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Dropping %ld skipped result datas (%@)", (uint8_t *)&v27, 0x2Au);

    }
    -[NSMutableArray removeAllObjects](self->_pendingResultData, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_pendingFrameReferences, "removeAllObjects");
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingRequestsSemaphore);
  -[ARImageBasedTechnique prepareResultData:forContext:](self, "prepareResultData:forContext:", v6, v11);
  -[ARTechnique delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "timestamp");
  objc_msgSend(v25, "technique:didOutputResultData:timestamp:context:", self, v6, v11);

LABEL_10:
}

- (void)pushResultData:(id)a3 forFrame:(__CVBuffer *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[ARTechnique traceKey](self, "traceKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (ARTechnique_Image_to_Result_FrameEnd_onceToken != -1)
    dispatch_once(&ARTechnique_Image_to_Result_FrameEnd_onceToken, &__block_literal_global_171);
  objc_msgSend((id)ARTechnique_Image_to_Result_FrameEnd_keyToCode, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intValue");

  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ARImageBasedTechnique pushResultData:forFrameReference:](self, "pushResultData:forFrameReference:", v6, v9);

}

- (void)pushResultData:(id)a3 forTimestamp:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[ARTechnique traceKey](self, "traceKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (ARTechnique_Image_to_Result_TimestampEnd_onceToken != -1)
    dispatch_once(&ARTechnique_Image_to_Result_TimestampEnd_onceToken, &__block_literal_global_209);
  objc_msgSend((id)ARTechnique_Image_to_Result_TimestampEnd_keyToCode, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intValue");

  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ARImageBasedTechnique pushResultData:forFrameReference:](self, "pushResultData:forFrameReference:", v6, v9);

}

- (BOOL)context:(id)a3 matchesFrameReference:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  char v11;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "doubleValue");
    v8 = v7;
    objc_msgSend(v5, "imageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    v11 = v8 == v10;
  }
  else
  {
    if (!objc_msgSend(v6, "pointerValue"))
    {
      v11 = 1;
      goto LABEL_7;
    }
    objc_msgSend(v5, "imageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "matchesPixelBufferPointerRecursively:", objc_msgSend(v6, "pointerValue"));
  }

LABEL_7:
  return v11;
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v26.receiver = self;
  v26.super_class = (Class)ARImageBasedTechnique;
  -[ARTechnique _fullDescription](&v26, sel__fullDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSMutableArray count](self->_pendingResultData, "count"))
  {
    -[NSMutableArray description](self->_pendingResultData, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\tPendingResultData: %@\n"), v8);

  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\tPendingResultData: None\n"));
  }
  if (-[NSMutableArray count](self->_pendingFrameReferences, "count"))
  {
    -[NSMutableArray description](self->_pendingFrameReferences, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\tPendingFrameReferences: %@\n"), v11);

  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\tPendingFrameReferences: None\n"));
  }
  if (-[NSMutableArray count](self->_pendingRequestContexts, "count"))
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\tPendingRequestContexts:\n"));
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = self->_pendingRequestContexts;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 1;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(obj);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d: %@\n"), v14 + i, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "description");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t\t"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v19);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        v14 = (v14 + i);
      }
      while (v13);
    }

    return v5;
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("\tPendingRequestContexts: None\n"));
    return v5;
  }
}

- (int64_t)getDeviceOrientationFromImageData:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "deviceOrientation");
  if ((unint64_t)(v4 - 1) >= 4)
    -[ARImageBasedTechnique getDeviceOrientationFromImageData:].cold.1();
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestsSemaphore, 0);
  objc_storeStrong((id *)&self->_pendingRequestContexts, 0);
  objc_storeStrong((id *)&self->_pendingFrameReferences, 0);
  objc_storeStrong((id *)&self->_pendingResultData, 0);
}

- (void)getDeviceOrientationFromImageData:.cold.1()
{
  __assert_rtn("-[ARImageBasedTechnique getDeviceOrientationFromImageData:]", "ARImageBasedTechnique.m", 239, "UIDeviceOrientationIsValidInterfaceOrientation(deviceOrientation)");
}

@end
