@implementation NSUUID(GEOExtras)

+ (id)_geo_uuidForData:()GEOExtras
{
  id v3;
  void *v4;
  uint8_t v6[16];

  v3 = a3;
  if (objc_msgSend(v3, "length") == 16)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v3), "bytes"));
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: data.length == sizeof(uuid_t)", v6, 2u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)_geo_uuidForWaypointUUID:()GEOExtras
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];

  v3 = a3;
  if (v3)
  {
    v4 = v3[2];
    v5 = v3[3];
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v7[0] = v4;

  v7[1] = v5;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v7);
}

+ (id)_geo_uuidForHighBytes:()GEOExtras lowBytes:
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v5);
}

+ (id)_geo_dataForUUID
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_geo_data");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)_geo_data
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (GEOWaypointUUID)_geo_waypointUUID
{
  GEOWaypointUUID *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;

  v5 = 0;
  v6 = 0;
  objc_msgSend(a1, "getUUIDBytes:", &v5);
  v1 = objc_alloc_init(GEOWaypointUUID);
  if (v1)
  {
    v2 = v5;
    *(_BYTE *)&v1->_flags |= 1u;
    v1->_high = v2;
    v3 = v6;
    *(_BYTE *)&v1->_flags |= 2u;
    v1->_low = v3;
  }
  return v1;
}

- (uint64_t)_geo_getHighBytes:()GEOExtras lowBytes:
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  result = objc_msgSend(a1, "getUUIDBytes:", &v8);
  v7 = v9;
  *a3 = v8;
  *a4 = v7;
  return result;
}

+ (id)_geo_waypointUUIDForData:()GEOExtras
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_uuidForData:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_geo_waypointUUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_geo_dataForWaypointUUID:()GEOExtras
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_uuidForWaypointUUID:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_geo_data");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
