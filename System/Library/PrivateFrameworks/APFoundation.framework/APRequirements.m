@implementation APRequirements

+ (BOOL)hasRequirements:(unint64_t)a3 error:(id *)a4
{
  char v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  int v18;

  v5 = a3;
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, a2, a3, (uint64_t)a4))
    v9 = qword_1EFB8D400 == 0;
  else
    v9 = 0;
  if (v9)
  {
    objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKey_(v10, v11, (uint64_t)CFSTR("FailForTheseRequirements"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v17 = qword_1EFB8D400 == 0;
    else
      v17 = 0;
    if (v17)
      qword_1EFB8D400 = objc_msgSend_unsignedIntegerValue(v13, v14, v15, v16);

  }
  if ((v5 & 1) == 0
    || (v18 = objc_msgSend__testForFileSystemReturningError_(APRequirements, v6, (uint64_t)a4, v8)) != 0)
  {
    LOBYTE(v18) = v5 & 1;
  }
  return v18;
}

+ (unint64_t)failForRequirements
{
  return qword_1EFB8D400;
}

+ (void)setFailForRequirements:(unint64_t)a3
{
  qword_1EFB8D400 = a3;
}

+ (BOOL)_testForFileSystemReturningError:(id *)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  int ResourceValue_forKey_error;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  id v37;
  char v38;

  if (!objc_msgSend_isAppleInternalInstall(APSystemInternal, a2, (uint64_t)a3, v3)
    || (qword_1EFB8D400 & 1) == 0)
  {
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend__buildErrorWithCode_message_returningError_(APRequirements, v14, 16001, (uint64_t)CFSTR("No access to ~/Library"), a3);
      v35 = 0;
LABEL_21:

      return v35;
    }
    objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v14, (uint64_t)v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v38 = 0;
      if ((objc_msgSend_fileExistsAtPath_isDirectory_(v8, v16, (uint64_t)v13, (uint64_t)&v38) & 1) != 0)
      {
        v20 = *MEMORY[0x1E0C99A10];
        objc_msgSend_arrayWithObjects_(MEMORY[0x1E0C99D20], v18, *MEMORY[0x1E0C999D0], v19, *MEMORY[0x1E0C99A10], 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(v8, v22, (uint64_t)v17, (uint64_t)v21, 1, a3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v23, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v37 = 0;
          ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v27, v28, (uint64_t)&v37, v20, a3);
          v30 = v37;
          v34 = v30;
          if (!ResourceValue_forKey_error || v30 && (objc_msgSend_BOOLValue(v30, v31, v32, v33) & 1) != 0)
          {
            v35 = 1;
          }
          else
          {
            objc_msgSend__buildErrorWithCode_message_returningError_(APRequirements, v31, 16001, (uint64_t)CFSTR("Directory isn't readable at ~/Library."), a3);
            v35 = 0;
          }

        }
        else
        {
          objc_msgSend__buildErrorWithCode_message_returningError_(APRequirements, v28, 16001, (uint64_t)CFSTR("Directory doesn't exist at ~/Library."), a3);
          v35 = 0;
        }

        goto LABEL_20;
      }
      objc_msgSend__buildErrorWithCode_message_returningError_(APRequirements, v18, 16001, (uint64_t)CFSTR("Directory doesn't exist at ~/Library."), a3);
    }
    else
    {
      objc_msgSend__buildErrorWithCode_message_returningError_(APRequirements, v16, 16001, (uint64_t)CFSTR("No access to ~/Library"), a3);
    }
    v35 = 0;
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend__buildErrorWithCode_message_returningError_(APRequirements, v5, 16001, (uint64_t)CFSTR("Mocking No Access to UserLibraryFileSystem."), a3);
  return 0;
}

+ (BOOL)_buildErrorWithCode:(int64_t)a3 message:(id)a4 returningError:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = a4;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = a4;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v8, v10, (uint64_t)v16, (uint64_t)&v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v7, v12, (uint64_t)CFSTR("com.apple.ap.requirementsErrorDomain"), a3, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    *a5 = v13;
  }
  return 0;
}

@end
