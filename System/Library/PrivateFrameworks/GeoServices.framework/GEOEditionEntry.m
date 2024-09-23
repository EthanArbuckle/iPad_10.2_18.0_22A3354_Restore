@implementation GEOEditionEntry

- ($BEA7584F61CD05F8F8BF60F665CAC5DB)tileset
{
  return ($BEA7584F61CD05F8F8BF60F665CAC5DB)self->_tileset.value;
}

- (void)setTileset:(id)a3
{
  self->_tileset.value = a3.var0;
}

- (unsigned)edition
{
  return self->_tileset.structured.var0.standard;
}

- (void)setEdition:(unsigned int)a3
{
  self->_tileset.structured.var0.standard = ($DCC98B375FC8DDD19A11F3C3530876B8)a3;
}

- (unsigned)provider
{
  return self->_edition;
}

- (void)setProvider:(unsigned int)a3
{
  self->_edition = a3;
}

- (BOOL)invalidateOnly
{
  return self->_provider;
}

- (void)setInvalidateOnly:(BOOL)a3
{
  LOBYTE(self->_provider) = a3;
}

@end
