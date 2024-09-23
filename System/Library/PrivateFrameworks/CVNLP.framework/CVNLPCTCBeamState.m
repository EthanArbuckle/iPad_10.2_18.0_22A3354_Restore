@implementation CVNLPCTCBeamState

- (CVNLPCTCBeamState)init
{
  CVNLPCTCBeamState *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mutablePaths;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CVNLPCTCBeamState;
  v2 = -[CVNLPCTCBeamState init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutablePaths = v2->_mutablePaths;
    v2->_mutablePaths = v3;

  }
  return v2;
}

- (void)addPath:(id)a3
{
  id v4;
  NSMutableDictionary *mutablePaths;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  void *v17;
  const char *v18;
  id v19;

  v4 = a3;
  mutablePaths = self->_mutablePaths;
  v19 = v4;
  objc_msgSend_string(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(mutablePaths, v10, (uint64_t)v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_merge_logProbCumulator_(v12, v13, (uint64_t)v19, (uint64_t)&unk_1E60CDB48);
  }
  else
  {
    v16 = self->_mutablePaths;
    objc_msgSend_string(v19, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v16, v18, (uint64_t)v19, (uint64_t)v17);

  }
}

- (id)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B037AAA8;
  v10[3] = &unk_1E60CE250;
  v6 = v5;
  v11 = v6;
  objc_msgSend_enumeratePathsWithBlock_(self, v7, (uint64_t)v10, v8);

  return v6;
}

- (id)pathForString:(id)a3
{
  uint64_t v3;

  objc_msgSend_objectForKeyedSubscript_(self->_mutablePaths, a2, (uint64_t)a3, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)paths
{
  return (id)((uint64_t (*)(_QWORD, char *, NSMutableDictionary *))MEMORY[0x1E0DE7D20])(MEMORY[0x1E0C99D80], sel_dictionaryWithDictionary_, self->_mutablePaths);
}

- (void)enumeratePathsWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *mutablePaths;
  const char *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  mutablePaths = self->_mutablePaths;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B037AC30;
  v9[3] = &unk_1E60CE278;
  v10 = v4;
  v8 = v4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(mutablePaths, v6, (uint64_t)v9, v7);

}

- (id)sortedKeys
{
  return (id)((uint64_t (*)(NSMutableDictionary *, char *, char *))MEMORY[0x1E0DE7D20])(self->_mutablePaths, sel_keysSortedByValueUsingSelector_, sel_compare_);
}

- (void)kBest:(id *)a3 discarded:(id *)a4 k:(unint64_t)a5 shouldUpdateLMState:(BOOL)a6
{
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  _BYTE *v20;
  _BYTE *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  double v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  __int128 *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  NSMutableDictionary *mutablePaths;
  double *v37;
  double *v38;
  unint64_t v39;
  double *v40;
  unint64_t v41;
  double *v42;
  double *v43;
  double v44;
  double v45;
  double v46;
  int v47;
  double v48;
  double v49;
  double *v50;
  double *v51;
  double *v52;
  double v53;
  double v54;
  double v55;
  double *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double *v63;
  double v64;
  double *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double *v79;
  double v80;
  double v81;
  double *v82;
  double *v83;
  double *v84;
  double v85;
  BOOL v86;
  double v87;
  double v88;
  double v89;
  CVNLPCTCBeamState *v90;
  CVNLPCTCBeamState *v91;
  NSMutableDictionary *v92;
  CVNLPCTCBeamState *v93;
  CVNLPCTCBeamState *v94;
  const char *v95;
  uint64_t v96;
  _QWORD v97[4];
  CVNLPCTCBeamState *v98;
  CVNLPCTCBeamState *v99;
  double v100;
  BOOL v101;
  _QWORD v102[5];
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  __n128 (*v106)(__n128 *, __n128 *);
  void (*v107)(uint64_t);
  void *v108;
  void *__p;
  void *v110;
  uint64_t v111;

  v103 = 0;
  v104 = &v103;
  v106 = sub_1B037B328;
  v107 = sub_1B037B34C;
  v105 = 0x4812000000;
  v108 = &unk_1B03B5E12;
  __p = 0;
  v110 = 0;
  v111 = 0;
  v11 = objc_msgSend_count(self->_mutablePaths, a2, (uint64_t)a3, (uint64_t)a4);
  v15 = MEMORY[0x1E0C809B0];
  if (!v11)
  {
    v26 = 0.0;
    goto LABEL_107;
  }
  v16 = v104;
  v19 = objc_msgSend_count(self->_mutablePaths, v12, v13, v14);
  v20 = (_BYTE *)v16[6];
  if (v19 > (v16[8] - (uint64_t)v20) >> 3)
  {
    if (v19 >> 61)
      sub_1B02D7758();
    v21 = (_BYTE *)v16[7];
    v22 = (char *)operator new(8 * v19);
    v23 = v21 - v20;
    v24 = &v22[(v21 - v20) & 0xFFFFFFFFFFFFFFF8];
    v25 = v24;
    if (v21 == v20)
      goto LABEL_13;
    if ((unint64_t)(v23 - 8) >= 0x58)
    {
      v25 = &v22[(v21 - v20) & 0xFFFFFFFFFFFFFFF8];
      if (v21 - v22 - (v23 & 0xFFFFFFFFFFFFFFF8) >= 0x20)
      {
        v27 = v23 >> 3;
        v28 = ((unint64_t)(v23 - 8) >> 3) + 1;
        v29 = 8 * (v28 & 0x3FFFFFFFFFFFFFFCLL);
        v30 = &v21[-v29];
        v25 = &v24[-v29];
        v31 = &v22[8 * v27 - 16];
        v32 = (__int128 *)(v21 - 16);
        v33 = v28 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v34 = *v32;
          *((_OWORD *)v31 - 1) = *(v32 - 1);
          *(_OWORD *)v31 = v34;
          v31 -= 32;
          v32 -= 2;
          v33 -= 4;
        }
        while (v33);
        v21 = v30;
        if (v28 == (v28 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_13:
          v16[6] = (uint64_t)v25;
          v16[7] = (uint64_t)v24;
          v16[8] = (uint64_t)&v22[8 * v19];
          if (v20)
            operator delete(v20);
          goto LABEL_15;
        }
      }
    }
    else
    {
      v25 = &v22[(v21 - v20) & 0xFFFFFFFFFFFFFFF8];
    }
    do
    {
      v35 = *((_QWORD *)v21 - 1);
      v21 -= 8;
      *((_QWORD *)v25 - 1) = v35;
      v25 -= 8;
    }
    while (v21 != v20);
    goto LABEL_13;
  }
LABEL_15:
  mutablePaths = self->_mutablePaths;
  v102[0] = MEMORY[0x1E0C809B0];
  v102[1] = 3221225472;
  v102[2] = sub_1B037B364;
  v102[3] = &unk_1E60CE2A0;
  v102[4] = &v103;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(mutablePaths, v17, (uint64_t)v102, v18);
  v37 = (double *)v104[6];
  v38 = (double *)v104[7];
  v39 = v38 - v37 - 1;
  if (v39 >= a5)
    v39 = a5;
  v40 = &v37[v39];
  if (v40 != v38)
  {
    while (1)
    {
      v41 = v38 - v37;
      if (v41 < 2)
      {
LABEL_105:
        v37 = (double *)v104[6];
        break;
      }
      if (v41 == 3)
      {
        v74 = *v37;
        v75 = v37[1];
        v76 = *(v38 - 1);
        if (v75 <= *v37)
        {
          if (v76 > v75)
          {
            v37[1] = v76;
            *(v38 - 1) = v75;
            v88 = *v37;
            v87 = v37[1];
            if (v87 > *v37)
            {
              *v37 = v87;
              v37[1] = v88;
            }
          }
        }
        else
        {
          if (v76 <= v75)
          {
            *v37 = v75;
            v37[1] = v74;
            v89 = *(v38 - 1);
            if (v89 <= v74)
              goto LABEL_105;
            v37[1] = v89;
          }
          else
          {
            *v37 = v76;
          }
          *(v38 - 1) = v74;
        }
        goto LABEL_105;
      }
      if (v41 == 2)
      {
        v77 = *(v38 - 1);
        v78 = *v37;
        if (v77 > *v37)
        {
          *v37 = v77;
          *(v38 - 1) = v78;
        }
        goto LABEL_105;
      }
      if ((char *)v38 - (char *)v37 <= 63)
      {
        while (v37 != v38 - 1)
        {
          v79 = v37++;
          if (v79 != v38 && v37 != v38)
          {
            v80 = *v79;
            v81 = *v79;
            v82 = v37;
            v83 = v79;
            v84 = v37;
            do
            {
              v85 = *v84++;
              v86 = v85 <= v81;
              v81 = fmax(v85, v81);
              if (!v86)
                v83 = v82;
              v82 = v84;
            }
            while (v84 != v38);
            if (v83 != v79)
            {
              *v79 = *v83;
              *v83 = v80;
            }
          }
        }
        goto LABEL_105;
      }
      v42 = &v37[v41 >> 1];
      v43 = v38 - 1;
      v44 = *(v38 - 1);
      v45 = *v42;
      v46 = *v37;
      if (*v42 <= *v37)
      {
        if (v44 <= v45)
        {
          v47 = 0;
          v48 = *v37;
          v49 = *v42;
          if (*v37 <= *v42)
            goto LABEL_43;
          goto LABEL_25;
        }
        *v42 = v44;
        *v43 = v45;
        v59 = *v37;
        if (*v42 > *v37)
        {
          *v37 = *v42;
          *v42 = v59;
          v47 = 2;
          v48 = *v37;
          v49 = *v42;
          if (*v37 <= *v42)
            goto LABEL_43;
          goto LABEL_25;
        }
      }
      else
      {
        if (v44 > v45)
        {
          *v37 = v44;
          *v43 = v46;
          v47 = 1;
          v48 = *v37;
          v49 = *v42;
          if (*v37 <= *v42)
            goto LABEL_43;
          goto LABEL_25;
        }
        *v37 = v45;
        *v42 = v46;
        if (*v43 > v46)
        {
          *v42 = *v43;
          *v43 = v46;
          v47 = 2;
          v48 = *v37;
          v49 = *v42;
          if (*v37 <= *v42)
            goto LABEL_43;
          goto LABEL_25;
        }
      }
      v47 = 1;
      v48 = *v37;
      v49 = *v42;
      if (*v37 <= *v42)
      {
LABEL_43:
        v50 = v38 - 1;
        while (--v50 != v37)
        {
          if (*v50 > v49)
          {
            *v37 = *v50;
            *v50 = v48;
            ++v47;
            v51 = v37 + 1;
            if (v37 + 1 < v50)
              goto LABEL_26;
            goto LABEL_47;
          }
        }
        v63 = v37 + 1;
        if (v48 <= *v43)
        {
          if (v63 == v43)
            goto LABEL_105;
          while (1)
          {
            v64 = *v63;
            if (v48 > *v63)
              break;
            if (++v63 == v43)
              goto LABEL_105;
          }
          *v63++ = *v43;
          *v43 = v64;
        }
        if (v63 == v43)
          goto LABEL_105;
        while (1)
        {
          v68 = *v37;
          do
          {
            v69 = *v63++;
            v70 = v69;
          }
          while (v68 <= v69);
          v71 = v63 - 1;
          do
          {
            v72 = *--v43;
            v73 = v72;
          }
          while (v68 > v72);
          if (v71 >= v43)
            break;
          *v71 = v73;
          *v43 = v70;
        }
        v37 = v63 - 1;
        if (v71 > v40)
          goto LABEL_105;
        goto LABEL_81;
      }
LABEL_25:
      v50 = v38 - 1;
      v51 = v37 + 1;
      if (v37 + 1 >= v38 - 1)
      {
LABEL_47:
        v56 = v51;
      }
      else
      {
LABEL_26:
        v52 = v51;
        while (1)
        {
          v53 = *v42;
          do
          {
            v54 = *v52++;
            v55 = v54;
          }
          while (v54 > v53);
          v56 = v52 - 1;
          do
          {
            v57 = *--v50;
            v58 = v57;
          }
          while (v57 <= v53);
          if (v56 >= v50)
            break;
          *v56 = v58;
          *v50 = v55;
          ++v47;
          if (v56 == v42)
            v42 = v50;
        }
      }
      if (v56 != v42)
      {
        v60 = *v56;
        if (*v42 > *v56)
        {
          *v56 = *v42;
          *v42 = v60;
          ++v47;
        }
      }
      if (v56 == v40)
        goto LABEL_105;
      if (!v47)
      {
        if (v56 <= v40)
        {
          v65 = v56 + 1;
          while (v65 != v38)
          {
            v67 = *(v65 - 1);
            v66 = *v65++;
            if (v66 > v67)
              goto LABEL_53;
          }
        }
        else
        {
          while (v51 != v56)
          {
            v62 = *(v51 - 1);
            v61 = *v51++;
            if (v61 > v62)
              goto LABEL_53;
          }
        }
        goto LABEL_105;
      }
LABEL_53:
      if (v56 <= v40)
        v37 = v56 + 1;
      else
        v38 = v56;
LABEL_81:
      if (v38 == v40)
        goto LABEL_105;
    }
  }
  v26 = v37[v39];
  v15 = MEMORY[0x1E0C809B0];
LABEL_107:
  v90 = objc_alloc_init(CVNLPCTCBeamState);
  v91 = objc_alloc_init(CVNLPCTCBeamState);
  v92 = self->_mutablePaths;
  v97[0] = v15;
  v97[1] = 3221225472;
  v97[2] = sub_1B037B52C;
  v97[3] = &unk_1E60CE2C8;
  v100 = v26;
  v93 = v90;
  v98 = v93;
  v101 = a6;
  v94 = v91;
  v99 = v94;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v92, v95, (uint64_t)v97, v96);
  if (a3)
    *a3 = objc_retainAutorelease(v93);
  if (a4)
    *a4 = objc_retainAutorelease(v94);

  _Block_object_dispose(&v103, 8);
  if (__p)
  {
    v110 = __p;
    operator delete(__p);
  }
}

- (void)mergePathsWithTrailingWhitespaces
{
  uint64_t v2;
  uint64_t v3;
  NSMutableDictionary *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_mutablePaths;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v35, (uint64_t)v40, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend_stringByAppendingString_(v12, v7, (uint64_t)CFSTR(" "), v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(self->_mutablePaths, v14, (uint64_t)v13, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend_objectForKeyedSubscript_(self->_mutablePaths, v16, (uint64_t)v12, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_merge_logProbCumulator_(v19, v20, (uint64_t)v18, (uint64_t)&unk_1E60CE228);

          objc_msgSend_addObject_(v30, v21, (uint64_t)v13, v22);
        }

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v35, (uint64_t)v40, 16);
    }
    while (v9);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = v30;
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v31, (uint64_t)v39, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(v23);
        objc_msgSend_removeObjectForKey_(self->_mutablePaths, v25, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), v26);
      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v31, (uint64_t)v39, 16);
    }
    while (v27);
  }

}

- (void)applyWordLanguageModelProbabilityToPaths
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  void *v30;
  const char *v31;
  NSMutableDictionary *obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = self->_mutablePaths;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend_objectForKeyedSubscript_(self->_mutablePaths, v4, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_languageResourceBundle(v9, v10, v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_wordLanguageModel(v13, v14, v15, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend_languageResourceBundle(v9, v17, v18, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_wordLanguageModel(v21, v22, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend_lmSPIType(v25, v26, v27, v28) == 1;

          if (v29)
          {
            v30 = (void *)objc_opt_class();
            objc_msgSend_applyWordLanguageModelProbabilityToPath_stemmedFromPath_isCommittingToken_(v30, v31, (uint64_t)v9, (uint64_t)v9, 1);
          }
        }
        else
        {

        }
      }
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v6);
  }

}

- (NSMutableDictionary)mutablePaths
{
  return self->_mutablePaths;
}

- (void)setMutablePaths:(id)a3
{
  objc_storeStrong((id *)&self->_mutablePaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePaths, 0);
}

@end
