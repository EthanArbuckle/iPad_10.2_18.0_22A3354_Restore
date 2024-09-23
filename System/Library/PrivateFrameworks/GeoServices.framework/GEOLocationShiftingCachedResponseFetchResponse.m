@implementation GEOLocationShiftingCachedResponseFetchResponse

- (GEOLocationShiftingCachedResponseFetchResponse)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOLocationShiftingCachedResponseFetchResponse *v7;
  const void *data;
  void *v9;
  uint64_t v10;
  GEOLocationShiftFunctionResponse *function;
  GEOLocationShiftingCachedResponseFetchResponse *v12;
  size_t length;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOLocationShiftingCachedResponseFetchResponse;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v15, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "function", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      function = v7->_function;
      v7->_function = (GEOLocationShiftFunctionResponse *)v10;

    }
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEOLocationShiftFunctionResponse *function;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOLocationShiftingCachedResponseFetchResponse;
  -[GEOXPCReply encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  function = self->_function;
  if (function)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", function, 1, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "function", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
}

- (BOOL)isValid
{
  return 1;
}

- (GEOLocationShiftFunctionResponse)function
{
  return self->_function;
}

- (void)setFunction:(id)a3
{
  objc_storeStrong((id *)&self->_function, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_function, 0);
}

@end
