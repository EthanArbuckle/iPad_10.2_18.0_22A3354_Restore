@implementation MLLazyUnionFeatureProvider

- (MLLazyUnionFeatureProvider)initWithFeaturesFrom:(id)a3 addedToFeaturesFrom:(id)a4
{
  id v7;
  id v8;
  MLLazyUnionFeatureProvider *v9;
  MLLazyUnionFeatureProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLLazyUnionFeatureProvider;
  v9 = -[MLLazyUnionFeatureProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_first, a3);
    objc_storeStrong((id *)&v10->_second, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[MLFeatureProvider featureValueForName:](self->_first, "featureValueForName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[MLFeatureProvider featureValueForName:](self->_second, "featureValueForName:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (NSSet)featureNames
{
  void *v3;
  void *v4;
  void *v5;

  -[MLFeatureProvider featureNames](self->_second, "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLFeatureProvider featureNames](self->_first, "featureNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)unionFeatureProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  MLDictionaryFeatureProvider *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MLLazyUnionFeatureProvider featureNames](self, "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedKeySetForKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[MLLazyUnionFeatureProvider featureValueForName:](self, "featureValueForName:", v12, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v14 = -[MLDictionaryFeatureProvider initWithFeatureValueDictionary:]([MLDictionaryFeatureProvider alloc], "initWithFeatureValueDictionary:", v7);
  return v14;
}

- (MLFeatureProvider)first
{
  return self->_first;
}

- (void)setFirst:(id)a3
{
  objc_storeStrong((id *)&self->_first, a3);
}

- (MLFeatureProvider)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
  objc_storeStrong((id *)&self->_second, a3);
}

@end
