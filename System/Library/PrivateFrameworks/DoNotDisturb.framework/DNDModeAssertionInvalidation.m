@implementation DNDModeAssertionInvalidation

- (DNDModeAssertionInvalidation)initWithAssertion:(id)a3 invalidationDate:(id)a4 details:(id)a5 source:(id)a6 reason:(unint64_t)a7 reasonOverride:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  DNDModeAssertionInvalidation *v18;
  uint64_t v19;
  DNDModeAssertion *assertion;
  uint64_t v21;
  NSDate *invalidationDate;
  uint64_t v23;
  DNDModeAssertionInvalidationDetails *details;
  uint64_t v25;
  DNDModeAssertionSource *source;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v28.receiver = self;
  v28.super_class = (Class)DNDModeAssertionInvalidation;
  v18 = -[DNDModeAssertionInvalidation init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    assertion = v18->_assertion;
    v18->_assertion = (DNDModeAssertion *)v19;

    v21 = objc_msgSend(v15, "copy");
    invalidationDate = v18->_invalidationDate;
    v18->_invalidationDate = (NSDate *)v21;

    v23 = objc_msgSend(v16, "copy");
    details = v18->_details;
    v18->_details = (DNDModeAssertionInvalidationDetails *)v23;

    v25 = objc_msgSend(v17, "copy");
    source = v18->_source;
    v18->_source = (DNDModeAssertionSource *)v25;

    v18->_reason = a7;
    v18->_reasonOverride = a8;
  }

  return v18;
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
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  -[DNDModeAssertionInvalidation assertion](self, "assertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDModeAssertionInvalidation invalidationDate](self, "invalidationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDModeAssertionInvalidation details](self, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDModeAssertionInvalidation source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = -[DNDModeAssertionInvalidation reason](self, "reason");
  v12 = v10 ^ v11 ^ -[DNDModeAssertionInvalidation reasonOverride](self, "reasonOverride");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  DNDModeAssertionInvalidation *v6;
  DNDModeAssertionInvalidation *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  v6 = (DNDModeAssertionInvalidation *)a3;
  if (self == v6)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[DNDModeAssertionInvalidation assertion](self, "assertion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionInvalidation assertion](v7, "assertion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[DNDModeAssertionInvalidation assertion](self, "assertion");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
          goto LABEL_65;
        }
        v3 = (void *)v10;
        -[DNDModeAssertionInvalidation assertion](v7, "assertion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
LABEL_64:

          goto LABEL_65;
        }
        -[DNDModeAssertionInvalidation assertion](self, "assertion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDModeAssertionInvalidation assertion](v7, "assertion");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "isEqual:", v4))
        {
          v13 = 0;
LABEL_63:

          goto LABEL_64;
        }
        v57 = v3;
        v54 = v4;
        v55 = v12;
        v56 = v11;
      }
      -[DNDModeAssertionInvalidation invalidationDate](self, "invalidationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionInvalidation invalidationDate](v7, "invalidationDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v15)
      {
        -[DNDModeAssertionInvalidation invalidationDate](self, "invalidationDate");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          v58 = v14;
          -[DNDModeAssertionInvalidation invalidationDate](v7, "invalidationDate");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)v18;
            -[DNDModeAssertionInvalidation invalidationDate](self, "invalidationDate");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDModeAssertionInvalidation invalidationDate](v7, "invalidationDate");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
            {
              v47 = v19;
              v48 = v17;
              goto LABEL_17;
            }

          }
        }
        else
        {

        }
LABEL_45:
        v13 = 0;
        goto LABEL_62;
      }
      v58 = v14;
LABEL_17:
      -[DNDModeAssertionInvalidation details](self, "details");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionInvalidation details](v7, "details");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == v21)
      {
        v50 = v20;
        v51 = v4;
        v53 = v3;
LABEL_26:
        -[DNDModeAssertionInvalidation source](self, "source");
        v26 = objc_claimAutoreleasedReturnValue();
        -[DNDModeAssertionInvalidation source](v7, "source");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)v26;
        if ((void *)v26 == v27)
        {
          v44 = v20;
        }
        else
        {
          -[DNDModeAssertionInvalidation source](self, "source");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v20;
          if (!v28)
          {

            v13 = 0;
            goto LABEL_53;
          }
          v43 = (void *)v28;
          -[DNDModeAssertionInvalidation source](v7, "source");
          v30 = objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
            v13 = 0;
LABEL_52:

LABEL_53:
            v37 = v50;
            if (v50 != v21)
            {
              v39 = v45;
LABEL_58:

            }
LABEL_59:

            if (v58 != v15)
            {

            }
LABEL_62:
            v11 = v56;
            v3 = v57;
            v4 = v54;
            v12 = v55;
            if (v8 != v9)
              goto LABEL_63;
LABEL_65:

            goto LABEL_66;
          }
          v42 = (void *)v30;
          -[DNDModeAssertionInvalidation source](self, "source");
          v31 = objc_claimAutoreleasedReturnValue();
          -[DNDModeAssertionInvalidation source](v7, "source");
          v32 = objc_claimAutoreleasedReturnValue();
          v41 = (void *)v31;
          v33 = (void *)v31;
          v20 = (void *)v32;
          if (!objc_msgSend(v33, "isEqual:", v32))
          {
            v13 = 0;
LABEL_51:

            goto LABEL_52;
          }
          v44 = v29;
        }
        v34 = -[DNDModeAssertionInvalidation reason](self, "reason");
        if (v34 != -[DNDModeAssertionInvalidation reason](v7, "reason"))
        {
          if (v52 != v27)
          {

            v13 = 0;
            v37 = v50;
            v38 = v50 == v21;
            v29 = v44;
            goto LABEL_57;
          }
          v13 = 0;
          v29 = v44;
LABEL_56:

          v37 = v50;
          v38 = v50 == v21;
LABEL_57:
          v39 = v45;
          if (!v38)
            goto LABEL_58;
          goto LABEL_59;
        }
        v35 = -[DNDModeAssertionInvalidation reasonOverride](self, "reasonOverride");
        v13 = v35 == -[DNDModeAssertionInvalidation reasonOverride](v7, "reasonOverride");
        v29 = v44;
        if (v52 == v27)
          goto LABEL_56;
        goto LABEL_51;
      }
      -[DNDModeAssertionInvalidation details](self, "details");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v49 = (void *)v22;
        -[DNDModeAssertionInvalidation details](v7, "details");
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v51 = v4;
          v53 = v3;
          v46 = (void *)v23;
          -[DNDModeAssertionInvalidation details](self, "details");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDModeAssertionInvalidation details](v7, "details");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v24, "isEqual:", v25) & 1) != 0)
          {
            v50 = v20;
            v20 = v24;
            v45 = v25;
            goto LABEL_26;
          }

          v36 = v58;
          if (v58 != v15)
          {

            goto LABEL_42;
          }
          goto LABEL_43;
        }

      }
      v36 = v58;
      if (v58 != v15)
      {

LABEL_42:
LABEL_44:

        goto LABEL_45;
      }
LABEL_43:

      goto LABEL_44;
    }
    v13 = 0;
  }
LABEL_66:

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
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDModeAssertionInvalidation assertion](self, "assertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeAssertionInvalidation invalidationDate](self, "invalidationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeAssertionInvalidation details](self, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeAssertionInvalidation source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DNDModeAssertionInvalidationReasonToString(-[DNDModeAssertionInvalidation reason](self, "reason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  DNDModeAssertionInvalidationReasonOverrideToString(-[DNDModeAssertionInvalidation reasonOverride](self, "reasonOverride"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; assertion: %@; invalidationDate: %@; details: %@; source: %@; reason: %@; reasonOverride: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionInvalidation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  DNDModeAssertionInvalidation *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assertion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invalidationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("details"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reasonOverride"));

  v11 = -[DNDModeAssertionInvalidation initWithAssertion:invalidationDate:details:source:reason:reasonOverride:](self, "initWithAssertion:invalidationDate:details:source:reason:reasonOverride:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[DNDModeAssertionInvalidation assertion](self, "assertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("assertion"));

  -[DNDModeAssertionInvalidation invalidationDate](self, "invalidationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("invalidationDate"));

  -[DNDModeAssertionInvalidation details](self, "details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("details"));

  -[DNDModeAssertionInvalidation source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("source"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[DNDModeAssertionInvalidation reason](self, "reason"), CFSTR("reason"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[DNDModeAssertionInvalidation reasonOverride](self, "reasonOverride"), CFSTR("reasonOverride"));

}

- (DNDModeAssertion)assertion
{
  return self->_assertion;
}

- (NSDate)invalidationDate
{
  return self->_invalidationDate;
}

- (DNDModeAssertionInvalidationDetails)details
{
  return self->_details;
}

- (DNDModeAssertionSource)source
{
  return self->_source;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)reasonOverride
{
  return self->_reasonOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_invalidationDate, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end
