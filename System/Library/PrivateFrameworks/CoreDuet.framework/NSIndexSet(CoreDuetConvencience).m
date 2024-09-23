@implementation NSIndexSet(CoreDuetConvencience)

- (id)_cd_commaSeparatedIndexes
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;
  _QWORD *v7;
  _QWORD v8[3];
  char v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 1;
  v2 = (void *)objc_opt_new();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__NSIndexSet_CoreDuetConvencience___cd_commaSeparatedIndexes__block_invoke;
  v5[3] = &unk_1E26E2DA0;
  v7 = v8;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v5);

  _Block_object_dispose(v8, 8);
  return v3;
}

@end
