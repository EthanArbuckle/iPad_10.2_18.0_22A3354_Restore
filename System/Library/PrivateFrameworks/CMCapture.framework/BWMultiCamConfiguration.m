@implementation BWMultiCamConfiguration

uint64_t __67__BWMultiCamConfiguration_multiCamConfigurationForDevice_errorOut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "indexOfObject:", objc_msgSend(a2, "portType"));
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "indexOfObject:", objc_msgSend(a3, "portType"));
  if (v5 >= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 > v6)
    return 1;
  else
    return v7;
}

- (id)multiCamConfigurationForDevice:(id)a3 errorOut:(int *)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSArray *synchronizedActiveStreamsGroupsPortTypes;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  int v37;
  id result;
  int *v39;
  BWMultiCamConfiguration *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  int v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v58 = 0;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_synchronizedActiveStreamsGroupsPortTypes, "count"));
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = a4;
  if (-[NSArray count](self->_unsynchronizedActiveStreamsPortTypes, "count"))
  {
    v10 = (id)objc_msgSend(a3, "copyStreamsWithPortTypes:error:", self->_unsynchronizedActiveStreamsPortTypes, &v58);
    if (v58)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_51;
    }
    v11 = v10;
    objc_msgSend(v9, "addObjectsFromArray:", v10);
  }
  else
  {
    v11 = 0;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v40 = self;
  synchronizedActiveStreamsGroupsPortTypes = self->_synchronizedActiveStreamsGroupsPortTypes;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](synchronizedActiveStreamsGroupsPortTypes, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v55;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v55 != v15)
          objc_enumerationMutation(synchronizedActiveStreamsGroupsPortTypes);
        v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        if (objc_msgSend(v17, "count"))
        {
          v18 = (id)objc_msgSend(a3, "copyStreamsWithPortTypes:error:", v17, &v58);
          if (v58
            || (v19 = v18,
                v20 = (id)objc_msgSend(a3, "copySynchronizedStreamsGroupForStreams:error:", v18, &v58),
                v58))
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            goto LABEL_50;
          }
          if (v20)
          {
            objc_msgSend(v8, "addObject:", v20);
            objc_msgSend(v9, "addObjectsFromArray:", v19);
          }
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](synchronizedActiveStreamsGroupsPortTypes, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (v14)
        continue;
      break;
    }
  }
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v9);
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __67__BWMultiCamConfiguration_multiCamConfigurationForDevice_errorOut___block_invoke;
  v53[3] = &unk_1E4921838;
  v53[4] = v40;
  objc_msgSend(v21, "sortUsingComparator:", v53);
  if (v11)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    if (v8)
      goto LABEL_19;
LABEL_22:
    v23 = 0;
    if (v21)
      goto LABEL_20;
    goto LABEL_23;
  }
  v22 = 0;
  if (!v8)
    goto LABEL_22;
LABEL_19:
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  if (v21)
  {
LABEL_20:
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    goto LABEL_24;
  }
LABEL_23:
  v24 = 0;
LABEL_24:
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v25 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v50 != v27)
          objc_enumerationMutation(v11);
        objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "figCaptureStream"));
      }
      v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    }
    while (v26);
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v29 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v46 != v31)
          objc_enumerationMutation(v8);
        objc_msgSend(v23, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "figCaptureSynchronizedStreamsGroup"));
      }
      v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
    }
    while (v30);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v33 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v59, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v42;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v42 != v35)
          objc_enumerationMutation(v21);
        objc_msgSend(v24, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * m), "figCaptureStream"));
      }
      v34 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v59, 16);
    }
    while (v34);
  }
  if (v40->_stereoVideoCaptureEnabled && objc_msgSend(v8, "count"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", -[BWMultiCamConfiguration sortedStreamsForTNRFeatureBasedRegistration:prioritizePrimaryStream:]((uint64_t)v40, v8, 0), *MEMORY[0x1E0D059A8]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D05998]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D05990]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D059A0]);
LABEL_50:
  a4 = v39;
LABEL_51:
  v37 = v58;
  if (a4)
    *a4 = v58;
  if (v37)
    return 0;
  result = (id)objc_msgSend((id)objc_msgSend(v7, "allKeys"), "count");
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
  return result;
}

+ (id)configurationWithUnsynchronizedActiveStreamsPortTypes:(id)a3 synchronizedActiveStreamsGroupsPortTypes:(id)a4 stereoVideoCaptureEnabled:(BOOL)a5
{
  return -[BWMultiCamConfiguration _initWithUnsynchronizedActiveStreamsPortTypes:synchronizedActiveStreamsGroupsPortTypes:withCaptureDevice:readCurrentStateFromCaptureDevice:stereoVideoCaptureEnabled:]([BWMultiCamConfiguration alloc], a3, a4, 0, 0, a5);
}

- (_QWORD)_initWithUnsynchronizedActiveStreamsPortTypes:(void *)a3 synchronizedActiveStreamsGroupsPortTypes:(void *)a4 withCaptureDevice:(int)a5 readCurrentStateFromCaptureDevice:(char)a6 stereoVideoCaptureEnabled:
{
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v36;
  void *v37;
  _QWORD *v38;
  id obj;
  void *v40;
  objc_super v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  int v54;
  _QWORD v55[5];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v41.receiver = a1;
  v41.super_class = (Class)BWMultiCamConfiguration;
  v11 = objc_msgSendSuper2(&v41, sel_init);
  if (!v11)
    return v11;
  v12 = *MEMORY[0x1E0D05A30];
  v55[0] = *MEMORY[0x1E0D05A18];
  v55[1] = v12;
  v13 = *MEMORY[0x1E0D05A38];
  v55[2] = *MEMORY[0x1E0D05A28];
  v55[3] = v13;
  v55[4] = *MEMORY[0x1E0D05A50];
  v11[1] = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 5);
  *((_BYTE *)v11 + 32) = a6;
  if (!a5)
  {
    v11[2] = objc_msgSend(a2, "copy");
    v11[3] = objc_msgSend(a3, "copy");
    return v11;
  }
  if (!a4)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("device must not be NULL"), 0));
  v54 = 0;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_msgSend(a4, "getPropertyIfSupported:error:", *MEMORY[0x1E0D059D0], &v54);
  if (v54)
    goto LABEL_32;
  v37 = v14;
  v38 = v11;
  v36 = v15;
  v16 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D05990]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v16;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v51;
    v20 = *MEMORY[0x1E0D081A0];
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v51 != v19)
          objc_enumerationMutation(obj);
        v22 = (id)objc_msgSend(a4, "copySyncGroupForFigCaptureSynchronizedStreamsGroup:error:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i), &v54);
        if (v54)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v11 = v38;
          v14 = v37;
          goto LABEL_33;
        }
        v23 = (void *)objc_msgSend(v22, "getProperty:error:", v20, &v54);
        v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v47 != v27)
                objc_enumerationMutation(v23);
              objc_msgSend(v24, "addObject:", objc_msgSend((id)objc_msgSend(a4, "copyStreamForFigCaptureStream:error:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j), &v54), "portType"));
            }
            v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
          }
          while (v26);
        }
        objc_msgSend(v40, "addObject:", v24);
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v18)
        continue;
      break;
    }
  }
  v29 = (void *)objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0D05998]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  v11 = v38;
  v14 = v37;
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v43;
LABEL_23:
    v33 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v32)
        objc_enumerationMutation(v29);
      v34 = (id)objc_msgSend(a4, "copyStreamForFigCaptureStream:error:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v33), &v54);
      if (v54)
        break;
      objc_msgSend(v37, "addObject:", objc_msgSend(v34, "portType"));
      if (v31 == ++v33)
      {
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
        if (v31)
          goto LABEL_23;
        goto LABEL_33;
      }
    }
LABEL_32:
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_33:
  if (v54 || (v11[2] = objc_msgSend(v14, "copy"), v11[3] = objc_msgSend(v40, "copy"), v54))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMultiCamConfiguration;
  -[BWMultiCamConfiguration dealloc](&v3, sel_dealloc);
}

+ (void)initialize
{
  objc_opt_class();
}

+ (id)configurationWithCurrentStateFromCaptureDevice:(id)a3
{
  return -[BWMultiCamConfiguration _initWithUnsynchronizedActiveStreamsPortTypes:synchronizedActiveStreamsGroupsPortTypes:withCaptureDevice:readCurrentStateFromCaptureDevice:stereoVideoCaptureEnabled:]([BWMultiCamConfiguration alloc], 0, 0, a3, 1, 0);
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSArray *obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[NSArray count](self->_unsynchronizedActiveStreamsPortTypes, "count"),
          v5 == objc_msgSend(*((id *)a3 + 2), "count"))
      && (v6 = -[NSArray count](self->_synchronizedActiveStreamsGroupsPortTypes, "count"),
          v6 == objc_msgSend(*((id *)a3 + 3), "count")))
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_unsynchronizedActiveStreamsPortTypes);
      v8 = objc_msgSend(v7, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *((_QWORD *)a3 + 2)));
      if (v8)
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        obj = self->_synchronizedActiveStreamsGroupsPortTypes;
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v9)
        {
          v10 = v9;
          v22 = *(_QWORD *)v28;
LABEL_8:
          v11 = 0;
          while (1)
          {
            if (*(_QWORD *)v28 != v22)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
            v23 = 0u;
            v24 = 0u;
            v25 = 0u;
            v26 = 0u;
            v13 = (void *)*((_QWORD *)a3 + 3);
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v24;
LABEL_13:
              v17 = 0;
              while (1)
              {
                if (*(_QWORD *)v24 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v17);
                if ((objc_msgSend(v18, "containsObject:", objc_msgSend(v12, "firstObject")) & 1) != 0)
                  break;
                if (v15 == ++v17)
                {
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
                  if (v15)
                    goto LABEL_13;
                  goto LABEL_19;
                }
              }
            }
            else
            {
LABEL_19:
              v18 = 0;
            }
            v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
            v8 = objc_msgSend(v19, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18));
            if (!v8)
              break;
            if (++v11 == v10)
            {
              v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
              if (v10)
                goto LABEL_8;
              goto LABEL_23;
            }
          }
        }
        else
        {
LABEL_23:
          LOBYTE(v8) = self->_stereoVideoCaptureEnabled == *((unsigned __int8 *)a3 + 32);
        }
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (void)sortedStreamsForTNRFeatureBasedRegistration:(char)a3 prioritizePrimaryStream:
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[6];
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(a2);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v6, "addObject:", objc_msgSend((id)objc_msgSend(v12, "synchronizationMaster"), "portType"));
        objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(v12, "activeStreams"));
      }
      v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __95__BWMultiCamConfiguration_sortedStreamsForTNRFeatureBasedRegistration_prioritizePrimaryStream___block_invoke;
  v23[3] = &unk_1E4921810;
  v23[4] = a1;
  v23[5] = v6;
  v24 = a3;
  objc_msgSend(v7, "sortUsingComparator:", v23);
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v7);
        objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "figCaptureStream"));
      }
      v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v15);
  }
  return v13;
}

uint64_t __95__BWMultiCamConfiguration_sortedStreamsForTNRFeatureBasedRegistration_prioritizePrimaryStream___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "indexOfObject:", objc_msgSend(a2, "portType"));
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "indexOfObject:", objc_msgSend(a3, "portType"));
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(a2, "portType")))
  {
    if (*(_BYTE *)(a1 + 48))
      v6 = -1;
    else
      v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(a3, "portType")))
  {
    if (*(_BYTE *)(a1 + 48))
      v7 = -1;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v6 >= v7)
    v8 = 0;
  else
    v8 = -1;
  if (v6 > v7)
    return 1;
  else
    return v8;
}

- (id)copyActiveSynchronizedStreamsGroupsForDevice:(id)a3 errorOut:(int *)a4
{
  void *v7;
  NSArray *synchronizedActiveStreamsGroupsPortTypes;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  int v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_synchronizedActiveStreamsGroupsPortTypes, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  synchronizedActiveStreamsGroupsPortTypes = self->_synchronizedActiveStreamsGroupsPortTypes;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](synchronizedActiveStreamsGroupsPortTypes, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(synchronizedActiveStreamsGroupsPortTypes);
        v13 = (void *)objc_msgSend(a3, "copyStreamsWithPortTypes:error:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), &v22);
        if (v22)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_11;
        }
        v14 = (void *)objc_msgSend(a3, "copySynchronizedStreamsGroupForStreams:error:", v13, &v22);
        if (v22)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_12;
        }
        objc_msgSend(v7, "addObject:", v14);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](synchronizedActiveStreamsGroupsPortTypes, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:
  v14 = 0;
LABEL_12:
  v15 = v22;
  if (a4)
    *a4 = v22;
  if (v15 || !objc_msgSend(v7, "count"))
    v16 = 0;
  else
    v16 = (void *)objc_msgSend(v7, "copy");

  return v16;
}

@end
