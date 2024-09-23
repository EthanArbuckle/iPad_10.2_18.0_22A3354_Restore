@implementation VCPVideoPetsActionAnalyzer

- (VCPVideoPetsActionAnalyzer)initWithTimeOfInterest:(id)a3
{
  id v5;
  char *v6;
  VCPImagePetsKeypointsAnalyzer *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  _OWORD *v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  VCPVideoPetsActionAnalyzer *v29;
  objc_super v31;

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)VCPVideoPetsActionAnalyzer;
  v6 = -[VCPVideoPetsActionAnalyzer init](&v31, sel_init);
  if (v6)
  {
    v7 = -[VCPImagePetsKeypointsAnalyzer initWithMaxNumRegions:forceCPU:sharedModel:]([VCPImagePetsKeypointsAnalyzer alloc], "initWithMaxNumRegions:forceCPU:sharedModel:", 2, 0, 1);
    v8 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v7;

    v9 = MEMORY[0x1E0CA2E28];
    v10 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
    *((_OWORD *)v6 + 1) = *MEMORY[0x1E0CA2E28];
    *((_QWORD *)v6 + 4) = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v6 + 8);
    *((_QWORD *)v6 + 8) = v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v6 + 16);
    *((_QWORD *)v6 + 16) = v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v6 + 17);
    *((_QWORD *)v6 + 17) = v15;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v6 + 18);
    *((_QWORD *)v6 + 18) = v17;

    *((_DWORD *)v6 + 18) = 0;
    v19 = MEMORY[0x1E0CA2E18];
    v20 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v6 + 92) = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *(_OWORD *)(v6 + 76) = v20;
    v21 = *(_QWORD *)(v19 + 16);
    *(_OWORD *)(v6 + 100) = *(_OWORD *)v19;
    *(_QWORD *)(v6 + 116) = v21;
    v22 = (_OWORD *)MEMORY[0x1E0C9D648];
    v23 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v6 + 152) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(v6 + 168) = v23;
    v24 = v22[1];
    *(_OWORD *)(v6 + 184) = *v22;
    *(_OWORD *)(v6 + 200) = v24;
    *((_DWORD *)v6 + 54) = 0;
    *((_DWORD *)v6 + 55) = 0;
    *((_DWORD *)v6 + 56) = 0;
    *((_DWORD *)v6 + 57) = 0;
    v25 = *(_QWORD *)(v19 + 16);
    *(_OWORD *)(v6 + 232) = *(_OWORD *)v19;
    *((_QWORD *)v6 + 31) = v25;
    v26 = *(_QWORD *)(v9 + 16);
    *(_OWORD *)(v6 + 40) = *(_OWORD *)v9;
    *((_QWORD *)v6 + 7) = v26;
    v27 = (void *)*((_QWORD *)v6 + 32);
    *((_QWORD *)v6 + 32) = 0;

    v6[264] = 0;
    objc_storeStrong((id *)v6 + 34, a3);
    v6[280] = 1;
  }
  if (*((_QWORD *)v6 + 1))
    v28 = v6;
  else
    v28 = 0;
  v29 = v28;

  return v29;
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
            if (v15 <= 0.15)
            {

            }
            else
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", v74);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "floatValue");
              v19 = v18 > 0.15;

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
        objc_msgSend(v9, "objectAtIndexedSubscript:", 16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        if (v12 <= 0.15)
        {

        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "floatValue");
          v16 = v15 > 0.15;

          if (v16)
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", 16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", 10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPVideoPetsActionAnalyzer normDistance:point2:](self, "normDistance:point2:", v17, v18);
            v20 = v19;

            goto LABEL_14;
          }
        }
        objc_msgSend(v9, "objectAtIndexedSubscript:", 19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "floatValue");
        if (v23 <= 0.15)
        {

        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 13);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "floatValue");
          v27 = v26 > 0.15;

          if (v27)
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", 19);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", 13);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPVideoPetsActionAnalyzer normDistance:point2:](self, "normDistance:point2:", v28, v29);
            v20 = v30;

LABEL_14:
            v7 = v7 + v20;
            v5 = v5 + 1.0;
          }
        }
        for (j = 10; j != 25; ++j)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", j);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectAtIndexedSubscript:", 2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "floatValue");
          v35 = v34 > 0.15;

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
    -[VCPVideoPetsActionAnalyzer computeVar:index2:interVar:intraVar:](self, "computeVar:index2:interVar:intraVar:", 12, 10, (char *)&v46 + 4, &v46, v36, v37, v38);
    v40 = v46;
    LODWORD(v44) = HIDWORD(v40);
    LODWORD(v39) = v40;
    -[VCPVideoPetsActionAnalyzer computeVar:index2:interVar:intraVar:](self, "computeVar:index2:interVar:intraVar:", 15, 13, (char *)&v46 + 4, &v46);
    v41 = v46;
    -[VCPVideoPetsActionAnalyzer computeVar:index2:interVar:intraVar:](self, "computeVar:index2:interVar:intraVar:", 18, 16, (char *)&v46 + 4, &v46);
    v42 = v46;
    -[VCPVideoPetsActionAnalyzer computeVar:index2:interVar:intraVar:](self, "computeVar:index2:interVar:intraVar:", 21, 19, (char *)&v46 + 4, &v46);
    *(float *)&v36 = v6 / 105.0;
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
  return v14 * v13 / (v16.size.width * v16.size.height + 0.00000011920929);
}

- (int)processPets:(id)a3 petsBounds:(id)a4 dominantPetIdx:(int)a5 frame:(__CVBuffer *)a6 timestamp:(id *)a7 duration:(id *)a8 frameStats:(id)a9
{
  int Width;
  int Height;
  int64_t var3;
  void *v17;
  void *v18;
  NSString *v19;
  double v20;
  double v21;
  float v22;
  float v23;
  VCPVideoObjectTracker *tracker;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  float v29;
  float v30;
  float v31;
  float v32;
  uint64_t v33;
  int v34;
  void *v35;
  void *v36;
  float v37;
  _BOOL4 v38;
  void *v39;
  float v40;
  void *v41;
  float v42;
  void *v43;
  float v44;
  void *v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  BOOL v51;
  float v52;
  float v53;
  float v54;
  float v55;
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
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  VCPVideoObjectTracker *v75;
  uint64_t v76;
  double v77;
  _OWORD *v78;
  double v79;
  double scoreAbsoluteMax;
  double scoreRelativeMax;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  NSMutableArray *actionResults;
  CFDictionaryRef v89;
  CFDictionaryRef v90;
  void *v91;
  __int128 v92;
  int v94;
  int v95;
  __CVBuffer *v96;
  void *v97;
  void *v98;
  CMTime *v99;
  VCPVideoPetsActionAnalyzer *v100;
  id v101;
  id v102;
  id v103;
  CMTime v104;
  CMTime time;
  __int128 v106;
  CMTimeEpoch epoch;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  CMTime rhs;
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[2];
  _QWORD v116[2];
  _BYTE v117[128];
  CMTime lhs;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v102 = a3;
  v103 = a4;
  v101 = a9;
  Width = CVPixelBufferGetWidth(a6);
  Height = CVPixelBufferGetHeight(a6);
  var3 = a7->var3;
  *(_OWORD *)&self->_lastPetTimestamp.value = *(_OWORD *)&a7->var0;
  self->_lastPetTimestamp.epoch = var3;
  objc_msgSend(v102, "objectAtIndexedSubscript:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setObject:atIndexedSubscript:", v18, a5);

  objc_msgSend(v102, "setObject:atIndexedSubscript:", v17, 0);
  objc_msgSend(v103, "objectAtIndexedSubscript:", a5);
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  self->_petRect = NSRectFromString(v19);

  v20 = self->_petRect.size.width;
  v21 = self->_petRect.size.height;
  v22 = self->_petRect.origin.x + v20 * 0.5;
  v23 = self->_petRect.origin.y + v21 * 0.5;
  if (fmax(v20, v21) < fminf(fabsf(v22 + -0.5), fabsf(v23 + -0.5)))
  {
    self->_actionScoreRelative = 0.0;
    goto LABEL_66;
  }
  v99 = (CMTime *)a7;
  v100 = self;
  if (objc_msgSend(v17, "count"))
  {
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    tracker = v17;
    v97 = v17;
    v25 = -[VCPVideoObjectTracker countByEnumeratingWithState:objects:count:](tracker, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
    if (v25)
    {
      v94 = Height;
      v95 = Width;
      v96 = a6;
      v26 = 0;
      v27 = 0;
      v28 = *(_QWORD *)v109;
      v29 = 1.0;
      v30 = 0.0;
      v31 = 0.0;
      v32 = 1.0;
      do
      {
        v33 = 0;
        v34 = v26;
        v26 += v25;
        do
        {
          if (*(_QWORD *)v109 != v28)
            objc_enumerationMutation(tracker);
          v35 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v33);
          objc_msgSend(v35, "objectAtIndexedSubscript:", 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "floatValue");
          v38 = v37 > 0.15;

          if (v38)
          {
            objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "floatValue");
            if (v40 < v32)
              v32 = v40;

            objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "floatValue");
            if (v42 < v29)
              v29 = v42;

            objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "floatValue");
            if (v31 < v44)
              v31 = v44;

            objc_msgSend(v35, "objectAtIndexedSubscript:", 1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "floatValue");
            if (v30 < v46)
              v30 = v46;

            if (v34 + (int)v33 > 2)
              ++v27;
          }
          ++v33;
        }
        while (v25 != v33);
        v25 = -[VCPVideoObjectTracker countByEnumeratingWithState:objects:count:](tracker, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
      }
      while (v25);

      v17 = v97;
      self = v100;
      if (v27 < 6)
        goto LABEL_53;
      v47 = (float)(v31 + v32) * 0.5;
      v48 = (float)(v30 + v29) * 0.5;
      v49 = v100->_actionScoreAbsolute * 0.3;
      v50 = v49 + 0.25;
      v51 = v49 <= 0.15;
      v52 = 0.4;
      if (v51)
        v52 = v50;
      v53 = v30 - v29;
      if ((float)(v30 - v29) < (float)(v31 - v32))
        v53 = v31 - v32;
      v54 = v53 * 1.2;
      if (v54 >= v52)
        v52 = v54;
      if (v52 <= 0.5)
        v55 = v52;
      else
        v55 = 0.5;
      if (v95 > v94)
        v56 = v55;
      else
        v56 = (float)((float)v95 / (float)v94) * v55;
      if (v95 > v94)
        v55 = (float)((float)v94 / (float)v95) * v55;
      v57 = v100->_crop.size.width;
      v58 = (float)(v57 * 0.8) * 0.5;
      if (v55 < v58)
        v55 = v58;
      v59 = v100->_crop.size.height;
      v60 = (float)(v59 * 0.8) * 0.5;
      if (v56 >= v60)
        v60 = v56;
      v61 = v47 - v55;
      v62 = 0.01;
      if ((float)(v47 - v55) < 0.01)
        v61 = 0.01;
      v63 = v47 + v55;
      v64 = 0.99;
      if (v63 <= 0.99)
        v65 = v63;
      else
        v65 = 0.99;
      if ((float)(v48 - v60) >= 0.01)
        v62 = v48 - v60;
      v66 = v48 + v60;
      if (v66 <= 0.99)
        v64 = v66;
      v100->_crop.origin.x = v61;
      v100->_crop.origin.y = v62;
      v100->_crop.size.width = (float)(v65 - v61);
      v100->_crop.size.height = (float)(v64 - v62);
      -[VCPVideoPetsActionAnalyzer scaleRect:scaleX:scaleY:](v100, "scaleRect:scaleX:scaleY:");
      v68 = v67;
      v70 = v69;
      v72 = v71;
      v74 = v73;
      v75 = [VCPVideoObjectTracker alloc];
      v106 = *(_OWORD *)&v99->value;
      epoch = v99->epoch;
      v76 = -[VCPVideoObjectTracker initWithObjectBounds:inFrame:timestamp:](v75, "initWithObjectBounds:inFrame:timestamp:", v96, &v106, v68, v70, v72, v74);
      tracker = v100->_tracker;
      v100->_tracker = (VCPVideoObjectTracker *)v76;
    }

    v17 = v97;
    self = v100;
  }
LABEL_53:
  if ((unint64_t)-[NSMutableArray count](self->_bodyArray, "count") >= 7)
    -[NSMutableArray removeObjectAtIndex:](self->_bodyArray, "removeObjectAtIndex:", 0);
  -[NSMutableArray addObject:](self->_bodyArray, "addObject:", v17);
  if ((unint64_t)-[NSMutableArray count](self->_bodyArray, "count") >= 7)
  {
    -[VCPVideoPetsActionAnalyzer computeActionScore](self, "computeActionScore");
    *(float *)&v77 = self->_scoreAbsoluteMax;
    if (*(float *)&v77 < self->_actionScoreAbsolute)
      *(float *)&v77 = self->_actionScoreAbsolute;
    self->_scoreAbsoluteMax = *(float *)&v77;
    *(float *)&v77 = self->_scoreRelativeMax;
    if (*(float *)&v77 < self->_actionScoreRelative)
      *(float *)&v77 = self->_actionScoreRelative;
    self->_scoreRelativeMax = *(float *)&v77;
    *(float *)&v77 = self->_actionScoreRelative;
    objc_msgSend(v101, "setPetsActionScore:", v77);
    v78 = (_OWORD *)((char *)&self->_endTime.epoch + 4);
    lhs = *v99;
    rhs = *(CMTime *)((char *)&self->_endTime.epoch + 4);
    CMTimeSubtract(&time, &lhs, &rhs);
    if (CMTimeGetSeconds(&time) > 1.0)
    {
      v98 = v17;
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        scoreAbsoluteMax = self->_scoreAbsoluteMax;
        scoreRelativeMax = self->_scoreRelativeMax;
        LODWORD(lhs.value) = 134218240;
        *(double *)((char *)&lhs.value + 4) = scoreAbsoluteMax;
        LOWORD(lhs.flags) = 2048;
        *(double *)((char *)&lhs.flags + 2) = scoreRelativeMax;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VideoPetActionAnalyzer: _scoreAbsoluteMax = %f, _scoreRelativeMax =%f", (uint8_t *)&lhs, 0x16u);
      }
      v82 = (void *)MEMORY[0x1E0C99E08];
      v115[0] = CFSTR("petsAbsoluteScore");
      *(float *)&v79 = self->_scoreAbsoluteMax;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v79);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v115[1] = CFSTR("petsRelativeScore");
      v116[0] = v83;
      *(float *)&v84 = self->_scoreRelativeMax;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v116[1] = v85;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "dictionaryWithDictionary:", v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      actionResults = v100->_actionResults;
      v113[0] = CFSTR("start");
      *(_OWORD *)&lhs.value = *v78;
      lhs.epoch = *(_QWORD *)&self->_startTime.flags;
      v89 = CMTimeCopyAsDictionary(&lhs, 0);
      v114[0] = v89;
      v113[1] = CFSTR("duration");
      lhs = *v99;
      *(_OWORD *)&rhs.value = *v78;
      rhs.epoch = *(_QWORD *)&self->_startTime.flags;
      CMTimeSubtract(&v104, &lhs, &rhs);
      lhs = v104;
      v90 = CMTimeCopyAsDictionary(&lhs, 0);
      v113[2] = CFSTR("attributes");
      v114[1] = v90;
      v114[2] = v87;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 3);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](actionResults, "addObject:", v91);

      v92 = *(_OWORD *)&v99->value;
      *(_QWORD *)&self->_startTime.flags = v99->epoch;
      *v78 = v92;
      v100->_scoreAbsoluteMax = 0.0;
      v100->_scoreRelativeMax = 0.0;

      v17 = v98;
    }
  }
  objc_msgSend(v101, "setFrameProcessedByPetsActionAnalyzer:", 1);
LABEL_66:

  return 0;
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7
{
  size_t Width;
  size_t Height;
  double v12;
  $95D729B680665BEAEFA1D6FCA8238556 *p_timeLastProcess;
  CGRect *p_crop;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  os_signpost_id_t v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  VCPVideoPetsActionAnalyzer *v28;
  VCPVideoObjectTracker *tracker;
  __int128 v30;
  __int128 v31;
  CGFloat *p_x;
  double v33;
  double v34;
  CGSize v35;
  uint64_t v36;
  CGFloat y;
  VCPVideoPetsActionAnalyzer *v38;
  float v39;
  int v40;
  Float64 Seconds;
  VCPImagePetsKeypointsAnalyzer *poseAnalyzer;
  id v43;
  uint64_t v44;
  float v45;
  NSString *v46;
  double x;
  double v48;
  double v49;
  double v50;
  float v51;
  float v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  float v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  float v67;
  void *v68;
  void *v69;
  int v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  float v76;
  BOOL v77;
  int v78;
  id v79;
  VCPImagePetsKeypointsAnalyzer *v80;
  void *v81;
  __int128 v82;
  void *v83;
  BOOL v84;
  __int128 v85;
  _OWORD *v86;
  CGSize v87;
  CGSize v88;
  __int128 v89;
  uint64_t v91;
  $95D729B680665BEAEFA1D6FCA8238556 *p_lastPetTimestamp;
  BOOL *p_tracking;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v94;
  _OWORD *v96;
  __CVBuffer *cf;
  id v98;
  void *v100;
  id obj;
  void *v102;
  void *v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  unsigned int v107;
  VCPVideoPetsActionAnalyzer *v108;
  void *v109;
  uint64_t i;
  id v111;
  id v112;
  id v113;
  __int128 v114;
  int64_t v115;
  __int128 v116;
  int64_t var3;
  id v118;
  CMTime v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  CMTime v129;
  CMTime time;
  CFTypeRef v131;
  CMTime rhs;
  CMTime lhs;
  _BYTE v134[128];
  _BYTE v135[128];
  uint64_t v136;
  CGRect v137;
  NSRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  NSRect v142;
  CGRect v143;

  v136 = *MEMORY[0x1E0C80C00];
  v98 = a6;
  v131 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = a5;
  v108 = self;
  Width = CVPixelBufferGetWidth(a3);
  cf = a3;
  Height = CVPixelBufferGetHeight(a3);
  *(float *)&v12 = self->_actionScoreRelative;
  objc_msgSend(v98, "setPetsActionScore:", v12);
  objc_msgSend(v98, "setFrameProcessedByPetsActionAnalyzer:", 1);
  p_timeLastProcess = &self->_timeLastProcess;
  lhs = *(CMTime *)a4;
  rhs = (CMTime)self->_timeLastProcess;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) >= 0.150000006)
  {
    v28 = self;
    self->_sampleFlag = 1;
  }
  else
  {
    p_crop = &self->_crop;
    if (!CGRectIsEmpty(self->_crop) && self->_tracker)
    {
      VCPSignPostLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_signpost_id_generate(v15);

      VCPSignPostLog();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = v16 - 1;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        LOWORD(lhs.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPVideoPetsActionTracker", ", (uint8_t *)&lhs, 2u);
      }

      v111 = (id)Width;
      v20 = v16;
      v21 = -[VCPVideoObjectTracker trackObjectInFrame:](v108->_tracker, "trackObjectInFrame:", cf);
      if (v21)
        goto LABEL_22;
      VCPSignPostLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        LOWORD(lhs.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_END, v20, "VCPVideoPetsActionTracker", ", (uint8_t *)&lhs, 2u);
      }

      Width = (size_t)v111;
      -[VCPVideoObjectTracker objectBounds](v108->_tracker, "objectBounds");
      -[VCPVideoPetsActionAnalyzer scaleRect:scaleX:scaleY:](v108, "scaleRect:scaleX:scaleY:");
      p_crop->origin.x = v24;
      p_crop->origin.y = v25;
      p_crop->size.width = v26;
      p_crop->size.height = v27;
    }
    v28 = v108;
    if (!v108->_sampleFlag)
    {
      v103 = 0;
      v21 = 0;
      goto LABEL_78;
    }
  }
  tracker = v28->_tracker;
  v28->_tracker = 0;

  v30 = *(_OWORD *)&a4->var0;
  p_timeLastProcess->epoch = a4->var3;
  *(_OWORD *)&p_timeLastProcess->value = v30;
  v108->_actionScoreAbsolute = 0.0;
  v108->_sampleFlag = 0;
  v96 = (_OWORD *)((char *)&v108->_endTime.epoch + 4);
  if ((v108->_startTime.timescale & 1) == 0)
  {
    v31 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v108->_startTime.flags = a4->var3;
    *v96 = v31;
  }
  p_x = &v108->_crop.origin.x;
  v33 = v108->_crop.size.width;
  v34 = v108->_crop.size.height;
  if (fmin(v33, v34) < 0.100000001)
  {
    v35 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)p_x = *MEMORY[0x1E0C9D648];
    v108->_crop.size = v35;
    v33 = v108->_crop.size.width;
    v34 = v108->_crop.size.height;
  }
  v36 = *(_QWORD *)p_x;
  y = v108->_crop.origin.y;
  if (CGRectIsEmpty(*(CGRect *)(&v33 - 2)))
  {
    v131 = CFRetain(cf);
    v38 = v108;
    goto LABEL_23;
  }
  v137.origin.x = *p_x;
  v137.size.width = v108->_crop.size.width;
  v137.size.height = v108->_crop.size.height;
  v39 = 1.0 - v137.size.height - v108->_crop.origin.y;
  v137.origin.y = fmaxf(v39, 0.0);
  v38 = v108;
  v21 = Scaler::ScaleCropped(&v108->_scaler, v137, cf, (__CVBuffer **)&v131, Width, Height, 875704422);
  if (v21)
  {
LABEL_22:
    v103 = 0;
    goto LABEL_78;
  }
LABEL_23:
  p_lastPetTimestamp = &v38->_lastPetTimestamp;
  if ((v38->_lastPetTimestamp.flags & 1) != 0)
  {
    lhs = (CMTime)*a4;
    rhs = (CMTime)v38->_lastPetTimestamp;
    CMTimeSubtract(&v129, &lhs, &rhs);
    Seconds = CMTimeGetSeconds(&v129);
    v38 = v108;
    p_tracking = &v108->_tracking;
    v108->_tracking = Seconds < 1.0;
    if (Seconds < 1.0)
    {
      poseAnalyzer = v108->_poseAnalyzer;
      v128 = 0;
      v21 = -[VCPImagePetsKeypointsAnalyzer analyzePixelBuffer:flags:results:cancel:](poseAnalyzer, "analyzePixelBuffer:flags:results:cancel:", v131, a7, &v128, &__block_literal_global_47);
      v43 = v128;
      v103 = v43;
      if (v21)
        goto LABEL_76;
      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PetsKeypointsResults"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v135, 16);
      if (v44)
      {
        v106 = v44;
        v107 = 0;
        v104 = 0;
        v105 = *(_QWORD *)v125;
        v45 = 0.0;
        do
        {
          for (i = 0; i != v106; ++i)
          {
            if (*(_QWORD *)v125 != v105)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("attributes"));
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("petsKeypoints"));
            v112 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("petsBounds"));
            v46 = (NSString *)objc_claimAutoreleasedReturnValue();
            v138 = NSRectFromString(v46);
            x = v138.origin.x;
            v48 = v138.origin.y;
            v49 = v138.size.width;
            v50 = v138.size.height;

            v51 = fmax(v49, v50);
            if (v51 >= 0.1 && v51 >= 0.2)
            {
              if (v112)
              {
                v139.origin.x = *p_x;
                v139.origin.y = v108->_crop.origin.y;
                v139.size.width = v108->_crop.size.width;
                v139.size.height = v108->_crop.size.height;
                v52 = 0.0;
                if (CGRectIsEmpty(v139))
                {
                  v53 = v112;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v122 = 0u;
                  v123 = 0u;
                  v120 = 0u;
                  v121 = 0u;
                  v113 = v112;
                  v54 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
                  if (v54)
                  {
                    v55 = *(_QWORD *)v121;
                    do
                    {
                      for (j = 0; j != v54; ++j)
                      {
                        if (*(_QWORD *)v121 != v55)
                          objc_enumerationMutation(v113);
                        v57 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * j);
                        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        v59 = (void *)MEMORY[0x1E0CB37E8];
                        v60 = *p_x;
                        objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
                        v61 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v61, "floatValue");
                        objc_msgSend(v59, "numberWithDouble:", v60 + v62 * v108->_crop.size.width);
                        v63 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v58, "setObject:atIndexedSubscript:", v63, 0);

                        v64 = (void *)MEMORY[0x1E0CB37E8];
                        v65 = v108->_crop.origin.y;
                        objc_msgSend(v57, "objectAtIndexedSubscript:", 1);
                        v66 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v66, "floatValue");
                        objc_msgSend(v64, "numberWithDouble:", v65 + v67 * v108->_crop.size.height);
                        v68 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v58, "setObject:atIndexedSubscript:", v68, 1);

                        objc_msgSend(v57, "objectAtIndexedSubscript:", 2);
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v69, "floatValue");
                        LODWORD(v65) = v70;

                        LODWORD(v71) = LODWORD(v65);
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v71);
                        v72 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v58, "setObject:atIndexedSubscript:", v72, 2);

                        objc_msgSend(v53, "addObject:", v58);
                        if (*(float *)&v65 > 0.15)
                          v52 = v52 + 1.0;

                      }
                      v54 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
                    }
                    while (v54);
                  }

                  v112 = v53;
                }
                objc_msgSend(v102, "addObject:", v53);
              }
              else
              {
                v112 = 0;
                v52 = 0.0;
              }
              v140.origin.x = x;
              v140.origin.y = v48;
              v140.size.width = v49;
              v140.size.height = v50;
              if (!CGRectIsEmpty(v140))
              {
                v141.origin.x = *p_x;
                v141.origin.y = v108->_crop.origin.y;
                v141.size.width = v108->_crop.size.width;
                v141.size.height = v108->_crop.size.height;
                if (!CGRectIsEmpty(v141))
                {
                  v73 = v108->_crop.size.width;
                  v74 = v108->_crop.size.height;
                  x = *p_x + x * v73;
                  v48 = v108->_crop.origin.y + v48 * v74;
                  v49 = v49 * v73;
                  v50 = v50 * v74;
                }
                v142.origin.x = x;
                v142.origin.y = v48;
                v142.size.width = v49;
                v142.size.height = v50;
                NSStringFromRect(v142);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "addObject:", v75);

                if (!CGRectIsEmpty(v108->_petRect))
                {
                  -[VCPVideoPetsActionAnalyzer intersectionOverUnion:rect:](v108, "intersectionOverUnion:rect:", v108->_petRect.origin.x, v108->_petRect.origin.y, v108->_petRect.size.width, v108->_petRect.size.height, x, v48, v49, v50);
                  v52 = v76 + 0.1;
                }
              }
              v77 = v52 <= v45;
              if (v52 > v45)
                v45 = v52;
              v78 = v107;
              if (!v77)
                v78 = v104;
              v107 = v78;
              ++v104;
            }

          }
          v106 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v135, 16);
        }
        while (v106);
      }
      else
      {
        v107 = 0;
      }

      v91 = objc_msgSend(v100, "count");
      if (v91 != objc_msgSend(v102, "count"))
      {
        v21 = -50;
        goto LABEL_76;
      }
      v40 = 1;
      v38 = v108;
    }
    else
    {
      v40 = 0;
      v107 = 0;
      v103 = 0;
    }
  }
  else
  {
    v40 = 0;
    v107 = 0;
    v103 = 0;
    p_tracking = &v38->_tracking;
    v38->_tracking = 0;
  }
  lhs = (CMTime)*a4;
  rhs = (CMTime)v38->_timeLastProcessFullFrame;
  CMTimeSubtract(&v119, &lhs, &rhs);
  if (CMTimeGetSeconds(&v119) < 1.0)
  {
LABEL_71:
    if (objc_msgSend(v102, "count"))
    {
      v116 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      v114 = *(_OWORD *)&v94->var0;
      v115 = v94->var3;
      v21 = -[VCPVideoPetsActionAnalyzer processPets:petsBounds:dominantPetIdx:frame:timestamp:duration:frameStats:](v108, "processPets:petsBounds:dominantPetIdx:frame:timestamp:duration:frameStats:", v102, v100, v107, cf, &v116, &v114, v98);
    }
    else
    {
      v86 = (_OWORD *)MEMORY[0x1E0C9D648];
      v87 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      v108->_petRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      v108->_petRect.size = v87;
      if (!*p_tracking)
      {
        v88 = (CGSize)v86[1];
        *(_OWORD *)p_x = *v86;
        v108->_crop.size = v88;
      }
      -[NSMutableArray removeAllObjects](v108->_bodyArray, "removeAllObjects");
      v21 = 0;
      v89 = *(_OWORD *)&a4->var0;
      *(_QWORD *)&v108->_startTime.flags = a4->var3;
      *v96 = v89;
    }
    goto LABEL_76;
  }
  v143.origin.x = *p_x;
  v143.origin.y = v108->_crop.origin.y;
  v143.size.width = v108->_crop.size.width;
  v143.size.height = v108->_crop.size.height;
  if ((v40 & CGRectIsEmpty(v143)) == 1)
  {
    v79 = v103;
LABEL_68:
    v82 = *(_OWORD *)&a4->var0;
    v38->_timeLastProcessFullFrame.epoch = a4->var3;
    *(_OWORD *)&v38->_timeLastProcessFullFrame.value = v82;
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("PetsKeypointsResults"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "count") == 0;

    if (!v84)
    {
      v85 = *(_OWORD *)&a4->var0;
      p_lastPetTimestamp->epoch = a4->var3;
      *(_OWORD *)&p_lastPetTimestamp->value = v85;
    }

    goto LABEL_71;
  }
  v80 = v108->_poseAnalyzer;
  objc_msgSend(v98, "petsDetections");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0;
  v21 = -[VCPImagePetsKeypointsAnalyzer analyzePixelBuffer:flags:petsDetections:results:cancel:](v80, "analyzePixelBuffer:flags:petsDetections:results:cancel:", cf, a7, v81, &v118, &__block_literal_global_158_0);
  v79 = v118;

  if (!v21)
    goto LABEL_68;

LABEL_76:
  if (v131)
    CFRelease(v131);
LABEL_78:

  return v21;
}

uint64_t __79__VCPVideoPetsActionAnalyzer_analyzeFrame_timestamp_duration_frameStats_flags___block_invoke()
{
  return 0;
}

uint64_t __79__VCPVideoPetsActionAnalyzer_analyzeFrame_timestamp_duration_frameStats_flags___block_invoke_2()
{
  return 0;
}

- (int)finishAnalysisPass:(id *)a3
{
  uint8_t v4[16];

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VideoPetActionAnalyzer: finishAnalysisPass", v4, 2u);
  }
  return 0;
}

- (id)results
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_actionResults, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_actionResults, CFSTR("PetsActionResults"));
  return v3;
}

- (void).cxx_destruct
{
  Scaler *p_scaler;

  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_timeOfInterest, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_poseResults, 0);
  objc_storeStrong((id *)&self->_keyPetResults, 0);
  objc_storeStrong((id *)&self->_actionResults, 0);
  objc_storeStrong((id *)&self->_bodyArray, 0);
  objc_storeStrong((id *)&self->_poseAnalyzer, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 37) = 0;
  *((_DWORD *)self + 76) = 0;
  return self;
}

@end
