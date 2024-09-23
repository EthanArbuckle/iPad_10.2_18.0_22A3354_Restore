@implementation MPMusicPlayerRadioStationQueueDescriptor(MPCModelPlaybackAdditions)

- (id)playbackContexts
{
  MPCModelRadioPlaybackContext *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MPCModelRadioPlaybackContext);
  v3 = objc_alloc(MEMORY[0x24BDDC988]);
  v4 = objc_alloc(MEMORY[0x24BDDC758]);
  objc_msgSend(MEMORY[0x24BDDC990], "identityKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __87__MPMusicPlayerRadioStationQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke;
  v16[3] = &unk_24CAB8A40;
  v16[4] = a1;
  v7 = (void *)objc_msgSend(v4, "initWithSource:modelKind:block:", CFSTR("MPMusicPlayerQueueDescriptor"), v5, v16);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __87__MPMusicPlayerRadioStationQueueDescriptor_MPCModelPlaybackAdditions__playbackContexts__block_invoke_3;
  v15[3] = &unk_24CAB4FB8;
  v15[4] = a1;
  v8 = (void *)objc_msgSend(v3, "initWithIdentifiers:block:", v7, v15);
  -[MPCModelRadioPlaybackContext setRadioStation:](v2, "setRadioStation:", v8);

  -[MPCModelRadioPlaybackContext playbackRequestEnvironment](v2, "playbackRequestEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (objc_msgSend(a1, "isPrivate"))
    -[MPCModelRadioPlaybackContext setPrivateListeningOverride:](v2, "setPrivateListeningOverride:", MEMORY[0x24BDBD1C8]);
  objc_msgSend(a1, "_addRequestingBundleIdentifierToPlaybackRequestEnvironment:", v10);
  objc_msgSend(a1, "playActivityFeatureName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioPlaybackContext setPlayActivityFeatureName:](v2, "setPlayActivityFeatureName:", v11);

  objc_msgSend(a1, "playActivityQueueGroupingID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioPlaybackContext setPlayActivityQueueGroupingID:](v2, "setPlayActivityQueueGroupingID:", v12);

  -[MPCModelRadioPlaybackContext setPlaybackRequestEnvironment:](v2, "setPlaybackRequestEnvironment:", v10);
  -[MPCModelRadioPlaybackContext setQueueDescriptor:](v2, "setQueueDescriptor:", a1);
  v17[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
