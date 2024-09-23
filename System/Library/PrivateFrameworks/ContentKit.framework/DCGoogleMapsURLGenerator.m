@implementation DCGoogleMapsURLGenerator

- (id)scheme
{
  __CFString *v2;

  v2 = CFSTR("comgooglemaps");
  return CFSTR("comgooglemaps");
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[DCMapsURLGenerator mapsLink](self, "mapsLink");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "showsTraffic"))
    objc_msgSend(v3, "appendString:", CFSTR("traffic,"));
  if (objc_msgSend(v17, "showsTransit"))
    objc_msgSend(v3, "appendString:", CFSTR("transit,"));
  if (objc_msgSend(v17, "showsBicycling"))
    objc_msgSend(v3, "appendString:", CFSTR("bicycling,"));
  if ((objc_msgSend(v17, "mapType") & 0xFFFFFFFFFFFFFFFELL) == 2)
    objc_msgSend(v3, "appendString:", CFSTR("satellite,"));
  -[DCMapsURLGenerator queryDictionary](self, "queryDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("views"));

  if (objc_msgSend(v17, "zoomLevel"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v17, "zoomLevel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v6, CFSTR("zoom"));

  }
  if (objc_msgSend(v17, "showsStreetView"))
  {
    -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", CFSTR("streetview"), CFSTR("mapmode"));
    objc_msgSend(v17, "streetViewLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v17, "centerLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v17, "searchLocation");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v10;

  }
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v7, CFSTR("center"));
  -[DCGoogleMapsURLGenerator directionsMode](self, "directionsMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v11, CFSTR("directionsmode"));

  objc_msgSend(v17, "destinationAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v12, CFSTR("daddr"));

  objc_msgSend(v17, "searchQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMapsURLGenerator setString:forQueryKey:](self, "setString:forQueryKey:", v13, CFSTR("q"));

  objc_msgSend(v17, "startAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[DCMapsURLGenerator queryDictionary](self, "queryDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKey:", v16, CFSTR("saddr"));

  }
}

- (id)directionsMode
{
  void *v2;
  uint64_t v3;

  -[DCMapsURLGenerator mapsLink](self, "mapsLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "directionsMode");

  if ((unint64_t)(v3 - 1) > 4)
    return 0;
  else
    return off_24C4DB620[v3 - 1];
}

@end
