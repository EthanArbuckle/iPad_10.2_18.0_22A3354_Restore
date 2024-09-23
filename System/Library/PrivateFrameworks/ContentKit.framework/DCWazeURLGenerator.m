@implementation DCWazeURLGenerator

- (id)scheme
{
  __CFString *v2;

  v2 = CFSTR("waze");
  return CFSTR("waze");
}

- (id)host
{
  return 0;
}

- (id)path
{
  return 0;
}

- (void)populateQueryDictionary
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  id v13;

  -[DCMapsURLGenerator queryDictionary](self, "queryDictionary");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator mapsLink](self, "mapsLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchQuery");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v3, "searchLocation");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v3, "destinationAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v13, "setObject:forKey:", v9, CFSTR("q"));
    v10 = CFSTR("yes");
    v11 = CFSTR("navigate");
    v12 = v13;
LABEL_10:
    objc_msgSend(v12, "setObject:forKey:", v10, v11);
    goto LABEL_11;
  }
  if (v4)
  {
    v11 = CFSTR("q");
    v12 = v13;
    v10 = v4;
    goto LABEL_10;
  }
  if (v8)
  {
    v11 = CFSTR("ll");
    v12 = v13;
    v10 = v8;
    goto LABEL_10;
  }
LABEL_11:

}

@end
