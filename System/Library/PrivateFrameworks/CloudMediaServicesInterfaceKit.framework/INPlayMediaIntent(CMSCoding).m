@implementation INPlayMediaIntent(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "cmsOptionalArrayOfDecodedClass:forKey:", objc_opt_class(), CFSTR("mediaItems"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD9E50];
    objc_msgSend(v3, "cmsOptionalDictionaryForKey:", CFSTR("mediaContainer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instanceFromCMSCoded:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "cmsOptionalBoolForKey:", CFSTR("playShuffled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("playbackRepeatMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = INPlaybackRepeatModeFromString(v9);

    objc_msgSend(v3, "cmsOptionalBoolForKey:", CFSTR("resumePlayback"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("playbackQueueLocation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = INPlaybackQueueLocationFromString(v12);

    objc_msgSend(v3, "cmsOptionalNumberForKey:", CFSTR("playbackSpeed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD9E68];
    objc_msgSend(v3, "cmsOptionalDictionaryForKey:", CFSTR("mediaSearch"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "instanceFromCMSCoded:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F60]), "initWithMediaItems:mediaContainer:playShuffled:playbackRepeatMode:resumePlayback:playbackQueueLocation:playbackSpeed:mediaSearch:", v4, v7, v8, v10, v11, v13, v14, v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)cmsCoded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&off_2553B7FE0;
  objc_msgSendSuper2(&v12, sel_cmsCoded);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", CFSTR("PlayMediaIntent"), CFSTR("class"));
  objc_msgSend(a1, "mediaItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalCodedObject:forKey:", v3, CFSTR("mediaItems"));

  objc_msgSend(a1, "mediaContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalCodedObject:forKey:", v4, CFSTR("mediaContainer"));

  objc_msgSend(a1, "playShuffled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v5, CFSTR("playShuffled"));

  INPlaybackRepeatModeToString(objc_msgSend(a1, "playbackRepeatMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("playbackRepeatMode"));

  objc_msgSend(a1, "resumePlayback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v7, CFSTR("resumePlayback"));

  INPlaybackQueueLocationToString(objc_msgSend(a1, "playbackQueueLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("playbackQueueLocation"));

  objc_msgSend(a1, "playbackSpeed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v9, CFSTR("playbackSpeed"));

  objc_msgSend(a1, "mediaSearch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalCodedObject:forKey:", v10, CFSTR("mediaSearch"));

  return v2;
}

@end
