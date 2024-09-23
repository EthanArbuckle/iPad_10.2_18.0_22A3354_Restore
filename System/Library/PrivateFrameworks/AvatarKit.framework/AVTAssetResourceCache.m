@implementation AVTAssetResourceCache

- (AVTAssetResourceCache)init
{
  AVTAssetResourceCache *v2;
  AVTAssetResourceCache *v3;
  uint64_t v4;
  NSMapTable *resources;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTAssetResourceCache;
  v2 = -[AVTAssetResourceCache init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_policy = 0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    resources = v3->_resources;
    v3->_resources = (NSMapTable *)v4;

  }
  return v3;
}

- (void)retainAsset:(id)a3
{
  objc_msgSend(a3, "incrUseCount");
}

- (void)releaseAsset:(id)a3
{
  NSMapTable *resources;
  id v4;

  resources = self->_resources;
  v4 = a3;
  -[NSMapTable removeObjectForKey:](resources, "removeObjectForKey:", v4);
  objc_msgSend(v4, "decrUseCount");

}

- (id)resourceForAsset:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_resources, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "resourceByCachingIfNeeded:", self->_policy != 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_resources, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (unint64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(unint64_t)a3
{
  self->_policy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
}

@end
