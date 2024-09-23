@implementation AVAsynchronousLocalizedString

uint64_t __AVAsynchronousLocalizedString_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __AVAsynchronousLocalizedString_block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  AVLocalizedString(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __AVAsynchronousLocalizedString_block_invoke_3;
  v5[3] = &unk_1E5BB4C10;
  v3 = *(id *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __AVAsynchronousLocalizedString_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.avkit.localizedStringBundleQueue", v2);
  v1 = (void *)AVAsynchronousLocalizedString_localizedStringBackgroundQ;
  AVAsynchronousLocalizedString_localizedStringBackgroundQ = (uint64_t)v0;

}

@end
