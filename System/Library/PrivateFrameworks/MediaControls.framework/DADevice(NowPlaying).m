@implementation DADevice(NowPlaying)

- (id)nowPlayingSubtitle
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  if (!objc_msgSend(a1, "mediaPlaybackState"))
    goto LABEL_4;
  objc_msgSend(a1, "mediaContentTitle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_4;
  v3 = (void *)v2;
  objc_msgSend(a1, "mediaContentTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", &stru_1E581FBA8);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(a1, "mediaContentArtistName");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = (void *)v8,
          objc_msgSend(a1, "mediaContentArtistName"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToString:", &stru_1E581FBA8),
          v10,
          v9,
          (v11 & 1) == 0))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "mediaContentTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "mediaContentArtistName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ — %@"), v13, v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "mediaContentTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_4:
    v6 = 0;
  }
  return v6;
}

@end
