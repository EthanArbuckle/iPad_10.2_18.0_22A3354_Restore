@implementation MUWebMessage

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MUWebMessage type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", v5);

  -[MUWebMessage caller](self, "caller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaller:", v6);

  -[MUWebMessage callee](self, "callee");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallee:", v7);

  -[MUWebMessage method](self, "method");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMethod:", v8);

  -[MUWebMessage callNumber](self, "callNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallNumber:", v9);

  -[MUWebMessage status](self, "status");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatus:", v10);

  -[MUWebMessage arguments](self, "arguments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArguments:", v11);

  -[MUWebMessage result](self, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResult:", v12);

  -[MUWebMessage errorMessage](self, "errorMessage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setErrorMessage:", v13);

  return v4;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)caller
{
  return self->_caller;
}

- (void)setCaller:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)callee
{
  return self->_callee;
}

- (void)setCallee:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)callNumber
{
  return self->_callNumber;
}

- (void)setCallNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSCopying)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSCopying)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_callNumber, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_callee, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (MUWebMessage)initWithJSONObject:(id)a3
{
  id v4;
  MUWebMessage *v5;
  void *v6;
  void *v7;
  int v8;
  MUWebMessage *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  MUWebMessage *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  MUWebMessage *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  MUWebMessage *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  MUWebMessage *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  MUWebMessage *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  MUWebMessage *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  MUWebMessage *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  MUWebMessage *v49;
  void *v50;
  int v51;
  MUWebMessage *v52;
  void *v54;
  void *v55;
  void *v56;

  v4 = a3;
  v5 = -[MUWebMessage init](self, "init");
  if (!v5)
    goto LABEL_37;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqual:", v7),
        v7,
        !v8))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_51;
    v9 = v5;
    v10 = v6;
  }
  else
  {
    v9 = v5;
    v10 = 0;
  }
  -[MUWebMessage setType:](v9, "setType:", v10);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("caller"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v5;
        v15 = v11;
        goto LABEL_8;
      }

LABEL_51:
      goto LABEL_52;
    }
  }
  v14 = v5;
  v15 = 0;
LABEL_8:
  -[MUWebMessage setCaller:](v14, "setCaller:", v15);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("callee"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v16, "isEqual:", v17),
        v17,
        v18))
  {
    v19 = v5;
    v20 = 0;
LABEL_11:
    -[MUWebMessage setCallee:](v19, "setCallee:", v20);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("method"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21
      && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v21, "isEqual:", v22),
          v22,
          !v23))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v51 = 1;
        goto LABEL_35;
      }
      v24 = v5;
      v56 = v21;
      v25 = v21;
    }
    else
    {
      v56 = v21;
      v24 = v5;
      v25 = 0;
    }
    -[MUWebMessage setMethod:](v24, "setMethod:", v25);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("callNumber"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26
      && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = objc_msgSend(v26, "isEqual:", v27),
          v27,
          !v28))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v51 = 1;
        goto LABEL_34;
      }
      v29 = v5;
      v30 = v26;
    }
    else
    {
      v29 = v5;
      v30 = 0;
    }
    -[MUWebMessage setCallNumber:](v29, "setCallNumber:", v30);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31
      && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v33 = objc_msgSend(v31, "isEqual:", v32),
          v32,
          !v33))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v51 = 1;
        goto LABEL_33;
      }
      v54 = v16;
      v34 = v5;
      v35 = v31;
    }
    else
    {
      v54 = v16;
      v34 = v5;
      v35 = 0;
    }
    -[MUWebMessage setStatus:](v34, "setStatus:", v35);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("arguments"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v26;
    if (v36
      && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v37 = (void *)objc_claimAutoreleasedReturnValue(),
          v38 = objc_msgSend(v36, "isEqual:", v37),
          v37,
          !v38))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v51 = 1;
        goto LABEL_32;
      }
      v39 = v5;
      v40 = v36;
    }
    else
    {
      v39 = v5;
      v40 = 0;
    }
    -[MUWebMessage setArguments:](v39, "setArguments:", v40);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("result"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41
      && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v42 = (void *)objc_claimAutoreleasedReturnValue(),
          v43 = objc_msgSend(v41, "isEqual:", v42),
          v42,
          !v43))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v51 = 1;
        v26 = v55;
        goto LABEL_31;
      }
      v44 = v5;
      v45 = v41;
    }
    else
    {
      v44 = v5;
      v45 = 0;
    }
    -[MUWebMessage setResult:](v44, "setResult:", v45);
    v26 = v55;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errorMessage"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46
      && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v47 = (void *)objc_claimAutoreleasedReturnValue(),
          v48 = objc_msgSend(v46, "isEqual:", v47),
          v47,
          v26 = v55,
          !v48))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v51 = 1;
        goto LABEL_30;
      }
      v49 = v5;
      v50 = v46;
    }
    else
    {
      v49 = v5;
      v50 = 0;
    }
    -[MUWebMessage setErrorMessage:](v49, "setErrorMessage:", v50);
    v51 = 0;
LABEL_30:

LABEL_31:
LABEL_32:
    v16 = v54;

LABEL_33:
LABEL_34:
    v21 = v56;

LABEL_35:
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v5;
    v20 = v16;
    goto LABEL_11;
  }
  v51 = 1;
LABEL_36:

  if (v51)
  {
LABEL_52:
    v52 = 0;
    goto LABEL_53;
  }
LABEL_37:
  v52 = v5;
LABEL_53:

  return v52;
}

- (NSDictionary)JSONObject
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[9];
  _QWORD v32[11];

  v32[9] = *MEMORY[0x1E0C80C00];
  v31[0] = CFSTR("type");
  -[MUWebMessage type](self, "type");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v3;
  v32[0] = v3;
  v31[1] = CFSTR("caller");
  -[MUWebMessage caller](self, "caller");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v5;
  v32[1] = v5;
  v31[2] = CFSTR("callee");
  -[MUWebMessage callee](self, "callee");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v7;
  v32[2] = v7;
  v31[3] = CFSTR("method");
  -[MUWebMessage method](self, "method");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v9;
  v32[3] = v9;
  v31[4] = CFSTR("callNumber");
  -[MUWebMessage callNumber](self, "callNumber");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v29 = v6;
  v23 = (void *)v11;
  v32[4] = v11;
  v31[5] = CFSTR("status");
  -[MUWebMessage status](self, "status");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v30 = v4;
  v22 = (void *)v13;
  v32[5] = v13;
  v31[6] = CFSTR("arguments");
  -[MUWebMessage arguments](self, "arguments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[6] = v16;
  v31[7] = CFSTR("result");
  -[MUWebMessage result](self, "result");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[7] = v18;
  v31[8] = CFSTR("errorMessage");
  -[MUWebMessage errorMessage](self, "errorMessage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[8] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 9);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19)

  if (!v17)
  if (!v15)

  if (!v14)
  if (!v12)

  if (!v10)
  if (!v8)

  if (!v29)
  if (!v30)

  return (NSDictionary *)v28;
}

- (id)description
{
  void *v2;
  void *v3;

  -[MUWebMessage JSONObject](self, "JSONObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
