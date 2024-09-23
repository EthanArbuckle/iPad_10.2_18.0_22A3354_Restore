@implementation IHKFilterSequence

+ (id)getScalarInputsForCIFilterNamed:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v39;
  id v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v40 = (id)objc_opt_new();
  objc_msgSend_filterWithName_(MEMORY[0x24BDBF658], v3, (uint64_t)v39, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  if (v6)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend_inputKeys(v6, v7, v8, v9, v10);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v42, (uint64_t)v46, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v43;
      v19 = *MEMORY[0x24BDBF700];
      v20 = *MEMORY[0x24BDBF760];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend_attributes(v11, v13, v14, v15, v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v23, v24, v22, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v27, v28, v19, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_isEqualToString_(v31, v32, v20, v33, v34))
            objc_msgSend_addObject_(v40, v35, v22, v36, v37);

        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v42, (uint64_t)v46, 16);
      }
      while (v17);
    }

  }
  else
  {
    NSLog(CFSTR("Could not find filter named %@"), v39);
  }

  return v40;
}

+ (id)paramToInputName:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v3 = a3;
  v8 = v3;
  if (v3 && objc_msgSend_length(v3, v4, v5, v6, v7))
  {
    v13 = 0;
    v14 = CFSTR("input");
    do
    {
      v15 = 0;
      do
      {
        v16 = v15;
        if (v13 + v15 + 1 >= objc_msgSend_length(v8, v9, v10, v11, v12))
          break;
        v17 = objc_retainAutorelease(v8);
        v22 = objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
        v15 = v16 + 1;
      }
      while (*(_BYTE *)(v22 + v13 + v16 + 1) != 95);
      objc_msgSend_substringWithRange_(v8, v9, v13, v16 + 1, v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringToIndex_(v23, v24, 1, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringFromIndex_(v23, v28, 1, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_uppercaseString(v27, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v32, v38, (uint64_t)CFSTR("%@%@%@"), v39, v40, v14, v37, v31);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v13 += v16 + 2;
      v14 = v41;
    }
    while (v13 < objc_msgSend_length(v8, v42, v43, v44, v45));
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

+ (id)breakPascalCaseIntoWords:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  const __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __darwin_ct_rune_t v18;
  __darwin_ct_rune_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __darwin_ct_rune_t v25;
  __darwin_ct_rune_t v26;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v7 = a3;
  v8 = 0;
  v9 = &stru_250F5DBC0;
  v10 = &stru_250F5DBC0;
  do
  {
    v11 = 0;
    do
    {
      v12 = v11;
      if (v8 + v11 + 1 >= objc_msgSend_length(v7, v3, v4, v5, v6))
        break;
      v13 = objc_retainAutorelease(v7);
      v18 = *(char *)(objc_msgSend_UTF8String(v13, v14, v15, v16, v17) + v8 + v12 + 1);
      v19 = __toupper(v18);
      v20 = objc_retainAutorelease(v13);
      v25 = *(char *)(objc_msgSend_UTF8String(v20, v21, v22, v23, v24) + v8 + v12);
      v26 = __toupper(v25);
      v11 = v12 + 1;
    }
    while (v19 != v18 || v26 == v25);
    objc_msgSend_substringWithRange_(v7, v3, v8, v12 + 1, v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v29, (uint64_t)CFSTR("%@%@%@"), v30, v31, v10, v9, v28);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v8 += v12 + 1;
    v9 = CFSTR(" ");
    v10 = v32;
  }
  while (v8 < objc_msgSend_length(v7, v33, v34, v35, v36));

  return v32;
}

+ (id)uiNameForParamName:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  v8 = objc_msgSend_length(CFSTR("input"), v4, v5, v6, v7);
  objc_msgSend_substringFromIndex_(v3, v9, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_breakPascalCaseIntoWords_(IHKFilterSequence, v13, (uint64_t)v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)uiNameForCIFilterName:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t i;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __darwin_ct_rune_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  v7 = a3;
  for (i = 0; i < objc_msgSend_length(v7, v3, v4, v5, v6); ++i)
  {
    v9 = objc_retainAutorelease(v7);
    v14 = objc_msgSend_UTF8String(v9, v10, v11, v12, v13);
    v15 = __tolower(*(char *)(v14 + i));
    v16 = objc_retainAutorelease(v9);
    if (v15 == *(char *)(objc_msgSend_UTF8String(v16, v17, v18, v19, v20) + i))
      break;
  }
  if ((int)i <= 1)
    v21 = 1;
  else
    v21 = i;
  v22 = objc_msgSend_length(v7, v3, v4, v5, v6);
  if (objc_msgSend_hasSuffix_(v7, v23, (uint64_t)CFSTR("Filter"), v24, v25))
    v22 -= objc_msgSend_length(CFSTR("Filter"), v26, v27, v28, v29);
  objc_msgSend_substringWithRange_(v7, v26, (v21 - 1), v22 - (v21 - 1), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_breakPascalCaseIntoWords_(IHKFilterSequence, v31, (uint64_t)v30, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (id)uiNameForCIFilter:(id)a3 paramName:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, (uint64_t)CFSTR("%@.%@"), v8, v9, v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(&unk_250F62678, v11, (uint64_t)v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (objc_msgSend_isEqualToString_(v6, v15, (uint64_t)CFSTR("inputStrength"), v16, v17))
      objc_msgSend_uiNameForCIFilterName_(IHKFilterSequence, v18, (uint64_t)v5, v19, v20);
    else
      objc_msgSend_uiNameForParamName_(IHKFilterSequence, v18, (uint64_t)v6, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (id)parseFilterSequenceSpec:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  id v63;
  id obj;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v63 = a3;
  v66 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend_componentsSeparatedByString_(v63, v4, (uint64_t)CFSTR("->"), v5, v6);
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v73, (uint64_t)v80, 16);
  if (v8)
  {
    v65 = *(_QWORD *)v74;
    do
    {
      v12 = 0;
      v67 = v8;
      do
      {
        if (*(_QWORD *)v74 != v65)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v12);
        v14 = objc_msgSend_rangeOfString_(v13, v9, (uint64_t)CFSTR("["), v10, v11);
        v16 = v15;
        v19 = objc_msgSend_rangeOfString_(v13, v15, (uint64_t)CFSTR("]"), v17, v18);
        v21 = v20;
        v22 = v13;
        v26 = (void *)objc_opt_new();
        if (v16)
          v27 = v21 == 0;
        else
          v27 = 1;
        v68 = v22;
        if (v27)
        {
          objc_msgSend_getScalarInputsForCIFilterNamed_(a1, v23, (uint64_t)v22, v24, v25);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v26;
          v26 = (void *)objc_msgSend_mutableCopy(v33, v28, v29, v30, v31);
        }
        else
        {
          objc_msgSend_substringWithRange_(v22, v23, v14 + 1, v19 + ~v14, v25);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          objc_msgSend_componentsSeparatedByString_(v33, v34, (uint64_t)CFSTR(","), v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v69, (uint64_t)v79, 16);
          v43 = v39;
          if (v39)
          {
            v44 = *(_QWORD *)v70;
            do
            {
              v45 = 0;
              do
              {
                if (*(_QWORD *)v70 != v44)
                  objc_enumerationMutation(v37);
                objc_msgSend_paramToInputName_(a1, v40, *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v45), v41, v42);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v26, v47, (uint64_t)v46, v48, v49);

                ++v45;
              }
              while (v43 != v45);
              v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v69, (uint64_t)v79, 16);
            }
            while (v43);
          }

          v32 = v68;
          objc_msgSend_substringToIndex_(v68, v50, v14, v51, v52);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend_sortedArrayUsingSelector_(v26, v53, (uint64_t)sel_compare_, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v77[0] = CFSTR("filterName");
        v77[1] = CFSTR("inputNames");
        v78[0] = v68;
        v78[1] = v56;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v57, (uint64_t)v78, (uint64_t)v77, 2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v66, v59, (uint64_t)v58, v60, v61);

        ++v12;
      }
      while (v12 != v67);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v73, (uint64_t)v80, 16);
    }
    while (v8);
  }

  return v66;
}

- (IHKFilterSequence)initWithFilterSpec:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  double v95;
  IHKSliderSpec *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  id v111;
  IHKFilterSequence *v112;
  id obj;
  uint64_t v114;
  uint64_t v115;
  uint64_t i;
  id v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  objc_super v131;
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  v111 = a3;
  v131.receiver = self;
  v131.super_class = (Class)IHKFilterSequence;
  v112 = -[IHKFilterSequence init](&v131, sel_init);
  if (v112)
  {
    objc_msgSend_parseFilterSequenceSpec_(IHKFilterSequence, v4, (uint64_t)v111, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFilterSeq_(v112, v8, (uint64_t)v7, v9, v10);

    v121 = (void *)objc_opt_new();
    v120 = (void *)objc_opt_new();
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    objc_msgSend_filterSeq(v112, v11, v12, v13, v14);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v127, (uint64_t)v133, 16);
    if (v115)
    {
      v114 = *(_QWORD *)v128;
      v118 = *MEMORY[0x24BDBF6D8];
      v119 = *MEMORY[0x24BDBF6E0];
      v19 = *MEMORY[0x24BDBF6D0];
      do
      {
        for (i = 0; i != v115; ++i)
        {
          if (*(_QWORD *)v128 != v114)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v20, v16, (uint64_t)CFSTR("filterName"), v17, v18);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_filterWithName_(MEMORY[0x24BDBF658], v21, (uint64_t)v122, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = 0u;
          v126 = 0u;
          v123 = 0u;
          v124 = 0u;
          objc_msgSend_objectForKeyedSubscript_(v20, v25, (uint64_t)CFSTR("inputNames"), v26, v27);
          v117 = (id)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v28, (uint64_t)&v123, (uint64_t)v132, 16);
          if (v31)
          {
            v32 = *(_QWORD *)v124;
            do
            {
              for (j = 0; j != v31; ++j)
              {
                if (*(_QWORD *)v124 != v32)
                  objc_enumerationMutation(v117);
                v34 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * j);
                objc_msgSend_uiNameForCIFilter_paramName_(IHKFilterSequence, v29, (uint64_t)v122, v34, v30);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v121, v36, (uint64_t)v35, v37, v38);
                objc_msgSend_attributes(v24, v39, v40, v41, v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v43, v44, v34, v45, v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v47, v48, v119, v49, v50);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_doubleValue(v51, v52, v53, v54, v55);
                v57 = v56;

                objc_msgSend_attributes(v24, v58, v59, v60, v61);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v62, v63, v34, v64, v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v66, v67, v118, v68, v69);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_doubleValue(v70, v71, v72, v73, v74);
                v76 = v75;

                objc_msgSend_attributes(v24, v77, v78, v79, v80);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v81, v82, v34, v83, v84);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v85, v86, v19, v87, v88);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_doubleValue(v89, v90, v91, v92, v93);
                v95 = v94;

                v96 = [IHKSliderSpec alloc];
                v101 = (void *)objc_msgSend_initWithMin_max_identity_(v96, v97, v98, v99, v100, v57, v76, v95);
                objc_msgSend_setObject_forKeyedSubscript_(v120, v102, (uint64_t)v101, (uint64_t)v35, v103);

              }
              v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v29, (uint64_t)&v123, (uint64_t)v132, 16);
            }
            while (v31);
          }

        }
        v115 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v127, (uint64_t)v133, 16);
      }
      while (v115);
    }

    objc_msgSend_setSliderOrder_(v112, v104, (uint64_t)v121, v105, v106);
    objc_msgSend_setSliderSpecs_(v112, v107, (uint64_t)v120, v108, v109);

  }
  return v112;
}

- (id)packageSliderValues:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  id obj;
  id v46;
  IHKFilterSequence *v47;
  uint64_t i;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t j;
  id v54;
  void *v55;
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
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  v46 = (id)objc_opt_new();
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend_filterSeq(self, v4, v5, v6, v7);
  v47 = self;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v64, (uint64_t)v70, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v65 != v44)
          objc_enumerationMutation(obj);
        v51 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v51, v9, (uint64_t)CFSTR("filterName"), v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)objc_opt_new();
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        objc_msgSend_sliderOrder(v47, v13, v14, v15, v16);
        v49 = (id)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v17, (uint64_t)&v60, (uint64_t)v69, 16);
        if (v52)
        {
          v50 = *(_QWORD *)v61;
          do
          {
            for (j = 0; j != v52; ++j)
            {
              if (*(_QWORD *)v61 != v50)
                objc_enumerationMutation(v49);
              v21 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
              v56 = 0u;
              v57 = 0u;
              v58 = 0u;
              v59 = 0u;
              objc_msgSend_objectForKeyedSubscript_(v51, v18, (uint64_t)CFSTR("inputNames"), v19, v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v56, (uint64_t)v68, 16);
              if (v26)
              {
                v27 = *(_QWORD *)v57;
                do
                {
                  for (k = 0; k != v26; ++k)
                  {
                    if (*(_QWORD *)v57 != v27)
                      objc_enumerationMutation(v22);
                    v29 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k);
                    objc_msgSend_uiNameForCIFilter_paramName_(IHKFilterSequence, v24, (uint64_t)v12, v29, v25);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend_isEqualToString_(v21, v31, (uint64_t)v30, v32, v33))
                    {
                      objc_msgSend_objectForKeyedSubscript_(v54, v34, (uint64_t)v21, v35, v36);
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setObject_forKeyedSubscript_(v55, v38, (uint64_t)v37, v29, v39);

                    }
                  }
                  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v24, (uint64_t)&v56, (uint64_t)v68, 16);
                }
                while (v26);
              }

            }
            v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v18, (uint64_t)&v60, (uint64_t)v69, 16);
          }
          while (v52);
        }

        objc_msgSend_setObject_forKeyedSubscript_(v46, v40, (uint64_t)v55, (uint64_t)v12, v41);
      }
      v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v64, (uint64_t)v70, 16);
    }
    while (v43);
  }

  return v46;
}

- (id)applySliders:(id)a3 image:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  id obj;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v14 = objc_msgSend_count(v8, v10, v11, v12, v13);
  objc_msgSend_sliderOrder(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v19, v20, v21, v22, v23);

  if (v14 == v24)
  {
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    objc_msgSend_filterSeq(self, v25, v26, v27, v28);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v112, (uint64_t)v117, 16);
    if (v30)
    {
      v34 = 0;
      v100 = v30;
      v101 = *(_QWORD *)v113;
      v102 = a5;
      while (2)
      {
        v104 = 0;
        v35 = v9;
        do
        {
          v103 = v35;
          if (*(_QWORD *)v113 != v101)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v104);
          objc_msgSend_objectForKeyedSubscript_(v36, v31, (uint64_t)CFSTR("filterName"), v32, v33);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_opt_new();
          v110 = 0u;
          v111 = 0u;
          v108 = 0u;
          v109 = 0u;
          objc_msgSend_objectForKeyedSubscript_(v36, v38, (uint64_t)CFSTR("inputNames"), v39, v40);
          v107 = (id)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v41, (uint64_t)&v108, (uint64_t)v116, 16);
          if (v46)
          {
            v47 = *(_QWORD *)v109;
            while (2)
            {
              v48 = 0;
              v49 = v34;
              do
              {
                if (*(_QWORD *)v109 != v47)
                  objc_enumerationMutation(v107);
                v50 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * v48);
                objc_msgSend_sliderOrder(self, v42, v43, v44, v45);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(v51, v52, v49 + v48, v53, v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_objectForKeyedSubscript_(v8, v56, (uint64_t)v55, v57, v58);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v51) = v59 == 0;

                if ((_DWORD)v51)
                {
                  if (v102)
                  {
                    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v60, (uint64_t)CFSTR("No value for slider named %@ in sliders dictionary."), v61, v62, v55);
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_errorWithCode_message_(IHKError, v95, 6, (uint64_t)v94, v96);
                    *v102 = (id)objc_claimAutoreleasedReturnValue();

                  }
                  goto LABEL_25;
                }
                objc_msgSend_objectForKeyedSubscript_(v8, v60, (uint64_t)v55, v61, v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v37, v64, (uint64_t)v63, v50, v65);

                ++v48;
              }
              while (v46 != v48);
              v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v42, (uint64_t)&v108, (uint64_t)v116, 16);
              v34 = v49 + v48;
              if (v46)
                continue;
              break;
            }
            v34 = v49 + v48;
          }

          objc_msgSend_setObject_forKeyedSubscript_(v37, v66, (uint64_t)v103, (uint64_t)CFSTR("inputImage"), v67);
          objc_msgSend_filterWithName_withInputParameters_(MEMORY[0x24BDBF658], v68, (uint64_t)v105, (uint64_t)v37, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = v70;
          if (!v70)
          {
            if (v102)
            {
              objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v71, (uint64_t)CFSTR("Could not find filter named %@."), v73, v74, v105);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithCode_message_(IHKError, v98, 5, (uint64_t)v55, v99);
              *v102 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

            }
            v75 = 0;
            v9 = v103;
            goto LABEL_27;
          }
          objc_msgSend_outputImage(v70, v71, v72, v73, v74);
          v9 = (id)objc_claimAutoreleasedReturnValue();

          v35 = v9;
          ++v104;
        }
        while (v104 != v100);
        v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v112, (uint64_t)v117, 16);
        if (v100)
          continue;
        break;
      }
    }

    v9 = v9;
    v75 = v9;
  }
  else
  {
    if (a5)
    {
      v76 = (void *)MEMORY[0x24BDD17C8];
      v77 = objc_msgSend_count(v8, v25, v26, v27, v28);
      objc_msgSend_sliderOrder(self, v78, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend_count(v82, v83, v84, v85, v86);
      objc_msgSend_stringWithFormat_(v76, v88, (uint64_t)CFSTR("Number of sliders does not match number of sliders in filter sequence (given: %lu != expected: %lu)."), v89, v90, v77, v87);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithCode_message_(IHKError, v92, 7, (uint64_t)v91, v93);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v75 = 0;
  }
LABEL_27:

  return v75;
}

- (NSArray)filterSeq
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFilterSeq:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)sliderOrder
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSliderOrder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDictionary)sliderSpecs
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSliderSpecs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderSpecs, 0);
  objc_storeStrong((id *)&self->_sliderOrder, 0);
  objc_storeStrong((id *)&self->_filterSeq, 0);
}

@end
