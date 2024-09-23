@implementation CTStewieIMessageLiteFetchMessage

- (CTStewieIMessageLiteFetchMessage)initWithShortHandles:(id)a3 error:(id *)p_isa
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _anonymous_namespace_ *v17;
  NSNumber *v18;
  CTStewieIMessageLiteFetchMessage *v19;
  void *v20;
  void *v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  const __CFString *v29;
  _BYTE v30[128];
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    if ((unint64_t)objc_msgSend(v8, "count") < 0x18)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v13);
            v17 = *(_anonymous_namespace_ **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_opt_class();
            {
              if (p_isa)
              {
                v20 = (void *)MEMORY[0x1E0CB35C8];
                v28 = *MEMORY[0x1E0CB2D50];
                v29 = CFSTR("Invalid shortHandle");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v21);
                *p_isa = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_22;
            }
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
          if (v14)
            continue;
          break;
        }
      }

      v23.receiver = self;
      v23.super_class = (Class)CTStewieIMessageLiteFetchMessage;
      v19 = -[CTStewieIMessageLiteFetchMessage init](&v23, sel_init);
      p_isa = (id *)&v19->super.isa;
      if (v19)
      {
        objc_storeStrong((id *)&v19->_shortHandles, a3);
        self = p_isa;
        p_isa = (id *)&self->super.isa;
      }
      else
      {
        self = 0;
      }
    }
    else if (p_isa)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = CFSTR("Too many short handles");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v10);
      *p_isa = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
      p_isa = 0;
    }
  }
  else if (p_isa)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    v34[0] = CFSTR("Short handles are missing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v12);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }

  return (CTStewieIMessageLiteFetchMessage *)p_isa;
}

- (BOOL)isEqualToOther:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CTStewieIMessageLiteFetchMessage shortHandles](self, "shortHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v9 = 1;
  }
  else
  {
    -[CTStewieIMessageLiteFetchMessage shortHandles](self, "shortHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortHandles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTStewieIMessageLiteFetchMessage *v4;
  BOOL v5;

  v4 = (CTStewieIMessageLiteFetchMessage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CTStewieIMessageLiteFetchMessage isEqualToOther:](self, "isEqualToOther:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTStewieIMessageLiteFetchMessage shortHandles](self, "shortHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setShortHandles:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTStewieIMessageLiteFetchMessage shortHandles](self, "shortHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("shortHandles"));

}

- (CTStewieIMessageLiteFetchMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CTStewieIMessageLiteFetchMessage *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("shortHandles"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CTStewieIMessageLiteFetchMessage initWithShortHandles:error:](self, "initWithShortHandles:error:", v8, 0);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)maxNumberOfShortHandlesInFetch
{
  return 23;
}

- (NSArray)shortHandles
{
  return self->_shortHandles;
}

- (void)setShortHandles:(id)a3
{
  objc_storeStrong((id *)&self->_shortHandles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortHandles, 0);
}

@end
