@implementation CUFileResponse

- (CUFileResponse)initWithDictionary:(id)a3 error:(id *)a4
{
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CUFileResponse *v12;
  CFTypeID TypeID;
  void *v14;
  NSArray *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CUFileItem *v27;
  CUFileItem *v28;
  id v29;
  void *v30;
  NSArray *fileItems;
  unsigned int Int64Ranged;
  CUFileResponse *v33;
  uint64_t v35;
  void *v36;
  int v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFDictionary *)a3;
  v12 = -[CUFileResponse init](self, "init");
  if (!v12)
  {
    if (a4)
    {
      NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"Init failed", v7, v8, v9, v10, v11, v35);
      v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
    goto LABEL_17;
  }
  TypeID = CFArrayGetTypeID();
  CFDictionaryGetTypedValue(v6, CFSTR("fIts"), TypeID, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_13;
  v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v36 = v14;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v17)
    goto LABEL_12;
  v18 = v17;
  v19 = *(_QWORD *)v40;
  while (2)
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v40 != v19)
        objc_enumerationMutation(v16);
      v21 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = v36;
        if (a4)
        {
          NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960540, (uint64_t)"Non-dict file item", v22, v23, v24, v25, v26, v35);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_23;
      }
      v27 = [CUFileItem alloc];
      v38 = 0;
      v28 = -[CUFileItem initWithDictionary:error:](v27, "initWithDictionary:error:", v21, &v38);
      v29 = v38;
      v30 = v29;
      if (!v28)
      {
        v14 = v36;
        if (a4)
          *a4 = objc_retainAutorelease(v29);

LABEL_23:
        v33 = 0;
        goto LABEL_16;
      }
      -[NSArray addObject:](v15, "addObject:", v28);

    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v18)
      continue;
    break;
  }
LABEL_12:

  fileItems = v12->_fileItems;
  v12->_fileItems = v15;

  v14 = v36;
LABEL_13:
  v37 = 0;
  Int64Ranged = CFDictionaryGetInt64Ranged(v6, &unk_1E25FD1B8, 0, 0xFFFFFFFFLL, &v37);
  if (!v37)
    v12->_flags = Int64Ranged;
  v33 = v12;
LABEL_16:

LABEL_17:
  return v33;
}

- (void)encodeWithDictionary:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_fileItems;
  if (-[NSArray count](v5, "count"))
  {
    v15 = v4;
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
          v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v12, "encodeWithDictionary:", v13);
          objc_msgSend(v6, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v4 = v15;
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v6, CFSTR("fIts"));

  }
  if (self->_flags)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, &unk_1E25FD1B8);

  }
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return NSPrintF((uint64_t)"CUFileResponse", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (NSArray)fileItems
{
  return self->_fileItems;
}

- (void)setFileItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileItems, 0);
}

@end
