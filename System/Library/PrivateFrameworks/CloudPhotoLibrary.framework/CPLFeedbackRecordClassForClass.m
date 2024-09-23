@implementation CPLFeedbackRecordClassForClass

void ___CPLFeedbackRecordClassForClass_block_invoke_26(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend((id)_CPLFeedbackRecordClassForClass_mapping, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    NSStringFromClass(*(Class *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("Change"), &stru_1E60DF6B8, 0, 0, objc_msgSend(v6, "length"));
    objc_msgSend((id)_CPLFeedbackRecordClassForClass_mapping, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void ___CPLFeedbackRecordClassForClass_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.quarantinefeedback", 0);
  v1 = (void *)_CPLFeedbackRecordClassForClass_queue;
  _CPLFeedbackRecordClassForClass_queue = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)_CPLFeedbackRecordClassForClass_mapping;
  _CPLFeedbackRecordClassForClass_mapping = (uint64_t)v2;

}

@end
