@implementation NSArray

void __77__NSArray__AX_HA_PROGRAMS_ARRAY___setProgram_withOtherSidePrograms_selected___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  char v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a2;
  v5 = v4;
  v10 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
  {
    v6 = objc_msgSend(v4, "isStreamOrMixingStream");
    v5 = v10;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
      v5 = v10;
    }
  }
  v7 = objc_msgSend(v5, "isSelected");
  v8 = v10;
  if (v7)
  {
    if (objc_msgSend(v10, "isStreamOrMixingStream"))
      v9 = a1[5];
    else
      v9 = a1[6];
    objc_storeStrong((id *)(*(_QWORD *)(v9 + 8) + 40), a2);
    v8 = v10;
  }

}

void __77__NSArray__AX_HA_PROGRAMS_ARRAY___setProgram_withOtherSidePrograms_selected___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  char v6;
  int v7;
  uint64_t v8;
  id v9;

  v4 = a2;
  v5 = v4;
  v9 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v6 = objc_msgSend(v4, "isStreamOrMixingStream");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      v5 = v9;
    }
  }
  v7 = objc_msgSend(v5, "index");
  if (v7 != objc_msgSend(*(id *)(a1 + 32), "index") && objc_msgSend(v9, "isSelected"))
  {
    if (objc_msgSend(v9, "isMixingStream"))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    if (objc_msgSend(v9, "isStreamOrMixingStream"))
      v8 = *(_QWORD *)(a1 + 56);
    else
      v8 = *(_QWORD *)(a1 + 64);
    objc_storeStrong((id *)(*(_QWORD *)(v8 + 8) + 40), a2);
  }

}

void __61__NSArray__AX_HA_PROGRAMS_ARRAY___programThatMatchesProgram___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  id v8;

  v8 = a2;
  v7 = objc_msgSend(v8, "index");
  if (v7 == objc_msgSend(*(id *)(a1 + 32), "index"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
