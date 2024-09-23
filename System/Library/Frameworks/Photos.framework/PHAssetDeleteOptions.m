@implementation PHAssetDeleteOptions

- (PHAssetDeleteOptions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHAssetDeleteOptions;
  return -[PHAssetDeleteOptions init](&v3, sel_init);
}

- (PHAssetDeleteOptions)initWithXPCDict:(id)a3
{
  id v4;
  PHAssetDeleteOptions *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[PHAssetDeleteOptions init](self, "init");
  if (v5)
  {
    xpc_dictionary_get_value(v4, "deleteOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5->_shouldExpungeFromLocalStorageOnly = xpc_dictionary_get_BOOL(v6, "shouldExpungeFromLocalStorageOnly");
      v5->_expungeSource = xpc_dictionary_get_int64(v7, "expungeSource");
    }

  }
  return v5;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  xpc_object_t xdict;

  v4 = a3;
  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v4, "deleteOptions", xdict);

  xpc_dictionary_set_BOOL(xdict, "shouldExpungeFromLocalStorageOnly", self->_shouldExpungeFromLocalStorageOnly);
  xpc_dictionary_set_int64(xdict, "expungeSource", self->_expungeSource);

}

- (id)copyWithZone:(_NSZone *)a3
{
  PHAssetDeleteOptions *v4;

  v4 = objc_alloc_init(PHAssetDeleteOptions);
  -[PHAssetDeleteOptions setShouldExpungeFromLocalStorageOnly:](v4, "setShouldExpungeFromLocalStorageOnly:", self->_shouldExpungeFromLocalStorageOnly);
  -[PHAssetDeleteOptions setExpungeSource:](v4, "setExpungeSource:", self->_expungeSource);
  return v4;
}

- (int64_t)expungeSource
{
  return self->_expungeSource;
}

- (void)setExpungeSource:(int64_t)a3
{
  self->_expungeSource = a3;
}

- (BOOL)shouldExpungeFromLocalStorageOnly
{
  return self->_shouldExpungeFromLocalStorageOnly;
}

- (void)setShouldExpungeFromLocalStorageOnly:(BOOL)a3
{
  self->_shouldExpungeFromLocalStorageOnly = a3;
}

@end
