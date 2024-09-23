@implementation DCNewGoogleMapsLink

+ (BOOL)isMapsURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(objc_msgSend(v5, "count") - 5) >= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "count") >= 3)
    {
      objc_msgSend(v9, "objectAtIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v10, "isEqualToString:", CFSTR("maps"))
        && ((objc_msgSend(v11, "isEqualToString:", CFSTR("dir")) & 1) != 0
         || (objc_msgSend(v11, "isEqualToString:", CFSTR("place")) & 1) != 0
         || (objc_msgSend(v11, "isEqualToString:", CFSTR("search")) & 1) != 0
         || objc_msgSend(v11, "hasPrefix:", CFSTR("@")))
        && ((objc_msgSend(v7, "isEqualToString:", CFSTR("google")) & 1) != 0
         || objc_msgSend(v7, "isEqualToString:", CFSTR("www"))
         && (objc_msgSend(v8, "isEqualToString:", CFSTR("google")) & 1) != 0);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
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

- (DCNewGoogleMapsLink)initWithURL:(id)a3
{
  id v5;
  DCNewGoogleMapsLink *v6;
  DCNewGoogleMapsLink *v7;
  DCNewGoogleMapsLink *v8;

  v5 = a3;
  v6 = -[DCNewGoogleMapsLink init](self, "init");
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

  if (-[DCNewGoogleMapsLink linkType](self, "linkType") - 1 > 1)
  {
    v3 = 0;
  }
  else
  {
    -[DCNewGoogleMapsLink mapsURLComponentAtIndex:](self, "mapsURLComponentAtIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)searchNearQuery
{
  return 0;
}

- (id)searchLocation
{
  void *v3;

  if (-[DCNewGoogleMapsLink linkType](self, "linkType") == 1)
  {
    -[DCNewGoogleMapsLink location](self, "location");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)startAddress
{
  void *v3;
  void *v4;

  if (-[DCNewGoogleMapsLink linkType](self, "linkType") == 3)
  {
    -[DCNewGoogleMapsLink mapsURLComponentAtIndex:](self, "mapsURLComponentAtIndex:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)destinationAddress
{
  void *v3;
  void *v4;

  if (-[DCNewGoogleMapsLink linkType](self, "linkType") == 3)
  {
    -[DCNewGoogleMapsLink mapsURLComponentAtIndex:](self, "mapsURLComponentAtIndex:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (unint64_t)directionsMode
{
  if (-[DCNewGoogleMapsLink linkType](self, "linkType") == 3)
    return self->_directionsMode;
  else
    return 0;
}

- (id)centerLocation
{
  if (!-[DCNewGoogleMapsLink parsed](self, "parsed"))
    -[DCNewGoogleMapsLink parse](self, "parse");
  return -[DCNewGoogleMapsLink location](self, "location");
}

- (int64_t)zoomLevel
{
  if (!-[DCNewGoogleMapsLink parsed](self, "parsed"))
    -[DCNewGoogleMapsLink parse](self, "parse");
  return self->_zoomLevel;
}

- (unint64_t)mapType
{
  if (!-[DCNewGoogleMapsLink parsed](self, "parsed"))
    -[DCNewGoogleMapsLink parse](self, "parse");
  return self->_mapType;
}

- (BOOL)showsTraffic
{
  if (!-[DCNewGoogleMapsLink parsed](self, "parsed"))
    -[DCNewGoogleMapsLink parse](self, "parse");
  return self->_showsTraffic;
}

- (BOOL)showsTransit
{
  if (!-[DCNewGoogleMapsLink parsed](self, "parsed"))
    -[DCNewGoogleMapsLink parse](self, "parse");
  return self->_showsTransit;
}

- (BOOL)showsStreetView
{
  if (!-[DCNewGoogleMapsLink parsed](self, "parsed"))
    -[DCNewGoogleMapsLink parse](self, "parse");
  return self->_showsStreetView;
}

- (BOOL)showsBicycling
{
  if (!-[DCNewGoogleMapsLink parsed](self, "parsed"))
    -[DCNewGoogleMapsLink parse](self, "parse");
  return self->_showsBicycling;
}

- (id)streetViewLocation
{
  void *v3;

  if (-[DCNewGoogleMapsLink showsStreetView](self, "showsStreetView"))
  {
    -[DCNewGoogleMapsLink location](self, "location");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSArray)mapsURLComponents
{
  NSArray *mapsURLComponents;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  mapsURLComponents = self->_mapsURLComponents;
  if (!mapsURLComponents)
  {
    -[DCNewGoogleMapsLink URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "subarrayWithRange:", 2, objc_msgSend(v5, "count") - 2);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_mapsURLComponents;
    self->_mapsURLComponents = v6;

    mapsURLComponents = self->_mapsURLComponents;
  }
  return mapsURLComponents;
}

- (id)mapsURLComponentAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[DCNewGoogleMapsLink mapsURLComponents](self, "mapsURLComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= (unint64_t)a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByRemovingPercentEncoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (int)linkType
{
  if (!-[DCNewGoogleMapsLink parsed](self, "parsed"))
    -[DCNewGoogleMapsLink parse](self, "parse");
  return self->_linkType;
}

- (void)parseLinkType
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;

  -[DCNewGoogleMapsLink mapsURLComponents](self, "mapsURLComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("search")) & 1) != 0)
  {
    v4 = 1;
LABEL_7:
    v5 = v7;
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("place")) & 1) != 0)
  {
    v4 = 2;
    goto LABEL_7;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("dir")) & 1) != 0)
  {
    v4 = 3;
    goto LABEL_7;
  }
  v6 = objc_msgSend(v7, "hasPrefix:", CFSTR("@"));
  v5 = v7;
  if (!v6)
    goto LABEL_9;
  v4 = 0;
LABEL_8:
  self->_linkType = v4;
LABEL_9:

}

- (id)latLonZoomString
{
  unsigned int v3;
  void *v4;

  v3 = -[DCNewGoogleMapsLink linkType](self, "linkType");
  if (v3 <= 3)
  {
    -[DCNewGoogleMapsLink mapsURLComponentAtIndex:](self, "mapsURLComponentAtIndex:", qword_20BC9A768[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)parseLatLonZoom
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  -[DCNewGoogleMapsLink latLonZoomString](self, "latLonZoomString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scanString:intoString:", CFSTR("@"), 0);
  v12 = 0;
  objc_msgSend(v4, "scanUpToString:intoString:", CFSTR(","), &v12);
  v5 = v12;
  objc_msgSend(v4, "scanString:intoString:", CFSTR(","), 0);
  v11 = 0;
  objc_msgSend(v4, "scanUpToString:intoString:", CFSTR(","), &v11);
  v6 = v11;
  objc_msgSend(v4, "scanString:intoString:", CFSTR(","), 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DCNewGoogleMapsLink setLocation:](self, "setLocation:", v7);
  v10 = 0;
  objc_msgSend(v4, "scanInteger:", &v10);
  objc_msgSend(v3, "substringWithRange:", objc_msgSend(v4, "scanLocation"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("z")))
  {
    v9 = v10;
LABEL_5:
    self->_zoomLevel = v9;
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("m")))
  {
    v9 = (uint64_t)(floor(8.0 - log2((double)v10 * 0.000000480304131)) + -1.0);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)parse
{
  self->_parsed = 1;
  -[DCNewGoogleMapsLink parseLinkType](self, "parseLinkType");
  -[DCNewGoogleMapsLink parseMapsData](self, "parseMapsData");
  -[DCNewGoogleMapsLink parseLatLonZoom](self, "parseLatLonZoom");
}

- (id)dataString
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[DCNewGoogleMapsLink mapsURLComponents](self, "mapsURLComponents", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v7, "hasPrefix:", CFSTR("data=")) & 1) != 0)
        {
          objc_msgSend(v7, "substringFromIndex:", objc_msgSend(CFSTR("data="), "length"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)parseMapsData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  DCNewGoogleMapsLink *v24;
  uint64_t v25;
  DCNewGoogleMapsLink *v26;
  id v27;
  int v28;

  -[DCNewGoogleMapsLink dataString](self, "dataString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v27 = v3;
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("!"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("1m%d"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "count");
    v26 = self;
    self->_mapType = 1;
    if (v7 >= 1)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        objc_msgSend(v6, "objectAtIndex:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v12, "length") >= 3)
          break;
LABEL_65:

        if (v8 == ++v11)
          goto LABEL_66;
      }
      v28 = 0;
      objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "scanInt:", &v28))
      {
        v16 = 0;
        goto LABEL_64;
      }
      v14 = objc_msgSend(v12, "characterAtIndex:", objc_msgSend(v13, "scanLocation"));
      objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v13, "scanLocation") + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14 == 109)
      {
        v17 = objc_msgSend(v15, "intValue");
        if (v28 == 1)
        {
          v10 = 1;
        }
        else
        {
          if (v28 != 3 || (v17 >= 1 ? (v18 = v17 < 5) : (v18 = 0), !v18))
          {
            if (v17 == 1)
              v22 = v28;
            else
              v22 = v10;
            if (v17 == 1)
              v23 = 1;
            else
              v23 = v9;
            if (v28 == 5)
            {
              v10 = v22;
              v9 = v23;
            }
            goto LABEL_64;
          }
          v10 = v28;
        }
        v9 = v17;
        goto LABEL_64;
      }
      if (v10 != 5)
      {
        if (v10 != 3)
        {
          if (v10 == 1)
          {
            v10 = 1;
            if (v9 <= 6 && ((1 << v9) & 0x66) != 0)
            {
              v10 = 1;
              if (v14 == 101 && v28 == 3)
              {
                if (objc_msgSend(v15, "length"))
                {
                  switch(objc_msgSend(v16, "intValue"))
                  {
                    case 0u:
                      v10 = 1;
                      v26->_directionsMode = 1;
                      goto LABEL_64;
                    case 1u:
                      v24 = v26;
                      v25 = 2;
                      goto LABEL_62;
                    case 2u:
                      v24 = v26;
                      v25 = 3;
                      goto LABEL_62;
                    case 3u:
                      v24 = v26;
                      v25 = 4;
                      goto LABEL_62;
                    case 4u:
                      v24 = v26;
                      v25 = 5;
LABEL_62:
                      v24->_directionsMode = v25;
                      break;
                    default:
                      break;
                  }
                }
                v10 = 1;
              }
            }
          }
          goto LABEL_64;
        }
        v10 = 3;
        if (v9 - 1 <= 3 && v14 == 101 && v28 == 1)
        {
          if (objc_msgSend(v15, "length"))
          {
            v19 = objc_msgSend(v16, "intValue");
            if (v19 == 3)
            {
              v10 = 3;
              v26->_mapType = 3;
              goto LABEL_64;
            }
            if (v19 == 1)
              v26->_showsStreetView = 1;
          }
          v10 = 3;
        }
LABEL_64:

        goto LABEL_65;
      }
      v10 = 5;
      if (v9 != 1 || v14 != 101 || v28 != 1)
        goto LABEL_64;
      if (objc_msgSend(v15, "length"))
      {
        v20 = objc_msgSend(v16, "intValue");
        v9 = 1;
        switch(v20)
        {
          case 3:
            v21 = 9;
            goto LABEL_56;
          case 2:
            v21 = 8;
            goto LABEL_56;
          case 1:
            v21 = 11;
LABEL_56:
            *((_BYTE *)&v26->super.super.isa + v21) = 1;
            break;
        }
      }
      else
      {
        v9 = 1;
      }
      v10 = 5;
      goto LABEL_64;
    }
LABEL_66:

    v3 = v27;
  }

}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (void)setMapsURLComponents:(id)a3
{
  objc_storeStrong((id *)&self->_mapsURLComponents, a3);
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)parsed
{
  return self->_parsed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_mapsURLComponents, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
