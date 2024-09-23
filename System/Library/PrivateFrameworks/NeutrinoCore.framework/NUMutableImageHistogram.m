@implementation NUMutableImageHistogram

- (id)copyWithZone:(_NSZone *)a3
{
  -[NUImageHistogram immutableCopyWithZone:](self, "immutableCopyWithZone:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)write:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[NUMutableImageHistogram _red](self, "_red");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__NUMutableImageHistogram_write___block_invoke;
  v7[3] = &unk_1E5062B88;
  v7[4] = self;
  v9 = &v10;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "write:", v7);

  self->super._sampleCount += v11[3];
  _Block_object_dispose(&v10, 8);

}

- (void)smoothWithFunction:(int64_t)a3 windowSize:(int64_t)a4 sampleMode:(int64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  size_t v14;
  id v15;
  _QWORD block[4];
  id v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  -[NUMutableImageHistogram _red](self, "_red");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  -[NUMutableImageHistogram _green](self, "_green");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  -[NUMutableImageHistogram _blue](self, "_blue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v11;
  -[NUMutableImageHistogram _luminance](self, "_luminance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__NUMutableImageHistogram_smoothWithFunction_windowSize_sampleMode___block_invoke;
  block[3] = &unk_1E5062BB0;
  v17 = v13;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v15 = v13;
  dispatch_apply(v14, 0, block);

}

void __68__NUMutableImageHistogram_smoothWithFunction_windowSize_sampleMode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "smoothWithFunction:windowSize:sampleMode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __33__NUMutableImageHistogram_write___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "_green");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__NUMutableImageHistogram_write___block_invoke_2;
  v9[3] = &unk_1E5062B60;
  v9[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 40);
  v5 = (id)v8;
  v10 = v8;
  v11 = a2;
  objc_msgSend(v4, "write:", v9);

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return v6;
}

uint64_t __33__NUMutableImageHistogram_write___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "_blue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__NUMutableImageHistogram_write___block_invoke_3;
  v9[3] = &unk_1E5062B38;
  v9[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 40);
  v5 = (id)v8;
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 56);
  v12 = a2;
  objc_msgSend(v4, "write:", v9);

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return v6;
}

uint64_t __33__NUMutableImageHistogram_write___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "_luminance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__NUMutableImageHistogram_write___block_invoke_4;
  v9[3] = &unk_1E5062B10;
  v8 = *(_OWORD *)(a1 + 40);
  v5 = (id)v8;
  v10 = v8;
  v11 = *(_OWORD *)(a1 + 56);
  v12 = a2;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "write:", v9);

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return v6;
}

uint64_t __33__NUMutableImageHistogram_write___block_invoke_4(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a2, objc_msgSend(*(id *)(a1 + 32), "binCount"));
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

+ (Class)_histogramClass
{
  return (Class)objc_opt_class();
}

@end
