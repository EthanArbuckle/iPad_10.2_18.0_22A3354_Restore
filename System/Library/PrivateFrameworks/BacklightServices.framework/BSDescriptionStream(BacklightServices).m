@implementation BSDescriptionStream(BacklightServices)

- (void)bls_appendBoundedCollection:()BacklightServices withName:maximumItems:itemBlock:
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char **v23;
  uint64_t v24;
  char *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  int v36;
  _QWORD v37[4];
  __CFString *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  _QWORD v46[2];
  _QWORD v47[2];
  const __CFString *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_msgSend(v10, "count");
  v14 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __102__BSDescriptionStream_BacklightServices__bls_appendBoundedCollection_withName_maximumItems_itemBlock___block_invoke;
  v45[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
  v45[4] = v13;
  objc_msgSend(a1, "appendCustomFormatWithName:block:", 0, v45);
  v15 = _NSIsNSSet();
  v16 = v10;
  v17 = v16;
  if (v13 <= a5)
    goto LABEL_24;
  v18 = v16;
  v36 = v15;
  if ((objc_msgSend(a1, "sortKeys") & v15) == 1)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v42;
      v23 = &selRef_appendString_withName_;
      while (2)
      {
        v24 = 0;
        v25 = v23[80];
        do
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v19);
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v18 = v19;
            goto LABEL_15;
          }
          ++v24;
        }
        while (v21 != v24);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        v23 = &selRef_appendString_withName_;
        if (v21)
          continue;
        break;
      }
    }
    else
    {
      v25 = sel_compare_;
    }

    objc_msgSend(v19, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sortedArrayUsingSelector:", v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v26;
LABEL_15:

    v14 = MEMORY[0x1E0C809B0];
    v15 = v36;
  }
  v27 = a5 - 1;
  if (a5 == 1)
  {
    objc_msgSend(v18, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v29;
    v47[1] = CFSTR("…");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v36;
  }
  else
  {
    if (!a5)
    {
      v48 = CFSTR("…");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    objc_msgSend(v18, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "subarrayWithRange:", 0, v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v46[0] = CFSTR("…");
    objc_msgSend(v28, "lastObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v32 = v14;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v36;
    v14 = v32;

  }
  v18 = v28;
LABEL_22:

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
    v34 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v34;
  }
LABEL_24:
  v37[0] = v14;
  v37[1] = 3221225472;
  v37[2] = __102__BSDescriptionStream_BacklightServices__bls_appendBoundedCollection_withName_maximumItems_itemBlock___block_invoke_2;
  v37[3] = &unk_1E621A470;
  v38 = CFSTR("…");
  v39 = a1;
  v40 = v12;
  v35 = v12;
  objc_msgSend(a1, "appendCollection:withName:itemBlock:", v17, v11, v37);

}

- (id)bls_appendTimeInterval:()BacklightServices withName:decomposeUnits:
{
  _QWORD v7[5];

  if (a2 >= 1.0 || (a5 & 1) != 0)
  {
    objc_msgSend(a1, "appendTimeInterval:withName:decomposeUnits:");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __89__BSDescriptionStream_BacklightServices__bls_appendTimeInterval_withName_decomposeUnits___block_invoke;
    v7[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
    *(double *)&v7[4] = a2;
    objc_msgSend(a1, "appendCustomFormatWithName:block:", a4, v7);
    return a1;
  }
}

@end
