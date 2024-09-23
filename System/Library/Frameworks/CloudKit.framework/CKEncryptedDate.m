@implementation CKEncryptedDate

- (NSDate)date
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
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  objc_msgSend_data(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [CKDPRecordFieldValueEncryptedValue alloc];
    v8 = (void *)objc_msgSend_initWithData_(v5, v6, (uint64_t)v4, v7);
    v9 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend_dateValue(v8, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_time(v13, v14, v15, v16);
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v9, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return (NSDate *)v20;
}

- (CKEncryptedDate)initWithDate:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  CKDPRecordFieldValueEncryptedValue *v8;
  CKDPDate *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  CKEncryptedDate *v28;
  CKException *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  id v40;
  objc_super v41;
  id v42;

  v4 = a3;
  v42 = 0;
  v5 = _CKCheckArgument((uint64_t)"date", v4, 0, 0, 0, &v42);
  v6 = v42;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    v30 = [CKException alloc];
    v34 = objc_msgSend_code(v7, v31, v32, v33);
    objc_msgSend_localizedDescription(v7, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (id)objc_msgSend_initWithCode_format_(v30, v39, v34, (uint64_t)CFSTR("%@"), v38);

    objc_exception_throw(v40);
  }

  v8 = objc_alloc_init(CKDPRecordFieldValueEncryptedValue);
  v9 = objc_alloc_init(CKDPDate);
  objc_msgSend_setDateValue_(v8, v10, (uint64_t)v9, v11);

  objc_msgSend_timeIntervalSinceReferenceDate(v4, v12, v13, v14);
  v16 = v15;
  objc_msgSend_dateValue(v8, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTime_(v20, v21, v22, v23, v16);

  objc_msgSend_data(v8, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41.receiver = self;
  v41.super_class = (Class)CKEncryptedDate;
  v28 = -[CKEncryptedData initWithData:](&v41, sel_initWithData_, v27);

  return v28;
}

@end
