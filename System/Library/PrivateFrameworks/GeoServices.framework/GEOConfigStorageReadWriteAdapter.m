@implementation GEOConfigStorageReadWriteAdapter

- (GEOConfigStorageReadWriteAdapter)initWithStorage:(id)a3
{
  id v5;
  GEOConfigStorageReadWriteAdapter *v6;
  GEOConfigStorageReadWriteAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOConfigStorageReadWriteAdapter;
  v6 = -[GEOConfigStorageReadWriteAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storage, a3);

  return v7;
}

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  return (id)-[GEOConfigStorageReadOnly getConfigValueForKey:countryCode:options:source:](self->_storage, "getConfigValueForKey:countryCode:options:source:", a3, a4, a5, a6);
}

- (void)resync
{
  -[GEOConfigStorageReadOnly resync](self->_storage, "resync");
}

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  uint8_t v6[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: __objc_no", v6, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
