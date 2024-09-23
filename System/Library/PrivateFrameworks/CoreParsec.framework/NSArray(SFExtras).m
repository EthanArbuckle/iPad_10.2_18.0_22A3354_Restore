@implementation NSArray(SFExtras)

- (id)sf_asCardSections:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__NSArray_SFExtras__sf_asCardSections___block_invoke;
  v8[3] = &unk_1E3921F60;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "parsec_mapAndFilterObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
