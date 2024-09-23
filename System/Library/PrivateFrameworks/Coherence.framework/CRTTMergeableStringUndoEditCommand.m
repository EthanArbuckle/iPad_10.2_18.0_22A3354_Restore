@implementation CRTTMergeableStringUndoEditCommand

- (CRTTMergeableStringUndoEditCommand)init
{
  CRTTMergeableStringUndoEditCommand *v2;
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRTTMergeableStringUndoEditCommand;
  v2 = -[CRTTMergeableStringUndoEditCommand init](&v6, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    *v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
    v2->_deleteRanges = v3;
    v4 = (_QWORD *)operator new();
    *v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
    v2->_insertStrings = v4;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void **deleteRanges;
  void *v5;
  void *insertStrings;
  objc_super v7;
  void **v8;

  -[CRTTMergeableStringUndoEditCommand temporaryIDs](self, "temporaryIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRGlobalContextObjC releaseObjCSequence:](CRGlobalContextObjC, "releaseObjCSequence:", v3);

  deleteRanges = (void **)self->_deleteRanges;
  if (deleteRanges)
  {
    v5 = *deleteRanges;
    if (*deleteRanges)
    {
      deleteRanges[1] = v5;
      operator delete(v5);
    }
    MEMORY[0x1C3B7D750](deleteRanges, 0x20C40960023A9);
  }
  insertStrings = self->_insertStrings;
  if (insertStrings)
  {
    v8 = (void **)self->_insertStrings;
    std::vector<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v8);
    MEMORY[0x1C3B7D750](insertStrings, 0x20C40960023A9);
  }
  v7.receiver = self;
  v7.super_class = (Class)CRTTMergeableStringUndoEditCommand;
  -[CRTTMergeableStringUndoEditCommand dealloc](&v7, sel_dealloc);
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  void **deleteRanges;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  void *__p;
  _BYTE *v11;
  uint64_t v12;
  _OWORD v13[2];
  _OWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  __p = 0;
  v11 = 0;
  v12 = 0;
  deleteRanges = (void **)self->_deleteRanges;
  v8 = (unsigned __int8 *)*deleteRanges;
  v9 = (unsigned __int8 *)deleteRanges[1];
  if (*deleteRanges != v9)
  {
    do
    {
      updateTopoIDRange(v8, (uint64_t)a3, (__int128 *)a4, &__p);
      v8 += 28;
    }
    while (v8 != v9);
    deleteRanges = (void **)self->_deleteRanges;
  }
  if (deleteRanges != &__p)
    std::vector<TopoIDRange>::__assign_with_size[abi:ne180100]<TopoIDRange*,TopoIDRange*>((char *)deleteRanges, (char *)__p, (uint64_t)v11, 0x6DB6DB6DB6DB6DB7 * ((v11 - (_BYTE *)__p) >> 2));
  v14[0] = *(_OWORD *)a3->charID.replica.uuid;
  *(_OWORD *)((char *)v14 + 12) = *(_OWORD *)&a3->charID.replica.uuid[12];
  v13[0] = *(_OWORD *)a4->charID.replica.uuid;
  *(_OWORD *)((char *)v13 + 12) = *(_OWORD *)&a4->charID.replica.uuid[12];
  -[CRTTMergeableStringUndoEditCommand updateInsertTopoIDRange:toNewRangeID:](self, "updateInsertTopoIDRange:toNewRangeID:", v14, v13);
  if (__p)
  {
    v11 = __p;
    operator delete(__p);
  }
}

- (id)temporaryIDs
{
  ObjCRenameSequence *v3;
  __int128 **deleteRanges;
  __int128 *v5;
  __int128 *v6;
  __int128 v7;
  void *v8;
  __int128 **insertStrings;
  __int128 *v10;
  __int128 *v11;
  __int128 v12;
  id v13;
  void *v14;
  _BYTE v16[28];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(ObjCRenameSequence);
  deleteRanges = (__int128 **)self->_deleteRanges;
  v5 = *deleteRanges;
  v6 = deleteRanges[1];
  while (v5 != v6)
  {
    v7 = *v5;
    *(_OWORD *)&v16[12] = *(__int128 *)((char *)v5 + 12);
    *(_OWORD *)v16 = v7;
    if (*(_DWORD *)&v16[16])
    {
      TopoReplica::objc((TopoReplica *)v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ObjCRenameSequence addWithReplica:range:](v3, "addWithReplica:range:", v8, *(unsigned int *)&v16[20], *(unsigned int *)&v16[24], *(_QWORD *)v16, *(_QWORD *)&v16[8]);

    }
    v5 = (__int128 *)((char *)v5 + 28);
  }
  insertStrings = (__int128 **)self->_insertStrings;
  v10 = *insertStrings;
  v11 = insertStrings[1];
  while (v10 != v11)
  {
    v12 = *v10;
    *(_OWORD *)&v16[12] = *(__int128 *)((char *)v10 + 12);
    *(_OWORD *)v16 = v12;
    v13 = *((id *)v10 + 4);
    v17 = v13;
    if (*(_DWORD *)&v16[16])
    {
      TopoReplica::objc((TopoReplica *)v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ObjCRenameSequence addWithReplica:range:](v3, "addWithReplica:range:", v14, *(unsigned int *)&v16[20], *(unsigned int *)&v16[24]);

      v13 = v17;
    }

    v10 = (__int128 *)((char *)v10 + 40);
  }
  return v3;
}

- (BOOL)hasTemporaryIDs
{
  uint64_t *deleteRanges;
  uint64_t v3;
  uint64_t v4;
  uint64_t *insertStrings;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  BOOL result;
  BOOL v11;

  deleteRanges = (uint64_t *)self->_deleteRanges;
  v3 = *deleteRanges;
  v4 = deleteRanges[1];
  while (v3 != v4)
  {
    if (*(_DWORD *)(v3 + 16))
      return 1;
    v3 += 28;
  }
  insertStrings = (uint64_t *)self->_insertStrings;
  v7 = *insertStrings;
  v6 = insertStrings[1];
  if (v7 == v6)
    return 0;
  v8 = v7 + 40;
  do
  {
    v9 = *(_DWORD *)(v8 - 24);
    result = v9 != 0;
    if (v9)
      v11 = 1;
    else
      v11 = v8 == v6;
    v8 += 40;
  }
  while (!v11);
  return result;
}

- (void)retainTemporaryIDs
{
  id v2;

  -[CRTTMergeableStringUndoEditCommand temporaryIDs](self, "temporaryIDs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[CRGlobalContextObjC retainObjCSequence:](CRGlobalContextObjC, "retainObjCSequence:");

}

- (void)updateInsertTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  uint64_t *insertStrings;
  uint64_t v5;
  uint64_t v6;
  unsigned int v9;
  __int128 v10;
  __int128 v11;
  unsigned int index;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  insertStrings = (uint64_t *)self->_insertStrings;
  v5 = *insertStrings;
  v6 = insertStrings[1];
  if (*insertStrings != v6)
  {
    do
    {
      if (*(_DWORD *)(v5 + 16) == a3->charID.replica.index
        && !uuid_compare((const unsigned __int8 *)v5, a3->charID.replica.uuid)
        && (TopoID::operator<(v5, (uint64_t)a3) & 1) == 0)
      {
        v11 = *(_OWORD *)a3->charID.replica.uuid;
        v9 = a3->length + a3->charID.clock;
        index = a3->charID.replica.index;
        v13 = v9;
        if ((TopoID::operator>=((unsigned __int8 *)v5, (unsigned __int8 *)&v11) & 1) == 0)
        {
          v10 = *(_OWORD *)a4->charID.replica.uuid;
          *(_DWORD *)(v5 + 16) = a4->charID.replica.index;
          *(_OWORD *)v5 = v10;
          *(_DWORD *)(v5 + 20) = *(_DWORD *)(v5 + 20) + a4->charID.clock - a3->charID.clock;
        }
      }
      v5 += 40;
    }
    while (v5 != v6);
  }
}

- (id)renamedWith:(id)a3
{
  id v4;
  CRTTMergeableStringUndoEditCommand *v5;
  __int128 **deleteRanges;
  __int128 *v7;
  __int128 *v8;
  __int128 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  unint64_t v15;
  _OWORD *v16;
  __int128 v17;
  char *v18;
  void **v19;
  unint64_t v20;
  _OWORD *v21;
  __int128 v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  __int128 v35;
  char *v36;
  char *v37;
  _OWORD *v38;
  __int128 v39;
  char *v40;
  __int128 v41;
  char *v42;
  char *v43;
  _OWORD *v44;
  __int128 v45;
  __int128 **insertStrings;
  __int128 *v47;
  __int128 *v48;
  __int128 v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  char **v55;
  unint64_t v56;
  unint64_t v57;
  __int128 v58;
  char *v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  __int128 v68;
  char *v69;
  char *v70;
  char *v71;
  __int128 v72;
  uint64_t v73;
  char *v74;
  char *v75;
  CRTTMergeableStringUndoEditCommand *v77;
  _QWORD v78[4];
  CRTTMergeableStringUndoEditCommand *v79;
  id v80;
  _OWORD v81[2];
  id v82;
  _BYTE v83[28];
  id v84;
  _QWORD v85[4];
  CRTTMergeableStringUndoEditCommand *v86;
  _OWORD v87[2];
  _BYTE v88[32];
  _QWORD *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(CRTTMergeableStringUndoEditCommand);
  v77 = self;
  deleteRanges = (__int128 **)self->_deleteRanges;
  v7 = *deleteRanges;
  v8 = deleteRanges[1];
  if (*deleteRanges != v8)
  {
    do
    {
      v9 = *v7;
      *(_OWORD *)&v88[12] = *(__int128 *)((char *)v7 + 12);
      *(_OWORD *)v88 = v9;
      if (*(_DWORD *)&v88[16])
      {
        TopoReplica::objc((TopoReplica *)v88);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "renamedWithRange:replica:", *(unsigned int *)&v88[20], *(unsigned int *)&v88[24], v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "rangeCount"))
        {
          v12 = *(unsigned int *)&v88[20];
          v13 = *(unsigned int *)&v88[24];
          v85[0] = MEMORY[0x1E0C809B0];
          v85[1] = 3221225472;
          v85[2] = __50__CRTTMergeableStringUndoEditCommand_renamedWith___block_invoke;
          v85[3] = &unk_1E775E2B0;
          v86 = v5;
          v87[0] = *(_OWORD *)v88;
          *(_OWORD *)((char *)v87 + 12) = *(_OWORD *)&v88[12];
          objc_msgSend(v11, "enumerateRangesIn::", v12, v13, v85);

        }
        else
        {
          v19 = -[CRTTMergeableStringUndoEditCommand deleteRanges](v5, "deleteRanges");
          v20 = (unint64_t)v19[2];
          v21 = v19[1];
          if ((unint64_t)v21 >= v20)
          {
            v29 = 0x6DB6DB6DB6DB6DB7 * (((char *)v21 - (_BYTE *)*v19) >> 2);
            v30 = v29 + 1;
            if ((unint64_t)(v29 + 1) > 0x924924924924924)
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            v31 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v20 - (_QWORD)*v19) >> 2);
            if (2 * v31 > v30)
              v30 = 2 * v31;
            if (v31 >= 0x492492492492492)
              v32 = 0x924924924924924;
            else
              v32 = v30;
            if (v32)
              v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v19 + 2), v32);
            else
              v33 = 0;
            v40 = &v33[28 * v29];
            v41 = *(_OWORD *)v88;
            *(_OWORD *)(v40 + 12) = *(_OWORD *)&v88[12];
            *(_OWORD *)v40 = v41;
            v43 = (char *)*v19;
            v42 = (char *)v19[1];
            v44 = v40;
            if (v42 != *v19)
            {
              do
              {
                v45 = *(_OWORD *)(v42 - 28);
                *(v44 - 1) = *((_OWORD *)v42 - 1);
                *(_OWORD *)((char *)v44 - 28) = v45;
                v44 = (_OWORD *)((char *)v44 - 28);
                v42 -= 28;
              }
              while (v42 != v43);
              v42 = (char *)*v19;
            }
            v23 = v40 + 28;
            *v19 = v44;
            v19[1] = v40 + 28;
            v19[2] = &v33[28 * v32];
            if (v42)
              operator delete(v42);
          }
          else
          {
            v22 = *(_OWORD *)v88;
            *(_OWORD *)((char *)v21 + 12) = *(_OWORD *)&v88[12];
            *v21 = v22;
            v23 = (char *)v21 + 28;
          }
          v19[1] = v23;
        }

      }
      else
      {
        v14 = -[CRTTMergeableStringUndoEditCommand deleteRanges](v5, "deleteRanges");
        v15 = (unint64_t)v14[2];
        v16 = v14[1];
        if ((unint64_t)v16 >= v15)
        {
          v24 = 0x6DB6DB6DB6DB6DB7 * (((char *)v16 - (_BYTE *)*v14) >> 2);
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) > 0x924924924924924)
            std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
          v26 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v15 - (_QWORD)*v14) >> 2);
          if (2 * v26 > v25)
            v25 = 2 * v26;
          if (v26 >= 0x492492492492492)
            v27 = 0x924924924924924;
          else
            v27 = v25;
          if (v27)
            v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v14 + 2), v27);
          else
            v28 = 0;
          v34 = &v28[28 * v24];
          v35 = *(_OWORD *)v88;
          *(_OWORD *)(v34 + 12) = *(_OWORD *)&v88[12];
          *(_OWORD *)v34 = v35;
          v37 = (char *)*v14;
          v36 = (char *)v14[1];
          v38 = v34;
          if (v36 != *v14)
          {
            do
            {
              v39 = *(_OWORD *)(v36 - 28);
              *(v38 - 1) = *((_OWORD *)v36 - 1);
              *(_OWORD *)((char *)v38 - 28) = v39;
              v38 = (_OWORD *)((char *)v38 - 28);
              v36 -= 28;
            }
            while (v36 != v37);
            v36 = (char *)*v14;
          }
          v18 = v34 + 28;
          *v14 = v38;
          v14[1] = v34 + 28;
          v14[2] = &v28[28 * v27];
          if (v36)
            operator delete(v36);
        }
        else
        {
          v17 = *(_OWORD *)v88;
          *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)&v88[12];
          *v16 = v17;
          v18 = (char *)v16 + 28;
        }
        v14[1] = v18;
      }
      v7 = (__int128 *)((char *)v7 + 28);
    }
    while (v7 != v8);
  }
  insertStrings = (__int128 **)self->_insertStrings;
  v47 = *insertStrings;
  v48 = insertStrings[1];
  if (*insertStrings != v48)
  {
    do
    {
      v49 = *v47;
      *(_OWORD *)&v83[12] = *(__int128 *)((char *)v47 + 12);
      *(_OWORD *)v83 = v49;
      v84 = *((id *)v47 + 4);
      if (v84)
      {
        if (*(_DWORD *)&v83[16])
        {
          TopoReplica::objc((TopoReplica *)v83);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "renamedWithRange:replica:", *(unsigned int *)&v83[20], *(unsigned int *)&v83[24], v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = *(unsigned int *)&v83[20];
          v53 = *(unsigned int *)&v83[24];
          v78[0] = MEMORY[0x1E0C809B0];
          v78[1] = 3321888768;
          v78[2] = __50__CRTTMergeableStringUndoEditCommand_renamedWith___block_invoke_2;
          v78[3] = &unk_1E775BD80;
          v79 = v5;
          v81[0] = *(_OWORD *)v83;
          *(_OWORD *)((char *)v81 + 12) = *(_OWORD *)&v83[12];
          v82 = v84;
          v54 = v50;
          v80 = v54;
          objc_msgSend(v51, "enumerateRangesIn::", v52, v53, v78);

        }
        else
        {
          v55 = -[CRTTMergeableStringUndoEditCommand insertStrings](v5, "insertStrings");
          v56 = (unint64_t)v55[2];
          v57 = (unint64_t)v55[1];
          if (v57 >= v56)
          {
            v60 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v57 - (_QWORD)*v55) >> 3);
            v61 = v60 + 1;
            if (v60 + 1 > 0x666666666666666)
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            v62 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v56 - (_QWORD)*v55) >> 3);
            if (2 * v62 > v61)
              v61 = 2 * v62;
            if (v62 >= 0x333333333333333)
              v63 = 0x666666666666666;
            else
              v63 = v61;
            v89 = v55 + 2;
            if (v63)
            {
              v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>>((uint64_t)(v55 + 2), v63);
              v66 = v65;
            }
            else
            {
              v64 = 0;
              v66 = 0;
            }
            v67 = &v64[40 * v60];
            v68 = *(_OWORD *)v83;
            *(_OWORD *)(v67 + 12) = *(_OWORD *)&v83[12];
            *(_OWORD *)v67 = v68;
            *((_QWORD *)v67 + 4) = v84;
            v70 = *v55;
            v69 = v55[1];
            if (v69 == *v55)
            {
              v74 = v55[1];
              v71 = v67;
            }
            else
            {
              v71 = v67;
              do
              {
                v72 = *(_OWORD *)(v69 - 40);
                *(_OWORD *)(v71 - 28) = *(_OWORD *)(v69 - 28);
                *(_OWORD *)(v71 - 40) = v72;
                v73 = *((_QWORD *)v69 - 1);
                *((_QWORD *)v69 - 1) = 0;
                *((_QWORD *)v71 - 1) = v73;
                v71 -= 40;
                v69 -= 40;
              }
              while (v69 != v70);
              v74 = *v55;
              v69 = v55[1];
            }
            v59 = v67 + 40;
            *v55 = v71;
            *(_QWORD *)v88 = v74;
            *(_QWORD *)&v88[8] = v74;
            v55[1] = v59;
            *(_QWORD *)&v88[16] = v69;
            v75 = v55[2];
            v55[2] = &v64[40 * v66];
            *(_QWORD *)&v88[24] = v75;
            std::__split_buffer<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>::~__split_buffer((uint64_t)v88);
          }
          else
          {
            v58 = *(_OWORD *)v83;
            *(_OWORD *)(v57 + 12) = *(_OWORD *)&v83[12];
            *(_OWORD *)v57 = v58;
            *(_QWORD *)(v57 + 32) = v84;
            v59 = (char *)(v57 + 40);
          }
          v55[1] = v59;
        }
      }

      v47 = (__int128 *)((char *)v47 + 40);
    }
    while (v47 != v48);
  }
  -[CRTTMergeableStringUndoEditCommand retainTemporaryIDs](v5, "retainTemporaryIDs", v77);

  return v5;
}

uint64_t __50__CRTTMergeableStringUndoEditCommand_renamedWith___block_invoke(uint64_t a1, int a2, int a3, void *a4, uint64_t a5)
{
  NSUUID *v9;
  void **v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  __int128 v29;
  int v30;
  char *v31;
  __int128 v32;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (a5 < 0)
  {
    v36 = *(_OWORD *)(a1 + 40);
    LODWORD(v37) = *(_DWORD *)(a1 + 56);
    v10 = (void **)objc_msgSend(*(id *)(a1 + 32), "deleteRanges");
    v13 = (char *)v10[2];
    v12 = (char *)v10[1];
    if (v12 < v13)
    {
      *(_OWORD *)v12 = v36;
      *((_DWORD *)v12 + 4) = v37;
      *((_DWORD *)v12 + 5) = a2;
      goto LABEL_6;
    }
    v20 = 0x6DB6DB6DB6DB6DB7 * ((v12 - (_BYTE *)*v10) >> 2);
    v21 = v20 + 1;
    if ((unint64_t)(v20 + 1) > 0x924924924924924)
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    v22 = 0x6DB6DB6DB6DB6DB7 * ((v13 - (_BYTE *)*v10) >> 2);
    if (2 * v22 > v21)
      v21 = 2 * v22;
    if (v22 >= 0x492492492492492)
      v23 = 0x924924924924924;
    else
      v23 = v21;
    if (v23)
      v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v10 + 2), v23);
    else
      v24 = 0;
    v25 = &v24[28 * v20];
    v26 = &v24[28 * v23];
    v30 = v37;
    *(_OWORD *)v25 = v36;
    *((_DWORD *)v25 + 4) = v30;
    *((_DWORD *)v25 + 5) = a2;
    *((_DWORD *)v25 + 6) = a3;
    v14 = v25 + 28;
    v31 = (char *)*v10;
    v27 = (char *)v10[1];
    if (v27 != *v10)
    {
      do
      {
        v32 = *(_OWORD *)(v27 - 28);
        *((_OWORD *)v25 - 1) = *((_OWORD *)v27 - 1);
        *(_OWORD *)(v25 - 28) = v32;
        v25 -= 28;
        v27 -= 28;
      }
      while (v27 != v31);
      goto LABEL_30;
    }
  }
  else
  {
    TopoReplica::TopoReplica((TopoReplica *)&v34, v9, 0);
    HIDWORD(v35) = a5;
    v36 = v34;
    v37 = v35;
    v10 = (void **)objc_msgSend(*(id *)(a1 + 32), "deleteRanges");
    v11 = (char *)v10[2];
    v12 = (char *)v10[1];
    if (v12 < v11)
    {
      *(_OWORD *)v12 = v36;
      *((_QWORD *)v12 + 2) = v37;
LABEL_6:
      *((_DWORD *)v12 + 6) = a3;
      v14 = v12 + 28;
      goto LABEL_33;
    }
    v15 = 0x6DB6DB6DB6DB6DB7 * ((v12 - (_BYTE *)*v10) >> 2);
    v16 = v15 + 1;
    if ((unint64_t)(v15 + 1) > 0x924924924924924)
      std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
    v17 = 0x6DB6DB6DB6DB6DB7 * ((v11 - (_BYTE *)*v10) >> 2);
    if (2 * v17 > v16)
      v16 = 2 * v17;
    if (v17 >= 0x492492492492492)
      v18 = 0x924924924924924;
    else
      v18 = v16;
    if (v18)
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TopoIDRange>>((uint64_t)(v10 + 2), v18);
    else
      v19 = 0;
    v25 = &v19[28 * v15];
    v26 = &v19[28 * v18];
    *((_QWORD *)v25 + 2) = v37;
    *(_OWORD *)v25 = v36;
    *((_DWORD *)v25 + 6) = a3;
    v14 = v25 + 28;
    v28 = (char *)*v10;
    v27 = (char *)v10[1];
    if (v27 != *v10)
    {
      do
      {
        v29 = *(_OWORD *)(v27 - 28);
        *((_OWORD *)v25 - 1) = *((_OWORD *)v27 - 1);
        *(_OWORD *)(v25 - 28) = v29;
        v25 -= 28;
        v27 -= 28;
      }
      while (v27 != v28);
LABEL_30:
      v27 = (char *)*v10;
    }
  }
  *v10 = v25;
  v10[1] = v14;
  v10[2] = v26;
  if (v27)
    operator delete(v27);
LABEL_33:
  v10[1] = v14;

  return 0;
}

uint64_t __50__CRTTMergeableStringUndoEditCommand_renamedWith___block_invoke_2(id *a1, int a2, int a3, void *a4, uint64_t a5)
{
  NSUUID *v9;
  char **v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  __int128 v24;
  uint64_t v25;
  NSUUID *v26;
  unint64_t v27;
  char *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  __int128 v34;
  uint64_t v35;
  char *v36;
  char *v37;
  _QWORD v39[4];
  _QWORD *v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (a5 < 0)
  {
    objc_msgSend(a1[5], "uuid");
    v26 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    TopoReplica::TopoReplica((TopoReplica *)&v41, v26, objc_msgSend(a1[5], "index"));
    HIDWORD(v42) = a2;
    v45 = v41;
    v46 = v42;

    v10 = (char **)objc_msgSend(a1[4], "insertStrings");
    v11 = a1[10];
    v27 = (unint64_t)v10[2];
    v13 = (unint64_t)v10[1];
    if (v13 >= v27)
    {
      v29 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v13 - (_QWORD)*v10) >> 3);
      v30 = v29 + 1;
      if (v29 + 1 > 0x666666666666666)
        std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
      v31 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v27 - (_QWORD)*v10) >> 3);
      if (2 * v31 > v30)
        v30 = 2 * v31;
      if (v31 >= 0x333333333333333)
        v32 = 0x666666666666666;
      else
        v32 = v30;
      v40 = v10 + 2;
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>>((uint64_t)(v10 + 2), v32);
      v20 = &v18[40 * v29];
      *((_QWORD *)v20 + 2) = v46;
      *(_OWORD *)v20 = v45;
      *((_DWORD *)v20 + 6) = a3;
      *((_QWORD *)v20 + 4) = v11;
      v33 = *v10;
      v21 = v10[1];
      if (v21 != *v10)
      {
        v23 = &v18[40 * v29];
        do
        {
          v34 = *(_OWORD *)(v21 - 40);
          *(_OWORD *)(v23 - 28) = *(_OWORD *)(v21 - 28);
          *(_OWORD *)(v23 - 40) = v34;
          v35 = *((_QWORD *)v21 - 1);
          *((_QWORD *)v21 - 1) = 0;
          *((_QWORD *)v23 - 1) = v35;
          v23 -= 40;
          v21 -= 40;
        }
        while (v21 != v33);
        goto LABEL_24;
      }
LABEL_25:
      v36 = v21;
      v23 = v20;
      goto LABEL_26;
    }
  }
  else
  {
    TopoReplica::TopoReplica((TopoReplica *)&v43, v9, 0);
    HIDWORD(v44) = a5;
    v45 = v43;
    v46 = v44;
    v10 = (char **)objc_msgSend(a1[4], "insertStrings");
    v11 = a1[10];
    v12 = (unint64_t)v10[2];
    v13 = (unint64_t)v10[1];
    if (v13 >= v12)
    {
      v14 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v13 - (_QWORD)*v10) >> 3);
      v15 = v14 + 1;
      if (v14 + 1 > 0x666666666666666)
        std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
      v16 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - (_QWORD)*v10) >> 3);
      if (2 * v16 > v15)
        v15 = 2 * v16;
      if (v16 >= 0x333333333333333)
        v17 = 0x666666666666666;
      else
        v17 = v15;
      v40 = v10 + 2;
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>>((uint64_t)(v10 + 2), v17);
      v20 = &v18[40 * v14];
      *((_QWORD *)v20 + 2) = v46;
      *(_OWORD *)v20 = v45;
      *((_DWORD *)v20 + 6) = a3;
      *((_QWORD *)v20 + 4) = v11;
      v22 = *v10;
      v21 = v10[1];
      if (v21 != *v10)
      {
        v23 = &v18[40 * v14];
        do
        {
          v24 = *(_OWORD *)(v21 - 40);
          *(_OWORD *)(v23 - 28) = *(_OWORD *)(v21 - 28);
          *(_OWORD *)(v23 - 40) = v24;
          v25 = *((_QWORD *)v21 - 1);
          *((_QWORD *)v21 - 1) = 0;
          *((_QWORD *)v23 - 1) = v25;
          v23 -= 40;
          v21 -= 40;
        }
        while (v21 != v22);
LABEL_24:
        v36 = *v10;
        v21 = v10[1];
LABEL_26:
        v28 = v20 + 40;
        *v10 = v23;
        v39[0] = v36;
        v39[1] = v36;
        v10[1] = v20 + 40;
        v39[2] = v21;
        v37 = v10[2];
        v10[2] = &v18[40 * v19];
        v39[3] = v37;
        std::__split_buffer<std::pair<TopoIDRange,objc_object  {objcproto26CRTTMergeableStringStorage}* {__strong}>>::~__split_buffer((uint64_t)v39);
        goto LABEL_27;
      }
      goto LABEL_25;
    }
  }
  *(_OWORD *)v13 = v45;
  *(_QWORD *)(v13 + 16) = v46;
  *(_DWORD *)(v13 + 24) = a3;
  *(_QWORD *)(v13 + 32) = v11;
  v28 = (char *)(v13 + 40);
LABEL_27:
  v10[1] = v28;

  return 0;
}

- (BOOL)applyToString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend(v4, "useRenameIfAvailable");
  +[CRGlobalContextObjC objCRenames](CRGlobalContextObjC, "objCRenames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "apply:skipRetain:alwaysApply:", v5, 0, 0);
  if (-[CRTTMergeableStringUndoEditCommand hasTemporaryIDs](self, "hasTemporaryIDs"))
  {
    -[CRTTMergeableStringUndoEditCommand renamedWith:](self, "renamedWith:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_applyToString:", v4);

  }
  else
  {
    v7 = -[CRTTMergeableStringUndoEditCommand _applyToString:](self, "_applyToString:", v4);
  }

  return v7;
}

- (BOOL)_applyToString:(id)a3
{
  id v4;
  __int128 **deleteRanges;
  __int128 *v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _BOOL4 v14;
  void *__p;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "hasAllIDsIn:", self->_insertStrings))
    goto LABEL_21;
  deleteRanges = (__int128 **)self->_deleteRanges;
  if (deleteRanges[1] == *deleteRanges)
    goto LABEL_20;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  __p = 0;
  v17 = 0;
  v18 = 0;
  v6 = *deleteRanges;
  v7 = deleteRanges[1];
  if (*deleteRanges == v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    do
    {
      v9 = *((unsigned int *)v6 + 6);
      v10 = *((_QWORD *)v6 + 2);
      v22 = *v6;
      v23 = v10;
      v24 = v9;
      objc_msgSend(v4, "getSubstrings:forTopoIDRange:", &v19, &v22, __p);
      v8 += v9;
      v6 = (__int128 *)((char *)v6 + 28);
    }
    while (v6 != v7);
  }
  objc_msgSend(v4, "getCharacterRanges:forSubstrings:", &__p, &v19);
  v11 = __p;
  if (__p == v17)
  {
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v13 = __p;
    do
    {
      v12 += v13[1];
      v13 += 2;
    }
    while (v13 != v17);
  }
  if (v12 == v8)
  {
    objc_msgSend(v4, "deleteSubstrings:withCharacterRanges:", &v19, &__p);
    v11 = __p;
  }
  if (v11)
  {
    v17 = v11;
    operator delete(v11);
  }
  if (v19)
  {
    v20 = v19;
    operator delete(v19);
  }
  if (v12 == v8)
  {
LABEL_20:
    objc_msgSend(v4, "undeleteSubstrings:", self->_insertStrings, __p);
    v14 = 1;
  }
  else
  {
LABEL_21:
    v14 = 0;
  }
  objc_msgSend(v4, "coalesce", __p);
  if (v14)
    objc_msgSend(v4, "updateSubstringIndexes");

  return v14;
}

- (id)description
{
  id v3;
  unsigned int **deleteRanges;
  unsigned int *v5;
  unsigned int *v6;
  void *v7;
  void *v8;
  uint64_t *insertStrings;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<CRTTMergeableStringUndoEditCommand %p Delete:"), self);
  deleteRanges = (unsigned int **)self->_deleteRanges;
  v5 = *deleteRanges;
  v6 = deleteRanges[1];
  if (*deleteRanges != v6)
  {
    do
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v5);
      objc_msgSend(v7, "CRTTShortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%@.%d:%d-%u, "), v8, v5[4], v5[5], v5[5] + v5[6] - 1);

      v5 += 7;
    }
    while (v5 != v6);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("  Insert:"));
  insertStrings = (uint64_t *)self->_insertStrings;
  v10 = *insertStrings;
  v11 = insertStrings[1];
  if (*insertStrings != v11)
  {
    do
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v10);
      objc_msgSend(v12, "CRTTShortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("%@.%d:%d-%u=>'%@', "), v13, *(unsigned int *)(v10 + 16), *(unsigned int *)(v10 + 20), (*(_DWORD *)(v10 + 20) + *(_DWORD *)(v10 + 24) - 1), *(_QWORD *)(v10 + 32));

      v10 += 40;
    }
    while (v10 != v11);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void)deleteRanges
{
  return self->_deleteRanges;
}

- (void)insertStrings
{
  return self->_insertStrings;
}

- (CRContext)context
{
  return (CRContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
}

@end
