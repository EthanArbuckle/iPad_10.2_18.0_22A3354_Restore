@implementation sec_LWCR

- (sec_LWCR)init
{
  sec_LWCR *v2;
  sec_LWCR *v3;
  NSData *backingStorage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)sec_LWCR;
  v2 = -[sec_LWCR init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    backingStorage = v2->backingStorage;
    v2->backingStorage = 0;

    v3->backingContext = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (self->backingContext)
    CEReleaseManagedContext();
  v3.receiver = self;
  v3.super_class = (Class)sec_LWCR;
  -[sec_LWCR dealloc](&v3, sel_dealloc);
}

- (int64_t)version
{
  return self->lwcr._version;
}

- (int64_t)constraintCategory
{
  return self->lwcr._constraintCat;
}

- (BOOL)hasRequirements
{
  return der_vm_context_is_valid();
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->backingStorage, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 104) = 0;
  *((_BYTE *)self + 81) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

+ (id)withData:(id)a3 withError:(id *)a4
{
  const __CFData *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  sec_LWCR *v10;
  sec_LWCR *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, const char *, ...);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t *p_constraintCat;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = (const __CFData *)a3;
  *(_QWORD *)&v23 = 0;
  CFDataGetBytePtr(v6);
  CFDataGetLength(v6);
  v7 = CEValidateWithOptions();
  v8 = (uint64_t *)MEMORY[0x1E0DDFFA0];
  v9 = *MEMORY[0x1E0DDFFA0];
  if (v7 == *MEMORY[0x1E0DDFFA0])
  {
    v7 = CEAcquireManagedContext();
    v9 = *v8;
  }
  if (v7 == v9)
  {
    v11 = objc_alloc_init(sec_LWCR);
    objc_storeStrong((id *)&v11->backingStorage, a3);
    v11->backingContext = 0;
    v12 = MEMORY[0];
    if (der_vm_select_int_for_key() && (der_vm_select_int_for_key() & 1) != 0)
    {
      if (v11->lwcr._compatVersion <= 1)
      {
        p_constraintCat = &v11->lwcr._constraintCat;
        if (der_vm_select_int_for_key() && *p_constraintCat < 0)
        {
          v13 = "LWCRs constraint category cannot be less that zero";
          v14 = 7;
          v15 = 50;
        }
        else
        {
          der_vm_execute_nocopy();
          if (der_vm_context_is_valid() && der_vm_CEType_from_context() != 1)
          {
            v13 = "LWCRs 'requirements' field is not a dictionary";
            v15 = 46;
          }
          else
          {
            if (*p_constraintCat || der_vm_context_is_valid())
            {
              if (der_vm_context_is_valid())
              {
                CEConjureContextFromDER();
                *(_OWORD *)&v11->lwcr.ctx.der_context.runtime = 0uLL;
                *(_OWORD *)&v11->lwcr.ctx.der_context.lookup.index_count = v23;
                *(_OWORD *)&v11->lwcr.ctx.der_context.sorted = v24;
                *(_OWORD *)&v11->lwcr.ctx.der_context.var0.state.der_end = v25;
              }
              v10 = v11;
              v11 = 0;
              goto LABEL_16;
            }
            v13 = "LWCRs do not specify a constraint category or explicit requirements";
            v15 = 67;
          }
          v14 = 7;
        }
      }
      else
      {
        v13 = "This LWCR is not compatible with this runtime";
        v14 = 6;
        v15 = 45;
      }
    }
    else
    {
      v16 = *(void (**)(uint64_t, const char *, ...))(v12 + 24);
      if (v16)
        v16(v12, "[%s]: %s\n", "loadFromCE", "LWCR: invalid version / compatible version fields");
      v13 = "LWCRs are not encoded correctly";
      v14 = 7;
      v15 = 31;
    }
    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v26[0] = *MEMORY[0x1E0CB3388];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v18;
      v26[1] = *MEMORY[0x1E0CB2938];
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v13, v15, 4);
      v27[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("LWCRError"), 1, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
LABEL_16:

    goto LABEL_18;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("LWCRError"), 2, 0);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_18:

  return v10;
}

@end
