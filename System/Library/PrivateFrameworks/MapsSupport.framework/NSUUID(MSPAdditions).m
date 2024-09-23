@implementation NSUUID(MSPAdditions)

+ (id)_maps_zeroUUID
{
  if (qword_1ED3282B8 != -1)
    dispatch_once(&qword_1ED3282B8, &__block_literal_global_0);
  return (id)_MergedGlobals_33;
}

+ (id)_maps_UUIDWithUUIDString:()MSPAdditions
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  objc_msgSend((id)objc_opt_class(), "_maps_zeroUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);

  if ((v4 & 1) != 0)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (uint64_t)_maps_compare:()MSPAdditions
{
  id v4;
  int v5;
  unsigned __int8 uu2[8];
  uint64_t v8;
  unsigned __int8 uu1[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)uu1 = 0;
  v10 = 0;
  *(_QWORD *)uu2 = 0;
  v8 = 0;
  v4 = a3;
  objc_msgSend(a1, "getUUIDBytes:", uu1);
  objc_msgSend(v4, "getUUIDBytes:", uu2);

  v5 = uuid_compare(uu1, uu2);
  if (v5 < 0)
    return -1;
  else
    return v5 != 0;
}

@end
