@implementation AVTGetNeutralZ

void __AVTGetNeutralZ_block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 1)
    AVTGetNeutralZ_avt_neutral_z = -1091693445;
}

@end
