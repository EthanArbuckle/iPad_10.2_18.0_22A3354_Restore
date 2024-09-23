@implementation IDSOffGridEncryptionProperties

- (IDSOffGridEncryptionProperties)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDSOffGridEncryptionProperties;
  return -[IDSOffGridEncryptionProperties init](&v3, sel_init);
}

- (IDSOffGridEncryptionProperties)initWithDictionary:(id)a3
{
  id v4;
  IDSOffGridEncryptionProperties *v5;
  uint64_t v6;
  NSNumber *ratchetCounter;
  uint64_t v8;
  NSData *encryptionKeyID;
  uint64_t v10;
  NSData *authTag;
  uint64_t v12;
  NSNumber *segmentNumber;
  uint64_t v14;
  NSNumber *totalSegments;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSOffGridEncryptionProperties;
  v5 = -[IDSOffGridEncryptionProperties init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rc"));
    v6 = objc_claimAutoreleasedReturnValue();
    ratchetCounter = v5->_ratchetCounter;
    v5->_ratchetCounter = (NSNumber *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("e-id"));
    v8 = objc_claimAutoreleasedReturnValue();
    encryptionKeyID = v5->_encryptionKeyID;
    v5->_encryptionKeyID = (NSData *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("at"));
    v10 = objc_claimAutoreleasedReturnValue();
    authTag = v5->_authTag;
    v5->_authTag = (NSData *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("segment-number"));
    v12 = objc_claimAutoreleasedReturnValue();
    segmentNumber = v5->_segmentNumber;
    v5->_segmentNumber = (NSNumber *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("segment-count"));
    v14 = objc_claimAutoreleasedReturnValue();
    totalSegments = v5->_totalSegments;
    v5->_totalSegments = (NSNumber *)v14;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSNumber *ratchetCounter;
  NSData *encryptionKeyID;
  NSData *authTag;
  NSNumber *segmentNumber;
  NSNumber *totalSegments;
  void *v10;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  ratchetCounter = self->_ratchetCounter;
  if (ratchetCounter)
    CFDictionarySetValue(v3, CFSTR("rc"), ratchetCounter);
  encryptionKeyID = self->_encryptionKeyID;
  if (encryptionKeyID)
    CFDictionarySetValue(v4, CFSTR("e-id"), encryptionKeyID);
  authTag = self->_authTag;
  if (authTag)
    CFDictionarySetValue(v4, CFSTR("at"), authTag);
  segmentNumber = self->_segmentNumber;
  if (segmentNumber)
    CFDictionarySetValue(v4, CFSTR("segment-number"), segmentNumber);
  totalSegments = self->_totalSegments;
  if (totalSegments)
    CFDictionarySetValue(v4, CFSTR("segment-count"), totalSegments);
  v10 = (void *)-[__CFDictionary copy](v4, "copy");

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[IDSOffGridEncryptionProperties segmentNumber](self, "segmentNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "segmentNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IDSOffGridEncryptionProperties dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDictionary:", v5);

  return v6;
}

- (NSData)authTag
{
  NSInteger v3;
  NSData *v4;

  v3 = -[NSNumber integerValue](self->_segmentNumber, "integerValue");
  if (v3 == -[NSNumber integerValue](self->_totalSegments, "integerValue"))
    v4 = self->_authTag;
  else
    v4 = 0;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridEncryptionProperties)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  IDSOffGridEncryptionProperties *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("e-id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("at"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("segment-number"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("segment-count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(IDSOffGridEncryptionProperties);
  -[IDSOffGridEncryptionProperties setRatchetCounter:](v10, "setRatchetCounter:", v5);
  -[IDSOffGridEncryptionProperties setEncryptionKeyID:](v10, "setEncryptionKeyID:", v6);
  -[IDSOffGridEncryptionProperties setAuthTag:](v10, "setAuthTag:", v7);
  -[IDSOffGridEncryptionProperties setSegmentNumber:](v10, "setSegmentNumber:", v8);
  -[IDSOffGridEncryptionProperties setTotalSegments:](v10, "setTotalSegments:", v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *ratchetCounter;
  id v5;

  ratchetCounter = self->_ratchetCounter;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", ratchetCounter, CFSTR("rc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptionKeyID, CFSTR("e-id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authTag, CFSTR("at"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_segmentNumber, CFSTR("segment-number"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalSegments, CFSTR("segment-count"));

}

- (NSNumber)ratchetCounter
{
  return self->_ratchetCounter;
}

- (void)setRatchetCounter:(id)a3
{
  objc_storeStrong((id *)&self->_ratchetCounter, a3);
}

- (NSData)encryptionKeyID
{
  return self->_encryptionKeyID;
}

- (void)setEncryptionKeyID:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionKeyID, a3);
}

- (void)setAuthTag:(id)a3
{
  objc_storeStrong((id *)&self->_authTag, a3);
}

- (NSNumber)segmentNumber
{
  return self->_segmentNumber;
}

- (void)setSegmentNumber:(id)a3
{
  objc_storeStrong((id *)&self->_segmentNumber, a3);
}

- (NSNumber)totalSegments
{
  return self->_totalSegments;
}

- (void)setTotalSegments:(id)a3
{
  objc_storeStrong((id *)&self->_totalSegments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalSegments, 0);
  objc_storeStrong((id *)&self->_segmentNumber, 0);
  objc_storeStrong((id *)&self->_authTag, 0);
  objc_storeStrong((id *)&self->_encryptionKeyID, 0);
  objc_storeStrong((id *)&self->_ratchetCounter, 0);
}

@end
