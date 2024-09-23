@implementation MPMusicPlayerPlaybackArchiveQueueDescriptor(MPCModelPlaybackAdditions)

- (id)playbackContexts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  objc_msgSend(a1, "playbackArchive");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackSessionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MSVUnarchivedObjectOfClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setShuffleType:", objc_msgSend(a1, "shuffleType"));
  objc_msgSend(v4, "setRepeatType:", objc_msgSend(a1, "repeatType"));
  objc_msgSend(a1, "playActivityFeatureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "playActivityFeatureName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlayActivityFeatureName:", v6);

  }
  objc_msgSend(a1, "playActivityQueueGroupingID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "playActivityQueueGroupingID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPlayActivityQueueGroupingID:", v8);

  }
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
