@implementation EFBloomFilter

- (EFBloomFilter)init
{
  id v3;
  EFBloomFilter *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  v4 = -[EFBloomFilter _initWithBucketCount:hashFunctionCount:seed:indexes:](self, "_initWithBucketCount:hashFunctionCount:seed:indexes:", 1, 1, 0, v3);

  return v4;
}

- (EFBloomFilter)initWithValues:(id)a3
{
  return -[EFBloomFilter initWithValues:falsePositiveRate:](self, "initWithValues:falsePositiveRate:", a3, 0.05);
}

- (EFBloomFilter)initWithValues:(id)a3 falsePositiveRate:(double)a4
{
  return -[EFBloomFilter initWithValues:falsePositiveRate:seed:](self, "initWithValues:falsePositiveRate:seed:", a3, 0, a4);
}

- (EFBloomFilter)initWithValues:(id)a3 falsePositiveRate:(double)a4 seed:(unint64_t)a5
{
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  EFBloomFilter *v23;
  void *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFBloomFilter.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("falsePositiveRate > 0.0"));

  }
  if (a4 >= 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFBloomFilter.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("falsePositiveRate < 1.0"));

  }
  v9 = objc_msgSend(v28, "count");
  if (v9 <= 1)
    v10 = 1;
  else
    v10 = v9;
  v11 = log(a4);
  if (v11 * -1.44269504 >= 0.0)
    v12 = v11 * -1.44269504;
  else
    v12 = 0.0;
  v13 = v11 * -2.08136898;
  if (v13 >= 0.0)
    v14 = v13;
  else
    v14 = 0.0;
  v15 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = v28;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  v18 = vcvtpd_u64_f64(fmin(v12, 100.0));
  v19 = vcvtpd_u64_f64(fmin(v14 * (double)v10, 9.22337204e18));
  if (v17)
  {
    v20 = *(_QWORD *)v30;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v21);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          addStringToIndexes(v15, v22, v19, v18, a5);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            addDataToIndexes(v15, v22, v19, v18, a5);
        }
        ++v21;
      }
      while (v17 != v21);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v17);
  }

  v23 = -[EFBloomFilter _initWithBucketCount:hashFunctionCount:seed:indexes:](self, "_initWithBucketCount:hashFunctionCount:seed:indexes:", v19, v18, a5, v15);
  return v23;
}

- (id)_initWithBucketCount:(unint64_t)a3 hashFunctionCount:(unint64_t)a4 seed:(unint64_t)a5 indexes:(id)a6
{
  id v12;
  EFBloomFilter *v13;
  EFBloomFilter *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v12 = a6;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFBloomFilter.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bucketCount > 0"));
LABEL_10:

    if (a4)
      goto LABEL_4;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFBloomFilter.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hashFunctionCount > 0"));
    goto LABEL_13;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFBloomFilter.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bucketCount <= kMaxBuckets"));
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_11;
LABEL_4:
  if (a4 < 0x65)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFBloomFilter.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hashFunctionCount <= kMaxHashFunctions"));
LABEL_13:

LABEL_5:
  v18.receiver = self;
  v18.super_class = (Class)EFBloomFilter;
  v13 = -[EFBloomFilter init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_bucketCount = a3;
    v13->_hashFunctionCount = a4;
    v13->_seed = a5;
    objc_storeStrong((id *)&v13->_indexes, a6);
  }

  return v14;
}

+ (id)bestBloomFilterForValues:(id)a3 excludingValues:(id)a4 knownFalsePositives:(id *)a5
{
  objc_msgSend(a1, "bestBloomFilterForValues:excludingValues:falsePositiveRate:knownFalsePositives:", a3, a4, a5, 0.05);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)bestBloomFilterForValues:(id)a3 excludingValues:(id)a4 falsePositiveRate:(double)a5 knownFalsePositives:(id *)a6
{
  id v9;
  id v10;
  unint64_t v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  EFBloomFilter *v16;
  id v17;
  void *v18;
  unint64_t v19;
  double v20;
  double v21;
  long double v22;
  long double v23;
  void *v24;
  id v25;
  unint64_t v26;
  EFBloomFilter *v27;
  id v28;
  uint64_t v29;
  double v30;
  long double v31;
  long double v32;
  unint64_t v33;
  EFBloomFilter *v34;
  id v35;
  id v37;
  id v38;
  id v39;

  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "count"))
  {
    v11 = objc_msgSend(v9, "count");
    v12 = log(a5);
    v13 = v12 * -1.44269504;
    if (v12 * -1.44269504 < 0.0)
      v13 = 0.0;
    v14 = vcvtpd_u64_f64(fmin(v13, 100.0));
    v15 = v12 * -2.08136898;
    if (v15 < 0.0)
      v15 = 0.0;
    v39 = 0;
    bestBloomFilterCandidate(v9, v10, vcvtpd_u64_f64(fmin(v15 * (double)v11, 9.22337204e18)), v14, &v39);
    v16 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
    v17 = v39;
    v18 = v17;
    if (v17 && !objc_msgSend(v17, "count"))
      goto LABEL_21;
    if (v14 >= 2)
    {
      v19 = objc_msgSend(v9, "count");
      v20 = (double)(v14 - 1);
      v21 = -(v20 * (double)v19);
      v22 = pow(a5, 1.0 / v20);
      v23 = log(1.0 - v22);
      v38 = 0;
      bestBloomFilterCandidate(v9, v10, vcvtpd_u64_f64(fmin(v21 / v23, 9.22337204e18)), v14 - 1, &v38);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v38;
      v26 = objc_msgSend(v25, "count");
      if (v26 >= objc_msgSend(v18, "count"))
      {
        v28 = v18;
        v27 = v16;
      }
      else
      {
        v27 = v24;

        v28 = v25;
        if (v28)
        {
          v18 = v28;
          v16 = v27;
          if (!objc_msgSend(v28, "count"))
          {
LABEL_20:

            goto LABEL_21;
          }
        }
      }

      v16 = v27;
      v18 = v28;
      if (v14 > 0x7FFFFFFFFFFFFFFELL)
      {
LABEL_21:
        if (a6)
          *a6 = objc_retainAutorelease(v18);

        goto LABEL_24;
      }
    }
    v29 = v14 + 1;
    v30 = -((double)(unint64_t)v29 * (double)(unint64_t)objc_msgSend(v9, "count"));
    v31 = pow(a5, 1.0 / (double)(unint64_t)v29);
    v32 = log(1.0 - v31);
    v37 = 0;
    bestBloomFilterCandidate(v9, v10, vcvtpd_u64_f64(fmin(v30 / v32, 9.22337204e18)), v29, &v37);
    v27 = (EFBloomFilter *)objc_claimAutoreleasedReturnValue();
    v28 = v37;
    v33 = objc_msgSend(v28, "count");
    if (v33 < objc_msgSend(v18, "count"))
    {
      v34 = v27;

      v35 = v28;
      v18 = v35;
      v16 = v34;
    }
    goto LABEL_20;
  }
  if (a6)
    *a6 = (id)MEMORY[0x1E0C9AA60];
  v16 = objc_alloc_init(EFBloomFilter);
LABEL_24:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[EFBloomFilter _initWithBucketCount:hashFunctionCount:seed:indexes:]([EFBloomFilter alloc], "_initWithBucketCount:hashFunctionCount:seed:indexes:", -[EFBloomFilter bucketCount](self, "bucketCount"), -[EFBloomFilter hashFunctionCount](self, "hashFunctionCount"), -[EFBloomFilter seed](self, "seed"), self->_indexes);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[EFMutableBloomFilter _initWithBucketCount:hashFunctionCount:seed:indexes:]([EFMutableBloomFilter alloc], "_initWithBucketCount:hashFunctionCount:seed:indexes:", -[EFBloomFilter bucketCount](self, "bucketCount"), -[EFBloomFilter hashFunctionCount](self, "hashFunctionCount"), -[EFBloomFilter seed](self, "seed"), self->_indexes);
}

+ (id)bloomFilterWithContentsOfFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  unint64_t v27;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v6, 2, a4);
  v8 = v7;
  if (!v7)
    goto LABEL_23;
  if ((unint64_t)objc_msgSend(v7, "length") <= 0x17)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ef_invalidInputError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v21 = 0;
      *a4 = v9;
      goto LABEL_24;
    }
LABEL_23:
    v21 = 0;
    goto LABEL_24;
  }
  v26 = 0;
  objc_msgSend(v8, "getBytes:length:", &v26, 1);
  v10 = v26 >> 4;
  if (v10 == 1)
  {
    if (!a4)
      goto LABEL_23;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB35C8], "ef_notSupportedError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v10 != 2)
  {
    if (!a4)
      goto LABEL_23;
    goto LABEL_21;
  }
  if ((v26 & 0xF) != 1)
  {
    if (!a4)
      goto LABEL_23;
    goto LABEL_21;
  }
  v25 = 0;
  objc_msgSend(v8, "getBytes:range:", &v25, 4, 8);
  v24 = 0;
  objc_msgSend(v8, "getBytes:range:", &v24, 12, 8);
  v23 = 0;
  objc_msgSend(v8, "getBytes:range:", &v23, 20, 1);
  v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v8, "subdataWithRange:", 24, objc_msgSend(v8, "length") - 24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  v14 = v12;
  v15 = objc_msgSend(v14, "length");
  if (v15 >= 8)
  {
    v16 = 0;
    v17 = v15 >> 3;
    do
    {
      v27 = 0;
      objc_msgSend(v14, "getBytes:range:", &v27, 8 * v16, 8);
      v18 = 0;
      v19 = v27;
      do
      {
        if ((v19 & 1) != 0)
        {
          objc_msgSend(v13, "addIndex:", v18 | (v16 << 6));
          v19 = v27;
        }
        v19 >>= 1;
        v27 = v19;
        ++v18;
      }
      while (v18 != 64);
      ++v16;
    }
    while (v16 != v17);
  }

  v20 = objc_alloc((Class)a1);
  v21 = (void *)objc_msgSend(v20, "_initWithBucketCount:hashFunctionCount:seed:indexes:", v24, v23, v25, v13);

LABEL_24:
  return v21;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  int v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  uint64_t *v23;
  char v24;
  _QWORD v25[4];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v8 = a3;
  v19 = 0;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v18 = 33;
  objc_msgSend(v9, "appendBytes:length:", &v18, 1);
  objc_msgSend(v9, "appendBytes:length:", &v19, 3);
  v17 = -[EFBloomFilter seed](self, "seed");
  objc_msgSend(v9, "appendBytes:length:", &v17, 8);
  v16 = -[EFBloomFilter bucketCount](self, "bucketCount");
  objc_msgSend(v9, "appendBytes:length:", &v16, 8);
  v15 = -[EFBloomFilter hashFunctionCount](self, "hashFunctionCount");
  objc_msgSend(v9, "appendBytes:length:", &v15, 1);
  objc_msgSend(v9, "appendBytes:length:", &v19, 3);
  v10 = (void *)-[NSIndexSet copy](self->_indexes, "copy");
  -[EFBloomFilter bucketCount](self, "bucketCount");
  v11 = v9;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __appendIndexesToData_block_invoke;
  v20[3] = &unk_1E62A5AF8;
  v22 = v25;
  v23 = &v26;
  v24 = 0;
  v12 = v11;
  v21 = v12;
  objc_msgSend(v10, "enumerateIndexesUsingBlock:", v20);
  if (v27[3])
    objc_msgSend(v12, "appendBytes:length:", v27 + 3, 8);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);

  v13 = objc_msgSend(v12, "writeToURL:options:error:", v8, a4, a5);
  return v13;
}

- (BOOL)mayContainString:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__EFBloomFilter_mayContainString___block_invoke;
  v7[3] = &unk_1E62A5AA8;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = checkValueWithBlock(self, v7);

  return (char)self;
}

unint64_t __34__EFBloomFilter_mayContainString___block_invoke(uint64_t a1, uint64_t a2, unint64_t *a3, _DWORD *a4)
{
  unint64_t result;

  result = EFMurmurHash3String(*(void **)(a1 + 32), a2, a4);
  *a3 = result;
  return result;
}

- (BOOL)mayContainData:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__EFBloomFilter_mayContainData___block_invoke;
  v7[3] = &unk_1E62A5AA8;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = checkValueWithBlock(self, v7);

  return (char)self;
}

unint64_t __32__EFBloomFilter_mayContainData___block_invoke(uint64_t a1, uint64_t a2, unint64_t *a3, _DWORD *a4)
{
  unint64_t result;

  result = EFMurmurHash3Data(*(void **)(a1 + 32), a2, a4);
  *a3 = result;
  return result;
}

- (unint64_t)bucketCount
{
  return self->_bucketCount;
}

- (unint64_t)hashFunctionCount
{
  return self->_hashFunctionCount;
}

- (unint64_t)seed
{
  return self->_seed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexes, 0);
}

@end
