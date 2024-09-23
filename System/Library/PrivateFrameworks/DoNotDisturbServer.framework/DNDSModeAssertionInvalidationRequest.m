@implementation DNDSModeAssertionInvalidationRequest

- (id)resolveWithExpectedRemoteDeviceIdentifier:(id)a3 localDeviceIdentifier:(id)a4 remoteDeviceIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  DNDSModeAssertionInvalidationRequest *v13;
  DNDSModeAssertionInvalidationRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DNDSModeAssertionInvalidationRequest source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resolveWithExpectedRemoteDeviceIdentifier:localDeviceIdentifier:remoteDeviceIdentifier:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12 || v11 && v12 && objc_msgSend(v11, "isEqual:", v12))
  {
    v13 = self;
  }
  else
  {
    v14 = [DNDSModeAssertionInvalidationRequest alloc];
    -[DNDSModeAssertionInvalidationRequest UUID](self, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequest predicate](self, "predicate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequest requestDate](self, "requestDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSModeAssertionInvalidationRequest details](self, "details");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[DNDSModeAssertionInvalidationRequest initWithUUID:predicate:requestDate:details:source:reason:reasonOverride:](v14, "initWithUUID:predicate:requestDate:details:source:reason:reasonOverride:", v15, v16, v17, v18, v12, -[DNDSModeAssertionInvalidationRequest reason](self, "reason"), -[DNDSModeAssertionInvalidationRequest reasonOverride](self, "reasonOverride"));

  }
  return v13;
}

+ (id)requestWithPredicate:(id)a3 requestDate:(id)a4 source:(id)a5 reason:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithUUID:predicate:requestDate:details:source:reason:reasonOverride:", v14, v12, v11, 0, v10, a6, 0);

  return v15;
}

+ (id)requestWithPredicate:(id)a3 requestDate:(id)a4 details:(id)a5 source:(id)a6 reason:(unint64_t)a7 reasonOverride:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithUUID:predicate:requestDate:details:source:reason:reasonOverride:", v19, v17, v16, v15, v14, a7, a8);

  return v20;
}

- (DNDSModeAssertionInvalidationRequest)initWithUUID:(id)a3 predicate:(id)a4 requestDate:(id)a5 details:(id)a6 source:(id)a7 reason:(unint64_t)a8 reasonOverride:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  DNDSModeAssertionInvalidationRequest *v20;
  uint64_t v21;
  NSUUID *UUID;
  uint64_t v23;
  DNDSModeAssertionInvalidationPredicate *predicate;
  uint64_t v25;
  NSDate *requestDate;
  uint64_t v27;
  DNDModeAssertionInvalidationDetails *details;
  uint64_t v29;
  DNDModeAssertionSource *source;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v32.receiver = self;
  v32.super_class = (Class)DNDSModeAssertionInvalidationRequest;
  v20 = -[DNDSModeAssertionInvalidationRequest init](&v32, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    UUID = v20->_UUID;
    v20->_UUID = (NSUUID *)v21;

    v23 = objc_msgSend(v16, "copy");
    predicate = v20->_predicate;
    v20->_predicate = (DNDSModeAssertionInvalidationPredicate *)v23;

    v25 = objc_msgSend(v17, "copy");
    requestDate = v20->_requestDate;
    v20->_requestDate = (NSDate *)v25;

    v27 = objc_msgSend(v18, "copy");
    details = v20->_details;
    v20->_details = (DNDModeAssertionInvalidationDetails *)v27;

    v29 = objc_msgSend(v19, "copy");
    source = v20->_source;
    v20->_source = (DNDModeAssertionSource *)v29;

    v20->_reason = a8;
    v20->_reasonOverride = a9;
  }

  return v20;
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
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  -[DNDSModeAssertionInvalidationRequest UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSModeAssertionInvalidationRequest predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DNDSModeAssertionInvalidationRequest requestDate](self, "requestDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DNDSModeAssertionInvalidationRequest details](self, "details");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[DNDSModeAssertionInvalidationRequest source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = v12 ^ -[DNDSModeAssertionInvalidationRequest reason](self, "reason");
  v14 = v10 ^ v13 ^ -[DNDSModeAssertionInvalidationRequest reasonOverride](self, "reasonOverride");

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  DNDSModeAssertionInvalidationRequest *v4;
  DNDSModeAssertionInvalidationRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;

  v4 = (DNDSModeAssertionInvalidationRequest *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSModeAssertionInvalidationRequest UUID](self, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionInvalidationRequest UUID](v5, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDSModeAssertionInvalidationRequest UUID](self, "UUID");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v12 = 0;
          goto LABEL_71;
        }
        v9 = (void *)v8;
        -[DNDSModeAssertionInvalidationRequest UUID](v5, "UUID");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v72)
        {
          v12 = 0;
LABEL_70:

          goto LABEL_71;
        }
        -[DNDSModeAssertionInvalidationRequest UUID](self, "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionInvalidationRequest UUID](v5, "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v11))
        {
          v12 = 0;
LABEL_69:

          goto LABEL_70;
        }
        v69 = v9;
        v70 = v11;
        v71 = v10;
      }
      -[DNDSModeAssertionInvalidationRequest predicate](self, "predicate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionInvalidationRequest predicate](v5, "predicate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 != v14)
      {
        -[DNDSModeAssertionInvalidationRequest predicate](self, "predicate");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
          goto LABEL_65;
        v16 = (void *)v15;
        -[DNDSModeAssertionInvalidationRequest predicate](v5, "predicate");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {

          goto LABEL_65;
        }
        v18 = v13;
        v67 = (void *)v17;
        -[DNDSModeAssertionInvalidationRequest predicate](self, "predicate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionInvalidationRequest predicate](v5, "predicate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isEqual:", v20) & 1) == 0)
        {

LABEL_67:
          v12 = 0;
          goto LABEL_68;
        }
        v61 = v16;
        v62 = v19;
        v66 = v20;
        v13 = v18;
      }
      -[DNDSModeAssertionInvalidationRequest requestDate](self, "requestDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeAssertionInvalidationRequest requestDate](v5, "requestDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v21;
      if (v21 == v22)
      {
LABEL_23:
        -[DNDSModeAssertionInvalidationRequest details](self, "details");
        v27 = objc_claimAutoreleasedReturnValue();
        -[DNDSModeAssertionInvalidationRequest details](v5, "details");
        v28 = objc_claimAutoreleasedReturnValue();
        v65 = (void *)v27;
        v29 = v27 == v28;
        v30 = (void *)v28;
        if (v29)
        {
          v58 = (void *)v28;
          v59 = v22;
LABEL_33:
          -[DNDSModeAssertionInvalidationRequest source](self, "source");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSModeAssertionInvalidationRequest source](v5, "source");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36 == v37)
          {
            v53 = v13;
          }
          else
          {
            -[DNDSModeAssertionInvalidationRequest source](self, "source");
            v38 = objc_claimAutoreleasedReturnValue();
            if (!v38)
            {

              v12 = 0;
              v43 = v65;
              goto LABEL_77;
            }
            v52 = (void *)v38;
            -[DNDSModeAssertionInvalidationRequest source](v5, "source");
            v39 = objc_claimAutoreleasedReturnValue();
            if (!v39)
            {
              v54 = v36;
              v12 = 0;
              v43 = v65;
LABEL_76:

LABEL_77:
              if (v43 != v58)
              {

              }
              if (v68 != v59)
              {

              }
              if (v13 == v14)
                goto LABEL_90;
              goto LABEL_89;
            }
            v48 = (void *)v39;
            -[DNDSModeAssertionInvalidationRequest source](self, "source");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSModeAssertionInvalidationRequest source](v5, "source");
            v47 = v40;
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v40, "isEqual:"))
            {
              v54 = v36;
              v12 = 0;
              v43 = v65;
LABEL_75:

              goto LABEL_76;
            }
            v53 = v13;
          }
          v41 = -[DNDSModeAssertionInvalidationRequest reason](self, "reason");
          if (v41 == -[DNDSModeAssertionInvalidationRequest reason](v5, "reason"))
          {
            v42 = -[DNDSModeAssertionInvalidationRequest reasonOverride](self, "reasonOverride");
            v12 = v42 == -[DNDSModeAssertionInvalidationRequest reasonOverride](v5, "reasonOverride");
            v54 = v36;
            v29 = v36 == v37;
            v13 = v53;
            v43 = v65;
            if (!v29)
              goto LABEL_75;
          }
          else
          {
            if (v36 != v37)
            {

              v12 = 0;
              v43 = v65;
              v45 = v58;
              v13 = v53;
              if (v65 == v58)
              {
LABEL_86:

                if (v68 != v59)
                {

                }
                if (v13 == v14)
                  goto LABEL_90;
LABEL_89:

LABEL_90:
LABEL_68:
                v11 = v70;
                v10 = v71;
                v9 = v69;
                if (v6 != v7)
                  goto LABEL_69;
LABEL_71:

                goto LABEL_72;
              }
LABEL_85:

              goto LABEL_86;
            }
            v54 = v36;
            v12 = 0;
            v13 = v53;
            v43 = v65;
          }

          v45 = v58;
          if (v43 == v58)
            goto LABEL_86;
          goto LABEL_85;
        }
        -[DNDSModeAssertionInvalidationRequest details](self, "details");
        v31 = objc_claimAutoreleasedReturnValue();
        if (!v31)
        {

          if (v68 == v22)
          {

          }
          else
          {

          }
          if (v13 == v14)
            goto LABEL_65;

          goto LABEL_64;
        }
        v57 = (void *)v31;
        -[DNDSModeAssertionInvalidationRequest details](v5, "details");
        v32 = objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v59 = v22;
          v55 = (void *)v32;
          -[DNDSModeAssertionInvalidationRequest details](self, "details");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSModeAssertionInvalidationRequest details](v5, "details");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v33, "isEqual:", v34) & 1) != 0)
          {
            v50 = v34;
            v51 = v33;
            v58 = v30;
            goto LABEL_33;
          }

          v44 = v68;
          if (v68 != v59)
          {

            goto LABEL_58;
          }
        }
        else
        {

          v44 = v68;
          if (v68 != v22)
          {

            goto LABEL_58;
          }
        }

LABEL_58:
        if (v13 != v14)
        {
          v35 = v66;
          goto LABEL_60;
        }
LABEL_65:

        goto LABEL_66;
      }
      -[DNDSModeAssertionInvalidationRequest requestDate](self, "requestDate");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v64 = (void *)v23;
        -[DNDSModeAssertionInvalidationRequest requestDate](v5, "requestDate");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v60 = (void *)v24;
          -[DNDSModeAssertionInvalidationRequest requestDate](self, "requestDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSModeAssertionInvalidationRequest requestDate](v5, "requestDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v25, "isEqual:", v26) & 1) != 0)
          {
            v56 = v25;
            v63 = v26;
            goto LABEL_23;
          }

        }
        if (v13 != v14)
        {

          goto LABEL_66;
        }
      }
      else
      {

        v35 = v66;
        if (v13 != v14)
        {
LABEL_60:

LABEL_64:
          goto LABEL_65;
        }
      }

LABEL_66:
      goto LABEL_67;
    }
    v12 = 0;
  }
LABEL_72:

  return v12;
}

- (NSString)description
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
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSModeAssertionInvalidationRequest UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionInvalidationRequest predicate](self, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionInvalidationRequest requestDate](self, "requestDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionInvalidationRequest details](self, "details");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionInvalidationRequest source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionInvalidationRequest reason](self, "reason");
  DNDModeAssertionInvalidationReasonToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionInvalidationRequest reasonOverride](self, "reasonOverride");
  DNDModeAssertionInvalidationReasonOverrideToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; UUID: %@; predicate: %@; requestDate: %@; details: %@; source: %@; reason: %@; reasonOverride: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (DNDSModeAssertionInvalidationPredicate)predicate
{
  return self->_predicate;
}

- (NSDate)requestDate
{
  return self->_requestDate;
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
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
