@implementation HMDBackingStoreCacheFetchModelObjectResult

- (HMDBackingStoreCacheFetchModelObjectResult)initWithRecord:(id)a3 data:(id)a4 encoding:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  HMDBackingStoreCacheFetchModelObjectResult *v12;
  void *v13;
  uint64_t v14;
  CKRecord *record;
  uint64_t v16;
  HMDBackingStoreModelObject *object;
  void *v18;
  HMDBackingStoreCacheFetchModelObjectResult *v19;
  NSObject *v20;
  void *v21;
  id v22;
  HMDBackingStoreCacheFetchModelObjectResult *v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HMDBackingStoreCacheFetchModelObjectResult;
  v12 = -[HMDBackingStoreCacheFetchModelObjectResult init](&v25, sel_init);
  if (!v12)
    goto LABEL_13;
  if (v10 && v11)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v10, 0);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithCoder:", v13);
    record = v12->_record;
    v12->_record = (CKRecord *)v14;

    if (a5)
    {
      +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", v11, a5, a6);
      v16 = objc_claimAutoreleasedReturnValue();
      object = v12->_object;
      v12->_object = (HMDBackingStoreModelObject *)v16;

    }
    if (*a6)
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = v12;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *a6;
        *(_DWORD *)buf = 138543618;
        v27 = v21;
        v28 = 2112;
        v29 = v22;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@unable to decode cached object %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }
    else if (v12->_object)
    {
      v23 = v12;
      goto LABEL_16;
    }
    v23 = 0;
LABEL_16:

    goto LABEL_17;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v23 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_13:
    v23 = 0;
  }
LABEL_17:

  return v23;
}

- (CKRecord)record
{
  return self->_record;
}

- (HMDBackingStoreModelObject)object
{
  return self->_object;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
