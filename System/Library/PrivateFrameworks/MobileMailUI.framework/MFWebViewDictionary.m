@implementation MFWebViewDictionary

- (MFWebViewDictionary)initWithCapacity:(unint64_t)a3
{
  MFWebViewDictionary *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *storage;
  NSMutableSet *v6;
  NSMutableSet *changedKeys;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFWebViewDictionary;
  v3 = -[MFWebViewDictionary init](&v9, sel_init, a3);
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    storage = v3->_storage;
    v3->_storage = v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    changedKeys = v3->_changedKeys;
    v3->_changedKeys = v6;

    v3->_requiresResynchronization = 1;
  }
  return v3;
}

- (MFWebViewDictionary)init
{
  return -[MFWebViewDictionary initWithCapacity:](self, "initWithCapacity:", 0);
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *javascriptName;
  void *v9;
  void *v10;
  void *v11;

  -[NSMutableDictionary descriptionWithLocale:indent:](self->_storage, "descriptionWithLocale:indent:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  javascriptName = self->_javascriptName;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p> jsName='%@' => %@"), v7, self, javascriptName, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)registerWithWebView:(id)a3 javascriptName:(id)a4
{
  id v6;
  NSString *v7;
  NSString *javascriptName;
  void *v9;
  void *v10;
  MFMailWebProcessProxy *v11;
  MFMailWebProcessProxy *webProcessProxy;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = (NSString *)objc_msgSend(v6, "copy");
  javascriptName = self->_javascriptName;
  self->_javascriptName = v7;

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EFF780F8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_remoteObjectRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxyWithInterface:", v9);
  v11 = (MFMailWebProcessProxy *)objc_claimAutoreleasedReturnValue();
  webProcessProxy = self->_webProcessProxy;
  self->_webProcessProxy = v11;

  -[MFMailWebProcessProxy registerDictionary:name:](self->_webProcessProxy, "registerDictionary:name:", self->_storage, v6);
}

- (void)_setRequiresSynchronization
{
  self->_requiresResynchronization = 1;
}

- (void)_updateRemoteInstance
{
  NSMutableDictionary *storage;
  void *v4;
  id v5;

  if (self->_requiresResynchronization)
  {
    -[MFMailWebProcessProxy setDictionary:forWebViewDictionaryWithName:](self->_webProcessProxy, "setDictionary:forWebViewDictionaryWithName:", self->_storage, self->_javascriptName);
    self->_requiresResynchronization = 0;
  }
  else
  {
    storage = self->_storage;
    -[NSMutableSet allObjects](self->_changedKeys, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary dictionaryWithValuesForKeys:](storage, "dictionaryWithValuesForKeys:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[MFMailWebProcessProxy setValuesForKeysWithDictionary:forWebViewDictionaryWithName:](self->_webProcessProxy, "setValuesForKeysWithDictionary:forWebViewDictionaryWithName:", v5, self->_javascriptName);
    -[NSMutableSet removeAllObjects](self->_changedKeys, "removeAllObjects");

  }
}

- (BOOL)isEqualToDictionary:(id)a3
{
  if (a3 == self)
    return 1;
  else
    return -[NSMutableDictionary isEqualToDictionary:](self->_storage, "isEqualToDictionary:", *((_QWORD *)a3 + 1));
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_storage, "hash");
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_storage, "count");
}

- (id)objectForKey:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keyEnumerator
{
  return (id)-[NSMutableDictionary keyEnumerator](self->_storage, "keyEnumerator");
}

- (id)allKeys
{
  return (id)-[NSMutableDictionary allKeys](self->_storage, "allKeys");
}

- (id)allKeysForObject:(id)a3
{
  -[NSMutableDictionary allKeysForObject:](self->_storage, "allKeysForObject:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allValues
{
  return (id)-[NSMutableDictionary allValues](self->_storage, "allValues");
}

- (id)objectEnumerator
{
  return (id)-[NSMutableDictionary objectEnumerator](self->_storage, "objectEnumerator");
}

- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  -[NSMutableDictionary objectsForKeys:notFoundMarker:](self->_storage, "objectsForKeys:notFoundMarker:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  -[NSMutableDictionary getObjects:andKeys:count:](self->_storage, "getObjects:andKeys:count:", a3, a4, a5);
}

- (id)objectForKeyedSubscript:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_storage, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableDictionary countByEnumeratingWithState:objects:count:](self->_storage, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[NSMutableDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](self->_storage, "enumerateKeysAndObjectsWithOptions:usingBlock:", a3, a4);
}

- (void)removeObjectForKey:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableDictionary removeObjectForKey:](self->_storage, "removeObjectForKey:");
  -[NSMutableSet addObject:](self->_changedKeys, "addObject:", v4);
  -[MFWebViewDictionary synchronize](self, "synchronize");

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[NSMutableDictionary setObject:forKey:](self->_storage, "setObject:forKey:", v7, v6);
  -[NSMutableSet addObject:](self->_changedKeys, "addObject:", v6);
  -[MFWebViewDictionary synchronize](self, "synchronize");

}

- (void)removeAllObjects
{
  -[NSMutableDictionary removeAllObjects](self->_storage, "removeAllObjects");
  -[MFWebViewDictionary _setRequiresSynchronization](self, "_setRequiresSynchronization");
  -[MFWebViewDictionary synchronize](self, "synchronize");
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableDictionary removeObjectsForKeys:](self->_storage, "removeObjectsForKeys:");
  -[NSMutableSet addObjectsFromArray:](self->_changedKeys, "addObjectsFromArray:", v4);
  -[MFWebViewDictionary synchronize](self, "synchronize");

}

- (void)setDictionary:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableDictionary setDictionary:](self->_storage, "setDictionary:");
  -[MFWebViewDictionary _setRequiresSynchronization](self, "_setRequiresSynchronization");
  -[MFWebViewDictionary synchronize](self, "synchronize");

}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_storage, "setObject:forKeyedSubscript:", v7, v6);
  -[NSMutableSet addObject:](self->_changedKeys, "addObject:", v6);
  -[MFWebViewDictionary synchronize](self, "synchronize");

}

- (void)setValuesForKeysWithDictionary:(id)a3
{
  NSMutableSet *changedKeys;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary setValuesForKeysWithDictionary:](self->_storage, "setValuesForKeysWithDictionary:");
  changedKeys = self->_changedKeys;
  objc_msgSend(v6, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObjectsFromArray:](changedKeys, "addObjectsFromArray:", v5);

  -[MFWebViewDictionary synchronize](self, "synchronize");
}

- (NSString)javascriptName
{
  return self->_javascriptName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_javascriptName, 0);
  objc_storeStrong((id *)&self->_changedKeys, 0);
  objc_storeStrong((id *)&self->_webProcessProxy, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
