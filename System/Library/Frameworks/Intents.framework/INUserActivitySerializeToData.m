@implementation INUserActivitySerializeToData

void __INUserActivitySerializeToData_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __INUserActivitySerializeToData_block_invoke_2;
  v5[3] = &unk_1E228F700;
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  if ((objc_msgSend(v2, "_createUserActivityDataWithOptions:completionHandler:", 0, v5) & 1) == 0)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

intptr_t __INUserActivitySerializeToData_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 && !a3)
  {
    v4 = objc_msgSend(a2, "copy");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
