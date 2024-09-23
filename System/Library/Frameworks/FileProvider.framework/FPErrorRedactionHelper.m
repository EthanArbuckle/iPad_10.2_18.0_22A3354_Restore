@implementation FPErrorRedactionHelper

- (FPErrorRedactionHelper)initWithError:(id)a3 depth:(unint64_t)a4
{
  objc_storeStrong((id *)&self->_error, a3);
  self->_depth = a4;
  return self;
}

- (id)description
{
  return -[FPErrorRedactionHelper parseErrorIntoStringRedacted:](self, "parseErrorIntoStringRedacted:", 0);
}

- (id)redactedDescription
{
  return -[FPErrorRedactionHelper parseErrorIntoStringRedacted:](self, "parseErrorIntoStringRedacted:", 1);
}

- (id)parseErrorIntoStringRedacted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  FPErrorRedactionHelper *v18;
  FPErrorRedactionHelper *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSError domain](self->_error, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("NSFileProviderErrorDomain")) & 1) != 0)
  {
    v7 = CFSTR("FP");
LABEL_7:

    v6 = (void *)v7;
    goto LABEL_8;
  }
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
  {
    v7 = CFSTR("Cocoa");
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {
    v7 = CFSTR("POSIX");
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v5, "appendFormat:", CFSTR("NSError: %@ %li "), v6, -[NSError code](self->_error, "code"));
  -[NSError userInfo](self->_error, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2938]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AFB0]),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (!objc_msgSend(v9, "hasPrefix:", CFSTR("Error Domain=")))
      goto LABEL_13;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v10 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)v10;
  if (v10
    || (-[NSError localizedDescription](self->_error, "localizedDescription"),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_13:
    if (v3)
    {
      v11 = CFSTR("\"<private>\");
    }
    else
    {
      v23 = v9;
      v11 = CFSTR("\"%@\");
    }
    objc_msgSend(v5, "appendFormat:", v11, v23);
  }
  if (v8)
  {
    if (self->_depth > 1)
    {
      objc_msgSend(v5, "appendString:", CFSTR(" UserInfo={(omitted)}"));
      goto LABEL_38;
    }
    objc_msgSend(v5, "appendString:", CFSTR(" UserInfo={"));
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__30;
    v37 = __Block_byref_object_dispose__30;
    v38 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __55__FPErrorRedactionHelper_parseErrorIntoStringRedacted___block_invoke;
    v24[3] = &unk_1E444FC98;
    v26 = &v33;
    v28 = v3;
    v12 = v5;
    v25 = v12;
    v27 = &v29;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v24);
    if (v30[3])
    {
      if (!objc_msgSend(v12, "hasSuffix:", CFSTR(", ")))
        goto LABEL_25;
      v13 = objc_msgSend(v12, "length") - 2;
      v14 = CFSTR("} ");
      v15 = 2;
    }
    else
    {
      v16 = objc_msgSend(v12, "length");
      v17 = objc_msgSend(CFSTR(" UserInfo={"), "length");
      v15 = objc_msgSend(CFSTR(" UserInfo={"), "length");
      v13 = v16 - v17;
      v14 = CFSTR(" ");
    }
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v13, v15, v14);
LABEL_25:
    if (v34[5])
    {
      ++v30[3];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [FPErrorRedactionHelper alloc];
        v19 = -[FPErrorRedactionHelper initWithError:depth:](v18, "initWithError:depth:", v34[5], self->_depth + 1);
        v20 = v19;
        if (v3)
          -[FPErrorRedactionHelper redactedDescription](v19, "redactedDescription");
        else
          -[FPErrorRedactionHelper description](v19, "description");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendFormat:", CFSTR("Underlying={%@}"), v21);

        goto LABEL_34;
      }
      if (!v3)
      {
        objc_msgSend((id)v34[5], "description");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendFormat:", CFSTR("Underlying={%@}"), v20);
LABEL_34:

        goto LABEL_35;
      }
      objc_msgSend(v12, "appendFormat:", CFSTR("Underlying={<private>}"));
    }
LABEL_35:
    if (v30[3])
      objc_msgSend(v12, "appendString:", CFSTR("}"));

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);

  }
LABEL_38:

  return v5;
}

void __55__FPErrorRedactionHelper_parseErrorIntoStringRedacted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const __CFString *v6;
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if ((objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CB2938]) & 1) == 0
    && (objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CB2D50]) & 1) == 0
    && (objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0C9AFB0]) & 1) == 0)
  {
    if (objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CB3388]))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    }
    else
    {
      if (*(_BYTE *)(a1 + 56))
      {
        v6 = CFSTR("<private>=<private>, ");
      }
      else
      {
        v7 = v9;
        v8 = v5;
        v6 = CFSTR("%@=%@, ");
      }
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", v6, v7, v8);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
