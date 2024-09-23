@implementation HDMHMostPrevalentDomainsBuilder

- (void)addStateOfMind:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "valenceClassification") - 1;
  if (v4 < 7 && ((0x77u >> v4) & 1) != 0)
  {
    v5 = qword_24170F478[v4];
    v6 = qword_24170F4B0[v4];
    ++*(Class *)((char *)&self->super.isa + v5);
    -[HDMHMostPrevalentDomainsBuilder _addStateOfMind:toMap:](self, "_addStateOfMind:toMap:", v7, (char *)self + v6);
  }

}

- (id)mostPrevalentPleasantDomains
{
  return -[HDMHMostPrevalentDomainsBuilder _winningSummaryForPleasant:](self, "_winningSummaryForPleasant:", 1);
}

- (id)mostPrevalentUnpleasantDomains
{
  return -[HDMHMostPrevalentDomainsBuilder _winningSummaryForPleasant:](self, "_winningSummaryForPleasant:", 0);
}

- (void)_addStateOfMind:(id)a3 toMap:(void *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  _HDMHDomainCount *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  objc_msgSend(v15, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v15, "domains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "integerValue");
        if ((HKStateOfMindDomainIsKnown() & 1) != 0)
        {
          v17 = objc_msgSend(v9, "integerValue");
          v22 = &v17;
          v10 = (id)std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>((uint64_t)a4, (unint64_t *)&v17, (uint64_t)&std::piecewise_construct, &v22)[3];
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "setCount:", objc_msgSend(v10, "count") + 1);
            objc_msgSend(v11, "setMostRecentDate:", v16);
          }
          else
          {
            v12 = -[_HDMHDomainCount initWithCount:mostRecentDate:]([_HDMHDomainCount alloc], "initWithCount:mostRecentDate:", 1, v16);
            v17 = objc_msgSend(v9, "integerValue");
            v22 = &v17;
            v13 = std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>((uint64_t)a4, (unint64_t *)&v17, (uint64_t)&std::piecewise_construct, &v22);
            v14 = (void *)v13[3];
            v13[3] = v12;

          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

}

- (id)_winningSummaryForPleasant:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;
  uint64_t **i;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  id v11;
  void (**v12)(_QWORD);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  HDMHMostPrevalentDomainsBuilder *v23;
  _QWORD v24[4];
  uint64_t *v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  unint64_t v39;
  _BYTE v40[16];
  uint64_t **v41;
  uint64_t v42;

  v3 = a3;
  v5 = 48;
  if (a3)
    v5 = 8;
  std::unordered_map<long,_HDMHDomainCount * {__strong}>::unordered_map((uint64_t)v40, (uint64_t)self + v5);
  if (v42)
  {
    v23 = self;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0x8000000000000000;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__3;
    v34 = __Block_byref_object_dispose__3;
    v35 = 0;
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    for (i = v41; i; i = (uint64_t **)*i)
    {
      v8 = (uint64_t)i[2];
      v9 = i[3];
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __62__HDMHMostPrevalentDomainsBuilder__winningSummaryForPleasant___block_invoke;
      v24[3] = &unk_2511A22F8;
      v27 = &v36;
      v10 = v9;
      v25 = v10;
      v28 = &v30;
      v11 = v6;
      v26 = v11;
      v29 = v8;
      v12 = (void (**)(_QWORD))MEMORY[0x24269A294](v24);
      v13 = objc_msgSend(v10, "count");
      if (v13 >= v37[3])
      {
        v14 = objc_msgSend(v10, "count");
        if (v14 <= v37[3])
        {
          objc_msgSend(v10, "mostRecentDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "compare:", v31[5]);

          if (v16 == -1)
            goto LABEL_11;
          if (v16 != 1)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v17);

            goto LABEL_11;
          }
        }
        v12[2](v12);
      }
LABEL_11:

    }
    v18 = 96;
    if (v3)
      v18 = 88;
    v19 = *(uint64_t *)((char *)&v23->super.isa + v18);
    v20 = objc_alloc(MEMORY[0x24BE65DB8]);
    v21 = (void *)objc_msgSend(v20, "initWithDomains:count:totalSampleCount:", v6, v37[3], v19);

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    v21 = 0;
  }
  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::~__hash_table((uint64_t)v40);
  return v21;
}

void __62__HDMHMostPrevalentDomainsBuilder__winningSummaryForPleasant___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "count");
  objc_msgSend(*(id *)(a1 + 32), "mostRecentDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  v5 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:");

}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::~__hash_table((uint64_t)&self->_unpleasantCountsByDomain);
  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::~__hash_table((uint64_t)&self->_pleasantCountsByDomain);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end
