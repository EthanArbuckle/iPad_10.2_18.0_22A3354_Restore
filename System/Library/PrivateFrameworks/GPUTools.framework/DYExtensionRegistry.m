@implementation DYExtensionRegistry

+ (id)sharedExtensionRegistry
{
  if (sharedExtensionRegistry_registry_once != -1)
    dispatch_once(&sharedExtensionRegistry_registry_once, &__block_literal_global_2);
  return (id)sharedExtensionRegistry_registry;
}

uint64_t __46__DYExtensionRegistry_sharedExtensionRegistry__block_invoke()
{
  uint64_t result;

  result = objc_opt_new();
  sharedExtensionRegistry_registry = result;
  return result;
}

- (DYExtensionRegistry)init
{
  DYExtensionRegistry *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DYExtensionRegistry;
  v2 = -[DYExtensionRegistry init](&v4, sel_init);
  if (v2)
  {
    v2->_slotsMap = (NSMutableDictionary *)objc_opt_new();
    v2->_identifiersMap = (NSMutableDictionary *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYExtensionRegistry;
  -[DYExtensionRegistry dealloc](&v3, sel_dealloc);
}

- (void)registerExtension:(id)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_identifiersMap, "objectForKey:", objc_msgSend(a3, "identifier"));
  if (v5)
  {
    v6 = v5;
    objc_msgSend((id)objc_msgSend(v5, "identifier"), "UTF8String");
    objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
    objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    DYLog();
  }
  else
  {
    v7 = (void *)-[NSMutableDictionary objectForKey:](self->_slotsMap, "objectForKey:", objc_msgSend(a3, "slot"));
    if (!v7)
    {
      v7 = (void *)objc_opt_new();
      -[NSMutableDictionary setObject:forKey:](self->_slotsMap, "setObject:forKey:", v7, objc_msgSend(a3, "slot"));

    }
    objc_msgSend(v7, "addObject:", a3);
    -[NSMutableDictionary setObject:forKey:](self->_identifiersMap, "setObject:forKey:", a3, objc_msgSend(a3, "identifier"));
  }
}

- (id)extensionsForSlot:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_slotsMap, "objectForKey:", a3);
}

@end
