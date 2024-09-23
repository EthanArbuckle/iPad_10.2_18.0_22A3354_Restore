@implementation MPCStoreFrontLocalEquivalencyMiddleware

- (id)operationsForRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPCStoreFrontLocalEquivalencyMiddleware operationsForPlayerRequest:](self, "operationsForPlayerRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (id)operationsForPlayerRequest:(id)a3
{
  id v4;
  MPCStoreFrontLocalEquivalencyMiddlewareOperation *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[MPCStoreFrontLocalEquivalencyMiddlewareOperation initWithMiddleware:playerRequest:]([MPCStoreFrontLocalEquivalencyMiddlewareOperation alloc], "initWithMiddleware:playerRequest:", self, v4);

  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stateDumpObject
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("overridePlayingItem");
  -[MPCStoreFrontLocalEquivalencyMiddleware overridePlayingItem](self, "overridePlayingItem");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("<NULL>");
  v13[1] = v6;
  v12[2] = CFSTR("invalidationObservers");
  -[MPCStoreFrontLocalEquivalencyMiddleware invalidationObservers](self, "invalidationObservers");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("<NULL>");
  v13[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (void)setInvalidationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationObservers, a3);
}

- (MPModelGenericObject)overridePlayingItem
{
  return self->_overridePlayingItem;
}

- (void)setOverridePlayingItem:(id)a3
{
  objc_storeStrong((id *)&self->_overridePlayingItem, a3);
}

- (NSIndexPath)playingItemIndexPath
{
  return self->_playingItemIndexPath;
}

- (void)setPlayingItemIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingItemIndexPath, 0);
  objc_storeStrong((id *)&self->_overridePlayingItem, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (id)playerModelObject:(id)a3 propertySet:(id)a4 atIndexPath:(id)a5 chain:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MPModelGenericObject *v14;
  MPModelGenericObject *v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (MPModelGenericObject *)v10;
  v15 = v14;
  if (self->_playingItemIndexPath)
  {
    v15 = v14;
    if (objc_msgSend(v12, "isEqual:"))
    {
      v15 = self->_overridePlayingItem;

    }
  }
  objc_msgSend(v13, "nextObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "playerModelObject:propertySet:atIndexPath:chain:", v15, v11, v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
