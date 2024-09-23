@implementation AXOutputRequest

+ (id)processString:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7 category:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a8;
  v15 = (void *)objc_opt_new();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v14;
    if ((unint64_t)objc_msgSend(v11, "length") < 0x3E9)
    {
      v21 = 0;
    }
    else
    {
      v17 = 0;
      v18 = v11;
      while (2)
      {
        v19 = 1000;
        while ((objc_msgSend(v16, "characterIsMember:", objc_msgSend(v18, "characterAtIndex:", v19)) & 1) == 0)
        {
          if (--v19 == -1)
          {
            v19 = objc_msgSend(v18, "length");
            if (v19 < 0)
            {
              v11 = v18;
              v21 = v17;
              goto LABEL_14;
            }
            break;
          }
        }
        objc_msgSend(v18, "substringToIndex:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_allocWithZone((Class)AXOutputAction), "initWithString:brailleString:", v20, v12);

        objc_msgSend(v21, "setWasDivided:", 1);
        objc_msgSend(v21, "setObject:forVariant:", v13, 15);
        objc_msgSend(v15, "addObject:", v21);
        v22 = v19 + 1;
        if (v22 >= objc_msgSend(v18, "length"))
        {

          v11 = v18;
        }
        else
        {
          objc_msgSend(v18, "substringFromIndex:", v22);
          v11 = (id)objc_claimAutoreleasedReturnValue();

          v18 = v11;
          v17 = v21;
          if ((unint64_t)objc_msgSend(v11, "length") > 0x3E8)
            continue;
        }
        break;
      }
    }
LABEL_14:
    if (objc_msgSend(v11, "length"))
    {
      v23 = (void *)objc_msgSend(objc_allocWithZone((Class)AXOutputAction), "initWithString:brailleString:", v11, v12);

      objc_msgSend(v23, "setWasDivided:", 1);
      v14 = v25;
      objc_msgSend(v23, "setObject:forVariant:", v25, 86);
      if (objc_msgSend(v13, "length"))
        objc_msgSend(v23, "setObject:forVariant:", v13, 15);
      objc_msgSend(v15, "addObject:", v23);
    }
    else
    {
      v23 = v21;
      v14 = v25;
    }

  }
  return v15;
}

+ (id)processStringsAndLanguages:(id)a3 brailleString:(id)a4 breakWords:(BOOL)a5 withLanguage:(id)a6 atIndex:(int64_t)a7 category:(id)a8
{
  id v12;
  id v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __CFString *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  id v35;
  uint64_t v36;
  int64_t v37;
  id obj;
  _BOOL4 v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v39 = a5;
  v52 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (__CFString *)a6;
  v40 = a8;
  v15 = (void *)objc_opt_new();
  if (v12)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v35 = v12;
    obj = v12;
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v41)
    {
      v16 = *(_QWORD *)v47;
      v17 = MEMORY[0x1E0C9AAB0];
      v36 = *(_QWORD *)v47;
      v37 = a7;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v47 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("language"));
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[__CFString isEqual:](v20, "isEqual:", v21);

          if ((v22 & 1) != 0 || !v20)
          {

            v14 = &stru_1E24CAB08;
          }
          else
          {
            v14 = v20;
          }
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("string"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[AXOutputRequest processString:brailleString:breakWords:withLanguage:atIndex:category:](AXOutputRequest, "processString:brailleString:breakWords:withLanguage:atIndex:category:", v23, v13, v39, v14, a7, v40);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "axSafelyAddObjectsFromArray:", v24);
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("skipsUnpronounceable"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "BOOLValue");

          if (v26)
          {
            v27 = v15;
            v28 = v13;
            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            v29 = v24;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v43;
              do
              {
                for (j = 0; j != v31; ++j)
                {
                  if (*(_QWORD *)v43 != v32)
                    objc_enumerationMutation(v29);
                  objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "setObject:forVariant:", v17, 83);
                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
              }
              while (v31);
            }

            v13 = v28;
            v15 = v27;
            v16 = v36;
            a7 = v37;
          }

        }
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v41);
    }

    v12 = v35;
  }

  return v15;
}

+ (id)addAttributesToAction:(id)a3 fromDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  _QWORD *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  void *v46;
  void *v47;
  _QWORD *v48;
  void *v49;
  void *v50;
  uint64_t *v51;
  void *v52;
  int v53;
  uint64_t *v54;
  uint64_t v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  int v62;
  _QWORD *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  _QWORD *v73;
  void *v74;
  void *v75;
  _QWORD *v76;
  void *v77;
  char v78;
  void *v79;
  int v80;
  uint64_t v81;
  void *v82;
  void *v83;
  float v84;
  double v85;
  double v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t *v91;
  _QWORD *v92;
  void *v93;
  void *v94;
  _QWORD *v95;
  void *v96;
  void *v97;
  _QWORD *v98;
  void *v99;
  void *v100;
  _QWORD *v101;
  void *v102;
  int v103;
  void *v104;
  int v105;
  id v106;
  uint64_t v108;
  void *v109;
  void *v110;
  int v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  void *v125;
  int v126;
  void *v127;
  int v128;
  void *v129;
  int v130;
  _QWORD *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  _QWORD *v136;
  void *v137;
  void *v138;
  int v139;
  _QWORD v140[4];
  id v141;
  uint64_t v142;
  uint64_t v143;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4160]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    v9 = *MEMORY[0x1E0C9AE50];
    v10 = v5;
    v11 = 45;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4248]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      v9 = *MEMORY[0x1E0C9AE50];
      v10 = v5;
      v11 = 46;
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CF42B0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      if (v15)
      {
        v9 = *MEMORY[0x1E0C9AE50];
        v10 = v5;
        v11 = 41;
      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CF42F8]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "BOOLValue");

        if (v17)
        {
          v9 = *MEMORY[0x1E0C9AE50];
          v10 = v5;
          v11 = 65;
        }
        else
        {
          objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4270]);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "BOOLValue");

          if (v19)
          {
            v9 = *MEMORY[0x1E0C9AE50];
            v10 = v5;
            v11 = 44;
          }
          else
          {
            objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4190]);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "BOOLValue");

            if (!v21)
            {
              objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4170]);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              v120 = objc_msgSend(v119, "BOOLValue");

              if (v120)
              {
                objc_msgSend(v5, "string");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "lowercaseString");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setString:", v122);

              }
              else
              {
                objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4188]);
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                v124 = objc_msgSend(v123, "BOOLValue");

                if (v124)
                {
                  v9 = *MEMORY[0x1E0C9AE50];
                  v10 = v5;
                  v11 = 47;
                  goto LABEL_13;
                }
                objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4198]);
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                v126 = objc_msgSend(v125, "BOOLValue");

                if (v126)
                {
                  v9 = *MEMORY[0x1E0C9AE50];
                  v10 = v5;
                  v11 = 48;
                  goto LABEL_13;
                }
                objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4178]);
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                v128 = objc_msgSend(v127, "BOOLValue");

                if (v128)
                {
                  v9 = *MEMORY[0x1E0C9AE50];
                  v10 = v5;
                  v11 = 49;
                  goto LABEL_13;
                }
                objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF42B8]);
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                v130 = objc_msgSend(v129, "BOOLValue");

                if (v130)
                {
                  v9 = *MEMORY[0x1E0C9AE50];
                  v10 = v5;
                  v11 = 51;
                  goto LABEL_13;
                }
                v131 = (_QWORD *)MEMORY[0x1E0CF4288];
                objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4288]);
                v132 = (void *)objc_claimAutoreleasedReturnValue();

                if (v132)
                {
                  objc_msgSend(v6, "objectForKey:", *v131);
                  v121 = (void *)objc_claimAutoreleasedReturnValue();
                  v133 = v5;
                  v134 = v121;
                  v135 = 75;
                }
                else
                {
                  v136 = (_QWORD *)MEMORY[0x1E0CF4138];
                  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4138]);
                  v137 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v137)
                  {
                    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4278]);
                    v138 = (void *)objc_claimAutoreleasedReturnValue();
                    v139 = objc_msgSend(v138, "BOOLValue");

                    if (!v139)
                      goto LABEL_14;
                    v9 = *MEMORY[0x1E0C9AE50];
                    v10 = v5;
                    v11 = 64;
                    goto LABEL_13;
                  }
                  objc_msgSend(v6, "objectForKey:", *v136);
                  v121 = (void *)objc_claimAutoreleasedReturnValue();
                  v133 = v5;
                  v134 = v121;
                  v135 = 85;
                }
                objc_msgSend(v133, "setObject:forVariant:", v134, v135);
              }

              goto LABEL_14;
            }
            v9 = *MEMORY[0x1E0C9AE50];
            v10 = v5;
            v11 = 60;
          }
        }
      }
    }
  }
LABEL_13:
  objc_msgSend(v10, "setObject:forVariant:", v9, v11);
LABEL_14:
  v22 = *MEMORY[0x1E0CF4048];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4048]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v6, "objectForKey:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forVariant:", v24, 78);

    objc_msgSend(v5, "setObject:forVariant:", MEMORY[0x1E0C9AAB0], 54);
  }
  v25 = *MEMORY[0x1E0CF4068];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4068]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v6, "objectForKey:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forVariant:", v27, 79);

  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4200]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "BOOLValue");

  if (v29)
    objc_msgSend(v5, "setObject:forVariant:", *MEMORY[0x1E0C9AE50], 52);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *MEMORY[0x1E0CF4490]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "BOOLValue");

  if (v32)
    objc_msgSend(v5, "setObject:forVariant:", *MEMORY[0x1E0C9AE50], 53);
  v33 = (_QWORD *)MEMORY[0x1E0CF41C8];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF41C8]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v6, "objectForKey:", *v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forVariant:", v35, 62);

  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4268]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "BOOLValue");

  if (v37)
    objc_msgSend(v5, "setObject:forVariant:", *MEMORY[0x1E0C9AE50], 55);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4230]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "BOOLValue");

  if (v39)
    objc_msgSend(v5, "setObject:forVariant:", *MEMORY[0x1E0C9AE50], 56);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF41D0]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "BOOLValue");

  if (v41)
    objc_msgSend(v5, "setObject:forVariant:", *MEMORY[0x1E0C9AE50], 66);
  v42 = (_QWORD *)MEMORY[0x1E0CF41F8];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF41F8]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
    goto LABEL_31;
  v108 = *MEMORY[0x1E0CF4040];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4040]);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (v109)
  {
    objc_msgSend(v6, "objectForKey:", v108);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v44, "length"))
      goto LABEL_33;
    goto LABEL_32;
  }
  v42 = (_QWORD *)MEMORY[0x1E0CF4118];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4118]);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (v112
    || (v42 = (_QWORD *)MEMORY[0x1E0CF4240],
        objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4240]),
        v113 = (void *)objc_claimAutoreleasedReturnValue(),
        v113,
        v113))
  {
LABEL_31:
    objc_msgSend(v6, "objectForKey:", *v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
    objc_msgSend(v5, "setObject:forVariant:", v44, 15);
LABEL_33:

  }
  v45 = (_QWORD *)MEMORY[0x1E0CF4250];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4250]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v6, "objectForKey:", *v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forVariant:", v47, 16);

  }
  v48 = (_QWORD *)MEMORY[0x1E0CF4180];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4180]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v6, "objectForKey:", *v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forVariant:", v50, 77);

  }
  v51 = (uint64_t *)MEMORY[0x1E0CF42E8];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF42E8]);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "BOOLValue");

  v54 = (uint64_t *)MEMORY[0x1E0CF42F0];
  if (v53)
  {
    v55 = *v51;
LABEL_42:
    v58 = v5;
    v59 = 30;
LABEL_43:
    objc_msgSend(v58, "setObject:forVariant:", v55, v59);
    goto LABEL_44;
  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF42F0]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "BOOLValue");

  if (v57)
  {
    v55 = *v54;
    goto LABEL_42;
  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF42E0]);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "BOOLValue");

  if (v111)
  {
    v55 = *MEMORY[0x1E0C9AE50];
    v58 = v5;
    v59 = 31;
    goto LABEL_43;
  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF41D8]);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v114, "BOOLValue");

  if (v115)
  {
    v55 = *MEMORY[0x1E0C9AE50];
    v58 = v5;
    v59 = 70;
    goto LABEL_43;
  }
  v116 = *MEMORY[0x1E0CF4100];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4100]);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (v117)
  {
    objc_msgSend(v6, "objectForKey:", v116);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forVariant:", v118, 88);

  }
LABEL_44:
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4218]);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v60, "BOOLValue"))
  {

  }
  else
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4060]);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "BOOLValue");

    if (!v62)
      goto LABEL_48;
  }
  objc_msgSend(v5, "setObject:forVariant:", *MEMORY[0x1E0C9AE50], 28);
LABEL_48:
  v63 = (_QWORD *)MEMORY[0x1E0CF4120];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CF4120]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forVariant:", v65, 42);

  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4220]);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v5, "rangeOfString");
  if (v66)
  {
    v69 = v67;
    v70 = v68;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v140[0] = MEMORY[0x1E0C809B0];
    v140[1] = 3221225472;
    v140[2] = __56__AXOutputRequest_addAttributesToAction_fromDictionary___block_invoke;
    v140[3] = &unk_1E24C6ED8;
    v142 = v69;
    v143 = v70;
    v72 = v71;
    v141 = v72;
    objc_msgSend(v66, "enumerateRangesUsingBlock:", v140);
    objc_msgSend(v5, "setObject:forVariant:", v72, 29);

  }
  v73 = (_QWORD *)MEMORY[0x1E0CF4318];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4318]);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    objc_msgSend(v6, "objectForKey:", *v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setString:", v75);

    objc_msgSend(v5, "setObject:forVariant:", MEMORY[0x1E0C9AAB0], 54);
  }
  v76 = (_QWORD *)MEMORY[0x1E0CF41C0];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF41C0]);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "BOOLValue");

  if ((v78 & 1) != 0
    || (v76 = (_QWORD *)MEMORY[0x1E0CF4228],
        objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4228]),
        v79 = (void *)objc_claimAutoreleasedReturnValue(),
        v80 = objc_msgSend(v79, "BOOLValue"),
        v79,
        v80))
  {
    objc_msgSend(v5, "setObject:forVariant:", *v76, 32);
  }
  v81 = *MEMORY[0x1E0CF4050];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4050]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    objc_msgSend(v6, "objectForKey:", v81);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v83, "floatValue");
      v85 = v84;
      if (v85 > 2.0)
        v85 = 2.0;
      v86 = fmax(v85, 0.0);
      *(float *)&v86 = v86;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forVariant:", v87, 32);

    }
  }
  v88 = *MEMORY[0x1E0CF4058];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4058]);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    objc_msgSend(v6, "objectForKey:", v88);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v90, "BOOLValue"))
      v91 = v51;
    else
      v91 = v54;
    objc_msgSend(v5, "setObject:forVariant:", *v91, 30);

  }
  v92 = (_QWORD *)MEMORY[0x1E0CF42D8];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF42D8]);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (v93)
  {
    objc_msgSend(v6, "objectForKey:", *v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forVariant:", v94, 71);

  }
  v95 = (_QWORD *)MEMORY[0x1E0CF4158];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4158]);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
  {
    objc_msgSend(v6, "objectForKey:", *v95);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forVariant:", v97, 72);

  }
  v98 = (_QWORD *)MEMORY[0x1E0CF4150];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4150]);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (v99)
  {
    objc_msgSend(v6, "objectForKey:", *v98);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forVariant:", v100, 73);

  }
  v101 = (_QWORD *)MEMORY[0x1E0CF4280];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4280]);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v102, "BOOLValue");

  if (v103)
    objc_msgSend(v5, "setObject:forVariant:", *v101, 32);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4130]);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v104, "BOOLValue");

  if (v105)
    objc_msgSend(v5, "setObject:forVariant:", *MEMORY[0x1E0C9AE50], 61);
  v106 = v5;

  return v106;
}

NSUInteger __56__AXOutputRequest_addAttributesToAction_fromDictionary___block_invoke(uint64_t a1, NSRange range2)
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger result;
  NSRange v6;
  NSRange v7;

  length = range2.length;
  location = range2.location;
  v7.location = range2.location;
  v7.length = length;
  v6 = NSIntersectionRange(*(NSRange *)(a1 + 40), v7);
  result = v6.location;
  if (v6.length)
    return objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", location - *(_QWORD *)(a1 + 40), length);
  return result;
}

@end
