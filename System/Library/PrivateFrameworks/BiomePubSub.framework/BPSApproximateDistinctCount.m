@implementation BPSApproximateDistinctCount

- (BPSApproximateDistinctCount)initWithHllState:(hll_state *)a3
{
  BPSApproximateDistinctCount *v4;
  hll_state *v5;
  __int128 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BPSApproximateDistinctCount;
  v4 = -[BPSApproximateDistinctCount init](&v8, sel_init);
  if (v4)
  {
    v5 = (hll_state *)malloc_type_calloc(1uLL, 0x20uLL, 0x1000040E0EAB150uLL);
    v4->_hllState = v5;
    if (!v5)
      abort();
    if (a3)
    {
      v6 = *(_OWORD *)&a3->var0[16];
      *(_OWORD *)v5->var0 = *(_OWORD *)a3->var0;
      *(_OWORD *)&v5->var0[16] = v6;
    }
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (BPSApproximateDistinctCount)init
{
  return -[BPSApproximateDistinctCount initWithHllState:](self, "initWithHllState:", 0);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_hllState);
  v3.receiver = self;
  v3.super_class = (Class)BPSApproximateDistinctCount;
  -[BPSApproximateDistinctCount dealloc](&v3, sel_dealloc);
}

- (void)addValue:(unsigned int)a3
{
  os_unfair_lock_s *p_lock;
  unsigned int v5;
  hll_state *hllState;
  unint64_t v7;
  unsigned int v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = _PASMurmur3_x86_32();
  hllState = self->_hllState;
  v7 = (unint64_t)v5 >> 27;
  v8 = (__clz(v5 & 0x7FFFFFF) - 4);
  if (v8 <= hllState->var0[v7])
    LOBYTE(v8) = hllState->var0[v7];
  hllState->var0[v7] = v8;
  os_unfair_lock_unlock(p_lock);
}

- (void)addData:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  unsigned int v6;
  hll_state *hllState;
  unint64_t v8;
  unsigned int v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");

  v6 = _PASMurmur3_x86_32();
  hllState = self->_hllState;
  v8 = (unint64_t)v6 >> 27;
  v9 = (__clz(v6 & 0x7FFFFFF) - 4);
  if (v9 <= hllState->var0[v8])
    LOBYTE(v9) = hllState->var0[v8];
  hllState->var0[v8] = v9;
  os_unfair_lock_unlock(p_lock);
}

- (double)approximateDistinctCount
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  unint64_t v5;
  hll_state *hllState;
  double v7;
  double v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = 0;
  v5 = 0;
  hllState = self->_hllState;
  v7 = 0.0;
  do
  {
    if (!hllState->var0[v4])
      ++v5;
    v7 = v7 + exp2(-(double)hllState->var0[v4++]);
  }
  while (v4 != 32);
  v8 = 0.697 / v7 * 32.0 * 32.0;
  if (v8 <= 80.0 && v5 != 0)
    v8 = log(32.0 / (double)v5) * 32.0;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)countMapFull
{
  os_unfair_lock_s *p_lock;
  hll_state *hllState;
  unint64_t v5;
  unsigned __int8 *v6;
  unint64_t v7;
  int v8;
  BOOL v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  hllState = self->_hllState;
  if (hllState->var0[0] == 31)
  {
    v5 = 0;
    v6 = &hllState->var0[1];
    do
    {
      v7 = v5;
      if (v5 == 31)
        break;
      v8 = v6[v5++];
    }
    while (v8 == 31);
    v9 = v7 > 0x1E;
  }
  else
  {
    v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)printState
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  hll_state *hllState;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = 0;
  hllState = self->_hllState;
  do
  {
    printf("%d:\t%u\n", v4, hllState->var0[v4]);
    ++v4;
  }
  while (v4 != 32);
  os_unfair_lock_unlock(p_lock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeInt:forKey:", 5, CFSTR("hllRegisterBitWidth"));
  objc_msgSend(v5, "encodeInt:forKey:", 32, CFSTR("hllRegisterCount"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", self->_hllState, 32, CFSTR("hllData"));

  os_unfair_lock_unlock(p_lock);
}

- (BPSApproximateDistinctCount)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  BPSApproximateDistinctCount *v6;
  NSObject *v7;
  NSObject *v9;
  uint64_t v10;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntForKey:", CFSTR("hllRegisterBitWidth")) != 5)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BPSApproximateDistinctCount initWithCoder:].cold.3();
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "decodeIntForKey:", CFSTR("hllRegisterCount")) != 32)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BPSApproximateDistinctCount initWithCoder:].cold.2();
LABEL_9:

LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v10 = 0;
  v5 = objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("hllData"), &v10);
  if (v10 != 32)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BPSApproximateDistinctCount initWithCoder:].cold.1(&v10, v9);

    goto LABEL_10;
  }
  self = -[BPSApproximateDistinctCount initWithHllState:](self, "initWithHllState:", v5);
  v6 = self;
LABEL_11:

  return v6;
}

- (void)setApproximateDistinctCount:(double)a3
{
  self->_approximateDistinctCount = a3;
}

- (void)setCountMapFull:(BOOL)a3
{
  self->_countMapFull = a3;
}

- (void)initWithCoder:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134218240;
  v4 = v2;
  v5 = 2048;
  v6 = 32;
  _os_log_error_impl(&dword_1A956A000, a2, OS_LOG_TYPE_ERROR, "Mismatch between encoded HyperLogLog data size %zu and current expected size %lu", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithCoder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1A956A000, v0, v1, "Mismatch between encoded HyperLogLog register count %u and current count %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithCoder:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1A956A000, v0, v1, "Mismatch between encoded HyperLogLog register width %u and current width %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
