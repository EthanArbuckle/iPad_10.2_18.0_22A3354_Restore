@implementation MPRemotePlaybackQueue

void __87__MPRemotePlaybackQueue_MPCAdditions__getRemoteRepresentationForPlayerPath_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    objc_msgSend(v8, "getRemotePlaybackQueueRepresentationWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else if (v6)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      (*(void (**)(_QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(a1 + 40), 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
  }

}

@end
