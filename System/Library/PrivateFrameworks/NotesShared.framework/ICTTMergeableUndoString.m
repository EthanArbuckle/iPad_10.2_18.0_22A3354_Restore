@implementation ICTTMergeableUndoString

- (void)addUndoCommand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICTTMergeableString objectsNeedingUpdatedRanges](self, "objectsNeedingUpdatedRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  -[ICTTMergeableString delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addUndoCommand:", v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", ICTTMergeableUndoStringDidAddUndoNotification, self);

}

- (void)applyUndoCommand:(id)a3
{
  objc_msgSend(a3, "applyToString:", self);
}

- (void)deleteSubstrings:(void *)a3 withCharacterRanges:(void *)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  ICTTMergeableStringUndoEditCommand *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  objc_super v21;
  id v22;
  int v23;
  int v24;
  id v25;

  -[ICTTMergeableString delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ICTTMergeableString delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "wantsUndoCommands");

    if (v10)
    {
      v11 = objc_alloc_init(ICTTMergeableStringUndoEditCommand);
      v12 = *(uint64_t **)a3;
      v13 = (uint64_t *)*((_QWORD *)a3 + 1);
      while (v12 != v13)
      {
        v14 = *v12;
        if (!*(_BYTE *)(*v12 + 44))
        {
          v15 = -[ICTTMergeableStringUndoEditCommand insertStrings](v11, "insertStrings");
          -[ICTTMergeableString attributedString](self, "attributedString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (*(_BYTE *)(v14 + 44))
            v18 = 0;
          else
            v18 = *(unsigned int *)(v14 + 16);
          objc_msgSend(v16, "attributedSubstringFromRange:", *(unsigned int *)(v14 + 40), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(id *)v14;
          v20 = *(_DWORD *)(v14 + 16);
          v23 = *(_DWORD *)(v14 + 8);
          v24 = v20;
          v25 = v19;
          std::vector<std::pair<TopoIDRange,NSAttributedString * {__strong}>>::push_back[abi:ne180100](v15, (uint64_t *)&v22);

        }
        ++v12;
      }
      -[ICTTMergeableUndoString addUndoCommand:](self, "addUndoCommand:", v11);

    }
  }
  v21.receiver = self;
  v21.super_class = (Class)ICTTMergeableUndoString;
  -[ICTTMergeableString deleteSubstrings:withCharacterRanges:](&v21, sel_deleteSubstrings_withCharacterRanges_, a3, a4);
}

- (void)undeleteSubstrings:(void *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  ICTTMergeableStringUndoEditCommand *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  id v19;
  int v20;
  int v21;
  id v22;
  id v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void ***v34;
  void **v35;
  void **v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  int v44;
  int v45;
  void *__p;
  char *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  int v51;

  -[ICTTMergeableString delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[ICTTMergeableString delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "wantsUndoCommands");

    if (v8)
    {
      v9 = objc_alloc_init(ICTTMergeableStringUndoEditCommand);
      v10 = *(_QWORD *)a3;
      v11 = *((_QWORD *)a3 + 1);
      while (v10 != v11)
      {
        *(_QWORD *)&v49 = *(id *)v10;
        DWORD2(v49) = *(_DWORD *)(v10 + 8);
        LODWORD(v50) = *(_DWORD *)(v10 + 16);
        *((_QWORD *)&v50 + 1) = *(id *)(v10 + 24);
        if (*((_QWORD *)&v50 + 1))
        {
          v12 = -[ICTTMergeableStringUndoEditCommand deleteRanges](v9, "deleteRanges");
          v13 = v12;
          v14 = v12[1];
          if (v14 >= v12[2])
          {
            v15 = std::vector<TopoIDRange>::__push_back_slow_path<TopoIDRange const&>(v12, (uint64_t)&v49);
          }
          else
          {
            *(_QWORD *)v14 = (id)v49;
            *(_DWORD *)(v14 + 8) = DWORD2(v49);
            *(_DWORD *)(v14 + 16) = v50;
            v15 = v14 + 24;
          }
          v13[1] = v15;
          v16 = (void *)*((_QWORD *)&v50 + 1);
        }
        else
        {
          v16 = 0;
        }

        v10 += 32;
      }
      v17 = -[ICTTMergeableStringUndoEditCommand deleteRanges](v9, "deleteRanges");
      if (v17[1] == *v17)
      {

        return;
      }
      -[ICTTMergeableUndoString addUndoCommand:](self, "addUndoCommand:", v9);

    }
  }
  v49 = 0u;
  v50 = 0u;
  v51 = 1065353216;
  v18 = *(_QWORD *)a3;
  v41 = *((_QWORD *)a3 + 1);
  if (*(_QWORD *)a3 != v41)
  {
    do
    {
      v19 = *(id *)v18;
      v20 = *(_DWORD *)(v18 + 8);
      v21 = *(_DWORD *)(v18 + 16);
      v22 = *(id *)(v18 + 24);
      if (v22)
      {
        __p = 0;
        v47 = 0;
        v48 = 0;
        v23 = v19;
        v43 = v23;
        v44 = v20;
        v45 = v21;
        if (self)
          -[ICTTMergeableString getSubstrings:forTopoIDRange:](self, "getSubstrings:forTopoIDRange:", &__p, &v43);
        else

        v24 = v47;
        while (v24 != __p)
        {
          v42 = 0;
          v26 = *((_QWORD *)v24 - 1);
          v24 -= 8;
          v25 = v26;
          v42 = v26;
          if (*(_BYTE *)(v26 + 44))
          {
            v27 = *(_DWORD *)(v25 + 8);
            v28 = *(unsigned int *)(v25 + 16);
            -[ICTTMergeableString attributedString](self, "attributedString");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "attributedSubstringFromRange:", (v27 - v20), v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "insertAttributedString:atIndex:", v30, *(unsigned int *)(v42 + 40));

            *(_BYTE *)(v42 + 44) = 0;
            objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unserialized");
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = *(void **)(v42 + 24);
            *(_QWORD *)(v42 + 24) = v31;

            std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)&v49, &v42, &v42);
          }
        }
        -[ICTTMergeableString updateSubstringIndexes](self, "updateSubstringIndexes");
        if (__p)
        {
          v47 = (char *)__p;
          operator delete(__p);
        }
      }

      v18 += 32;
    }
    while (v18 != v41);
  }
  -[ICTTMergeableString delegate](self, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = -[ICTTMergeableString orderedSubstrings](self, "orderedSubstrings");
    v35 = *v34;
    v36 = v34[1];
    if (*v34 != v36)
    {
      v37 = 0;
      do
      {
        __p = *v35;
        if (std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v49, &__p))
        {
          v38 = *((unsigned int *)__p + 4);
          -[ICTTMergeableString delegate](self, "delegate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "edited:range:changeInLength:", 2, v37, 0, v38);

        }
        if (*((_BYTE *)__p + 44))
          v40 = 0;
        else
          v40 = *((unsigned int *)__p + 4);
        v37 += v40;
        ++v35;
      }
      while (v35 != v36);
    }
  }
  -[ICTTMergeableString setHasLocalChanges:](self, "setHasLocalChanges:", 1);
  -[ICTTMergeableString coalesce](self, "coalesce");
  -[ICTTMergeableString updateSubstringIndexes](self, "updateSubstringIndexes");
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v49);
}

- (TopoIDRange)insertAttributedString:(SEL)a3 after:(id)a4 before:(void *)a5
{
  TopoIDRange *result;
  TopoIDRange *v9;
  void *v10;
  int v11;
  ICTTMergeableStringUndoEditCommand *v12;
  uint64_t *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ICTTMergeableUndoString;
  result = (TopoIDRange *)-[TopoIDRange insertAttributedString:after:before:](&v17, sel_insertAttributedString_after_before_, a4, a5, a6);
  if (retstr->var1)
  {
    -[ICTTMergeableString delegate](self, "delegate");
    result = (TopoIDRange *)objc_claimAutoreleasedReturnValue();
    v9 = result;
    if (result)
    {
      -[ICTTMergeableString delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "wantsUndoCommands");

      if (v11)
      {
        v12 = objc_alloc_init(ICTTMergeableStringUndoEditCommand);
        v13 = -[ICTTMergeableStringUndoEditCommand deleteRanges](v12, "deleteRanges");
        v14 = v13;
        v15 = v13[1];
        if (v15 >= v13[2])
        {
          v16 = std::vector<TopoIDRange>::__push_back_slow_path<TopoIDRange const&>(v13, (uint64_t)retstr);
        }
        else
        {
          *(_QWORD *)v15 = retstr->var0.replicaID;
          *(_DWORD *)(v15 + 8) = retstr->var0.clock;
          *(_DWORD *)(v15 + 16) = retstr->var1;
          v16 = v15 + 24;
        }
        v14[1] = v16;
        -[ICTTMergeableUndoString addUndoCommand:](self, "addUndoCommand:", v12);

      }
    }
  }
  return result;
}

@end
