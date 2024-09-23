@implementation QLPXCompoundNumberFilter

- (double)updatedOutput
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[QLPXNumberFilter input](self, "input");
  v4 = v3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[QLPXCompoundNumberFilter filters](self, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __41__QLPXCompoundNumberFilter_updatedOutput__block_invoke;
        v14[3] = &__block_descriptor_40_e35_v16__0___QLPXMutableNumberFilter__8l;
        *(double *)&v14[4] = v4;
        objc_msgSend(v11, "performChanges:", v14);
        objc_msgSend(v11, "output");
        v4 = v12;
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

uint64_t __41__QLPXCompoundNumberFilter_updatedOutput__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInput:", *(double *)(a1 + 32));
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
}

@end
