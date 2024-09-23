@implementation MPCStoreLibraryPersonalizationMiddleware

- (id)playerModelObject:(id)a3 propertySet:(id)a4 atIndexPath:(id)a5 chain:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  if (objc_msgSend(v11, "length") == 1)
  {
    -[MPSectionedCollection sectionAtIndex:](self->_personalizedModelObjects, "sectionAtIndex:", objc_msgSend(v11, "section"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v11, "length") != 2)
    {
      if (objc_msgSend(0, "type"))
      {
LABEL_11:
        v15 = v10;
        goto LABEL_12;
      }
      v15 = 0;
LABEL_10:

      goto LABEL_11;
    }
    -[MPSectionedCollection itemAtIndexPath:](self->_personalizedModelObjects, "itemAtIndexPath:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
  if (!objc_msgSend(v14, "type"))
    goto LABEL_10;
  if (!v15)
    goto LABEL_11;
LABEL_12:
  objc_msgSend(v12, "nextObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "playerModelObject:propertySet:atIndexPath:chain:", v15, v13, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizedModelObjects, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (id)operationsForRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MPCStoreLibraryPersonalizationMiddleware operationsForPlayerRequest:](self, "operationsForPlayerRequest:", v4);
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
  MPCStoreLibraryPersonalizationMiddlewareOperation *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[MPCStoreLibraryPersonalizationMiddlewareOperation initWithMiddleware:playerRequest:]([MPCStoreLibraryPersonalizationMiddlewareOperation alloc], "initWithMiddleware:playerRequest:", self, v4);

  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (void)setInvalidationObservers:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationObservers, a3);
}

- (MPSectionedCollection)personalizedModelObjects
{
  return self->_personalizedModelObjects;
}

- (void)setPersonalizedModelObjects:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedModelObjects, a3);
}

@end
