@implementation MainScreenReferenceBounds

void ___MainScreenReferenceBounds_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE38400]), "initWithCADisplay:", v5);
  objc_msgSend(v0, "bounds");
  _MainScreenReferenceBounds___bounds_0 = v1;
  _MainScreenReferenceBounds___bounds_1 = v2;
  _MainScreenReferenceBounds___bounds_2 = v3;
  _MainScreenReferenceBounds___bounds_3 = v4;

}

@end
