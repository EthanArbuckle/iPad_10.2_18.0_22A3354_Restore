@implementation C3DFXMetalProgramUpdateHashWithSource

CFHashCode ___C3DFXMetalProgramUpdateHashWithSource_block_invoke(uint64_t a1, CFTypeRef cf, const void *a3)
{
  CFHashCode v5;
  CFHashCode result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = CFHash(cf);
  result = CFHash(a3);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = 0x9DDFEA08EB382D69
     * (*(_QWORD *)(v7 + 56) ^ ((0x9DDFEA08EB382D69 * (*(_QWORD *)(v7 + 56) ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                             * (*(_QWORD *)(v7 + 56) ^ v5)));
  *(_QWORD *)(v7 + 56) = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(_QWORD *)(v9 + 56);
  *(_QWORD *)(v9 + 56) = 0x9DDFEA08EB382D69
                       * ((0x9DDFEA08EB382D69
                         * (v10 ^ ((0x9DDFEA08EB382D69 * (v10 ^ result)) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                   * (v10 ^ result)))) ^ ((0x9DDFEA08EB382D69 * (v10 ^ ((0x9DDFEA08EB382D69 * (v10 ^ result)) >> 47) ^ (0x9DDFEA08EB382D69 * (v10 ^ result)))) >> 47));
  return result;
}

@end
