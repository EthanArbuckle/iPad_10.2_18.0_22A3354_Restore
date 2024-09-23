@implementation VCPImageHumanActionAnalyzer

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
  v16[2] = __66__VCPImageHumanActionAnalyzer_sharedModel_outputNames_properties___block_invoke;
  v16[3] = &unk_1E6B17910;
  v11 = v7;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  objc_msgSend(v10, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPImageHumanActionEspresso"), v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

VCPCNNModelEspresso *__66__VCPImageHumanActionAnalyzer_sharedModel_outputNames_properties___block_invoke(_QWORD *a1)
{
  return -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", a1[4], 0, a1[5], a1[6]);
}

- (VCPImageHumanActionAnalyzer)initWithPHFaces:(id)a3 existingResults:(id)a4
{
  id v7;
  id v8;
  VCPImageHumanActionAnalyzer *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *results;
  uint64_t v15;
  VCPCNNModelEspresso *model;
  VCPCNNModelEspresso *v17;
  void *inputData;
  VCPImageHumanActionAnalyzer *v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)VCPImageHumanActionAnalyzer;
  v9 = -[VCPImageHumanActionAnalyzer init](&v21, sel_init);
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resourceURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_image_human_action.espresso.net"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_6;
  objc_storeStrong((id *)&v9->_phFaces, a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = objc_claimAutoreleasedReturnValue();
  results = v9->_results;
  v9->_results = (NSMutableArray *)v13;

  objc_msgSend((id)objc_opt_class(), "sharedModel:outputNames:properties:", v12, 0, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  model = v9->_model;
  v9->_model = (VCPCNNModelEspresso *)v15;

  v9->_inputData = (float *)operator new[](0xC0000uLL, MEMORY[0x1E0DE4E10]);
  objc_storeStrong((id *)&v9->_existingResults, a4);
  v17 = v9->_model;
  if (!v17)
  {
LABEL_5:
    inputData = 0;
    goto LABEL_7;
  }
  inputData = v9->_inputData;
  if (inputData)
  {
    if (-[VCPCNNModelEspresso prepareModelWithConfig:](v17, "prepareModelWithConfig:", &stru_1E6B1C190))
      goto LABEL_5;
LABEL_6:
    inputData = v9;
  }
LABEL_7:
  v19 = inputData;

  return v19;
}

- (void)dealloc
{
  float *inputData;
  objc_super v4;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  v4.receiver = self;
  v4.super_class = (Class)VCPImageHumanActionAnalyzer;
  -[VCPImageHumanActionAnalyzer dealloc](&v4, sel_dealloc);
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4
{
  int Width;
  int Height;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *BaseAddress;
  int BytesPerRow;
  double v28;
  int v29;
  float *v30;
  float *v31;
  uint64_t v32;
  uint64_t i;
  double v34;
  double v35;
  int v36;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369)
  {
LABEL_8:
    LODWORD(v10) = -50;
    return v10;
  }
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (!a3)
  {
    v17 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v17)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_8;
  }
  v8 = Height;
  v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  v36 = v9;
  if ((_DWORD)v9)
  {
    v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[VCPImageConverter convertImage:yuvFrame:].cold.3((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    bzero(a4, 3 * 4 * Width * v8);
    if (v8 >= 1)
    {
      v29 = 0;
      v30 = &a4[2 * v8 * Width];
      v31 = &a4[v8 * Width];
      v32 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (i = 0; i != Width; ++i)
          {
            LOBYTE(v28) = BaseAddress[(int)(i * 4) + 2];
            v34 = (double)*(unint64_t *)&v28 / 255.0;
            *(float *)&v34 = v34;
            a4[i] = *(float *)&v34;
            LOBYTE(v34) = BaseAddress[(int)(i * 4) + 1];
            v35 = (double)*(unint64_t *)&v34 / 255.0;
            *(float *)&v35 = v35;
            v31[i] = *(float *)&v35;
            LOBYTE(v35) = BaseAddress[(int)(i * 4)];
            v28 = (double)*(unint64_t *)&v35 / 255.0;
            *(float *)&v28 = v28;
            v30[i] = *(float *)&v28;
          }
        }
        BaseAddress += BytesPerRow;
        ++v29;
        v30 = (float *)((char *)v30 + v32);
        v31 = (float *)((char *)v31 + v32);
        a4 = (float *)((char *)a4 + v32);
      }
      while (v29 != v8);
    }
    LODWORD(v10) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v36);
    if (pixelBuffer
      && !v36
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
    }
  }
  return v10;
}

- (int)aggregateWith:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  NSMutableArray *results;
  void *v36;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  VCPImageHumanActionAnalyzer *v42;
  uint64_t v43;
  NSMutableArray *obj;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v42 = self;
  if (-[NSMutableArray count](self->_results, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = self->_results;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v55 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attributes"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("faceIdentifier"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attributes"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("humanActions"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
            v12 = v11 == 0;
          else
            v12 = 1;
          if (!v12)
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v7, v9);

        }
        v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      }
      while (v4);
    }

    -[NSMutableArray removeAllObjects](v42->_results, "removeAllObjects");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v39 = v38;
    v13 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    if (v13)
    {
      v41 = *(_QWORD *)v51;
      do
      {
        v43 = v13;
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v51 != v41)
            objc_enumerationMutation(v39);
          v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("attributes"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("faceIdentifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("attributes"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("humanActions"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            v20 = v19 == 0;
          else
            v20 = 1;
          if (v20)
          {
            objc_msgSend(v40, "addObject:", v15);
          }
          else
          {
            objc_msgSend(v45, "objectForKeyedSubscript:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21 == 0;

            if (!v22)
            {
              v23 = (void *)objc_msgSend(v15, "mutableCopy");
              v24 = (void *)objc_msgSend(v19, "mutableCopy");
              objc_msgSend(v45, "objectForKeyedSubscript:", v17);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("attributes"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("humanActions"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addEntriesFromDictionary:", v27);

              objc_msgSend(v45, "removeObjectForKey:", v17);
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("attributes"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = (void *)objc_msgSend(v28, "mutableCopy");
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, CFSTR("attributes"));

              objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("attributes"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v24, CFSTR("humanActions"));

              objc_msgSend(v40, "addObject:", v23);
              if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v60 = v17;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Image Action classifier - merged actions for face  %@", buf, 0xCu);
              }

            }
          }

        }
        v13 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      }
      while (v13);
    }

    -[NSMutableArray addObjectsFromArray:](v42->_results, "addObjectsFromArray:", v40);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v31 = v45;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v47;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v47 != v33)
            objc_enumerationMutation(v31);
          results = v42->_results;
          objc_msgSend(v31, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](results, "addObject:", v36);

        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v32);
    }

  }
  else
  {
    -[NSMutableArray addObjectsFromArray:](self->_results, "addObjectsFromArray:", v38);
  }

  return 0;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 crop:(CGRect)a7
{
  int v9;
  CFTypeRef cf;

  if (!a3)
    return -108;
  cf = 0;
  v9 = Scaler::ScaleCropped(&self->_scaler, a7, a4, (__CVBuffer **)&cf, *(uint64_t *)&a6, *(uint64_t *)&a5, 1111970369);
  if (!v9)
    v9 = -[VCPImageHumanActionAnalyzer copyImage:toData:](self, "copyImage:toData:", cf, a3);
  if (cf)
    CFRelease(cf);
  return v9;
}

- (CGRect)rectFromPHFace:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  float v40;
  float v41;
  float v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;
  CGRect result;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  objc_msgSend(v3, "bodyWidth");
  v9 = v8;
  objc_msgSend(v3, "bodyHeight");
  if (v9 * v10 < 0.00499999989 || (objc_msgSend(v3, "size"), v11 == 0.0))
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "localIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Image Action classifier - torso or face not detected %@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v3, "centerX");
    v14 = v13;
    objc_msgSend(v3, "size");
    v16 = v15;
    objc_msgSend(v3, "bodyCenterX");
    v18 = v17;
    objc_msgSend(v3, "bodyWidth");
    v20 = v19;
    objc_msgSend(v3, "centerX");
    v22 = v21;
    objc_msgSend(v3, "size");
    v24 = v23;
    objc_msgSend(v3, "bodyCenterX");
    v26 = v25;
    objc_msgSend(v3, "bodyWidth");
    v54 = v27;
    v50 = v26;
    v51 = v24;
    v52 = v22;
    v53 = v20;
    objc_msgSend(v3, "centerY");
    v49 = v28;
    objc_msgSend(v3, "size");
    v48 = v29;
    objc_msgSend(v3, "bodyCenterY");
    v31 = v30;
    objc_msgSend(v3, "bodyHeight");
    v33 = v32;
    objc_msgSend(v3, "centerY");
    v35 = v34;
    objc_msgSend(v3, "size");
    v37 = v36;
    objc_msgSend(v3, "bodyCenterY");
    v39 = v38;
    objc_msgSend(v3, "bodyHeight");
    v40 = fmax(fmin(v14 + v16 * -0.5, v18 + v53 * -1.5), 0.00999999978);
    v41 = fmin(fmax(v52 + v51 * 0.5, v50 + v54 * 1.5), 0.99000001);
    v42 = fmax(fmin(v49 + v48 * -0.5, v31 + v33 * -1.70000005), 0.00999999978);
    *(float *)&v43 = fmin(fmax(v35 + v37 * 0.5, v39 + v43 * 0.5), 0.99000001);
    v4 = v40;
    v5 = v42;
    v6 = (float)(v41 - v40);
    v7 = (float)(*(float *)&v43 - v42);
  }

  v44 = v4;
  v45 = v5;
  v46 = v6;
  v47 = v7;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  int Width;
  int Height;
  int v10;
  int v11;
  uint64_t v12;
  __int128 v13;
  CMTime *v14;
  uint64_t i;
  void *v16;
  double x;
  double y;
  double v19;
  double v20;
  void *v21;
  BOOL v22;
  VCPCNNModelEspresso *model;
  uint64_t v24;
  VCPCNNModelEspresso *v25;
  VCPCNNModelEspresso *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  int v31;
  float v32;
  double v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSMutableArray *results;
  void *v44;
  void *v45;
  void *v46;
  NSMutableArray *v47;
  __int128 v49;
  PHFetchResult *obj;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (**v55)(void);
  CMTime v56;
  CMTime v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  const __CFString *v63;
  NSMutableArray *v64;
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  uint8_t buf[8];
  __int16 v70;
  double v71;
  uint64_t v72;
  _BYTE v73[128];
  uint64_t v74;
  CGRect v75;
  NSRect v76;

  v74 = *MEMORY[0x1E0C80C00];
  v55 = (uint64_t (**)(void))a6;
  -[NSMutableArray removeAllObjects](self->_results, "removeAllObjects");
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (Height >= Width)
    v10 = Width;
  else
    v10 = Height;
  if (v10 >= 64)
  {
    if (v55 && (v55[2]() & 1) != 0)
    {
      v11 = -128;
    }
    else
    {
      if (-[PHFetchResult count](self->_phFaces, "count") && -[PHFetchResult count](self->_phFaces, "count") <= 2)
      {
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        obj = self->_phFaces;
        v12 = -[PHFetchResult countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
        if (v12)
        {
          v54 = *(_QWORD *)v60;
          *(_QWORD *)&v13 = 67109376;
          v49 = v13;
          v14 = (CMTime *)MEMORY[0x1E0CA2E68];
          while (2)
          {
            v53 = v12;
            for (i = 0; i != v53; ++i)
            {
              if (*(_QWORD *)v60 != v54)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
              if (!objc_msgSend(v16, "ageType", v49)
                || objc_msgSend(v16, "ageType") == 1
                || objc_msgSend(v16, "ageType") == 2)
              {
                -[VCPImageHumanActionAnalyzer rectFromPHFace:](self, "rectFromPHFace:", v16);
                x = v75.origin.x;
                y = v75.origin.y;
                v19 = v75.size.width;
                v20 = v75.size.height;
                if (!CGRectIsEmpty(v75))
                {
                  objc_msgSend(v16, "localIdentifier");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = v21 == 0;

                  if (!v22)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v11 = -[VCPImageHumanActionAnalyzer createInput:withBuffer:cnnInputHeight:cnnInputWidth:crop:](self, "createInput:withBuffer:cnnInputHeight:cnnInputWidth:crop:", self->_inputData, a3, 256, 256, x, 1.0 - y - v20, v19, v20);
                    if (v11
                      || (v11 = -[VCPCNNModelEspresso espressoForward:](self->_model, "espressoForward:", self->_inputData)) != 0)
                    {

                      goto LABEL_55;
                    }
                    model = self->_model;
                    if (!model)
                      goto LABEL_56;
                    -[VCPCNNModelEspresso outputBlob](model, "outputBlob");
                    v24 = *(_QWORD *)buf;
                    if (!*(_QWORD *)buf)
                      goto LABEL_56;
                    v25 = self->_model;
                    if (v25)
                    {
                      -[VCPCNNModelEspresso outputBlob](v25, "outputBlob");
                      v26 = self->_model;
                      v27 = v72;
                      if (v26)
                      {
                        -[VCPCNNModelEspresso outputBlob](v26, "outputBlob");
                        v28 = v58;
                      }
                      else
                      {
                        v28 = 0;
                      }
                    }
                    else
                    {
                      v28 = 0;
                      v27 = 0;
                    }
                    if (v28 * v27 != 5)
                    {
LABEL_56:

                      v11 = -18;
                      goto LABEL_55;
                    }
                    v30 = 0;
                    v31 = 0;
                    v32 = 0.0;
                    do
                    {
                      if (*(float *)(v24 + 4 * v30) > v32)
                      {
                        v32 = *(float *)(v24 + 4 * v30);
                        v31 = v30;
                      }
                      ++v30;
                    }
                    while (v30 != 5);
                    if ((int)MediaAnalysisLogLevel() >= 7
                      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = v49;
                      *(_DWORD *)&buf[4] = v31;
                      v70 = 2048;
                      v71 = v32;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Image Action classifier - action class %d with confidence %f", buf, 0x12u);
                    }
                    if (v32 > 0.2 && v31 != 4)
                    {
                      *(float *)&v33 = v32;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v31 + 10000));
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "stringValue");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v52, "setObject:forKeyedSubscript:", v35, v37);

                      v38 = (void *)MEMORY[0x1E0C99E08];
                      v67[0] = CFSTR("faceIdentifier");
                      objc_msgSend(v16, "localIdentifier");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      v68[0] = v39;
                      v68[1] = v52;
                      v67[1] = CFSTR("humanActions");
                      v67[2] = CFSTR("humanBounds");
                      v76.origin.x = x;
                      v76.origin.y = y;
                      v76.size.width = v19;
                      v76.size.height = v20;
                      NSStringFromRect(v76);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      v68[2] = v40;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "dictionaryWithDictionary:", v41);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();

                      results = self->_results;
                      v65[0] = CFSTR("start");
                      v57 = *v14;
                      CMTimeToNSDictionary(&v57);
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      v66[0] = v44;
                      v65[1] = CFSTR("duration");
                      v56 = *v14;
                      CMTimeToNSDictionary(&v56);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      v65[2] = CFSTR("attributes");
                      v66[1] = v45;
                      v66[2] = v42;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSMutableArray addObject:](results, "addObject:", v46);

                    }
                  }
                }
              }
              else if ((int)MediaAnalysisLogLevel() >= 6)
              {
                v29 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B6C4A000, v29, OS_LOG_TYPE_INFO, "Image Action classifier - PHFace gated out by age attribute", buf, 2u);
                }
              }
            }
            v12 = -[PHFetchResult countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
      if (!-[NSArray count](self->_existingResults, "count")
        || (v11 = -[VCPImageHumanActionAnalyzer aggregateWith:](self, "aggregateWith:", self->_existingResults)) == 0)
      {
        v47 = self->_results;
        if (v47)
        {
          v63 = CFSTR("HumanActionClassificationResults");
          v64 = v47;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        v11 = 0;
      }
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_55:

  return v11;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_phFaces, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_existingResults, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_DWORD *)self + 24) = 0;
  return self;
}

@end
