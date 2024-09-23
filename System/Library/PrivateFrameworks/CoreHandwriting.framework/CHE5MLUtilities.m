@implementation CHE5MLUtilities

+ (__IOSurface)createInputSurfaceForMultiArray:(id)a3
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
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __IOSurface *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD v37[7];
  uint8_t buf[4];
  __IOSurface *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend_dataType(v3, v4, v5, v6, v7, v8) != 65568)
  {
    if (qword_1EF568E88 == -1)
    {
      v14 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v14 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        goto LABEL_5;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_FAULT, "Only MLMultiArrayDataTypeFloat32 inputs are supported.", buf, 2u);
    goto LABEL_5;
  }
LABEL_6:
  v15 = objc_msgSend_count(v3, v9, v10, v11, v12, v13);
  v18 = CHCreateIOSurface(v15, (const char *)1, 2, 2 * v15, v16, v17);
  v23 = IOSurfaceLock(v18, 0, 0);
  if ((_DWORD)v23)
  {
    if (qword_1EF568E88 == -1)
    {
      v24 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        v18 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v24 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
    }
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v25, v23, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v39 = v18;
    v40 = 2112;
    v41 = v29;
    _os_log_impl(&dword_1BE607000, v24, OS_LOG_TYPE_ERROR, "Could not lock IOSurfaceRef %p (%@)", buf, 0x16u);

    goto LABEL_14;
  }
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1BE87C7C0;
  v37[3] = &unk_1E77F64C8;
  v37[4] = 4 * v15;
  v37[5] = v18;
  v37[6] = v15;
  objc_msgSend_getBytesWithHandler_(v3, v19, (uint64_t)v37, v20, v21, v22);
  v30 = IOSurfaceUnlock(v18, 0, 0);
  if ((_DWORD)v30)
  {
    if (qword_1EF568E88 == -1)
    {
      v24 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v24 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
    }
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v31, v30, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v39 = v18;
    v40 = 2112;
    v41 = v35;
    _os_log_impl(&dword_1BE607000, v24, OS_LOG_TYPE_ERROR, "Could not unlock IOSurfaceRef %p (%@)", buf, 0x16u);

    goto LABEL_14;
  }
LABEL_15:

  return v18;
}

+ (id)createInputSurfacesForFeatureProvider:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t InputSurfaceForMultiArray;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend_featureNames(v3, v10, v11, v12, v13, v14);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v53, (uint64_t)v57, 16, v16);
  if (v21)
  {
    v22 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v54 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend_featureValueForName_(v3, v17, v24, v18, v19, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_multiArrayValue(v25, v26, v27, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        InputSurfaceForMultiArray = objc_msgSend_createInputSurfaceForMultiArray_(CHE5MLUtilities, v32, (uint64_t)v31, v33, v34, v35);
        if (!InputSurfaceForMultiArray)
        {

          v50 = 0;
          goto LABEL_11;
        }
        objc_msgSend_valueWithPointer_(MEMORY[0x1E0CB3B18], v36, InputSurfaceForMultiArray, v38, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v9, v42, (uint64_t)v41, v24, v43, v44);

      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v53, (uint64_t)v57, 16, v20);
      if (v21)
        continue;
      break;
    }
  }

  v50 = (void *)objc_msgSend_copy(v9, v45, v46, v47, v48, v49);
LABEL_11:

  return v50;
}

+ (id)newInputsForFunctionDescriptor:(id)a3 surfaces:(id)a4 error:(id *)a5
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __IOSurface *v34;
  size_t Height;
  size_t BytesPerRow;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  BOOL v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  int v89;
  void *v90;
  id v91;
  void *v93;
  id obj;
  uint64_t v95;
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t buf[4];
  size_t v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  void *v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v98 = a4;
  v93 = v6;
  v97 = objc_alloc_init(MEMORY[0x1E0DC6C90]);
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  objc_msgSend_allInputs(v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v12;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v99, (uint64_t)v109, 16, v14);
  if (v20)
  {
    v95 = *(_QWORD *)v100;
    while (2)
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v100 != v95)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v21);
        objc_msgSend_name(v22, v15, v16, v17, v18, v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v98, v24, (uint64_t)v23, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (__IOSurface *)objc_msgSend_pointerValue(v28, v29, v30, v31, v32, v33);

        Height = IOSurfaceGetHeight(v34);
        BytesPerRow = IOSurfaceGetBytesPerRow(v34);
        objc_msgSend_strides(v22, v37, v38, v39, v40, v41);
        v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v48 = BytesPerRow * Height;
        LOBYTE(BytesPerRow) = BytesPerRow * Height == *(_QWORD *)objc_msgSend_byteOffsets(v42, v43, v44, v45, v46, v47);

        if ((BytesPerRow & 1) == 0)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v54 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend_strides(v22, v55, v56, v57, v58, v59);
            v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v66 = *(_QWORD *)objc_msgSend_byteOffsets(v60, v61, v62, v63, v64, v65);
            *(_DWORD *)buf = 134218240;
            v104 = v48;
            v105 = 2048;
            v106 = v66;
            _os_log_impl(&dword_1BE607000, v54, OS_LOG_TYPE_FAULT, "Size mismatch! IOSurface bytes: %ld, input descriptor bytes: %ld", buf, 0x16u);

          }
        }
        v67 = 0;
        v68 = 1;
        while (1)
        {
          objc_msgSend_shape(v22, v49, v50, v51, v52, v53);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v67 < objc_msgSend_rank(v69, v70, v71, v72, v73, v74);

          if (!v75)
            break;
          objc_msgSend_shape(v22, v76, v77, v78, v79, v80);
          v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v87 = *(_QWORD *)(objc_msgSend_sizes(v81, v82, v83, v84, v85, v86) + 8 * v67);

          v68 *= v87;
          ++v67;
        }
        if (v48 != 2 * v68)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v88 = (id)qword_1EF568E18[0];
          if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134218498;
            v104 = v48;
            v105 = 2048;
            v106 = v68;
            v107 = 2112;
            v108 = v23;
            _os_log_impl(&dword_1BE607000, v88, OS_LOG_TYPE_FAULT, "Size mismatch! IOSurface bytes: %ld does not match tensor descriptor shape product %zu*2 for input %@", buf, 0x20u);
          }

        }
        v89 = objc_msgSend_assignSurface_toName_error_(v97, v76, (uint64_t)v34, (uint64_t)v23, (uint64_t)a5, v80);

        if (!v89)
        {

          v91 = 0;
          v90 = v97;
          goto LABEL_26;
        }
        ++v21;
      }
      while (v21 != v20);
      v12 = obj;
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v99, (uint64_t)v109, 16, v19);
      if (v20)
        continue;
      break;
    }
  }

  v90 = v97;
  v91 = v97;
LABEL_26:

  return v91;
}

+ (id)multiArrayForOutput:(id)a3 inNamedObjects:(id)a4 functionDescriptor:(id)a5 dataType:(int64_t)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  char OnlyDataForName_usingBlock_error;
  id v49;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17 = v13;
  if (a6 == 65568)
  {
    objc_msgSend_outputNamed_error_(v13, v14, (uint64_t)v11, (uint64_t)a7, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v18;
    if (v18)
    {
      objc_msgSend_shape(v18, v19, v20, v21, v22, v23);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strides(v24, v25, v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend_dataType(v24, v31, v32, v33, v34, v35);
      v57 = 0;
      v58 = &v57;
      v59 = 0x3032000000;
      v60 = sub_1BE87D2A0;
      v61 = sub_1BE87D2B0;
      v62 = 0;
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = sub_1BE87D2B8;
      v52[3] = &unk_1E77F6510;
      v56 = v36;
      v37 = v51;
      v53 = v37;
      v38 = v30;
      v54 = v38;
      v55 = &v57;
      v39 = (void *)MEMORY[0x1C3B81A84](v52);
      objc_msgSend_name(v24, v40, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      OnlyDataForName_usingBlock_error = objc_msgSend_accessReadOnlyDataForName_usingBlock_error_(v12, v46, (uint64_t)v45, (uint64_t)v39, (uint64_t)a7, v47);

      if ((OnlyDataForName_usingBlock_error & 1) != 0)
        v49 = (id)v58[5];
      else
        v49 = 0;

      _Block_object_dispose(&v57, 8);
    }
    else
    {
      v49 = 0;
    }

  }
  else
  {
    v49 = 0;
  }

  return v49;
}

+ (id)featureProviderForE5RTOutputs:(id)a3 functionDescriptor:(id)a4 dataType:(int64_t)a5 error:(id *)a6
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  __int128 v58;
  id obj;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v61 = a4;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend_allOutputs(v61, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v20;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v62, (uint64_t)v66, 16, v22);
  if (v28)
  {
    v30 = *(_QWORD *)v63;
    *(_QWORD *)&v29 = 138412290;
    v58 = v29;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v63 != v30)
          objc_enumerationMutation(obj);
        objc_msgSend_name(*(void **)(*((_QWORD *)&v62 + 1) + 8 * v31), v23, v24, v25, v26, v27, v58);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_multiArrayForOutput_inNamedObjects_functionDescriptor_dataType_error_(CHE5MLUtilities, v33, (uint64_t)v32, (uint64_t)v60, (uint64_t)v61, a5, a6);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v14, v35, (uint64_t)v34, (uint64_t)v32, v36, v37);
        v38 = objc_retainAutorelease(v34);
        v44 = objc_msgSend_dataPointer(v38, v39, v40, v41, v42, v43);
        v50 = objc_msgSend_count(v38, v45, v46, v47, v48, v49);
        if (v50)
        {
          v51 = 4 * v50;
          do
          {
            v44 += 4;
            v51 -= 4;
          }
          while (v51);
        }

        ++v31;
      }
      while (v31 != v28);
      v20 = obj;
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v62, (uint64_t)v66, 16, v27);
    }
    while (v28);
  }

  v52 = objc_alloc(MEMORY[0x1E0C9E8F8]);
  v56 = (void *)objc_msgSend_initWithDictionary_error_(v52, v53, (uint64_t)v14, 0, v54, v55);

  return v56;
}

+ (id)newE5RTExecutionOutputsForFunctionDescriptor:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0DC6C90]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend_allOutputs(v5, v7, v8, v9, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v23, (uint64_t)v27, 16, v14);
  if (v18)
  {
    v19 = *(_QWORD *)v24;
    while (2)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v12);
        if ((objc_msgSend_E5RTExecutionContextAssignNewTensorInstanceToNamedObjects_error_(*(void **)(*((_QWORD *)&v23 + 1) + 8 * v20), v15, (uint64_t)v6, (uint64_t)a4, v16, v17) & 1) == 0)
        {

          v21 = 0;
          goto LABEL_11;
        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v23, (uint64_t)v27, 16, v17);
      if (v18)
        continue;
      break;
    }
  }

  v21 = v6;
LABEL_11:

  return v21;
}

@end
