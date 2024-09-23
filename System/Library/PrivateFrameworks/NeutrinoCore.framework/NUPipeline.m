@implementation NUPipeline

const __CFString *__34___NUPipeline__compactDescription__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "type");
  if ((unint64_t)(v2 - 1) > 2)
    return CFSTR("?");
  else
    return off_1E5061130[v2 - 1];
}

const __CFString *__34___NUPipeline__compactDescription__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "type");
  if ((unint64_t)(v2 - 1) > 2)
    return CFSTR("?");
  else
    return off_1E5061130[v2 - 1];
}

id __33___NUPipeline_compactDescription__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "inputPortForChannel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend(v3, "type");

  if ((unint64_t)(v6 - 1) > 2)
    v7 = CFSTR("?");
  else
    v7 = off_1E5061130[v6 - 1];
  v8 = v7;
  objc_msgSend(v4, "outputPorts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%lu"), v8, objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __33___NUPipeline_compactDescription__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "outputPortForChannel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputPort");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_msgSend(v3, "type");

  if ((unint64_t)(v7 - 1) > 2)
    v8 = CFSTR("?");
  else
    v8 = off_1E5061130[v7 - 1];
  v9 = v8;
  v10 = v9;
  if (v5)
  {
    objc_msgSend(v5, "compactDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v9, CFSTR("-"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

id __33___NUPipeline_compactDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v2 = a2;
  objc_msgSend(v2, "inputChannels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v2;
  PFMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "outputChannels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  PFMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "alias");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@(%@|%@)"), v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

__CFString *__33___NUPipeline_compactDescription__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  __CFString *v4;

  objc_msgSend(*(id *)(a1 + 32), "inputPortForChannel:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputPort");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "compactDescription");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("-");
  }

  return v4;
}

id __33___NUPipeline_compactDescription__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "outputPortForChannel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend(v3, "type");

  if ((unint64_t)(v6 - 1) > 2)
    v7 = CFSTR("?");
  else
    v7 = off_1E5061130[v6 - 1];
  v8 = v7;
  objc_msgSend(v4, "outputPorts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%lu"), v8, objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __37___NUPipeline_outputChannelMatching___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "match:", a2);
}

uint64_t __36___NUPipeline_inputChannelMatching___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "match:", a2);
}

@end
