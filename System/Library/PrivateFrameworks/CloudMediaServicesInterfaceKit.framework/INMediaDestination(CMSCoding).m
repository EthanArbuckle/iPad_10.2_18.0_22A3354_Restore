@implementation INMediaDestination(CMSCoding)

- (id)cmsCoded
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void **v7;
  const __CFString **v8;
  uint64_t v9;
  void *v10;
  const __CFString *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "mediaDestinationType");
  if (v2 == 2)
  {
    v14[0] = CFSTR("mediaDestinationType");
    v14[1] = CFSTR("playlistName");
    v15[0] = CFSTR("playlist");
    objc_msgSend(a1, "playlistName");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = &stru_24E1CDD40;
    if (v3)
      v5 = (const __CFString *)v3;
    v15[1] = v5;
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = (void **)v15;
    v8 = (const __CFString **)v14;
    v9 = 2;
  }
  else
  {
    v12 = CFSTR("mediaDestinationType");
    INMediaDestinationTypeToString(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v4;
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = &v13;
    v8 = &v12;
    v9 = 1;
  }
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("mediaDestinationType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = INMediaDestinationTypeFromString(v5);

    if (v6 == 1)
    {
      objc_msgSend(MEMORY[0x24BDD9E40], "libraryDestination");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("playlistName"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = &stru_24E1CDD40;
      if (v8)
        v10 = (__CFString *)v8;
      v11 = v10;

      objc_msgSend(MEMORY[0x24BDD9E40], "playlistDestinationWithName:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
