@implementation VNGenerateSemanticSegmentationCompoundRequest

- (VNGenerateSemanticSegmentationCompoundRequest)initWithOriginalRequests:(id)a3
{
  id v4;
  VNGenerateSemanticSegmentationCompoundRequest *v5;
  void *v6;
  int64_t v7;
  BOOL v8;
  id v9;
  void *v10;
  VNGenerateSemanticSegmentationCompoundRequest *v11;
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNGenerateSemanticSegmentationCompoundRequest;
  v5 = -[VNCompoundRequest initWithOriginalRequests:](&v14, sel_initWithOriginalRequests_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:](VNGenerateSemanticSegmentationCompoundRequest, "compoundRequestRevisionForRequest:", v6);

    v13 = 0;
    v8 = -[VNRequest setRevision:error:](v5, "setRevision:error:", v7, &v13);
    v9 = v13;
    if (v8)
    {
      -[VNRequest configuration](v5, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setResolvedRevision:", v7);
      v11 = v5;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  unint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  int v18;
  uint64_t v19;
  id v20;
  __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  id v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  __CFString *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  __CFString *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id obj;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  objc_super v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v106.receiver = self;
  v106.super_class = (Class)VNGenerateSemanticSegmentationCompoundRequest;
  v70 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v106, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v6 = 0x1E0C99000uLL;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = (void *)objc_opt_class();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(1, v9);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(2, v9);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(4, v9);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(8, v9);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(16, v9);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(32, v9);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(64, v9);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(1, v10);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(2, v10);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(4, v10);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(8, v10);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(16, v10);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(32, v10);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(64, v10);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(128, v10);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(256, v10);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 1uLL:
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v85);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v83);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v81);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v77);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v76);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v75);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v73);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v85);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v83);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v81);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v77);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v76);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v75);
      v11 = v73;
      goto LABEL_14;
    case 2uLL:
      +[VNPersonSegmentationGeneratorInstanceBased4People outputMaskBlobNames](VNPersonSegmentationGeneratorInstanceBased4People, "outputMaskBlobNames");
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v103;
        v15 = MEMORY[0x1E0C9AAA0];
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v103 != v14)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i);
            objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v17, v70);
            objc_msgSend(v8, "setObject:forKey:", v15, v17);
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
        }
        while (v13);
      }

      v6 = 0x1E0C99000;
      break;
    case 3uLL:
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v86);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v84);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v82);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v80);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v78);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v79);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v74);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v71);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E459D090, v72);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v86);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v84);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v82);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v80);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v78);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v79);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v74);
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v71);
      v11 = v72;
LABEL_14:
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v11, v70);
      break;
  }
  v90 = objc_alloc_init(*(Class *)(v6 + 3592));
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  -[VNCompoundRequest originalRequests](self, "originalRequests");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
  if (!v91)
  {
    v88 = 0;
    v18 = 0;
    goto LABEL_63;
  }
  v88 = 0;
  v89 = *(_QWORD *)v99;
  v18 = 0;
  do
  {
    v92 = 0;
    do
    {
      if (*(_QWORD *)v99 != v89)
        objc_enumerationMutation(obj);
      v93 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v92);
      v19 = objc_msgSend(v93, "resolvedRevision", v70);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v93;
        v21 = CFSTR("VNSegmentationGeneratorProcessOption_PersonSegmentationDetectorOriginatingRequestSpecifier");
        switch(v19)
        {
          case 1:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "outputPixelFormat"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v34, v85);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNGeneratePersonSegmentationRequest keepRawOutputMask](v20));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v35, v85);

            break;
          case 3737841664:
            +[VNPersonSegmentationGeneratorInstanceBased4People outputMaskBlobNames](VNPersonSegmentationGeneratorInstanceBased4People, "outputMaskBlobNames");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = 0u;
            v97 = 0u;
            v94 = 0u;
            v95 = 0u;
            v37 = v36;
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
            if (v38)
            {
              v39 = *(_QWORD *)v95;
              do
              {
                for (j = 0; j != v38; ++j)
                {
                  if (*(_QWORD *)v95 != v39)
                    objc_enumerationMutation(v37);
                  v41 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * j);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "outputPixelFormat"));
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "setObject:forKey:", v42, v41);

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNGeneratePersonSegmentationRequest keepRawOutputMask](v20));
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "setObject:forKey:", v43, v41);

                }
                v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
              }
              while (v38);
            }

            objc_msgSend(v20, "minimumConfidence");
            v18 = v44;

            break;
          case 3737841665:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "outputPixelFormat"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, v86);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNGeneratePersonSegmentationRequest keepRawOutputMask](v20));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, v86);

            v88 |= 1uLL;
            break;
        }
        v27 = CFSTR("VNSegmentationGeneratorProcessOption_PersonSegmentationDetectorOriginatingRequestSpecifier");
        goto LABEL_43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = CFSTR("VNSegmentationGeneratorProcessOption_SkySegmentationDetectorOriginatingRequestSpecifier");
        if (v19 == 3737841664)
        {
          v49 = v93;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v49, "outputPixelFormat"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v50, v84);

          objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v84);
          v88 |= 2uLL;
          v27 = CFSTR("VNSegmentationGeneratorProcessOption_SkySegmentationDetectorOriginatingRequestSpecifier");
          goto LABEL_43;
        }
        if (v19 == 1)
        {
          v25 = v93;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v25, "outputPixelFormat"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, v83);

          objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v83);
          v27 = CFSTR("VNSegmentationGeneratorProcessOption_SkySegmentationDetectorOriginatingRequestSpecifier");
LABEL_43:

          goto LABEL_44;
        }
        v27 = CFSTR("VNSegmentationGeneratorProcessOption_SkySegmentationDetectorOriginatingRequestSpecifier");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = CFSTR("VNSegmentationGeneratorProcessOption_HumanAttributesSegmentationDetectorOriginatingRequestSpecifier");
          if (v19 == 3737841664)
          {
            v55 = v93;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v55, "outputPixelFormat"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v56, v82);

            objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v82);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v55, "outputPixelFormat"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v57, v80);

            objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v80);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v55, "outputPixelFormat"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v58, v78);

            objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v78);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v55, "outputPixelFormat"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v59, v79);

            objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v79);
            v88 |= 0x3CuLL;
            v27 = CFSTR("VNSegmentationGeneratorProcessOption_HumanAttributesSegmentationDetectorOriginatingRequestSpecifier");
            goto LABEL_43;
          }
          if (v19 == 1)
          {
            v29 = v93;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v29, "outputPixelFormat"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, v81);

            objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v81);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v29, "outputPixelFormat"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, v77);

            objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v77);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v29, "outputPixelFormat"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, v76);

            objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v76);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v29, "outputPixelFormat"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, v75);

            objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v75);
            v27 = CFSTR("VNSegmentationGeneratorProcessOption_HumanAttributesSegmentationDetectorOriginatingRequestSpecifier");
            goto LABEL_43;
          }
          v27 = CFSTR("VNSegmentationGeneratorProcessOption_HumanAttributesSegmentationDetectorOriginatingRequestSpecifier");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v46 = CFSTR("VNSegmentationGeneratorProcessOption_GlassesSegmentationDetectorOriginatingRequestSpecifier");
            if (v19 == 3737841664)
            {
              v60 = v93;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v60, "outputPixelFormat"));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v61, v74);

              objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v74);
              v88 |= 0x40uLL;
              v27 = CFSTR("VNSegmentationGeneratorProcessOption_GlassesSegmentationDetectorOriginatingRequestSpecifier");
              goto LABEL_43;
            }
            if (v19 == 1)
            {
              v47 = v93;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v47, "outputPixelFormat"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v48, v73);

              objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v73);
              v27 = CFSTR("VNSegmentationGeneratorProcessOption_GlassesSegmentationDetectorOriginatingRequestSpecifier");
              goto LABEL_43;
            }
            v27 = CFSTR("VNSegmentationGeneratorProcessOption_GlassesSegmentationDetectorOriginatingRequestSpecifier");
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = CFSTR("VNSegmentationGeneratorProcessOption_AnimalSegmentationDetectorOriginatingRequestSpecifier");
              v51 = CFSTR("VNSegmentationGeneratorProcessOption_AnimalSegmentationDetectorOriginatingRequestSpecifier");
              if (v19 == 1)
              {
                v52 = v93;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v52, "outputPixelFormat"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v53, v71);

                objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v71);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v52, "outputPixelFormat"));
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v54, v72);

                objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v72);
                v88 |= 0x180uLL;
                v27 = CFSTR("VNSegmentationGeneratorProcessOption_AnimalSegmentationDetectorOriginatingRequestSpecifier");
                goto LABEL_43;
              }
            }
            else
            {
              v27 = 0;
            }
          }
        }
      }
LABEL_44:
      objc_msgSend(v93, "originatingRequestSpecifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "setObject:forKey:", v45, v27);

      ++v92;
    }
    while (v92 != v91);
    v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
    v91 = v62;
  }
  while (v62);
LABEL_63:

  v63 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v63, CFSTR("VNSegmentationGeneratorProcessOption_OutputPixelFormat"));

  v64 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v64, CFSTR("VNSegmentationGeneratorProcessOption_KeepRawOutputMask"));

  LODWORD(v65) = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v66, CFSTR("VNSegmentationGeneratorProcessOption_MinimumConfidence"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v88);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v67, CFSTR("VNSegmentationGeneratorProcessOption_ObjectClassIDs"));

  v68 = (void *)objc_msgSend(v90, "copy");
  objc_msgSend(v70, "setObject:forKeyedSubscript:", v68, CFSTR("VNSegmentationGeneratorProcessOption_OriginalRequestSpecifiers"));

  return v70;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 - 1 < 2)
  {
    v4 = CFSTR("VNSegmentationGeneratorType");
LABEL_5:
    v5 = v4;
    return v4;
  }
  if (a3 == 3)
  {
    v4 = CFSTR("VNE5RTSemanticSegmentationMultiGeneratorType");
    goto LABEL_5;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  uint64_t v25;
  id obj;
  _QWORD aBlock[5];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v23 = a4;
  objc_msgSend(v23, "session");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "imageBufferAndReturnError:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && -[VNRequest validateImageBuffer:ofNonZeroWidth:andHeight:error:](self, "validateImageBuffer:ofNonZeroWidth:andHeight:error:", v8, 0, 0, a5))
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__30091;
    v37 = __Block_byref_object_dispose__30092;
    v38 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__VNGenerateSemanticSegmentationCompoundRequest_internalPerformRevision_inContext_error___block_invoke;
    aBlock[3] = &unk_1E4548BB8;
    aBlock[4] = self;
    v32 = a3;
    v28 = v24;
    v20 = v8;
    v29 = v8;
    v31 = &v33;
    v9 = v23;
    v30 = v9;
    v21 = _Block_copy(aBlock);
    v22 = VNExecuteBlock(v21, (uint64_t)a5);
    if ((v22 & 1) != 0)
    {
      -[VNCompoundRequest recordWarningsInOriginalRequests](self, "recordWarningsInOriginalRequests");
      v10 = (id)v34[5];
      v11 = v9;
      if (self)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        -[VNCompoundRequest originalRequests](self, "originalRequests");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        obj = v12;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v40;
          v25 = *MEMORY[0x1E0C99768];
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v40 != v14)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              +[VNE5RTSemanticSegmentationMultiGenerator requestInfoForRequest:](VNE5RTSemanticSegmentationMultiGenerator, "requestInfoForRequest:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v17)
                objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v25, CFSTR("The request class %@ shall have it's results populated in the results array"), objc_opt_class());
              objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v17, "originalRequestResultsIndex"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setResults:", v18);

              objc_msgSend(v11, "cacheObservationsOfRequest:", v16);
            }
            v12 = obj;
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
          }
          while (v13);
        }

      }
    }

    _Block_object_dispose(&v33, 8);
    v8 = v20;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

BOOL __89__VNGenerateSemanticSegmentationCompoundRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  objc_msgSend(*(id *)(a1 + 32), "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v13, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v4)
  {
    v14[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

    v7 = objc_msgSend(*(id *)(a1 + 56), "qosClass");
    objc_msgSend(*(id *)(a1 + 32), "regionOfInterest");
    objc_msgSend(v4, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v7, v5, *(_QWORD *)(a1 + 32), a2, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __101__VNGenerateSemanticSegmentationCompoundRequest_newDefaultDetectorOptionsForRequestRevision_session___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "objectClassOutputNamesForObjectClassIDs:error:", a1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cannot find output name for %lu"), a1);
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", v3 != 0, v4);
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int64_t)compoundRequestRevisionForRequest:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  if (+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::onceToken != -1)
    dispatch_once(&+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::onceToken, &__block_literal_global_30131);
  objc_msgSend((id)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision, "objectForKey:", objc_msgSend(v3, "frameworkClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(v3, "resolvedRevision");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = objc_msgSend(v7, "unsignedIntegerValue");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)compoundRequestsForOriginalRequests:(id)a3 withPerformingContext:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v34;
  id obj;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v34;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
              }
            }
          }
        }
        v11 = v10;
        v12 = objc_msgSend(v11, "qualityLevel") == 1;

        if (v12)
        {
          v13 = objc_msgSend(a1, "compoundRequestRevisionForRequest:", v10);
          if (!v13)
          {
            if (a5)
            {
              v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("VNGenerateSemanticSegmentationCompoundRequest unimplemented revision/options for %@"), v10);
              +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v32);
              *a5 = (id)objc_claimAutoreleasedReturnValue();

            }
            v30 = 0;
            v31 = obj;
            goto LABEL_33;
          }
          objc_msgSend(v10, "regionOfInterest");
          v18 = v17;
          if (v17 == 0.0)
            v18 = 0.0;
          v19 = v14;
          if (v14 == 0.0)
            v19 = 0.0;
          v20 = *(_QWORD *)&v19 ^ __ROR8__(*(_QWORD *)&v18, 51);
          v21 = v15;
          if (v15 == 0.0)
            v21 = 0.0;
          v22 = *(_QWORD *)&v21 ^ __ROR8__(v20, 51);
          v23 = v16;
          if (v16 == 0.0)
            v23 = 0.0;
          v24 = *(_QWORD *)&v23 ^ __ROR8__(v22, 51) ^ __ROR8__(v13, 51);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
          {
            v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, v28);

            v26 = v27;
          }
          objc_msgSend(v26, "addObject:", v10);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (objc_msgSend(v6, "count"))
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __113__VNGenerateSemanticSegmentationCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke;
    v37[3] = &unk_1E4548688;
    v30 = v29;
    v38 = v30;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v37);
    v31 = v38;
LABEL_33:

  }
  else
  {
    v30 = (id)MEMORY[0x1E0C9AA60];
  }

  return v30;
}

+ (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v5;
  VNGeneratePersonSegmentationRequest *v6;
  VNGenerateSkySegmentationRequest *v7;
  VNGenerateHumanAttributesSegmentationRequest *v8;
  VNGenerateGlassesSegmentationRequest *v9;
  void *v10;
  VNRequestPerformer *v11;
  VNRequestPerformingContext *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  BOOL v19;
  VNGenerateSkySegmentationRequest *v21;
  VNGeneratePersonSegmentationRequest *v22;
  VNGenerateGlassesSegmentationRequest *v23;
  VNGenerateHumanAttributesSegmentationRequest *v24;
  VNGenerateAnimalSegmentationRequest *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[7];

  v31[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(VNGeneratePersonSegmentationRequest);
  v7 = objc_alloc_init(VNGenerateSkySegmentationRequest);
  v8 = objc_alloc_init(VNGenerateHumanAttributesSegmentationRequest);
  v9 = objc_alloc_init(VNGenerateGlassesSegmentationRequest);
  v31[0] = v6;
  v31[1] = v8;
  v31[2] = v7;
  v31[3] = v9;
  v25 = objc_alloc_init(VNGenerateAnimalSegmentationRequest);
  v31[4] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(VNRequestPerformer);
  v12 = -[VNRequestPerformingContext initWithSession:requestPerformer:imageBuffer:forensics:observationsCache:]([VNRequestPerformingContext alloc], "initWithSession:requestPerformer:imageBuffer:forensics:observationsCache:", v5, v11, 0, 0, 0);
  -[VNRequestPerformingContext qosClass](v12, "qosClass");
  +[VNGenerateSemanticSegmentationCompoundRequest compoundRequestsForOriginalRequests:withPerformingContext:error:](VNGenerateSemanticSegmentationCompoundRequest, "compoundRequestsForOriginalRequests:withPerformingContext:error:", v10, v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v23 = v9;
    v24 = v8;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v16)
    {
      v21 = v7;
      v22 = v6;
      v17 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v15);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "warmUpSession:error:", v5, a4) & 1) == 0)
          {
            v19 = 0;
            goto LABEL_12;
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v16)
          continue;
        break;
      }
      v19 = 1;
LABEL_12:
      v7 = v21;
      v6 = v22;
    }
    else
    {
      v19 = 1;
    }

    v9 = v23;
    v8 = v24;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __113__VNGenerateSemanticSegmentationCompoundRequest_compoundRequestsForOriginalRequests_withPerformingContext_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  VNGenerateSemanticSegmentationCompoundRequest *v4;
  id v5;

  v5 = a3;
  v4 = -[VNGenerateSemanticSegmentationCompoundRequest initWithOriginalRequests:]([VNGenerateSemanticSegmentationCompoundRequest alloc], "initWithOriginalRequests:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __83__VNGenerateSemanticSegmentationCompoundRequest_compoundRequestRevisionForRequest___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  +[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision = v0;

  v2 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v20[0] = &unk_1E459D018;
  v20[1] = &unk_1E459D030;
  v21[0] = &unk_1E459D018;
  v21[1] = &unk_1E459D048;
  v20[2] = &unk_1E459D060;
  v21[2] = &unk_1E459D078;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, objc_opt_class());

  v4 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v18[0] = &unk_1E459D018;
  v18[1] = &unk_1E459D030;
  v19[0] = &unk_1E459D018;
  v19[1] = &unk_1E459D078;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, objc_opt_class());

  v6 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v16[0] = &unk_1E459D018;
  v16[1] = &unk_1E459D030;
  v17[0] = &unk_1E459D018;
  v17[1] = &unk_1E459D078;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, objc_opt_class());

  v8 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v14[0] = &unk_1E459D018;
  v14[1] = &unk_1E459D030;
  v15[0] = &unk_1E459D018;
  v15[1] = &unk_1E459D078;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, objc_opt_class());

  v10 = (void *)+[VNGenerateSemanticSegmentationCompoundRequest compoundRequestRevisionForRequest:]::requestClassToDictionaryRequestRevisionToCompoundRequestRevision;
  v12 = &unk_1E459D018;
  v13 = &unk_1E459D078;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, objc_opt_class());

}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNGenerateSemanticSegmentationCompoundRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
