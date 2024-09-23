@implementation DNDModeAssertionDetails

+ (DNDModeAssertionDetails)detailsWithIdentifier:(id)a3 modeIdentifier:(id)a4 lifetime:(id)a5
{
  return (DNDModeAssertionDetails *)objc_msgSend(a1, "detailsWithIdentifier:modeIdentifier:lifetime:reason:", a3, a4, a5, 0);
}

+ (DNDModeAssertionDetails)detailsWithIdentifier:(id)a3 modeIdentifier:(id)a4 lifetime:(id)a5 reason:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = 0;
  else
    v13 = v10;
  v14 = v13;

  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:modeIdentifier:modeConfigurationModifiedDate:lifetime:reason:userVisibleEndDate:", v12, v11, 0, v14, a6, 0);
  return (DNDModeAssertionDetails *)v15;
}

- (DNDModeAssertionDetails)init
{
  return (DNDModeAssertionDetails *)-[DNDModeAssertionDetails _initWithDetails:](self, "_initWithDetails:", 0);
}

- (id)_initWithDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modeConfigurationModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lifetime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "reason");
  objc_msgSend(v4, "userVisibleEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[DNDModeAssertionDetails _initWithIdentifier:modeIdentifier:modeConfigurationModifiedDate:lifetime:reason:userVisibleEndDate:](self, "_initWithIdentifier:modeIdentifier:modeConfigurationModifiedDate:lifetime:reason:userVisibleEndDate:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (id)_initWithIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationModifiedDate:(id)a5 lifetime:(id)a6 reason:(unint64_t)a7 userVisibleEndDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  DNDModeAssertionDetails *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  NSDate *modeConfigurationModifiedDate;
  uint64_t v28;
  DNDModeAssertionLifetime *lifetime;
  uint64_t v30;
  NSDate *userVisibleEndDate;
  objc_super v33;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v33.receiver = self;
  v33.super_class = (Class)DNDModeAssertionDetails;
  v19 = -[DNDModeAssertionDetails init](&v33, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    v21 = (void *)v20;
    if (v20)
      v22 = (__CFString *)v20;
    else
      v22 = &stru_1E39B74A8;
    objc_storeStrong((id *)&v19->_identifier, v22);

    v23 = objc_msgSend(v15, "copy");
    v24 = (void *)v23;
    if (v23)
      v25 = (__CFString *)v23;
    else
      v25 = CFSTR("com.apple.donotdisturb.mode.default");
    objc_storeStrong((id *)&v19->_modeIdentifier, v25);

    v26 = objc_msgSend(v16, "copy");
    modeConfigurationModifiedDate = v19->_modeConfigurationModifiedDate;
    v19->_modeConfigurationModifiedDate = (NSDate *)v26;

    v28 = objc_msgSend(v17, "copy");
    lifetime = v19->_lifetime;
    v19->_lifetime = (DNDModeAssertionLifetime *)v28;

    v19->_reason = a7;
    v30 = objc_msgSend(v18, "copy");
    userVisibleEndDate = v19->_userVisibleEndDate;
    v19->_userVisibleEndDate = (NSDate *)v30;

  }
  return v19;
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
  void *v12;
  unint64_t v13;

  -[DNDModeAssertionDetails identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDModeAssertionDetails modeIdentifier](self, "modeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDModeAssertionDetails modeConfigurationModifiedDate](self, "modeConfigurationModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDModeAssertionDetails lifetime](self, "lifetime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = -[DNDModeAssertionDetails reason](self, "reason");
  -[DNDModeAssertionDetails userVisibleEndDate](self, "userVisibleEndDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10 ^ v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DNDModeAssertionDetails *v5;
  DNDModeAssertionDetails *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  v5 = (DNDModeAssertionDetails *)a3;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[DNDModeAssertionDetails identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionDetails identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[DNDModeAssertionDetails identifier](self, "identifier");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v13 = 0;
          goto LABEL_55;
        }
        v10 = (void *)v9;
        -[DNDModeAssertionDetails identifier](v6, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          v13 = 0;
LABEL_54:

          goto LABEL_55;
        }
        -[DNDModeAssertionDetails identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDModeAssertionDetails identifier](v6, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_53:

          goto LABEL_54;
        }
        v64 = v10;
        v65 = v12;
        v66 = v11;
      }
      -[DNDModeAssertionDetails modeIdentifier](self, "modeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionDetails modeIdentifier](v6, "modeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
        goto LABEL_16;
      -[DNDModeAssertionDetails modeIdentifier](self, "modeIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[DNDModeAssertionDetails modeIdentifier](v6, "modeIdentifier");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v61 = v3;
          v59 = (void *)v18;
          -[DNDModeAssertionDetails modeIdentifier](self, "modeIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDModeAssertionDetails modeIdentifier](v6, "modeIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v19, "isEqual:", v20) & 1) == 0)
          {

            v13 = 0;
            v32 = v7 == v8;
            v12 = v65;
            v11 = v66;
            v3 = v61;
            goto LABEL_52;
          }
          v54 = v17;
          v55 = v19;
          v3 = v61;
          v53 = v20;
LABEL_16:
          -[DNDModeAssertionDetails modeConfigurationModifiedDate](self, "modeConfigurationModifiedDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDModeAssertionDetails modeConfigurationModifiedDate](v6, "modeConfigurationModifiedDate");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          v63 = v21;
          if (v21 == (void *)v22)
          {
            v60 = (void *)v22;
LABEL_24:
            v52 = v21;
            -[DNDModeAssertionDetails lifetime](self, "lifetime");
            v27 = objc_claimAutoreleasedReturnValue();
            -[DNDModeAssertionDetails lifetime](v6, "lifetime");
            v57 = (void *)v27;
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if ((void *)v27 == v58)
            {
              v62 = v3;
LABEL_32:
              v33 = -[DNDModeAssertionDetails reason](self, "reason");
              if (v33 == -[DNDModeAssertionDetails reason](v6, "reason"))
              {
                -[DNDModeAssertionDetails userVisibleEndDate](self, "userVisibleEndDate");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDModeAssertionDetails userVisibleEndDate](v6, "userVisibleEndDate");
                v35 = objc_claimAutoreleasedReturnValue();
                if (v34 != (void *)v35)
                {
                  v36 = (void *)v35;
                  -[DNDModeAssertionDetails userVisibleEndDate](self, "userVisibleEndDate");
                  v37 = objc_claimAutoreleasedReturnValue();
                  v3 = v62;
                  if (v37)
                  {
                    v45 = (void *)v37;
                    -[DNDModeAssertionDetails userVisibleEndDate](v6, "userVisibleEndDate");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v38)
                    {
                      v44 = v38;
                      -[DNDModeAssertionDetails userVisibleEndDate](self, "userVisibleEndDate");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      -[DNDModeAssertionDetails userVisibleEndDate](v6, "userVisibleEndDate");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      v13 = objc_msgSend(v43, "isEqual:", v39);

                      v3 = v62;
                      v38 = v44;
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
                  v42 = v57;
                  v41 = v58;
                  if (v57 == v58)
                    goto LABEL_60;
                  goto LABEL_59;
                }

                v13 = 1;
              }
              else
              {
                v13 = 0;
              }
              v42 = v57;
              v41 = v58;
              v3 = v62;
              if (v57 == v58)
              {
LABEL_60:

                if (v63 != v60)
                {

                }
                if (v14 != v15)
                {

                }
                goto LABEL_51;
              }
LABEL_59:

              goto LABEL_60;
            }
            -[DNDModeAssertionDetails lifetime](self, "lifetime");
            v28 = objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              v50 = (void *)v28;
              -[DNDModeAssertionDetails lifetime](v6, "lifetime");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                v48 = v29;
                -[DNDModeAssertionDetails lifetime](self, "lifetime");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDModeAssertionDetails lifetime](v6, "lifetime");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v30, "isEqual:", v31) & 1) != 0)
                {
                  v46 = v31;
                  v47 = v30;
                  v62 = v3;
                  goto LABEL_32;
                }

                v29 = v48;
              }

            }
            if (v63 != v60)
            {

            }
            if (v14 == v15)
              goto LABEL_49;
            goto LABEL_48;
          }
          -[DNDModeAssertionDetails modeConfigurationModifiedDate](self, "modeConfigurationModifiedDate");
          v24 = objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v56 = (void *)v24;
            -[DNDModeAssertionDetails modeConfigurationModifiedDate](v6, "modeConfigurationModifiedDate");
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v60 = v23;
              v51 = (void *)v25;
              -[DNDModeAssertionDetails modeConfigurationModifiedDate](self, "modeConfigurationModifiedDate");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[DNDModeAssertionDetails modeConfigurationModifiedDate](v6, "modeConfigurationModifiedDate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v21, "isEqual:", v26) & 1) != 0)
              {
                v49 = v26;
                goto LABEL_24;
              }

LABEL_41:
              if (v14 == v15)
              {

LABEL_50:
                v13 = 0;
LABEL_51:
                v32 = v7 == v8;
                v12 = v65;
                v11 = v66;
LABEL_52:
                v10 = v64;
                if (!v32)
                  goto LABEL_53;
LABEL_55:

                goto LABEL_56;
              }
LABEL_48:

              goto LABEL_49;
            }

          }
          goto LABEL_41;
        }

      }
LABEL_49:

      goto LABEL_50;
    }
    v13 = 0;
  }
LABEL_56:

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
  -[DNDModeAssertionDetails identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeAssertionDetails modeIdentifier](self, "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeAssertionDetails modeConfigurationModifiedDate](self, "modeConfigurationModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeAssertionDetails lifetime](self, "lifetime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  DNDModeAssertionReasonToString(-[DNDModeAssertionDetails reason](self, "reason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeAssertionDetails userVisibleEndDate](self, "userVisibleEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: '%@'; modeIdentifier: '%@'; modeConfigurationModifiedDate: %@; lifetime: %@; reason: %@; userVisibleEndDate: %@>"),
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

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDModeAssertionDetails _initWithDetails:]([DNDMutableModeAssertionDetails alloc], "_initWithDetails:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionDetails)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  DNDModeAssertionDetails *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeConfigurationModifiedDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDModeAssertionLifetime _secureCodingLifetimeClasses](DNDModeAssertionLifetime, "_secureCodingLifetimeClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("lifetime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userVisibleEndDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[DNDModeAssertionDetails _initWithIdentifier:modeIdentifier:modeConfigurationModifiedDate:lifetime:reason:userVisibleEndDate:](self, "_initWithIdentifier:modeIdentifier:modeConfigurationModifiedDate:lifetime:reason:userVisibleEndDate:", v5, v6, v7, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[DNDModeAssertionDetails identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[DNDModeAssertionDetails modeIdentifier](self, "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("modeIdentifier"));

  -[DNDModeAssertionDetails modeConfigurationModifiedDate](self, "modeConfigurationModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("modeConfigurationModifiedDate"));

  -[DNDModeAssertionDetails lifetime](self, "lifetime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("lifetime"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeAssertionDetails reason](self, "reason"), CFSTR("reason"));
  -[DNDModeAssertionDetails userVisibleEndDate](self, "userVisibleEndDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("userVisibleEndDate"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (NSDate)modeConfigurationModifiedDate
{
  return self->_modeConfigurationModifiedDate;
}

- (DNDModeAssertionLifetime)lifetime
{
  return self->_lifetime;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSDate)userVisibleEndDate
{
  return self->_userVisibleEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleEndDate, 0);
  objc_storeStrong((id *)&self->_lifetime, 0);
  objc_storeStrong((id *)&self->_modeConfigurationModifiedDate, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)userRequestedAssertionDetailsWithIdentifier:(id)a3 modeIdentifier:(id)a4 lifetime:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = 0;
  else
    v10 = v7;
  v11 = v10;

  if (v11)
  {
    v12 = v7;

  }
  else
  {
    +[DNDModeAssertionLifetime lifetimeUntilEndOfScheduleWithIdentifier:](DNDModeAssertionLifetime, "lifetimeUntilEndOfScheduleWithIdentifier:", CFSTR("com.apple.donotdisturb.schedule.default"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[DNDModeAssertionDetails detailsWithIdentifier:modeIdentifier:lifetime:](DNDModeAssertionDetails, "detailsWithIdentifier:modeIdentifier:lifetime:", v9, v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isUserRequested
{
  return 0;
}

@end
