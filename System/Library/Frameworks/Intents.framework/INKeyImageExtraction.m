@implementation INKeyImageExtraction

- (INKeyImageExtraction)init
{
  INKeyImageExtraction *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *keyImagesByType;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INKeyImageExtraction;
  v2 = -[INKeyImageExtraction init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[INKeyImageExtraction setProxyIdentifier:](v2, "setProxyIdentifier:", v4);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    keyImagesByType = v2->_keyImagesByType;
    v2->_keyImagesByType = (NSMutableDictionary *)v5;

    v2->_imageTypeToStore = 0;
  }
  return v2;
}

- (void)setKeyImage:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyImagesByType, "setObject:forKeyedSubscript:", a3, &unk_1E23E9718);
}

- (INImage)keyImage
{
  return (INImage *)-[NSMutableDictionary objectForKey:](self->_keyImagesByType, "objectForKey:", &unk_1E23E9718);
}

- (NSDictionary)keyImagesByType
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_keyImagesByType, "copy");
}

- (BOOL)canStoreImage:(id)a3
{
  return a3 != 0;
}

- (id)storeImage:(id)a3 scaled:(BOOL)a4 qualityOfService:(unsigned int)a5 storeType:(unint64_t)a6 error:(id *)a7
{
  return -[INKeyImageExtraction storeImageSynchronously:error:](self, "storeImageSynchronously:error:", a3, a7, *(_QWORD *)&a5, a6);
}

- (void)retrieveImageWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  id v9;

  if (a4)
  {
    v9 = 0;
    v6 = (void (**)(id, void *, id))a4;
    -[INKeyImageExtraction retrieveImageSynchronouslyForIdentifier:error:](self, "retrieveImageSynchronouslyForIdentifier:error:", a3, &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    v6[2](v6, v7, v8);

  }
}

- (void)purgeImageWithIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *keyImagesByType;
  void *v13;
  void *v14;
  void (**v15)(id, void *);

  v15 = (void (**)(id, void *))a4;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("|"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INKeyImageExtraction proxyIdentifier](self, "proxyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    if (objc_msgSend(v6, "count") == 2)
    {
      objc_msgSend(v6, "objectAtIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      keyImagesByType = self->_keyImagesByType;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](keyImagesByType, "removeObjectForKey:", v13);

    }
    else
    {
      -[INKeyImageExtraction setKeyImage:](self, "setKeyImage:", 0);
    }
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6000, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v15)
    v15[2](v15, v14);

}

- (id)storeImageSynchronously:(id)a3 error:(id *)a4
{
  NSMutableDictionary *keyImagesByType;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  keyImagesByType = self->_keyImagesByType;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", -[INKeyImageExtraction _imageTypeToStore](self, "_imageTypeToStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](keyImagesByType, "setObject:forKeyedSubscript:", v7, v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[INKeyImageExtraction proxyIdentifier](self, "proxyIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INKeyImageExtraction _imageTypeToStore](self, "_imageTypeToStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@|%@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)retrieveImageSynchronouslyForIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *keyImagesByType;
  void *v12;
  void *v13;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("|"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INKeyImageExtraction proxyIdentifier](self, "proxyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    if (objc_msgSend(v5, "count") == 2)
    {
      objc_msgSend(v5, "objectAtIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");

      keyImagesByType = self->_keyImagesByType;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](keyImagesByType, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[INKeyImageExtraction keyImage](self, "keyImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)serviceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[INKeyImageExtraction proxyIdentifier](self, "proxyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.INKeyImageExtraction-%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unint64_t)servicePriority
{
  return 25;
}

- (INKeyImageExtraction)initWithCoder:(id)a3
{
  id v4;
  INKeyImageExtraction *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = -[INKeyImageExtraction init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proxyIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INKeyImageExtraction setProxyIdentifier:](v5, "setProxyIdentifier:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[INImage _classesInCluster](INImage, "_classesInCluster");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setByAddingObjectsFromArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("keyImage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[INKeyImageExtraction setKeyImagesByType:](v5, "setKeyImagesByType:", v12);

    v13 = (void *)MEMORY[0x1E0C99E60];
    +[INImage _classesInCluster](INImage, "_classesInCluster");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("keyImage"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      -[INKeyImageExtraction setKeyImage:](v5, "setKeyImage:", v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INKeyImageExtraction proxyIdentifier](self, "proxyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("proxyIdentifier"));

  -[INKeyImageExtraction keyImagesByType](self, "keyImagesByType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("keyImagesByType"));

}

- (int64_t)_imageTypeToStore
{
  return self->_imageTypeToStore;
}

- (void)_setImageTypeToStore:(int64_t)a3
{
  self->_imageTypeToStore = a3;
}

- (NSString)proxyIdentifier
{
  return self->_proxyIdentifier;
}

- (void)setProxyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setKeyImagesByType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyIdentifier, 0);
  objc_storeStrong((id *)&self->_keyImagesByType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
