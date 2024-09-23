@implementation DCBaiduMapsURLGenerator

- (id)scheme
{
  __CFString *v2;

  v2 = CFSTR("baidumap");
  return CFSTR("baidumap");
}

- (id)host
{
  return CFSTR("map");
}

- (id)path
{
  return CFSTR("/direction");
}

- (void)populateQueryDictionary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[DCMapsURLGenerator mapsLink](self, "mapsLink");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[DCBaiduMapsURLGenerator directionsMode](self, "directionsMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v3, CFSTR("mode"));

  objc_msgSend(v8, "destinationAddress");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v8, "centerLocation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v8, "searchQuery");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v4 = v5;

      }
      else
      {
        objc_msgSend(v8, "searchLocation");
        v4 = (id)objc_claimAutoreleasedReturnValue();
        if (!v4)
          goto LABEL_7;
      }
    }
  }
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v4, CFSTR("destination"));

LABEL_7:
  objc_msgSend(v8, "startAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "startAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v7, CFSTR("origin"));

  }
}

- (id)directionsMode
{
  void *v2;
  uint64_t v3;

  -[DCMapsURLGenerator mapsLink](self, "mapsLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "directionsMode");

  if ((unint64_t)(v3 - 1) > 3)
    return 0;
  else
    return *(&off_24C4E3038 + v3 - 1);
}

@end
