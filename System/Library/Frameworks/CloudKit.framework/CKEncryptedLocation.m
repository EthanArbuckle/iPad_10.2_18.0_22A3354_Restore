@implementation CKEncryptedLocation

- (CKEncryptedLocation)initWithLocation:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CKEncryptedLocation *v17;
  void *v19;
  CKException *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  id v30;
  objc_super v31;
  id v32;

  v4 = a3;
  v32 = 0;
  v5 = _CKCheckArgument((uint64_t)"location", v4, 0, 0, 0, &v32);
  v6 = v32;
  if ((v5 & 1) == 0)
  {
    v19 = v6;
    v20 = [CKException alloc];
    v24 = objc_msgSend_code(v19, v21, v22, v23);
    objc_msgSend_localizedDescription(v19, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend_initWithCode_format_(v20, v29, v24, (uint64_t)CFSTR("%@"), v28);

    objc_exception_throw(v30);
  }

  v7 = (void *)objc_opt_new();
  objc_msgSend_CKDPLocationCoordinateFromCLLocation_(MEMORY[0x1E0C9E3B8], v8, (uint64_t)v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocationValue_(v7, v11, (uint64_t)v10, v12);

  objc_msgSend_data(v7, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31.receiver = self;
  v31.super_class = (Class)CKEncryptedLocation;
  v17 = -[CKEncryptedData initWithData:](&v31, sel_initWithData_, v16);

  return v17;
}

- (CLLocation)location
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  CKDPRecordFieldValueEncryptedValue *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  objc_msgSend_data(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    v8 = (void *)objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    v9 = (void *)MEMORY[0x1E0C9E3B8];
    objc_msgSend_locationValue(v8, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKLocationFromPLocationCoordinate_(v9, v14, (uint64_t)v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return (CLLocation *)v16;
}

- (id)value
{
  return (id)((uint64_t (*)(CKEncryptedLocation *, char *))MEMORY[0x1E0DE7D20])(self, sel_location);
}

@end
