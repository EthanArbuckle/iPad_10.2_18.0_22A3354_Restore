@implementation PARSession

uint64_t __48__PARSession_FCAddition__fc_sharedParsecSession__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D177D8], "sharedSession");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8480;
  qword_1ED0F8480 = v0;

  return objc_msgSend((id)qword_1ED0F8480, "start");
}

@end
