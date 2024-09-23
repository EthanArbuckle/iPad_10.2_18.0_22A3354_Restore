@implementation ISImageCache

- (id)imageForDescriptor:(id)a3
{
  id v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "digest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_imageBagsByDescriptor, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v4, "scale");
  v13 = v12;

  objc_msgSend(v7, "imageForSize:scale:", v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (void)setImage:(id)a3 forDescriptor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v6 = a3;
    objc_msgSend(a4, "digest");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_imageBagsByDescriptor, "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = (void *)objc_opt_new();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imageBagsByDescriptor, "setObject:forKeyedSubscript:", v7, v9);
    }
    objc_msgSend(v7, "insertImage:", v6);
    objc_msgSend(v6, "validationToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_storeStrong((id *)&self->_latestValidationToken, v8);
    os_unfair_lock_unlock(&self->_lock);

  }
}

- (ISImageCache)init
{
  ISImageCache *v2;
  ISImageCache *v3;
  uint64_t v4;
  NSMutableDictionary *imageBagsByDescriptor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ISImageCache;
  v2 = -[ISImageCache init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    imageBagsByDescriptor = v3->_imageBagsByDescriptor;
    v3->_imageBagsByDescriptor = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (NSData)latestValidationToken
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBagsByDescriptor, 0);
  objc_storeStrong((id *)&self->_latestValidationToken, 0);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v19.receiver = self;
  v19.super_class = (Class)ISImageCache;
  -[ISImageCache debugDescription](&v19, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_imageBagsByDescriptor, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "debugDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("Bag [%u]: %@"), 0, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_lock);
  v13 = (void *)objc_msgSend(v5, "copy");

  return v13;
}

- (id)allImages
{
  void *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_imageBagsByDescriptor, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "images");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)imageBagsByDescriptor
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setImageBagsByDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
