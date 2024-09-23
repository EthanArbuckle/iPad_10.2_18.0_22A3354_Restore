@implementation VCPImageHumanPoseAnalyzer

+ (BOOL)saveKeypoints
{
  return 0;
}

- (VCPImageHumanPoseAnalyzer)init
{

  return 0;
}

- (VCPImageHumanPoseAnalyzer)initWithKeypointsOption:(BOOL)a3 aspectRatio:(id)a4 lightweight:(BOOL)a5 forceCPU:(BOOL)a6 sharedModel:(BOOL)a7 flushModel:(BOOL)a8
{
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  NSURL *v13;
  NSURL *netFileUrl;
  VCPImageHumanPoseAnalyzer *v15;
  VCPImageHumanPoseAnalyzer *v16;
  NSString *resConfig;
  NSString *v18;
  uint64_t v19;
  NSMutableArray *persons;
  uint64_t v21;
  NSMutableArray *results;
  uint64_t v23;
  void *v24;
  VCPCNNModelEspresso *v25;
  NSURL *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  VCPCNNModelEspresso *modelEspresso;
  void *v31;
  VCPImageHumanPoseAnalyzer *v32;
  _BOOL4 v36;
  _BOOL4 v37;
  objc_super v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v36 = a6;
  v37 = a7;
  v8 = a5;
  v40[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resourceURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("cnn_human_pose.espresso.net"), v12);
  v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
  netFileUrl = self->_netFileUrl;
  self->_netFileUrl = v13;

  v38.receiver = self;
  v38.super_class = (Class)VCPImageHumanPoseAnalyzer;
  v15 = -[VCPImageHumanPoseAnalyzer init](&v38, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_12;
  resConfig = v15->_resConfig;
  v15->_resConfig = (NSString *)CFSTR("res_256x256");

  v16->_inputWidth = 256;
  v16->_inputHeight = 256;
  if (v8)
  {
    v18 = v16->_resConfig;
    v16->_resConfig = (NSString *)CFSTR("res_192x192");

    v16->_inputWidth = 192;
    v16->_inputHeight = 192;
    goto LABEL_6;
  }
  if (v10 && -[VCPImageHumanPoseAnalyzer configForAspectRatio:](v16, "configForAspectRatio:", v10))
  {
LABEL_12:
    v31 = 0;
    goto LABEL_13;
  }
LABEL_6:
  v16->_inputData = 0;
  v16->_trackingMode = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = objc_claimAutoreleasedReturnValue();
  persons = v16->_persons;
  v16->_persons = (NSMutableArray *)v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = objc_claimAutoreleasedReturnValue();
  results = v16->_results;
  v16->_results = (NSMutableArray *)v21;

  if ((DeviceHasANE() & v37) != 1 || v36)
  {
    v25 = [VCPCNNModelEspresso alloc];
    v26 = v16->_netFileUrl;
    v39[0] = CFSTR("forceCPU");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v36);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v24;
    v39[1] = CFSTR("sharedContext");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v37);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v25, "initWithParameters:inputNames:outputNames:properties:", v26, 0, 0, v28);
    modelEspresso = v16->_modelEspresso;
    v16->_modelEspresso = (VCPCNNModelEspresso *)v29;

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "sharedModel:", v16->_netFileUrl);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v16->_modelEspresso;
    v16->_modelEspresso = (VCPCNNModelEspresso *)v23;
  }

  v31 = v16->_modelEspresso;
  if (v31)
  {
    if (!-[VCPImageHumanPoseAnalyzer createModelWithHeight:srcWidth:](v16, "createModelWithHeight:srcWidth:", v16->_inputHeight, v16->_inputWidth))
    {
      v16->_saveKeypoints = a3;
      v16->_heatmapNms = 0;
      v16->_forceCPU = v36;
      v16->_sharedModel = v37;
      v16->_flushModel = a8;
      v31 = v16;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:
  v32 = v31;

  return v32;
}

- (int)reInitModel
{
  VCPCNNModelEspresso *v3;
  NSURL *netFileUrl;
  void *v5;
  void *v6;
  void *v7;
  VCPCNNModelEspresso *v8;
  VCPCNNModelEspresso *modelEspresso;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = [VCPCNNModelEspresso alloc];
  netFileUrl = self->_netFileUrl;
  v11[0] = CFSTR("forceCPU");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_forceCPU);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("sharedContext");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sharedModel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:](v3, "initWithParameters:inputNames:outputNames:properties:", netFileUrl, 0, 0, v7);
  modelEspresso = self->_modelEspresso;
  self->_modelEspresso = v8;

  if (self->_modelEspresso)
    return -[VCPImageHumanPoseAnalyzer createModelWithHeight:srcWidth:](self, "createModelWithHeight:srcWidth:", self->_inputHeight, self->_inputWidth);
  else
    return -108;
}

+ (id)sharedModel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__VCPImageHumanPoseAnalyzer_sharedModel___block_invoke;
  v8[3] = &unk_1E6B168B8;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "sharedInstanceWithIdentifier:andCreationBlock:", CFSTR("VCPHumanPoseEspresso"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

VCPCNNModelEspresso *__41__VCPImageHumanPoseAnalyzer_sharedModel___block_invoke(uint64_t a1)
{
  return -[VCPCNNModelEspresso initWithParameters:inputNames:outputNames:properties:]([VCPCNNModelEspresso alloc], "initWithParameters:inputNames:outputNames:properties:", *(_QWORD *)(a1 + 32), 0, 0, 0);
}

- (void)dealloc
{
  float *inputData;
  float *heatmapNms;
  objc_super v5;

  inputData = self->_inputData;
  if (inputData)
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210);
  heatmapNms = self->_heatmapNms;
  if (heatmapNms)
    MEMORY[0x1BCCA128C](heatmapNms, 0x1000C8052888210);
  v5.receiver = self;
  v5.super_class = (Class)VCPImageHumanPoseAnalyzer;
  -[VCPImageHumanPoseAnalyzer dealloc](&v5, sel_dealloc);
}

- (int)configForAspectRatio:(id)a3
{
  id v4;
  void *v5;
  float v6;
  NSString *resConfig;
  int v8;
  int v9;
  float v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    if (v6 <= 1.4)
    {
      objc_msgSend(v5, "floatValue");
      resConfig = self->_resConfig;
      if (v10 >= 0.714285726)
      {
        self->_resConfig = (NSString *)CFSTR("res_256x256");
        v9 = 256;
        v8 = 256;
      }
      else
      {
        self->_resConfig = (NSString *)CFSTR("res_192x320");
        v8 = 320;
        v9 = 192;
      }
    }
    else
    {
      resConfig = self->_resConfig;
      self->_resConfig = (NSString *)CFSTR("res_320x192");
      v8 = 192;
      v9 = 320;
    }

    self->_inputWidth = v9;
    self->_inputHeight = v8;
  }

  return 0;
}

- (int)updateModelForAspectRatio:(id)a3
{
  NSString *v5;
  int v6;

  v5 = self->_resConfig;
  v6 = -[VCPImageHumanPoseAnalyzer configForAspectRatio:](self, "configForAspectRatio:", a3);
  if (!v6)
  {
    if (v5 == self->_resConfig)
    {
      v6 = 0;
    }
    else if (self->_modelEspresso)
    {
      v6 = -[VCPImageHumanPoseAnalyzer createModelWithHeight:srcWidth:](self, "createModelWithHeight:srcWidth:", self->_inputHeight, self->_inputWidth);
    }
    else
    {
      v6 = -108;
    }
  }

  return v6;
}

- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  int result;

  result = -50;
  if (a3 && a4)
  {
    if (a5)
    {
      result = 0;
      *a3 = self->_inputWidth;
      *a4 = self->_inputHeight;
      *a5 = 1111970369;
    }
  }
  return result;
}

- (int)parsePersons:(float)a3 width:(int)a4 height:(int)a5
{
  VCPCNNModelEspresso *modelEspresso;
  VCPImageHumanPoseAnalyzer *v8;
  float *heatmapNms;
  int v10;
  int v12;
  uint64_t v13;
  float *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float *v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  float v33;
  id v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  uint64_t v40;
  int v41;
  void *v42;
  float v43;
  float v44;
  float v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  float v50;
  float v51;
  void *v52;
  void *v53;
  float v54;
  float v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  float v61;
  void *v62;
  void *v63;
  float v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  uint64_t v78;
  int v79;
  unint64_t j;
  void *v81;
  void *v82;
  float v83;
  _BOOL4 v84;
  void *v85;
  int v86;
  void *v87;
  int v88;
  double v89;
  char *v90;
  float v91;
  uint64_t v92;
  float v93;
  double v94;
  uint64_t v95;
  uint64_t k;
  float v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  char *__src;
  int v105;
  void *v106;
  VCPImageHumanPoseAnalyzer *v107;
  unsigned int v108;
  id obj;
  NSMutableArray *obja;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t i;
  void *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  char *v127;
  _QWORD v128[3];
  _BYTE v129[128];
  _QWORD v130[3];
  _QWORD v131[2];
  _QWORD v132[3];
  _QWORD v133[2];
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  modelEspresso = self->_modelEspresso;
  if (!modelEspresso)
    return -18;
  v107 = self;
  -[VCPCNNModelEspresso outputBlob](modelEspresso, "outputBlob");
  __src = v127;
  if (!v127)
    return -18;
  v8 = v107;
  heatmapNms = v107->_heatmapNms;
  v105 = a5 * a4;
  if (!heatmapNms)
  {
    heatmapNms = (float *)operator new[]();
    v8 = v107;
    v107->_heatmapNms = heatmapNms;
  }
  memcpy(heatmapNms, __src, 68 * a5 * a4);
  v12 = 0;
  v13 = 0;
  v14 = v8->_heatmapNms;
  v15 = a4;
  v16 = 4 * a4;
  LODWORD(v17) = -1.0;
  do
  {
    if (a5 >= 1)
    {
      v18 = 0;
      LODWORD(v19) = 0;
      v20 = (uint64_t)&v14[v12 - 3 + -3 * a4];
      v21 = &v14[v105 * (int)v13];
      do
      {
        if (a4 >= 1)
        {
          v22 = 0;
          v19 = (int)v19;
          v23 = v20;
          do
          {
            v24 = v21[v19];
            if (v24 >= a3)
            {
              v25 = -3;
              v26 = v23;
              do
              {
                v27 = 0;
                v29 = v25 + v18 >= 0 && v25 + v18 < a5;
                while (!v29 || v22 + v27 - 3 < 0 || v22 + v27 - 3 >= a4 || *(float *)(v26 + 4 * v27) <= v24)
                {
                  if (++v27 == 7)
                    goto LABEL_29;
                }
                v24 = v24 + -1.0;
                v21[v19] = v24;
LABEL_29:
                ++v25;
                v26 += v16;
              }
              while (v25 != 4);
            }
            else
            {
              v21[v19] = v24 + -1.0;
            }
            ++v22;
            ++v19;
            v23 += 4;
          }
          while (v22 != a4);
        }
        ++v18;
        v20 += v16;
      }
      while (v18 != a5);
    }
    ++v13;
    v12 += v105;
  }
  while (v13 != 17);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v17);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  obj = 0;
  do
  {
    if (a5 < 1)
      goto LABEL_63;
    v30 = 0;
    v108 = 0;
    v115 = (uint64_t)&v107->_heatmapNms[v105 * (int)obj];
    do
    {
      if (a4 < 1)
        goto LABEL_62;
      v31 = 0;
      v32 = v30;
      do
      {
        if (*(float *)(v115 + 4 * v32) <= a3)
          goto LABEL_60;
        v113 = v32;
        v33 = *(float *)&__src[4 * v105 * ((int)obj + 17) + 4 * v32];
        v125 = 0u;
        v126 = 0u;
        v123 = 0u;
        v124 = 0u;
        v34 = v106;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v123, v134, 16);
        v111 = v31;
        if (v35)
        {
          v36 = 0;
          v37 = *(_QWORD *)v124;
          LODWORD(v38) = -1;
          v39 = 3.4028e38;
          do
          {
            v40 = 0;
            v41 = v36;
            v36 += v35;
            do
            {
              if (*(_QWORD *)v124 != v37)
                objc_enumerationMutation(v34);
              objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * v40), "objectAtIndexedSubscript:", 0);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "floatValue");
              v44 = v43;

              v45 = vabds_f32(v33, v44);
              if (v45 >= v39)
                v38 = v38;
              else
                v38 = (v41 + v40);
              if (v45 < v39)
                v39 = v45;
              ++v40;
            }
            while (v35 != v40);
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v123, v134, 16);
          }
          while (v35);

          if ((v38 & 0x80000000) == 0 && v39 < 0.3)
          {
            -[NSMutableArray objectAtIndexedSubscript:](v107->_persons, "objectAtIndexedSubscript:", v38);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectAtIndexedSubscript:", v38);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "objectAtIndexedSubscript:", 0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "floatValue");
            v51 = v50;

            objc_msgSend(v34, "objectAtIndexedSubscript:", v38);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "objectAtIndexedSubscript:", 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "floatValue");
            v55 = v54;

            *(float *)&v56 = (float)(v33 + (float)(v51 * v55)) / (float)(v55 + 1.0);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v133[0] = v57;
            *(float *)&v58 = v55 + 1.0;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v133[1] = v59;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 2);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:atIndexedSubscript:", v60, v38);

            v61 = *(float *)(v115 + 4 * v113);
            objc_msgSend(v47, "objectAtIndexedSubscript:", obj);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectAtIndexedSubscript:", 2);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "floatValue");
            LODWORD(v59) = v61 > v64;

            if ((_DWORD)v59)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v111);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v132[0] = v65;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v108);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v132[1] = v66;
              LODWORD(v67) = *(_DWORD *)(v115 + 4 * v113);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v132[2] = v68;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 3);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "setObject:atIndexedSubscript:", v69, obj);

            }
            goto LABEL_59;
          }
        }
        else
        {

        }
        *(float *)&v46 = v33;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v131[0] = v70;
        v131[1] = &unk_1E6B72000;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 2);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v71);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 17;
        do
        {
          objc_msgSend(v47, "addObject:", &unk_1E6B769F8);
          --v72;
        }
        while (v72);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v111);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v130[0] = v73;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v108);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v130[1] = v74;
        LODWORD(v75) = *(_DWORD *)(v115 + 4 * v113);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v130[2] = v76;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 3);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:atIndexedSubscript:", v77, obj);

        -[NSMutableArray addObject:](v107->_persons, "addObject:", v47);
LABEL_59:

        v32 = v113;
        v31 = v111;
LABEL_60:
        ++v31;
        ++v32;
      }
      while (v31 != a4);
      v30 = v32;
LABEL_62:
      ++v108;
    }
    while (v108 != a5);
LABEL_63:
    obj = (char *)obj + 1;
  }
  while (obj != (id)17);
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  obja = v107->_persons;
  v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
  if (v78)
  {
    v112 = v78;
    v114 = *(_QWORD *)v120;
    while (2)
    {
      for (i = 0; i != v112; ++i)
      {
        if (*(_QWORD *)v120 != v114)
          objc_enumerationMutation(obja);
        v118 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
        if (objc_msgSend(v118, "count") != 17)
        {
          v10 = -18;
          goto LABEL_90;
        }
        v79 = 0;
        for (j = 0; objc_msgSend(v118, "count") > j; ++j)
        {
          objc_msgSend(v118, "objectAtIndexedSubscript:", j);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "objectAtIndexedSubscript:", 2);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "floatValue");
          v84 = v83 > 0.1;

          if (v84)
          {
            objc_msgSend(v81, "objectAtIndexedSubscript:", 0);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v85, "intValue");

            objc_msgSend(v81, "objectAtIndexedSubscript:", 1);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v87, "intValue");

            v90 = &__src[4 * v15 * (v88 - 3) + 4 * v86 + 4 * v79];
            v91 = 0.0;
            v92 = -3;
            v93 = 0.0;
            LODWORD(v94) = 0;
            do
            {
              v95 = v92 + v88;
              *(float *)&v89 = (float)(v92 + v88);
              for (k = -3; k != 4; ++k)
              {
                if ((v95 & 0x8000000000000000) == 0
                  && v95 < a5
                  && ((v86 + k) & 0x8000000000000000) == 0
                  && v86 + k < v15)
                {
                  v97 = *(float *)&v90[4 * k];
                  if (v97 > 0.05)
                  {
                    v91 = v91 + v97;
                    *(float *)&v94 = *(float *)&v94 + (float)(v97 * (float)(v86 + k));
                    v93 = v93 + (float)(v97 * *(float *)&v89);
                  }
                }
              }
              ++v92;
              v90 += 4 * v15;
            }
            while (v92 != 4);
            if (v91 > 0.0)
            {
              *(float *)&v94 = (float)(*(float *)&v94 / v91) + 0.5;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v94, v89);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v128[0] = v98;
              *(float *)&v99 = (float)(v93 / v91) + 0.5;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v99);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v128[1] = v100;
              objc_msgSend(v81, "objectAtIndexedSubscript:", 2);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v128[2] = v101;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 3);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "setObject:atIndexedSubscript:", v102, j);

            }
          }

          v79 += v105;
        }
      }
      v112 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
      if (v112)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_90:

  return v10;
}

- (int)processPersons:(float)a3 width:(int)a4 height:(int)a5
{
  float v8;
  double v9;
  unint64_t v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  float v39;
  void *v40;
  void *v41;
  float v42;
  void *v43;
  void *v44;
  float v45;
  void *v46;
  void *v47;
  float v48;
  void *v49;
  void *v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  double v56;
  double v57;
  double v58;
  double v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  NSMutableArray *results;
  void *v73;
  void *v74;
  int v75;
  float v77;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  NSMutableArray *obj;
  uint64_t i;
  float v84;
  float v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[3];
  _BYTE v94[128];
  uint64_t v95;
  NSRect v96;

  v95 = *MEMORY[0x1E0C80C00];
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = self->_persons;
  v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
  if (v79)
  {
    v77 = a3;
    v84 = (float)a5;
    v85 = (float)a4;
    v81 = *(_QWORD *)v88;
    v8 = 1.0;
    HIDWORD(v9) = 1072850534;
    while (2)
    {
      for (i = 0; i != v79; ++i)
      {
        if (*(_QWORD *)v88 != v81)
          objc_enumerationMutation(obj);
        v86 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
        LODWORD(v9) = 1036831949;
        v80 = +[VCPHuman flagsFromKeypoints:withMinConfidence:](VCPHuman, "flagsFromKeypoints:withMinConfidence:", v9);
        v10 = 0;
        v11 = 1.0;
        v12 = 0.0;
        v13 = 0.0;
        v14 = 1.0;
        v15 = 0.0;
        v16 = 0.0;
        while (objc_msgSend(v86, "count") > v10)
        {
          objc_msgSend(v86, "objectAtIndexedSubscript:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count") == 3;

          if (!v18)
          {
            v75 = -18;
            goto LABEL_49;
          }
          v19 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v86, "objectAtIndexedSubscript:", v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "floatValue");
          *(float *)&v23 = v22 / v85;
          objc_msgSend(v19, "numberWithFloat:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v93[0] = v24;
          v25 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v86, "objectAtIndexedSubscript:", v10);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "floatValue");
          *(float *)&v29 = v8 - (float)(v28 / v84);
          objc_msgSend(v25, "numberWithFloat:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v93[1] = v30;
          objc_msgSend(v86, "objectAtIndexedSubscript:", v10);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectAtIndexedSubscript:", 2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v93[2] = v32;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 3);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "setObject:atIndexedSubscript:", v33, v10);

          objc_msgSend(v86, "objectAtIndexedSubscript:", v10);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndexedSubscript:", 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "floatValue");
          LODWORD(v31) = v36 > 0.1;

          if ((_DWORD)v31)
          {
            objc_msgSend(v86, "objectAtIndexedSubscript:", v10);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "floatValue");
            if (v14 >= v39)
              v14 = v39;

            objc_msgSend(v86, "objectAtIndexedSubscript:", v10);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "objectAtIndexedSubscript:", 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "floatValue");
            if (v11 >= v42)
              v11 = v42;

            objc_msgSend(v86, "objectAtIndexedSubscript:", v10);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "floatValue");
            if (v45 >= v13)
              v13 = v45;

            objc_msgSend(v86, "objectAtIndexedSubscript:", v10);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectAtIndexedSubscript:", 1);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "floatValue");
            if (v48 >= v12)
              v12 = v48;

            objc_msgSend(v86, "objectAtIndexedSubscript:", v10);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "objectAtIndexedSubscript:", 2);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "floatValue");
            v52 = v51;

            v16 = v16 + v52;
            v15 = v15 + v8;
          }
          ++v10;
        }
        if ((float)(v13 - v14) != 0.0 && (float)(v12 - v11) != 0.0 && v15 > 4.0 && (v80 & 0xFFFFFFFFFFEFFFFFLL) != 0)
        {
          v53 = vabds_f32(v13, v14);
          v54 = vabds_f32(v12, v11);
          v55 = v53 >= v54 ? v53 : v54;
          if (v55 > 0.1)
          {
            v56 = v14;
            v57 = v11;
            v58 = v53;
            v59 = v54;
            v60 = v16 / v15;
            v61 = v14 - v58 * 0.150000006;
            v62 = v61 >= 0.0 ? v14 - v58 * 0.150000006 : 0.0;
            v63 = v57 - v59 * 0.150000006;
            v64 = v63 >= 0.0 ? v57 - v59 * 0.150000006 : 0.0;
            v65 = v56 + v58 * 1.14999998;
            v66 = v65 <= 1.0 ? v65 : 1.0;
            v9 = v57 + v59 * 1.14999998;
            *(float *)&v9 = v9;
            v8 = 1.0;
            v67 = *(float *)&v9 <= 1.0 ? *(float *)&v9 : 1.0;
            if (v60 > v77)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v96.origin.x = v62;
              v96.origin.y = v64;
              v96.size.width = (float)(v66 - v62);
              v96.size.height = (float)(v67 - v64);
              NSStringFromRect(v96);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "setObject:forKeyedSubscript:", v69, CFSTR("humanBounds"));

              *(float *)&v70 = v60;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "setObject:forKeyedSubscript:", v71, CFSTR("humanConfidence"));

              if (self->_saveKeypoints)
                objc_msgSend(v68, "setObject:forKeyedSubscript:", v86, CFSTR("humanKeypoints"));
              results = self->_results;
              v91[0] = CFSTR("flags");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v80);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v91[1] = CFSTR("attributes");
              v92[0] = v73;
              v92[1] = v68;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](results, "addObject:", v74);

            }
          }
        }
      }
      v75 = 0;
      v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v94, 16);
      if (v79)
        continue;
      break;
    }
  }
  else
  {
    v75 = 0;
  }
LABEL_49:

  return v75;
}

- (int)generateHumanPose:(__CVBuffer *)a3
{
  int result;
  double v5;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  unsigned int v11;
  unsigned int v12;

  result = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", self->_inputData);
  if (!result)
  {
    modelEspresso = self->_modelEspresso;
    if (modelEspresso)
    {
      -[VCPCNNModelEspresso outputBlob](modelEspresso, "outputBlob");
      v7 = self->_modelEspresso;
      v8 = v11;
      if (v7)
      {
        -[VCPCNNModelEspresso outputBlob](v7, "outputBlob");
        v9 = v12;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
      v8 = 0;
    }
    LODWORD(v5) = 1036831949;
    result = -[VCPImageHumanPoseAnalyzer parsePersons:width:height:](self, "parsePersons:width:height:", v8, v9, v5);
    if (!result)
    {
      LODWORD(v10) = 1036831949;
      return -[VCPImageHumanPoseAnalyzer processPersons:width:height:](self, "processPersons:width:height:", v8, v9, v10);
    }
  }
  return result;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 withChannels:(int)a5
{
  int Width;
  int Height;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *BaseAddress;
  int BytesPerRow;
  float v29;
  int v30;
  float *v31;
  float *v32;
  uint64_t v33;
  uint64_t i;
  unsigned int v35;
  unsigned int v36;
  int v37;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;

  if (a5 != 3 || CVPixelBufferGetPixelFormatType(a3) != 1111970369)
  {
LABEL_9:
    LODWORD(v11) = -50;
    return v11;
  }
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  pixelBuffer = a3;
  unlockFlags = 1;
  if (!a3)
  {
    v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v18)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_9;
  }
  v9 = Height;
  v10 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  v37 = v10;
  if ((_DWORD)v10)
  {
    v11 = v10;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[VCPImageConverter convertImage:yuvFrame:].cold.3((uint64_t)a3, v11, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    bzero(a4, 3 * 4 * Width * v9);
    if (v9 >= 1)
    {
      v30 = 0;
      v31 = &a4[2 * v9 * Width];
      v32 = &a4[v9 * Width];
      v33 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (i = 0; i != Width; ++i)
          {
            LOBYTE(v29) = BaseAddress[(int)(i * 4) + 2];
            *(float *)&v35 = (float)LODWORD(v29) / 255.0;
            a4[i] = *(float *)&v35;
            LOBYTE(v35) = BaseAddress[(int)(i * 4) + 1];
            *(float *)&v36 = (float)v35 / 255.0;
            v32[i] = *(float *)&v36;
            LOBYTE(v36) = BaseAddress[(int)(i * 4)];
            v29 = (float)v36 / 255.0;
            v31[i] = v29;
          }
        }
        BaseAddress += BytesPerRow;
        ++v30;
        v31 = (float *)((char *)v31 + v33);
        v32 = (float *)((char *)v32 + v33);
        a4 = (float *)((char *)a4 + v33);
      }
      while (v30 != v9);
    }
    LODWORD(v11) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v37);
    if (pixelBuffer
      && !v37
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
    }
  }
  return v11;
}

- (int)createModelWithHeight:(int)a3 srcWidth:(int)a4
{
  float *inputData;
  float *heatmapNms;
  int result;
  VCPCNNModelEspresso *modelEspresso;
  VCPCNNModelEspresso *v9;
  VCPCNNModelEspresso *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  size_t v14;
  float *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  inputData = self->_inputData;
  if (inputData)
  {
    MEMORY[0x1BCCA128C](inputData, 0x1000C8052888210, *(_QWORD *)&a3, *(_QWORD *)&a4);
    self->_inputData = 0;
  }
  heatmapNms = self->_heatmapNms;
  if (heatmapNms)
  {
    MEMORY[0x1BCCA128C](heatmapNms, 0x1000C8052888210, *(_QWORD *)&a3, *(_QWORD *)&a4);
    self->_heatmapNms = 0;
  }
  result = -[VCPCNNModelEspresso prepareModelWithConfig:](self->_modelEspresso, "prepareModelWithConfig:", self->_resConfig, *(_QWORD *)&a4);
  if (!result)
  {
    modelEspresso = self->_modelEspresso;
    if (modelEspresso
      && (-[VCPCNNModelEspresso inputBlob](modelEspresso, "inputBlob"), (v9 = self->_modelEspresso) != 0))
    {
      -[VCPCNNModelEspresso inputBlob](v9, "inputBlob");
      v10 = self->_modelEspresso;
      v11 = v17 * v18;
      if (v10)
      {
        -[VCPCNNModelEspresso inputBlob](v10, "inputBlob");
        v12 = v16;
LABEL_12:
        v13 = v11 * v12;
        if (v13 >> 62)
          v14 = -1;
        else
          v14 = 4 * v13;
        v15 = (float *)operator new[](v14, MEMORY[0x1E0DE4E10]);
        self->_inputData = v15;
        if (v15)
          return 0;
        else
          return -108;
      }
    }
    else
    {
      v11 = 0;
    }
    v12 = 0;
    goto LABEL_12;
  }
  return result;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 modelInputHeight:(int)a5 modelInputWidth:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  int Width;
  int Height;
  CFTypeRef v13;
  int v14;
  int v15;
  CFTypeRef cf;

  if (!a3)
    return -108;
  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  cf = 0;
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  if (CVPixelBufferGetPixelFormatType(a4) == 1111970369 && Width == (_DWORD)v6 && Height == (_DWORD)v7)
  {
    v13 = CFRetain(a4);
    cf = v13;
  }
  else
  {
    Scaler::Scale(&self->_scaler, a4, (__CVBuffer **)&cf, v6, v7, 1111970369);
    v14 = v15;
    if (v15)
      goto LABEL_10;
    v13 = cf;
  }
  v14 = -[VCPImageHumanPoseAnalyzer copyImage:toData:withChannels:](self, "copyImage:toData:withChannels:", v13, a3, 3);
LABEL_10:
  if (cf)
    CFRelease(cf);
  return v14;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  uint64_t (**v9)(_QWORD);
  uint64_t v10;
  int v11;
  void *v12;
  int Width;
  int Height;
  int v15;
  VCPCNNModelEspresso *modelEspresso;
  int v17;
  NSMutableArray *results;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = (uint64_t (**)(_QWORD))a6;
  -[NSMutableArray removeAllObjects](self->_persons, "removeAllObjects");
  v10 = -[NSMutableArray removeAllObjects](self->_results, "removeAllObjects");
  *a5 = 0;
  if (v9)
  {
    v10 = v9[2](v9);
    if ((v10 & 1) != 0)
    {
      v11 = -128;
      goto LABEL_22;
    }
  }
  v12 = (void *)MEMORY[0x1BCCA1B2C](v10);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (!self->_flushModel
    || self->_modelEspresso
    || (v11 = -[VCPImageHumanPoseAnalyzer reInitModel](self, "reInitModel")) == 0)
  {
    if (Height >= Width)
      v15 = Width;
    else
      v15 = Height;
    if (v15 >= 64)
    {
      v11 = -[VCPImageHumanPoseAnalyzer createInput:withBuffer:modelInputHeight:modelInputWidth:](self, "createInput:withBuffer:modelInputHeight:modelInputWidth:", self->_inputData, a3, self->_inputHeight, self->_inputWidth);
      if (!v11)
      {
        v11 = -[VCPImageHumanPoseAnalyzer generateHumanPose:](self, "generateHumanPose:", a3);
        if (!v11)
        {
          if (self->_flushModel)
          {
            modelEspresso = self->_modelEspresso;
            if (modelEspresso)
            {
              self->_modelEspresso = 0;

            }
          }
          v11 = 0;
          v17 = 1;
          goto LABEL_19;
        }
      }
    }
    else
    {
      v11 = 0;
    }
  }
  v17 = 0;
LABEL_19:
  objc_autoreleasePoolPop(v12);
  if (v17 && -[NSMutableArray count](self->_results, "count"))
  {
    results = self->_results;
    v20 = CFSTR("HumanPoseResults");
    v21[0] = results;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:

  return v11;
}

- (BOOL)trackingMode
{
  return self->_trackingMode;
}

- (void)setTrackingMode:(BOOL)a3
{
  self->_trackingMode = a3;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_netFileUrl, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 16) = 0;
  *((_DWORD *)self + 34) = 0;
  return self;
}

@end
