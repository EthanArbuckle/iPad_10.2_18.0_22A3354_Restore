@implementation GEOLocationShiftingIsRequiredRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOLocationShiftingIsRequiredRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("locationshift.isRequiredForCoordinate"), a3, a4, a5);
}

- (GEOLocationShiftingIsRequiredRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char *v7;
  void *v8;
  void *v9;
  const void *data;
  void *v11;
  GEOMapRegion *v12;
  void *v13;
  char *v14;
  uint64_t v16;
  __int128 v17;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOLocationShiftingIsRequiredRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v18, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    xpc_dictionary_get_value(v6, "coordinate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v17 = 0uLL;
      if (xpc_data_get_bytes(v8, &v17, 0, 0x10uLL) == 16)
        *(_OWORD *)(v7 + 104) = v17;
    }

    *(_QWORD *)&v17 = 0;
    data = xpc_dictionary_get_data(v6, "region", (size_t *)&v17);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, (_QWORD)v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[GEOMapRegion initWithData:]([GEOMapRegion alloc], "initWithData:", v11);
    }
    else
    {
      xpc_dictionary_get_value(v6, "region");
      v16 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v16;
      if (!v16 || MEMORY[0x18D765A14](v16) != MEMORY[0x1E0C812E8])
        goto LABEL_8;
      v12 = objc_alloc_init(GEOMapRegion);
    }
    v13 = (void *)*((_QWORD *)v7 + 12);
    *((_QWORD *)v7 + 12) = v12;

LABEL_8:
    v14 = v7;
  }

  return (GEOLocationShiftingIsRequiredRequest *)v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t v5;
  GEOMapRegion *region;
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOLocationShiftingIsRequiredRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v8, sel_encodeToXPCDictionary_, v4);
  v5 = xpc_data_create(&self->_coordinate, 0x10uLL);
  if (v5)
    xpc_dictionary_set_value(v4, "coordinate", v5);

  region = self->_region;
  if (region)
  {
    -[GEOMapRegion data](region, "data");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "region", (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  }
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
}

@end
