@implementation CAMDebugStringForPreviewConfiguration

void __CAMDebugStringForPreviewConfiguration_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (a3)
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("/%@"), a2);
  else
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("%@"), a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
