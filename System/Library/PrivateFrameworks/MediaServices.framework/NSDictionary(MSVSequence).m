@implementation NSDictionary(MSVSequence)

- (id)msv_map:()MSVSequence
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __37__NSDictionary_MSVSequence__msv_map___block_invoke;
  v13 = &unk_1E43E9700;
  v14 = v5;
  v15 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_firstWhere:()MSVSequence
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3891;
  v15 = __Block_byref_object_dispose__3892;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__NSDictionary_MSVSequence__msv_firstWhere___block_invoke;
  v8[3] = &unk_1E43E9728;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)msv_mapKeysAndValues:()MSVSequence
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __50__NSDictionary_MSVSequence__msv_mapKeysAndValues___block_invoke;
  v13 = &unk_1E43E9700;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_mapValues:()MSVSequence
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __43__NSDictionary_MSVSequence__msv_mapValues___block_invoke;
  v13 = &unk_1E43E9700;
  v14 = v5;
  v15 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_compactMap:()MSVSequence
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __44__NSDictionary_MSVSequence__msv_compactMap___block_invoke;
  v13 = &unk_1E43E9700;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_compactMapKeysAndValues:()MSVSequence
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __57__NSDictionary_MSVSequence__msv_compactMapKeysAndValues___block_invoke;
  v13 = &unk_1E43E9700;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_compactMapValues:()MSVSequence
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __50__NSDictionary_MSVSequence__msv_compactMapValues___block_invoke;
  v13 = &unk_1E43E9700;
  v14 = v5;
  v15 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_filter:()MSVSequence
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __40__NSDictionary_MSVSequence__msv_filter___block_invoke;
  v13 = &unk_1E43E9700;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)msv_flatMap:()MSVSequence
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __41__NSDictionary_MSVSequence__msv_flatMap___block_invoke;
  v13 = &unk_1E43E9700;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (uint64_t)msv_reduceIntoBool:()MSVSequence by:
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__NSDictionary_MSVSequence__msv_reduceIntoBool_by___block_invoke;
  v10[3] = &unk_1E43E9728;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = *((unsigned __int8 *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (float)msv_reduceIntoFloat:()MSVSequence by:
{
  id v6;
  id v7;
  float v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  float *v14;
  uint64_t v15;
  float v16;

  v6 = a4;
  v13 = 0;
  v14 = (float *)&v13;
  v15 = 0x2020000000;
  v16 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__NSDictionary_MSVSequence__msv_reduceIntoFloat_by___block_invoke;
  v10[3] = &unk_1E43E9728;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = v14[6];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (double)msv_reduceIntoCGFloat:()MSVSequence by:
{
  id v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  double v16;

  v6 = a4;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__NSDictionary_MSVSequence__msv_reduceIntoCGFloat_by___block_invoke;
  v10[3] = &unk_1E43E9728;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (double)msv_reduceIntoDouble:()MSVSequence by:
{
  id v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  double v16;

  v6 = a4;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NSDictionary_MSVSequence__msv_reduceIntoDouble_by___block_invoke;
  v10[3] = &unk_1E43E9728;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)msv_reduceIntoInt:()MSVSequence by:
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__NSDictionary_MSVSequence__msv_reduceIntoInt_by___block_invoke;
  v10[3] = &unk_1E43E9728;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)msv_reduceIntoInt32:()MSVSequence by:
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__NSDictionary_MSVSequence__msv_reduceIntoInt32_by___block_invoke;
  v10[3] = &unk_1E43E9728;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = *((unsigned int *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)msv_reduceIntoInt64:()MSVSequence by:
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__NSDictionary_MSVSequence__msv_reduceIntoInt64_by___block_invoke;
  v10[3] = &unk_1E43E9728;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)msv_reduceIntoUInt:()MSVSequence by:
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__NSDictionary_MSVSequence__msv_reduceIntoUInt_by___block_invoke;
  v10[3] = &unk_1E43E9728;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)msv_reduceIntoUInt32:()MSVSequence by:
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NSDictionary_MSVSequence__msv_reduceIntoUInt32_by___block_invoke;
  v10[3] = &unk_1E43E9728;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = *((unsigned int *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)msv_reduceIntoUInt64:()MSVSequence by:
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NSDictionary_MSVSequence__msv_reduceIntoUInt64_by___block_invoke;
  v10[3] = &unk_1E43E9728;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)msv_reduceIntoObject:()MSVSequence by:
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3891;
  v19 = __Block_byref_object_dispose__3892;
  v8 = v6;
  v20 = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__NSDictionary_MSVSequence__msv_reduceIntoObject_by___block_invoke;
  v12[3] = &unk_1E43E9728;
  v14 = &v15;
  v9 = v7;
  v13 = v9;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

@end
