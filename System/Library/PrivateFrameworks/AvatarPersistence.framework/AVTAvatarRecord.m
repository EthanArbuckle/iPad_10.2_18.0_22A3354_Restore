@implementation AVTAvatarRecord

+ (id)matchingIdentifierTest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__AVTAvatarRecord_matchingIdentifierTest___block_invoke;
  v7[3] = &unk_24DD327F8;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x22074B1E8](v7);

  return v5;
}

uint64_t __42__AVTAvatarRecord_matchingIdentifierTest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)dataForNewRecord
{
  if (dataForNewRecord_onceToken != -1)
    dispatch_once(&dataForNewRecord_onceToken, &__block_literal_global_6);
  return (id)dataForNewRecord_data;
}

void __35__AVTAvatarRecord_dataForNewRecord__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BE0B430]);
  objc_msgSend(v2, "dataRepresentation");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dataForNewRecord_data;
  dataForNewRecord_data = v0;

}

+ (id)dataForNeutralRecord
{
  if (dataForNeutralRecord_onceToken != -1)
    dispatch_once(&dataForNeutralRecord_onceToken, &__block_literal_global_2);
  return (id)dataForNeutralRecord_data;
}

void __39__AVTAvatarRecord_dataForNeutralRecord__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BE0B428], "neutralMemojiDescriptor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataRepresentation");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dataForNeutralRecord_data;
  dataForNeutralRecord_data = v0;

}

+ (BOOL)canLoadAvatarWithData:(id)a3
{
  return objc_msgSend(MEMORY[0x24BE0B430], "canLoadDataRepresentation:", a3);
}

+ (id)defaultAvatarRecord
{
  void *v2;
  AVTAvatarRecord *v3;
  void *v4;
  AVTAvatarRecord *v5;

  objc_msgSend(a1, "dataForNeutralRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [AVTAvatarRecord alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AVTAvatarRecord initWithAvatarData:orderDate:](v3, "initWithAvatarData:orderDate:", v2, v4);

  return v5;
}

- (AVTAvatarRecord)init
{
  void *v3;
  AVTAvatarRecord *v4;

  objc_msgSend((id)objc_opt_class(), "dataForNeutralRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AVTAvatarRecord initWithAvatarData:](self, "initWithAvatarData:", v3);

  return v4;
}

- (AVTAvatarRecord)initWithAvatarData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  AVTAvatarRecord *v7;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AVTAvatarRecord initWithAvatarData:orderDate:](self, "initWithAvatarData:orderDate:", v5, v6);

  return v7;
}

- (AVTAvatarRecord)initWithAvatarData:(id)a3 orderDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AVTAvatarRecord *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AVTAvatarRecord initWithAvatarData:identifier:orderDate:](self, "initWithAvatarData:identifier:orderDate:", v7, v9, v6);
  return v10;
}

- (AVTAvatarRecord)initWithAvatarData:(id)a3 identifier:(id)a4 orderDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTAvatarRecord *v12;
  uint64_t v13;
  NSString *identifier;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AVTAvatarRecord;
  v12 = -[AVTAvatarRecord init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_avatarData, a3);
    objc_storeStrong((id *)&v12->_orderDate, a5);
  }

  return v12;
}

- (AVTAvatarRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AVTAvatarRecord *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avatarData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orderDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AVTAvatarRecord initWithAvatarData:identifier:orderDate:](self, "initWithAvatarData:identifier:orderDate:", v6, v5, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AVTAvatarRecord avatarData](self, "avatarData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("avatarData"));
  -[AVTAvatarRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[AVTAvatarRecord orderDate](self, "orderDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("orderDate"));

}

- (BOOL)isEditable
{
  return 1;
}

- (BOOL)isPuppet
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTAvatarRecord *v4;
  void *v5;
  void *v6;
  void *v7;
  AVTAvatarRecord *v8;

  v4 = [AVTAvatarRecord alloc];
  -[AVTAvatarRecord avatarData](self, "avatarData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarRecord identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarRecord orderDate](self, "orderDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTAvatarRecord initWithAvatarData:identifier:orderDate:](v4, "initWithAvatarData:identifier:orderDate:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AVTAvatarRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = (AVTAvatarRecord *)a3;
  if (v5 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVTAvatarRecord identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        || (-[AVTAvatarRecord identifier](v5, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AVTAvatarRecord identifier](self, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTAvatarRecord identifier](v5, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (v6)
        {

          if (!v9)
            goto LABEL_19;
        }
        else
        {

          if ((v9 & 1) == 0)
            goto LABEL_19;
        }
      }
      -[AVTAvatarRecord avatarData](self, "avatarData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        -[AVTAvatarRecord avatarData](v5, "avatarData");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
LABEL_14:
          -[AVTAvatarRecord orderDate](self, "orderDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15
            || (-[AVTAvatarRecord orderDate](v5, "orderDate"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[AVTAvatarRecord orderDate](self, "orderDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVTAvatarRecord orderDate](v5, "orderDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v16, "isEqual:", v17);

            if (v15)
            {
LABEL_23:

              goto LABEL_20;
            }
          }
          else
          {
            v10 = 1;
          }

          goto LABEL_23;
        }
      }
      -[AVTAvatarRecord avatarData](self, "avatarData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarRecord avatarData](v5, "avatarData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v11)
      {

        if (v14)
          goto LABEL_14;
      }
      else
      {

        if ((v14 & 1) != 0)
          goto LABEL_14;
      }
    }
LABEL_19:
    v10 = 0;
    goto LABEL_20;
  }
  v10 = 1;
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;

  -[AVTAvatarRecord identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AVTAvatarRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v7 + 1) = v4;
  *(_QWORD *)&v7 = objc_msgSend(v5, "hash");
  v6 = v7 >> 43;
  -[AVTAvatarRecord avatarData](self, "avatarData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[AVTAvatarRecord avatarData](self, "avatarData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v7 + 1) = v9;
  *(_QWORD *)&v7 = objc_msgSend(v10, "hash");
  -[AVTAvatarRecord orderDate](self, "orderDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (v7 >> 32) ^ v6 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTAvatarRecord;
  -[AVTAvatarRecord description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendString:", CFSTR(" "));
  -[AVTAvatarRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

  v6 = (void *)objc_msgSend(v4, "copy");
  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  -[AVTAvatarRecord avatarData](self, "avatarData");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return MEMORY[0x24BDBD1B8];
  v4 = (void *)v3;
  -[AVTAvatarRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return MEMORY[0x24BDBD1B8];
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[AVTAvatarRecord avatarData](self, "avatarData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithData:encoding:", v7, 4);

  v12[0] = CFSTR("identifier");
  -[AVTAvatarRecord identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("avatarDataString");
  v13[0] = v9;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)avatarData
{
  return self->_avatarData;
}

- (void)setAvatarData:(id)a3
{
  objc_storeStrong((id *)&self->_avatarData, a3);
}

- (NSDate)orderDate
{
  return self->_orderDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderDate, 0);
  objc_storeStrong((id *)&self->_avatarData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
