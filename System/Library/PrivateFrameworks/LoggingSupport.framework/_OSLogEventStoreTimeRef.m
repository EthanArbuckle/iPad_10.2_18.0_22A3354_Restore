@implementation _OSLogEventStoreTimeRef

- (unint64_t)continuousTime
{
  return self->_ct;
}

- (const)UUID
{
  return (const char *)self->_uuid;
}

+ (id)timeRef
{
  uint64_t v3;
  const char *boot_uuid;
  uuid_t uu;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  v3 = mach_continuous_time();
  boot_uuid = (const char *)_os_trace_get_boot_uuid();
  uuid_parse(boot_uuid, uu);
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:continuous:", uu, v3);
}

- (_OSLogEventStoreTimeRef)initWithDictionary:(id)a3
{
  id v4;
  _OSLogEventStoreTimeRef *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _OSLogEventStoreTimeRef *v10;

  v4 = a3;
  v5 = -[_OSLogEventStoreTimeRef init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ContinuousTime"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (!v6
      || !v7
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (v9 = objc_retainAutorelease(v6), uuid_parse((const char *)objc_msgSend(v9, "UTF8String"), v5->_uuid) == -1))
    {

      v10 = 0;
      goto LABEL_10;
    }
    v5->_ct = objc_msgSend(v8, "unsignedLongLongValue");

  }
  v10 = v5;
LABEL_10:

  return v10;
}

- (_OSLogEventStoreTimeRef)initWithUUID:(unsigned __int8)a3[16] continuous:(unint64_t)a4
{
  _OSLogEventStoreTimeRef *result;

  result = -[_OSLogEventStoreTimeRef init](self, "init");
  if (result)
  {
    *(_OWORD *)result->_uuid = *(_OWORD *)a3;
    result->_ct = a4;
  }
  return result;
}

@end
