@implementation AVTStickerRecord

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
  v7[2] = __43__AVTStickerRecord_matchingIdentifierTest___block_invoke;
  v7[3] = &unk_24DD32860;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x22074B1E8](v7);

  return v5;
}

uint64_t __43__AVTStickerRecord_matchingIdentifierTest___block_invoke(uint64_t a1, void *a2)
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

- (AVTStickerRecord)initWithIdentifier:(id)a3 avatarRecordIdentifier:(id)a4 stickerConfigurationIdentifier:(id)a5 frequencySum:(id)a6 serializationVersion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSNumber *v15;
  NSNumber *v16;
  AVTStickerRecord *v17;
  uint64_t v18;
  NSString *identifier;
  uint64_t v20;
  NSString *avatarRecordIdentifier;
  uint64_t v22;
  NSString *stickerConfigurationIdentifier;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (NSNumber *)a6;
  v16 = (NSNumber *)a7;
  v25.receiver = self;
  v25.super_class = (Class)AVTStickerRecord;
  v17 = -[AVTStickerRecord init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    avatarRecordIdentifier = v17->_avatarRecordIdentifier;
    v17->_avatarRecordIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    stickerConfigurationIdentifier = v17->_stickerConfigurationIdentifier;
    v17->_stickerConfigurationIdentifier = (NSString *)v22;

    v17->_frequencySum = v15;
    v17->_serializationVersion = v16;
  }

  return v17;
}

- (AVTStickerRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AVTStickerRecord *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avatarRecordIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stickerConfigurationIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frequencySum"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serializationVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AVTStickerRecord initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:](self, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v5, v6, v7, v8, v9);
  return v10;
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
  -[AVTStickerRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[AVTStickerRecord avatarRecordIdentifier](self, "avatarRecordIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("avatarRecordIdentifier"));

  -[AVTStickerRecord stickerConfigurationIdentifier](self, "stickerConfigurationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("stickerConfigurationIdentifier"));

  -[AVTStickerRecord frequencySum](self, "frequencySum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("frequencySum"));

  -[AVTStickerRecord serializationVersion](self, "serializationVersion");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("serializationVersion"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTStickerRecord *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AVTStickerRecord *v10;

  v4 = [AVTStickerRecord alloc];
  -[AVTStickerRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecord avatarRecordIdentifier](self, "avatarRecordIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecord stickerConfigurationIdentifier](self, "stickerConfigurationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecord frequencySum](self, "frequencySum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecord serializationVersion](self, "serializationVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AVTStickerRecord initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:](v4, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v5, v6, v7, v8, v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  AVTStickerRecord *v5;
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

  v5 = (AVTStickerRecord *)a3;
  if (v5 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVTStickerRecord identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        || (-[AVTStickerRecord identifier](v5, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[AVTStickerRecord identifier](self, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTStickerRecord identifier](v5, "identifier");
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
      -[AVTStickerRecord avatarRecordIdentifier](self, "avatarRecordIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        -[AVTStickerRecord avatarRecordIdentifier](v5, "avatarRecordIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
LABEL_14:
          -[AVTStickerRecord stickerConfigurationIdentifier](self, "stickerConfigurationIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15
            || (-[AVTStickerRecord stickerConfigurationIdentifier](v5, "stickerConfigurationIdentifier"),
                (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[AVTStickerRecord stickerConfigurationIdentifier](self, "stickerConfigurationIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVTStickerRecord stickerConfigurationIdentifier](v5, "stickerConfigurationIdentifier");
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
      -[AVTStickerRecord avatarRecordIdentifier](self, "avatarRecordIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTStickerRecord avatarRecordIdentifier](v5, "avatarRecordIdentifier");
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

  -[AVTStickerRecord identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AVTStickerRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v7 + 1) = v4;
  *(_QWORD *)&v7 = objc_msgSend(v5, "hash");
  v6 = v7 >> 43;
  -[AVTStickerRecord avatarRecordIdentifier](self, "avatarRecordIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[AVTStickerRecord avatarRecordIdentifier](self, "avatarRecordIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v7 + 1) = v9;
  *(_QWORD *)&v7 = objc_msgSend(v10, "hash");
  -[AVTStickerRecord stickerConfigurationIdentifier](self, "stickerConfigurationIdentifier");
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
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVTStickerRecord;
  -[AVTStickerRecord description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTStickerRecord identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecord avatarRecordIdentifier](self, "avatarRecordIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecord stickerConfigurationIdentifier](self, "stickerConfigurationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerRecord frequencySum](self, "frequencySum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  -[AVTStickerRecord serializationVersion](self, "serializationVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" identifer:%@ ari:%@ sci:%@ frequencySum:%ld version:%ld"), v5, v6, v7, v9, objc_msgSend(v10, "integerValue"));

  v11 = (void *)objc_msgSend(v4, "copy");
  return (NSString *)v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)avatarRecordIdentifier
{
  return self->_avatarRecordIdentifier;
}

- (NSString)stickerConfigurationIdentifier
{
  return self->_stickerConfigurationIdentifier;
}

- (NSNumber)frequencySum
{
  return self->_frequencySum;
}

- (NSNumber)serializationVersion
{
  return self->_serializationVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_avatarRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
