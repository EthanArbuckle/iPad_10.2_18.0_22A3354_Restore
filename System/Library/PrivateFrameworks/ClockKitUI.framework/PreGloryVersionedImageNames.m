@implementation PreGloryVersionedImageNames

void ___PreGloryVersionedImageNames_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E86EF780);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PreGloryVersionedImageNames___preGloryVersionedImages;
  _PreGloryVersionedImageNames___preGloryVersionedImages = v0;

}

@end
