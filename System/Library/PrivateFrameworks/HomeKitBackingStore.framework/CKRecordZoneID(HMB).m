@implementation CKRecordZoneID(HMB)

- (id)hmbDescription
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "ownerName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0C94730]);

  if (v3)
  {
    objc_msgSend(a1, "zoneName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "ownerName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "zoneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), v6, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
