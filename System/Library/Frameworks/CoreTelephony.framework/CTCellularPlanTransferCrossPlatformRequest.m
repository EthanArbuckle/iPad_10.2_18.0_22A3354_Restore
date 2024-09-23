@implementation CTCellularPlanTransferCrossPlatformRequest

- (CTCellularPlanTransferCrossPlatformRequest)initWithPhoneNumber:(id)a3 carrierName:(id)a4 mccMnc:(id)a5 gid1:(id)a6 gid2:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CTCellularPlanTransferCrossPlatformRequest *v17;
  CTCellularPlanTransferCrossPlatformRequest *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CTCellularPlanTransferCrossPlatformRequest;
  v17 = -[CTCellularPlanTransferCrossPlatformRequest init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_phoneNumber, a3);
    objc_storeStrong((id *)&v18->_carrierName, a4);
    objc_storeStrong((id *)&v18->_mccMnc, a5);
    objc_storeStrong((id *)&v18->_gid1, a6);
    objc_storeStrong((id *)&v18->_gid2, a7);
  }

  return v18;
}

- (CTCellularPlanTransferCrossPlatformRequest)initWithPhoneNumber:(id)a3 carrierName:(id)a4 mccMnc:(id)a5 gid1:(id)a6 gid2:(id)a7 carrierID:(id)a8
{
  id v15;
  id v16;
  id v17;
  CTCellularPlanTransferCrossPlatformRequest *v18;
  CTCellularPlanTransferCrossPlatformRequest *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CTCellularPlanTransferCrossPlatformRequest;
  v18 = -[CTCellularPlanTransferCrossPlatformRequest init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_phoneNumber, a3);
    objc_storeStrong((id *)&v19->_carrierName, a4);
    objc_storeStrong((id *)&v19->_mccMnc, a5);
    objc_storeStrong((id *)&v19->_gid1, a6);
    objc_storeStrong((id *)&v19->_gid2, a7);
    objc_storeStrong((id *)&v19->_carrierID, a8);
  }

  return v19;
}

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
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularPlanTransferCrossPlatformRequest phoneNumber](self, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTCellularPlanTransferCrossPlatformRequest phoneNumber](self, "phoneNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" phoneNumber=%@"), v5);

  }
  -[CTCellularPlanTransferCrossPlatformRequest carrierName](self, "carrierName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTCellularPlanTransferCrossPlatformRequest carrierName](self, "carrierName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" carrierName=%@"), v7);

  }
  -[CTCellularPlanTransferCrossPlatformRequest mccMnc](self, "mccMnc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTCellularPlanTransferCrossPlatformRequest mccMnc](self, "mccMnc");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" mccMnc=%@"), v9);

  }
  -[CTCellularPlanTransferCrossPlatformRequest gid1](self, "gid1");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CTCellularPlanTransferCrossPlatformRequest gid1](self, "gid1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" gid1=%@"), v11);

  }
  -[CTCellularPlanTransferCrossPlatformRequest gid2](self, "gid2");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CTCellularPlanTransferCrossPlatformRequest gid2](self, "gid2");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" gid2=%@"), v13);

  }
  -[CTCellularPlanTransferCrossPlatformRequest carrierID](self, "carrierID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CTCellularPlanTransferCrossPlatformRequest carrierID](self, "carrierID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" carrierID=%@"), v15);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTCellularPlanTransferCrossPlatformRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = (CTCellularPlanTransferCrossPlatformRequest *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTCellularPlanTransferCrossPlatformRequest phoneNumber](self, "phoneNumber");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCellularPlanTransferCrossPlatformRequest phoneNumber](v4, "phoneNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v6))
      {
        -[CTCellularPlanTransferCrossPlatformRequest carrierName](self, "carrierName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCellularPlanTransferCrossPlatformRequest carrierName](v4, "carrierName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToString:", v8))
        {
          -[CTCellularPlanTransferCrossPlatformRequest mccMnc](self, "mccMnc");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTCellularPlanTransferCrossPlatformRequest mccMnc](v4, "mccMnc");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isEqualToString:", v10))
          {
            -[CTCellularPlanTransferCrossPlatformRequest gid1](self, "gid1");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[CTCellularPlanTransferCrossPlatformRequest gid1](v4, "gid1");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "isEqualToString:", v12))
            {
              v21 = v11;
              -[CTCellularPlanTransferCrossPlatformRequest gid2](self, "gid2");
              v13 = objc_claimAutoreleasedReturnValue();
              -[CTCellularPlanTransferCrossPlatformRequest gid2](v4, "gid2");
              v14 = objc_claimAutoreleasedReturnValue();
              v22 = (void *)v13;
              v15 = (void *)v13;
              v16 = (void *)v14;
              if (objc_msgSend(v15, "isEqualToString:", v14))
              {
                -[CTCellularPlanTransferCrossPlatformRequest carrierID](self, "carrierID");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[CTCellularPlanTransferCrossPlatformRequest carrierID](v4, "carrierID");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v20, "isEqualToString:", v19);

              }
              else
              {
                v17 = 0;
              }

              v11 = v21;
            }
            else
            {
              v17 = 0;
            }

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCellularPlanTransferCrossPlatformRequest)initWithCoder:(id)a3
{
  id v4;
  CTCellularPlanTransferCrossPlatformRequest *v5;
  uint64_t v6;
  NSString *phoneNumber;
  uint64_t v8;
  NSString *carrierName;
  uint64_t v10;
  NSString *mccMnc;
  uint64_t v12;
  NSString *gid1;
  uint64_t v14;
  NSString *gid2;
  uint64_t v16;
  NSString *carrierID;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTCellularPlanTransferCrossPlatformRequest;
  v5 = -[CTCellularPlanTransferCrossPlatformRequest init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierName"));
    v8 = objc_claimAutoreleasedReturnValue();
    carrierName = v5->_carrierName;
    v5->_carrierName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mccMnc"));
    v10 = objc_claimAutoreleasedReturnValue();
    mccMnc = v5->_mccMnc;
    v5->_mccMnc = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gid1"));
    v12 = objc_claimAutoreleasedReturnValue();
    gid1 = v5->_gid1;
    v5->_gid1 = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gid2"));
    v14 = objc_claimAutoreleasedReturnValue();
    gid2 = v5->_gid2;
    v5->_gid2 = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrierID"));
    v16 = objc_claimAutoreleasedReturnValue();
    carrierID = v5->_carrierID;
    v5->_carrierID = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[CTCellularPlanTransferCrossPlatformRequest phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("phoneNumber"));

  -[CTCellularPlanTransferCrossPlatformRequest carrierName](self, "carrierName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("carrierName"));

  -[CTCellularPlanTransferCrossPlatformRequest mccMnc](self, "mccMnc");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("mccMnc"));

  -[CTCellularPlanTransferCrossPlatformRequest gid1](self, "gid1");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("gid1"));

  -[CTCellularPlanTransferCrossPlatformRequest gid2](self, "gid2");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("gid2"));

  -[CTCellularPlanTransferCrossPlatformRequest carrierID](self, "carrierID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("carrierID"));

}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (NSString)mccMnc
{
  return self->_mccMnc;
}

- (NSString)gid1
{
  return self->_gid1;
}

- (NSString)gid2
{
  return self->_gid2;
}

- (NSString)carrierID
{
  return self->_carrierID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierID, 0);
  objc_storeStrong((id *)&self->_gid2, 0);
  objc_storeStrong((id *)&self->_gid1, 0);
  objc_storeStrong((id *)&self->_mccMnc, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
