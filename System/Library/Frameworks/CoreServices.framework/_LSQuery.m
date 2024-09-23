@implementation _LSQuery

- (id)_init
{
  objc_super v4;

  if (!_LSCurrentProcessMayMapDatabase() && pluginQueryFault(void)::onceToken != -1)
    dispatch_once(&pluginQueryFault(void)::onceToken, &__block_literal_global_62);
  v4.receiver = self;
  v4.super_class = (Class)_LSQuery;
  return -[_LSQuery init](&v4, sel_init);
}

- (void)setLegacy:(BOOL)a3
{
  self->_legacy = a3;
  if (a3 && (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) == 0)
  {
    __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    __LAUNCH_SERVICES_IS_ABORTING_BECAUSE_THIS_PROCESS_MAY_NOT_MAP_THE_DATABASE__();
    __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_IS_USING_INSECURE_SPI__();
  }
}

- (unint64_t)hash
{
  uint64_t v3;
  objc_super v5;

  v3 = -[_LSQuery isLegacy](self, "isLegacy");
  v5.receiver = self;
  v5.super_class = (Class)_LSQuery;
  return -[_LSQuery hash](&v5, sel_hash) ^ v3;
}

- (BOOL)isLegacy
{
  return self->_legacy;
}

- (BOOL)_canResolveLocallyWithoutMappingDatabase
{
  return 0;
}

- (_LSQuery)init
{
  abort();
}

- (BOOL)isEqual:(id)a3
{
  _LSQuery *v4;
  _LSQuery *v5;
  _BOOL4 v6;
  int v7;

  v4 = (_LSQuery *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = -[_LSQuery isLegacy](v5, "isLegacy");
    v7 = v6 ^ -[_LSQuery isLegacy](self, "isLegacy") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_remoteResolutionIsExpensive
{
  return 0;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  void *v4;
  void (**v5)(id, _QWORD, void *);

  v5 = (void (**)(id, _QWORD, void *))a4;
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[_LSQuery(Internal) _enumerateWithXPCConnection:block:]", 122, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, 0, v4);

}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 0;
}

- (id)resolveExpensiveQueryRemotelyUsingResolver:(id)a3 error:(id *)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
