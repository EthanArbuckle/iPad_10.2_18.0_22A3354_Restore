@implementation NSIndexSet(JSON)

- (id)atx_asArray
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__NSIndexSet_JSON__atx_asArray__block_invoke;
  v6[3] = &unk_1E4D57AF0;
  v7 = v2;
  v3 = v2;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

@end
