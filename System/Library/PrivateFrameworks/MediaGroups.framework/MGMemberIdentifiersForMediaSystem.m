@implementation MGMemberIdentifiersForMediaSystem

void __MGMemberIdentifiersForMediaSystem_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  MGGroupIdentifierForAccessory(a2, *(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "arrayByAddingObject:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = v7;
  }

}

@end
