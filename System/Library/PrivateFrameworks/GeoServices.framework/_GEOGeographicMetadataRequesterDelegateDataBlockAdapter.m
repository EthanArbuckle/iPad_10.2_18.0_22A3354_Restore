@implementation _GEOGeographicMetadataRequesterDelegateDataBlockAdapter

- (_GEOGeographicMetadataRequesterDelegateDataBlockAdapter)initWithBlock:(id)a3
{
  id v4;
  _GEOGeographicMetadataRequesterDelegateDataBlockAdapter *v5;
  uint64_t v6;
  id block;
  _GEOGeographicMetadataRequesterDelegateDataBlockAdapter *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GEOGeographicMetadataRequesterDelegateDataBlockAdapter;
  v5 = -[_GEOGeographicMetadataRequesterDelegateDataBlockAdapter init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)geoGeographicMetadataRequester:(id)a3 resultsDidNotChangeForLocation:(id)a4
{
  (*((void (**)(void))self->_block + 2))();
}

- (void)geoGeographicMetadataRequester:(id)a3 returnedNewResults:(id)a4 forLocation:(id)a5
{
  (*((void (**)(void))self->_block + 2))();
}

- (void)geoGeographicMetadataRequester:(id)a3 failedWithError:(id)a4 forLocation:(id)a5
{
  (*((void (**)(void))self->_block + 2))();
}

- (void)geoGeographicMetadataRequester:(id)a3 skippedLocation:(id)a4
{
  uint8_t v4[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: How in the world did we skip a location on a single-use requester?", v4, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
