@implementation MSVSectionedCollection

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  id v19;
  _QWORD *v20;
  void (**v21)(_QWORD, _QWORD);
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  void (**v28)(_QWORD, _QWORD);
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD *v47;
  id v48;
  void (**v49)(_QWORD, _QWORD);
  void (**v50)(_QWORD, _QWORD);
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  unint64_t v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  unint64_t v82;
  char v83[9];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0;
  v8 = objc_msgSend(*(id *)(a1 + 32), "numberOfSections");
  v9 = objc_msgSend(*(id *)(a1 + 40), "numberOfSections");
  v10 = MEMORY[0x1E0C809B0];
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_2;
  v80[3] = &unk_1E3154188;
  v81 = *(id *)(a1 + 48);
  v11 = MPChangeDetailOperationGenerateEx(v8, v9, &v82, (char *)&v55, v80);
  v74[0] = v10;
  v74[1] = 3221225472;
  v74[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_3;
  v74[3] = &unk_1E3154200;
  v12 = v5;
  v75 = v12;
  v78 = *(id *)(a1 + 48);
  v13 = v4;
  v76 = v13;
  v14 = v3;
  v77 = v14;
  v79 = *(id *)(a1 + 56);
  v50 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v74);
  v68[0] = v10;
  v68[1] = 3221225472;
  v68[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_5;
  v68[3] = &unk_1E3154200;
  v15 = v7;
  v69 = v15;
  v72 = *(id *)(a1 + 48);
  v16 = v6;
  v70 = v16;
  v73 = *(id *)(a1 + 56);
  v17 = v14;
  v71 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v68);
  v62[0] = v10;
  v62[1] = 3221225472;
  v62[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_7;
  v62[3] = &unk_1E3154200;
  v46 = v13;
  v63 = v46;
  v66 = *(id *)(a1 + 48);
  v45 = v12;
  v64 = v45;
  v19 = v17;
  v65 = v19;
  v67 = *(id *)(a1 + 56);
  v49 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v62);
  v56[0] = v10;
  v56[1] = 3221225472;
  v56[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_9;
  v56[3] = &unk_1E3154200;
  v20 = v11;
  v44 = v16;
  v57 = v44;
  v60 = *(id *)(a1 + 48);
  v43 = v15;
  v58 = v43;
  v61 = *(id *)(a1 + 56);
  v48 = v19;
  v59 = v48;
  v21 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v56);
  v22 = v82;
  if (v82)
  {
    v23 = 0;
    v24 = 0x1E0CB3000uLL;
    v47 = v20;
    while (1)
    {
      v25 = v20[v23];
      v26 = v25 >> 62;
      if (v25 >> 62 == 1)
        break;
      if ((_DWORD)v26 == 3)
      {
        objc_msgSend(*(id *)(v24 + 1712), "indexPathWithIndex:", v20[v23] & 0x7FFFFFFFLL);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = v50;
LABEL_8:
        ((void (**)(_QWORD, id))v28)[2](v28, v27);
LABEL_31:

        v22 = v82;
        goto LABEL_32;
      }
      if ((_DWORD)v26 == 2)
      {
        objc_msgSend(*(id *)(v24 + 1712), "indexPathWithIndex:", (v25 >> 31) & 0x7FFFFFFF);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = v49;
        goto LABEL_8;
      }
LABEL_32:
      if (++v23 >= v22)
        goto LABEL_33;
    }
    v29 = (v25 >> 31) & 0x7FFFFFFF;
    objc_msgSend(*(id *)(v24 + 1712), "indexPathWithIndex:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v25 & 0x7FFFFFFF;
    objc_msgSend(*(id *)(v24 + 1712), "indexPathWithIndex:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v33 = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", v29);
    v34 = objc_msgSend(*(id *)(a1 + 40), "numberOfItemsInSection:", v31);
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_11;
    v51[3] = &unk_1E3154228;
    v54 = *(id *)(a1 + 48);
    v27 = v30;
    v52 = v27;
    v35 = v32;
    v53 = v35;
    v36 = MPChangeDetailOperationGenerateEx(v33, v34, &v55, v83, v51);
    v37 = v55;
    if (!v55)
    {
LABEL_26:
      free(v36);
      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) != 0)
      {
        v20 = v47;
        v24 = 0x1E0CB3000;
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
          objc_msgSend(v48, "appendSectionUpdateForPreviousIndex:finalIndex:", objc_msgSend(v27, "section"), objc_msgSend(v35, "section"));
      }
      else
      {
        ((void (**)(_QWORD, id))v49)[2](v49, v27);
        ((void (**)(_QWORD, id))v50)[2](v50, v35);
        v20 = v47;
        v24 = 0x1E0CB3000;
      }

      goto LABEL_31;
    }
    v38 = 0;
    while (1)
    {
      v39 = *((_QWORD *)v36 + v38);
      v40 = v39 >> 62;
      if (v39 >> 62 == 1)
      {
        objc_msgSend(v27, "indexPathByAddingIndex:", (v39 >> 31) & 0x7FFFFFFF);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "indexPathByAddingIndex:", v39 & 0x7FFFFFFF);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
        {
          if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
          {
            if ((objc_msgSend(v41, "isEqual:", v42) & 1) != 0)
              objc_msgSend(v48, "appendItemUpdateForPreviousIndexPath:finalIndexPath:", v41, v42);
            else
              objc_msgSend(v48, "appendItemMoveFromIndexPath:toIndexPath:updated:", v41, v42, 1);
          }
        }
        else
        {
          ((void (**)(_QWORD, void *))v21)[2](v21, v41);
          ((void (**)(_QWORD, void *))v18)[2](v18, v42);
        }

        goto LABEL_24;
      }
      if ((_DWORD)v40 == 3)
        break;
      if ((_DWORD)v40 == 2)
      {
        objc_msgSend(v27, "indexPathByAddingIndex:", (v39 >> 31) & 0x7FFFFFFF);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v21)[2](v21, v41);
LABEL_24:

        v37 = v55;
      }
      if (++v38 >= v37)
        goto LABEL_26;
    }
    objc_msgSend(v35, "indexPathByAddingIndex:", *((_QWORD *)v36 + v38) & 0x7FFFFFFFLL);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v18)[2](v18, v41);
    goto LABEL_24;
  }
LABEL_33:
  free(v20);
  objc_msgSend(v48, "setInsertedSections:", v46);
  objc_msgSend(v48, "setDeletedSections:", v45);
  objc_msgSend(v48, "setInsertedItemIndexPaths:", v44);
  objc_msgSend(v48, "setDeletedItemIndexPaths:", v43);
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v48, "applyUIKitWorkarounds");

}

uint64_t __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);

  return v7;
}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_4;
  v11[3] = &unk_1E31541B0;
  v13 = *(id *)(a1 + 56);
  v5 = v3;
  v12 = v5;
  v14 = &v15;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v11);
  if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v5, "section"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    v6 = *(void **)(a1 + 48);
    v7 = v16[3];
    v8 = objc_msgSend(v5, "section");
    v9 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v16[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendSectionMoveFromIndex:toIndex:updated:", v7, v8, (*(uint64_t (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v5));

  }
  _Block_object_dispose(&v15, 8);

}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v10;
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0x7FFFFFFFFFFFFFFFLL;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5461;
  v19 = __Block_byref_object_dispose__5462;
  v20 = 0;
  v4 = *(void **)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_6;
  v10 = &unk_1E31541D8;
  v12 = *(id *)(a1 + 56);
  v5 = v3;
  v11 = v5;
  v13 = &v21;
  v14 = &v15;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v7);
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5, v7, v8, v9, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v7, v8, v9, v10);
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    if ((objc_msgSend((id)v16[5], "isEqual:", v5) & 1) != 0)
    {
      if ((_DWORD)v6)
        objc_msgSend(*(id *)(a1 + 48), "appendItemUpdateForPreviousIndexPath:finalIndexPath:", v16[5], v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "appendItemMoveFromIndexPath:toIndexPath:updated:", v16[5], v5, v6);
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_8;
  v11[3] = &unk_1E31541B0;
  v13 = *(id *)(a1 + 56);
  v5 = v3;
  v12 = v5;
  v14 = &v15;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v11);
  if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v5, "section"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:");
    v6 = *(void **)(a1 + 48);
    v7 = objc_msgSend(v5, "section");
    v8 = v16[3];
    v9 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendSectionMoveFromIndex:toIndex:updated:", v7, v8, (*(uint64_t (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v10));

  }
  _Block_object_dispose(&v15, 8);

}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v10;
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0x7FFFFFFFFFFFFFFFLL;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5461;
  v19 = __Block_byref_object_dispose__5462;
  v20 = 0;
  v4 = *(void **)(a1 + 32);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_10;
  v10 = &unk_1E31541D8;
  v12 = *(id *)(a1 + 56);
  v5 = v3;
  v11 = v5;
  v13 = &v21;
  v14 = &v15;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v7);
  if (v22[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5, v7, v8, v9, v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v7, v8, v9, v10);
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    if ((objc_msgSend(v5, "isEqual:", v16[5]) & 1) != 0)
    {
      if ((_DWORD)v6)
        objc_msgSend(*(id *)(a1 + 48), "appendItemUpdateForPreviousIndexPath:finalIndexPath:", v5, v16[5]);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "appendItemMoveFromIndexPath:toIndexPath:updated:", v5, v16[5], v6);
    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

}

uint64_t __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "indexPathByAddingIndex:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "indexPathByAddingIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v7);

  return v8;
}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_10(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
    *a4 = 1;
  }

}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_8(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v7 = a1[4];
  v6 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, v8);

  if ((_DWORD)v6)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
    *a3 = 1;
  }
}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_6(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
    *a4 = 1;
  }

}

void __127__MSVSectionedCollection_MPAdditions__changeDetailsToSectionedCollection_applyingUIKitWorkarounds_isEqualBlock_isUpdatedBlock___block_invoke_4(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  void *v7;

  v6 = a1[5];
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, a1[4]);

  if ((_DWORD)v6)
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
    *a3 = 1;
  }
}

@end
