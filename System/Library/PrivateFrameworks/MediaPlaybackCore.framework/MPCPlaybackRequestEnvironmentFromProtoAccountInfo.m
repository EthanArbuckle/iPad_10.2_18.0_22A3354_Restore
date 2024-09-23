@implementation MPCPlaybackRequestEnvironmentFromProtoAccountInfo

void ____MPCPlaybackRequestEnvironmentFromProtoAccountInfo_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  MPCPlaybackRequestEnvironment *v8;
  MPCPlaybackRequestEnvironment *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v6 = (void *)MEMORY[0x24BDBD1C8];
    }
    else
    {
      v7 = *(_QWORD *)(a1 + 32);
      if (v7 && (*(_BYTE *)(v7 + 116) & 8) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(v7 + 112));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }
    v8 = (MPCPlaybackRequestEnvironment *)*(id *)(a1 + 40);
    if (!v8)
    {
      if (*(_QWORD *)(a1 + 48))
      {
        v9 = [MPCPlaybackRequestEnvironment alloc];
        objc_msgSend(*(id *)(a1 + 48), "userIdentity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[MPCPlaybackRequestEnvironment initWithUserIdentity:](v9, "initWithUserIdentity:", v10);

      }
      else
      {
        v8 = 0;
      }
    }
    if (!*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void __MPCPlaybackRequestEnvironmentFromProtoAccountInfo(_MPCProtoDelegateInfo *__strong, MPRemotePlaybackQueuePlaybackContextOptions, void (^__strong)(MPCPlaybackRequestEnvironment * _Nullable __strong, NSNumber * _Nullable __strong, NSError * _Nullable __strong))_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("MPRemotePlaybackQueue+MPCAdditions.m"), 343, CFSTR("Failed to produce playback request environment for accountInfo: %@, desiredAccount: %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

@end
