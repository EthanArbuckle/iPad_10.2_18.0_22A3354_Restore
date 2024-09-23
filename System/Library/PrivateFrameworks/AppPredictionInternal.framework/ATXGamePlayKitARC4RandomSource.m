@implementation ATXGamePlayKitARC4RandomSource

- (ATXGamePlayKitARC4RandomSource)init
{
  void *v3;
  void *v4;
  ATXGamePlayKitARC4RandomSource *v5;
  id v7;

  v3 = malloc_type_malloc(0x10uLL, 0x64C0D958uLL);
  if (SecRandomCopyBytes(0, 0x10uLL, v3))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("failed to generate secure random bytes"), MEMORY[0x1E0C9AA70]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v3, 16, 1);
  v5 = -[ATXGamePlayKitARC4RandomSource initWithSeed:](self, "initWithSeed:", v4);

  return v5;
}

- (ATXGamePlayKitARC4RandomSource)initWithSeed:(id)a3
{
  id v4;
  ATXGamePlayKitARC4RandomSource *v5;
  Arc4State *v6;
  Arc4State *v7;
  char *v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXGamePlayKitARC4RandomSource;
  v5 = -[ATXGamePlayKitRandomSource init](&v11, sel_init);
  if (v5)
  {
    v6 = (Arc4State *)malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
    v7 = v6;
    v5->_state = v6;
    if (v6)
    {
      *(_QWORD *)&v6->var0 = 0;
      v8 = (char *)malloc_type_malloc(0x100uLL, 0x7B2B871FuLL);
      v9 = 0;
      v7->var2 = v8;
      do
      {
        v7->var2[v9] = v9;
        ++v9;
      }
      while (v9 != 256);
    }
    -[ATXGamePlayKitARC4RandomSource setSeed:](v5, "setSeed:", v4);
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

- (ATXGamePlayKitARC4RandomSource)initWithCoder:(id)a3
{
  id v4;
  ATXGamePlayKitARC4RandomSource *v5;
  Arc4State *v6;
  Arc4State *v7;
  char *v8;
  uint64_t v9;
  const void *v10;
  size_t v11;
  unint64_t v13;

  v4 = a3;
  v5 = -[ATXGamePlayKitARC4RandomSource init](self, "init");
  if (v5)
  {
    v6 = (Arc4State *)malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
    v7 = v6;
    v5->_state = v6;
    if (v6)
    {
      *(_QWORD *)&v6->var0 = 0;
      v8 = (char *)malloc_type_malloc(0x100uLL, 0x7B2B871FuLL);
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

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ATXGamePlayKitARC4RandomSource;
  -[ATXGamePlayKitRandomSource encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt:forKey:", self->_state->var0, CFSTR("i"));
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
  v4.super_class = (Class)ATXGamePlayKitARC4RandomSource;
  -[ATXGamePlayKitARC4RandomSource dealloc](&v4, sel_dealloc);
}

- (NSData)seed
{
  return self->_seed;
}

- (void)setSeed:(id)a3
{
  NSData *v4;
  NSData *seed;
  Arc4State *state;
  unsigned __int8 *v7;
  NSUInteger v8;
  unint64_t v9;
  int v10;
  char *var2;
  int v12;
  id v13;

  v13 = a3;
  v4 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", v13);
  seed = self->_seed;
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
  uint64_t v3;
  int v4;
  uint64_t v5;
  Arc4State *state;
  char *var2;
  uint64_t v8;
  unsigned int var1;
  char v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE v14[8];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 < 1)
    return 0;
  v3 = 0;
  if (a3 >= 64)
    v4 = 64;
  else
    v4 = a3;
  v5 = (v4 + 7) >> 3;
  state = self->_state;
  var2 = state->var2;
  LODWORD(v8) = state->var0;
  var1 = state->var1;
  do
  {
    v8 = (v8 + 1);
    v10 = var2[v8];
    LOBYTE(var1) = v10 + var1;
    var2[v8] = var2[var1];
    var2[var1] = v10;
    v14[v3++] = var2[(var2[v8] + v10)];
  }
  while (v5 != v3);
  v11 = 0;
  v12 = 0;
  state->var0 = v8;
  state->var1 = var1;
  do
    v12 = v14[v11++] | (v12 << 8);
  while (v5 != v11);
  return v12 >> (((v4 + 7) & 0xF8u) - v4);
}

- (int64_t)nextInt
{
  uint64_t v2;
  Arc4State *state;
  char *var2;
  uint64_t v5;
  unsigned int var1;
  char v7;
  _BYTE v9[4];

  v2 = 0;
  state = self->_state;
  var2 = state->var2;
  LODWORD(v5) = state->var0;
  var1 = state->var1;
  do
  {
    v5 = (v5 + 1);
    v7 = var2[v5];
    LOBYTE(var1) = v7 + var1;
    var2[v5] = var2[var1];
    var2[var1] = v7;
    v9[v2++] = var2[(var2[v5] + v7)];
  }
  while (v2 != 4);
  state->var0 = v5;
  state->var1 = var1;
  return (v9[0] << 24) | ((unint64_t)v9[1] << 16) | ((unint64_t)v9[2] << 8) | v9[3];
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  Arc4State *v5;
  char *v6;
  uint64_t v7;
  unsigned int v8;
  char v9;
  uint64_t v10;
  Arc4State *state;
  char *var2;
  uint64_t v13;
  unsigned int var1;
  char v15;
  unint64_t v16;
  unsigned int v18;

  if (a3 < 2)
    return 0;
  v18 = 0;
  if ((a3 & (a3 - 1)) != 0)
  {
    do
    {
      v10 = 0;
      state = self->_state;
      var2 = state->var2;
      LODWORD(v13) = state->var0;
      var1 = state->var1;
      do
      {
        v13 = (v13 + 1);
        v15 = var2[v13];
        LOBYTE(var1) = v15 + var1;
        var2[v13] = var2[var1];
        var2[var1] = v15;
        *((_BYTE *)&v18 + v10++) = var2[(var2[v13] + v15)];
      }
      while (v10 != 4);
      state->var0 = v13;
      state->var1 = var1;
      v16 = bswap32(v18);
      v3 = v16 % a3;
    }
    while (a3 - 1 + v16 < v16 % a3);
  }
  else
  {
    v4 = 0;
    v5 = self->_state;
    v6 = v5->var2;
    LODWORD(v7) = v5->var0;
    v8 = v5->var1;
    do
    {
      v7 = (v7 + 1);
      v9 = v6[v7];
      LOBYTE(v8) = v9 + v8;
      v6[v7] = v6[v8];
      v6[v8] = v9;
      *((_BYTE *)&v18 + v4++) = v6[(v6[v7] + v9)];
    }
    while (v4 != 4);
    v5->var0 = v7;
    v5->var1 = v8;
    return (bswap32(v18) * a3) >> 32;
  }
  return v3;
}

- (float)nextUniform
{
  uint64_t v2;
  Arc4State *state;
  char *var2;
  uint64_t v5;
  unsigned int var1;
  char v7;
  _BYTE v9[3];

  v2 = 0;
  state = self->_state;
  var2 = state->var2;
  LODWORD(v5) = state->var0;
  var1 = state->var1;
  do
  {
    v5 = (v5 + 1);
    v7 = var2[v5];
    LOBYTE(var1) = v7 + var1;
    var2[v5] = var2[var1];
    var2[var1] = v7;
    v9[v2++] = var2[(var2[v5] + v7)];
  }
  while (v2 != 3);
  state->var0 = v5;
  state->var1 = var1;
  return (float)((v9[0] << 16) | (v9[1] << 8) | v9[2]) / 16777000.0;
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

- (void)dropValuesWithCount:(unint64_t)a3
{
  Arc4State *state;
  unsigned int var1;
  uint64_t v5;
  char *var2;
  char v7;

  state = self->_state;
  LODWORD(v5) = state->var0;
  var1 = state->var1;
  if (a3)
  {
    var2 = state->var2;
    do
    {
      v5 = (v5 + 1);
      v7 = var2[v5];
      LOBYTE(var1) = v7 + var1;
      var2[v5] = var2[var1];
      var2[var1] = v7;
      --a3;
    }
    while (a3);
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
