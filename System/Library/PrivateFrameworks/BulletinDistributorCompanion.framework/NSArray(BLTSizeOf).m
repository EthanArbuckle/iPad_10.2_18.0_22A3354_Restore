@implementation NSArray(BLTSizeOf)

- (uint64_t)blt_sizeof
{
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  size_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v8 = malloc_size(a1);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__NSArray_BLTSizeOf__blt_sizeof__block_invoke;
  v4[3] = &unk_24D763DD0;
  v4[4] = &v5;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end
