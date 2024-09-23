@implementation AFMediaRemoteSendCommandNoCheck

void __AFMediaRemoteSendCommandNoCheck_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    AFCommandOutcomeFromMediaRemoteStatuses(a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
}

@end
