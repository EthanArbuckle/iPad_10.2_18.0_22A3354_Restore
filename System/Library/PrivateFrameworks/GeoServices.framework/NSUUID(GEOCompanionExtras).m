@implementation NSUUID(GEOCompanionExtras)

+ (id)_maps_UUIDWithData:()GEOCompanionExtras
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v7[0] = 0;
    v7[1] = 0;
    objc_msgSend(v3, "getBytes:length:", v7, objc_msgSend(v3, "length"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v7);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_maps_data
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
