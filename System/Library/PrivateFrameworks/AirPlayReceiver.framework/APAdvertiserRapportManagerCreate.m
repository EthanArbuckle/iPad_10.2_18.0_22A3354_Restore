@implementation APAdvertiserRapportManagerCreate

void __APAdvertiserRapportManagerCreate_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(v2 + 81) = APSSettingsGetInt64() != 0;
  APAdvertiserRapportManager_update(v2);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

@end
