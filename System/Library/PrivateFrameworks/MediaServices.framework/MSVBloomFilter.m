@implementation MSVBloomFilter

void __28__MSVBloomFilter_addObject___block_invoke(uint64_t a1, CFIndex a2)
{
  CFBitVectorSetBitAtIndex(*(CFMutableBitVectorRef *)(*(_QWORD *)(a1 + 32) + 8), a2, 1u);
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  -[MSVBloomFilter _vectorIndexSetForObject:](self, "_vectorIndexSetForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__MSVBloomFilter_containsObject___block_invoke;
  v7[3] = &unk_1E43E9B58;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

- (void)addObject:(id)a3
{
  id v4;
  _QWORD v5[5];

  -[MSVBloomFilter _vectorIndexSetForObject:](self, "_vectorIndexSetForObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__MSVBloomFilter_addObject___block_invoke;
  v5[3] = &unk_1E43E9B30;
  v5[4] = self;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v5);

}

- (id)_vectorIndexSetForObject:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  v5 = -[MSVBloomFilter _fnvHashObject:](self, "_fnvHashObject:", v4);
  v6 = -[MSVBloomFilter _murmur2HashObject:](self, "_murmur2HashObject:", v4);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_hashCount >= 1)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v7, "addIndex:", v5 % self->_vectorCapacity);
      ++v8;
      v5 += v6;
    }
    while (v8 < self->_hashCount);
  }

  return v7;
}

- (unint64_t)_murmur2HashObject:(id)a3
{
  uint64_t v4;
  unint64_t v5;

  v4 = objc_msgSend(a3, "hash");
  v5 = 0xC6A4A7935BD1E995
     * (self->_murmurSeed ^ 0x35253C9ADE8F4CA8 ^ (0xC6A4A7935BD1E995
                                                  * ((0xC6A4A7935BD1E995 * v4) ^ ((0xC6A4A7935BD1E995 * v4) >> 47))));
  return (0xC6A4A7935BD1E995 * (v5 ^ (v5 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v5 ^ (v5 >> 47))) >> 47);
}

- (unint64_t)_fnvHashObject:(id)a3
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_msgSend(a3, "hash");
  v4 = 0;
  v5 = 0xCBF29CE484222325;
  do
    v5 = 0x100000001B3 * ((v3 >> v4++) & 0xF ^ v5);
  while (v4 != 8);
  return v5;
}

uint64_t __33__MSVBloomFilter_containsObject___block_invoke(uint64_t a1, CFIndex a2, _BYTE *a3)
{
  uint64_t result;

  result = CFBitVectorGetBitAtIndex(*(CFBitVectorRef *)(*(_QWORD *)(a1 + 32) + 8), a2);
  if (!(_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (MSVBloomFilter)initWithCapacity:(int64_t)a3 falsePositiveTolerance:(float)a4
{
  MSVBloomFilter *v8;
  MSVBloomFilter *v9;
  double v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  float v14;
  __CFBitVector *Mutable;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVBloomFilter.m"), 23, CFSTR("An expected capacity must be provided."));

  }
  if (a4 >= 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVBloomFilter.m"), 24, CFSTR("Tolerance must be between 0..<1 and cannot be 1"));

  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVBloomFilter.m"), 25, CFSTR("Tolerance must be between 0..<1 and cannot be 0"));

  }
  v20.receiver = self;
  v20.super_class = (Class)MSVBloomFilter;
  v8 = -[MSVBloomFilter init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_falsePositiveTolerance = a4;
    v8->_capacity = a3;
    arc4random_buf(&v8->_murmurSeed, 8uLL);
    v10 = -log(a4);
    v11 = 1;
    v12 = a3;
    do
    {
      v13 = vcvtpd_s64_f64(v10 * (double)v12 / 0.480453014);
      v9->_vectorCapacity = v13;
      v9->_hashCount = vcvtpd_s64_f64((double)(v13 / v12) * 0.693147181);
      -[MSVBloomFilter falsePositiveProbability](v9, "falsePositiveProbability");
      if (v11 > 0xB)
        break;
      ++v11;
      v12 += a3;
    }
    while (v14 > a4);
    Mutable = CFBitVectorCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9->_vectorCapacity);
    v9->_vector = Mutable;
    CFBitVectorSetCount(Mutable, v9->_vectorCapacity);
  }
  return v9;
}

- (float)falsePositiveProbability
{
  int64_t hashCount;
  long double v3;

  hashCount = self->_hashCount;
  v3 = pow(2.71828183, (float)((float)-(hashCount * self->_capacity) / (float)self->_vectorCapacity));
  return pow(1.0 - v3, (double)hashCount);
}

- (MSVBloomFilter)initWithCapacity:(int64_t)a3 falsePositiveTolerance:(float)a4 murmurSeed:(unint64_t)a5
{
  MSVBloomFilter *result;

  result = -[MSVBloomFilter initWithCapacity:falsePositiveTolerance:](self, "initWithCapacity:falsePositiveTolerance:", a3);
  if (result)
    result->_murmurSeed = a5;
  return result;
}

- (void)dealloc
{
  __CFBitVector *vector;
  objc_super v4;

  vector = self->_vector;
  if (vector)
    CFRelease(vector);
  v4.receiver = self;
  v4.super_class = (Class)MSVBloomFilter;
  -[MSVBloomFilter dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  int64_t hashCount;
  float v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = self->_vectorCapacity / 8;
  hashCount = self->_hashCount;
  -[MSVBloomFilter falsePositiveProbability](self, "falsePositiveProbability");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p size=%ld hashCount=%ld falsePositiveProbability=%0.4f>"), v4, self, v5, hashCount, v7);
}

- (MSVBloomFilter)initWithCoder:(id)a3
{
  id v4;
  MSVBloomFilter *v5;
  void *v6;
  void *v7;
  const __CFAllocator *v8;
  id v9;
  const __CFBitVector *v10;
  const __CFBitVector *v11;
  MSVBloomFilter *v12;
  uint64_t v14;
  uint64_t vectorCapacity;
  uint64_t v16;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MSVBloomFilter;
  v5 = -[MSVBloomFilter init](&v17, sel_init);
  if (!v5)
    goto LABEL_6;
  v5->_capacity = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("capacity"));
  v5->_vectorCapacity = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vectorCapacity"));
  v5->_falsePositiveTolerance = (float)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("falsePositiveTolerance"));
  v5->_hashCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hashCount"));
  v5->_murmurSeed = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("murmurSeed"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vectorData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_8;
  if (objc_msgSend(v6, "length") != v5->_vectorCapacity / 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v14 = objc_msgSend(v7, "length");
      vectorCapacity = v5->_vectorCapacity;
      v16 = vectorCapacity + 7;
      if (vectorCapacity >= 0)
        v16 = v5->_vectorCapacity;
      *(_DWORD *)buf = 134218496;
      v19 = v14;
      v20 = 2048;
      v21 = vectorCapacity;
      v22 = 2048;
      v23 = v16 >> 3;
      _os_log_fault_impl(&dword_1A077D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "MSVBloomFilter encoded data length does not match vector capacity: %lld != (%lld / 8) [%lld]", buf, 0x20u);
    }
    goto LABEL_8;
  }
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = objc_retainAutorelease(v7);
  v10 = CFBitVectorCreate(v8, (const UInt8 *)objc_msgSend(v9, "bytes"), v5->_vectorCapacity);
  if (!v10)
  {
LABEL_8:

    v12 = 0;
    goto LABEL_9;
  }
  v11 = v10;
  v5->_vector = CFBitVectorCreateMutableCopy(v8, v5->_vectorCapacity, v10);
  CFRelease(v11);

LABEL_6:
  v12 = v5;
LABEL_9:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t capacity;
  id v5;
  void *v6;
  CFIndex vectorCapacity;
  __CFBitVector *vector;
  UInt8 *v9;
  id v10;
  CFRange v11;

  capacity = self->_capacity;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", capacity, CFSTR("capacity"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_vectorCapacity, CFSTR("vectorCapacity"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_falsePositiveTolerance, CFSTR("falsePositiveTolerance"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_hashCount, CFSTR("hashCount"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_murmurSeed, CFSTR("murmurSeed"));
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", self->_vectorCapacity / 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  vector = self->_vector;
  vectorCapacity = self->_vectorCapacity;
  v10 = objc_retainAutorelease(v6);
  v9 = (UInt8 *)objc_msgSend(v10, "mutableBytes");
  v11.location = 0;
  v11.length = vectorCapacity;
  CFBitVectorGetBits(vector, v11, v9);
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("vectorData"));

}

- (int64_t)estimatedCount
{
  CFIndex CountOfBit;
  CFRange v5;

  v5.length = self->_vectorCapacity;
  v5.location = 0;
  CountOfBit = CFBitVectorGetCountOfBit(self->_vector, v5, 1u);
  return vcvtpd_s64_f64(log((float)(1.0 - (float)((float)CountOfBit / (float)self->_vectorCapacity)))* (float)((float)-(float)self->_vectorCapacity / (float)self->_hashCount));
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (float)falsePositiveTolerance
{
  return self->_falsePositiveTolerance;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
