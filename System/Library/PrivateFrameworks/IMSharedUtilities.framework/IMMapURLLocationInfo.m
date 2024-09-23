@implementation IMMapURLLocationInfo

+ (id)locationInfoFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  id v30;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "isEqualToIgnoringCase:", CFSTR("maps.apple.com")))
    {
      v32 = v7;
      v34 = v3;
      objc_msgSend(v4, "setUrl:", v3);
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = v5;
      objc_msgSend(v5, "queryItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (!v9)
        goto LABEL_20;
      v10 = v9;
      v11 = *(_QWORD *)v36;
      while (1)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v13, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToIgnoringCase:", CFSTR("ll"));

          if (v15)
          {
            objc_msgSend(v13, "value");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(","));
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v17, "count") == 2)
            {
              v18 = (objc_class *)MEMORY[0x1A1AE7D4C](CFSTR("CLLocation"), CFSTR("CoreLocation"));
              if (v18)
              {
                v19 = [v18 alloc];
                objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "doubleValue");
                v22 = v21;
                objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "doubleValue");
                v25 = (void *)objc_msgSend(v19, "initWithLatitude:longitude:", v22, v24);
                objc_msgSend(v4, "setLocation:", v25);

              }
            }
          }
          else
          {
            objc_msgSend(v13, "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToIgnoringCase:", CFSTR("q"));

            if (v27)
            {
              objc_msgSend(v13, "value");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setQuery:", v17);
            }
            else
            {
              objc_msgSend(v13, "name");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("address"));

              if (!v29)
                continue;
              objc_msgSend(v13, "value");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setAddress:", v17);
            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (!v10)
        {
LABEL_20:

          v30 = v4;
          v5 = v33;
          v3 = v34;
          v7 = v32;
          goto LABEL_22;
        }
      }
    }
    v30 = 0;
LABEL_22:

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  IMMapURLLocationInfo *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v4 = (IMMapURLLocationInfo *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self == v4)
    {
      v10 = 1;
    }
    else
    {
      -[IMMapURLLocationInfo url](self, "url");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMMapURLLocationInfo url](v4, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        if (v7 && v8)
          v10 = objc_msgSend(v7, "isEqual:", v8);
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  -[IMMapURLLocationInfo url](self, "url", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMMapURLLocationInfo locationInfoFromURL:](IMMapURLLocationInfo, "locationInfoFromURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
