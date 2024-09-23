@implementation FCRecordContentArchive

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    -[FCRecordContentArchive recordBase]((id *)&self->super.super.isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6[1], "base");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)recordBase
{
  if (a1)
  {
    objc_msgSend(a1[1], "base");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FCRecordContentArchive recordBase]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (id)description
{
  FCDescription *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  -[FCRecordContentArchive recordBase]((id *)&self->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __37__FCRecordContentArchive_description__block_invoke;
  v16[3] = &unk_1E463ADC8;
  v17 = v4;
  v5 = v4;
  __37__FCRecordContentArchive_description__block_invoke((uint64_t)v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("type"), v6);

  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:value:](v3, "addField:value:", CFSTR("identifier"), v7);

  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "fetchDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateWithPBDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("fetchDate"), v10);

  v11 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "modificationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateWithPBDate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("modificationDate"), v13);

  -[FCDescription descriptionString](v3, "descriptionString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

const __CFString *__37__FCRecordContentArchive_description__block_invoke(uint64_t a1)
{
  unsigned int v1;

  v1 = objc_msgSend(*(id *)(a1 + 32), "recordType") - 1;
  if (v1 > 0xF)
    return CFSTR("Unknown");
  else
    return off_1E463AE80[v1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCRecordContentArchive)initWithCoder:(id)a3
{
  id v4;
  FCRecordContentArchive *v5;
  uint64_t v6;
  PBCodable *record;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCRecordContentArchive;
  v5 = -[FCRecordContentArchive init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("record"));
    v6 = objc_claimAutoreleasedReturnValue();
    record = v5->_record;
    v5->_record = (PBCodable *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_record, CFSTR("record"));
}

- (id)unarchiveIntoContentContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  FCContentUnarchiveResult *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCRecordContentArchive recordBase]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalContentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "recordSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__FCRecordContentArchive_unarchiveIntoContentContext___block_invoke;
  v14[3] = &unk_1E463ADF0;
  v15 = v5;
  v8 = v5;
  objc_msgSend(v7, "fc_firstObjectPassingTest:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = self->_record;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "savePBRecords:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[FCContentUnarchiveResult initWithInterestToken:storageSize:]([FCContentUnarchiveResult alloc], "initWithInterestToken:storageSize:", v11, -[FCContentArchive storageSize](self, "storageSize"));
  return v12;
}

BOOL __54__FCRecordContentArchive_unarchiveIntoContentContext___block_invoke(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "pbRecordType");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "recordType");
}

- (id)manifest
{
  FCContentManifest *v3;
  void *v4;
  void *v5;
  void *v6;
  FCContentManifest *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = [FCContentManifest alloc];
  -[FCRecordContentArchive recordBase]((id *)&self->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCContentManifest initWithRecordIDs:](v3, "initWithRecordIDs:", v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
}

@end
