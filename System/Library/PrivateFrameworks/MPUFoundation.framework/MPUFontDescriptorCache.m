@implementation MPUFontDescriptorCache

+ (id)sharedFontDescriptorCache
{
  if (sharedFontDescriptorCache_sSharedFontDescriptorCacheOnceToken != -1)
    dispatch_once(&sharedFontDescriptorCache_sSharedFontDescriptorCacheOnceToken, &__block_literal_global_0);
  return (id)sharedFontDescriptorCache_sSharedFontDescriptorCache;
}

void __51__MPUFontDescriptorCache_sharedFontDescriptorCache__block_invoke()
{
  MPUFontDescriptorCache *v0;
  void *v1;

  v0 = objc_alloc_init(MPUFontDescriptorCache);
  v1 = (void *)sharedFontDescriptorCache_sSharedFontDescriptorCache;
  sharedFontDescriptorCache_sSharedFontDescriptorCache = (uint64_t)v0;

}

- (MPUFontDescriptorCache)init
{
  MPUFontDescriptorCache *v2;
  MPUFontDescriptorCache *v3;
  NSMutableArray *v4;
  NSMutableArray *orderedCachedFontDescriptors;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPUFontDescriptorCache;
  v2 = -[MPUFontDescriptorCache init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_maximumCapacity = 100;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    orderedCachedFontDescriptors = v3->_orderedCachedFontDescriptors;
    v3->_orderedCachedFontDescriptors = v4;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__handleContentSizeCategoryDidChangeNotification_, *MEMORY[0x24BDF7670], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7670], 0);

  v4.receiver = self;
  v4.super_class = (Class)MPUFontDescriptorCache;
  -[MPUFontDescriptorCache dealloc](&v4, sel_dealloc);
}

- (id)cachedImmutableFontDescriptorForConfigurationBlock:(id)a3
{
  void (**v4)(id, MPUMutableFontDescriptor *);
  MPUMutableFontDescriptor *reusableMutableFontDescriptor;
  MPUMutableFontDescriptor *v6;
  MPUMutableFontDescriptor *v7;
  void *v8;

  v4 = (void (**)(id, MPUMutableFontDescriptor *))a3;
  if (v4)
  {
    reusableMutableFontDescriptor = self->_reusableMutableFontDescriptor;
    if (!reusableMutableFontDescriptor)
    {
      v6 = objc_alloc_init(MPUMutableFontDescriptor);
      v7 = self->_reusableMutableFontDescriptor;
      self->_reusableMutableFontDescriptor = v6;

      reusableMutableFontDescriptor = self->_reusableMutableFontDescriptor;
    }
    v4[2](v4, reusableMutableFontDescriptor);
    -[MPUFontDescriptorCache _cachedImmutableFontDescriptorMatchingMutableFontDescriptor:](self, "_cachedImmutableFontDescriptorMatchingMutableFontDescriptor:", self->_reusableMutableFontDescriptor);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUMutableFontDescriptor _resetToDefaultValues](self->_reusableMutableFontDescriptor, "_resetToDefaultValues");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)cachedImmutableFontDescriptorMatchingMutableFontDescriptor:(id)a3
{
  if (!a3)
    return 0;
  -[MPUFontDescriptorCache _cachedImmutableFontDescriptorMatchingMutableFontDescriptor:](self, "_cachedImmutableFontDescriptorMatchingMutableFontDescriptor:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_handleContentSizeCategoryDidChangeNotification:(id)a3
{
  void *v4;
  id v5;
  MPUFontDescriptorCache *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("_MPUFontDescriptorDidInvalidateCachedFontsAndMetricsNotification"), v6, v7);
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("MPUFontDescriptorPreferredContentSizeCategoryDidChangeNotification"), v6, v7);

}

- (id)_cachedImmutableFontDescriptorMatchingMutableFontDescriptor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->_orderedCachedFontDescriptors, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)objc_msgSend(v4, "_copyAllowingGlobalCacheLookup:", 0);
    if (-[NSMutableArray count](self->_orderedCachedFontDescriptors, "count") == self->_maximumCapacity)
      -[NSMutableArray removeLastObject](self->_orderedCachedFontDescriptors, "removeLastObject");
    goto LABEL_6;
  }
  v7 = v5;
  -[NSMutableArray objectAtIndex:](self->_orderedCachedFontDescriptors, "objectAtIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_orderedCachedFontDescriptors, "removeObjectAtIndex:", v7);
LABEL_6:
    -[NSMutableArray insertObject:atIndex:](self->_orderedCachedFontDescriptors, "insertObject:atIndex:", v6, 0);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedCachedFontDescriptors, 0);
  objc_storeStrong((id *)&self->_reusableMutableFontDescriptor, 0);
}

@end
