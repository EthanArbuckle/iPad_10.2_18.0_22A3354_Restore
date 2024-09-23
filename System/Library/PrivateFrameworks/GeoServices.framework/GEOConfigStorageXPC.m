@implementation GEOConfigStorageXPC

- (id)_instanceSpecificGetKey:(id)a3
{
  return -[GEOConfigPersistence xpcDefaultForKeyPath:](self->super._persister, "xpcDefaultForKeyPath:", a3);
}

- (void)_instanceSpecificSetValue:(id)a3 forKey:(id)a4
{
  -[GEOConfigPersistence setXPCDefault:forKeyPath:](self->super._persister, "setXPCDefault:forKeyPath:", a3, a4);
}

- (id)_instanceSpecificGetKeyPath:(id)a3
{
  return -[GEOConfigPersistence xpcDefaultForKeyPathComponents:](self->super._persister, "xpcDefaultForKeyPathComponents:", a3);
}

@end
