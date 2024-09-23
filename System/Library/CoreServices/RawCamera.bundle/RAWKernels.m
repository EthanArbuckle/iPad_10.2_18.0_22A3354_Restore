@implementation RAWKernels

- (RAWKernels)init
{
  RAWKernels *v2;
  uint64_t v3;
  NSMutableDictionary *priv;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAWKernels;
  v2 = -[RAWKernels init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    priv = v2->priv;
    v2->priv = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)kernelSourceForGroup:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uInt v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int16 v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  id v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  z_stream v59;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("default"), v5, v6) & 1) != 0)
  {
    v10 = 1319;
    v11 = &unk_1D544F2F1;
    objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v7, 4836, v8, v9);
    goto LABEL_8;
  }
  if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("NR"), v8, v9) & 1) != 0)
  {
    v10 = 10736;
    v11 = &unk_1D544F818;
    v15 = -28642;
LABEL_5:
    objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v12, v15 | 0x10000u, v13, v14);
    goto LABEL_8;
  }
  if ((objc_msgSend_isEqualToString_(v3, v12, (uint64_t)CFSTR("LC"), v13, v14) & 1) != 0)
  {
    v10 = 1246;
    v11 = &unk_1D5452208;
    objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v16, 8217, v17, v18);
  }
  else
  {
    if ((objc_msgSend_isEqualToString_(v3, v16, (uint64_t)CFSTR("DM"), v17, v18) & 1) != 0)
    {
      v10 = 13404;
      v11 = &unk_1D54526E6;
      v15 = 32099;
      goto LABEL_5;
    }
    if ((objc_msgSend_isEqualToString_(v3, v12, (uint64_t)CFSTR("DeFringe"), v13, v14) & 1) != 0)
    {
      v10 = 3299;
      v11 = &unk_1D5455B42;
      objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v35, 21373, v36, v37);
    }
    else if ((objc_msgSend_isEqualToString_(v3, v35, (uint64_t)CFSTR("GM"), v36, v37) & 1) != 0)
    {
      v10 = 1089;
      v11 = &unk_1D5456825;
      objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v38, 5164, v39, v40);
    }
    else if ((objc_msgSend_isEqualToString_(v3, v38, (uint64_t)CFSTR("HM"), v39, v40) & 1) != 0)
    {
      v10 = 345;
      v11 = &unk_1D5456C66;
      objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v41, 1925, v42, v43);
    }
    else if ((objc_msgSend_isEqualToString_(v3, v41, (uint64_t)CFSTR("Boost"), v42, v43) & 1) != 0)
    {
      v10 = 2121;
      v11 = &unk_1D5456DBF;
      objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v44, 16155, v45, v46);
    }
    else if ((objc_msgSend_isEqualToString_(v3, v44, (uint64_t)CFSTR("GainMap"), v45, v46) & 1) != 0)
    {
      v10 = 524;
      v11 = &unk_1D5457608;
      objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v47, 1410, v48, v49);
    }
    else if ((objc_msgSend_isEqualToString_(v3, v47, (uint64_t)CFSTR("V8LNR"), v48, v49) & 1) != 0)
    {
      v10 = 5068;
      v11 = &unk_1D5457814;
      objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v50, 31647, v51, v52);
    }
    else
    {
      if ((objc_msgSend_isEqualToString_(v3, v50, (uint64_t)CFSTR("V8CNR"), v51, v52) & 1) != 0)
      {
        v10 = 5080;
        v11 = &unk_1D5458BE0;
        v15 = 21654;
        goto LABEL_5;
      }
      if ((objc_msgSend_isEqualToString_(v3, v12, (uint64_t)CFSTR("V8VIEW"), v13, v14) & 1) != 0)
      {
        v10 = 954;
        v11 = &unk_1D5459FB8;
        objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v53, 5477, v54, v55);
      }
      else
      {
        if (!objc_msgSend_isEqualToString_(v3, v53, (uint64_t)CFSTR("LTM"), v54, v55))
        {
          v33 = 0;
          goto LABEL_14;
        }
        v10 = 605;
        v11 = &unk_1D545A372;
        objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v56, 1764, v57, v58);
      }
    }
  }
LABEL_8:
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v59.zalloc, 0, 24);
  v59.avail_in = v10;
  v59.avail_out = objc_msgSend_length(v19, v20, v21, v22, v23, v11, *(_QWORD *)&v59.avail_in);
  v24 = objc_retainAutorelease(v19);
  v59.next_out = (Bytef *)objc_msgSend_mutableBytes(v24, v25, v26, v27, v28);
  if (inflateInit_(&v59, "1.2.12", 112) || (v29 = inflate(&v59, 0), v29 == -2) || (inflateEnd(&v59), v29 != 1))
  {
    v33 = 0;
  }
  else
  {
    v30 = objc_alloc(MEMORY[0x1E0CB3940]);
    v33 = (void *)objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v24, 4, v32);
  }

LABEL_14:
  return v33;
}

- (id)loadKernelsForGroup:(id)a3
{
  id v4;
  RAWKernels *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_objectForKeyedSubscript_(v5->priv, v6, (uint64_t)v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_objectForKeyedSubscript_(v5->priv, v10, (uint64_t)v4, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_kernelSourceForGroup_(v5, v10, (uint64_t)v4, v11, v12);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelsWithString_messageLog_(MEMORY[0x1E0C9DDD0], v14, (uint64_t)v46, 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_count(v16, v17, v18, v19, v20);
    v22 = objc_alloc(MEMORY[0x1E0C99E08]);
    v26 = (void *)objc_msgSend_initWithCapacity_(v22, v23, v21, v24, v25);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v27 = v16;
    v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v47, (uint64_t)v51, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v48 != v34)
            objc_enumerationMutation(v27);
          v36 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend_name(v36, v29, v30, v31, v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v26, v38, (uint64_t)v36, (uint64_t)v37, v39);

        }
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v47, (uint64_t)v51, 16);
      }
      while (v33);
    }

    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v40, (uint64_t)v26, v41, v42);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5->priv, v43, (uint64_t)v13, (uint64_t)v4, v44);

  }
  objc_sync_exit(v5);

  return v13;
}

+ (id)sharedKernels
{
  id v2;

  v2 = a1;
  objc_sync_enter(v2);
  if (!qword_1EFF387A8)

  objc_sync_exit(v2);
  return (id)qword_1EFF387A8;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a1;
  objc_sync_enter(v4);
  if (qword_1EFF387A8)
  {
    v5 = 0;
  }
  else
  {
    v9.receiver = v4;
    v9.super_class = (Class)&OBJC_METACLASS___RAWKernels;
    v6 = objc_msgSendSuper2(&v9, sel_allocWithZone_, a3);
    v7 = (void *)qword_1EFF387A8;
    qword_1EFF387A8 = (uint64_t)v6;

    v5 = (id)qword_1EFF387A8;
  }
  objc_sync_exit(v4);

  return v5;
}

- (id)kernelWithName:(id)a3 group:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  objc_msgSend_loadKernelsForGroup_(self, v7, (uint64_t)a4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)kernelWithName:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  objc_msgSend_sharedKernels(RAWKernels, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_group_(v8, v9, (uint64_t)v3, (uint64_t)CFSTR("default"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)kernelWithName:(id)a3 group:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend_sharedKernels(RAWKernels, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kernelWithName_group_(v11, v12, (uint64_t)v5, (uint64_t)v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->priv, 0);
}

@end
