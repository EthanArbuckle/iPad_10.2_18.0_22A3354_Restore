@implementation IFAsyncArrayTransform

void ___IFAsyncArrayTransform_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  _QWORD *v7;
  id v8;

  if (*(_BYTE *)(a1 + 64))
  {
    v6 = objc_msgSend(a2, "count");
    v7 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * *(_QWORD *)(a1 + 56));
    if (a3 && !v6)
      goto LABEL_4;
LABEL_6:
    v8 = a2;
    *v7 = 0;
    goto LABEL_7;
  }
  v7 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * *(_QWORD *)(a1 + 56));
  if (a2)
    goto LABEL_6;
LABEL_4:
  v8 = a3;
  *v7 = 1;
LABEL_7:
  v7[1] = v8;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void ___IFAsyncArrayTransform_block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  _QWORD *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (*(_QWORD *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = (_QWORD *)(*(_QWORD *)(a1 + 56) + v3);
      v7 = (void *)v6[1];
      if (*v6 == 1)
      {
        if (v7)
        {

          v4 = v7;
        }
      }
      else if (*(_BYTE *)(a1 + 64))
      {
        if (v7)
          objc_msgSend(v2, "addObjectsFromArray:", v7);
      }
      else
      {
        objc_msgSend(v2, "addObject:", v7);
      }

      ++v5;
      v3 += 16;
    }
    while (v5 < *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4 = 0;
  }
  free(*(void **)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

@end
