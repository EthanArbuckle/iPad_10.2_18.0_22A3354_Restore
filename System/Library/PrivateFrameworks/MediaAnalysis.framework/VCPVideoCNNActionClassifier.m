@implementation VCPVideoCNNActionClassifier

+ (id)sharedModel:(id)a3 inputNames:(id)a4 properties:(id)a5
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
  v16[2] = __65__VCPVideoCNNActionClassifier_sharedModel_inputNames_properties___block_invoke;
  v16[3] = &unk_1E6B17910;
  v11 = v7;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  objc_msgSend(v10, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPVideoCNNActionClassifierEspresso"), v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

VCPCNNModelEspresso *__65__VCPVideoCNNActionClassifier_sharedModel_inputNames_properties___block_invoke(_QWORD *a1)
{
  return -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", a1[4], a1[5], 0, a1[6]);
}

+ (id)sharedModelStage1:(id)a3 inputNames:(id)a4 properties:(id)a5
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
  v16[2] = __71__VCPVideoCNNActionClassifier_sharedModelStage1_inputNames_properties___block_invoke;
  v16[3] = &unk_1E6B17910;
  v11 = v7;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  objc_msgSend(v10, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPVideoCNNActionClassifierEspressoStage1"), v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

VCPCNNModelEspresso *__71__VCPVideoCNNActionClassifier_sharedModelStage1_inputNames_properties___block_invoke(_QWORD *a1)
{
  return -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", a1[4], a1[5], 0, a1[6]);
}

- (VCPVideoCNNActionClassifier)initWithPHFaces:(id)a3
{
  id v4;
  VCPVideoCNNActionClassifier *v5;
  VCPVideoCNNActionClassifier *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *phFaces;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *taxonomy;
  uint64_t v23;
  NSMutableArray *results;
  NSArray *inputNames;
  VCPCNNModelEspresso *v26;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v28;
  void *v29;
  VCPCNNModelEspresso *v30;
  VCPCNNModelEspresso *modelEspressoStage1;
  VCPCNNModelEspresso *v32;
  BOOL v33;
  VCPVideoCNNActionClassifier *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  _QWORD v42[2];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)VCPVideoCNNActionClassifier;
  v5 = -[VCPVideoCNNActionClassifier init](&v40, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = DeviceGeqD5x();
    v42[0] = CFSTR("forceNNGraph");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7 ^ 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v8;
    v42[1] = CFSTR("sharedContext");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    phFaces = v5->_phFaces;
    v5->_phFaces = (NSMutableArray *)v11;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v13);
          -[NSMutableArray addObject:](v5->_phFaces, "addObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), (_QWORD)v36);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resourceURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("action_recognition_head.espresso.net"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("action_taxonomy.plist"), v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithContentsOfURL:", v20);
    taxonomy = v5->_taxonomy;
    v5->_taxonomy = (NSArray *)v21;

    if (-[NSArray count](v5->_taxonomy, "count") == 35)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = objc_claimAutoreleasedReturnValue();
      results = v5->_results;
      v5->_results = (NSMutableArray *)v23;

      inputNames = v5->_inputNames;
      v5->_inputNames = (NSArray *)&unk_1E6B769B0;

      std::vector<void *>::resize((uint64_t)&v5->_inputsData, -[NSArray count](v5->_inputNames, "count"));
      if (DeviceHasANE())
      {
        objc_msgSend((id)objc_opt_class(), "sharedModel:inputNames:properties:", v19, v5->_inputNames, 0);
        v26 = (VCPCNNModelEspresso *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", v19, v5->_inputNames, 0, 0);
      }
      modelEspresso = v5->_modelEspresso;
      v5->_modelEspresso = v26;

      v28 = v5->_modelEspresso;
      if (v28)
      {
        if (!-[VCPCNNModelEspresso prepareModelWithConfig:](v28, "prepareModelWithConfig:", &stru_1E6B1C190))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("action_recognition_head_stage1.espresso.net"), v18);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (DeviceHasANE())
          {
            objc_msgSend((id)objc_opt_class(), "sharedModelStage1:inputNames:properties:", v29, 0, v10);
            v30 = (VCPCNNModelEspresso *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v30 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", v29, 0, 0, v10);
          }
          modelEspressoStage1 = v5->_modelEspressoStage1;
          v5->_modelEspressoStage1 = v30;

          v32 = v5->_modelEspressoStage1;
          if (v32)
          {
            v33 = -[VCPCNNModelEspresso prepareModelWithConfig:](v32, "prepareModelWithConfig:", &stru_1E6B1C190) == 0;

            if (v33)
            {
              v6 = v5;
              goto LABEL_24;
            }
LABEL_23:
            v6 = 0;
            goto LABEL_24;
          }
          v19 = v29;
        }
      }
    }

    goto LABEL_23;
  }
LABEL_24:
  v34 = v6;

  return v34;
}

- (int)run:(id)a3 withPersons:(id)a4 andRegionCrop:(CGRect)a5 atTime:(id *)a6 andDuration:(id *)a7
{
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *phFaces;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
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
  void *v35;
  BOOL v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  BOOL v51;
  void *v52;
  uint64_t v53;
  char v54;
  uint64_t k;
  NSString *v56;
  void *v57;
  float v58;
  int v59;
  VCPCNNModelEspresso *modelEspressoStage1;
  float *value;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v63;
  CMTimeValue v64;
  uint64_t v65;
  float v66;
  uint64_t m;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  BOOL v72;
  double x;
  double y;
  double width;
  double height;
  void *v77;
  void *v78;
  void *v79;
  BOOL v80;
  void *v81;
  NSString *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  BOOL v90;
  void *v91;
  void *v92;
  NSMutableArray *results;
  CFDictionaryRef v94;
  CFDictionaryRef v95;
  void *v96;
  const __CFString *v98;
  id v99;
  id v102;
  id obj;
  uint64_t v104;
  uint64_t v105;
  void *v107;
  int v108;
  void *v109;
  void *v110;
  void *__p;
  void *v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[3];
  _QWORD v128[3];
  _QWORD v129[2];
  _QWORD v130[2];
  CMTime buf[7];
  _DWORD v132[5];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  uint64_t v136;
  NSRect v137;
  NSRect v138;
  NSRect v139;
  NSRect v140;
  CGRect v141;
  NSRect v142;
  NSRect v143;
  NSRect v144;

  v136 = *MEMORY[0x1E0C80C00];
  v102 = a3;
  v99 = a4;
  if (!v99 && !-[NSMutableArray count](self->_phFaces, "count"))
  {
    v59 = 0;
    goto LABEL_83;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_phFaces, "count"))
  {
    if ((unint64_t)-[NSMutableArray count](self->_phFaces, "count") >= 4)
    {
      -[NSMutableArray sortUsingComparator:](self->_phFaces, "sortUsingComparator:", &__block_literal_global_80);
      -[NSMutableArray subarrayWithRange:](self->_phFaces, "subarrayWithRange:", 0, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");
      phFaces = self->_phFaces;
      self->_phFaces = v10;

    }
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v12 = self->_phFaces;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v123, v135, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v124;
      v15 = MEMORY[0x1E0C81028];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v124 != v14)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
          objc_msgSend(v17, "bodyWidth");
          v19 = v18;
          objc_msgSend(v17, "bodyHeight");
          if (v19 * v20 == 0.0)
          {
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v17, "localIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf[0].value) = 138412290;
              *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v21;
              _os_log_impl(&dword_1B6C4A000, v15, OS_LOG_TYPE_DEBUG, "Action classifier - empty torso bound in PHFace %@", (uint8_t *)buf, 0xCu);

            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v17, "localIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf[0].value) = 138412290;
              *(CMTimeValue *)((char *)&buf[0].value + 4) = (CMTimeValue)v22;
              _os_log_impl(&dword_1B6C4A000, v15, OS_LOG_TYPE_DEBUG, "Action classifier - found torso bound in PHFace %@", (uint8_t *)buf, 0xCu);

            }
            objc_msgSend(v17, "bodyCenterX");
            v24 = v23;
            objc_msgSend(v17, "bodyWidth");
            v26 = v25;
            objc_msgSend(v17, "bodyCenterY");
            v28 = v27;
            objc_msgSend(v17, "bodyHeight");
            v30 = v29;
            objc_msgSend(v17, "bodyWidth");
            v32 = v31;
            objc_msgSend(v17, "bodyHeight");
            v34 = v33;
            objc_msgSend(v17, "localIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v35 == 0;

            v37 = v24 + v26 * -0.5;
            v38 = v28 + v30 * -0.5;
            if (!v36)
            {
              v137.origin.x = v37;
              v137.origin.y = v28 + v30 * -0.5;
              v137.size.width = v32;
              v137.size.height = v34;
              NSStringFromRect(v137);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "localIdentifier");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "setObject:forKeyedSubscript:", v39, v40);

            }
            if (!CGRectIsEmpty(a5))
            {
              v37 = fmax(v37 - a5.origin.x, 0.0) / a5.size.width;
              v38 = fmax(v38 - a5.origin.y, 0.0) / a5.size.height;
              v32 = fmin(v32 / a5.size.width, 0.99000001 - v37);
              v34 = fmin(v34 / a5.size.height, 0.99000001 - v38);
            }
            v138.origin.x = v37;
            v138.origin.y = v38;
            v138.size.width = v32;
            v138.size.height = v34;
            NSStringFromRect(v138);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v41);
            objc_msgSend(v17, "localIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v42 == 0;

            if (!v43)
            {
              objc_msgSend(v17, "localIdentifier");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "setObject:forKeyedSubscript:", v44, v41);

            }
          }
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v123, v135, 16);
      }
      while (v13);
    }
  }
  else
  {
    v122 = 0u;
    v120 = 0u;
    v121 = 0u;
    v119 = 0u;
    v12 = (NSMutableArray *)v99;
    v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v119, v134, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v120;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v120 != v46)
            objc_enumerationMutation(v12);
          v48 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * j);
          objc_msgSend(v48, "bounds");
          NSStringFromRect(v139);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v49);
          objc_msgSend(v48, "torsoprint");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v50 == 0;

          if (!v51)
          {
            objc_msgSend(v48, "torsoprint");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "setObject:forKeyedSubscript:", v52, v49);

          }
        }
        v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v119, v134, 16);
      }
      while (v45);
    }
  }

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  obj = v8;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v133, 16);
  if (!v53)
  {
    v59 = 0;
    goto LABEL_82;
  }
  v108 = 0;
  v54 = 0;
  v105 = *(_QWORD *)v116;
  v98 = CFSTR("torsoPrint");
  while (2)
  {
    v104 = v53;
    for (k = 0; k != v104; ++k)
    {
      if (*(_QWORD *)v116 != v105)
        objc_enumerationMutation(obj);
      v56 = *(NSString **)(*((_QWORD *)&v115 + 1) + 8 * k);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v98);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = NSRectFromString(v56);
      if (v140.size.height * v140.size.width >= 0.00499999989)
      {
        if (v108 > 2)
        {
          v59 = 0;
        }
        else
        {
          v141 = CGRectInset(v140, v140.size.width * -0.25, v140.size.height * -0.25);
          v132[0] = 0;
          v58 = fmax(v141.origin.x, 0.0);
          v141.origin.y = 1.0 - v141.origin.y;
          *(float *)&v141.size.height = fmax(v141.origin.y - v141.size.height, 0.0);
          *(float *)&v132[1] = v58;
          v132[2] = LODWORD(v141.size.height);
          *(float *)&v141.origin.x = fmin(v141.origin.x + v141.size.width, 1.0);
          *(float *)&v141.origin.y = fmin(v141.origin.y, 1.0);
          v132[3] = LODWORD(v141.origin.x);
          v132[4] = LODWORD(v141.origin.y);
          if ((v54 & 1) == 0)
          {
            v59 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspressoStage1, "espressoForward:", objc_msgSend(v102, "outputRes4"));
            if (v59)
              goto LABEL_81;
          }
          modelEspressoStage1 = self->_modelEspressoStage1;
          if (modelEspressoStage1)
          {
            -[VCPCNNModelEspresso outputBlob](modelEspressoStage1, "outputBlob");
            value = (float *)buf[0].value;
          }
          else
          {
            value = 0;
          }
          *self->_inputsData.__begin_ = value;
          *((_QWORD *)self->_inputsData.__begin_ + 1) = v132;
          modelEspresso = self->_modelEspresso;
          v113 = 0;
          v114 = 0;
          __p = 0;
          std::vector<float *>::__init_with_size[abi:ne180100]<float **,float **>(&__p, self->_inputsData.__begin_, (uint64_t)self->_inputsData.__end_, self->_inputsData.__end_ - self->_inputsData.__begin_);
          v59 = -[VCPCNNModelEspresso espressoForwardInputs:](modelEspresso, "espressoForwardInputs:", &__p);
          if (__p)
          {
            v113 = __p;
            operator delete(__p);
          }
          if (v59)
            goto LABEL_81;
          v63 = self->_modelEspresso;
          if (!v63)
            goto LABEL_80;
          -[VCPCNNModelEspresso outputBlob](v63, "outputBlob");
          v64 = buf[0].value;
          if (!buf[0].value)
            goto LABEL_80;
          v65 = 0;
          ++v108;
          v66 = 0.0;
          do
          {
            v66 = v66 + expf(*(float *)(v64 + v65));
            v65 += 4;
          }
          while (v65 != 140);
          for (m = 0; m != 35; ++m)
          {
            if ((float)(expf(*(float *)(v64 + 4 * m)) / v66) > 0.1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", m);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "stringValue");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "setObject:forKeyedSubscript:", v68, v70);

            }
          }
          objc_msgSend(v57, "allKeys");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "count") == 0;

          if (v72)
            goto LABEL_72;
          v142 = NSRectFromString(v56);
          x = v142.origin.x;
          y = v142.origin.y;
          width = v142.size.width;
          height = v142.size.height;
          objc_msgSend(v109, "objectForKeyedSubscript:", v56);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v77)
            goto LABEL_64;
          objc_msgSend(v109, "objectForKeyedSubscript:", v56);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "objectForKeyedSubscript:", v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = v79 == 0;

          if (v80)
          {
LABEL_64:
            if (!CGRectIsEmpty(a5))
            {
              x = a5.origin.x + x * a5.size.width;
              y = a5.origin.y + y * a5.size.height;
              width = a5.size.width * width;
              height = a5.size.height * height;
            }
          }
          else
          {
            objc_msgSend(v109, "objectForKeyedSubscript:", v56);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "objectForKeyedSubscript:", v81);
            v82 = (NSString *)objc_claimAutoreleasedReturnValue();
            v143 = NSRectFromString(v82);
            x = v143.origin.x;
            y = v143.origin.y;
            width = v143.size.width;
            height = v143.size.height;

          }
          v83 = (void *)MEMORY[0x1E0C99E08];
          v129[0] = CFSTR("humanActions");
          v129[1] = CFSTR("humanBounds");
          v130[0] = v57;
          v144.origin.x = x;
          v144.origin.y = y;
          v144.size.width = width;
          v144.size.height = height;
          NSStringFromRect(v144);
          v84 = objc_claimAutoreleasedReturnValue();
          v130[1] = v84;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 2);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "dictionaryWithDictionary:", v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v109, "objectForKeyedSubscript:", v56);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v84) = v87 == 0;

          if ((v84 & 1) == 0)
          {
            objc_msgSend(v109, "objectForKeyedSubscript:", v56);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "setObject:forKeyedSubscript:", v88, CFSTR("faceIdentifier"));

          }
          objc_msgSend(v110, "objectForKeyedSubscript:", v56);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = v89 == 0;

          if (v90)
          {
LABEL_71:
            results = self->_results;
            v127[0] = CFSTR("start");
            buf[0] = (CMTime)*a6;
            v94 = CMTimeCopyAsDictionary(buf, 0);
            v128[0] = v94;
            v127[1] = CFSTR("duration");
            buf[0] = (CMTime)*a7;
            v95 = CMTimeCopyAsDictionary(buf, 0);
            v127[2] = CFSTR("attributes");
            v128[1] = v95;
            v128[2] = v86;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v128, v127, 3);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](results, "addObject:", v96);

LABEL_72:
            v54 = 1;
            goto LABEL_73;
          }
          objc_msgSend(v110, "objectForKeyedSubscript:", v56);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "serializeStateAndReturnError:", 0);
          v92 = (void *)objc_claimAutoreleasedReturnValue();

          if (v92)
          {
            objc_msgSend(v86, "setObject:forKeyedSubscript:", v92, v98);

            goto LABEL_71;
          }

LABEL_80:
          v59 = -18;
        }
LABEL_81:

        goto LABEL_82;
      }
LABEL_73:

    }
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v133, 16);
    v59 = 0;
    if (v53)
      continue;
    break;
  }
LABEL_82:

LABEL_83:
  return v59;
}

uint64_t __80__VCPVideoCNNActionClassifier_run_withPersons_andRegionCrop_atTime_andDuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  float v14;
  uint64_t v15;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "bodyWidth");
  v7 = v6;
  objc_msgSend(v4, "bodyHeight");
  v9 = v8;
  objc_msgSend(v5, "bodyWidth");
  v11 = v10;
  objc_msgSend(v5, "bodyHeight");
  v12 = v7 * v9;
  v14 = v11 * v13;
  if (v12 > v14)
    v15 = -1;
  else
    v15 = v12 < v14;

  return v15;
}

- (int)finishAnalysisPass:(id *)a3
{
  return 0;
}

- (id)results
{
  NSMutableArray *results;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  results = self->_results;
  v4 = CFSTR("HumanActionClassificationResults");
  v5[0] = results;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  float **begin;

  objc_storeStrong((id *)&self->_phFaces, 0);
  begin = self->_inputsData.__begin_;
  if (begin)
  {
    self->_inputsData.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  objc_storeStrong((id *)&self->_modelEspressoStage1, 0);
  objc_storeStrong((id *)&self->_taxonomy, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
