@implementation _SWBaseCollaborationSource

- (NSString)serviceName
{
  _SWBaseCollaborationSource *v2;
  SEL v3;

  v2 = (_SWBaseCollaborationSource *)NSUnimplemented_();
  return (NSString *)-[_SWBaseCollaborationSource interface](v2, v3);
}

- (id)interface
{
  _SWBaseCollaborationSource *v2;
  SEL v3;
  id v4;
  id v5;
  id v6;

  v2 = (_SWBaseCollaborationSource *)NSUnimplemented_();
  return -[_SWBaseCollaborationSource initWithItemIdentifier:domain:extension:](v2, v3, v4, v5, v6);
}

- (_SWBaseCollaborationSource)initWithItemIdentifier:(id)a3 domain:(id)a4 extension:(id)a5
{
  id v9;
  id v10;
  id v11;
  _SWBaseCollaborationSource *v12;
  _SWBaseCollaborationSource *v13;
  uint64_t v14;
  NSHashTable *listeners;
  _SWBaseCollaborationSource *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EDFD5528))
  {
    v18.receiver = self;
    v18.super_class = (Class)_SWBaseCollaborationSource;
    v12 = -[_SWBaseCollaborationSource init](&v18, sel_init);
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_itemIdentifier, a3);
      objc_storeStrong((id *)&v13->_domain, a4);
      objc_storeStrong((id *)&v13->_extension, a5);
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 0);
      v14 = objc_claimAutoreleasedReturnValue();
      listeners = v13->_listeners;
      v13->_listeners = (NSHashTable *)v14;

    }
    self = v13;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)makeListenerEndpointAndReturnError:(id *)a3
{
  void *v4;
  void *v5;
  _SWBaseCollaborationSource *v6;

  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");
  v6 = self;
  objc_sync_enter(v6);
  -[NSHashTable addObject:](v6->_listeners, "addObject:", v4);
  objc_sync_exit(v6);

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _SWBaseCollaborationSource *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  -[_SWBaseCollaborationSource interface](self, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  objc_msgSend(v7, "setExportedObject:", self);
  v9 = self;
  objc_sync_enter(v9);
  -[NSHashTable removeObject:](v9->_listeners, "removeObject:", v6);
  objc_sync_exit(v9);

  objc_initWeak(&location, v7);
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65___SWBaseCollaborationSource_listener_shouldAcceptNewConnection___block_invoke;
  v15[3] = &unk_1E217B128;
  v11 = v6;
  v16 = v11;
  objc_msgSend(v7, "setInvalidationHandler:", v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __65___SWBaseCollaborationSource_listener_shouldAcceptNewConnection___block_invoke_2;
  v13[3] = &unk_1E217B150;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v13);
  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  return 1;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (_SWFileProviderCollaborationProviding)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
