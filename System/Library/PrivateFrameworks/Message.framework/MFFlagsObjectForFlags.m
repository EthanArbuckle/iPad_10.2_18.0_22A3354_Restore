@implementation MFFlagsObjectForFlags

void __MFFlagsObjectForFlags_block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setRead:", *(_DWORD *)(a1 + 32) & 1);
  objc_msgSend(v5, "setDeleted:", (*(_QWORD *)(a1 + 32) >> 1) & 1);
  objc_msgSend(v5, "setReplied:", (*(_QWORD *)(a1 + 32) >> 2) & 1);
  objc_msgSend(v5, "setFlagged:", (*(_QWORD *)(a1 + 32) >> 4) & 1);
  objc_msgSend(v5, "setFlagColor:", (*(_QWORD *)(a1 + 32) >> 41) & 7);
  objc_msgSend(v5, "setDraft:", (*(_QWORD *)(a1 + 32) >> 6) & 1);
  objc_msgSend(v5, "setForwarded:", (*(_QWORD *)(a1 + 32) >> 8) & 1);
  objc_msgSend(v5, "setRedirected:", (*(_QWORD *)(a1 + 32) >> 9) & 1);
  v3 = *(_QWORD *)(a1 + 32);
  if ((v3 & 0x200000) != 0)
    v4 = 1;
  else
    v4 = (v3 >> 30) & 2;
  objc_msgSend(v5, "setJunkLevel:", v4);

}

@end
