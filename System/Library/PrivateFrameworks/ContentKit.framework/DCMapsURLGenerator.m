@implementation DCMapsURLGenerator

- (DCMapsURLGenerator)initWithMapsLink:(id)a3
{
  id v5;
  DCMapsURLGenerator *v6;
  DCMapsURLGenerator *v7;
  DCMapsURLGenerator *v8;

  v5 = a3;
  v6 = -[DCMapsURLGenerator init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapsLink, a3);
    v8 = v7;
  }

  return v7;
}

- (id)scheme
{
  return CFSTR("https");
}

- (id)host
{
  return CFSTR("maps.apple.com");
}

- (id)path
{
  return CFSTR("/");
}

- (id)query
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  -[DCMapsURLGenerator queryDictionary](self, "queryDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dc_queryStringWithQueryDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)URL
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[DCMapsURLGenerator queryDictionary](self, "queryDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)DCMapsURLGenerator;
    -[DCURLGenerator URL](&v7, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSMutableDictionary)queryDictionary
{
  NSMutableDictionary *queryDictionary;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  queryDictionary = self->_queryDictionary;
  if (!queryDictionary)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_queryDictionary;
    self->_queryDictionary = v4;

    -[DCMapsURLGenerator populateQueryDictionary](self, "populateQueryDictionary");
    queryDictionary = self->_queryDictionary;
  }
  return queryDictionary;
}

- (void)populateQueryDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[DCMapsURLGenerator mapsLink](self, "mapsLink");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v3, CFSTR("q"));

  objc_msgSend(v12, "searchNearQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v4, CFSTR("near"));

  objc_msgSend(v12, "searchLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v5, CFSTR("sll"));

  objc_msgSend(v12, "startAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v6, CFSTR("saddr"));

  objc_msgSend(v12, "destinationAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v7, CFSTR("daddr"));

  -[DCMapsURLGenerator directionsMode](self, "directionsMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v8, CFSTR("dirflg"));

  objc_msgSend(v12, "centerLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v9, CFSTR("ll"));

  -[DCMapsURLGenerator mapType](self, "mapType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v10, CFSTR("t"));

  if (objc_msgSend(v12, "zoomLevel"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v12, "zoomLevel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v11, CFSTR("z"));

  }
  if (objc_msgSend(v12, "showsTraffic"))
    -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", CFSTR("t"), CFSTR("layer"));

}

- (id)directionsMode
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  -[DCMapsURLGenerator mapsLink](self, "mapsLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "directionsMode");

  if ((unint64_t)(v3 - 1) > 4)
    v4 = 0;
  else
    v4 = *off_24C4DC258[v3 - 1];
  return v4;
}

- (id)mapType
{
  void *v3;
  char v4;
  __CFString **v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;

  -[DCMapsURLGenerator mapsLink](self, "mapsLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsStreetView");

  if ((v4 & 1) != 0)
  {
    v5 = DCStandardMapsLinkMapTypeHybrid;
  }
  else
  {
    -[DCMapsURLGenerator mapsLink](self, "mapsLink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mapType");

    if ((unint64_t)(v7 - 1) > 2)
    {
      v8 = 0;
      return v8;
    }
    v5 = off_24C4DC280[v7 - 1];
  }
  v8 = *v5;
  return v8;
}

- (void)setString:(id)a3 forQueryKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "length"))
  {
    -[DCMapsURLGenerator queryDictionary](self, "queryDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v8, v6);

  }
}

- (DCMapsLink)mapsLink
{
  return self->_mapsLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsLink, 0);
  objc_storeStrong((id *)&self->_queryDictionary, 0);
}

+ (id)URLWithMapsLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMapsLink:", v4);

  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
