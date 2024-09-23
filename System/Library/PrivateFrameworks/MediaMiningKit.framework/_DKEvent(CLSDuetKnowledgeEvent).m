@implementation _DKEvent(CLSDuetKnowledgeEvent)

- (id)cls_album
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("_DKNowPlayingMetadataKey-album"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)cls_artist
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("_DKNowPlayingMetadataKey-artist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)cls_title
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("_DKNowPlayingMetadataKey-title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)cls_genre
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("_DKNowPlayingMetadataKey-genre"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)cls_durationInSeconds
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "metadata");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("_DKNowPlayingMetadataKey-duration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)cls_identifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "stringValue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
