@implementation CHE5MLModel

+ (id)modelHash
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE89FA0C;
  block[3] = &unk_1E77F6668;
  block[4] = a1;
  if (qword_1EF5684D0 != -1)
    dispatch_once(&qword_1EF5684D0, block);
  return (id)qword_1EF5684C8;
}

+ (id)createProgramLibraryWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  CHE5MLProgramLibrary *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  objc_msgSend_defaultURLOfModelInThisBundle(a1, a2, (uint64_t)a3, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    return 0;
  v12 = v7;
  objc_msgSend_URLByAppendingPathComponent_(v7, v8, (uint64_t)CFSTR("model.specialization.bundle"), v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_checkResourceIsReachableAndReturnError_(v13, v14, 0, v15, v16, v17))
  {
    v18 = v13;

    v12 = v18;
  }
  v19 = [CHE5MLProgramLibrary alloc];
  v23 = (void *)objc_msgSend_initWithModelURL_error_(v19, v20, (uint64_t)v12, (uint64_t)a3, v21, v22);

  return v23;
}

+ (id)defaultURLOfModelInThisBundle
{
  uint64_t v2;
  id v3;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("Subclasses must override this method."), 0, v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)inputNames
{
  uint64_t v2;
  id v3;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("Subclasses must override this method."), 0, v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)outputNames
{
  uint64_t v2;
  id v3;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("Subclasses must override this method."), 0, v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end
