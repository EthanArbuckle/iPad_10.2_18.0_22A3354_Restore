@implementation VNError

+ (void)VNAssert:(BOOL)a3 log:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  if (!a3)
  {
    v5 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    VNValidatedLog(4, (uint64_t)CFSTR("%s"), v6, v7, v8, v9, v10, v11, v5);
  }

}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "logInternalError:", v6);
  return v6;
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4
{
  objc_msgSend(a1, "errorWithCode:message:underlyingError:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4 underlyingError:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x1E0CB2D50], a5, *MEMORY[0x1E0CB3388], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Vision"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorForCancellationOfRequest:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("request %@ was cancelled"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("request was cancelled");
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x1E0CB2D50], v4, CFSTR("VNRequest"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Vision"), 1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)errorForMemoryAllocationFailure
{
  return (id)objc_msgSend(a1, "errorForMemoryAllocationFailureWithLocalizedDescription:", 0);
}

+ (id)errorForMemoryAllocationFailureWithLocalizedDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Vision"), 10, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)errorForInvalidImageFailure
{
  return (id)objc_msgSend(a1, "errorForInvalidImageFailureWithLocalizedDescription:", 0);
}

+ (id)errorForInvalidImageFailureWithLocalizedDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Vision"), 13, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)errorForInternalErrorWithLocalizedDescription:(id)a3
{
  objc_msgSend(a1, "errorForInternalErrorWithLocalizedDescription:underlyingError:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForInternalErrorWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x1E0CB2D50], a4, *MEMORY[0x1E0CB3388], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Vision"), 9, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorForExecutionTimeoutWithLocalizedDescription:(id)a3
{
  objc_msgSend(a1, "errorForExecutionTimeoutWithLocalizedDescription:underlyingError:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForExecutionTimeoutWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x1E0CB2D50], a4, *MEMORY[0x1E0CB3388], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Vision"), 20, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorForInvalidFormatErrorWithLocalizedDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Vision"), 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorForUnsupportedSerializingHeaderVersion:(unsigned int)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported serialized header version %u"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorForInvalidFormatErrorWithLocalizedDescription:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)errorForUnimplementedFunctionWithLocalizedDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Vision"), 8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorForUnimplementedMethod:(SEL)a3 ofObject:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  VNMethodSignatureStringForObjectAndSelector(a4, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ must be overridden"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "errorForUnimplementedFunctionWithLocalizedDescription:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorForOutOfBoundsErrorWithLocalizedDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Vision"), 4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorForInvalidOperationWithLocalizedDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Vision"), 12, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorForInvalidOperationForRequestClass:(Class)a3 revision:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  VNRequestRevisionString(a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ does not support operation"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "errorForInvalidOperationWithLocalizedDescription:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorForInvalidOperationForRequestSpecifier:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ does not support operation"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorForInvalidOperationWithLocalizedDescription:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)errorForMissingOptionNamed:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing option %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:message:", 7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)errorForInvalidOption:(id)a3 named:(id)a4
{
  objc_msgSend(a1, "errorForInvalidOption:named:localizedDescription:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForInvalidOption:(id)a3 named:(id)a4 localizedDescription:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB3940];
  _prettyPrintedValue((objc_object *)a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("option %@ has an invalid value of %@"), v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" - %@"), v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  objc_msgSend(a1, "errorForInvalidOptionWithLocalizedDescription:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)errorForInvalidOptionWithLocalizedDescription:(id)a3
{
  objc_msgSend(a1, "errorWithCode:message:", 5, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForInvalidArgumentWithLocalizedDescription:(id)a3
{
  objc_msgSend(a1, "errorWithCode:message:", 14, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForInvalidArgument:(id)a3 named:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3940];
  _prettyPrintedValue((objc_object *)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("argument %@ has an invalid value of %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "errorForInvalidArgumentWithLocalizedDescription:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)errorForInvalidModelWithLocalizedDescription:(id)a3
{
  objc_msgSend(a1, "errorForInvalidModelWithLocalizedDescription:underlyingError:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForInvalidModelWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  objc_msgSend(a1, "errorWithCode:message:underlyingError:", 15, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForOperationFailedErrorWithLocalizedDescription:(id)a3
{
  objc_msgSend(a1, "errorForOperationFailedErrorWithLocalizedDescription:underlyingError:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForOperationFailedErrorWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  objc_msgSend(a1, "errorWithCode:message:underlyingError:", 3, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForUnknownErrorWithLocalizedDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = *MEMORY[0x1E0CB2D50];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Vision"), 11, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorForGPURequiredByRequest:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ requires the GPU for processing"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorForUnsupportedProcessingDevice:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("processing with %@ is not supported"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)errorForUnsupportedConfigurationOfRequest:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The current configuration of %@ is not supported"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorForInvalidOperationWithLocalizedDescription:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)errorForUnsupportedRevision:(unint64_t)a3 ofRequest:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "errorForUnsupportedRevision:ofRequestClass:", a3, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)errorForUnsupportedRevision:(unint64_t)a3 ofRequestClass:(Class)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  VNRequestRevisionString(a4, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ does not support %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "errorWithCode:message:", 16, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)errorForUnsupportedRequestClassName:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a supported request"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:message:", 19, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)errorForUnsupportedRequestSpecifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "requestRevision");
  v6 = objc_msgSend(v4, "requestClassAndReturnError:", 0);
  if (v6)
  {
    objc_msgSend(a1, "errorForUnsupportedRevision:ofRequestClass:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "requestClassName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "errorForUnsupportedRequestClassName:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)errorForDataUnavailableWithLocalizedDescription:(id)a3
{
  objc_msgSend(a1, "errorForDataUnavailableWithLocalizedDescription:underlyingError:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForDataUnavailableWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  objc_msgSend(a1, "errorWithCode:message:underlyingError:", 17, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForUnsupportedComputeStage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported compute stage %@"), v4);
  objc_msgSend(a1, "errorWithCode:message:", 21, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorForUnsupportedComputeDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unsupported compute device %@"), v4);
  objc_msgSend(a1, "errorForUnsupportedComputeDeviceWithLocalizedDescription:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorForUnsupportedComputeDeviceWithLocalizedDescription:(id)a3
{
  objc_msgSend(a1, "errorWithCode:message:", 22, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForUnavailableSession
{
  return (id)objc_msgSend(a1, "errorWithCode:message:", 32769, CFSTR("session no longer available"));
}

+ (id)errorForEspressoReturnStatus:(int)a3 localizedDescription:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t status_string;
  id v9;
  void *v10;
  void *v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%d"), v4);
  status_string = espresso_get_status_string();
  if (status_string)
    objc_msgSend(v7, "appendFormat:", CFSTR(": %s"), status_string);
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v6, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  objc_msgSend(a1, "errorForInternalErrorWithLocalizedDescription:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)errorForEspressoErrorInfo:(id)a3 localizedDescription:(id)a4
{
  char *var2;
  uint64_t v5;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  var2 = a3.var2;
  v5 = *(_QWORD *)&a3.var0;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (v5 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("plan phase %u"), v5);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E4543460[(int)v5];
  }
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%s (%@)"), var2, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v7, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  objc_msgSend(a1, "errorForInternalErrorWithLocalizedDescription:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)errorForFailedEspressoPlan:(void *)a3 localizedDescription:(id)a4
{
  id v5;
  uint64_t error_info;
  uint64_t v7;
  void *v8;

  v5 = a4;
  error_info = espresso_plan_get_error_info();
  objc_msgSend(a1, "errorForEspressoErrorInfo:localizedDescription:", error_info, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorForVImageError:(int64_t)a3 localizedDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("vImage_Error %@"), v8);

  if (objc_msgSend(v6, "length"))
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ (%@)"), v6, v9);

    v9 = (void *)v10;
  }
  objc_msgSend(a1, "errorForInternalErrorWithLocalizedDescription:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)errorForCVReturnCode:(int)a3 localizedDescription:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x1E0CB2D50], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)errorForCVReturnCode:(int)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unsigned int)a6 localizedDescription:(id)a7
{
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = *(_QWORD *)&a3;
  v10 = a7;
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  VisionCoreFourCharCodeToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@ Width = %lu, Height = %lu, Format = %@"), v10, a4, a5, v12);

  +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)errorForOSStatus:(int)a3 localizedDescription:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x1E0CB2D50], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)logInternalError:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a3;
  if (v3)
  {
    v13 = v3;
    v4 = objc_msgSend(v3, "code");
    objc_msgSend(v13, "localizedDescription");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "cStringUsingEncoding:", 1);
    objc_msgSend(v13, "localizedFailureReason");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "cStringUsingEncoding:", 1);
    VNValidatedLog(4, (uint64_t)CFSTR("Error code: %llu; description: %s; reason: %s"), v7, v8, v9, v10, v11, v12, v4);

    v3 = v13;
  }

}

+ (void)VNAssertClass:(Class)a3 needsToOverrideMethod:(SEL)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  NSStringFromClass(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "initWithFormat:", CFSTR("Base class implementation is not provided. %@ must implement %@"), v8, v9);

  objc_msgSend(a1, "VNAssert:log:", 0, v10);
}

@end
