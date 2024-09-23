@implementation DCStandardMapsLink

+ (BOOL)isStandardAppleMapsURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("maps.apple.com")))
  {
    objc_msgSend(v3, "pathComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") > 2)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v3, "query");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length") != 0;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isStandardGoogleMapsURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v3 = a3;
  objc_msgSend(v3, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(objc_msgSend(v7, "count") - 5) >= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend(v7, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("maps"))
        || (objc_msgSend(v10, "isEqualToString:", CFSTR("google")) & 1) == 0)
      {
        objc_msgSend(v3, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("/maps"));

        if (!v12
          || (objc_msgSend(v9, "isEqualToString:", CFSTR("google")) & 1) == 0
          && (!objc_msgSend(v9, "isEqualToString:", CFSTR("www"))
           || (objc_msgSend(v10, "isEqualToString:", CFSTR("google")) & 1) == 0))
        {
          v8 = 0;
        }
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isMapsURL:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(a1, "isStandardAppleMapsURL:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(a1, "isStandardGoogleMapsURL:", v4);

  return v5;
}

+ (id)mapsLinkWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(a1, "isMapsURL:", v4))
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);
  else
    v5 = 0;

  return v5;
}

- (DCStandardMapsLink)initWithURL:(id)a3
{
  id v5;
  DCStandardMapsLink *v6;
  DCStandardMapsLink *v7;
  DCStandardMapsLink *v8;

  v5 = a3;
  v6 = -[DCStandardMapsLink init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    v8 = v7;
  }

  return v7;
}

- (id)searchQuery
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("q"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("address"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)searchNearQuery
{
  void *v2;
  void *v3;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("near"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)searchLocation
{
  void *v2;
  void *v3;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("sll"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)startAddress
{
  void *v2;
  void *v3;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("saddr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)destinationAddress
{
  void *v2;
  void *v3;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("daddr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)directionsMode
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("dirflg"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("d")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("w")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("r")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("f")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)centerLocation
{
  void *v2;
  void *v3;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ll"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)zoomLevel
{
  void *v2;
  void *v3;
  int64_t v4;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("z"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (unint64_t)mapType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("t"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("m")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("h")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("k")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("p")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("e")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)showsTraffic
{
  void *v2;
  void *v3;
  void *v4;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "containsObject:", CFSTR("t"));
  return (char)v2;
}

- (BOOL)showsTransit
{
  void *v2;
  void *v3;
  void *v4;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lci"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "containsObject:", CFSTR("transit"));
  return (char)v2;
}

- (BOOL)showsStreetView
{
  void *v2;
  void *v3;
  BOOL v4;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cbp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)showsBicycling
{
  return 0;
}

- (id)streetViewLocation
{
  void *v2;
  void *v3;

  -[DCStandardMapsLink queryDictionary](self, "queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("cbll"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)queryDictionary
{
  NSDictionary *queryDictionary;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  queryDictionary = self->_queryDictionary;
  if (!queryDictionary)
  {
    -[DCStandardMapsLink URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dc_queryDictionary");
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_queryDictionary;
    self->_queryDictionary = v5;

    queryDictionary = self->_queryDictionary;
  }
  return queryDictionary;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (void)setQueryDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDictionary, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
