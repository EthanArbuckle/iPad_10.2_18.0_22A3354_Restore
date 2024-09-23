@implementation HKClinicalIngestionPerAccountOutcome

- (HKClinicalIngestionPerAccountOutcome)initWithAccountIdentifier:(id)a3 info:(unint64_t)a4
{
  id v6;
  HKClinicalIngestionPerAccountOutcome *v7;
  uint64_t v8;
  NSUUID *accountIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKClinicalIngestionPerAccountOutcome;
  v7 = -[HKClinicalIngestionPerAccountOutcome init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    accountIdentifier = v7->_accountIdentifier;
    v7->_accountIdentifier = (NSUUID *)v8;

    v7->_info = a4;
  }

  return v7;
}

- (id)formattedInfoStringJoinedByString:(id)a3
{
  void (**v3)(_QWORD, _QWORD);
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD v44[5];
  _QWORD v45[14];

  v45[12] = *MEMORY[0x24BDAC8D0];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __74__HKClinicalIngestionPerAccountOutcome_formattedInfoStringJoinedByString___block_invoke;
  v44[3] = &unk_24D54A760;
  v44[4] = self;
  v43 = a3;
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199F7D50](v44);
  v4 = (void *)MEMORY[0x24BDD17C8];
  v3[2](v3, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ gateway update"), v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v41;
  v5 = (void *)MEMORY[0x24BDD17C8];
  v3[2](v3, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ ingestion eligible"), v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v39;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v3[2](v3, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ perform file import"), v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v37;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v3[2](v3, 8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ did ingest"), v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v35;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v3[2](v3, 16);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ did run full ingest"), v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v33;
  v9 = (void *)MEMORY[0x24BDD17C8];
  v3[2](v3, 2048);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ did upgrade to full ingest"), v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v31;
  v10 = (void *)MEMORY[0x24BDD17C8];
  v3[2](v3, 1024);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ did postpone panel ingest"), v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v29;
  v11 = (void *)MEMORY[0x24BDD17C8];
  v3[2](v3, 32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ did run extraction"), v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v27;
  v12 = (void *)MEMORY[0x24BDD17C8];
  v3[2](v3, 64);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ mark account as upgrade needed"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v14;
  v15 = (void *)MEMORY[0x24BDD17C8];
  v3[2](v3, 256);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ did run stale resources operation"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v17;
  v18 = (void *)MEMORY[0x24BDD17C8];
  v3[2](v3, 512);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ did detect gateway features"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v20;
  v21 = (void *)MEMORY[0x24BDD17C8];
  v3[2](v3, 4096);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ did block account from ingest"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[11] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 12);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "componentsJoinedByString:", v43);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

__CFString *__74__HKClinicalIngestionPerAccountOutcome_formattedInfoStringJoinedByString___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) & a2) != 0)
    return CFSTR("[X]");
  else
    return CFSTR("[_]");
}

- (unint64_t)hash
{
  return self->_info ^ -[NSUUID hash](self->_accountIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKClinicalIngestionPerAccountOutcome *v4;
  HKClinicalIngestionPerAccountOutcome *v5;
  HKClinicalIngestionPerAccountOutcome *v6;
  NSUUID *accountIdentifier;
  NSUUID *v8;
  void *v9;
  NSUUID *v10;
  void *v11;
  unint64_t v12;
  BOOL v13;
  unint64_t info;

  v4 = (HKClinicalIngestionPerAccountOutcome *)a3;
  v5 = v4;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      accountIdentifier = self->_accountIdentifier;
      -[HKClinicalIngestionPerAccountOutcome accountIdentifier](v6, "accountIdentifier");
      v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      if (accountIdentifier == v8)
      {
        info = self->_info;
        v13 = info == -[HKClinicalIngestionPerAccountOutcome info](v6, "info");
      }
      else
      {
        -[HKClinicalIngestionPerAccountOutcome accountIdentifier](v6, "accountIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = self->_accountIdentifier;
          -[HKClinicalIngestionPerAccountOutcome accountIdentifier](v6, "accountIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSUUID isEqual:](v10, "isEqual:", v11))
          {
            v12 = self->_info;
            v13 = v12 == -[HKClinicalIngestionPerAccountOutcome info](v6, "info");
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
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKClinicalIngestionPerAccountOutcome)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HKClinicalIngestionPerAccountOutcome *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccountIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Info"));

  v7 = -[HKClinicalIngestionPerAccountOutcome initWithAccountIdentifier:info:](self, "initWithAccountIdentifier:info:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *accountIdentifier;
  id v5;

  accountIdentifier = self->_accountIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountIdentifier, CFSTR("AccountIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_info, CFSTR("Info"));

}

- (NSUUID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)info
{
  return self->_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
