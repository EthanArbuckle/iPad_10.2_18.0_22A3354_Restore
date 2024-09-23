@implementation CKRecordZoneID

+ (id)_hd_zoneIDForSyncCircleIdentifier:(void *)a3 name:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  if (objc_msgSend(v4, "containsString:", CFSTR(":")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__hd_zoneIDForSyncCircleIdentifier_name_, v6, CFSTR("CKRecordZoneID+HDCloudSync.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![syncCircleIdentifier containsString:RecordZoneIDComponentsSeparator]"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v4, CFSTR(":"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C95098]);
  v9 = (void *)objc_msgSend(v8, "initWithZoneName:ownerName:", v7, *MEMORY[0x1E0C94730]);

  return v9;
}

- (uint64_t)_hd_isZoneIDForSyncCircleIdentifier:(void *)a3 name:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "zoneName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count") == 2
      && (objc_msgSend(v7, "objectAtIndexedSubscript:", 1),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", v5),
          v8,
          v9))
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
