@implementation CKContextFingerprintMinHash

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKContextFingerprintMinHash)initWithHashes:(int *)a3 count:(unsigned int)a4
{
  CKContextFingerprintMinHash *v6;
  CKContextFingerprintMinHash *v7;
  int *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKContextFingerprintMinHash;
  v6 = -[CKContextFingerprintMinHash init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_numHashes = a4;
    if (a3)
    {
      v8 = (int *)malloc_type_malloc(4 * a4, 0xF1746BCEuLL);
      v7->_hashes = v8;
      memcpy(v8, a3, 4 * a4);
    }
    else
    {
      v6->_hashes = (int *)malloc_type_calloc(1uLL, 4 * a4, 0xE49E7481uLL);
    }
  }
  return v7;
}

- (CKContextFingerprintMinHash)initWithCoder:(id)a3
{
  id v4;
  CKContextFingerprintMinHash *v5;
  void *v6;
  uint64_t numHashes;
  size_t v8;
  int *v9;
  id v10;
  CKContextFingerprintMinHash *result;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKContextFingerprintMinHash;
  v5 = -[CKContextFingerprint initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  v5->_numHashes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numHashes"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hashes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  numHashes = v5->_numHashes;
  v8 = 4 * numHashes;
  if (objc_msgSend(v6, "length") == 4 * numHashes)
  {
    v9 = (int *)malloc_type_malloc(4 * numHashes, 0x1B8E61D9uLL);
    v5->_hashes = v9;
    v10 = objc_retainAutorelease(v6);
    memcpy(v9, (const void *)objc_msgSend(v10, "bytes"), v8);

LABEL_4:
    return v5;
  }
  result = (CKContextFingerprintMinHash *)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
    -[CKContextFingerprintMinHash initWithCoder:].cold.1(v6, 4 * numHashes);
  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKContextFingerprintMinHash;
  v4 = a3;
  -[CKContextFingerprint encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_numHashes, CFSTR("numHashes"), v6.receiver, v6.super_class);
  -[CKContextFingerprintMinHash data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("hashes"));

}

- (id)data
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_hashes, 4 * self->_numHashes, 0);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)CKContextFingerprintMinHash;
  -[CKContextFingerprint debugDescription](&v10, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ hashes:%i data:"), v4, self->_numHashes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (self->_numHashes)
  {
    v7 = 0;
    do
    {
      if (v7)
        v8 = CFSTR(",%08x");
      else
        v8 = CFSTR("%08x");
      objc_msgSend(v6, "appendFormat:", v8, self->_hashes[v7++]);
    }
    while (v7 < self->_numHashes);
  }
  return v6;
}

+ (id)parse:(id)a3
{
  id v4;
  CKContextFingerprintMinHash *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("CKContextFingerprintMinHash ")))
  {
    v47.receiver = a1;
    v47.super_class = (Class)&OBJC_METACLASS___CKContextFingerprintMinHash;
    objc_msgSendSuper2(&v47, sel_parse_, v4);
    v5 = (CKContextFingerprintMinHash *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &stru_1E462FA08, CFSTR("type"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &stru_1E462FA08, CFSTR("hashes"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &stru_1E462FA08, CFSTR("data"));
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v4;
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isEqualToString:", CFSTR("CKContextFingerprintMinHash")) & 1) == 0)
          {
            v15 = objc_msgSend(v14, "rangeOfString:", CFSTR(":"));
            if (v15 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_29;
            v16 = v15;
            objc_msgSend(v14, "substringToIndex:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "substringFromIndex:", v16 + 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v18, "length"))
              goto LABEL_28;
            objc_msgSend(v6, "objectForKeyedSubscript:", v17);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19 != &stru_1E462FA08)
            {

LABEL_28:
LABEL_29:

              goto LABEL_30;
            }
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, v17);
            ++v11;

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v11 = 0;
    }

    if (v11 == objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hashes"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "intValue");

      v5 = -[CKContextFingerprintMinHash initWithHashes:count:]([CKContextFingerprintMinHash alloc], "initWithHashes:count:", 0, v22 & ~(v22 >> 31));
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKContextFingerprint setType:](v5, "setType:", (int)objc_msgSend(v23, "intValue"));

      if (v22 >= 1)
      {
        v42 = 0;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v36 = v6;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsSeparatedByCharactersInSet:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        if (v27)
        {
          v28 = v27;
          v29 = 0;
          v30 = *(_QWORD *)v39;
          do
          {
            v31 = 0;
            v32 = v29;
            do
            {
              if (*(_QWORD *)v39 != v30)
                objc_enumerationMutation(v26);
              objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v31));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "scanHexInt:", &v42);
              v34 = v42;
              v29 = v32 + 1;
              -[CKContextFingerprintMinHash hashes](objc_retainAutorelease(v5), "hashes")[4 * v32] = v34;

              ++v31;
              ++v32;
            }
            while (v28 != v31);
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
          }
          while (v28);
        }

        v6 = v36;
      }
    }
    else
    {
LABEL_30:
      v5 = 0;
    }

    v4 = v37;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_hashes);
  v3.receiver = self;
  v3.super_class = (Class)CKContextFingerprintMinHash;
  -[CKContextFingerprintMinHash dealloc](&v3, sel_dealloc);
}

- (float)compareFingerprintWith:(id)a3
{
  CKContextFingerprintMinHash *v4;
  CKContextFingerprintMinHash *v5;
  float v6;
  int64_t v7;
  CKContextFingerprintMinHash *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t numHashes;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  int *v17;
  int v18;

  v4 = (CKContextFingerprintMinHash *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = 1.0;
  }
  else
  {
    v6 = 0.0;
    if (v4)
    {
      if (self->_numHashes)
      {
        v7 = -[CKContextFingerprint type](self, "type");
        if (v7 == -[CKContextFingerprint type](v5, "type"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v8 = v5;
            if (-[CKContextFingerprintMinHash numHashes](v8, "numHashes"))
            {
              v9 = -[CKContextFingerprintMinHash numHashes](v8, "numHashes");
              v10 = -[CKContextFingerprintMinHash hashes](objc_retainAutorelease(v8), "hashes");
              numHashes = self->_numHashes;
              if (numHashes <= v9)
                v12 = v9;
              else
                v12 = self->_numHashes;
              v13 = 2 * v12;
              if ((_DWORD)numHashes)
              {
                v14 = 0;
                v15 = 0;
                do
                {
                  if (v9)
                  {
                    v16 = v9;
                    v17 = (int *)v10;
                    while (1)
                    {
                      v18 = *v17++;
                      if (self->_hashes[v14] == v18)
                        break;
                      if (!--v16)
                        goto LABEL_18;
                    }
                    v15 += 2;
                  }
LABEL_18:
                  ++v14;
                }
                while (v14 != numHashes);
              }
              else
              {
                v15 = 0;
              }
              v6 = (float)v15 / (float)v13;
            }

          }
        }
      }
    }
  }

  return v6;
}

- (unsigned)numHashes
{
  return self->_numHashes;
}

- (int)hashes
{
  return self->_hashes;
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = objc_msgSend(a1, "length");
  v5 = 2048;
  v6 = a2;
  _os_log_fault_impl(&dword_1A1AA2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Illegal object length: %lu, expected: %lu", (uint8_t *)&v3, 0x16u);
}

@end
