@implementation MRUIsSmallScreenWithScale

uint64_t __MRUIsSmallScreenWithScale_block_invoke()
{
  void *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  MRUIsSmallScreenWithScale___isPhone = objc_msgSend(v0, "userInterfaceIdiom") == 0;

  result = CCUIReferenceScreenBounds();
  MRUIsSmallScreenWithScale___referenceScreenBounds_0 = v2;
  MRUIsSmallScreenWithScale___referenceScreenBounds_1 = v3;
  MRUIsSmallScreenWithScale___referenceScreenBounds_2 = v4;
  MRUIsSmallScreenWithScale___referenceScreenBounds_3 = v5;
  return result;
}

@end
