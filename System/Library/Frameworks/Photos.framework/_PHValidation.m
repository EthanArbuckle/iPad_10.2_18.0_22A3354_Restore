@implementation _PHValidation

- (_PHValidation)initWithOptions:(unint64_t)a3
{
  _PHValidation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PHValidation;
  result = -[_PHValidation init](&v5, sel_init);
  if (result)
    result->_requestedOptions = a3;
  return result;
}

- (void)validateOption:(unint64_t)a3 usingBlock:(id)a4
{
  void (**v6)(void);
  void (**v7)(void);

  v6 = (void (**)(void))a4;
  if (!self->_error && (self->_requestedOptions & a3) != 0 && (a3 & ~self->_validatedOptions) != 0)
  {
    v7 = v6;
    v6[2]();
    v6 = v7;
    self->_validatedOptions |= a3;
  }

}

- (void)assert:(BOOL)a3 code:(int64_t)a4 format:(id)a5
{
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  NSError *v12;
  NSError *error;
  uint64_t v14;
  _QWORD v15[2];
  char v16;

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a5;
  if (!a3 && !self->_error)
  {
    v9 = (__CFString *)CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v8, &v16);
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), a4, v11);
    v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v12;

  }
}

- (void)assert:(BOOL)a3 error:(id)a4
{
  id v6;
  NSError *v7;
  NSError *error;
  id v9;

  v6 = a4;
  if (!a3 && !self->_error)
  {
    v9 = v6;
    v7 = (NSError *)objc_msgSend(v6, "copy");
    error = self->_error;
    self->_error = v7;

    v6 = v9;
  }

}

- (BOOL)isValid:(id *)a3
{
  NSError *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = self->_error;
  if (v5)
  {
    if (a3)
      goto LABEL_3;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  if ((self->_requestedOptions & ~self->_validatedOptions) == 0)
  {
    v5 = 0;
    v6 = 1;
    goto LABEL_8;
  }
  v7 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_validatedOptions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ph_genericErrorWithLocalizedDescription:", CFSTR("Not all options were validated (%@, %@)"), v8, v9);
  v5 = (NSError *)objc_claimAutoreleasedReturnValue();

  if (!a3)
    goto LABEL_7;
LABEL_3:
  v5 = objc_retainAutorelease(v5);
  v6 = 0;
  *a3 = v5;
LABEL_8:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
