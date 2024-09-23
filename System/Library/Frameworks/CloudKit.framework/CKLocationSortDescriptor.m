@implementation CKLocationSortDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKLocationSortDescriptor)initWithKey:(NSString *)key relativeLocation:(CLLocation *)relativeLocation
{
  CLLocation *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CKLocationSortDescriptor *v10;
  uint64_t v11;
  CLLocation *v12;
  objc_super v14;

  v6 = relativeLocation;
  v14.receiver = self;
  v14.super_class = (Class)CKLocationSortDescriptor;
  v10 = -[CKLocationSortDescriptor initWithKey:ascending:selector:](&v14, sel_initWithKey_ascending_selector_, key, 1, 0);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v7, v8, v9);
    v12 = v10->_relativeLocation;
    v10->_relativeLocation = (CLLocation *)v11;

  }
  return v10;
}

- (CKLocationSortDescriptor)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  CKLocationSortDescriptor *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CLLocation *relativeLocation;
  objc_super v12;

  v4 = aDecoder;
  v12.receiver = self;
  v12.super_class = (Class)CKLocationSortDescriptor;
  v5 = -[CKLocationSortDescriptor initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("Location"));
    v9 = objc_claimAutoreleasedReturnValue();
    relativeLocation = v5->_relativeLocation;
    v5->_relativeLocation = (CLLocation *)v9;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CLLocation)relativeLocation
{
  uint64_t v2;
  uint64_t v3;

  return (CLLocation *)(id)objc_msgSend_copy(self->_relativeLocation, a2, v2, v3);
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_relativeLocation(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("relativeLocation=%@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  return (id)((uint64_t (*)(CKLocationSortDescriptor *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v11.receiver = self;
  v11.super_class = (Class)CKLocationSortDescriptor;
  -[CKLocationSortDescriptor encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend_relativeLocation(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("Location"));

  objc_autoreleasePoolPop(v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKLocationSortDescriptor *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;

  v4 = [CKLocationSortDescriptor alloc];
  objc_msgSend_key(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relativeLocation(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithKey_relativeLocation_(v4, v13, (uint64_t)v8, (uint64_t)v12);

  v18 = objc_msgSend_ascending(self, v15, v16, v17);
  objc_msgSend__setAscending_(v14, v19, v18, v20);
  return v14;
}

- (int64_t)compareObject:(id)a3 toObject:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;

  v6 = a4;
  v7 = a3;
  objc_msgSend_key(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v7, v12, (uint64_t)v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_key(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v6, v19, (uint64_t)v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_relativeLocation(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_distanceFromLocation_(v14, v26, (uint64_t)v25, v27);
  v29 = v28;

  objc_msgSend_relativeLocation(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_distanceFromLocation_(v21, v34, (uint64_t)v33, v35);
  v37 = v36;

  if (objc_msgSend_ascending(self, v38, v39, v40))
    v41 = v29 < v37;
  else
    v41 = v29 > v37;

  return v41;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeLocation, 0);
}

@end
