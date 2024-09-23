@implementation VCPVideoHumanActionAnalyzer

- (VCPVideoHumanActionAnalyzer)initWithTimeOfInterest:(id)a3 phFaces:(id)a4
{
  id v7;
  id v8;
  char *v9;
  VCPImageHumanPoseAnalyzer *v10;
  int HasANE;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  _OWORD *v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  VCPVideoHumanActionAnalyzer *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v48.receiver = self;
  v48.super_class = (Class)VCPVideoHumanActionAnalyzer;
  v9 = -[VCPVideoHumanActionAnalyzer init](&v48, sel_init);
  if (v9)
  {
    v10 = [VCPImageHumanPoseAnalyzer alloc];
    HasANE = DeviceHasANE();
    v12 = -[VCPImageHumanPoseAnalyzer initWithKeypointsOption:aspectRatio:lightweight:forceCPU:sharedModel:flushModel:](v10, "initWithKeypointsOption:aspectRatio:lightweight:forceCPU:sharedModel:flushModel:", 1, 0, HasANE ^ 1u, 0, 1, DeviceHasANE() ^ 1);
    v13 = (void *)*((_QWORD *)v9 + 1);
    *((_QWORD *)v9 + 1) = v12;

    v14 = MEMORY[0x1E0CA2E28];
    v15 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
    *((_OWORD *)v9 + 1) = *MEMORY[0x1E0CA2E28];
    *((_QWORD *)v9 + 4) = v15;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v9 + 8);
    *((_QWORD *)v9 + 8) = v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v9 + 16);
    *((_QWORD *)v9 + 16) = v18;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v9 + 17);
    *((_QWORD *)v9 + 17) = v20;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v9 + 18);
    *((_QWORD *)v9 + 18) = v22;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v9 + 19);
    *((_QWORD *)v9 + 19) = v24;

    *((_DWORD *)v9 + 18) = 0;
    v26 = MEMORY[0x1E0CA2E18];
    v27 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v9 + 92) = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *(_OWORD *)(v9 + 76) = v27;
    v28 = *(_QWORD *)(v26 + 16);
    *(_OWORD *)(v9 + 100) = *(_OWORD *)v26;
    *(_QWORD *)(v9 + 116) = v28;
    v29 = (_OWORD *)MEMORY[0x1E0C9D648];
    v30 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *((_OWORD *)v9 + 10) = *MEMORY[0x1E0C9D648];
    *((_OWORD *)v9 + 11) = v30;
    v31 = v29[1];
    *((_OWORD *)v9 + 12) = *v29;
    *((_OWORD *)v9 + 13) = v31;
    *((_DWORD *)v9 + 56) = 0;
    *((_DWORD *)v9 + 57) = 0;
    *((_DWORD *)v9 + 58) = 0;
    *((_DWORD *)v9 + 59) = 0;
    v32 = *(_QWORD *)(v26 + 16);
    *(_OWORD *)(v9 + 244) = *(_OWORD *)v26;
    *(_QWORD *)(v9 + 260) = v32;
    v33 = *(_QWORD *)(v14 + 16);
    *(_OWORD *)(v9 + 40) = *(_OWORD *)v14;
    *((_QWORD *)v9 + 7) = v33;
    v34 = (void *)*((_QWORD *)v9 + 34);
    *((_QWORD *)v9 + 34) = 0;

    v9[280] = 0;
    objc_storeStrong((id *)v9 + 36, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)*((_QWORD *)v9 + 37);
    *((_QWORD *)v9 + 37) = v35;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v37 = v8;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v45 != v39)
            objc_enumerationMutation(v37);
          objc_msgSend(*((id *)v9 + 37), "addObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i), (_QWORD)v44);
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v38);
    }

  }
  if (*((_QWORD *)v9 + 1))
    v41 = v9;
  else
    v41 = 0;
  v42 = v41;

  return v42;
}

- (float)normDistance:(id)a3 point2:(id)a4
{
  id v5;
  id v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  float v29;
  float v30;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v21 = v20;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v24 = v23;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v27 = v26;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");
  v30 = sqrtf((float)((float)(v21 - v24) * (float)(v27 - v29)) + (float)((float)(v9 - v12) * (float)(v15 - v18)));

  return v30;
}

- (void)computeVar:(int)a3 index2:(int)a4 interVar:(float *)a5 intraVar:(float *)a6
{
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  float v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  void *v28;
  float v29;
  void *v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  void *v35;
  float v36;
  float v37;
  void *v38;
  void *v39;
  float v40;
  float v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  void *v46;
  void *v47;
  float v48;
  float v49;
  void *v50;
  void *v51;
  float v52;
  float v53;
  void *v54;
  void *v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  NSMutableArray *obj;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  if (a5 && a6)
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    obj = self->_bodyArray;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v76;
      v74 = a4;
      v72 = 0.0;
      v67 = 0.0;
      v65 = 0.0;
      v66 = 0.0;
      v70 = 0.0;
      v71 = 0.0;
      v68 = 0.0;
      v69 = 0.0;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v76 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          if (objc_msgSend(v12, "count"))
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "floatValue");
            if (v15 <= 0.1)
            {

            }
            else
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", v74);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "floatValue");
              v19 = v18 > 0.1;

              if (v19)
              {
                objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "floatValue");
                v64 = v22;

                objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "floatValue");
                v26 = v25;
                objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = v26;
                objc_msgSend(v28, "floatValue");
                v62 = v29;

                objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "floatValue");
                v33 = v32;

                objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "floatValue");
                v37 = v36;
                objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "objectAtIndexedSubscript:", 1);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "floatValue");
                v41 = v40;

                objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "floatValue");
                v45 = v44;
                objc_msgSend(v12, "objectAtIndexedSubscript:", v74);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "floatValue");
                v49 = v48;

                objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "objectAtIndexedSubscript:", 1);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "floatValue");
                v53 = v52;
                objc_msgSend(v12, "objectAtIndexedSubscript:", v74);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "objectAtIndexedSubscript:", 1);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "floatValue");
                v57 = v56;

                v72 = v72 + v64;
                v65 = v65 + (float)(v63 * v62);
                v66 = v66 + (float)(v37 * v41);
                v67 = v67 + v33;
                v68 = v68 + (float)((float)(v45 - v49) * (float)(v45 - v49));
                v70 = v70 + (float)(v45 - v49);
                v71 = v71 + (float)(v53 - v57);
                v69 = v69 + (float)((float)(v53 - v57) * (float)(v53 - v57));
                v10 = v10 + 1.0;
              }
            }
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
      }
      while (v8);

      v58 = 0.0;
      v59 = 0.0;
      if (v10 > 0.0)
      {
        v59 = (float)((float)((float)(v65 / v10) - (float)((float)(v72 * v72) / (float)(v10 * v10)))
                    + (float)((float)(v66 / v10) - (float)((float)(v67 * v67) / (float)(v10 * v10))))
            * 0.5;
        v58 = (float)((float)((float)(v68 / v10) - (float)((float)(v70 * v70) / (float)(v10 * v10)))
                    + (float)((float)(v69 / v10) - (float)((float)(v71 * v71) / (float)(v10 * v10))))
            * 0.5;
      }
    }
    else
    {

      v58 = 0.0;
      v59 = 0.0;
    }
    *a5 = v59;
    *a6 = v58;
  }
}

- (void)computeActionScore
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  float v6;
  float v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  void *v14;
  float v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  void *v25;
  float v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  float v30;
  uint64_t j;
  void *v32;
  void *v33;
  float v34;
  _BOOL4 v35;
  double v36;
  double v37;
  double v38;
  float v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  float v43;
  float v44;
  unint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v2 = self->_bodyArray;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (!v3)
  {

    LODWORD(v36) = 0;
    LODWORD(v37) = 0;
    LODWORD(v38) = 0;
    goto LABEL_25;
  }
  v4 = *(_QWORD *)v48;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v48 != v4)
        objc_enumerationMutation(v2);
      v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        if (v12 <= 0.1)
        {

        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 5);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "floatValue");
          v16 = v15 > 0.1;

          if (v16)
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", 11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", 5);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPVideoHumanActionAnalyzer normDistance:point2:](self, "normDistance:point2:", v17, v18);
            v20 = v19;

            goto LABEL_14;
          }
        }
        objc_msgSend(v9, "objectAtIndexedSubscript:", 12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "floatValue");
        if (v23 <= 0.1)
        {

        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 6);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "floatValue");
          v27 = v26 > 0.1;

          if (v27)
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", 12);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", 6);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPVideoHumanActionAnalyzer normDistance:point2:](self, "normDistance:point2:", v28, v29);
            v20 = v30;

LABEL_14:
            v7 = v7 + v20;
            v5 = v5 + 1.0;
          }
        }
        for (j = 5; j != 17; ++j)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", j);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectAtIndexedSubscript:", 2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "floatValue");
          v35 = v34 > 0.1;

          if (v35)
            v6 = v6 + 1.0;
        }
        continue;
      }
    }
    v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  }
  while (v3);

  LODWORD(v36) = 0;
  LODWORD(v37) = 0;
  LODWORD(v38) = 0;
  if (v5 >= 5.0)
  {
    v46 = 0;
    -[VCPVideoHumanActionAnalyzer computeVar:index2:interVar:intraVar:](self, "computeVar:index2:interVar:intraVar:", 9, 5, (char *)&v46 + 4, &v46, v36, v37, v38);
    v40 = v46;
    LODWORD(v44) = HIDWORD(v40);
    LODWORD(v39) = v40;
    -[VCPVideoHumanActionAnalyzer computeVar:index2:interVar:intraVar:](self, "computeVar:index2:interVar:intraVar:", 10, 6, (char *)&v46 + 4, &v46);
    v41 = v46;
    -[VCPVideoHumanActionAnalyzer computeVar:index2:interVar:intraVar:](self, "computeVar:index2:interVar:intraVar:", 15, 11, (char *)&v46 + 4, &v46);
    v42 = v46;
    -[VCPVideoHumanActionAnalyzer computeVar:index2:interVar:intraVar:](self, "computeVar:index2:interVar:intraVar:", 16, 12, (char *)&v46 + 4, &v46);
    *(float *)&v36 = v6 / 84.0;
    *(float *)&v37 = (float)(v7 / v5) * (float)((float)(v7 / v5) * 4.0);
    v43 = sqrtf(fmaxf((float)((float)((float)((float)(v44 + 0.0) + *((float *)&v41 + 1)) + *((float *)&v42 + 1))+ *((float *)&v46 + 1))/ *(float *)&v37, 0.0));
    *(float *)&v37 = sqrtf(fmaxf((float)((float)((float)((float)(v39 + 0.0) + *(float *)&v41) + *(float *)&v42) + *(float *)&v46)/ *(float *)&v37, 0.0));
    *(float *)&v38 = v43 + v43;
    *(float *)&v37 = *(float *)&v37 + *(float *)&v37;
  }
LABEL_25:
  if (*(float *)&v36 > 0.5)
    *(float *)&v36 = 0.5;
  self->_actionScoreAbsolute = fminf(*(float *)&v38 * *(float *)&v36, 1.0);
  self->_actionScoreRelative = fminf(*(float *)&v37 * *(float *)&v36, 1.0);
}

- (CGRect)scaleRect:(CGRect)a3 scaleX:(float)a4 scaleY:(float)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  v5 = a4;
  v6 = a3.origin.x * v5;
  v7 = a5;
  v8 = a3.origin.y * v7;
  v9 = a3.size.width * v5;
  v10 = a3.size.height * v7;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (float)intersectionOverUnion:(CGRect)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v15 = CGRectIntersection(a3, a4);
  v13 = v15.size.height;
  v14 = v15.size.width;
  v15.origin.x = v11;
  v15.origin.y = v10;
  v15.size.width = v9;
  v15.size.height = v8;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v16 = CGRectUnion(v15, v17);
  return v14 * v13 / (v16.size.width * v16.size.height + 0.00999999978);
}

- (id)associatePerson:(CGRect)a3 withPHFaces:(id)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v9;
  double MidX;
  double MidY;
  NSMutableArray *v12;
  uint64_t v13;
  void *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t i;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v35;
  double v36;
  float v37;
  BOOL v38;
  id v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v47 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  MidX = CGRectGetMidX(v48);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  MidY = CGRectGetMidY(v49);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v12 = self->_phFaces;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v13)
  {
    v14 = 0;
    v15 = MidX;
    v16 = MidY;
    v17 = width * height;
    v18 = v17 * 0.7;
    v19 = v17 * 1.3;
    v20 = 3.4028e38;
    v21 = *(_QWORD *)v43;
    v22 = v16;
    v23 = v15;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v43 != v21)
          objc_enumerationMutation(v12);
        v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v25, "bodyWidth", (_QWORD)v42);
        v27 = v26;
        objc_msgSend(v25, "bodyHeight");
        if (v27 * v28 > 0.0)
        {
          objc_msgSend(v25, "bodyWidth");
          v30 = v29;
          objc_msgSend(v25, "bodyHeight");
          v32 = v31;
          objc_msgSend(v25, "bodyCenterX");
          v34 = v33;
          objc_msgSend(v25, "bodyCenterY");
          v35 = v30 * v32;
          v37 = vabdd_f64(v23, v34) + vabdd_f64(v22, v36);
          v38 = v20 > v37 && v18 < v35;
          if (v38 && v19 > v35)
          {
            v40 = v25;

            v20 = v37;
            v14 = v40;
          }
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v13);

    if (v14)
      -[NSMutableArray removeObject:](self->_phFaces, "removeObject:", v14);
  }
  else
  {

    v14 = 0;
  }

  return v14;
}

- (int)processPersons:(id)a3 humanBounds:(id)a4 dominantPersonIdx:(int)a5 frame:(__CVBuffer *)a6 timestamp:(id *)a7 duration:(id *)a8 frameStats:(id)a9
{
  int Width;
  int Height;
  int64_t var3;
  void *v17;
  NSString *v18;
  double y;
  double x;
  double v21;
  double v22;
  float v23;
  float v24;
  float v25;
  id v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  float v31;
  float v32;
  float v33;
  float v34;
  uint64_t v35;
  int v36;
  void *v37;
  void *v38;
  float v39;
  _BOOL4 v40;
  void *v41;
  float v42;
  void *v43;
  float v44;
  void *v45;
  float v46;
  void *v47;
  float v48;
  unint64_t v49;
  double v50;
  float v51;
  float v52;
  float v53;
  float v54;
  BOOL v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  VCPVideoObjectTracker *v77;
  uint64_t v78;
  VCPVideoObjectTracker *tracker;
  float v80;
  void *v81;
  NSMutableArray *keyPersonResults;
  CFDictionaryRef v83;
  CFDictionaryRef v84;
  void *v85;
  void *v86;
  double v87;
  _OWORD *v88;
  Float64 Seconds;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  VCPVideoHumanActionAnalyzer *v98;
  uint64_t v99;
  float v100;
  float v101;
  Float64 v102;
  double v103;
  Float64 v104;
  void *v105;
  void *v106;
  void *v107;
  BOOL v108;
  void *v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  CGFloat v119;
  CGFloat v120;
  void *v121;
  NSMutableArray *actionResults;
  CFDictionaryRef v123;
  CFDictionaryRef v124;
  void *v125;
  __int128 v126;
  __CVBuffer *v128;
  int v129;
  int v130;
  CGRect *p_humanRect;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v132;
  VCPVideoHumanActionAnalyzer *v133;
  id v134;
  id v135;
  id v136;
  void *v137;
  CMTime v138;
  CMTime v139;
  CMTime v140;
  CMTime v141;
  CMTime v142;
  __int128 v143;
  int64_t v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  CMTime rhs;
  CMTime time;
  _QWORD v151[3];
  _QWORD v152[3];
  _QWORD v153[3];
  _QWORD v154[3];
  _QWORD v155[4];
  _QWORD v156[4];
  _QWORD v157[2];
  _QWORD v158[2];
  _BYTE v159[128];
  uint64_t v160;
  NSRect v161;

  v160 = *MEMORY[0x1E0C80C00];
  v134 = a3;
  v135 = a4;
  v136 = a9;
  Width = CVPixelBufferGetWidth(a6);
  Height = CVPixelBufferGetHeight(a6);
  var3 = a7->var3;
  *(_OWORD *)(&self->_humanPoseScore + 1) = *(_OWORD *)&a7->var0;
  *(_QWORD *)&self->_lastHumanTimestamp.flags = var3;
  objc_msgSend(v134, "objectAtIndexedSubscript:", a5);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "setObject:atIndexedSubscript:", v17, a5);

  objc_msgSend(v134, "setObject:atIndexedSubscript:", v137, 0);
  objc_msgSend(v135, "objectAtIndexedSubscript:", a5);
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  self->_humanRect = NSRectFromString(v18);

  x = self->_humanRect.origin.x;
  y = self->_humanRect.origin.y;
  v22 = self->_humanRect.size.width;
  v21 = self->_humanRect.size.height;
  objc_msgSend(v136, "faceArea");
  if (v23 <= 0.2
    && (v24 = x + v22 * 0.5,
        v25 = y + v21 * 0.5,
        fmax(self->_humanRect.size.width, self->_humanRect.size.height) >= fminf(fabsf(v24 + -0.5), fabsf(v25 + -0.5))))
  {
    p_humanRect = &self->_humanRect;
    v132 = a7;
    v133 = self;
    if (objc_msgSend(v137, "count"))
    {
      v147 = 0u;
      v148 = 0u;
      v145 = 0u;
      v146 = 0u;
      v26 = v137;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v145, v159, 16);
      v129 = Height;
      v130 = Width;
      v128 = a6;
      if (v27)
      {
        v28 = 0;
        v29 = 0;
        v30 = *(_QWORD *)v146;
        v31 = 1.0;
        v32 = 0.0;
        v33 = 0.0;
        v34 = 1.0;
        do
        {
          v35 = 0;
          v36 = v28;
          v28 += v27;
          do
          {
            if (*(_QWORD *)v146 != v30)
              objc_enumerationMutation(v26);
            v37 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * v35);
            objc_msgSend(v37, "objectAtIndexedSubscript:", 2);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "floatValue");
            v40 = v39 > 0.1;

            if (v40)
            {
              objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "floatValue");
              if (v42 < v34)
                v34 = v42;

              objc_msgSend(v37, "objectAtIndexedSubscript:", 1);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "floatValue");
              if (v44 < v31)
                v31 = v44;

              objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "floatValue");
              if (v33 < v46)
                v33 = v46;

              objc_msgSend(v37, "objectAtIndexedSubscript:", 1);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "floatValue");
              if (v32 < v48)
                v32 = v48;

              if (v36 + (int)v35 > 2)
                ++v29;
            }
            ++v35;
          }
          while (v27 != v35);
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v145, v159, 16);
        }
        while (v27);
      }
      else
      {
        v29 = 0;
        v31 = 1.0;
        v32 = 0.0;
        v33 = 0.0;
        v34 = 1.0;
      }

      LODWORD(v50) = 1036831949;
      v49 = +[VCPHuman flagsFromKeypoints:withMinConfidence:](VCPHuman, "flagsFromKeypoints:withMinConfidence:", v26, v50);
      a7 = v132;
      self = v133;
      if ((v49 & 0x100000) != 0)
        v133->_humanPoseScore = v133->_humanPoseScore + 0.5;
      if ((v49 & 0x200000) != 0)
        v133->_humanPoseScore = v133->_humanPoseScore + 0.5;
      if (v29 >= 6)
      {
        v51 = (float)(v33 + v34) * 0.5;
        v52 = (float)(v32 + v31) * 0.5;
        v53 = v133->_actionScoreAbsolute * 0.3;
        v54 = v53 + 0.25;
        v55 = v53 <= 0.15;
        v56 = 0.4;
        if (v55)
          v56 = v54;
        v57 = v32 - v31;
        if ((float)(v32 - v31) < (float)(v33 - v34))
          v57 = v33 - v34;
        v58 = v57 * 1.2;
        if (v58 >= v56)
          v56 = v58;
        if (v56 > 0.5)
          v56 = 0.5;
        v59 = (float)((float)v130 / (float)v129) * v56;
        if (v130 > v129)
        {
          v59 = v56;
          v56 = (float)((float)v129 / (float)v130) * v56;
        }
        v60 = v133->_crop.size.width;
        v61 = (float)(v60 * 0.8) * 0.5;
        if (v56 < v61)
          v56 = v61;
        v62 = v133->_crop.size.height;
        v63 = (float)(v62 * 0.8) * 0.5;
        if (v59 >= v63)
          v63 = v59;
        v64 = v51 - v56;
        v65 = 0.01;
        if ((float)(v51 - v56) < 0.01)
          v64 = 0.01;
        v66 = v51 + v56;
        v67 = 0.99;
        if (v66 > 0.99)
          v66 = 0.99;
        if ((float)(v52 - v63) >= 0.01)
          v65 = v52 - v63;
        v68 = v52 + v63;
        if (v68 <= 0.99)
          v67 = v68;
        v133->_crop.origin.x = v64;
        v133->_crop.origin.y = v65;
        v133->_crop.size.width = (float)(v66 - v64);
        v133->_crop.size.height = (float)(v67 - v65);
        -[VCPVideoHumanActionAnalyzer scaleRect:scaleX:scaleY:](v133, "scaleRect:scaleX:scaleY:");
        v70 = v69;
        v72 = v71;
        v74 = v73;
        v76 = v75;
        v77 = [VCPVideoObjectTracker alloc];
        v143 = *(_OWORD *)&v132->var0;
        v144 = v132->var3;
        v78 = -[VCPVideoObjectTracker initWithObjectBounds:inFrame:timestamp:](v77, "initWithObjectBounds:inFrame:timestamp:", v128, &v143, v70, v72, v74, v76);
        tracker = v133->_tracker;
        v133->_tracker = (VCPVideoObjectTracker *)v78;

        a7 = v132;
        self = v133;
      }
    }
    else
    {
      v29 = 0;
      v49 = 0;
    }
    v80 = fmin(fmax(p_humanRect->size.width, p_humanRect->size.height), 0.5);
    self->_humanPoseScore = self->_humanPoseScore * (float)(v80 + 0.5);
    objc_msgSend(v136, "setHumanPoseScore:");
    if ((unint64_t)-[NSMutableArray count](self->_bodyArray, "count") >= 7)
      -[NSMutableArray removeObjectAtIndex:](self->_bodyArray, "removeObjectAtIndex:", 0);
    -[NSMutableArray addObject:](self->_bodyArray, "addObject:", v137);
    if (v29 >= 6)
    {
      v157[0] = CFSTR("humanKeypoints");
      v157[1] = CFSTR("humanBounds");
      v158[0] = v134;
      v158[1] = v135;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v158, v157, 2);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      keyPersonResults = self->_keyPersonResults;
      v155[0] = CFSTR("start");
      time = (CMTime)*a7;
      v83 = CMTimeCopyAsDictionary(&time, 0);
      v156[0] = v83;
      v155[1] = CFSTR("duration");
      CMTimeMake(&v142, 150, 1000);
      time = v142;
      v84 = CMTimeCopyAsDictionary(&time, 0);
      v156[1] = v84;
      v155[2] = CFSTR("flags");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v49);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v155[3] = CFSTR("attributes");
      v156[2] = v85;
      v156[3] = v81;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v156, v155, 4);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](keyPersonResults, "addObject:", v86);

      a7 = v132;
      self = v133;
    }
    if ((unint64_t)-[NSMutableArray count](self->_bodyArray, "count") >= 7)
    {
      -[VCPVideoHumanActionAnalyzer computeActionScore](self, "computeActionScore");
      *(float *)&v87 = self->_scoreAbsoluteMax;
      if (*(float *)&v87 < self->_actionScoreAbsolute)
        *(float *)&v87 = self->_actionScoreAbsolute;
      self->_scoreAbsoluteMax = *(float *)&v87;
      *(float *)&v87 = self->_scoreRelativeMax;
      if (*(float *)&v87 < self->_actionScoreRelative)
        *(float *)&v87 = self->_actionScoreRelative;
      self->_scoreRelativeMax = *(float *)&v87;
      *(float *)&v87 = self->_actionScoreRelative;
      objc_msgSend(v136, "setHumanActionScore:", v87);
      v88 = (_OWORD *)((char *)&self->_endTime.epoch + 4);
      time = (CMTime)*a7;
      rhs = *(CMTime *)((char *)&self->_endTime.epoch + 4);
      CMTimeSubtract(&v141, &time, &rhs);
      Seconds = CMTimeGetSeconds(&v141);
      if (Seconds > 1.0)
      {
        v90 = (void *)MEMORY[0x1E0C99E08];
        v153[0] = CFSTR("absoluteScore");
        *(float *)&Seconds = self->_scoreAbsoluteMax;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", Seconds);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v154[0] = v91;
        v153[1] = CFSTR("relativeScore");
        *(float *)&v92 = self->_scoreRelativeMax;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v154[1] = v93;
        v153[2] = CFSTR("humanScore");
        *(float *)&v94 = self->_humanPoseScore;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v154[2] = v95;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v154, v153, 3);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "dictionaryWithDictionary:", v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        v98 = v133;
        if (v133->_timeOfInterest)
        {
          v99 = -[NSMutableArray count](v133->_phFaces, "count");
          v98 = v133;
          if (v99)
          {
            -[NSNumber floatValue](v133->_timeOfInterest, "floatValue");
            v101 = v100;
            v140 = (CMTime)*v132;
            v102 = CMTimeGetSeconds(&v140);
            v103 = v101;
            v98 = v133;
            if (v102 > v103)
            {
              *(_OWORD *)&v139.value = *v88;
              v139.epoch = *(_QWORD *)&self->_startTime.flags;
              v104 = CMTimeGetSeconds(&v139);
              v98 = v133;
              if (v104 < v103)
              {
                -[VCPVideoHumanActionAnalyzer associatePerson:withPHFaces:](v133, "associatePerson:withPHFaces:", v133->_phFaces, p_humanRect->origin.x, p_humanRect->origin.y, p_humanRect->size.width, p_humanRect->size.height);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                v106 = v105;
                if (v105)
                {
                  objc_msgSend(v105, "localIdentifier");
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  v108 = v107 == 0;

                  if (!v108)
                  {
                    objc_msgSend(v106, "localIdentifier");
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v97, "setObject:forKeyedSubscript:", v109, CFSTR("faceIdentifier"));

                    objc_msgSend(v106, "bodyCenterX");
                    v111 = v110;
                    objc_msgSend(v106, "bodyWidth");
                    v113 = v112;
                    objc_msgSend(v106, "bodyCenterY");
                    v115 = v114;
                    objc_msgSend(v106, "bodyHeight");
                    v117 = v116;
                    objc_msgSend(v106, "bodyWidth");
                    v119 = v118;
                    objc_msgSend(v106, "bodyHeight");
                    v161.size.height = v120;
                    v161.origin.x = v111 + v113 * -0.5;
                    v161.origin.y = v115 + v117 * -0.5;
                    v161.size.width = v119;
                    NSStringFromRect(v161);
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v97, "setObject:forKeyedSubscript:", v121, CFSTR("humanBounds"));

                  }
                }

                v98 = v133;
              }
            }
          }
        }
        actionResults = v98->_actionResults;
        *(_OWORD *)&time.value = *v88;
        time.epoch = *(_QWORD *)&self->_startTime.flags;
        v151[0] = CFSTR("start");
        v123 = CMTimeCopyAsDictionary(&time, 0);
        v152[0] = v123;
        v151[1] = CFSTR("duration");
        time = (CMTime)*v132;
        *(_OWORD *)&rhs.value = *v88;
        rhs.epoch = *(_QWORD *)&self->_startTime.flags;
        CMTimeSubtract(&v138, &time, &rhs);
        time = v138;
        v124 = CMTimeCopyAsDictionary(&time, 0);
        v151[2] = CFSTR("attributes");
        v152[1] = v124;
        v152[2] = v97;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, v151, 3);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](actionResults, "addObject:", v125);

        v126 = *(_OWORD *)&v132->var0;
        *(_QWORD *)&self->_startTime.flags = v132->var3;
        *v88 = v126;
        v133->_scoreAbsoluteMax = 0.0;
        v133->_scoreRelativeMax = 0.0;

      }
    }
    objc_msgSend(v136, "setFrameProcessedByHumanAnalyzer:", 1);
  }
  else
  {
    self->_humanPoseScore = 0.0;
    self->_actionScoreRelative = 0.0;
  }

  return 0;
}

- (void)addActiveResults:(id *)a3
{
  CMTime *p_timeLastProcessFullFrame;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *poseResults;
  CFDictionaryRef v14;
  CFDictionaryRef v15;
  void *v16;
  void *v17;
  NSMutableArray *obj;
  uint64_t v19;
  VCPVideoHumanActionAnalyzer *v20;
  CMTime v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CMTime rhs;
  CMTime time;
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;
  NSRect v34;

  v33 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_activePoseResults, "count"))
  {
    p_timeLastProcessFullFrame = (CMTime *)&self->_timeLastProcessFullFrame;
    if ((self->_timeLastProcessFullFrame.flags & 1) != 0)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = self;
      obj = self->_activePoseResults;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v6)
      {
        v19 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(obj);
            v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            v30[0] = CFSTR("humanBounds");
            objc_msgSend(v8, "bounds");
            NSStringFromRect(v34);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v30[1] = CFSTR("humanConfidence");
            v31[0] = v9;
            v10 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v8, "confidence");
            objc_msgSend(v10, "numberWithFloat:");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v31[1] = v11;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            poseResults = v20->_poseResults;
            v28[0] = CFSTR("start");
            time = *p_timeLastProcessFullFrame;
            v14 = CMTimeCopyAsDictionary(&time, 0);
            v29[0] = v14;
            v28[1] = CFSTR("duration");
            time = (CMTime)*a3;
            rhs = *p_timeLastProcessFullFrame;
            CMTimeSubtract(&v21, &time, &rhs);
            time = v21;
            v15 = CMTimeCopyAsDictionary(&time, 0);
            v29[1] = v15;
            v28[2] = CFSTR("flags");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "flags"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v28[3] = CFSTR("attributes");
            v29[2] = v16;
            v29[3] = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](poseResults, "addObject:", v17);

          }
          v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        }
        while (v6);
      }

    }
  }
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7
{
  size_t Width;
  size_t Height;
  double v12;
  double v13;
  VCPVideoObjectTracker *tracker;
  int v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  VCPVideoObjectTracker *v20;
  __int128 v21;
  __int128 v22;
  CGFloat *p_x;
  double v24;
  double v25;
  CGSize v26;
  uint64_t v27;
  CGFloat y;
  float v29;
  VCPHuman *v30;
  void *v31;
  VCPVideoHumanActionAnalyzer *v32;
  int v33;
  Float64 Seconds;
  VCPImageHumanPoseAnalyzer *poseAnalyzer;
  id v36;
  $95D729B680665BEAEFA1D6FCA8238556 *p_timeLastProcessFullFrame;
  id v38;
  VCPImageHumanPoseAnalyzer *v39;
  id v40;
  void *v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  VCPHuman *v50;
  NSString *v51;
  void *v52;
  __int128 v53;
  void *v54;
  BOOL v55;
  __int128 v56;
  _OWORD *v57;
  CGSize v58;
  CGSize v59;
  __int128 v60;
  uint64_t v62;
  void *v63;
  void *v64;
  NSString *v65;
  double x;
  double v67;
  double v68;
  double v69;
  void *v70;
  int v71;
  float v72;
  float v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  void *v83;
  float v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  float v89;
  void *v90;
  void *v91;
  int v92;
  double v93;
  void *v94;
  VCPHuman *v95;
  double v96;
  double v97;
  void *v98;
  float v99;
  double v100;
  float v101;
  BOOL v102;
  int v103;
  uint64_t v104;
  BOOL *p_tracking;
  _OWORD *v106;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v107;
  void *v109;
  __CVBuffer *cf;
  void *v111;
  void *v113;
  id v114;
  float v115;
  int v116;
  id v117;
  unsigned int v118;
  VCPHuman *v119;
  uint64_t v120;
  $95D729B680665BEAEFA1D6FCA8238556 *v121;
  uint64_t v122;
  int v123;
  void *v124;
  uint64_t v125;
  id obj;
  id obja;
  uint64_t v128;
  void *v129;
  VCPVideoHumanActionAnalyzer *v130;
  id v131;
  id v132;
  __int128 v133;
  int64_t v134;
  __int128 v135;
  int64_t var3;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  int64_t v142;
  id v143;
  CMTime v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  id v153;
  CMTime v154;
  CMTime time;
  CFTypeRef v156;
  CMTime rhs;
  CMTime lhs;
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  uint64_t v162;
  CGRect v163;
  CGRect v164;
  NSRect v165;
  NSRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  NSRect v170;

  v162 = *MEMORY[0x1E0C80C00];
  v114 = a6;
  v156 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = a5;
  v130 = self;
  Width = CVPixelBufferGetWidth(a3);
  cf = a3;
  Height = CVPixelBufferGetHeight(a3);
  *(float *)&v12 = v130->_humanPoseScore;
  objc_msgSend(v114, "setHumanPoseScore:", v12);
  *(float *)&v13 = v130->_actionScoreRelative;
  objc_msgSend(v114, "setHumanActionScore:", v13);
  objc_msgSend(v114, "setFrameProcessedByHumanAnalyzer:", 1);
  lhs = *(CMTime *)a4;
  rhs = (CMTime)v130->_timeLastProcess;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) < 0.150000006)
  {
    if (!CGRectIsEmpty(v130->_crop))
    {
      tracker = v130->_tracker;
      if (tracker)
      {
        v15 = -[VCPVideoObjectTracker trackObjectInFrame:](tracker, "trackObjectInFrame:", cf);
        if (v15)
          goto LABEL_14;
        -[VCPVideoObjectTracker objectBounds](v130->_tracker, "objectBounds");
        -[VCPVideoHumanActionAnalyzer scaleRect:scaleX:scaleY:](v130, "scaleRect:scaleX:scaleY:");
        v130->_crop.origin.x = v16;
        v130->_crop.origin.y = v17;
        v130->_crop.size.width = v18;
        v130->_crop.size.height = v19;
      }
    }
    if (!objc_msgSend(v114, "frameProcessedByFaceDetector"))
    {
      v30 = 0;
      v31 = 0;
      v15 = 0;
      goto LABEL_50;
    }
  }
  v20 = v130->_tracker;
  v130->_tracker = 0;

  v21 = *(_OWORD *)&a4->var0;
  v130->_timeLastProcess.epoch = a4->var3;
  *(_OWORD *)&v130->_timeLastProcess.value = v21;
  v130->_humanPoseScore = 0.0;
  v130->_actionScoreAbsolute = 0.0;
  v106 = (_OWORD *)((char *)&v130->_endTime.epoch + 4);
  if ((v130->_startTime.timescale & 1) == 0)
  {
    v22 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v130->_startTime.flags = a4->var3;
    *v106 = v22;
  }
  p_x = &v130->_crop.origin.x;
  v24 = v130->_crop.size.width;
  v25 = v130->_crop.size.height;
  if (fmin(v24, v25) < 0.100000001)
  {
    v26 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)p_x = *MEMORY[0x1E0C9D648];
    v130->_crop.size = v26;
    v24 = v130->_crop.size.width;
    v25 = v130->_crop.size.height;
  }
  v27 = *(_QWORD *)p_x;
  y = v130->_crop.origin.y;
  if (CGRectIsEmpty(*(CGRect *)(&v24 - 2)))
  {
    v156 = CFRetain(cf);
    goto LABEL_15;
  }
  v163.origin.x = *p_x;
  v163.size.width = v130->_crop.size.width;
  v163.size.height = v130->_crop.size.height;
  v29 = 1.0 - v163.size.height - v130->_crop.origin.y;
  v163.origin.y = fmaxf(v29, 0.0);
  v15 = Scaler::ScaleCropped(&v130->_scaler, v163, cf, (__CVBuffer **)&v156, Width, Height, 875704422);
  if (v15)
  {
LABEL_14:
    v30 = 0;
    v31 = 0;
    goto LABEL_50;
  }
LABEL_15:
  v32 = v130;
  if ((v130->_lastHumanTimestamp.timescale & 1) != 0)
  {
    lhs = (CMTime)*a4;
    rhs = *(CMTime *)(&v130->_humanPoseScore + 1);
    CMTimeSubtract(&v154, &lhs, &rhs);
    Seconds = CMTimeGetSeconds(&v154);
    v32 = v130;
    p_tracking = &v130->_tracking;
    v130->_tracking = Seconds < 1.0;
    if (Seconds < 1.0)
    {
      -[VCPImageHumanPoseAnalyzer setTrackingMode:](v130->_poseAnalyzer, "setTrackingMode:", 1);
      poseAnalyzer = v130->_poseAnalyzer;
      v153 = 0;
      v15 = -[VCPImageHumanPoseAnalyzer analyzePixelBuffer:flags:results:cancel:](poseAnalyzer, "analyzePixelBuffer:flags:results:cancel:", v156, a7, &v153, &__block_literal_global_94);
      v36 = v153;
      v109 = v36;
      if (v15)
      {
        v119 = 0;
        goto LABEL_48;
      }
      v151 = 0u;
      v152 = 0u;
      v149 = 0u;
      v150 = 0u;
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("HumanPoseResults"));
      v117 = (id)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
      if (v62)
      {
        v122 = v62;
        v118 = 0;
        v116 = 0;
        v119 = 0;
        v120 = *(_QWORD *)v150;
        v115 = 0.0;
        do
        {
          for (obja = 0; obja != (id)v122; obja = (char *)obja + 1)
          {
            if (*(_QWORD *)v150 != v120)
              objc_enumerationMutation(v117);
            v63 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)obja);
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("attributes"));
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("humanKeypoints"));
            v131 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("flags"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v125 = objc_msgSend(v64, "unsignedIntegerValue");

            objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("humanBounds"));
            v65 = (NSString *)objc_claimAutoreleasedReturnValue();
            v166 = NSRectFromString(v65);
            x = v166.origin.x;
            v67 = v166.origin.y;
            v68 = v166.size.width;
            v69 = v166.size.height;

            objc_msgSend(v129, "objectForKeyedSubscript:", CFSTR("humanConfidence"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "floatValue");
            v123 = v71;

            v72 = fmax(v68, v69);
            if (v72 >= 0.1 && (v72 >= 0.2 || (v125 & 0x100000) != 0))
            {
              if (v131)
              {
                v167.origin.x = *p_x;
                v167.origin.y = v130->_crop.origin.y;
                v167.size.width = v130->_crop.size.width;
                v167.size.height = v130->_crop.size.height;
                v74 = 0.0;
                if (CGRectIsEmpty(v167))
                {
                  v75 = v131;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  v147 = 0u;
                  v148 = 0u;
                  v145 = 0u;
                  v146 = 0u;
                  v132 = v131;
                  v76 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
                  if (v76)
                  {
                    v77 = *(_QWORD *)v146;
                    do
                    {
                      for (i = 0; i != v76; ++i)
                      {
                        if (*(_QWORD *)v146 != v77)
                          objc_enumerationMutation(v132);
                        v79 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
                        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
                        v80 = (void *)objc_claimAutoreleasedReturnValue();
                        v81 = (void *)MEMORY[0x1E0CB37E8];
                        v82 = *p_x;
                        objc_msgSend(v79, "objectAtIndexedSubscript:", 0);
                        v83 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v83, "floatValue");
                        objc_msgSend(v81, "numberWithDouble:", v82 + v84 * v130->_crop.size.width);
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v80, "setObject:atIndexedSubscript:", v85, 0);

                        v86 = (void *)MEMORY[0x1E0CB37E8];
                        v87 = v130->_crop.origin.y;
                        objc_msgSend(v79, "objectAtIndexedSubscript:", 1);
                        v88 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v88, "floatValue");
                        objc_msgSend(v86, "numberWithDouble:", v87 + v89 * v130->_crop.size.height);
                        v90 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v80, "setObject:atIndexedSubscript:", v90, 1);

                        objc_msgSend(v79, "objectAtIndexedSubscript:", 2);
                        v91 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v91, "floatValue");
                        LODWORD(v87) = v92;

                        LODWORD(v93) = LODWORD(v87);
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v93);
                        v94 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v80, "setObject:atIndexedSubscript:", v94, 2);

                        objc_msgSend(v75, "addObject:", v80);
                        if (*(float *)&v87 > 0.1)
                          v74 = v74 + 1.0;

                      }
                      v76 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
                    }
                    while (v76);
                  }

                  v131 = v75;
                }
                objc_msgSend(v113, "addObject:", v75);
              }
              else
              {
                v131 = 0;
                v74 = 0.0;
              }
              v168.origin.x = x;
              v168.origin.y = v67;
              v168.size.width = v68;
              v168.size.height = v69;
              if (CGRectIsEmpty(v168))
              {
                v95 = v119;
              }
              else
              {
                v169.origin.x = *p_x;
                v169.origin.y = v130->_crop.origin.y;
                v169.size.width = v130->_crop.size.width;
                v169.size.height = v130->_crop.size.height;
                if (!CGRectIsEmpty(v169))
                {
                  v96 = v130->_crop.size.width;
                  v97 = v130->_crop.size.height;
                  x = *p_x + x * v96;
                  v67 = v130->_crop.origin.y + v67 * v97;
                  v68 = v68 * v96;
                  v69 = v69 * v97;
                }
                v170.origin.x = x;
                v170.origin.y = v67;
                v170.size.width = v68;
                v170.size.height = v69;
                NSStringFromRect(v170);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v111, "addObject:", v98);

                if (!CGRectIsEmpty(v130->_humanRect))
                {
                  -[VCPVideoHumanActionAnalyzer intersectionOverUnion:rect:](v130, "intersectionOverUnion:rect:", v130->_humanRect.origin.x, v130->_humanRect.origin.y, v130->_humanRect.size.width, v130->_humanRect.size.height, x, v67, v68, v69);
                  v74 = v99 + 0.1;
                }
                v95 = objc_alloc_init(VCPHuman);

                -[VCPHuman setFlags:](v95, "setFlags:", v125);
                LODWORD(v100) = v123;
                -[VCPHuman setConfidence:](v95, "setConfidence:", v100);
                -[VCPHuman setBounds:](v95, "setBounds:", x, v67, v68, v69);
              }
              v101 = v115;
              v102 = v74 <= v115;
              if (v74 > v115)
                v101 = v74;
              v115 = v101;
              v103 = v118;
              if (!v102)
                v103 = v116;
              v118 = v103;
              ++v116;
              v119 = v95;
            }

          }
          v122 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
        }
        while (v122);
      }
      else
      {
        v118 = 0;
        v119 = 0;
      }

      v104 = objc_msgSend(v111, "count");
      if (v104 != objc_msgSend(v113, "count"))
      {
        v15 = -50;
        goto LABEL_48;
      }
      v33 = 1;
      v32 = v130;
    }
    else
    {
      v33 = 0;
      v118 = 0;
      v119 = 0;
      v109 = 0;
    }
  }
  else
  {
    v33 = 0;
    v118 = 0;
    v119 = 0;
    v109 = 0;
    p_tracking = &v130->_tracking;
    v130->_tracking = 0;
  }
  p_timeLastProcessFullFrame = &v32->_timeLastProcessFullFrame;
  lhs = (CMTime)*a4;
  rhs = (CMTime)v32->_timeLastProcessFullFrame;
  CMTimeSubtract(&v144, &lhs, &rhs);
  if (CMTimeGetSeconds(&v144) < 1.0)
  {
LABEL_43:
    if (objc_msgSend(v113, "count"))
    {
      v135 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      v133 = *(_OWORD *)&v107->var0;
      v134 = v107->var3;
      v15 = -[VCPVideoHumanActionAnalyzer processPersons:humanBounds:dominantPersonIdx:frame:timestamp:duration:frameStats:](v130, "processPersons:humanBounds:dominantPersonIdx:frame:timestamp:duration:frameStats:", v113, v111, v118, cf, &v135, &v133, v114);
    }
    else
    {
      v57 = (_OWORD *)MEMORY[0x1E0C9D648];
      v58 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      v130->_humanRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      v130->_humanRect.size = v58;
      if (!*p_tracking)
      {
        v59 = (CGSize)v57[1];
        *(_OWORD *)p_x = *v57;
        v130->_crop.size = v59;
      }
      -[NSMutableArray removeAllObjects](v130->_bodyArray, "removeAllObjects");
      v15 = 0;
      v60 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&v130->_startTime.flags = a4->var3;
      *v106 = v60;
    }
    goto LABEL_48;
  }
  v121 = p_timeLastProcessFullFrame;
  v164.origin.x = *p_x;
  v164.origin.y = v130->_crop.origin.y;
  v164.size.width = v130->_crop.size.width;
  v164.size.height = v130->_crop.size.height;
  if ((v33 & CGRectIsEmpty(v164)) == 1)
  {
    v38 = v109;
LABEL_27:
    v141 = *(_OWORD *)&a4->var0;
    v142 = a4->var3;
    -[VCPVideoHumanActionAnalyzer addActiveResults:](v130, "addActiveResults:", &v141);
    -[NSMutableArray removeAllObjects](v130->_activePoseResults, "removeAllObjects");
    objc_msgSend(v38, "objectForKeyedSubscript:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v38;
    v42 = objc_msgSend(v41, "count");
    if (v42 <= objc_msgSend(v111, "count") && objc_msgSend(v111, "count") == 1)
    {

      if (v119)
      {
        -[NSMutableArray addObject:](v130->_activePoseResults, "addObject:", v119);
LABEL_40:
        v53 = *(_OWORD *)&a4->var0;
        v121->epoch = a4->var3;
        *(_OWORD *)&v121->value = v53;
        objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("HumanPoseResults"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "count") == 0;

        if (!v55)
        {
          v56 = *(_OWORD *)&a4->var0;
          *(_QWORD *)&v130->_lastHumanTimestamp.flags = a4->var3;
          *(_OWORD *)(&v130->_humanPoseScore + 1) = v56;
        }

        goto LABEL_43;
      }
    }
    else
    {

    }
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("HumanPoseResults"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v43;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
    if (v44)
    {
      v128 = *(_QWORD *)v138;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v138 != v128)
            objc_enumerationMutation(obj);
          v46 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * j);
          objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("attributes"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("flags"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "unsignedIntegerValue");

          v50 = objc_alloc_init(VCPHuman);
          -[VCPHuman setFlags:](v50, "setFlags:", v49);
          objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("humanBounds"));
          v51 = (NSString *)objc_claimAutoreleasedReturnValue();
          v165 = NSRectFromString(v51);
          -[VCPHuman setBounds:](v50, "setBounds:", v165.origin.x, v165.origin.y, v165.size.width, v165.size.height);

          objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("humanConfidence"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "floatValue");
          -[VCPHuman setConfidence:](v50, "setConfidence:");

          -[NSMutableArray addObject:](v130->_activePoseResults, "addObject:", v50);
        }
        v43 = obj;
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v159, 16);
      }
      while (v44);
    }

    v38 = v124;
    goto LABEL_40;
  }
  v39 = v130->_poseAnalyzer;
  v143 = 0;
  v15 = -[VCPImageHumanPoseAnalyzer analyzePixelBuffer:flags:results:cancel:](v39, "analyzePixelBuffer:flags:results:cancel:", cf, a7, &v143, &__block_literal_global_158_1);
  v40 = v143;
  v38 = v40;
  if (!v15)
    goto LABEL_27;

LABEL_48:
  v31 = v109;
  v30 = v119;
  if (v156)
    CFRelease(v156);
LABEL_50:

  return v15;
}

uint64_t __80__VCPVideoHumanActionAnalyzer_analyzeFrame_timestamp_duration_frameStats_flags___block_invoke()
{
  return 0;
}

uint64_t __80__VCPVideoHumanActionAnalyzer_analyzeFrame_timestamp_duration_frameStats_flags___block_invoke_2()
{
  return 0;
}

- (int)finishAnalysisPass:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1;

  var1 = a3->var1;
  -[VCPVideoHumanActionAnalyzer addActiveResults:](self, "addActiveResults:", &var1);
  -[NSMutableArray removeAllObjects](self->_activePoseResults, "removeAllObjects");
  return 0;
}

- (id)clipResults:(id *)a3
{
  uint64_t v4;
  uint64_t i;
  const __CFDictionary *v6;
  __int128 v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  void *v10;
  void *v11;
  void *v12;
  CFDictionaryRef v13;
  CFDictionaryRef v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  CFDictionaryRef v19;
  CFDictionaryRef v20;
  double v21;
  void *v22;
  void *v23;
  CFDictionaryRef v24;
  CFDictionaryRef v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableArray *obj;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  CMTimeRange v37;
  CMTime v38;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v43;
  CMTimeRange v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CMTime time;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = self->_actionResults;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
  if (v4)
  {
    v35 = *(_QWORD *)v46;
    do
    {
      v36 = v4;
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(obj);
        v6 = *(const __CFDictionary **)(*((_QWORD *)&v45 + 1) + 8 * i);
        memset(&v44, 0, sizeof(v44));
        CMTimeRangeMakeFromDictionary(&v44, v6);
        v7 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&range.start.epoch = v7;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
        memset(&v43, 0, sizeof(v43));
        otherRange = v44;
        CMTimeRangeGetIntersection(&v43, &range, &otherRange);
        if ((v43.start.flags & 1) != 0
          && (v43.duration.flags & 1) != 0
          && !v43.duration.epoch
          && (v43.duration.value & 0x8000000000000000) == 0)
        {
          time1 = v43.duration;
          time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          if (!CMTimeCompare(&time1, &time2))
            continue;
        }
        v58[0] = CFSTR("start");
        time = v43.start;
        v8 = CMTimeCopyAsDictionary(&time, 0);
        v59[0] = v8;
        v58[1] = CFSTR("duration");
        time = v43.duration;
        v9 = CMTimeCopyAsDictionary(&time, 0);
        v59[1] = v9;
        v58[2] = CFSTR("quality");
        -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("attributes"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("humanScore"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v59[2] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v12);

        v56[0] = CFSTR("start");
        time = v43.start;
        v13 = CMTimeCopyAsDictionary(&time, 0);
        v57[0] = v13;
        v56[1] = CFSTR("duration");
        time = v43.duration;
        v14 = CMTimeCopyAsDictionary(&time, 0);
        v57[1] = v14;
        v56[2] = CFSTR("quality");
        -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("attributes"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("absoluteScore"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v57[2] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v17);

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
    }
    while (v4);
  }

  memset(&time, 0, sizeof(time));
  v18 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v37.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v37.start.epoch = v18;
  *(_OWORD *)&v37.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v38, &v37);
  v44.start = v38;
  *(_OWORD *)&v43.start.value = *(_OWORD *)((char *)&self->_endTime.epoch + 4);
  v43.start.epoch = *(_QWORD *)&self->_startTime.flags;
  CMTimeSubtract(&time, &v44.start, &v43.start);
  v54[0] = CFSTR("start");
  *(_OWORD *)&v44.start.value = *(_OWORD *)((char *)&self->_endTime.epoch + 4);
  v44.start.epoch = *(_QWORD *)&self->_startTime.flags;
  v19 = CMTimeCopyAsDictionary(&v44.start, 0);
  v55[0] = v19;
  v54[1] = CFSTR("duration");
  v44.start = time;
  v20 = CMTimeCopyAsDictionary(&v44.start, 0);
  v55[1] = v20;
  v54[2] = CFSTR("quality");
  *(float *)&v21 = self->_humanPoseScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObject:", v23);

  v52[0] = CFSTR("start");
  *(_OWORD *)&v44.start.value = *(_OWORD *)((char *)&self->_endTime.epoch + 4);
  v44.start.epoch = *(_QWORD *)&self->_startTime.flags;
  v24 = CMTimeCopyAsDictionary(&v44.start, 0);
  v53[0] = v24;
  v52[1] = CFSTR("duration");
  v44.start = time;
  v25 = CMTimeCopyAsDictionary(&v44.start, 0);
  v53[1] = v25;
  v52[2] = CFSTR("quality");
  *(float *)&v26 = self->_scoreAbsoluteMax;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObject:", v28);

  v50[0] = CFSTR("HumanActionResults");
  v50[1] = CFSTR("HumanPoseResults");
  v51[0] = v33;
  v51[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)results
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_poseResults, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_poseResults, CFSTR("HumanPoseResults"));
  if (-[NSMutableArray count](self->_actionResults, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_actionResults, CFSTR("HumanActionResults"));
  return v3;
}

- (id)privateResults
{
  void *v3;
  NSMutableArray *keyPersonResults;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray count](self->_keyPersonResults, "count");
  if (v3)
  {
    keyPersonResults = self->_keyPersonResults;
    v6 = CFSTR("HumanPoseInternalResults");
    v7[0] = keyPersonResults;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_phFaces, 0);
  objc_storeStrong((id *)&self->_timeOfInterest, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_activePoseResults, 0);
  objc_storeStrong((id *)&self->_poseResults, 0);
  objc_storeStrong((id *)&self->_keyPersonResults, 0);
  objc_storeStrong((id *)&self->_actionResults, 0);
  objc_storeStrong((id *)&self->_bodyArray, 0);
  objc_storeStrong((id *)&self->_poseAnalyzer, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 39) = 0;
  *((_DWORD *)self + 80) = 0;
  return self;
}

@end
