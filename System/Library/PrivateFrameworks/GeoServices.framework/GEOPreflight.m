@implementation GEOPreflight

+ (NSArray)queryItems
{
  int BOOL;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  BOOL = GEOConfigGetBOOL(GeoServicesConfig_VenuesPreflightEnabled, (uint64_t)off_1EDF4DB18);
  v3 = 2;
  if (BOOL)
    v3 = 3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("preflight"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

+ (id)queryStringForPreflightOptions:(unsigned int)a3
{
  if (!a3)
    return &stru_1E1C241D0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("preflight=%u"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
