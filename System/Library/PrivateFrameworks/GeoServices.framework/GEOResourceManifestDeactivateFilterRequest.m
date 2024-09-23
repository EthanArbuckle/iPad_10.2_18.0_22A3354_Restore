@implementation GEOResourceManifestDeactivateFilterRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOResourceManifestDeactivateFilterRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("resourcemanifest.deactivateFilter"), a3, a4, a5);
}

- (GEOResourceManifestDeactivateFilterRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOResourceManifestDeactivateFilterRequest *v7;
  const void *data;
  void *v9;
  GEOActiveResourceFilter *v10;
  GEOActiveResourceFilter *filter;
  GEOResourceManifestDeactivateFilterRequest *v12;
  uint64_t v14;
  size_t length;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOResourceManifestDeactivateFilterRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v16, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "filter", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[GEOActiveResourceFilter initWithData:]([GEOActiveResourceFilter alloc], "initWithData:", v9);
    }
    else
    {
      xpc_dictionary_get_value(v6, "filter");
      v14 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v14;
      if (!v14 || MEMORY[0x18D765A14](v14) != MEMORY[0x1E0C812E8])
        goto LABEL_5;
      v10 = objc_alloc_init(GEOActiveResourceFilter);
    }
    filter = v7->_filter;
    v7->_filter = v10;

LABEL_5:
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEOActiveResourceFilter *filter;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOResourceManifestDeactivateFilterRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  filter = self->_filter;
  if (filter)
  {
    -[GEOActiveResourceFilter data](filter, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "filter", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (GEOActiveResourceFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
}

@end
