@implementation MFFlagChangeObjectForFlagChangeDictionary

void __MFFlagChangeObjectForFlagChangeDictionary_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v3 = a2;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __MFFlagChangeObjectForFlagChangeDictionary_block_invoke_2;
  v6[3] = &unk_1E4E8B4D8;
  v7 = v3;
  v8 = v9;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  _Block_object_dispose(v9, 8);
}

void __MFFlagChangeObjectForFlagChangeDictionary_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("MessageIsRead")))
  {
    objc_msgSend(*(id *)(a1 + 32), "changesReadTo:", objc_msgSend(v5, "BOOLValue"));
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("MessageIsDeleted")))
  {
    objc_msgSend(*(id *)(a1 + 32), "changesDeletedTo:", objc_msgSend(v5, "BOOLValue"));
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("MessageWasRepliedTo")))
  {
    objc_msgSend(*(id *)(a1 + 32), "changesRepliedTo:", objc_msgSend(v5, "BOOLValue"));
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("MessageIsFlagged")))
  {
    objc_msgSend(*(id *)(a1 + 32), "changesFlaggedTo:", objc_msgSend(v5, "BOOLValue"));
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("MessageFlagColor")))
  {
    objc_msgSend(*(id *)(a1 + 32), "changesFlagColorTo:", objc_msgSend(v5, "unsignedIntegerValue"));
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("MessageWasForwarded")))
  {
    objc_msgSend(*(id *)(a1 + 32), "changesForwardedTo:", objc_msgSend(v5, "BOOLValue"));
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("MessageWasRedirected")))
  {
    objc_msgSend(*(id *)(a1 + 32), "changesRedirectedTo:", objc_msgSend(v5, "BOOLValue"));
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("MessageIsJunk")))
  {
    if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
    {
      v6 = 1;
LABEL_21:
      objc_msgSend(*(id *)(a1 + 32), "changesJunkLevelTo:", v6);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_26;
    }
LABEL_22:
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "changesJunkLevelTo:", 0);
    goto LABEL_26;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("MessageIsNotJunk")))
  {
    if (objc_msgSend(v5, "BOOLValue"))
    {
      v6 = 2;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("MessageChangeReason")))
    objc_msgSend(*(id *)(a1 + 32), "setReason:", objc_msgSend(v5, "integerValue"));
LABEL_26:

}

@end
