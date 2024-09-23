@implementation MRMediaRemoteServiceTriggerAudioFade

void __MRMediaRemoteServiceTriggerAudioFade_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    objc_msgSend(v3, "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);

  }
}

@end
