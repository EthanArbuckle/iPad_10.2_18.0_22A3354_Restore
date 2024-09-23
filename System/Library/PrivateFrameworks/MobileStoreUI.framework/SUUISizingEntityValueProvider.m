@implementation SUUISizingEntityValueProvider

- (id)initForViewElement:(id)a3
{
  id v4;
  SUUISizingEntityValueProvider *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *tallestValues;
  _QWORD v9[4];
  SUUISizingEntityValueProvider *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUISizingEntityValueProvider;
  v5 = -[SUUISizingEntityValueProvider init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    tallestValues = v5->_tallestValues;
    v5->_tallestValues = v6;

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__SUUISizingEntityValueProvider_initForViewElement___block_invoke;
    v9[3] = &unk_2511F46F8;
    v10 = v5;
    objc_msgSend(v4, "enumerateChildrenUsingBlock:", v9);

  }
  return v5;
}

uint64_t __52__SUUISizingEntityValueProvider_initForViewElement___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertTallestValueForViewElement:", a2);
}

- (id)entityUniqueIdentifier
{
  return 0;
}

- (id)imageURLForEntityArtworkProperty:(id)a3 fittingSize:(CGSize)a4 destinationScale:(double)a5
{
  return 0;
}

- (id)valueForEntityProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_tallestValues, "objectForKey:", a3);
}

- (id)valuesForEntityProperties:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_tallestValues, "objectForKey:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_insertTallestValueForViewElement:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  SUUISizingEntityValueProvider *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("valueProperty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v15;
      objc_msgSend(v6, "style");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "maxTextLines");
      if (!v7 || v8 <= 0)
        v8 = objc_msgSend(v6, "numberOfLines");
      v14 = self;
      if ((unint64_t)v8 <= 1)
        v9 = 1;
      else
        v9 = v8;
      if (v9 < 1)
      {
        v12 = &stru_2511FF0C8;
      }
      else
      {
        v10 = 0;
        v11 = &stru_2511FF0C8;
        do
        {
          -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("X"), v14);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v10 < v9 - 1)
          {
            -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR("\n"));
            v13 = objc_claimAutoreleasedReturnValue();

            v12 = (__CFString *)v13;
          }
          ++v10;
          v11 = v12;
        }
        while (v9 != v10);
      }
      -[NSMutableDictionary setObject:forKey:](v14->_tallestValues, "setObject:forKey:", v12, v5, v14);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tallestValues, 0);
}

@end
