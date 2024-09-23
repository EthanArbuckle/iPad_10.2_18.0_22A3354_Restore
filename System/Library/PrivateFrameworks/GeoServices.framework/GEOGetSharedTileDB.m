@implementation GEOGetSharedTileDB

void ___GEOGetSharedTileDB_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint8_t v4[16];

  +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "proxy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "tileCache");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_MergedGlobals_210;
    _MergedGlobals_210 = v2;

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [tileServerProxy isKindOfClass:GEOTileServerLocalProxy.class]", v4, 2u);
  }

}

@end
