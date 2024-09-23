@implementation _AXAssertionServer

- (_AXAssertionServer)init
{
  _AXAssertionServer *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_AXAssertionServer;
  v2 = -[_AXAssertionServer init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AXAssertionServer setHeldAssertionMap:](v2, "setHeldAssertionMap:", v3);

  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("_AXAssertionServer:<%p> Held Assertions:\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_AXAssertionServer heldAssertionMap](self, "heldAssertionMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33___AXAssertionServer_description__block_invoke;
  v7[3] = &unk_1E24C6090;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (void)addHeldAssertionOfType:(id)a3 byClient:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  uint64_t v13;
  const __CFString *v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[_AXAssertionServer heldAssertionMap](self, "heldAssertionMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v18);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AXAssertionServer heldAssertionMap](self, "heldAssertionMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v18);

  }
  if (objc_msgSend(v9, "containsObject:", v6))
  {
    v16 = v18;
    v17 = v9;
    v14 = CFSTR("Trying to add assertion holder ID:(%@) with type:(%@), but that ID is already in the holders list: (%@). Something is out of wack");
    v15 = v6;
    LOBYTE(v13) = 1;
    _AXLogWithFacility();
  }
  objc_msgSend(v9, "addObject:", v6, v13, v14, v15, v16, v17);
  if (!v8)
  {
    -[_AXAssertionServer assertionWasAcquiredHandler](self, "assertionWasAcquiredHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[_AXAssertionServer assertionWasAcquiredHandler](self, "assertionWasAcquiredHandler");
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v12)[2](v12, v18);

    }
  }

}

- (void)removeHeldAssertionOfType:(id)a3 byClient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[_AXAssertionServer heldAssertionMap](self, "heldAssertionMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "containsObject:", v6) & 1) == 0)
  {
    _AXLogWithFacility();
    goto LABEL_6;
  }
  objc_msgSend(v8, "removeObject:", v6);

  if (!objc_msgSend(v8, "count"))
  {
    -[_AXAssertionServer heldAssertionMap](self, "heldAssertionMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v11);

    -[_AXAssertionServer assertionWasReleasedHandler](self, "assertionWasReleasedHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[_AXAssertionServer assertionWasReleasedHandler](self, "assertionWasReleasedHandler");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id))v6 + 2))(v6, v11);
LABEL_6:

    }
  }

}

- (id)clientsHoldingAssertionOfType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_AXAssertionServer heldAssertionMap](self, "heldAssertionMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)assertionWasAcquiredHandler
{
  return self->_assertionWasAcquiredHandler;
}

- (void)setAssertionWasAcquiredHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)assertionWasReleasedHandler
{
  return self->_assertionWasReleasedHandler;
}

- (void)setAssertionWasReleasedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)heldAssertionMap
{
  return self->_heldAssertionMap;
}

- (void)setHeldAssertionMap:(id)a3
{
  objc_storeStrong((id *)&self->_heldAssertionMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heldAssertionMap, 0);
  objc_storeStrong(&self->_assertionWasReleasedHandler, 0);
  objc_storeStrong(&self->_assertionWasAcquiredHandler, 0);
}

@end
