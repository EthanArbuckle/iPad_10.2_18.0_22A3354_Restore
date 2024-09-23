@implementation NSArray(_AX_HA_PROGRAMS_ARRAY_)

- (void)setProgram:()_AX_HA_PROGRAMS_ARRAY_ withOtherSidePrograms:selected:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _QWORD v55[7];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  __int128 buf;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "programThatMatchesProgram:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Selecting program %@ - %@"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[NSArray(_AX_HA_PROGRAMS_ARRAY_) setProgram:withOtherSidePrograms:selected:]", 553, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_retainAutorelease(v12);
    v15 = v13;
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v14, "UTF8String");
    _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__6;
  v71 = __Block_byref_object_dispose__6;
  v72 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__6;
  v66 = __Block_byref_object_dispose__6;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__6;
  v60 = __Block_byref_object_dispose__6;
  v61 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __77__NSArray__AX_HA_PROGRAMS_ARRAY___setProgram_withOtherSidePrograms_selected___block_invoke;
  v55[3] = &unk_1EA8EA6E0;
  v55[4] = &v56;
  v55[5] = &buf;
  v55[6] = &v62;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v55);
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__6;
  v53 = __Block_byref_object_dispose__6;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__6;
  v47 = __Block_byref_object_dispose__6;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__6;
  v41 = __Block_byref_object_dispose__6;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  v36 = 0;
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __77__NSArray__AX_HA_PROGRAMS_ARRAY___setProgram_withOtherSidePrograms_selected___block_invoke_2;
  v25[3] = &unk_1EA8EA708;
  v27 = &v31;
  v17 = v10;
  v26 = v17;
  v28 = &v37;
  v29 = &v49;
  v30 = &v43;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v25);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    if (objc_msgSend(v17, "isStreamOrMixingStream"))
    {
      if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "isStreamOrMixingStream"))
      {
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "index");
        if (v18 != objc_msgSend(v17, "index"))
        {
          objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setIsSelected:", 0);
          if (!v63[5])
            objc_msgSend((id)v57[5], "setIsSelected:", 1);
        }
      }
    }
  }
  if (!v44[5] && !v50[5])
    goto LABEL_26;
  if (objc_msgSend(v17, "isMixingStream"))
  {
    v19 = (void *)v50[5];
    if (v19)
    {
      objc_msgSend(v19, "setIsSelected:", 0);
      v20 = (void *)v32[5];
      if (v20)
      {
        objc_msgSend(v20, "setIsSelected:", 1);
        v21 = v17;
LABEL_28:
        objc_msgSend(v21, "setIsSelected:", a5);
        goto LABEL_29;
      }
    }
LABEL_27:
    v21 = v17;
    goto LABEL_28;
  }
  if ((objc_msgSend(v17, "isMixingStream") & 1) == 0 && objc_msgSend(v17, "isStream"))
  {
    v22 = (void *)v50[5];
    if (v22)
      objc_msgSend(v22, "setIsSelected:", 0);
    v23 = (void *)v44[5];
    if (!v23)
      goto LABEL_26;
    goto LABEL_25;
  }
  if (!v38[5])
  {
    v23 = (void *)v50[5];
    if (!v23)
    {
      if (!v44[5])
        goto LABEL_29;
      objc_msgSend(v17, "setIsSelected:", 1);
      a5 = 0;
      v21 = (void *)v44[5];
      goto LABEL_28;
    }
LABEL_25:
    objc_msgSend(v23, "setIsSelected:", 0);
LABEL_26:
    a5 = 1;
    goto LABEL_27;
  }
  objc_msgSend(v17, "setIsSelected:", 1);
  v24 = (void *)v44[5];
  if (v24)
    objc_msgSend(v24, "setIsSelected:", 0);
LABEL_29:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&buf, 8);
}

- (id)programThatMatchesProgram:()_AX_HA_PROGRAMS_ARRAY_
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__NSArray__AX_HA_PROGRAMS_ARRAY___programThatMatchesProgram___block_invoke;
  v8[3] = &unk_1EA8EA730;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end
