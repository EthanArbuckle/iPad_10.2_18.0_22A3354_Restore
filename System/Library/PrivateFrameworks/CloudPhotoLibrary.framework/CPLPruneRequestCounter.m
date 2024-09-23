@implementation CPLPruneRequestCounter

void __43___CPLPruneRequestCounter_statusDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "countForObject:", v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    +[CPLResource descriptionForResourceType:](CPLResource, "descriptionForResourceType:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

  }
}

void __33___CPLPruneRequestCounter_status__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "countForObject:", v5);

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "countForObject:", v8);

  if (v6 | v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", a2);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v9)
      v13 = objc_msgSend(v10, "initWithFormat:", CFSTR("%lu x %@ (+ %lu rejected)"), v6, v11, v9);
    else
      v13 = objc_msgSend(v10, "initWithFormat:", CFSTR("%lu x %@"), v6, v11, v22);
    v23 = (id)v13;

    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v14)
    {
      objc_msgSend(v14, "appendFormat:", CFSTR(", %@"), v23);
      v15 = a1 + 56;
      if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != 3)
      {
LABEL_11:

        return;
      }
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = 0;

      v18 = 0;
    }
    else
    {
      v19 = objc_msgSend(v23, "mutableCopy");
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

      objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      v15 = a1 + 56;
      v18 = 1;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v15 + 8) + 24) = v18;
    goto LABEL_11;
  }
}

@end
