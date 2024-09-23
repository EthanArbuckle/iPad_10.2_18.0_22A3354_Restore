@implementation NSError(AppleMediaServices_Project)

- (uint64_t)ams_isBagValueMissingError
{
  return objc_msgSend(a1, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 204);
}

- (id)ams_errorByCombiningWithUnderlyingError:()AppleMediaServices_Project
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "ams_hasDomain:code:", CFSTR("AMSErrorDomain"), 15))
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "ams_errorByAddingToMultipleUnderlyingErrors:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9[0] = a1;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    AMSErrorWithMultipleUnderlyingErrors(15, 0, 0, v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)ams_multipleUnderlyingErrors
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2F70]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

@end
