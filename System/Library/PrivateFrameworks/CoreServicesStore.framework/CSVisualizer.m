@implementation CSVisualizer

void __57___CSVisualizer_enumerateReferencesToUnit_inTable_block___block_invoke(_QWORD *a1, unsigned int *a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v6;
  CSStore2 **v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v5 = *a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57___CSVisualizer_enumerateReferencesToUnit_inTable_block___block_invoke_2;
  v9[3] = &unk_1E4E22060;
  v13 = 4 * v5;
  v14 = a1[8];
  v7 = (CSStore2 **)a1[6];
  v6 = a1[7];
  v8 = (void *)a1[5];
  v9[4] = a1[4];
  v11 = v6;
  v10 = v8;
  v12 = a3;
  CSStore2::Store::enumerateUnits(v7, a2, v9);

}

void __57___CSVisualizer_enumerateReferencesToUnit_inTable_block___block_invoke_2(uint64_t a1, _DWORD *a2, _BYTE *a3)
{
  void *v6;
  void *v7;

  v6 = (void *)MEMORY[0x1A85AA4B4]();
  if (*(_DWORD *)(a1 + 64) != *(_DWORD *)(a1 + 68) || 4 * *a2 != *(_DWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "descriptionOfUnit:inTable:", (4 * *a2));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && objc_msgSend(*(id *)(a1 + 48), "unitDescription:referencesUnit:inTable:", v7, *(unsigned int *)(a1 + 72), *(unsigned int *)(a1 + 68)))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      *a3 = 0;
      **(_BYTE **)(a1 + 56) = 0;
    }

  }
  objc_autoreleasePoolPop(v6);
}

uint64_t __31___CSVisualizer_breakDownUsage__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "breakDownTable:inStore:buffer:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id __42___CSVisualizer_setStandardTableFunctions__block_invoke(uint64_t a1, int a2, int a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  NSNumber *v9;
  unsigned int v10;
  uint64_t v11;
  NSNumber *v12;
  NSNumber *v13;
  _BOOL8 v15;
  NSNumber *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  void *v24;
  void (**v25)(CSStore2::AttributedStringWriter *__hidden);
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 *v41;

  CSStore2::Array::Get((CSStore2::Array *)&v25, *(CSStore2::Store **)(a1 + 32), a4);
  if (!(_BYTE)v27)
    return 0;
  v4 = v26;
  v5 = DWORD2(v26);
  v6 = (void *)MEMORY[0x1A85AA4B4]();
  v7 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v25 = &off_1E4E21120;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = v7;
  *((_QWORD *)&v26 + 1) = v8;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  *(_QWORD *)&v32 = 0;
  DWORD2(v32) = 1065353216;
  v33 = 0u;
  v34 = 0u;
  LODWORD(v35) = 1065353216;
  WORD4(v35) = 0;
  *(_QWORD *)&v36 = 0;
  WORD4(v36) = 257;
  BYTE10(v36) = 0;
  v41 = &v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*(_DWORD *)v4 >> 29) & 1);
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, CFSTR("packed"), v9);

  v10 = *(_DWORD *)v4 & 0x1FFFFFFF;
  if (v10 >= v5)
    v11 = v5;
  else
    v11 = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, CFSTR("capacity"), v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, CFSTR("count"), v13);

  v15 = v5 > v10 && (v5 - v11) > 4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, CFSTR("oversized"), v16);

  v17 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "appendString:", CFSTR("{ "));
    v19 = v18;
    v20 = v4 + 4;
    if ((*(_BYTE *)(v4 + 3) & 0x20) != 0)
    {
      if ((_DWORD)v11)
      {
        v23 = 0;
        do
        {
          if (v23)
            objc_msgSend(v19, "appendString:", CFSTR(", "));
          objc_msgSend(v19, "appendFormat:", CFSTR("0x%llx"), *(unsigned __int16 *)(v20 + v23));
          v23 += 2;
        }
        while (2 * v11 != v23);
      }
    }
    else if ((_DWORD)v11)
    {
      v21 = 0;
      do
      {
        if (v21)
          objc_msgSend(v19, "appendString:", CFSTR(", "));
        objc_msgSend(v19, "appendFormat:", CFSTR("0x%llx"), *(unsigned int *)(v20 + v21));
        v21 += 4;
      }
      while (4 * v11 != v21);
    }

    objc_msgSend(v19, "appendString:", CFSTR(" }"));
    CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v25, CFSTR("values"), (NSString *)v19);
  }

  v24 = (void *)objc_msgSend(v8, "copy");
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v25);

  objc_autoreleasePoolPop(v6);
  return v24;
}

id __42___CSVisualizer_setStandardTableFunctions__block_invoke_2(uint64_t a1, int a2, int a3, unsigned int a4)
{
  void *v4;
  void *v5;
  _OWORD v7[2];
  char v8;
  _OWORD v9[2];
  char v10;

  CSStore2::String::Get(v9, *(CSStore2::Store **)(a1 + 32), a4);
  if (v10)
  {
    v7[0] = v9[0];
    v7[1] = v9[1];
    v8 = 1;
    CSStore2::String::getNSStringNoCopy((CSStore2::String *)v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    return v5;
  }
  else
  {
    LOBYTE(v7[0]) = 0;
    v8 = 0;
    return 0;
  }
}

id __42___CSVisualizer_setStandardTableFunctions__block_invoke_3(uint64_t a1, int a2, int a3, unsigned int a4)
{
  _DWORD *v4;
  void *v5;
  id v6;
  id v7;
  unsigned int *StringCacheEntry;
  NSNumber *v9;
  NSNumber *v11;
  NSString *v12;
  char **v13;
  NSNumber *v14;
  void *v15;
  CSStore2::Store *v16[2];
  char *v17[2];
  char v18;
  _QWORD v19[5];
  _BYTE v20[40];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE *v34;

  v4 = CSStore2::String::Get(v20, *(CSStore2::Store **)(a1 + 32), a4);
  if (!v20[32])
  {
    LOBYTE(v16[0]) = 0;
    v18 = 0;
    return 0;
  }
  *(_OWORD *)v16 = *(_OWORD *)v20;
  *(_OWORD *)v17 = *(_OWORD *)&v20[16];
  v18 = 1;
  v5 = (void *)MEMORY[0x1A85AA4B4](v4);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  *(_QWORD *)v20 = &off_1E4E21120;
  memset(&v20[8], 0, 32);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v6;
  *(_QWORD *)&v20[16] = v7;
  *(_OWORD *)&v20[24] = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  *(_QWORD *)&v25 = 0;
  v26 = 0u;
  v27 = 0u;
  DWORD2(v25) = 1065353216;
  LODWORD(v28) = 1065353216;
  WORD4(v28) = 0;
  *(_QWORD *)&v29 = 0;
  WORD4(v29) = 257;
  BYTE10(v29) = 0;
  v34 = &v20[8];
  if (!v16[0] || BYTE4(v16[1]))
  {
    if (BYTE4(v16[1]))
    {
      CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)v20, CFSTR("retainCount"), CFSTR("N/A (packed)"));
      goto LABEL_11;
    }
LABEL_10:
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3321888768;
    v19[2] = ___ZNK8CSStore26String19getDebugDescriptionEv_block_invoke;
    v19[3] = &__block_descriptor_40_ea8_32c52_ZTSKZNK8CSStore26String19getDebugDescriptionEvE3__0_e5_v8__0l;
    v19[4] = v20;
    CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)v20, (uint64_t)CFSTR("_CSVNum"), (uint64_t)&unk_1E4E25520, (uint64_t)v19);
    goto LABEL_11;
  }
  StringCacheEntry = CSStore2::getStringCacheEntry(v16[0], (const CSStore2::Store *)LODWORD(v16[1]));
  if (!StringCacheEntry || !*(_BYTE *)StringCacheEntry)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)v20, CFSTR("retainCount"), v9);

LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v17[1]));
  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)v20, CFSTR("length"), v11);

  CSStore2::String::getNSStringNoCopy((CSStore2::String *)v16);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)v20, CFSTR("characters"), v12);

  if (BYTE4(v16[1]))
    v13 = v17;
  else
    v13 = (char **)v17[0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", CSStore2::_StringFunctions::getHashCode((CSStore2::_StringFunctions *)v13, (const char *)LODWORD(v17[1])));
  v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)v20, CFSTR("hashCode"), v14);

  v15 = (void *)objc_msgSend(v7, "copy");
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)v20);

  objc_autoreleasePoolPop(v5);
  return v15;
}

id __42___CSVisualizer_setStandardTableFunctions__block_invoke_4(uint64_t a1, int a2, int a3, unsigned int a4)
{
  char *v4;
  void *v5;
  id v6;
  id v7;
  NSAttributedString *v8;
  NSNumber *v9;
  void *v10;
  __int128 v12;
  uint64_t v13;
  char v14;
  _BYTE v15[24];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE *v30;

  v4 = CSStore2::Dictionary::Get((CSStore2::Dictionary *)v15, *(CSStore2::Store **)(a1 + 32), a4);
  if ((_BYTE)v16)
  {
    v12 = *(_OWORD *)v15;
    v13 = *(_QWORD *)&v15[16];
    v14 = 1;
    v5 = (void *)MEMORY[0x1A85AA4B4](v4);
    v6 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    *(_QWORD *)v15 = &off_1E4E21120;
    *(_OWORD *)&v15[8] = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = v6;
    *(_QWORD *)&v15[16] = v7;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    *(_QWORD *)&v21 = 0;
    v22 = 0u;
    v23 = 0u;
    DWORD2(v21) = 1065353216;
    LODWORD(v24) = 1065353216;
    WORD4(v24) = 0;
    *(_QWORD *)&v25 = 0;
    WORD4(v25) = 257;
    BYTE10(v25) = 0;
    v30 = &v15[8];
    CSStore2::Dictionary::getDescriptionOfContents((CSStore2::Dictionary *)&v12, 0);
    v8 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    if (v8)
      CSStore2::AttributedStringWriter::attributedString((CSStore2::AttributedStringWriter *)v15, (NSAttributedString *)CFSTR("values"), v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CSStore2::Dictionary::getCount((CSStore2::Dictionary *)v12, *(_DWORD *)(*((_QWORD *)&v12 + 1) + 4)));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)v15, CFSTR("count"), v9);

    v10 = (void *)objc_msgSend(v7, "copy");
    CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)v15);

    objc_autoreleasePoolPop(v5);
    return v10;
  }
  else
  {
    LOBYTE(v12) = 0;
    v14 = 0;
    return 0;
  }
}

void __41___CSVisualizer_getUnit_inTable_fromURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqual:", CFSTR("t")))
    goto LABEL_5;
  objc_msgSend(v7, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(v7, "value");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      **(_DWORD **)(a1 + 48) = objc_msgSend(v3, "longLongValue");
LABEL_5:

    }
  }
  objc_msgSend(v7, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqual:", CFSTR("u")))
  {
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v7, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(v7, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      **(_DWORD **)(a1 + 56) = objc_msgSend(v5, "longLongValue");
      goto LABEL_10;
    }
  }
LABEL_11:

}

uint64_t __56___CSVisualizer_unitDescription_referencesUnit_inTable___block_invoke(uint64_t result, int a2, int a3, _BYTE *a4)
{
  if (*(_DWORD *)(result + 40) == a2 && *(_DWORD *)(result + 44) == a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __67___CSVisualizer_enumerateReferencesToUnitsInUnitDescription_block___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67___CSVisualizer_enumerateReferencesToUnitsInUnitDescription_block___block_invoke_2;
  v7[3] = &unk_1E4E220B0;
  v8 = *(id *)(a1 + 32);
  v9 = a5;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __67___CSVisualizer_enumerateReferencesToUnitsInUnitDescription_block___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;

  v7 = a2;
  v8 = a3;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = 0;
      if (+[_CSVisualizer getUnit:inTable:fromURL:](_CSVisualizer, "getUnit:inTable:fromURL:", &v9, (char *)&v9 + 4, v8))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
    }
  }
  **(_BYTE **)(a1 + 40) = *a4;

}

void __47___CSVisualizer_breakDownTable_inStore_buffer___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  _BOOL4 v10;
  int v11;
  _DWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;
  _DWORD *v23;
  BOOL v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  _DWORD *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v35;
  BOOL v36;
  unint64_t v37;
  _DWORD *v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  unint64_t v42;
  unint64_t v43;
  unsigned int *v44;
  int v45;
  _DWORD *v46;
  unint64_t v47;
  _BOOL8 v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t *v54;
  uint64_t v55;
  void *(*v56)(uint64_t, unsigned int, size_t, int, int);
  void *v57;
  uint64_t v58;
  char v59;
  unsigned __int8 v60;

  v4 = 2 * (*(_BYTE *)(a1 + 48) & 0x1Fu);
  if (a2)
  {
    v5 = **(_QWORD **)(a1 + 32);
    if (v5)
      v6 = *(_QWORD *)(v5 + 8);
    else
      v6 = 0;
    v7 = 0xFFFFFFFFLL;
    v8 = (unint64_t)a2 >= v6;
    v9 = (unint64_t)a2 - v6;
    if (v8 && !HIDWORD(v9))
    {
      v10 = (v9 + 1) > *(_DWORD *)(*(_QWORD *)(v5 + 8) + 12) || (_DWORD)v9 == -1;
      v7 = v9;
      if (v10)
        v7 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    v7 = 0xFFFFFFFFLL;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + v7) = 0x101010101010101 * v4;
  v11 = v4 | 0x40;
  v12 = a2 + 2;
  v13 = **(_QWORD **)(a1 + 32);
  if (v13)
    v14 = *(_QWORD *)(v13 + 8);
  else
    v14 = 0;
  v15 = 0xFFFFFFFFLL;
  v8 = (unint64_t)v12 >= v14;
  v16 = (unint64_t)v12 - v14;
  if (v8 && !HIDWORD(v16))
  {
    if ((v16 + 1) > *(_DWORD *)(*(_QWORD *)(v13 + 8) + 12) || v16 == -1)
      v15 = 0xFFFFFFFFLL;
    else
      v15 = v16;
  }
  memset((void *)(*(_QWORD *)(a1 + 40) + v15), v11, a2[1]);
  if (*(_BYTE *)(a1 + 48) == 8)
  {
    CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v54, *(CSStore2::Store **)(a1 + 32), 4 * *a2);
    if ((_BYTE)v57)
    {
      v18 = *(unsigned int *)(v55 + 4);
      if ((_DWORD)v18 != -1)
      {
        v19 = v54;
        v20 = *(_QWORD *)(*v54 + 8);
        v21 = *(_DWORD *)(v20 + 12);
        if (v21 > v18)
        {
          v22 = *(_QWORD *)(a1 + 40);
          v23 = (_DWORD *)(v20 + v18);
          v24 = v20 + v18 < v20;
          v25 = (int)v18 + 1 > v21 || v18 == -1;
          v26 = *(unsigned int *)(v55 + 4);
          if (v25)
            v26 = 0xFFFFFFFFLL;
          if (v24)
            v26 = 0xFFFFFFFFLL;
          *(_DWORD *)(v22 + v26) = 269488144;
          v54 = (uint64_t *)MEMORY[0x1E0C809B0];
          v55 = 3221225472;
          v56 = ___ZN8CSStore27HashMapIjjNS_10Dictionary10_FunctionsELy0EE14WriteBreakdownERKNS_5StoreEPKS3_hPh_block_invoke;
          v57 = &__block_descriptor_41_e21_v32__0I8I12B16B20_B24l;
          v59 = 8;
          v58 = v22;
          v27 = &v54;
          v28 = v27;
          v60 = 0;
          v29 = v23 + 1;
          v30 = *v19;
          if (*v19)
            v31 = *(_QWORD *)(v30 + 8);
          else
            v31 = 0;
          v32 = 0xFFFFFFFFLL;
          v8 = (unint64_t)v29 >= v31;
          v33 = (unint64_t)v29 - v31;
          if (v8 && !HIDWORD(v33))
          {
            if ((v33 + 1) > *(_DWORD *)(*(_QWORD *)(v30 + 8) + 12) || v33 == -1)
              v32 = 0xFFFFFFFFLL;
            else
              v32 = v33;
          }
          ((void (*)(uint64_t *, uint64_t, _QWORD, uint64_t, uint64_t, unsigned __int8 *))v56)(v27, v32, (8 * *v23), 1, 1, &v60);
          v35 = *v23;
          if ((_DWORD)v35)
            v36 = v60 == 0;
          else
            v36 = 0;
          if (v36)
          {
            v37 = 0;
            do
            {
              v38 = &v23[2 * v37];
              v39 = v38[2];
              if ((_DWORD)v39 == -1)
              {
                v43 = 0;
              }
              else
              {
                v40 = *(_QWORD *)(*v19 + 8);
                v41 = *(_DWORD *)(v40 + 12) > v39;
                v42 = v40 + v39;
                if (v41)
                  v43 = v42;
                else
                  v43 = 0;
              }
              v44 = v38 + 1;
              v45 = v38[1];
              if (v45)
              {
                v46 = (_DWORD *)(v43 + 4);
                v47 = 1;
                do
                {
                  if (*(v46 - 1))
                    v48 = *v46 != 0;
                  else
                    v48 = 0;
                  v49 = *v19;
                  if (*v19)
                    v50 = *(_QWORD *)(v49 + 8);
                  else
                    v50 = 0;
                  v51 = 0xFFFFFFFFLL;
                  v8 = v43 >= v50;
                  v52 = v43 - v50;
                  if (v8 && !HIDWORD(v52))
                  {
                    if ((v52 + 1) > *(_DWORD *)(*(_QWORD *)(v49 + 8) + 12) || v52 == -1)
                      v51 = 0xFFFFFFFFLL;
                    else
                      v51 = v52;
                  }
                  ((void (*)(uint64_t *, uint64_t, uint64_t, _QWORD, _BOOL8, unsigned __int8 *))v56)(v28, v51, 8, 0, v48, &v60);
                  v45 = v60;
                  if (v47 >= *v44)
                    break;
                  ++v47;
                  v46 += 2;
                  v43 += 8;
                }
                while (!v60);
                v35 = *v23;
              }
              ++v37;
            }
            while (v37 < v35 && !v45);
          }

        }
      }
    }
  }
}

void __61___CSVisualizer_enumerateValuesForTitlesInDescription_block___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CSStore2 *v12;
  NSObject *v13;
  _QWORD *v14;
  unint64_t v15;
  char *v16;
  _QWORD *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v24;
  NSUInteger *v25;
  unint64_t v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  NSRange v31;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = &unk_1E4E25598;
  if (objc_msgSend(v9, "unsignedLongLongValue") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", CFSTR("_CSVIsRelated"), a3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && (v12 = (CSStore2 *)objc_msgSend(v10, "BOOLValue"), (_DWORD)v12))
    {
      CSStore2::GetLog(v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v31.location = a3;
        v31.length = a4;
        NSStringFromRange(v31);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v27;
        _os_log_debug_impl(&dword_1A4E5A000, v13, OS_LOG_TYPE_DEBUG, "Skipping appearance of title in range %{public}@ because it's in a range marked as a related unit", (uint8_t *)&v28, 0xCu);

      }
    }
    else
    {
      v14 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
      v16 = (char *)v14[7];
      v15 = v14[8];
      if ((unint64_t)v16 >= v15)
      {
        v18 = (char *)v14[6];
        v19 = (v16 - v18) >> 4;
        v20 = v19 + 1;
        if ((unint64_t)(v19 + 1) >> 60)
          abort();
        v21 = v15 - (_QWORD)v18;
        if (v21 >> 3 > v20)
          v20 = v21 >> 3;
        v22 = (unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0;
        v23 = 0xFFFFFFFFFFFFFFFLL;
        if (!v22)
          v23 = v20;
        if (v23)
        {
          v23 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v23);
          v18 = (char *)v14[6];
          v16 = (char *)v14[7];
        }
        else
        {
          v24 = 0;
        }
        v25 = (NSUInteger *)(v23 + 16 * v19);
        v26 = v23 + 16 * v24;
        *v25 = a3;
        v25[1] = a4;
        v17 = v25 + 2;
        if (v16 != v18)
        {
          do
          {
            *((_OWORD *)v25 - 1) = *((_OWORD *)v16 - 1);
            v25 -= 2;
            v16 -= 16;
          }
          while (v16 != v18);
          v18 = (char *)v14[6];
        }
        v14[6] = v25;
        v14[7] = v17;
        v14[8] = v26;
        if (v18)
          operator delete(v18);
      }
      else
      {
        *(_QWORD *)v16 = a3;
        *((_QWORD *)v16 + 1) = a4;
        v17 = v16 + 16;
      }
      v14[7] = v17;
    }

  }
}

void __61___CSVisualizer_enumerateValuesForTitlesInDescription_block___block_invoke_39(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, _BYTE *a5)
{
  void *v9;
  int v10;
  uint64_t v11;
  NSRange v12;
  id v13;
  NSRange v14;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("_CSVOutputType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = &unk_1E4E25598;
  v13 = v9;
  v10 = objc_msgSend(v9, "unsignedLongLongValue");
  if (v10 == 1)
  {
    *a5 = 1;
  }
  else if (v10 == 3)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12.location = *(_QWORD *)(v11 + 48);
    if (v12.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_QWORD *)(v11 + 48) = a3;
      *(_QWORD *)(v11 + 56) = a4;
    }
    else
    {
      v12.length = *(_QWORD *)(v11 + 56);
      v14.location = a3;
      v14.length = a4;
      *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = NSUnionRange(v12, v14);
    }
  }

}

uint64_t __52___CSVisualizer_rangeOfValueForTitle_inDescription___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  uint64_t result;
  uint64_t v13;

  result = objc_msgSend(*(id *)(a1 + 32), "caseInsensitiveCompare:", a2);
  if (!result)
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v13 + 48) = a6;
    *(_QWORD *)(v13 + 56) = a7;
    *a8 = 1;
  }
  return result;
}

id __49___CSVisualizer_Deprecated__setHandler_forTable___block_invoke(uint64_t a1)
{
  id v1;
  id v3;

  v3 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = v3;

  return v1;
}

id __49___CSVisualizer_Deprecated__setHandler_forTable___block_invoke_2(uint64_t a1)
{
  id v1;
  id v3;

  v3 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = v3;

  return v1;
}

void __45___CSVisualizer_Deprecated__handlerForTable___block_invoke(uint64_t a1, uint64_t a2, void **a3, void **a4)
{
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "getSummary");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v14 = v8;
      v8[2](v8, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *a3;
      *a3 = (void *)v9;

      v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v14;
    }

  }
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "getDescription");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v15 = v11;
      v11[2](v11, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *a4;
      *a4 = (void *)v12;

      v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v15;
    }

  }
}

@end
