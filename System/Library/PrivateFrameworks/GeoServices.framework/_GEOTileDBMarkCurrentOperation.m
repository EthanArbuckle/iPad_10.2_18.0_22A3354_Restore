@implementation _GEOTileDBMarkCurrentOperation

- (void)performWithDB:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  v4 = a3;
  if ((objc_msgSend(v4, "_markExistingTileDataAsCurrentOnDBQueue:reason:subscriptionIdentifier:", &self->super._key, self->super._reason, self->super._subscriptionIdentifier) & 1) == 0)
  {
    GEOGetTileDBLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Tried to update existing tile entry to 'current', but it doesn't exist. Falling back to a full 'add'", buf, 2u);
    }

    v6.receiver = self;
    v6.super_class = (Class)_GEOTileDBMarkCurrentOperation;
    -[_GEOTileDBAddTileOperation performWithDB:](&v6, sel_performWithDB_, v4);
  }

}

@end
