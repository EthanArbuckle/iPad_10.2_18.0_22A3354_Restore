@implementation C3DRasterizerStatesCreate

CFMutableSetRef __C3DRasterizerStatesCreate_block_invoke()
{
  __int128 v0;
  CFMutableSetRef result;
  CFSetCallBacks v2;

  v0 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
  *(_OWORD *)&v2.version = *MEMORY[0x1E0C9B3B0];
  *(_OWORD *)&v2.release = v0;
  *(_OWORD *)&v2.equal = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 32);
  v2.retain = 0;
  v2.release = 0;
  result = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v2);
  s_RasterizerStatesRegistry = (uint64_t)result;
  return result;
}

@end
