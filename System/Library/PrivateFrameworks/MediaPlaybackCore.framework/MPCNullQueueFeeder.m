@implementation MPCNullQueueFeeder

uint64_t __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_4;
  v4[3] = &unk_24CAB9380;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "applyChanges:identifierSetLookupBlock:", v2, v4);
}

const __CFString *__48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_MPCNullPlaybackContext.m"), 137, CFSTR("No item lookups allowed for _MPCNullQueueFeeder."));

  return &stru_24CABB5D0;
}

uint64_t __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_4(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_MPCNullPlaybackContext.m"), 132, CFSTR("No identifier set lookups allowed for _MPCNullQueueFeeder."));

  return objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
}

uint64_t __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_2()
{
  return 0;
}

uint64_t __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke()
{
  return 0;
}

@end
