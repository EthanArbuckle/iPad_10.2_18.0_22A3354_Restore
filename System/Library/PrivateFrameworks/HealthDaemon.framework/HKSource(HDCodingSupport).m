@implementation HKSource(HDCodingSupport)

- (HDCodableSource)codableRepresentationForSync
{
  HDCodableSource *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(HDCodableSource);
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSource setName:](v2, "setName:", v3);

  objc_msgSend(a1, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSource setBundleIdentifier:](v2, "setBundleIdentifier:", v4);

  objc_msgSend(a1, "_productType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSource setProductType:](v2, "setProductType:", v5);

  -[HDCodableSource setOptions:](v2, "setOptions:", objc_msgSend(a1, "_options"));
  return v2;
}

+ (id)createWithCodable:()HDCodingSupport
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) != 0)
      v5 = v4[2];
    else
      v5 = 0;
    objc_msgSend(a1, "_sourceWithBundleIdentifier:name:productType:options:", v4[3], v4[4], v4[6], v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
