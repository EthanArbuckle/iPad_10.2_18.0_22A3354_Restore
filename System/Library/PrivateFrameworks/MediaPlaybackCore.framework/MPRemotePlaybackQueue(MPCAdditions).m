@implementation MPRemotePlaybackQueue(MPCAdditions)

- (void)getRemoteRepresentationForPlayerPath:()MPCAdditions completion:
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__MPRemotePlaybackQueue_MPCAdditions__getRemoteRepresentationForPlayerPath_completion___block_invoke;
  v7[3] = &unk_24CAB7CC0;
  v8 = 0;
  v9 = v5;
  v6 = v5;
  objc_msgSend(a1, "getMusicPlaybackContextWithOptions:completion:", 0, v7);

}

- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = a4;
  objc_msgSend(v6, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 58, CFSTR("RemotePlaybackQueue doesn't support conversion to music playback context: %@"), a1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, id))a4)[2](v7, 0, v8);

}

+ (id)inProcessPlaybackContext:()MPCAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("playbackContext"));
  objc_msgSend(v4, "siriReferenceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE658D8]);

  objc_msgSend(v4, "privateListeningOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE65970]);
  v8 = objc_alloc(MEMORY[0x24BDDC728]);
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_msgSend(v8, "initWithIdentifier:data:options:", CFSTR("InProcess-com.apple.mediaplayer.playbackcontext"), v9, v5);

  return v10;
}

@end
