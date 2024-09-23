@implementation _NTKBundleBundleComplicationLoader

- (void)setUrls:(id)a3
{
  objc_storeStrong((id *)&self->_urls, a3);
}

- (void)_loadClassesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61___NTKBundleBundleComplicationLoader__loadClassesUsingBlock___block_invoke;
  v6[3] = &unk_1E6BD3A00;
  v7 = v4;
  v5 = v4;
  -[_NTKBundleBundleComplicationLoader _enumerateBundles:](self, "_enumerateBundles:", v6);

}

- (void)_enumerateBundles:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSArray *obj;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_urls)
  {
    if (_enumerateBundles__onceToken_1 != -1)
      dispatch_once(&_enumerateBundles__onceToken_1, &__block_literal_global_132);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    obj = self->_urls;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v11 = (void *)_enumerateBundles____complicationBundleLoader;
          v13[0] = v8;
          v13[1] = 3221225472;
          v13[2] = __56___NTKBundleBundleComplicationLoader__enumerateBundles___block_invoke_2;
          v13[3] = &unk_1E6BD2EE0;
          v14 = v4;
          objc_msgSend(v11, "enumerateBundlesFromDirectoryURL:enumerator:", v10, v13);

        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)isEqual:(id)a3
{
  _NTKBundleBundleComplicationLoader *v4;
  char v5;

  v4 = (_NTKBundleBundleComplicationLoader *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = NTKEqualObjects(self->_urls, v4->_urls);
    else
      v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setUrls:", self->_urls);
  return v4;
}

- (NSArray)urls
{
  return self->_urls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
}

@end
