@implementation GEOTileRequestBalancer

- (void)requester:(void *)a3 removeTileKey:(__int128 *)a4
{
  _anonymous_namespace_ *v6;
  NSObject *v7;
  _anonymous_namespace_ *v8;
  _QWORD block[5];
  _anonymous_namespace_ *v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = *a4;
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__GEOTileRequestBalancer_requester_removeTileKey___block_invoke;
  block[3] = &unk_1E1C001A0;
  block[4] = a1;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)requester:(id)a3 completedOperations:(unint64_t)a4
{
  _anonymous_namespace_ *v6;
  NSObject *v7;
  _anonymous_namespace_ *v8;
  _QWORD block[5];
  _anonymous_namespace_ *v10;
  unint64_t v11;

  v6 = (_anonymous_namespace_ *)a3;
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__GEOTileRequestBalancer_requester_completedOperations___block_invoke;
  block[3] = &unk_1E1C0F588;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __50__GEOTileRequestBalancer_requester_removeTileKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requester:removeTileKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __56__GEOTileRequestBalancer_requester_completedOperations___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_requester:incrementRunningOperationsCount:", *(_QWORD *)(a1 + 40), -*(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_startOperations");
}

- (void)_requester:(void *)a3 removeTileKey:(uint64_t)a4
{
  id v6;
  uint64_t v7;
  id *i;
  id WeakRetained;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v10[0] = a4;
  v10[1] = a5;
  v6 = a3;
  v7 = objc_msgSend(a1, "requesters");
  for (i = *(id **)v7; i != *(id **)(v7 + 8); i += 3)
  {
    WeakRetained = objc_loadWeakRetained(i);

    if (WeakRetained == v6)
    {
      objc_msgSend(i[1], "removeKey:", v10);
      break;
    }
  }

}

- (void)_startOperations
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t maxRunningOperationsCount;

  v3 = -[GEOTileRequestBalancer requesters](self, "requesters");
  -[GEOTileRequestBalancer _pruneEmptyRequesters](self, "_pruneEmptyRequesters");
  v4 = *v3;
  v5 = v3[1];
  if (*v3 == v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      v6 += *(_QWORD *)(v4 + 16);
      v4 += 24;
    }
    while (v4 != v5);
  }
  maxRunningOperationsCount = self->_maxRunningOperationsCount;
  if (maxRunningOperationsCount > v6)
    -[GEOTileRequestBalancer _startOperationsWithAvailableCount:](self, "_startOperationsWithAvailableCount:", maxRunningOperationsCount - v6);
}

- (void)_pruneEmptyRequesters
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t i;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v2 = -[GEOTileRequestBalancer requesters](self, "requesters");
  v3 = *v2;
  v4 = v2[1];
  if (*v2 != v4)
  {
    while (1)
    {
      WeakRetained = objc_loadWeakRetained((id *)v3);

      if (!WeakRetained)
        break;
      v3 += 24;
      if (v3 == v4)
      {
        v3 = v4;
        goto LABEL_5;
      }
    }
    if (v3 != v4)
    {
      for (i = v3 + 24; i != v4; i += 24)
      {
        v7 = objc_loadWeakRetained((id *)i);

        if (v7)
        {
          v8 = objc_loadWeakRetained((id *)i);
          objc_storeWeak((id *)v3, v8);

          v9 = *(_QWORD *)(i + 8);
          *(_QWORD *)(i + 8) = 0;
          v10 = *(void **)(v3 + 8);
          *(_QWORD *)(v3 + 8) = v9;

          *(_QWORD *)(v3 + 16) = *(_QWORD *)(i + 16);
          v3 += 24;
        }
      }
    }
  }
LABEL_5:
}

- (void)_startOperationsWithAvailableCount:(unint64_t)a3
{
  _QWORD *v3;
  id *v4;
  unsigned int v5;
  id WeakRetained;
  unsigned int v7;
  unint64_t v8;
  __wrap_iter<(anonymous namespace)::RequesterTileKeys *> v9;
  id *var0;
  unsigned int v11;
  unint64_t maxRunningOperationsCount;
  unsigned int v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint8x8_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t ***v21;
  uint64_t **i;
  unint64_t v23;
  GEOTileKeyList *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint8x8_t v28;
  unint64_t v29;
  uint64_t ***v30;
  uint64_t **j;
  unint64_t v32;
  _QWORD *v33;
  float v34;
  _BOOL8 v35;
  unint64_t v36;
  unint64_t v37;
  size_t v38;
  uint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint8x8_t v45;
  unint64_t v46;
  void **v47;
  void *k;
  unint64_t v49;
  float v50;
  _BOOL8 v51;
  unint64_t v52;
  unint64_t v53;
  size_t v54;
  uint64_t v55;
  _QWORD *v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  void *v73;
  uint64_t **v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  NSObject *v80;
  id *v81;
  id *v82;
  _QWORD *v84;
  id v85;
  uint64_t v86;
  unint64_t v87;
  _QWORD v89[4];
  uint64_t *v90;
  GEOTileRequestBalancer *v91;
  uint64_t v92;
  _OWORD v93[2];
  int v94;
  __int128 v95;
  __int128 v96;
  float v97;
  char *v98;
  char *v99;
  char *v100;
  _BYTE *v101;
  _BYTE buf[22];
  uint64_t v103;
  uint64_t v104;
  int v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v3 = -[GEOTileRequestBalancer requesters](self, "requesters");
  v4 = (id *)*v3;
  if (*v3 == v3[1])
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    do
    {
      WeakRetained = objc_loadWeakRetained(v4);
      v7 = objc_msgSend(WeakRetained, "highestRunningOperationPriority");
      if (v5 <= v7)
        v5 = v7;

      v4 += 3;
    }
    while (v4 != (id *)v3[1]);
  }
  v98 = 0;
  v99 = 0;
  v100 = 0;
  v95 = 0u;
  v96 = 0u;
  v97 = 1.0;
  memset(v93, 0, sizeof(v93));
  v94 = 1065353216;
  if (a3)
  {
    v86 = 0;
    v84 = v3;
    v8 = a3;
    while (1)
    {
      v9.var0 = (RequesterTileKeys *)-[GEOTileRequestBalancer _next_requester](self, "_next_requester");
      var0 = (id *)v9.var0;
      if ((RequesterTileKeys *)v3[1] == v9.var0)
      {
LABEL_150:
        v74 = (uint64_t **)v96;
        if ((_QWORD)v96)
        {
          v75 = MEMORY[0x1E0C809B0];
          do
          {
            v76 = v74[3];
            *(_QWORD *)buf = v74 + 2;
            v77 = *((_QWORD *)std::__hash_table<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::__unordered_map_hasher<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>>>::__emplace_unique_key_args<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::piecewise_construct_t const&,std::tuple<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc> const&>,std::tuple<>>((float *)v93, (uint64_t)(v74 + 2), (uint64_t *)buf)+ 5);
            v78 = (uint64_t)v74[5];
            v89[0] = v75;
            v89[1] = 3221225472;
            v89[2] = __61__GEOTileRequestBalancer__startOperationsWithAvailableCount___block_invoke;
            v89[3] = &unk_1E1C119A8;
            v92 = v77;
            v79 = v76;
            v90 = v79;
            v91 = self;
            objc_msgSend(v79, "createAndStartOperationsForTileKeys:completion:", v78, v89);

            v74 = (uint64_t **)*v74;
          }
          while (v74);
        }
        if (v86)
        {
          GEOGetTileLoadingLog();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v86;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = a3;
            _os_log_impl(&dword_1885A9000, v80, OS_LOG_TYPE_DEBUG, "Balancer started %llu operations for available count = %llu", buf, 0x16u);
          }

        }
        break;
      }
      v11 = objc_msgSend(*((id *)v9.var0 + 1), "highestPriority");
      maxRunningOperationsCount = self->_maxRunningOperationsCount;
      if (maxRunningOperationsCount)
      {
        if (maxRunningOperationsCount < 0x1F)
        {
          if (v11 > 0x7FFFFFFD)
          {
LABEL_17:
            maxRunningOperationsCount = 0;
            goto LABEL_23;
          }
          if (--maxRunningOperationsCount >= self->_maxRunningOperationsCount / 3u)
            maxRunningOperationsCount = self->_maxRunningOperationsCount / 3u;
        }
        else
        {
          if (v11 > 0x7FFFFFFD)
            goto LABEL_17;
          if (v11 >> 30)
          {
            maxRunningOperationsCount = 8;
          }
          else
          {
            maxRunningOperationsCount -= 10;
            if (v5 <= 0x7FFFFFFE)
              maxRunningOperationsCount = 16;
          }
        }
      }
LABEL_23:
      if (v8 <= maxRunningOperationsCount)
        goto LABEL_150;
      v87 = v8;
      v85 = objc_loadWeakRetained(var0);
      v105 = 0;
      v103 = 0;
      v104 = 0;
      if (objc_msgSend(var0[1], "popHighestPriorityKey:priority:", &v103, &v105))
      {
        v13 = v105;
      }
      else
      {
        v103 = -1;
        v104 = -1;
        v13 = -1;
        v105 = -1;
      }
      if (v5 <= v13)
        v5 = v13;
      v14 = v85;
      *(_QWORD *)buf = &off_1E1BF6460;
      *(_QWORD *)&buf[8] = v14;
      v15 = objc_msgSend(v14, "hash");
      v16 = *((_QWORD *)&v95 + 1);
      if (*((_QWORD *)&v95 + 1))
      {
        v17 = v15;
        v18 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v95 + 8));
        v18.i16[0] = vaddlv_u8(v18);
        v19 = v18.u32[0];
        if (v18.u32[0] > 1uLL)
        {
          v20 = v15;
          if (v15 >= *((_QWORD *)&v95 + 1))
            v20 = v15 % *((_QWORD *)&v95 + 1);
        }
        else
        {
          v20 = (*((_QWORD *)&v95 + 1) - 1) & v15;
        }
        v21 = *(uint64_t ****)(v95 + 8 * v20);
        if (v21)
        {
          for (i = *v21; i; i = (uint64_t **)*i)
          {
            v23 = (unint64_t)i[1];
            if (v23 == v17)
            {
              if ((geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(i[3], (uint64_t)buf) & 1) != 0)goto LABEL_84;
            }
            else
            {
              if (v19 > 1)
              {
                if (v23 >= v16)
                  v23 %= v16;
              }
              else
              {
                v23 &= v16 - 1;
              }
              if (v23 != v20)
                break;
            }
          }
        }
      }
      v24 = objc_alloc_init(GEOTileKeyList);
      v25 = objc_msgSend(*(id *)&buf[8], "hash");
      v26 = v25;
      v27 = *((_QWORD *)&v95 + 1);
      if (*((_QWORD *)&v95 + 1))
      {
        v28 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v95 + 8));
        v28.i16[0] = vaddlv_u8(v28);
        v29 = v28.u32[0];
        if (v28.u32[0] > 1uLL)
        {
          v16 = v25;
          if (v25 >= *((_QWORD *)&v95 + 1))
            v16 = v25 % *((_QWORD *)&v95 + 1);
        }
        else
        {
          v16 = (*((_QWORD *)&v95 + 1) - 1) & v25;
        }
        v30 = *(uint64_t ****)(v95 + 8 * v16);
        if (v30)
        {
          for (j = *v30; j; j = (uint64_t **)*j)
          {
            v32 = (unint64_t)j[1];
            if (v32 == v26)
            {
              if ((geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(j[3], (uint64_t)buf) & 1) != 0)goto LABEL_83;
            }
            else
            {
              if (v29 > 1)
              {
                if (v32 >= v27)
                  v32 %= v27;
              }
              else
              {
                v32 &= v27 - 1;
              }
              if (v32 != v16)
                break;
            }
          }
        }
      }
      v33 = operator new(0x30uLL);
      *v33 = 0;
      v33[1] = v26;
      geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr(v33 + 2, (uint64_t)buf);
      v33[5] = v24;
      v34 = (float)(unint64_t)(*((_QWORD *)&v96 + 1) + 1);
      if (!v27 || (float)(v97 * (float)v27) < v34)
      {
        v35 = (v27 & (v27 - 1)) != 0;
        if (v27 < 3)
          v35 = 1;
        v36 = v35 | (2 * v27);
        v37 = vcvtps_u32_f32(v34 / v97);
        if (v36 <= v37)
          v38 = v37;
        else
          v38 = v36;
        std::__hash_table<google::protobuf::Descriptor const*,std::hash<google::protobuf::Descriptor const*>,std::equal_to<google::protobuf::Descriptor const*>,std::allocator<google::protobuf::Descriptor const*>>::__rehash<true>((uint64_t)&v95, v38);
        v27 = *((_QWORD *)&v95 + 1);
        if ((*((_QWORD *)&v95 + 1) & (*((_QWORD *)&v95 + 1) - 1)) != 0)
        {
          if (v26 >= *((_QWORD *)&v95 + 1))
            v16 = v26 % *((_QWORD *)&v95 + 1);
          else
            v16 = v26;
        }
        else
        {
          v16 = (*((_QWORD *)&v95 + 1) - 1) & v26;
        }
      }
      v39 = v95;
      v40 = *(_QWORD **)(v95 + 8 * v16);
      if (v40)
      {
        *v33 = *v40;
      }
      else
      {
        *v33 = v96;
        *(_QWORD *)&v96 = v33;
        *(_QWORD *)(v39 + 8 * v16) = &v96;
        if (!*v33)
          goto LABEL_82;
        v41 = *(_QWORD *)(*v33 + 8);
        if ((v27 & (v27 - 1)) != 0)
        {
          if (v41 >= v27)
            v41 %= v27;
        }
        else
        {
          v41 &= v27 - 1;
        }
        v40 = (_QWORD *)(v95 + 8 * v41);
      }
      *v40 = v33;
LABEL_82:
      v24 = 0;
      ++*((_QWORD *)&v96 + 1);
LABEL_83:

LABEL_84:
      v42 = objc_msgSend(*(id *)&buf[8], "hash");
      v43 = v42;
      v44 = *((_QWORD *)&v95 + 1);
      if (*((_QWORD *)&v95 + 1))
      {
        v45 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v95 + 8));
        v45.i16[0] = vaddlv_u8(v45);
        v46 = v45.u32[0];
        if (v45.u32[0] > 1uLL)
        {
          v16 = v42;
          if (v42 >= *((_QWORD *)&v95 + 1))
            v16 = v42 % *((_QWORD *)&v95 + 1);
        }
        else
        {
          v16 = (*((_QWORD *)&v95 + 1) - 1) & v42;
        }
        v47 = *(void ***)(v95 + 8 * v16);
        if (v47)
        {
          for (k = *v47; k; k = *(void **)k)
          {
            v49 = *((_QWORD *)k + 1);
            if (v49 == v43)
            {
              if ((geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*((void **)k + 3), (uint64_t)buf) & 1) != 0)goto LABEL_122;
            }
            else
            {
              if (v46 > 1)
              {
                if (v49 >= v44)
                  v49 %= v44;
              }
              else
              {
                v49 &= v44 - 1;
              }
              if (v49 != v16)
                break;
            }
          }
        }
      }
      k = operator new(0x30uLL);
      *(_QWORD *)k = 0;
      *((_QWORD *)k + 1) = v43;
      geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::_retain_ptr((_QWORD *)k + 2, (uint64_t)buf);
      *((_QWORD *)k + 5) = 0;
      v50 = (float)(unint64_t)(*((_QWORD *)&v96 + 1) + 1);
      if (!v44 || (float)(v97 * (float)v44) < v50)
      {
        v51 = (v44 & (v44 - 1)) != 0;
        if (v44 < 3)
          v51 = 1;
        v52 = v51 | (2 * v44);
        v53 = vcvtps_u32_f32(v50 / v97);
        if (v52 <= v53)
          v54 = v53;
        else
          v54 = v52;
        std::__hash_table<google::protobuf::Descriptor const*,std::hash<google::protobuf::Descriptor const*>,std::equal_to<google::protobuf::Descriptor const*>,std::allocator<google::protobuf::Descriptor const*>>::__rehash<true>((uint64_t)&v95, v54);
        v44 = *((_QWORD *)&v95 + 1);
        if ((*((_QWORD *)&v95 + 1) & (*((_QWORD *)&v95 + 1) - 1)) != 0)
        {
          if (v43 >= *((_QWORD *)&v95 + 1))
            v16 = v43 % *((_QWORD *)&v95 + 1);
          else
            v16 = v43;
        }
        else
        {
          v16 = (*((_QWORD *)&v95 + 1) - 1) & v43;
        }
      }
      v55 = v95;
      v56 = *(_QWORD **)(v95 + 8 * v16);
      if (v56)
      {
        *(_QWORD *)k = *v56;
LABEL_120:
        *v56 = k;
        goto LABEL_121;
      }
      *(_QWORD *)k = v96;
      *(_QWORD *)&v96 = k;
      *(_QWORD *)(v55 + 8 * v16) = &v96;
      if (*(_QWORD *)k)
      {
        v57 = *(_QWORD *)(*(_QWORD *)k + 8);
        if ((v44 & (v44 - 1)) != 0)
        {
          if (v57 >= v44)
            v57 %= v44;
        }
        else
        {
          v57 &= v44 - 1;
        }
        v56 = (_QWORD *)(v95 + 8 * v57);
        goto LABEL_120;
      }
LABEL_121:
      ++*((_QWORD *)&v96 + 1);
LABEL_122:
      objc_msgSend(*((id *)k + 5), "addKey:", &v103);
      v58 = objc_msgSend(v14, "estimatedNumberOfOperationsForTileKey:", v103, v104);
      v59 = v58;
      if (v87 >= v58)
        v8 = v87 - v58;
      else
        v8 = 0;
      v101 = buf;
      v60 = std::__hash_table<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::__unordered_map_hasher<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>>>::__emplace_unique_key_args<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::piecewise_construct_t const&,std::tuple<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc> const&>,std::tuple<>>((float *)v93, (uint64_t)buf, (uint64_t *)&v101);
      v60[5] += v59;
      -[GEOTileRequestBalancer _requester:incrementRunningOperationsCount:](self, "_requester:incrementRunningOperationsCount:", v14, v59);
      if (objc_msgSend(var0[1], "count"))
        goto LABEL_145;
      v61 = v99;
      if (v99 >= v100)
      {
        v63 = (v99 - v98) >> 3;
        if ((unint64_t)(v63 + 1) >> 61)
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        v64 = (v100 - v98) >> 2;
        if (v64 <= v63 + 1)
          v64 = v63 + 1;
        if ((unint64_t)(v100 - v98) >= 0x7FFFFFFFFFFFFFF8)
          v65 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v65 = v64;
        if (v65)
        {
          if (v65 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v66 = (char *)operator new(8 * v65);
        }
        else
        {
          v66 = 0;
        }
        v67 = &v66[8 * v63];
        v68 = &v66[8 * v65];
        *(_QWORD *)v67 = v14;
        v62 = v67 + 8;
        v69 = v98;
        v70 = v99;
        if (v99 == v98)
        {
          v98 = v67;
          v99 = v67 + 8;
          v100 = v68;
        }
        else
        {
          do
          {
            v71 = *((_QWORD *)v70 - 1);
            v70 -= 8;
            *(_QWORD *)v70 = 0;
            *((_QWORD *)v67 - 1) = v71;
            v67 -= 8;
          }
          while (v70 != v69);
          v70 = v98;
          v72 = v99;
          v98 = v67;
          v99 = v62;
          v100 = v68;
          if (v72 != v70)
          {
            do
            {
              v73 = (void *)*((_QWORD *)v72 - 1);
              v72 -= 8;

            }
            while (v72 != v70);
            if (!v70)
              goto LABEL_144;
LABEL_143:
            operator delete(v70);
            goto LABEL_144;
          }
        }
        if (!v70)
          goto LABEL_144;
        goto LABEL_143;
      }
      *(_QWORD *)v61 = v14;
      v62 = v61 + 8;
LABEL_144:
      v99 = v62;
LABEL_145:
      *(_QWORD *)buf = &off_1E1BF6460;

      v86 += v59;
      v3 = v84;
      if (v87 <= v59)
        goto LABEL_150;
    }
  }
  v81 = (id *)v98;
  v82 = (id *)v99;
  while (v81 != v82)
    objc_msgSend(*v81++, "didStartOperationsForAllTileKeys");
  std::__hash_table<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::__unordered_map_hasher<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,unsigned long>>>::~__hash_table((uint64_t)v93);
  std::__hash_table<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,GEOTileKeyList * {__strong}>,std::__unordered_map_hasher<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,GEOTileKeyList * {__strong}>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::__unordered_map_equal<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,GEOTileKeyList * {__strong}>,std::equal_to<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,std::hash<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>,true>,std::allocator<std::__hash_value_type<geo::_retain_ptr<GEOSimpleTileRequester * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,GEOTileKeyList * {__strong}>>>::~__hash_table((uint64_t)&v95);
  *(_QWORD *)&v95 = &v98;
  std::vector<GEORoadEdge * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v95);
}

- (__wrap_iter<(anonymous)_next_requester
{
  char **v3;
  __wrap_iter<(anonymous namespace)::RequesterTileKeys *> v4;
  char *v5;
  RequesterTileKeys **v6;
  char *i;
  unsigned int v8;
  int v9;
  int v10;
  RequesterTileKeys **v11;
  RequesterTileKeys **v12;
  RequesterTileKeys **v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  RequesterTileKeys **v18;
  RequesterTileKeys **v19;
  RequesterTileKeys *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _BYTE v27[64];

  v3 = -[GEOTileRequestBalancer requesters](self, "requesters");
  v4.var0 = (RequesterTileKeys *)*v3;
  v5 = v3[1];
  if (*v3 != v5)
  {
    v6 = (RequesterTileKeys **)v3;
    for (i = (char *)v4.var0 + 24; i != v5; i += 24)
    {
      v8 = objc_msgSend(*((id *)v4.var0 + 1), "highestPriority");
      if (v8 < objc_msgSend(*((id *)i + 1), "highestPriority"))
        v4.var0 = (RequesterTileKeys *)i;
    }
    v9 = objc_msgSend(*((id *)v4.var0 + 1), "highestPriority");
    v4.var0 = *v6;
    if (*v6 != v6[1])
    {
      v10 = v9;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      do
      {
        if (objc_msgSend(*((id *)v4.var0 + 1), "highestPriority") == v10
          && objc_msgSend(*((id *)v4.var0 + 1), "count"))
        {
          if (v13 >= v12)
          {
            v14 = v13 - v11;
            v15 = v14 + 1;
            if ((unint64_t)(v14 + 1) >> 61)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            if (((char *)v12 - (char *)v11) >> 2 > v15)
              v15 = ((char *)v12 - (char *)v11) >> 2;
            if ((unint64_t)((char *)v12 - (char *)v11) >= 0x7FFFFFFFFFFFFFF8)
              v16 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v16 = v15;
            if (v16)
            {
              if (v16 >> 61)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v17 = (char *)operator new(8 * v16);
            }
            else
            {
              v17 = 0;
            }
            v18 = (RequesterTileKeys **)&v17[8 * v14];
            *v18 = v4.var0;
            v19 = v18 + 1;
            while (v13 != v11)
            {
              v20 = *--v13;
              *--v18 = v20;
            }
            v12 = (RequesterTileKeys **)&v17[8 * v16];
            if (v11)
              operator delete(v11);
            v11 = v18;
            v13 = v19;
          }
          else
          {
            *v13++ = v4.var0;
          }
        }
        v4.var0 = (RequesterTileKeys *)((char *)v4.var0 + 24);
      }
      while (v4.var0 != v6[1]);
      if (v11 == v13)
      {
        if (!v11)
          return v4;
      }
      else
      {
        v21 = (char *)v13 - (char *)v11;
        if ((char *)v13 - (char *)v11 == 8)
        {
          v22 = 0;
        }
        else
        {
          v23 = v21 >> 3;
          v24 = __clz(v21 >> 3);
          v25 = 63;
          if (((v23 << v24) & 0x7FFFFFFFFFFFFFFFLL) != 0)
            v25 = 64;
          std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine((uint64_t)v27, (uint64_t)self->_randomIndexGenerator, v25 - v24);
          do
            v22 = std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long long>::__eval((uint64_t)v27);
          while (v22 >= v23);
        }
        v4.var0 = v11[v22];
      }
      operator delete(v11);
    }
  }
  return v4;
}

- (void)requesters
{
  return self->_requesters;
}

- (void)_requester:(id)a3 incrementRunningOperationsCount:(int64_t)a4
{
  id v6;
  uint64_t *v7;
  uint64_t i;
  id WeakRetained;
  uint64_t v10;
  int64_t v11;
  NSObject *v12;
  id v13;
  int v14;
  int64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[GEOTileRequestBalancer requesters](self, "requesters");
  for (i = *v7; i != v7[1]; i += 24)
  {
    WeakRetained = objc_loadWeakRetained((id *)i);

    if (WeakRetained == v6)
    {
      v10 = *(_QWORD *)(i + 16);
      v11 = (v10 + a4) & ~((v10 + a4) >> 63);
      if (v10 != v11)
      {
        GEOGetTileLoadingLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v13 = objc_loadWeakRetained((id *)i);
          v14 = 134218240;
          v15 = v11;
          v16 = 2048;
          v17 = v13;
          _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_DEBUG, "Balancer is setting running operations count to %zu for requester %p.", (uint8_t *)&v14, 0x16u);

        }
        *(_QWORD *)(i + 16) = v11;
      }
      break;
    }
  }

}

void __61__GEOTileRequestBalancer__startOperationsWithAvailableCount___block_invoke(int8x16_t *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _anonymous_namespace_ *v8;
  NSObject *v9;
  id v10;
  int8x16_t v11;
  _QWORD block[4];
  int8x16_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1[3].i64[0] != a2)
  {
    GEOGetTileLoadingLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = a1[3].i64[0];
      v6 = a1[2].i64[0];
      *(_DWORD *)buf = 134218496;
      v16 = v5;
      v17 = 2048;
      v18 = a2;
      v19 = 2048;
      v20 = v6;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_INFO, "Balancer expected to start %llu operations but actually started %llu for requester %p", buf, 0x20u);
    }

    v7 = a2 - a1[3].i64[0];
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__GEOTileRequestBalancer__startOperationsWithAvailableCount___block_invoke_9;
    block[3] = &unk_1E1C0F588;
    v11 = a1[2];
    v10 = (id)v11.i64[0];
    v13 = vextq_s8(v11, v11, 8uLL);
    v14 = v7;
    dispatch_async(v9, block);

  }
}

uint64_t __59__GEOTileRequestBalancer_addRequester_tileKeys_priorities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addRequester:tileKeys:priorities:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __47__GEOTileRequestBalancer_balancerForRequester___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldParticipateInBalancerScheduling"))
  {
    WeakRetained = objc_loadWeakRetained(&_MergedGlobals_271);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = WeakRetained;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v5 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "_initWithMaxRunningOperationsCount:", objc_msgSend(*(id *)(a1 + 48), "maxRunningOperationsCount"));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;
      v8 = &_MergedGlobals_271;
LABEL_7:

      objc_storeWeak(v8, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
  }
  else
  {
    v9 = objc_loadWeakRetained(&qword_1ECDBC3A8);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v12 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "_initWithMaxRunningOperationsCount:", -1);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;
      v8 = &qword_1ECDBC3A8;
      goto LABEL_7;
    }
  }
}

uint64_t __42__GEOTileRequestBalancer_removeRequester___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeRequester:", *(_QWORD *)(a1 + 40));
}

- (void)removeRequester:(id)a3
{
  _anonymous_namespace_ *v4;
  NSObject *v5;
  _anonymous_namespace_ *v6;
  _QWORD v7[5];
  _anonymous_namespace_ *v8;

  v4 = (_anonymous_namespace_ *)a3;
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__GEOTileRequestBalancer_removeRequester___block_invoke;
  v7[3] = &unk_1E1BFFF48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)dealloc
{
  id **requesters;
  void *randomIndexGenerator;
  objc_super v5;

  GEOUnregisterStateCaptureLegacy();
  requesters = (id **)self->_requesters;
  if (requesters)
  {
    if (*requesters)
    {
      operator delete(*requesters);
    }
    MEMORY[0x18D76437C](requesters, 0x20C40960023A9);
    self->_requesters = 0;
  }
  randomIndexGenerator = self->_randomIndexGenerator;
  if (randomIndexGenerator)
  {
    MEMORY[0x18D76437C](randomIndexGenerator, 0x1000C407BAC9B3ELL);
    self->_randomIndexGenerator = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)GEOTileRequestBalancer;
  -[GEOTileRequestBalancer dealloc](&v5, sel_dealloc);
}

- (void)addRequester:(id)a3 tileKeys:(id)a4 priorities:(id)a5
{
  id v8;
  id v9;
  _anonymous_namespace_ *v10;
  NSObject *v11;
  _anonymous_namespace_ *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _anonymous_namespace_ *v18;

  v8 = a3;
  v9 = a4;
  v10 = (_anonymous_namespace_ *)a5;
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__GEOTileRequestBalancer_addRequester_tileKeys_priorities___block_invoke;
  v15[3] = &unk_1E1C11958;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_removeRequester:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;

  v4 = a3;
  v5 = -[GEOTileRequestBalancer requesters](self, "requesters");
  v6 = *v5;
  v7 = v5[1];
  v20 = v4;
  if (v6 != v7)
  {
    while (1)
    {
      WeakRetained = objc_loadWeakRetained((id *)v6);
      if (!WeakRetained)
        break;
      v9 = WeakRetained;
      v10 = objc_loadWeakRetained((id *)v6);
      if (v10 == v20)
      {

        break;
      }
      v11 = objc_msgSend(*(id *)(v6 + 8), "count");

      if (!v11)
        break;
      v6 += 24;
      if (v6 == v7)
      {
        v6 = v7;
        goto LABEL_17;
      }
    }
    if (v6 != v7)
    {
      for (i = v6 + 24; i != v7; i += 24)
      {
        v13 = objc_loadWeakRetained((id *)i);
        if (v13)
        {
          v14 = v13;
          v15 = objc_loadWeakRetained((id *)i);
          if (v15 == v20)
          {

          }
          else
          {
            v16 = objc_msgSend(*(id *)(i + 8), "count");

            if (v16)
            {
              v17 = objc_loadWeakRetained((id *)i);
              objc_storeWeak((id *)v6, v17);

              v18 = *(_QWORD *)(i + 8);
              *(_QWORD *)(i + 8) = 0;
              v19 = *(void **)(v6 + 8);
              *(_QWORD *)(v6 + 8) = v18;

              *(_QWORD *)(v6 + 16) = *(_QWORD *)(i + 16);
              v6 += 24;
            }
          }
        }
      }
    }
  }
LABEL_17:

  -[GEOTileRequestBalancer _startOperations](self, "_startOperations");

}

- (id)_initWithMaxRunningOperationsCount:(unint64_t)a3
{
  GEOTileRequestBalancer *v4;
  _QWORD *v5;
  int v6;
  char *v7;
  uint64_t v8;
  int v9;
  char *v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  int v18;
  _QWORD *v19;
  int *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  int v33;
  unint64_t v34;
  int v35;
  unsigned int v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  unsigned int v41;
  int v42;
  int v43;
  _anonymous_namespace_ *v44;
  uint64_t v45;
  void *v46;
  char *__p;
  char *v49;
  char *v50;
  std::random_device v51;
  objc_super v52;
  _DWORD __src[624];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)GEOTileRequestBalancer;
  v4 = -[GEOTileRequestBalancer init](&v52, sel_init);
  if (v4)
  {
    v5 = (_QWORD *)operator new();
    *v5 = 0;
    v5[1] = 0;
    v5[2] = 0;
    v4->_requesters = v5;
    std::random_device::random_device[abi:ne180100](&v51);
    __src[0] = MEMORY[0x18D764250](&v51);
    __src[1] = MEMORY[0x18D764250](&v51);
    __src[2] = MEMORY[0x18D764250](&v51);
    __src[3] = MEMORY[0x18D764250](&v51);
    __src[4] = MEMORY[0x18D764250](&v51);
    __src[5] = MEMORY[0x18D764250](&v51);
    __src[6] = MEMORY[0x18D764250](&v51);
    v6 = MEMORY[0x18D764250](&v51);
    v7 = 0;
    v8 = 0;
    __src[7] = v6;
    v49 = 0;
    v50 = 0;
    __p = 0;
    do
    {
      v9 = __src[v8];
      if (v7 >= v50)
      {
        v11 = __p;
        v12 = (v7 - __p) >> 2;
        v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 62)
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        v14 = v50 - __p;
        if ((v50 - __p) >> 1 > v13)
          v13 = v14 >> 1;
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL)
          v15 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v15 = v13;
        if (v15)
        {
          v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v50, v15);
          v11 = __p;
          v7 = v49;
        }
        else
        {
          v16 = 0;
        }
        v17 = &v16[4 * v12];
        *(_DWORD *)v17 = v9;
        v10 = v17 + 4;
        while (v7 != v11)
        {
          v18 = *((_DWORD *)v7 - 1);
          v7 -= 4;
          *((_DWORD *)v17 - 1) = v18;
          v17 -= 4;
        }
        __p = v17;
        v50 = &v16[4 * v15];
        if (v11)
          operator delete(v11);
      }
      else
      {
        *(_DWORD *)v7 = v9;
        v10 = v7 + 4;
      }
      v49 = v10;
      ++v8;
      v7 = v10;
    }
    while (v8 != 8);
    v19 = (_QWORD *)operator new();
    v20 = (int *)__p;
    memset(&__src[1], 139, 0x9BCuLL);
    v21 = (v10 - __p) >> 2;
    v22 = v21 + 1;
    if ((unint64_t)(v21 + 1) > 0x270)
      v23 = v21 + 1;
    else
      v23 = 624;
    __src[317] = v21 - 582287779;
    __src[306] = -582287779;
    __src[0] = v21 + 1371501266;
    if (v10 == __p)
    {
      v24 = 0;
      v29 = 623;
      v28 = 306;
      v27 = 317;
    }
    else
    {
      v24 = 0;
      v25 = 2;
      if (v22 > 2)
        v25 = v21 + 1;
      v26 = v25 - 1;
      v27 = 317;
      v28 = 306;
      v29 = 623;
      do
      {
        if (v24 == 623)
          v24 = 0;
        else
          ++v24;
        if (v29 == 623)
          v29 = 0;
        else
          ++v29;
        if (v28 == 623)
          v28 = 0;
        else
          ++v28;
        if (v27 == 623)
          v27 = 0;
        else
          ++v27;
        v30 = __src[v28];
        v31 = 1664525 * (__src[v24] ^ __src[v29] ^ v30 ^ ((__src[v24] ^ __src[v29] ^ v30) >> 27));
        __src[v28] = v31 + v30;
        v32 = *v20++;
        v33 = v32 + v24 + v31;
        __src[v27] += v33;
        __src[v24] = v33;
        --v26;
      }
      while (v26);
    }
    if (v22 <= 0x26F)
    {
      v34 = ~v21 + v23;
      do
      {
        if (v24 == 623)
          v24 = 0;
        else
          ++v24;
        if (v29 == 623)
          v29 = 0;
        else
          ++v29;
        if (v28 == 623)
          v28 = 0;
        else
          ++v28;
        if (v27 == 623)
          v27 = 0;
        else
          ++v27;
        v35 = __src[v28];
        v36 = __src[v24] ^ __src[v29] ^ v35;
        v37 = 1664525 * (v36 ^ (v36 >> 27));
        __src[v28] = v37 + v35;
        v38 = v37 + v24;
        __src[v27] += v38;
        __src[v24] = v38;
        --v34;
      }
      while (v34);
    }
    if (v23 <= 0xFFFFFFFFFFFFFD8FLL)
    {
      v39 = 624;
      do
      {
        if (v24 == 623)
          v24 = 0;
        else
          ++v24;
        if (v29 == 623)
          v29 = 0;
        else
          ++v29;
        if (v28 == 623)
          v28 = 0;
        else
          ++v28;
        if (v27 == 623)
          v27 = 0;
        else
          ++v27;
        v40 = __src[v28];
        v41 = v40 + __src[v24] + __src[v29];
        v42 = 1566083941 * (v41 ^ (v41 >> 27));
        __src[v28] = v42 ^ v40;
        v43 = v42 - v24;
        __src[v27] ^= v43;
        __src[v24] = v43;
        --v39;
      }
      while (v39);
    }
    v44 = (_anonymous_namespace_ *)memcpy(v19, __src, 0x9C0uLL);
    v19[312] = 0;
    if ((*(_DWORD *)v19 & 0x80000000) == 0)
    {
      v45 = 4;
      while (!*(_DWORD *)((char *)v19 + v45))
      {
        v45 += 4;
        if (v45 == 2496)
        {
          *(_DWORD *)v19 = 0x80000000;
          break;
        }
      }
    }
    v4->_randomIndexGenerator = v19;
    v4->_maxRunningOperationsCount = a3;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    GEORegisterPListStateCaptureLegacy();

    if (__p)
      operator delete(__p);
    std::random_device::~random_device(&v51);
  }
  return v4;
}

- (void)_addRequester:(id)a3 tileKeys:(id)a4 priorities:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  id v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t *v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[GEOTileRequestBalancer requesters](self, "requesters");
  v12 = v11;
  v13 = v11[2];
  v14 = v11[1];
  if (v14 >= v13)
  {
    v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v14 - *v11) >> 3);
    if (v16 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13 - *v11) >> 3);
    v18 = 2 * v17;
    if (2 * v17 <= v16 + 1)
      v18 = v16 + 1;
    if (v17 >= 0x555555555555555)
      v19 = 0xAAAAAAAAAAAAAAALL;
    else
      v19 = v18;
    v34 = v11 + 2;
    if (v19)
    {
      if (v19 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v20 = (char *)operator new(24 * v19);
    }
    else
    {
      v20 = 0;
    }
    v30 = v20;
    v31 = &v20[24 * v16];
    v32 = (uint64_t)v31;
    v33 = &v20[24 * v19];
    v21 = (uint64_t)v31;
    v15 = (unint64_t)(v31 + 24);
    v23 = *v12;
    v22 = v12[1];
    if (v22 == *v12)
    {
      v27 = v12[1];
    }
    else
    {
      v29 = v8;
      v24 = 0;
      do
      {
        v25 = v21 + v24;
        objc_moveWeak((id *)(v21 + v24 - 24), (id *)(v22 + v24 - 24));
        v26 = *(_QWORD *)(v22 + v24 - 16);
        *(_QWORD *)(v22 + v24 - 16) = 0;
        *(_QWORD *)(v25 - 16) = v26;
        *(_QWORD *)(v25 - 8) = *(_QWORD *)(v22 + v24 - 8);
        v24 -= 24;
      }
      while (v22 + v24 != v23);
      v27 = *v12;
      v22 = v12[1];
      v21 += v24;
      v8 = v29;
    }
    *v12 = v21;
    v30 = (char *)v27;
    v31 = (char *)v27;
    v12[1] = v15;
    v32 = v22;
    v28 = (char *)v12[2];
    v12[2] = (uint64_t)v33;
    v33 = v28;
  }
  else
  {
    v15 = v14 + 24;
    v12[1] = v15;
  }
  v12[1] = v15;
  -[GEOTileRequestBalancer _startOperations](self, "_startOperations");

}

+ (unint64_t)maxRunningOperationsCount
{
  uint64_t UInteger;
  unint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  UInteger = GEOConfigGetUInteger(GeoServicesConfig_MaxConcurrentTileRequests, (uint64_t)off_1EDF4D268);
  if (!UInteger)
    return 60;
  v3 = UInteger;
  GEOGetTileLoadingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 < 0x3E8)
  {
    if (v5)
    {
      v7 = 134217984;
      v8 = v3;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Maximum concurrent tile requests is limited to %llu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      v7 = 134217984;
      v8 = v3;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "Maximum concurrent tile requests is unlimited (%llu)", (uint8_t *)&v7, 0xCu);
    }
    v3 = -1;
  }

  return v3;
}

+ (id)balancerForRequester:(id)a3
{
  _anonymous_namespace_ *v4;
  NSObject *v5;
  _anonymous_namespace_ *v6;
  id v7;
  _QWORD block[4];
  _anonymous_namespace_ *v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = (_anonymous_namespace_ *)a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__68;
  v17 = __Block_byref_object_dispose__68;
  v18 = 0;
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__GEOTileRequestBalancer_balancerForRequester___block_invoke;
  block[3] = &unk_1E1C10A60;
  v10 = v4;
  v11 = &v13;
  v12 = a1;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (GEOTileRequestBalancer)init
{
  GEOTileRequestBalancer *result;

  result = (GEOTileRequestBalancer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (void)requester:(void *)a3 updatePriority:(int)a4 tileKey:(__int128 *)a5
{
  _anonymous_namespace_ *v8;
  NSObject *v9;
  _anonymous_namespace_ *v10;
  _QWORD v11[5];
  _anonymous_namespace_ *v12;
  int v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v14 = *a5;
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__GEOTileRequestBalancer_requester_updatePriority_tileKey___block_invoke;
  v11[3] = &unk_1E1C11980;
  v11[4] = a1;
  v12 = v8;
  v13 = a4;
  v10 = v8;
  dispatch_async(v9, v11);

}

uint64_t __59__GEOTileRequestBalancer_requester_updatePriority_tileKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requester:updatePriority:tileKey:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 52), *(_QWORD *)(a1 + 60));
}

- (void)_requester:(void *)a3 updatePriority:(uint64_t)a4 tileKey:(uint64_t)a5
{
  id v8;
  uint64_t v9;
  id *i;
  id WeakRetained;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v12[0] = a5;
  v12[1] = a6;
  v8 = a3;
  v9 = objc_msgSend(a1, "requesters");
  for (i = *(id **)v9; i != *(id **)(v9 + 8); i += 3)
  {
    WeakRetained = objc_loadWeakRetained(i);

    if (WeakRetained == v8)
    {
      objc_msgSend(i[1], "setPriority:forKey:", a4, v12);
      break;
    }
  }
  objc_msgSend(a1, "_startOperations");

}

uint64_t __61__GEOTileRequestBalancer__startOperationsWithAvailableCount___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requester:incrementRunningOperationsCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = -[GEOTileRequestBalancer requesters](self, "requesters", a3);
  v5 = *v4;
  v6 = v4[1];
  if (*v4 == v6)
  {
    v7 = 0;
    v9 = 0;
  }
  else
  {
    v7 = 0;
    v8 = *v4;
    do
    {
      v7 += *(_QWORD *)(v8 + 16);
      v8 += 24;
    }
    while (v8 != v6);
    v9 = 0;
    do
    {
      v9 += objc_msgSend(*(id *)(v5 + 8), "count");
      v5 += 24;
    }
    while (v5 != v6);
  }
  v15[0] = CFSTR("Max Running Operations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxRunningOperationsCount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v15[1] = CFSTR("Total Running");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  v15[2] = CFSTR("Total Remaining");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
