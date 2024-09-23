@implementation GKARC4RandomSource

- (GKARC4RandomSource)init
{
  void *v3;
  void *v4;
  GKARC4RandomSource *v5;
  id v7;

  v3 = malloc_type_malloc(0x10uLL, 0x2472FFD7uLL);
  if (SecRandomCopyBytes(0, 0x10uLL, v3))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("failed to generate secure random bytes"), MEMORY[0x24BDBD1B8]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v3, 16, 1);
  v5 = -[GKARC4RandomSource initWithSeed:](self, "initWithSeed:", v4);

  return v5;
}

- (GKARC4RandomSource)initWithSeed:(NSData *)seed
{
  NSData *v4;
  GKARC4RandomSource *v5;
  Arc4State *v6;
  Arc4State *v7;
  char *v8;
  uint64_t v9;
  objc_super v11;

  v4 = seed;
  v11.receiver = self;
  v11.super_class = (Class)GKARC4RandomSource;
  v5 = -[GKRandomSource init](&v11, sel_init);
  if (v5)
  {
    v6 = (Arc4State *)malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
    v5->_state = v6;
    if (v6)
    {
      v7 = v6;
      *(_QWORD *)&v6->var0 = 0;
      v8 = (char *)malloc_type_malloc(0x100uLL, 0x716D9976uLL);
      v9 = 0;
      v7->var2 = v8;
      do
      {
        v7->var2[v9] = v9;
        ++v9;
      }
      while (v9 != 256);
    }
    -[GKARC4RandomSource setSeed:](v5, "setSeed:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  Arc4State *state;
  _QWORD *v6;
  _OWORD *v7;
  char *var2;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSeed:", self->_seed);
  state = self->_state;
  v6 = (_QWORD *)*((_QWORD *)result + 1);
  *v6 = *(_QWORD *)&state->var0;
  v7 = (_OWORD *)v6[1];
  var2 = state->var2;
  v10 = *((_OWORD *)var2 + 8);
  v9 = *((_OWORD *)var2 + 9);
  v11 = *((_OWORD *)var2 + 11);
  v7[10] = *((_OWORD *)var2 + 10);
  v7[11] = v11;
  v7[8] = v10;
  v7[9] = v9;
  v13 = *((_OWORD *)var2 + 4);
  v12 = *((_OWORD *)var2 + 5);
  v14 = *((_OWORD *)var2 + 7);
  v7[6] = *((_OWORD *)var2 + 6);
  v7[7] = v14;
  v7[4] = v13;
  v7[5] = v12;
  v16 = *(_OWORD *)var2;
  v15 = *((_OWORD *)var2 + 1);
  v17 = *((_OWORD *)var2 + 3);
  v7[2] = *((_OWORD *)var2 + 2);
  v7[3] = v17;
  *v7 = v16;
  v7[1] = v15;
  v18 = *((_OWORD *)var2 + 15);
  v20 = *((_OWORD *)var2 + 12);
  v19 = *((_OWORD *)var2 + 13);
  v7[14] = *((_OWORD *)var2 + 14);
  v7[15] = v18;
  v7[12] = v20;
  v7[13] = v19;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKARC4RandomSource)initWithCoder:(id)a3
{
  id v4;
  GKARC4RandomSource *v5;
  Arc4State *v6;
  Arc4State *v7;
  char *v8;
  uint64_t v9;
  const void *v10;
  size_t v11;
  unint64_t v13;

  v4 = a3;
  v5 = -[GKARC4RandomSource init](self, "init");
  if (v5)
  {
    v6 = (Arc4State *)malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
    v5->_state = v6;
    if (v6)
    {
      v7 = v6;
      *(_QWORD *)&v6->var0 = 0;
      v8 = (char *)malloc_type_malloc(0x100uLL, 0x716D9976uLL);
      v9 = 0;
      v7->var2 = v8;
      do
      {
        v7->var2[v9] = v9;
        ++v9;
      }
      while (v9 != 256);
    }
    v5->_state->var0 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("i"));
    v5->_state->var1 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("j"));
    v13 = 0;
    v10 = (const void *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("bytes"), &v13);
    if (v13 >= 0x100)
      v11 = 256;
    else
      v11 = v13;
    memcpy(v5->_state->var2, v10, v11);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKARC4RandomSource;
  v4 = a3;
  -[GKRandomSource encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt:forKey:", self->_state->var0, CFSTR("i"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt:forKey:", self->_state->var1, CFSTR("j"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_state->var2, 256, CFSTR("bytes"));

}

- (void)dealloc
{
  Arc4State *state;
  objc_super v4;

  state = self->_state;
  if (state->var2)
  {
    free(state->var2);
    state = self->_state;
  }
  free(state);
  v4.receiver = self;
  v4.super_class = (Class)GKARC4RandomSource;
  -[GKARC4RandomSource dealloc](&v4, sel_dealloc);
}

- (NSData)seed
{
  return self->_seed;
}

- (void)setSeed:(NSData *)seed
{
  NSData *v4;
  NSData *v5;
  Arc4State *state;
  unsigned __int8 *v7;
  NSUInteger v8;
  unint64_t v9;
  int v10;
  char *var2;
  int v12;
  NSData *v13;

  v13 = seed;
  v4 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithData:", v13);
  v5 = self->_seed;
  self->_seed = v4;

  state = self->_state;
  v7 = -[NSData bytes](self->_seed, "bytes");
  v8 = -[NSData length](self->_seed, "length");
  v9 = 0;
  v10 = 0;
  var2 = state->var2;
  do
  {
    v12 = var2[v9];
    v10 += v12 + v7[v9 % v8];
    var2[v9] = var2[v10];
    var2[v10] = v12;
    ++v9;
  }
  while (v9 != 255);

}

- (unint64_t)nextBits:(int)a3
{
  int v3;
  Arc4State *state;
  uint64_t v5;
  char *var2;
  unsigned int var0;
  uint64_t v8;
  char v9;
  unsigned __int8 v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  _BYTE v21[8];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a3 < 1)
    return 0;
  if (a3 >= 64)
    v3 = 64;
  else
    v3 = a3;
  state = self->_state;
  v5 = (v3 + 7) >> 3;
  var2 = state->var2;
  var0 = state->var0;
  v8 = (state->var0 + 1);
  v9 = var2[v8];
  v10 = v9 + LOBYTE(state->var1);
  var2[v8] = var2[v10];
  var2[v10] = v9;
  v21[0] = var2[(var2[v8] + v9)];
  if ((_DWORD)v5 != 1)
  {
    v8 = (var0 + 2);
    v11 = var2[v8];
    v10 += v11;
    var2[v8] = var2[v10];
    var2[v10] = v11;
    v21[1] = var2[(var2[v8] + v11)];
    if ((_DWORD)v5 != 2)
    {
      v8 = (var0 + 3);
      v12 = var2[v8];
      v10 += v12;
      var2[v8] = var2[v10];
      var2[v10] = v12;
      v21[2] = var2[(var2[v8] + v12)];
      if ((_DWORD)v5 != 3)
      {
        v8 = (var0 + 4);
        v13 = var2[v8];
        v10 += v13;
        var2[v8] = var2[v10];
        var2[v10] = v13;
        v21[3] = var2[(var2[v8] + v13)];
        if ((_DWORD)v5 != 4)
        {
          v8 = (var0 + 5);
          v14 = var2[v8];
          v10 += v14;
          var2[v8] = var2[v10];
          var2[v10] = v14;
          v21[4] = var2[(var2[v8] + v14)];
          if ((_DWORD)v5 != 5)
          {
            v8 = (var0 + 6);
            v15 = var2[v8];
            v10 += v15;
            var2[v8] = var2[v10];
            var2[v10] = v15;
            v21[5] = var2[(var2[v8] + v15)];
            if ((_DWORD)v5 != 6)
            {
              v8 = (var0 + 7);
              v16 = var2[v8];
              v10 += v16;
              var2[v8] = var2[v10];
              var2[v10] = v16;
              v21[6] = var2[(var2[v8] + v16)];
              if ((_DWORD)v5 != 7)
              {
                v8 = (var0 + 8);
                v17 = var2[v8];
                v10 += v17;
                var2[v8] = var2[v10];
                var2[v10] = v17;
                v21[7] = var2[(var2[v8] + v17)];
              }
            }
          }
        }
      }
    }
  }
  v18 = 0;
  v19 = 0;
  state->var0 = v8;
  state->var1 = v10;
  do
    v19 = v21[v18++] | (v19 << 8);
  while (v5 != v18);
  return v19 >> (((v3 + 7) & 0xF8u) - v3);
}

- (int64_t)nextInt
{
  Arc4State *state;
  char *var2;
  char var0;
  uint64_t v5;
  char v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unsigned __int8 v19;
  uint64_t v20;

  state = self->_state;
  var2 = state->var2;
  var0 = state->var0;
  v5 = (var0 + 1);
  v6 = var2[v5];
  v7 = v6 + LOBYTE(state->var1);
  var2[v5] = var2[v7];
  var2[v7] = v6;
  v8 = (var2[v5] + v6);
  v9 = (var0 + 2);
  v10 = var2[v9];
  v11 = v10 + v7;
  LODWORD(v8) = var2[v8];
  var2[v9] = var2[v11];
  var2[v11] = v10;
  v12 = var2[(var2[v9] + v10)];
  v13 = (var0 + 3);
  v14 = var2[v13];
  v15 = v14 + v11;
  var2[v13] = var2[v15];
  var2[v15] = v14;
  v16 = var2[(var2[v13] + v14)];
  v17 = (var0 + 4);
  v18 = var2[v17];
  v19 = v18 + v15;
  var2[v17] = var2[v19];
  var2[v19] = v18;
  v20 = var2[(var2[v17] + v18)];
  state->var0 = v17;
  state->var1 = v19;
  return (int)((_DWORD)v8 << 24) | (unint64_t)(v12 << 16) | (v16 << 8) | v20;
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  Arc4State *v4;
  char *v5;
  char v6;
  uint64_t v7;
  char v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unsigned __int8 v21;
  uint64_t v22;
  Arc4State *state;
  char *var2;
  char var0;
  uint64_t v26;
  char v27;
  unsigned __int8 v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unsigned __int8 v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  unsigned __int8 v40;
  uint64_t v41;
  unint64_t v42;

  if (a3 < 2)
    return 0;
  if ((a3 & (a3 - 1)) != 0)
  {
    do
    {
      state = self->_state;
      var2 = state->var2;
      var0 = state->var0;
      v26 = (var0 + 1);
      v27 = var2[v26];
      v28 = v27 + LOBYTE(state->var1);
      var2[v26] = var2[v28];
      var2[v28] = v27;
      v29 = var2[(var2[v26] + v27)];
      v30 = (var0 + 2);
      v31 = var2[v30];
      v32 = v31 + v28;
      var2[v30] = var2[v32];
      var2[v32] = v31;
      v33 = var2[(var2[v30] + v31)];
      v34 = (var0 + 3);
      v35 = var2[v34];
      v36 = v35 + v32;
      var2[v34] = var2[v36];
      var2[v36] = v35;
      v37 = var2[(var2[v34] + v35)];
      v38 = (var0 + 4);
      v39 = var2[v38];
      v40 = v39 + v36;
      var2[v38] = var2[v40];
      var2[v40] = v39;
      v41 = var2[(var2[v38] + v39)];
      state->var0 = v38;
      state->var1 = v40;
      v42 = (v29 << 24) | (v33 << 16) | (v37 << 8) | v41;
    }
    while (a3 - 1 + v42 < v42 % a3);
    return v42 % a3;
  }
  else
  {
    v4 = self->_state;
    v5 = v4->var2;
    v6 = v4->var0;
    v7 = (v6 + 1);
    v8 = v5[v7];
    v9 = v8 + LOBYTE(v4->var1);
    v5[v7] = v5[v9];
    v5[v9] = v8;
    v10 = v5[(v5[v7] + v8)];
    v11 = (v6 + 2);
    v12 = v5[v11];
    v13 = v12 + v9;
    v5[v11] = v5[v13];
    v5[v13] = v12;
    v14 = v5[(v5[v11] + v12)];
    v15 = (v6 + 3);
    v16 = v5[v15];
    v17 = v16 + v13;
    v5[v15] = v5[v17];
    v5[v17] = v16;
    v18 = v5[(v5[v15] + v16)];
    v19 = (v6 + 4);
    v20 = v5[v19];
    v21 = v20 + v17;
    v5[v19] = v5[v21];
    v5[v21] = v20;
    v22 = v5[(v5[v19] + v20)];
    v4->var0 = v19;
    v4->var1 = v21;
    return (((v10 << 24) | (v14 << 16) | (v18 << 8) | v22) * a3) >> 32;
  }
}

- (float)nextUniform
{
  Arc4State *state;
  char *var2;
  char var0;
  uint64_t v5;
  char v6;
  unsigned __int8 v7;
  uint64_t v8;
  char v9;
  unsigned __int8 v10;
  uint64_t v11;
  char v12;
  unsigned __int8 v13;

  state = self->_state;
  var2 = state->var2;
  var0 = state->var0;
  v5 = (var0 + 1);
  v6 = var2[v5];
  v7 = v6 + LOBYTE(state->var1);
  var2[v5] = var2[v7];
  var2[v7] = v6;
  LODWORD(v5) = var2[(var2[v5] + v6)];
  v8 = (var0 + 2);
  v9 = var2[v8];
  v10 = v9 + v7;
  var2[v8] = var2[v10];
  var2[v10] = v9;
  LODWORD(v8) = var2[(var2[v8] + v9)];
  v11 = (var0 + 3);
  v12 = var2[v11];
  v13 = v12 + v10;
  var2[v11] = var2[v13];
  var2[v13] = v12;
  LODWORD(var2) = var2[(var2[v11] + v12)];
  state->var0 = v11;
  state->var1 = v13;
  return (float)(((_DWORD)v5 << 16) | ((_DWORD)v8 << 8) | var2) * 0.000000059605;
}

- (BOOL)nextBool
{
  Arc4State *state;
  char *var2;
  uint64_t v4;
  char v5;
  unsigned __int8 v6;

  state = self->_state;
  var2 = state->var2;
  v4 = (state->var0 + 1);
  v5 = var2[v4];
  v6 = v5 + LOBYTE(state->var1);
  var2[v4] = var2[v6];
  var2[v6] = v5;
  LOBYTE(var2) = var2[(var2[v4] + v5)];
  state->var0 = v4;
  state->var1 = v6;
  return var2 & 1;
}

- (void)dropValuesWithCount:(NSUInteger)count
{
  Arc4State *state;
  unsigned int var1;
  uint64_t v5;
  char *var2;
  char v7;

  state = self->_state;
  LODWORD(v5) = state->var0;
  var1 = state->var1;
  if (count)
  {
    var2 = state->var2;
    do
    {
      v5 = (v5 + 1);
      v7 = var2[v5];
      LOBYTE(var1) = v7 + var1;
      var2[v5] = var2[var1];
      var2[var1] = v7;
      --count;
    }
    while (count);
    var1 = var1;
  }
  state->var0 = v5;
  state->var1 = var1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seed, 0);
}

@end
