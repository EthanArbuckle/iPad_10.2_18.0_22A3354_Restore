@implementation C2CallstackAnnotations

+ (void)annotateCallstackForContainerType:(int64_t)a3 block:(id)a4
{
  id v4;

  v4 = a4;
  c2_callstack_annotation_ThirdParty((uint64_t)v4);

}

+ (id)annotateBlockForContainerType:(int64_t)a3 block:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__C2CallstackAnnotations_annotateBlockForContainerType_block___block_invoke;
  v9[3] = &unk_1E98992C8;
  v10 = v5;
  v11 = a3;
  v6 = v5;
  v7 = _Block_copy(v9);

  return v7;
}

uint64_t __62__C2CallstackAnnotations_annotateBlockForContainerType_block___block_invoke(uint64_t a1)
{
  return c2_callstack_annotation_ThirdParty(*(_QWORD *)(a1 + 32));
}

@end
