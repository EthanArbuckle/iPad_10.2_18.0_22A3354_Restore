@implementation _KSTextReplacementEntry

- (NSString)shortcut
{
  return self->_shortcut;
}

- (NSString)phrase
{
  return self->_phrase;
}

- (_KSTextReplacementEntry)init
{
  _KSTextReplacementEntry *v2;
  uint64_t v3;
  NSDate *timestamp;
  uint64_t v5;
  NSString *cloudID;
  NSString *shortcut;
  NSString *phrase;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_KSTextReplacementEntry;
  v2 = -[_KSTextReplacementEntry init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    timestamp = v2->_timestamp;
    v2->_timestamp = (NSDate *)v3;

    -[_KSTextReplacementEntry uniqueID](v2, "uniqueID");
    v5 = objc_claimAutoreleasedReturnValue();
    cloudID = v2->_cloudID;
    v2->_cloudID = (NSString *)v5;

    shortcut = v2->_shortcut;
    v2->_shortcut = (NSString *)&stru_24E206F98;

    phrase = v2->_phrase;
    v2->_phrase = (NSString *)&stru_24E206F98;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudData, 0);
  objc_storeStrong((id *)&self->_priorValue, 0);
  objc_storeStrong((id *)&self->_cloudID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
}

- (id)uniqueID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setWasDeleted:(BOOL)a3
{
  self->_wasDeleted = a3;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setShortcut:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setPhrase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setNeedsSaveToCloud:(BOOL)a3
{
  self->_needsSaveToCloud = a3;
}

- (void)setCloudID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setCloudData:(id)a3
{
  objc_storeStrong((id *)&self->_cloudData, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_phrase, "copyWithZone:", a3);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = -[NSString copyWithZone:](self->_shortcut, "copyWithZone:", a3);
    v9 = (void *)v5[3];
    v5[3] = v8;

    v10 = -[NSDate copyWithZone:](self->_timestamp, "copyWithZone:", a3);
    v11 = (void *)v5[4];
    v5[4] = v10;

    v12 = -[_KSTextReplacementEntry copyWithZone:](self->_priorValue, "copyWithZone:", a3);
    v13 = (void *)v5[6];
    v5[6] = v12;

    v14 = -[NSString copyWithZone:](self->_cloudID, "copyWithZone:", a3);
    v15 = (void *)v5[5];
    v5[5] = v14;

    if (!v5[5])
    {
      -[_KSTextReplacementEntry uniqueID](self, "uniqueID");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v5[5];
      v5[5] = v16;

    }
  }
  return v5;
}

- (_KSTextReplacementEntry)initWithCoder:(id)a3
{
  id v4;
  _KSTextReplacementEntry *v5;
  uint64_t v6;
  NSString *phrase;
  uint64_t v8;
  NSString *shortcut;
  uint64_t v10;
  NSDate *timestamp;
  uint64_t v12;
  _KSTextReplacementEntry *priorValue;
  uint64_t v14;
  NSString *cloudID;
  uint64_t v16;
  NSString *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_KSTextReplacementEntry;
  v5 = -[_KSTextReplacementEntry init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phrase"));
    v6 = objc_claimAutoreleasedReturnValue();
    phrase = v5->_phrase;
    v5->_phrase = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcut"));
    v8 = objc_claimAutoreleasedReturnValue();
    shortcut = v5->_shortcut;
    v5->_shortcut = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v10 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priorValue"));
    v12 = objc_claimAutoreleasedReturnValue();
    priorValue = v5->_priorValue;
    v5->_priorValue = (_KSTextReplacementEntry *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudID"));
    v14 = objc_claimAutoreleasedReturnValue();
    cloudID = v5->_cloudID;
    v5->_cloudID = (NSString *)v14;

    if (!v5->_cloudID)
    {
      -[_KSTextReplacementEntry uniqueID](v5, "uniqueID");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v5->_cloudID;
      v5->_cloudID = (NSString *)v16;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *phrase;
  id v5;

  phrase = self->_phrase;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", phrase, CFSTR("phrase"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shortcut, CFSTR("shortcut"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_priorValue, CFSTR("priorValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cloudID, CFSTR("cloudID"));

}

- (id)uniqueRecordNameVer0
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_KSTextReplacementEntry shortcut](self, "shortcut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry phrase](self, "phrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)uniqueRecordName
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_KSTextReplacementEntry shortcut](self, "shortcut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry phrase](self, "phrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "illegalCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "controlCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)cloudID
{
  NSString *cloudID;
  NSString *v4;
  NSString *v5;

  cloudID = self->_cloudID;
  if (!cloudID)
  {
    -[_KSTextReplacementEntry uniqueID](self, "uniqueID");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cloudID;
    self->_cloudID = v4;

    cloudID = self->_cloudID;
  }
  return cloudID;
}

- (id)unEncryptedFields
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("timestamp");
  -[_KSTextReplacementEntry timestamp](self, "timestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)encryptedFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry shortcut](self, "shortcut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("shortcutE"));
  -[_KSTextReplacementEntry phrase](self, "phrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("phraseE"));

  return v3;
}

+ (id)localEntryFromCloudEntry:(id)a3
{
  id v3;
  _KSTextReplacementEntry *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = objc_alloc_init(_KSTextReplacementEntry);
  objc_msgSend(v3, "encryptedValuesByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("shortcutE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("shortcut"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  -[_KSTextReplacementEntry setShortcut:](v4, "setShortcut:", v7);

  objc_msgSend(v3, "encryptedValuesByKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("phraseE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v10, 4);
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("phrase"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  -[_KSTextReplacementEntry setPhrase:](v4, "setPhrase:", v11);

  objc_msgSend(v3, "objectForKey:", CFSTR("timestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry setTimestamp:](v4, "setTimestamp:", v13);

  objc_msgSend(v3, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recordName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry setCloudID:](v4, "setCloudID:", v15);

  -[_KSTextReplacementEntry shortcut](v4, "shortcut");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    -[_KSTextReplacementEntry setShortcut:](v4, "setShortcut:", &stru_24E206F98);
  -[_KSTextReplacementEntry phrase](v4, "phrase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    -[_KSTextReplacementEntry setPhrase:](v4, "setPhrase:", &stru_24E206F98);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeSystemFieldsWithCoder:", v18);
  objc_msgSend(v18, "finishEncoding");
  objc_msgSend(v18, "encodedData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry setCloudData:](v4, "setCloudData:", v20);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_KSTextReplacementEntry shortcut](self, "shortcut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry phrase](self, "phrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[_KSTextReplacementEntry shortcut](self, "shortcut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortcut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[_KSTextReplacementEntry phrase](self, "phrase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phrase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (_KSTextReplacementEntry)priorValue
{
  return self->_priorValue;
}

- (void)setPriorValue:(id)a3
{
  objc_storeStrong((id *)&self->_priorValue, a3);
}

- (NSData)cloudData
{
  return self->_cloudData;
}

- (BOOL)needsSaveToCloud
{
  return self->_needsSaveToCloud;
}

- (BOOL)wasDeleted
{
  return self->_wasDeleted;
}

@end
