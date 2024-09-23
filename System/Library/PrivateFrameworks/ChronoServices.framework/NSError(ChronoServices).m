@implementation NSError(ChronoServices)

+ (id)chs_initWithErrorCode:()ChronoServices
{
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = [a1 alloc];
  v9 = *MEMORY[0x1E0CB2938];
  if ((unint64_t)(a3 - 1) > 7)
    v5 = &stru_1E2A5F050;
  else
    v5 = off_1E2A5B940[a3 - 1];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", CFSTR("CHSErrorDomain"), a3, v6);

  return v7;
}

+ (id)encodingError:()ChronoServices
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error encoding: %@"), v3, *MEMORY[0x1E0CB2D50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = *MEMORY[0x1E0CB2938];
  v10[0] = v5;
  v10[1] = CFSTR("Server Unavailable");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("CHSErrorDomain"), 9, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)decodingError:()ChronoServices
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error decoding: %@"), v3, *MEMORY[0x1E0CB2D50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = *MEMORY[0x1E0CB2938];
  v10[0] = v5;
  v10[1] = CFSTR("Server Unavailable");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("CHSErrorDomain"), 9, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)serverUnavailable
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB35C8];
  v1 = *MEMORY[0x1E0CB2938];
  v5[0] = *MEMORY[0x1E0CB2D50];
  v5[1] = v1;
  v6[0] = CFSTR("Unable to obtain the remote target");
  v6[1] = CFSTR("Server Unavailable");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("CHSErrorDomain"), 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)invalidControlDefinition
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB35C8];
  v1 = *MEMORY[0x1E0CB2938];
  v5[0] = *MEMORY[0x1E0CB2D50];
  v5[1] = v1;
  v6[0] = CFSTR("Invalid control definition (missing intent).");
  v6[1] = CFSTR("Invalid control definition");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("CHSErrorDomain"), 7, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)badResponseFromServer
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB35C8];
  v5[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad response from server"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = *MEMORY[0x1E0CB2938];
  v6[0] = v1;
  v6[1] = CFSTR("Bad response");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "errorWithDomain:code:userInfo:", CFSTR("CHSErrorDomain"), 8, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)badResponseForFunction:()ChronoServices
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad response from server: %@"), v3, *MEMORY[0x1E0CB2D50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = *MEMORY[0x1E0CB2938];
  v10[0] = v5;
  v10[1] = CFSTR("Bad response");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("CHSErrorDomain"), 8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
