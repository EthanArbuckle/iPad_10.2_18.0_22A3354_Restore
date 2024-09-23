@implementation NSUUID(MOExtensions)

+ (id)uuidFromString:()MOExtensions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t buf[4];
  id v10;
  _DWORD v11[3];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@"), v3, v3, v3, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((unint64_t)objc_msgSend(v4, "length") < 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v10 = v3;
      LOWORD(v11[0]) = 2112;
      *(_QWORD *)((char *)v11 + 2) = v6;
      _os_log_impl(&dword_1CAE42000, v7, OS_LOG_TYPE_INFO, "Input string is not valid, string, %@, UUID, %@", buf, 0x16u);
    }

  }
  else
  {
    objc_msgSend(v4, "getBytes:range:", buf, 0, 12);
    v11[0] = objc_msgSend(v3, "hash");
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", buf);
  }

  return v6;
}

@end
