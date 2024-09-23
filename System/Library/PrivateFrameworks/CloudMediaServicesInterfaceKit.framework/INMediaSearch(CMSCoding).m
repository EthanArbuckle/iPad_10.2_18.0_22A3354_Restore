@implementation INMediaSearch(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("mediaType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = INMediaItemTypeFromString(v5);

    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("sortOrder"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = INMediaSortOrderFromString(v6);

    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("mediaName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("artistName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("albumName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cmsOptionalArrayOfClass:forKey:", objc_opt_class(), CFSTR("genreNames"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cmsOptionalArrayOfClass:forKey:", objc_opt_class(), CFSTR("moodNames"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD9C98];
    objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("releaseDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "instanceFromCMSCoded:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("reference"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = INMediaReferenceFromString(v16);

    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("mediaIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9E68]), "initWithMediaType:sortOrder:mediaName:artistName:albumName:genreNames:moodNames:releaseDate:reference:mediaIdentifier:", v21, v7, v8, v9, v10, v11, v12, v15, v17, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
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
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  INMediaItemTypeToString(objc_msgSend(a1, "mediaType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("mediaType"));

  INMediaSortOrderToString(objc_msgSend(a1, "sortOrder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("sortOrder"));

  objc_msgSend(a1, "mediaName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v5, CFSTR("mediaName"));

  objc_msgSend(a1, "artistName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v6, CFSTR("artistName"));

  objc_msgSend(a1, "albumName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v7, CFSTR("albumName"));

  objc_msgSend(a1, "genreNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v8, CFSTR("genreNames"));

  objc_msgSend(a1, "moodNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v9, CFSTR("moodNames"));

  objc_msgSend(a1, "releaseDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalCodedObject:forKey:", v10, CFSTR("releaseDate"));

  INMediaReferenceToString(objc_msgSend(a1, "reference"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("reference"));

  objc_msgSend(a1, "mediaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v12, CFSTR("mediaIdentifier"));

  return v2;
}

@end
