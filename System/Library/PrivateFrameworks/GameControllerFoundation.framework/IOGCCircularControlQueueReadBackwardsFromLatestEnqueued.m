@implementation IOGCCircularControlQueueReadBackwardsFromLatestEnqueued

uint64_t __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12)
{
  unint64_t v12;
  uint64_t v16;
  unsigned int v18;
  _QWORD v22[7];
  _QWORD v23[9];

  v12 = a10;
  if (a10 == -1)
    return 3758097112;
  if (a10 < a8)
  {
LABEL_9:
    if (*(_BYTE *)(a1 + 40))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 0x40000000;
      v22[2] = __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke_3;
      v22[3] = &unk_1EA4D39D0;
      v22[4] = *(_QWORD *)(a1 + 32);
      v22[5] = v12;
      v22[6] = a7;
      v18 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(a12 + 16))(a12, a6, v22);
      if (v18 == -536870166)
        return 3758097136;
      else
        return v18;
    }
    else
    {
      return 3758097136;
    }
  }
  else
  {
    while (1)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 0x40000000;
      v23[2] = __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke_2;
      v23[3] = &unk_1EA4D39A8;
      v23[4] = *(_QWORD *)(a1 + 32);
      v23[5] = v12;
      v23[6] = a7;
      v23[7] = a9;
      v16 = (*(uint64_t (**)(uint64_t, unint64_t, _QWORD *))(a12 + 16))(a12, v12, v23);
      if ((_DWORD)v16 != -536870166 && (_DWORD)v16 != -536870184)
        return v16;
      if (--v12 < a8)
        goto LABEL_9;
    }
  }
}

uint64_t __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    return 3758097130;
  result = 0;
  **(_QWORD **)(a1 + 48) = *(_QWORD *)(a1 + 40);
  atomic_store(*(_QWORD *)(a1 + 40) + 1, *(unint64_t **)(a1 + 56));
  return result;
}

uint64_t __IOGCCircularControlQueueReadBackwardsFromLatestEnqueued_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    return 3758097130;
  result = 0;
  **(_QWORD **)(a1 + 48) = *(_QWORD *)(a1 + 40);
  return result;
}

@end
