@implementation WFiTunesPodcastObject(PodcastUtilities)

- (id)podcastQueryDictionary
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("NEWEST_FIRST"), CFSTR("playbackOrder"));
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("storeCollectionId");
LABEL_5:
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v5);

    return v2;
  }
  objc_msgSend(a1, "podcastUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "podcastUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("uuid");
    goto LABEL_5;
  }
  return v2;
}

@end
