@implementation MPModelRequest(MPCPlaybackIntent)

- (MPCPlaybackIntent)playbackIntentWithStartItemIdentifiers:()MPCPlaybackIntent
{
  id v4;
  MPCPlaybackIntent *v5;
  MPCModelPlaybackIntentTracklistToken *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  v4 = a3;
  v5 = objc_alloc_init(MPCPlaybackIntent);
  v6 = objc_alloc_init(MPCModelPlaybackIntentTracklistToken);
  -[MPCModelPlaybackIntentTracklistToken setRequest:](v6, "setRequest:", a1);
  -[MPCModelPlaybackIntentTracklistToken setStartItemIdentifiers:](v6, "setStartItemIdentifiers:", v4);

  -[MPCPlaybackIntent setTracklistSource:](v5, "setTracklistSource:", 3);
  -[MPCPlaybackIntent setTracklistToken:](v5, "setTracklistToken:", v6);
  objc_msgSend(a1, "itemKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identityKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDCA30], "identityKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v9))
  {

LABEL_4:
    -[MPCPlaybackIntent setPrefersEnqueuingUsingAirPlay:](v5, "setPrefersEnqueuingUsingAirPlay:", 1);
    goto LABEL_5;
  }
  objc_msgSend(a1, "itemKind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identityKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC920], "identityKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
    goto LABEL_4;
LABEL_5:

  return v5;
}

@end
