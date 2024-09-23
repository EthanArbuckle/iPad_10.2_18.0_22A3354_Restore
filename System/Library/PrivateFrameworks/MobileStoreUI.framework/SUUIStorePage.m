@implementation SUUIStorePage

- (void)setPageComponents:(id)a3
{
  NSArray *v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *pageComponents;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)a3;
  if (self->_pageComponents != v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD14E0]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "metricsElementName", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v11, "_setMetricsLocationPosition:", objc_msgSend(v5, "countForObject:", v12));
            objc_msgSend(v5, "addObject:", v12);
          }

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v13 = (NSArray *)-[NSArray copy](v6, "copy");
    pageComponents = self->_pageComponents;
    self->_pageComponents = v13;

  }
}

- (void)setValue:(id)a3 forPageKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *values;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v12;
  v8 = v6;
  values = self->_values;
  if (v12)
  {
    if (!values)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v11 = self->_values;
      self->_values = v10;

      v7 = v12;
      values = self->_values;
    }
    -[NSMutableDictionary setObject:forKey:](values, "setObject:forKey:", v7, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](values, "removeObjectForKey:", v8);
  }

}

- (id)valueForPageKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_values, "objectForKey:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setBackgroundArtwork:", self->_backgroundArtwork);
  objc_msgSend(v5, "setITMLData:", self->_itmlData);
  objc_msgSend(v5, "setITMLResponse:", self->_itmlResponse);
  objc_msgSend(v5, "setMetricsConfiguration:", self->_metricsConfiguration);
  objc_msgSend(v5, "setMetricsPageDescription:", self->_metricsPageDescription);
  v6 = -[NSArray copyWithZone:](self->_pageComponents, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  objc_msgSend(v5, "setPageType:", self->_pageType);
  objc_msgSend(v5, "setPageURL:", self->_pageURL);
  objc_msgSend(v5, "setProductPage:", self->_productPage);
  objc_msgSend(v5, "setTitle:", self->_title);
  objc_msgSend(v5, "setUber:", self->_uber);
  v8 = -[NSMutableDictionary mutableCopyWithZone:](self->_values, "mutableCopyWithZone:", a3);
  v9 = (void *)v5[12];
  v5[12] = v8;

  return v5;
}

- (SUUIArtwork)backgroundArtwork
{
  return self->_backgroundArtwork;
}

- (void)setBackgroundArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundArtwork, a3);
}

- (NSData)ITMLData
{
  return self->_itmlData;
}

- (void)setITMLData:(id)a3
{
  objc_storeStrong((id *)&self->_itmlData, a3);
}

- (NSHTTPURLResponse)ITMLResponse
{
  return self->_itmlResponse;
}

- (void)setITMLResponse:(id)a3
{
  objc_storeStrong((id *)&self->_itmlResponse, a3);
}

- (SSMetricsConfiguration)metricsConfiguration
{
  return self->_metricsConfiguration;
}

- (void)setMetricsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_metricsConfiguration, a3);
}

- (NSString)metricsPageDescription
{
  return self->_metricsPageDescription;
}

- (void)setMetricsPageDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)pageComponents
{
  return self->_pageComponents;
}

- (NSString)pageType
{
  return self->_pageType;
}

- (void)setPageType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SUUIProductPage)productPage
{
  return self->_productPage;
}

- (void)setProductPage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SUUIUber)uber
{
  return self->_uber;
}

- (void)setUber:(id)a3
{
  objc_storeStrong((id *)&self->_uber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_uber, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_pageType, 0);
  objc_storeStrong((id *)&self->_pageComponents, 0);
  objc_storeStrong((id *)&self->_metricsPageDescription, 0);
  objc_storeStrong((id *)&self->_metricsConfiguration, 0);
  objc_storeStrong((id *)&self->_itmlResponse, 0);
  objc_storeStrong((id *)&self->_itmlData, 0);
  objc_storeStrong((id *)&self->_backgroundArtwork, 0);
}

@end
