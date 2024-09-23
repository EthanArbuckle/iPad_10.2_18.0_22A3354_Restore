@implementation ZN2re11TraceServer4sendENSt3

re *___ZN2re11TraceServer4sendENSt3__110unique_ptrINS_10TraceDeltaENS_9REDeleterIS3_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *specific;
  _QWORD *v5;
  const re::TraceDelta *v6;
  unsigned __int8 *v7;
  int v8;
  uint64_t v9;
  unint64_t **v10;
  const re::TraceDelta *v11;
  const re::TraceDelta *v12;
  uint64_t v13;
  NSObject ***v14;
  uint64_t v15;
  NSObject **v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE **v22;
  uint64_t v23;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (!specific)
    return re::internal::destroyPersistent<re::TraceDelta>((re *)"operator()", 274, v2);
  v5 = specific;
  if (!(*(uint64_t (**)(_QWORD *))(*specific + 72))(specific) && !*(_BYTE *)(v3 + 153))
    return re::internal::destroyPersistent<re::TraceDelta>((re *)"operator()", 274, v2);
  v7 = *(unsigned __int8 **)(a1 + 40);
  v8 = *v7;
  if (!*v7 || !*((_QWORD *)v7 + 4))
    return re::internal::destroyPersistent<re::TraceDelta>((re *)"operator()", 274, v2);
  if (v8 == 3)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = (unint64_t **)(v5 + 4);
    *((_OWORD *)v5 + 2) = *(_OWORD *)v9;
    re::DynamicArray<re::TraceEntry>::operator=((uint64_t)(v5 + 6), (uint64_t *)(v9 + 16));
    atomic_store(1u, (unsigned __int8 *)v5 + 152);
LABEL_12:
    goto LABEL_13;
  }
  if (v8 != 4)
  {
    if (!(*(uint64_t (**)(_QWORD *))(*v5 + 72))(v5) && *(_BYTE *)(v3 + 153))
    {
      re::DynamicArray<re::TraceDelta>::add(v3 + 160, *(_QWORD *)(a1 + 40));
      goto LABEL_13;
    }
    v10 = (unint64_t **)(v5 + 4);
    re::TraceDelta::merge((re::TraceDelta *)(v5 + 4), *(const re::TraceDelta **)(a1 + 40));
    goto LABEL_12;
  }
  *((_OWORD *)v5 + 6) = *(_OWORD *)v7;
  re::DynamicArray<re::TraceEntry>::operator=((uint64_t)(v5 + 14), (uint64_t *)v7 + 2);
  atomic_store(1u, (unsigned __int8 *)v5 + 88);
LABEL_13:
  v12 = *(const re::TraceDelta **)(a1 + 40);
  v13 = v5[27];
  if (v13)
  {
    v14 = (NSObject ***)v5[29];
    v15 = 8 * v13;
    do
    {
      v16 = *v14;
      if (((_BYTE)(*v14)[19] & 1) != 0)
      {
        re::TraceServer::trySendInitialDeltas((re::TraceServer *)v5, *v14);
        if (!*((_BYTE *)v16 + 128) && *((double *)v12 + 1) > *((double *)v16 + 18))
        {
          if (*((int *)v16 + 33) < 1)
          {
            re::TraceServer::send((re::TraceServer *)v5, v12, *v16);
            v16[18] = *((_QWORD *)v12 + 1);
          }
          else
          {
            re::TraceDelta::merge((re::TraceDelta *)(v16 + 1), v12);
          }
        }
      }
      ++v14;
      v15 -= 8;
    }
    while (v15);
  }
  v17 = (_QWORD *)v5[3];
  v18 = v17[4];
  if (v18)
  {
    v19 = (_QWORD *)v17[6];
    v20 = 8 * v18;
    do
    {
      if (!*(_BYTE *)(*v19 + 8))
        (*(void (**)(_QWORD, const re::TraceDelta *))(*(_QWORD *)*v19 + 16))(*v19, v12);
      ++v19;
      v20 -= 8;
    }
    while (v20);
    v21 = v17[4];
    if (v21)
    {
      v22 = (_BYTE **)v17[6];
      v23 = 8 * v21;
      do
      {
        if ((*v22)[8])
          re::TraceDirectServer::trySendInitialDeltas(v17, *v22);
        ++v22;
        v23 -= 8;
      }
      while (v23);
    }
  }
  return re::internal::destroyPersistent<re::TraceDelta>((re *)"operator()", 274, v2);
}

re *___ZN2re11TraceServer4sendENSt3__110unique_ptrINS_14TransferReportENS_9REDeleterIS3_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *specific;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _anonymous_namespace_ *v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  _BYTE v18[44];

  v2 = *(_QWORD *)(a1 + 32);
  if (specific)
  {
    v4 = specific;
    v5 = specific[27];
    if (v5)
    {
      v6 = (uint64_t *)specific[29];
      v7 = 8 * v5;
      do
      {
        v8 = *v6;
        if ((*(_BYTE *)(*v6 + 152) & 2) != 0)
        {
          if (*(int *)(v8 + 136) < 1)
          {
            if (*(_DWORD *)(v8 + 108))
            {
              re::TransferReport::aggregate((double *)(v8 + 64), *(_QWORD *)(a1 + 32));
              re::TraceServer::send(v4, v8 + 64, *(NSObject **)v8);
              memset(v18, 0, 36);
              *(_QWORD *)&v18[36] = 0x7FFFFFFFLL;
              *(_OWORD *)(v8 + 64) = 0u;
              v10 = (_QWORD *)(v8 + 80);
              if ((_BYTE *)(v8 + 80) != v18)
              {
                v11 = *(_QWORD *)v18;
                if (*v10)
                  v12 = *v10 == *(_QWORD *)v18;
                else
                  v12 = 1;
                if (v12)
                {
                  *(_QWORD *)v18 = *v10;
                  v13 = *(_QWORD *)&v18[8];
                  v14 = *(_QWORD *)&v18[16];
                  v15 = *(_OWORD *)(v8 + 88);
                  *(_QWORD *)(v8 + 80) = v11;
                  *(_QWORD *)(v8 + 88) = v13;
                  *(_QWORD *)(v8 + 96) = v14;
                  *(_OWORD *)&v18[8] = v15;
                  v16 = *(_OWORD *)(v8 + 104);
                  *(_OWORD *)(v8 + 104) = *(_OWORD *)&v18[24];
                  *(_OWORD *)&v18[24] = v16;
                }
                else if (*(_QWORD *)v18)
                {
                  re::HashTable<unsigned long,re::SessionTransferReport,re::Hash<unsigned long>,re::EqualTo<unsigned long>,true,false>::copy((uint64_t)v10, (uint64_t)v18);
                  ++*(_DWORD *)(v8 + 120);
                }
                else
                {
                  re::HashTable<unsigned long,re::SessionTransferReport,re::Hash<unsigned long>,re::EqualTo<unsigned long>,true,false>::clear((uint64_t)v10);
                }
              }
              re::HashTable<unsigned long,re::SessionTransferReport,re::Hash<unsigned long>,re::EqualTo<unsigned long>,true,false>::deinit((uint64_t *)v18);
            }
            else
            {
              re::TraceServer::send(v4, *(_QWORD *)(a1 + 32), *(NSObject **)v8);
            }
          }
          else
          {
            re::TransferReport::aggregate((double *)(v8 + 64), *(_QWORD *)(a1 + 32));
          }
        }
        ++v6;
        v7 -= 8;
      }
      while (v7);
    }
  }
  return re::internal::destroyPersistent<re::TransferReport>((re *)"operator()", 356, v2);
}

@end
