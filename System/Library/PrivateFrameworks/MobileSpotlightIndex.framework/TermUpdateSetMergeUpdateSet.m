@implementation TermUpdateSetMergeUpdateSet

void __TermUpdateSetMergeUpdateSet_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  pthread_key_t v7;
  _QWORD *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  int v20;
  unsigned int v21;
  int v22;
  char *v23;
  char *v24;
  const char *v25;

  if (a2)
  {
    v4 = TermTrieResolve(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16);
    if ((*(_BYTE *)(a2 + 16) & 1) != 0)
    {
      v21 = *(_DWORD *)(a2 + 20);
      if (v21 == 2)
        v22 = 1;
      else
        v22 = 2;
      pushTermData(*(_QWORD *)(a1 + 32), (int *)v4, *(_QWORD *)(a2 + 24), *(_DWORD *)(a1 + 60), 0, v22, v21);
    }
    else
    {
      v5 = *(_QWORD **)(a1 + 32);
      if (!*(_DWORD *)(a2 + 28))
      {
        v14 = *(unsigned int *)(a1 + 56);
        v15 = *(_DWORD *)(a2 + 20);
        if ((*(_BYTE *)v4 & 1) != 0)
        {
          if (*(_QWORD *)(v4 + 8) == v14)
            return;
        }
        else
        {
          v20 = *(_DWORD *)(v4 + 8);
          if (v20 == (_DWORD)v14)
            return;
          if (!v20)
          {
            *(_DWORD *)(v4 + 4) = v15;
            *(_DWORD *)(v4 + 8) = v14;
            return;
          }
        }
        addToExistingTermUpdateList((uint64_t)v5, (unsigned int *)v4, v14, 0, v15);
        return;
      }
      v6 = *(unsigned int *)(a1 + 56);
      v5[73] = v5[1] + v6;
      v7 = *(_QWORD *)(a1 + 104);
      v8 = (_QWORD *)(*(_QWORD *)(a1 + 96) + 240);
      v9 = *(unsigned int *)(a2 + 28);
      v10 = *(_DWORD *)(a2 + 20);
      v11 = (uint64_t)(v5 + 30);
      v16 = v5[30] + 32 * *(unsigned int *)(v4 + 12);
      addToExistingTermUpdateList((uint64_t)v5, (unsigned int *)v4, v6, 0, v10);
      if (*(_DWORD *)(v16 + 8))
      {
        if (*(_DWORD *)(v16 + 24) >= v6)
        {
          v23 = __si_assert_copy_extra_268();
          v24 = v23;
          v25 = "";
          if (v23)
            v25 = v23;
          __message_assert("%s:%u: failed assertion '%s' %s ", "TermUpdateSet.c", 3338, "docID > node->docId", v25);
          free(v24);
          if (__valid_fs(-1))
          {
            MEMORY[0xBAD] = -559038737;
            abort();
          }
          MEMORY[0xC00] = -559038737;
          abort();
        }
        CIPositionNodeFinalizeDocument(v11);
      }
      pthread_getspecific(v7);
      if (*(_DWORD *)(*v8 + 32 * v9 + 8) < 2u)
      {
        CIPositionNodeTransferDocument(v11);
      }
      else
      {
        v17 = (uint64_t *)pthread_getspecific(v7);
        if (!v17)
        {
          v17 = (uint64_t *)malloc_type_calloc(1uLL, 0x4008uLL, 0x10200409D758B34uLL);
          pthread_setspecific(v7, v17);
        }
        v18 = *v17;
        v19 = &v17[*v17];
        v19[1] = *v8 + 32 * v9;
        v19[1025] = v16;
        *v17 = v18 + 1;
        if (v18 == 1023)
        {
          CIPositionNodeTransferDocuments(v11);
          *v17 = 0;
        }
      }
    }
  }
  else
  {
    v12 = pthread_getspecific(*(_QWORD *)(a1 + 104));
    if (v12)
    {
      v13 = v12;
      CIPositionNodeTransferDocuments(*(_QWORD *)(a1 + 32) + 240);
      pthread_setspecific(*(_QWORD *)(a1 + 104), 0);
      free(v13);
    }
  }
}

@end
