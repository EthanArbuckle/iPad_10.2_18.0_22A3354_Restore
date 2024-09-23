@implementation NSIndexSet(IC)

- (id)ic_rangeArray
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__NSIndexSet_IC__ic_rangeArray__block_invoke;
  v6[3] = &unk_1EA824EC0;
  v7 = v2;
  v3 = v2;
  objc_msgSend(a1, "enumerateRangesUsingBlock:", v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

@end
