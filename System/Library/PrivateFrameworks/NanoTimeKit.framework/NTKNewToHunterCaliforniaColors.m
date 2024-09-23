@implementation NTKNewToHunterCaliforniaColors

void ___NTKNewToHunterCaliforniaColors_block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[2];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = xmmword_1B755F970;
  v2[1] = xmmword_1B755F980;
  v3 = 3014;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKNewToHunterCaliforniaColors_colors;
  _NTKNewToHunterCaliforniaColors_colors = v0;

}

@end
