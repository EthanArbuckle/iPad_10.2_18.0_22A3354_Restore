@implementation VCPHumanPoseVideoRequest

- (VCPHumanPoseVideoRequest)init
{
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v4, 2u);
  }

  return 0;
}

- (VCPHumanPoseVideoRequest)initWithOptions:(id)a3
{
  id v4;
  VCPHumanPoseVideoRequest *v5;
  double v6;
  VCPHumanPoseVideoRequest *v7;
  int width;
  int height;
  void *v10;
  uint64_t v11;
  NSMutableArray *existingPersonsArray;
  VCPImageHumanPoseAnalyzer *v13;
  VCPImageHumanPoseAnalyzer *analyzer;
  VCPImageHumanPoseAnalyzer *v15;
  VCPHumanPoseVideoRequest *v16;
  VCPHumanPoseVideoRequest *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VCPHumanPoseVideoRequest;
  v5 = -[VCPRequest initWithOptions:](&v19, sel_initWithOptions_, v4);
  v7 = v5;
  if (v5)
  {
    width = v5->super._width;
    if (width < 1 || (height = v5->super._height, height < 1))
    {
      v10 = 0;
    }
    else
    {
      *(float *)&v6 = (float)width / (float)height;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    existingPersonsArray = v7->_existingPersonsArray;
    v7->_existingPersonsArray = (NSMutableArray *)v11;

    v13 = -[VCPImageHumanPoseAnalyzer initWithKeypointsOption:aspectRatio:lightweight:forceCPU:sharedModel:flushModel:]([VCPImageHumanPoseAnalyzer alloc], "initWithKeypointsOption:aspectRatio:lightweight:forceCPU:sharedModel:flushModel:", 1, v10, 0, v7->super._useCPUOnly, 0, 0);
    analyzer = v7->_analyzer;
    v7->_analyzer = v13;

    v15 = v7->_analyzer;
    if (v15)
      -[VCPImageHumanPoseAnalyzer preferredInputFormat:height:format:](v15, "preferredInputFormat:height:format:", &v7->_personID, &v7->_preferredWidth, &v7->_preferredHeight);
    *((_DWORD *)&v7->super._minHandSize + 1) = 0;

  }
  if (v7->_analyzer)
    v16 = v7;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (float)bodyDistance:(id)a3 withBodyB:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  float v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  float v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v8)
  {

    v11 = 0.0;
LABEL_14:
    v27 = (float)(17.0 - v11) * 100.0;
    goto LABEL_15;
  }
  v9 = 0;
  v10 = *(_QWORD *)v30;
  v11 = 0.0;
  v12 = 0.0;
  do
  {
    v13 = 0;
    v14 = v9;
    do
    {
      if (*(_QWORD *)v30 != v10)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
      objc_msgSend(v6, "objectAtIndexedSubscript:", v14 + v13, (_QWORD)v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "confidence");
      if (v17 > 0.1)
      {
        objc_msgSend(v16, "confidence");
        if (v18 > 0.1)
        {
          objc_msgSend(v15, "location");
          v20 = v19;
          objc_msgSend(v16, "location");
          v22 = v21;
          objc_msgSend(v15, "location");
          v24 = v23;
          objc_msgSend(v16, "location");
          v26 = ((v20 - v22) * (v20 - v22) + (v24 - v25) * (v24 - v25)) * 0.5;
          v12 = v12 + sqrtf(v26);
          v11 = v11 + 1.0;
        }
      }

      ++v13;
    }
    while (v8 != v13);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v9 = v14 + v13;
  }
  while (v8);

  if (v11 <= 5.0)
    goto LABEL_14;
  v27 = v12 / v11;
LABEL_15:

  return v27;
}

- (id)processSampleBuffer:(opaqueCMSampleBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  void *v8;
  CVImageBufferRef ImageBuffer;
  VCPImageHumanPoseAnalyzer *analyzer;
  int v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSArray *v17;
  NSArray *existingPersons;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3, a4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  if (!self->_analyzer)
    goto LABEL_28;
  if (!a3)
  {
    v13 = 0;
    v11 = -50;
    if (!a5)
      goto LABEL_31;
    goto LABEL_30;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
LABEL_28:
    v13 = 0;
    v11 = -18;
    goto LABEL_29;
  }
  analyzer = self->_analyzer;
  v44 = 0;
  v11 = -[VCPImageHumanPoseAnalyzer analyzePixelBuffer:flags:results:cancel:](analyzer, "analyzePixelBuffer:flags:results:cancel:", ImageBuffer, &v45, &v44, &__block_literal_global_44);
  v12 = v44;
  v13 = v12;
  if (v11)
    goto LABEL_29;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("HumanPoseResults"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (!v15)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HumanPoseResults"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[VCPHumanPoseImageRequest parseResults:observations:revision:](VCPHumanPoseImageRequest, "parseResults:observations:revision:", v16, v35, self->super._revision);

    if (v11
      || objc_msgSend(v35, "count")
      && (v11 = -[VCPHumanPoseVideoRequest associatePersons:withExisingPersons:](self, "associatePersons:withExisingPersons:", v35, self->_existingPersons)) != 0)
    {
LABEL_29:
      if (!a5)
      {
LABEL_31:
        v29 = 0;
        goto LABEL_32;
      }
LABEL_30:
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: failed to processSampleBuffer"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, v32);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_31;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v35);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  existingPersons = self->_existingPersons;
  self->_existingPersons = v17;

  if (self->super._humanActionWindowSize >= 1)
  {
    v34 = 32;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v19 = v35;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v41 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v23, "personID", v34));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v23, v24);

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v20);
    }

    if (-[NSMutableArray count](self->_existingPersonsArray, "count") >= (unint64_t)*(int *)((char *)&self->super.super.isa + v34))
      -[NSMutableArray removeLastObject](self->_existingPersonsArray, "removeLastObject");
    -[NSMutableArray insertObject:atIndex:](self->_existingPersonsArray, "insertObject:atIndex:", v8, 0, v34);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v25 = v19;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v37 != v27)
            objc_enumerationMutation(v25);
          -[VCPHumanPoseVideoRequest computeActionScoreForPerson:](self, "computeActionScoreForPerson:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      }
      while (v26);
    }

  }
  v29 = v35;
LABEL_32:

  return v29;
}

uint64_t __66__VCPHumanPoseVideoRequest_processSampleBuffer_withOptions_error___block_invoke()
{
  return 0;
}

- (void)computeActionScoreForPerson:(id)a3
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  float v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  float v31;
  float v32;
  void *v33;
  void *v34;
  float v35;
  void *v36;
  void *v37;
  float v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  float v50;
  uint64_t i;
  void *v52;
  void *v53;
  float v54;
  _BOOL4 v55;
  double v56;
  double v57;
  float v58;
  int humanActionWindowSize;
  float v60;
  uint64_t v61;
  float v62;
  float v63;
  float v64;
  float v65;
  double v66;
  int v67;
  void *v68;
  NSMutableArray *obj;
  float obja;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((v4 & 1) == 0
  {
    *(float *)&v67 = (double)self->super._humanActionWindowSize * 0.7;
    -[VCPHumanPoseVideoRequest computeActionScoreForPerson:]::kMinNumBodies = v67;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "personID", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = self->_existingPersonsArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v74;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
LABEL_4:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v74 != v7)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * v11), "objectForKey:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (!v12)
        goto LABEL_25;
      objc_msgSend(v12, "keypoints");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "confidence");
      if (v16 <= 0.1)
      {

      }
      else
      {
        objc_msgSend(v13, "keypoints");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", 5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "confidence");
        v20 = v19 > 0.1;

        if (v20)
        {
          objc_msgSend(v13, "keypoints");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", 11);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "location");
          v24 = v23;
          v26 = v25;
          objc_msgSend(v13, "keypoints");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectAtIndexedSubscript:", 5);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "location");
          -[VCPHumanPoseVideoRequest normDistance:point2:](self, "normDistance:point2:", v24, v26, v29, v30);
          v32 = v31;

LABEL_15:
          v10 = v10 + v32;
          v9 = v9 + 1.0;
          goto LABEL_17;
        }
      }
      objc_msgSend(v13, "keypoints");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndexedSubscript:", 12);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "confidence");
      if (v35 > 0.1)
      {
        objc_msgSend(v13, "keypoints");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectAtIndexedSubscript:", 6);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "confidence");
        v39 = v38 > 0.1;

        if (!v39)
          goto LABEL_17;
        objc_msgSend(v13, "keypoints");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectAtIndexedSubscript:", 12);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "location");
        v43 = v42;
        v45 = v44;
        objc_msgSend(v13, "keypoints");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectAtIndexedSubscript:", 6);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "location");
        -[VCPHumanPoseVideoRequest normDistance:point2:](self, "normDistance:point2:", v43, v45, v48, v49);
        v32 = v50;

        goto LABEL_15;
      }

LABEL_17:
      for (i = 5; i != 17; ++i)
      {
        objc_msgSend(v13, "keypoints");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectAtIndexedSubscript:", i);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "confidence");
        v55 = v54 > 0.1;

        if (v55)
          v8 = v8 + 1.0;
      }

      if (++v11 == v6)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
        if (v6)
          goto LABEL_4;
        goto LABEL_25;
      }
    }
  }
  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
LABEL_25:

  LODWORD(v56) = 0;
  LODWORD(v57) = 0;
  v58 = 0.0;
  if (v9 >= *(float *)&-[VCPHumanPoseVideoRequest computeActionScoreForPerson:]::kMinNumBodies)
  {
    humanActionWindowSize = self->super._humanActionWindowSize;
    v72 = 0;
    -[VCPHumanPoseVideoRequest computeVarWithID:index1:index2:interVar:intraVar:](self, "computeVarWithID:index1:index2:interVar:intraVar:", v5, 9, 5, (char *)&v72 + 4, &v72, v56, v57);
    obja = *((float *)&v72 + 1);
    v60 = *(float *)&v72;
    -[VCPHumanPoseVideoRequest computeVarWithID:index1:index2:interVar:intraVar:](self, "computeVarWithID:index1:index2:interVar:intraVar:", v5, 10, 6, (char *)&v72 + 4, &v72);
    v61 = v72;
    -[VCPHumanPoseVideoRequest computeVarWithID:index1:index2:interVar:intraVar:](self, "computeVarWithID:index1:index2:interVar:intraVar:", v5, 15, 11, (char *)&v72 + 4, &v72);
    v63 = *((float *)&v72 + 1);
    v62 = *(float *)&v72;
    -[VCPHumanPoseVideoRequest computeVarWithID:index1:index2:interVar:intraVar:](self, "computeVarWithID:index1:index2:interVar:intraVar:", v5, 16, 12, (char *)&v72 + 4, &v72);
    *(float *)&v56 = v8 / (float)(12 * humanActionWindowSize);
    *(float *)&v57 = (float)(v10 / v9) * (float)((float)(v10 / v9) * 4.0);
    v64 = sqrtf(fmaxf((float)((float)((float)((float)(obja + 0.0) + *((float *)&v61 + 1)) + v63) + *((float *)&v72 + 1))/ *(float *)&v57, 0.0));
    *(float *)&v57 = sqrtf(fmaxf((float)((float)((float)((float)(v60 + 0.0) + *(float *)&v61) + v62) + *(float *)&v72)/ *(float *)&v57, 0.0));
    v58 = v64 + v64;
    *(float *)&v57 = *(float *)&v57 + *(float *)&v57;
  }
  if (*(float *)&v56 <= 0.5)
    v65 = *(float *)&v56;
  else
    v65 = 0.5;
  *(float *)&v56 = fminf(*(float *)&v57 * v65, 1.0);
  objc_msgSend(v68, "setRelativeActionScore:", v56);
  *(float *)&v66 = fminf(v58 * v65, 1.0);
  objc_msgSend(v68, "setAbsoluteActionScore:", v66);

}

- (void)computeVarWithID:(id)a3 index1:(int)a4 index2:(int)a5 interVar:(float *)a6 intraVar:(float *)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  float v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float *v72;
  float *v73;
  double v74;
  double v75;
  double v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  NSMutableArray *obj;
  uint64_t v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v87 = a3;
  v73 = a6;
  if (a6 && a7)
  {
    v72 = a7;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = self->_existingPersonsArray;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v89;
      v14 = a4;
      v86 = a5;
      v15 = 0.0;
      v84 = 0.0;
      v82 = 0.0;
      v83 = 0.0;
      v80 = 0.0;
      v81 = 0.0;
      v78 = 0.0;
      v79 = 0.0;
      v77 = 0.0;
LABEL_5:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v89 != v13)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * v16), "objectForKey:", v87);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (!v17)
          break;
        objc_msgSend(v17, "keypoints");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "confidence");
        if (v21 <= 0.1)
        {

        }
        else
        {
          objc_msgSend(v18, "keypoints");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", v86);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "confidence");
          v25 = v24 > 0.1;

          if (v25)
          {
            objc_msgSend(v18, "keypoints");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectAtIndexedSubscript:", v14);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "location");
            v76 = v28;

            objc_msgSend(v18, "keypoints");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectAtIndexedSubscript:", v14);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "location");
            v32 = v31;
            objc_msgSend(v18, "keypoints");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectAtIndexedSubscript:", v14);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = v32;
            objc_msgSend(v34, "location");
            v74 = v35;

            objc_msgSend(v18, "keypoints");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectAtIndexedSubscript:", v14);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "location");
            v39 = v38;

            objc_msgSend(v18, "keypoints");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "objectAtIndexedSubscript:", v14);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "location");
            v43 = v42;
            objc_msgSend(v18, "keypoints");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectAtIndexedSubscript:", v14);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "location");
            v47 = v46;

            objc_msgSend(v18, "keypoints");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectAtIndexedSubscript:", v14);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "location");
            v51 = v50;
            objc_msgSend(v18, "keypoints");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "objectAtIndexedSubscript:", v86);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "location");
            v55 = v54;

            objc_msgSend(v18, "keypoints");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectAtIndexedSubscript:", v14);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "location");
            v59 = v58;
            objc_msgSend(v18, "keypoints");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "objectAtIndexedSubscript:", v86);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "location");
            v63 = v62;

            v64 = v76 + v77;
            v65 = v78 + v75 * v74;
            v77 = v64;
            v78 = v65;
            v66 = v39 + v79;
            v67 = v80 + v43 * v47;
            v79 = v66;
            v80 = v67;
            v68 = v51 - v55;
            v81 = v81 + v68;
            v82 = v82 + (float)(v68 * v68);
            v69 = v59 - v63;
            v83 = v83 + v69;
            v84 = v84 + (float)(v69 * v69);
            v15 = v15 + 1.0;
          }
        }

        if (v12 == ++v16)
        {
          v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
          if (v12)
            goto LABEL_5;
          break;
        }
      }

      v70 = 0.0;
      v71 = 0.0;
      if (v15 > 0.0)
      {
        v71 = (float)((float)((float)(v80 / v15) - (float)((float)(v79 * v79) / (float)(v15 * v15)))
                    + (float)((float)(v78 / v15) - (float)((float)(v77 * v77) / (float)(v15 * v15))))
            * 0.5;
        v70 = (float)((float)((float)(v84 / v15) - (float)((float)(v83 * v83) / (float)(v15 * v15)))
                    + (float)((float)(v82 / v15) - (float)((float)(v81 * v81) / (float)(v15 * v15))))
            * 0.5;
      }
    }
    else
    {

      v70 = 0.0;
      v71 = 0.0;
    }
    *v73 = v71;
    *v72 = v70;
  }

}

- (float)normDistance:(CGPoint)a3 point2:(CGPoint)a4
{
  float v4;

  v4 = (a3.y - a4.y) * (a3.y - a4.y) + (a3.x - a4.x) * (a3.x - a4.x);
  return sqrtf(v4);
}

- (int)associatePersons:(id)a3 withExisingPersons:(id)a4
{
  unint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  uint64_t m;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  uint64_t j;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  id v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  id obj;
  id obja;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v48 = a4;
  if (objc_msgSend(v48, "count"))
  {
    v6 = objc_msgSend(v48, "count");
    if (v6 >= objc_msgSend(v53, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v48);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v7 = v53;
      v41 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      if (v41)
      {
        v43 = *(_QWORD *)v72;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v72 != v43)
              objc_enumerationMutation(v7);
            v27 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
            v67 = 0u;
            v68 = 0u;
            v69 = 0u;
            v70 = 0u;
            obja = v9;
            v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
            if (v28)
            {
              v54 = 0;
              v29 = 0;
              v52 = *(_QWORD *)v68;
              v30 = 3.4028e38;
              while (2)
              {
                v50 = v28;
                for (j = 0; j != v50; ++j)
                {
                  if (*(_QWORD *)v68 != v52)
                    objc_enumerationMutation(obja);
                  v32 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
                  objc_msgSend(v27, "keypoints");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v14, "count") != 17)
                  {
                    v9 = obja;
                    goto LABEL_61;
                  }
                  objc_msgSend(v32, "keypoints");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "count") == 17;

                  if (!v34)
                  {
                    v9 = obja;
                    goto LABEL_63;
                  }
                  objc_msgSend(v27, "keypoints");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "keypoints");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  -[VCPHumanPoseVideoRequest bodyDistance:withBodyB:](self, "bodyDistance:withBodyB:", v35, v36);
                  v38 = v37;

                  if (v38 < v30)
                  {
                    v29 = objc_msgSend(v32, "personID");
                    v39 = v32;

                    v54 = v39;
                    v30 = v38;
                  }
                }
                v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
                if (v28)
                  continue;
                break;
              }
            }
            else
            {
              v54 = 0;
              v29 = 0;
            }

            objc_msgSend(v27, "setPersonID:", v29);
            objc_msgSend(obja, "removeObject:", v54);

          }
          v41 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
        }
        while (v41);
        LODWORD(v22) = 0;
        v9 = obja;
      }
      else
      {
        LODWORD(v22) = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v53);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v7 = v48;
      v42 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
      if (v42)
      {
        v44 = *(_QWORD *)v64;
LABEL_5:
        obj = 0;
LABEL_6:
        if (*(_QWORD *)v64 != v44)
          objc_enumerationMutation(v7);
        v8 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)obj);
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v9 = v49;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
        if (v10)
        {
          v54 = 0;
          v51 = *(_QWORD *)v60;
          v11 = 3.4028e38;
LABEL_10:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v60 != v51)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v12);
            objc_msgSend(v8, "keypoints");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "count") != 17)
              break;
            objc_msgSend(v13, "keypoints");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "count") == 17;

            if (!v16)
              goto LABEL_63;
            objc_msgSend(v8, "keypoints");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "keypoints");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPHumanPoseVideoRequest bodyDistance:withBodyB:](self, "bodyDistance:withBodyB:", v17, v18);
            v20 = v19;

            if (v20 < v11)
            {
              v21 = v13;

              v11 = v20;
              v54 = v21;
            }
            if (v10 == ++v12)
            {
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
              if (v10)
                goto LABEL_10;

              if (!v54)
                goto LABEL_64;
              objc_msgSend(v54, "setPersonID:", objc_msgSend(v8, "personID"));
              objc_msgSend(v9, "removeObject:", v54);

              obj = (char *)obj + 1;
              if (obj != (id)v42)
                goto LABEL_6;
              v42 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
              if (v42)
                goto LABEL_5;
              goto LABEL_22;
            }
          }
LABEL_61:

        }
        else
        {
          v54 = 0;
        }
LABEL_63:

LABEL_64:
        LODWORD(v22) = -18;
      }
      else
      {
LABEL_22:

        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v7 = v49;
        v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v56;
          do
          {
            for (k = 0; k != v22; ++k)
            {
              if (*(_QWORD *)v56 != v23)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * k), "setPersonID:", (*((_DWORD *)&self->super._minHandSize + 1))++);
            }
            v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
          }
          while (v22);
        }
        v9 = v7;
      }
    }

  }
  else
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v9 = v53;
    v22 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v22)
    {
      v25 = *(_QWORD *)v76;
      do
      {
        for (m = 0; m != v22; ++m)
        {
          if (*(_QWORD *)v76 != v25)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * m), "setPersonID:", (*((_DWORD *)&self->super._minHandSize + 1))++);
        }
        v22 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      }
      while (v22);
    }
  }

  return v22;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  double personID;
  double preferredWidth;
  CGSize result;

  personID = (double)self->_personID;
  preferredWidth = (double)self->_preferredWidth;
  result.height = preferredWidth;
  result.width = personID;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredHeight;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  VCPImageHumanPoseAnalyzer *analyzer;

  analyzer = self->_analyzer;
  self->_analyzer = 0;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingPersonsArray, 0);
  objc_storeStrong((id *)&self->_existingPersons, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
}

@end
