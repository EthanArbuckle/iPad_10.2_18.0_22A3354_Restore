@implementation MGMemberIdentifiersForRoomInHome

void __MGMemberIdentifiersForRoomInHome_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  MGGroupIdentifierForAccessory(a2, *(void **)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("com.apple.media-group.solo-Accessory"), "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "arrayByAddingObject:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

@end
