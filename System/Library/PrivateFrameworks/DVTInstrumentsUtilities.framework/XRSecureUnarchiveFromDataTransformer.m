@implementation XRSecureUnarchiveFromDataTransformer

+ (id)whitelistedClassesForTransforming
{
  void *v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_25583C778);
  v2 = (void *)qword_25583C770;
  if (!qword_25583C770)
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    v4 = objc_opt_class();
    objc_msgSend_setWithObjects_(v3, v5, v4, v6, v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)qword_25583C770;
    qword_25583C770 = v8;

    v2 = (void *)qword_25583C770;
  }
  v10 = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_25583C778);
  return v10;
}

+ (void)addWhitelistedClass:(Class)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  if (a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_25583C778);
    v7 = (void *)qword_25583C770;
    if (!qword_25583C770)
    {
      v8 = (void *)MEMORY[0x24BDBCF20];
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      objc_msgSend_setWithObjects_(v8, v11, v9, v12, v13, v10, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)qword_25583C770;
      qword_25583C770 = v14;

      v7 = (void *)qword_25583C770;
    }
    objc_msgSend_setByAddingObject_(v7, v4, (uint64_t)a3, v5, v6);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)qword_25583C770;
    qword_25583C770 = v16;

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_25583C778);
  }
}

- (id)transformedValue:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  id v14;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend_whitelistedClassesForTransforming(XRSecureUnarchiveFromDataTransformer, v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend_xr_unarchiveSecureCodingObjectFromData_ofClasses_withError_(v8, v10, (uint64_t)v3, (uint64_t)v9, (uint64_t)&v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;

    if (v12)
      NSLog(CFSTR("XRSecureUnarchiveFromDataTransformer error unarchiving: %@"), v12);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v3 = a3;
  if (objc_msgSend_conformsToProtocol_(v3, v4, (uint64_t)&unk_25583FFE8, v5, v6))
  {
    v13 = 0;
    objc_msgSend_xr_archiveSecureCodingObject_withError_(MEMORY[0x24BDD1618], v7, (uint64_t)v3, (uint64_t)&v13, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    v11 = v10;
    if (v10)
      NSLog(CFSTR("XRSecureUnarchiveFromDataTransformer error archiving: %@"), v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
