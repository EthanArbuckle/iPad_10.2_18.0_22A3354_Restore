@implementation BRPerformWithPersonaAndErrorForURLIfAble

void __BRPerformWithPersonaAndErrorForURLIfAble_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "personaIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, uint64_t, id))(v2 + 16))(v2, v5, 1, 1, v4);

}

@end
