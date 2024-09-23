@implementation _INPBValueMetadata

- (void)setCanonicalValue:(id)a3
{
  NSString *v4;
  NSString *canonicalValue;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  canonicalValue = self->_canonicalValue;
  self->_canonicalValue = v4;

}

- (BOOL)hasCanonicalValue
{
  return self->_canonicalValue != 0;
}

- (void)setConfidenceScore:(id)a3
{
  objc_storeStrong((id *)&self->_confidenceScore, a3);
}

- (BOOL)hasConfidenceScore
{
  return self->_confidenceScore != 0;
}

- (void)setConfirmed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confirmed = a3;
}

- (BOOL)hasConfirmed
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConfirmed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setInput:(id)a3
{
  NSString *v4;
  NSString *input;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  input = self->_input;
  self->_input = v4;

}

- (BOOL)hasInput
{
  return self->_input != 0;
}

- (void)setRequiredEntitlements:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)requiredEntitlements
{
  return self->_requiredEntitlements.list;
}

- (void)clearRequiredEntitlements
{
  PBRepeatedInt32Clear();
}

- (void)addRequiredEntitlement:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)requiredEntitlementsCount
{
  return self->_requiredEntitlements.count;
}

- (int)requiredEntitlementAtIndex:(unint64_t)a3
{
  return self->_requiredEntitlements.list[a3];
}

- (id)requiredEntitlementsAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("CONTACTS");
  if (a3 == 2)
  {
    v3 = CFSTR("LOCATION");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRequiredEntitlements:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACTS")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setSource:(id)a3
{
  NSString *v4;
  NSString *source;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  source = self->_source;
  self->_source = v4;

}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (void)setSourceAppBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *sourceAppBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  sourceAppBundleIdentifier = self->_sourceAppBundleIdentifier;
  self->_sourceAppBundleIdentifier = v4;

}

- (BOOL)hasSourceAppBundleIdentifier
{
  return self->_sourceAppBundleIdentifier != 0;
}

- (void)setUuid:(id)a3
{
  NSString *v4;
  NSString *uuid;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  uuid = self->_uuid;
  self->_uuid = v4;

}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBValueMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[_INPBValueMetadata canonicalValue](self, "canonicalValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBValueMetadata confidenceScore](self, "confidenceScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBValueMetadata confidenceScore](self, "confidenceScore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBValueMetadata hasConfirmed](self, "hasConfirmed"))
    PBDataWriterWriteBOOLField();
  -[_INPBValueMetadata input](self, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  if (self->_requiredEntitlements.count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_requiredEntitlements.count);
  }
  -[_INPBValueMetadata source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  -[_INPBValueMetadata sourceAppBundleIdentifier](self, "sourceAppBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[_INPBValueMetadata uuid](self, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v13;
  if (v11)
  {
    PBDataWriterWriteStringField();
    v12 = v13;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBValueMetadata clearRequiredEntitlements](self, "clearRequiredEntitlements");
  v3.receiver = self;
  v3.super_class = (Class)_INPBValueMetadata;
  -[_INPBValueMetadata dealloc](&v3, sel_dealloc);
}

- (_INPBValueMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBValueMetadata *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBValueMetadata *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBValueMetadata *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBValueMetadata initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBValueMetadata data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBValueMetadata *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = -[_INPBValueMetadata init](+[_INPBValueMetadata allocWithZone:](_INPBValueMetadata, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_canonicalValue, "copyWithZone:", a3);
  -[_INPBValueMetadata setCanonicalValue:](v5, "setCanonicalValue:", v6);

  v7 = -[_INPBConfidenceScore copyWithZone:](self->_confidenceScore, "copyWithZone:", a3);
  -[_INPBValueMetadata setConfidenceScore:](v5, "setConfidenceScore:", v7);

  if (-[_INPBValueMetadata hasConfirmed](self, "hasConfirmed"))
    -[_INPBValueMetadata setConfirmed:](v5, "setConfirmed:", -[_INPBValueMetadata confirmed](self, "confirmed"));
  v8 = (void *)-[NSString copyWithZone:](self->_input, "copyWithZone:", a3);
  -[_INPBValueMetadata setInput:](v5, "setInput:", v8);

  PBRepeatedInt32Copy();
  v9 = (void *)-[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  -[_INPBValueMetadata setSource:](v5, "setSource:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_sourceAppBundleIdentifier, "copyWithZone:", a3);
  -[_INPBValueMetadata setSourceAppBundleIdentifier:](v5, "setSourceAppBundleIdentifier:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  -[_INPBValueMetadata setUuid:](v5, "setUuid:", v11);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int confirmed;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  BOOL v39;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[_INPBValueMetadata canonicalValue](self, "canonicalValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBValueMetadata canonicalValue](self, "canonicalValue");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBValueMetadata canonicalValue](self, "canonicalValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canonicalValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBValueMetadata confidenceScore](self, "confidenceScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "confidenceScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBValueMetadata confidenceScore](self, "confidenceScore");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBValueMetadata confidenceScore](self, "confidenceScore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "confidenceScore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_37;
  }
  else
  {

  }
  v17 = -[_INPBValueMetadata hasConfirmed](self, "hasConfirmed");
  if (v17 != objc_msgSend(v4, "hasConfirmed"))
    goto LABEL_37;
  if (-[_INPBValueMetadata hasConfirmed](self, "hasConfirmed"))
  {
    if (objc_msgSend(v4, "hasConfirmed"))
    {
      confirmed = self->_confirmed;
      if (confirmed != objc_msgSend(v4, "confirmed"))
        goto LABEL_37;
    }
  }
  -[_INPBValueMetadata input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBValueMetadata input](self, "input");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBValueMetadata input](self, "input");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_37;
  }
  else
  {

  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_37;
  -[_INPBValueMetadata source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBValueMetadata source](self, "source");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBValueMetadata source](self, "source");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBValueMetadata sourceAppBundleIdentifier](self, "sourceAppBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceAppBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_36;
  -[_INPBValueMetadata sourceAppBundleIdentifier](self, "sourceAppBundleIdentifier");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_INPBValueMetadata sourceAppBundleIdentifier](self, "sourceAppBundleIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceAppBundleIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_37;
  }
  else
  {

  }
  -[_INPBValueMetadata uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_36:

    goto LABEL_37;
  }
  -[_INPBValueMetadata uuid](self, "uuid");
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
  {

LABEL_40:
    v39 = 1;
    goto LABEL_38;
  }
  v35 = (void *)v34;
  -[_INPBValueMetadata uuid](self, "uuid");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v36, "isEqual:", v37);

  if ((v38 & 1) != 0)
    goto LABEL_40;
LABEL_37:
  v39 = 0;
LABEL_38:

  return v39;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_canonicalValue, "hash");
  v4 = -[_INPBConfidenceScore hash](self->_confidenceScore, "hash");
  if (-[_INPBValueMetadata hasConfirmed](self, "hasConfirmed"))
    v5 = 2654435761 * self->_confirmed;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_input, "hash");
  v7 = PBRepeatedInt32Hash();
  v8 = v7 ^ -[NSString hash](self->_source, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_sourceAppBundleIdentifier, "hash");
  return v9 ^ -[NSString hash](self->_uuid, "hash");
}

- (id)dictionaryRepresentation
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
  unint64_t v12;
  int v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_canonicalValue)
  {
    -[_INPBValueMetadata canonicalValue](self, "canonicalValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("canonicalValue"));

  }
  -[_INPBValueMetadata confidenceScore](self, "confidenceScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("confidenceScore"));

  if (-[_INPBValueMetadata hasConfirmed](self, "hasConfirmed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBValueMetadata confirmed](self, "confirmed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("confirmed"));

  }
  if (self->_input)
  {
    -[_INPBValueMetadata input](self, "input");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("input"));

  }
  if (self->_requiredEntitlements.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBValueMetadata requiredEntitlementsCount](self, "requiredEntitlementsCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBValueMetadata requiredEntitlementsCount](self, "requiredEntitlementsCount"))
    {
      v12 = 0;
      do
      {
        v13 = self->_requiredEntitlements.list[v12];
        if (v13 == 1)
        {
          v14 = CFSTR("CONTACTS");
        }
        else if (v13 == 2)
        {
          v14 = CFSTR("LOCATION");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requiredEntitlements.list[v12]);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "addObject:", v14);

        ++v12;
      }
      while (v12 < -[_INPBValueMetadata requiredEntitlementsCount](self, "requiredEntitlementsCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("requiredEntitlement"));

  }
  if (self->_source)
  {
    -[_INPBValueMetadata source](self, "source");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("source"));

  }
  if (self->_sourceAppBundleIdentifier)
  {
    -[_INPBValueMetadata sourceAppBundleIdentifier](self, "sourceAppBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("sourceAppBundleIdentifier"));

  }
  if (self->_uuid)
  {
    -[_INPBValueMetadata uuid](self, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("uuid"));

  }
  return v3;
}

- (NSString)canonicalValue
{
  return self->_canonicalValue;
}

- (_INPBConfidenceScore)confidenceScore
{
  return self->_confidenceScore;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (NSString)input
{
  return self->_input;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)sourceAppBundleIdentifier
{
  return self->_sourceAppBundleIdentifier;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_confidenceScore, 0);
  objc_storeStrong((id *)&self->_canonicalValue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
