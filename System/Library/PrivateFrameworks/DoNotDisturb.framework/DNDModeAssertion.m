@implementation DNDModeAssertion

- (DNDModeAssertion)initWithUUID:(id)a3 startDate:(id)a4 details:(id)a5 source:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DNDModeAssertion *v14;
  uint64_t v15;
  NSUUID *UUID;
  void *v17;
  void *v18;
  NSDate *v19;
  NSDate *startDate;
  uint64_t v21;
  DNDModeAssertionDetails *details;
  uint64_t v23;
  DNDModeAssertionSource *source;
  NSObject *v25;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)DNDModeAssertion;
  v14 = -[DNDModeAssertion init](&v27, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    UUID = v14->_UUID;
    v14->_UUID = (NSUUID *)v15;

    v17 = (void *)objc_msgSend(v11, "copy");
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    startDate = v14->_startDate;
    v14->_startDate = v19;

    v21 = objc_msgSend(v12, "copy");
    details = v14->_details;
    v14->_details = (DNDModeAssertionDetails *)v21;

    v23 = objc_msgSend(v13, "copy");
    source = v14->_source;
    v14->_source = (DNDModeAssertionSource *)v23;

    if (!v11)
    {
      v25 = DNDLogModeAssertion;
      if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_FAULT))
        -[DNDModeAssertion initWithUUID:startDate:details:source:].cold.1((uint64_t)v14, v25);
    }
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[DNDModeAssertion UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDModeAssertion startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDModeAssertion details](self, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDModeAssertion source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  DNDModeAssertion *v4;
  DNDModeAssertion *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v4 = (DNDModeAssertion *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDModeAssertion UUID](self, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertion UUID](v5, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDModeAssertion UUID](self, "UUID");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
          goto LABEL_50;
        }
        v9 = (void *)v8;
        -[DNDModeAssertion UUID](v5, "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_49:

          goto LABEL_50;
        }
        -[DNDModeAssertion UUID](self, "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDModeAssertion UUID](v5, "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_48:

          goto LABEL_49;
        }
        v49 = v12;
        v50 = v11;
        v51 = v10;
        v52 = v9;
      }
      -[DNDModeAssertion startDate](self, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertion startDate](v5, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDModeAssertion startDate](self, "startDate");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          -[DNDModeAssertion startDate](v5, "startDate");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            v48 = v14;
            -[DNDModeAssertion startDate](self, "startDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDModeAssertion startDate](v5, "startDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v20, "isEqual:", v21) & 1) == 0)
            {

              goto LABEL_38;
            }
            v43 = v20;
            v44 = v19;
            v45 = v17;
            v14 = v21;
            goto LABEL_17;
          }

        }
        goto LABEL_38;
      }
      v48 = v14;
LABEL_17:
      -[DNDModeAssertion details](self, "details");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertion details](v5, "details");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 == v47)
      {
        v46 = v22;
        goto LABEL_25;
      }
      -[DNDModeAssertion details](self, "details");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        -[DNDModeAssertion details](v5, "details");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v40 = v14;
          v42 = v25;
          -[DNDModeAssertion details](self, "details");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDModeAssertion details](v5, "details");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v26, "isEqual:", v27) & 1) != 0)
          {
            v37 = v27;
            v38 = v26;
            v39 = v24;
            v46 = v22;
            v14 = v40;
LABEL_25:
            -[DNDModeAssertion source](self, "source");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDModeAssertion source](v5, "source");
            v29 = objc_claimAutoreleasedReturnValue();
            if (v28 == (void *)v29)
            {

              v13 = 1;
            }
            else
            {
              v30 = (void *)v29;
              -[DNDModeAssertion source](self, "source");
              v31 = objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                v41 = (void *)v31;
                -[DNDModeAssertion source](v5, "source");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (v32)
                {
                  v36 = v32;
                  -[DNDModeAssertion source](self, "source");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[DNDModeAssertion source](v5, "source");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = objc_msgSend(v35, "isEqual:", v33);

                  v32 = v36;
                }
                else
                {
                  v13 = 0;
                }

              }
              else
              {

                v13 = 0;
              }
            }
            if (v46 != v47)
            {

            }
            if (v48 != v15)
            {

            }
LABEL_47:
            v10 = v51;
            v9 = v52;
            v11 = v50;
            v12 = v49;
            if (v6 != v7)
              goto LABEL_48;
LABEL_50:

            goto LABEL_51;
          }

          v14 = v40;
          v25 = v42;
        }

      }
      if (v48 != v15)
      {

      }
LABEL_38:
      v13 = 0;
      goto LABEL_47;
    }
    v13 = 0;
  }
LABEL_51:

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDModeAssertion UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeAssertion startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeAssertion details](self, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeAssertion source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; UUID: %@; startDate: %@; details: %@; source: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DNDModeAssertion *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("details"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[DNDModeAssertion initWithUUID:startDate:details:source:](self, "initWithUUID:startDate:details:source:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[DNDModeAssertion UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UUID"));

  -[DNDModeAssertion startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("startDate"));

  -[DNDModeAssertion details](self, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("details"));

  -[DNDModeAssertion source](self, "source");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("source"));

}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (DNDModeAssertionDetails)details
{
  return self->_details;
}

- (DNDModeAssertionSource)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)initWithUUID:(uint64_t)a1 startDate:(NSObject *)a2 details:source:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19ABEB000, a2, OS_LOG_TYPE_FAULT, "nil startDate provided to DNDModeAssertion initializer. %@", (uint8_t *)&v2, 0xCu);
}

@end
