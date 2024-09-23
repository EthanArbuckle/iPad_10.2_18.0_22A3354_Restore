@implementation UIImageWithContentsOfFile

void __UIImageWithContentsOfFile_block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = (id)objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable", a1, a1);
  v2 = (void *)UIImageWithContentsOfFile_pathToWeakImageMap;
  UIImageWithContentsOfFile_pathToWeakImageMap = (uint64_t)v1;

  v3 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v4 = (void *)UIImageWithContentsOfFile_lock;
  UIImageWithContentsOfFile_lock = (uint64_t)v3;

}

@end
