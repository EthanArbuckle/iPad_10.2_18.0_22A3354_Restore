@implementation DCTransitURLGenerator

- (id)scheme
{
  __CFString *v2;

  v2 = CFSTR("transit");
  return CFSTR("transit");
}

- (id)host
{
  return CFSTR("directions");
}

- (id)path
{
  return 0;
}

- (void)populateQueryDictionary
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  -[DCMapsURLGenerator queryDictionary](self, "queryDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator mapsLink](self, "mapsLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinationAddress");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_6;
  objc_msgSend(v3, "centerLocation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_6;
  objc_msgSend(v3, "searchQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v4 = v5;

LABEL_6:
    objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("to"));

    goto LABEL_7;
  }
  objc_msgSend(v3, "searchLocation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_6;
LABEL_7:

}

@end
