@implementation FigNeroPlayServerEnqueueAudioBufferOnValeria

void ___FigNeroPlayServerEnqueueAudioBufferOnValeria_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  const void *v5;
  const void *v6;

  v2 = a1[5];
  v3 = *(_QWORD *)(a1[4] + 32);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v4)
    v4(v3, v2);
  v5 = (const void *)a1[5];
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[6];
  if (v6)
    CFRelease(v6);
}

@end
