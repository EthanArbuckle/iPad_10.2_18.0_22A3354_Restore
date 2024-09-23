@implementation CTCellularPlanProvisioningOnDeviceActivationRequest

- (id)description
{
  void *v3;
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
  const __CFString *v14;
  const __CFString *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularPlanProvisioningOnDeviceActivationRequest eid](self, "eid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t EID          = %@"), v4);

  -[CTCellularPlanProvisioningOnDeviceActivationRequest iccid](self, "iccid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t ICCID        = %@"), v5);

  -[CTCellularPlanProvisioningOnDeviceActivationRequest sourceIccid](self, "sourceIccid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t Source ICCID = %@"), v6);

  -[CTCellularPlanProvisioningOnDeviceActivationRequest unusableIccid](self, "unusableIccid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t Unusable ICCID = %@"), v7);

  -[CTCellularPlanProvisioningOnDeviceActivationRequest phoneNumber](self, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t Phone Number = %@"), v8);

  -[CTCellularPlanProvisioningOnDeviceActivationRequest mcc](self, "mcc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t MCC          = %@"), v9);

  -[CTCellularPlanProvisioningOnDeviceActivationRequest mnc](self, "mnc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t MNC          = %@"), v10);

  -[CTCellularPlanProvisioningOnDeviceActivationRequest gid1](self, "gid1");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t GID1         = %@"), v11);

  -[CTCellularPlanProvisioningOnDeviceActivationRequest gid2](self, "gid2");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t GID2         = %@"), v12);

  -[CTCellularPlanProvisioningOnDeviceActivationRequest smdpAddress](self, "smdpAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t SMDP Address = %@"), v13);

  if (-[CTCellularPlanProvisioningOnDeviceActivationRequest useDS](self, "useDS"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t DS           = %@"), v14);
  if (-[CTCellularPlanProvisioningOnDeviceActivationRequest isESim](self, "isESim"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t ESIM         = %@"), v15);
  -[CTCellularPlanProvisioningOnDeviceActivationRequest flowType](self, "flowType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\t Flow Type    = %@"), v16);

  objc_msgSend(v3, "appendString:", CFSTR("\n\t>"));
  return v3;
}

- (CTCellularPlanProvisioningOnDeviceActivationRequest)init
{
  CTCellularPlanProvisioningOnDeviceActivationRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CTCellularPlanProvisioningOnDeviceActivationRequest;
  result = -[CTCellularPlanProvisioningOnDeviceActivationRequest init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_useDS = 1;
  return result;
}

- (CTCellularPlanProvisioningOnDeviceActivationRequest)initWithEid:(id)a3 installIccid:(id)a4 sourceIccid:(id)a5 phoneNumber:(id)a6 mcc:(id)a7 mnc:(id)a8 gid1:(id)a9 gid2:(id)a10 smdp:(id)a11 useDS:(BOOL)a12 esim:(BOOL)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  CTCellularPlanProvisioningOnDeviceActivationRequest *v28;
  uint64_t v29;
  NSString *iccid;
  uint64_t v31;
  NSString *eid;
  uint64_t v33;
  NSString *phoneNumber;
  uint64_t v35;
  NSString *sourceIccid;
  uint64_t v37;
  NSString *mcc;
  uint64_t v39;
  NSString *mnc;
  uint64_t v41;
  NSString *gid1;
  uint64_t v43;
  NSString *gid2;
  uint64_t v45;
  NSString *smdpAddress;
  objc_super v48;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a9;
  v26 = a10;
  v27 = a11;
  v48.receiver = self;
  v48.super_class = (Class)CTCellularPlanProvisioningOnDeviceActivationRequest;
  v28 = -[CTCellularPlanProvisioningOnDeviceActivationRequest init](&v48, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v20, "copy");
    iccid = v28->_iccid;
    v28->_iccid = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    eid = v28->_eid;
    v28->_eid = (NSString *)v31;

    v33 = objc_msgSend(v22, "copy");
    phoneNumber = v28->_phoneNumber;
    v28->_phoneNumber = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    sourceIccid = v28->_sourceIccid;
    v28->_sourceIccid = (NSString *)v35;

    v37 = objc_msgSend(v23, "copy");
    mcc = v28->_mcc;
    v28->_mcc = (NSString *)v37;

    v39 = objc_msgSend(v24, "copy");
    mnc = v28->_mnc;
    v28->_mnc = (NSString *)v39;

    v41 = objc_msgSend(v25, "copy");
    gid1 = v28->_gid1;
    v28->_gid1 = (NSString *)v41;

    v43 = objc_msgSend(v26, "copy");
    gid2 = v28->_gid2;
    v28->_gid2 = (NSString *)v43;

    v45 = objc_msgSend(v27, "copy");
    smdpAddress = v28->_smdpAddress;
    v28->_smdpAddress = (NSString *)v45;

    v28->_useDS = a12;
    v28->_isESim = a13;
  }

  return v28;
}

- (CTCellularPlanProvisioningOnDeviceActivationRequest)initWithDetails:(id)a3 installIccid:(id)a4 sourceIccid:(id)a5 unusableIccid:(id)a6 phoneNumber:(id)a7 mcc:(id)a8 mnc:(id)a9 gid1:(id)a10 gid2:(id)a11 smdp:(id)a12 useDS:(BOOL)a13 esim:(BOOL)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  CTCellularPlanProvisioningOnDeviceActivationRequest *v28;
  uint64_t v29;
  NSString *iccid;
  uint64_t v31;
  NSString *eid;
  uint64_t v33;
  NSString *phoneNumber;
  uint64_t v35;
  NSString *sourceIccid;
  uint64_t v37;
  NSString *unusableIccid;
  uint64_t v39;
  NSString *mcc;
  uint64_t v41;
  NSString *mnc;
  uint64_t v43;
  NSString *gid1;
  uint64_t v45;
  NSString *gid2;
  uint64_t v47;
  NSString *smdpAddress;
  id v51;
  objc_super v52;

  v19 = a3;
  v51 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v52.receiver = self;
  v52.super_class = (Class)CTCellularPlanProvisioningOnDeviceActivationRequest;
  v28 = -[CTCellularPlanProvisioningOnDeviceActivationRequest init](&v52, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v51, "copy");
    iccid = v28->_iccid;
    v28->_iccid = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    eid = v28->_eid;
    v28->_eid = (NSString *)v31;

    v33 = objc_msgSend(v22, "copy");
    phoneNumber = v28->_phoneNumber;
    v28->_phoneNumber = (NSString *)v33;

    v35 = objc_msgSend(v20, "copy");
    sourceIccid = v28->_sourceIccid;
    v28->_sourceIccid = (NSString *)v35;

    v37 = objc_msgSend(v21, "copy");
    unusableIccid = v28->_unusableIccid;
    v28->_unusableIccid = (NSString *)v37;

    v39 = objc_msgSend(v23, "copy");
    mcc = v28->_mcc;
    v28->_mcc = (NSString *)v39;

    v41 = objc_msgSend(v24, "copy");
    mnc = v28->_mnc;
    v28->_mnc = (NSString *)v41;

    v43 = objc_msgSend(v25, "copy");
    gid1 = v28->_gid1;
    v28->_gid1 = (NSString *)v43;

    v45 = objc_msgSend(v26, "copy");
    gid2 = v28->_gid2;
    v28->_gid2 = (NSString *)v45;

    v47 = objc_msgSend(v27, "copy");
    smdpAddress = v28->_smdpAddress;
    v28->_smdpAddress = (NSString *)v47;

    v28->_useDS = a13;
    v28->_isESim = a14;
  }

  return v28;
}

- (CTCellularPlanProvisioningOnDeviceActivationRequest)initWithDetails:(id)a3 installIccid:(id)a4 sourceIccid:(id)a5 unusableIccid:(id)a6 phoneNumber:(id)a7 mcc:(id)a8 mnc:(id)a9 gid1:(id)a10 gid2:(id)a11 smdp:(id)a12 useDS:(BOOL)a13 esim:(BOOL)a14 flowType:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  CTCellularPlanProvisioningOnDeviceActivationRequest *v29;
  uint64_t v30;
  NSString *iccid;
  uint64_t v32;
  NSString *eid;
  uint64_t v34;
  NSString *phoneNumber;
  uint64_t v36;
  NSString *sourceIccid;
  uint64_t v38;
  NSString *unusableIccid;
  uint64_t v40;
  NSString *mcc;
  uint64_t v42;
  NSString *mnc;
  uint64_t v44;
  NSString *gid1;
  uint64_t v46;
  NSString *gid2;
  uint64_t v48;
  NSString *smdpAddress;
  id v52;
  id v53;
  objc_super v54;

  v20 = a3;
  v21 = a4;
  v53 = a5;
  v52 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v28 = a15;
  v54.receiver = self;
  v54.super_class = (Class)CTCellularPlanProvisioningOnDeviceActivationRequest;
  v29 = -[CTCellularPlanProvisioningOnDeviceActivationRequest init](&v54, sel_init);
  if (v29)
  {
    v30 = objc_msgSend(v21, "copy");
    iccid = v29->_iccid;
    v29->_iccid = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    eid = v29->_eid;
    v29->_eid = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    phoneNumber = v29->_phoneNumber;
    v29->_phoneNumber = (NSString *)v34;

    v36 = objc_msgSend(v53, "copy");
    sourceIccid = v29->_sourceIccid;
    v29->_sourceIccid = (NSString *)v36;

    v38 = objc_msgSend(v52, "copy");
    unusableIccid = v29->_unusableIccid;
    v29->_unusableIccid = (NSString *)v38;

    v40 = objc_msgSend(v23, "copy");
    mcc = v29->_mcc;
    v29->_mcc = (NSString *)v40;

    v42 = objc_msgSend(v24, "copy");
    mnc = v29->_mnc;
    v29->_mnc = (NSString *)v42;

    v44 = objc_msgSend(v25, "copy");
    gid1 = v29->_gid1;
    v29->_gid1 = (NSString *)v44;

    v46 = objc_msgSend(v26, "copy");
    gid2 = v29->_gid2;
    v29->_gid2 = (NSString *)v46;

    v48 = objc_msgSend(v27, "copy");
    smdpAddress = v29->_smdpAddress;
    v29->_smdpAddress = (NSString *)v48;

    v29->_useDS = a13;
    v29->_isESim = a14;
    objc_storeStrong((id *)&v29->_flowType, a15);
  }

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v18 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v4 = (void *)-[NSString copy](self->_eid, "copy");
  v5 = (void *)-[NSString copy](self->_iccid, "copy");
  v17 = (void *)-[NSString copy](self->_sourceIccid, "copy");
  v16 = (void *)-[NSString copy](self->_unusableIccid, "copy");
  v6 = (void *)-[NSString copy](self->_phoneNumber, "copy");
  v7 = (void *)-[NSString copy](self->_mcc, "copy");
  v15 = (void *)-[NSString copy](self->_mnc, "copy");
  v8 = (void *)-[NSString copy](self->_gid1, "copy");
  v9 = (void *)-[NSString copy](self->_gid2, "copy");
  v10 = (void *)-[NSString copy](self->_smdpAddress, "copy");
  v11 = *(_WORD *)&self->_useDS;
  v12 = (void *)-[NSString copy](self->_flowType, "copy");
  LOWORD(v14) = v11;
  v19 = (void *)objc_msgSend(v18, "initWithDetails:installIccid:sourceIccid:unusableIccid:phoneNumber:mcc:mnc:gid1:gid2:smdp:useDS:esim:flowType:", v4, v5, v17, v16, v6, v7, v15, v8, v9, v10, v14, v12);

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  CTCellularPlanProvisioningOnDeviceActivationRequest *v4;
  NSString *eid;
  void *v6;
  NSString *iccid;
  void *v8;
  NSString *sourceIccid;
  void *v10;
  NSString *unusableIccid;
  void *v12;
  NSString *phoneNumber;
  void *v14;
  NSString *mcc;
  void *v16;
  NSString *mnc;
  void *v18;
  NSString *gid1;
  uint64_t v20;
  NSString *v21;
  void *v22;
  NSString *gid2;
  NSString *smdpAddress;
  uint64_t v25;
  NSString *v26;
  void *v27;
  _BOOL4 v28;
  _BOOL4 v29;
  char v30;
  NSString *flowType;
  void *v32;
  void *v34;
  void *v35;
  void *v36;

  v4 = (CTCellularPlanProvisioningOnDeviceActivationRequest *)a3;
  if (self == v4)
  {
    v30 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      eid = self->_eid;
      -[CTCellularPlanProvisioningOnDeviceActivationRequest eid](v4, "eid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](eid, "isEqualToString:", v6))
      {
        iccid = self->_iccid;
        -[CTCellularPlanProvisioningOnDeviceActivationRequest iccid](v4, "iccid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](iccid, "isEqualToString:", v8))
        {
          sourceIccid = self->_sourceIccid;
          -[CTCellularPlanProvisioningOnDeviceActivationRequest sourceIccid](v4, "sourceIccid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqualToString:](sourceIccid, "isEqualToString:", v10))
          {
            unusableIccid = self->_unusableIccid;
            -[CTCellularPlanProvisioningOnDeviceActivationRequest unusableIccid](v4, "unusableIccid");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSString isEqualToString:](unusableIccid, "isEqualToString:", v12))
            {
              phoneNumber = self->_phoneNumber;
              -[CTCellularPlanProvisioningOnDeviceActivationRequest phoneNumber](v4, "phoneNumber");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[NSString isEqualToString:](phoneNumber, "isEqualToString:", v14))
              {
                mcc = self->_mcc;
                -[CTCellularPlanProvisioningOnDeviceActivationRequest mcc](v4, "mcc");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (-[NSString isEqualToString:](mcc, "isEqualToString:", v16))
                {
                  mnc = self->_mnc;
                  -[CTCellularPlanProvisioningOnDeviceActivationRequest mnc](v4, "mnc");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (-[NSString isEqualToString:](mnc, "isEqualToString:", v18))
                  {
                    gid1 = self->_gid1;
                    -[CTCellularPlanProvisioningOnDeviceActivationRequest gid1](v4, "gid1");
                    v20 = objc_claimAutoreleasedReturnValue();
                    v21 = gid1;
                    v22 = (void *)v20;
                    if (-[NSString isEqualToString:](v21, "isEqualToString:", v20))
                    {
                      v35 = v22;
                      gid2 = self->_gid2;
                      -[CTCellularPlanProvisioningOnDeviceActivationRequest gid2](v4, "gid2");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      if (-[NSString isEqualToString:](gid2, "isEqualToString:"))
                      {
                        smdpAddress = self->_smdpAddress;
                        -[CTCellularPlanProvisioningOnDeviceActivationRequest smdpAddress](v4, "smdpAddress");
                        v25 = objc_claimAutoreleasedReturnValue();
                        v26 = smdpAddress;
                        v27 = (void *)v25;
                        if (-[NSString isEqualToString:](v26, "isEqualToString:", v25))
                        {
                          v34 = v27;
                          v28 = -[CTCellularPlanProvisioningOnDeviceActivationRequest useDS](self, "useDS");
                          if (v28 == -[CTCellularPlanProvisioningOnDeviceActivationRequest useDS](v4, "useDS")
                            && (v29 = -[CTCellularPlanProvisioningOnDeviceActivationRequest isESim](self, "isESim"),
                                v29 == -[CTCellularPlanProvisioningOnDeviceActivationRequest isESim](v4, "isESim")))
                          {
                            flowType = self->_flowType;
                            -[CTCellularPlanProvisioningOnDeviceActivationRequest flowType](v4, "flowType");
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            v30 = -[NSString isEqualToString:](flowType, "isEqualToString:", v32);

                          }
                          else
                          {
                            v30 = 0;
                          }
                          v27 = v34;
                        }
                        else
                        {
                          v30 = 0;
                        }

                      }
                      else
                      {
                        v30 = 0;
                      }
                      v22 = v35;

                    }
                    else
                    {
                      v30 = 0;
                    }

                  }
                  else
                  {
                    v30 = 0;
                  }

                }
                else
                {
                  v30 = 0;
                }

              }
              else
              {
                v30 = 0;
              }

            }
            else
            {
              v30 = 0;
            }

          }
          else
          {
            v30 = 0;
          }

        }
        else
        {
          v30 = 0;
        }

      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
    }
  }

  return v30;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *eid;
  id v5;

  eid = self->_eid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eid, CFSTR("eid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iccid, CFSTR("iccid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceIccid, CFSTR("sourceIccid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unusableIccid, CFSTR("unusableIccid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phoneNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mcc, CFSTR("mcc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mnc, CFSTR("mnc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gid1, CFSTR("gid1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gid2, CFSTR("gid2"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_smdpAddress, CFSTR("smdpAddress"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useDS, CFSTR("useDS"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isESim, CFSTR("isESim"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_flowType, CFSTR("flowType"));

}

- (CTCellularPlanProvisioningOnDeviceActivationRequest)initWithCoder:(id)a3
{
  id v4;
  CTCellularPlanProvisioningOnDeviceActivationRequest *v5;
  uint64_t v6;
  NSString *eid;
  uint64_t v8;
  NSString *iccid;
  uint64_t v10;
  NSString *sourceIccid;
  uint64_t v12;
  NSString *unusableIccid;
  uint64_t v14;
  NSString *phoneNumber;
  uint64_t v16;
  NSString *mcc;
  uint64_t v18;
  NSString *mnc;
  uint64_t v20;
  NSString *gid1;
  uint64_t v22;
  NSString *gid2;
  uint64_t v24;
  NSString *smdpAddress;
  uint64_t v26;
  NSString *flowType;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CTCellularPlanProvisioningOnDeviceActivationRequest;
  v5 = -[CTCellularPlanProvisioningOnDeviceActivationRequest init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eid"));
    v6 = objc_claimAutoreleasedReturnValue();
    eid = v5->_eid;
    v5->_eid = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iccid"));
    v8 = objc_claimAutoreleasedReturnValue();
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceIccid"));
    v10 = objc_claimAutoreleasedReturnValue();
    sourceIccid = v5->_sourceIccid;
    v5->_sourceIccid = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unusableIccid"));
    v12 = objc_claimAutoreleasedReturnValue();
    unusableIccid = v5->_unusableIccid;
    v5->_unusableIccid = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v14 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mcc"));
    v16 = objc_claimAutoreleasedReturnValue();
    mcc = v5->_mcc;
    v5->_mcc = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mnc"));
    v18 = objc_claimAutoreleasedReturnValue();
    mnc = v5->_mnc;
    v5->_mnc = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gid1"));
    v20 = objc_claimAutoreleasedReturnValue();
    gid1 = v5->_gid1;
    v5->_gid1 = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gid2"));
    v22 = objc_claimAutoreleasedReturnValue();
    gid2 = v5->_gid2;
    v5->_gid2 = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smdpAddress"));
    v24 = objc_claimAutoreleasedReturnValue();
    smdpAddress = v5->_smdpAddress;
    v5->_smdpAddress = (NSString *)v24;

    v5->_useDS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useDS"));
    v5->_isESim = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isESim"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flowType"));
    v26 = objc_claimAutoreleasedReturnValue();
    flowType = v5->_flowType;
    v5->_flowType = (NSString *)v26;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)eid
{
  return self->_eid;
}

- (void)setEid:(id)a3
{
  objc_storeStrong((id *)&self->_eid, a3);
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
  objc_storeStrong((id *)&self->_iccid, a3);
}

- (NSString)sourceIccid
{
  return self->_sourceIccid;
}

- (void)setSourceIccid:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIccid, a3);
}

- (NSString)unusableIccid
{
  return self->_unusableIccid;
}

- (void)setUnusableIccid:(id)a3
{
  objc_storeStrong((id *)&self->_unusableIccid, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)mcc
{
  return self->_mcc;
}

- (void)setMcc:(id)a3
{
  objc_storeStrong((id *)&self->_mcc, a3);
}

- (NSString)mnc
{
  return self->_mnc;
}

- (void)setMnc:(id)a3
{
  objc_storeStrong((id *)&self->_mnc, a3);
}

- (NSString)gid1
{
  return self->_gid1;
}

- (void)setGid1:(id)a3
{
  objc_storeStrong((id *)&self->_gid1, a3);
}

- (NSString)gid2
{
  return self->_gid2;
}

- (void)setGid2:(id)a3
{
  objc_storeStrong((id *)&self->_gid2, a3);
}

- (NSString)smdpAddress
{
  return self->_smdpAddress;
}

- (void)setSmdpAddress:(id)a3
{
  objc_storeStrong((id *)&self->_smdpAddress, a3);
}

- (BOOL)useDS
{
  return self->_useDS;
}

- (void)setUseDS:(BOOL)a3
{
  self->_useDS = a3;
}

- (BOOL)isESim
{
  return self->_isESim;
}

- (void)setIsESim:(BOOL)a3
{
  self->_isESim = a3;
}

- (NSString)flowType
{
  return self->_flowType;
}

- (void)setFlowType:(id)a3
{
  objc_storeStrong((id *)&self->_flowType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowType, 0);
  objc_storeStrong((id *)&self->_smdpAddress, 0);
  objc_storeStrong((id *)&self->_gid2, 0);
  objc_storeStrong((id *)&self->_gid1, 0);
  objc_storeStrong((id *)&self->_mnc, 0);
  objc_storeStrong((id *)&self->_mcc, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_unusableIccid, 0);
  objc_storeStrong((id *)&self->_sourceIccid, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_eid, 0);
}

@end
