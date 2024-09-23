@implementation HDCodableClinicalContact

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasNameContactIdentifier
{
  return self->_nameContactIdentifier != 0;
}

- (BOOL)hasPhoneNumber
{
  return self->_phoneNumber != 0;
}

- (BOOL)hasPhoneNumberContactIdentifier
{
  return self->_phoneNumberContactIdentifier != 0;
}

- (BOOL)hasPhoneNumberLabel
{
  return self->_phoneNumberLabel != 0;
}

- (BOOL)hasRelationship
{
  return self->_relationship != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableClinicalContact;
  -[HDCodableClinicalContact description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableClinicalContact dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *nameContactIdentifier;
  NSString *phoneNumber;
  NSString *phoneNumberContactIdentifier;
  NSString *phoneNumberLabel;
  NSString *relationship;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  nameContactIdentifier = self->_nameContactIdentifier;
  if (nameContactIdentifier)
    objc_msgSend(v4, "setObject:forKey:", nameContactIdentifier, CFSTR("nameContactIdentifier"));
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
    objc_msgSend(v4, "setObject:forKey:", phoneNumber, CFSTR("phoneNumber"));
  phoneNumberContactIdentifier = self->_phoneNumberContactIdentifier;
  if (phoneNumberContactIdentifier)
    objc_msgSend(v4, "setObject:forKey:", phoneNumberContactIdentifier, CFSTR("phoneNumberContactIdentifier"));
  phoneNumberLabel = self->_phoneNumberLabel;
  if (phoneNumberLabel)
    objc_msgSend(v4, "setObject:forKey:", phoneNumberLabel, CFSTR("phoneNumberLabel"));
  relationship = self->_relationship;
  if (relationship)
    objc_msgSend(v4, "setObject:forKey:", relationship, CFSTR("relationship"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableClinicalContactReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_nameContactIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_phoneNumber)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_phoneNumberContactIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_phoneNumberLabel)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_relationship)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v5;
  }
  if (self->_nameContactIdentifier)
  {
    objc_msgSend(v5, "setNameContactIdentifier:");
    v4 = v5;
  }
  if (self->_phoneNumber)
  {
    objc_msgSend(v5, "setPhoneNumber:");
    v4 = v5;
  }
  if (self->_phoneNumberContactIdentifier)
  {
    objc_msgSend(v5, "setPhoneNumberContactIdentifier:");
    v4 = v5;
  }
  if (self->_phoneNumberLabel)
  {
    objc_msgSend(v5, "setPhoneNumberLabel:");
    v4 = v5;
  }
  if (self->_relationship)
  {
    objc_msgSend(v5, "setRelationship:");
    v4 = v5;
  }

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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_nameContactIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_phoneNumber, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_phoneNumberContactIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_phoneNumberLabel, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSString copyWithZone:](self->_relationship, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  NSString *nameContactIdentifier;
  NSString *phoneNumber;
  NSString *phoneNumberContactIdentifier;
  NSString *phoneNumberLabel;
  NSString *relationship;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((name = self->_name, !((unint64_t)name | v4[1])) || -[NSString isEqual:](name, "isEqual:"))
    && ((nameContactIdentifier = self->_nameContactIdentifier, !((unint64_t)nameContactIdentifier | v4[2]))
     || -[NSString isEqual:](nameContactIdentifier, "isEqual:"))
    && ((phoneNumber = self->_phoneNumber, !((unint64_t)phoneNumber | v4[3]))
     || -[NSString isEqual:](phoneNumber, "isEqual:"))
    && ((phoneNumberContactIdentifier = self->_phoneNumberContactIdentifier,
         !((unint64_t)phoneNumberContactIdentifier | v4[4]))
     || -[NSString isEqual:](phoneNumberContactIdentifier, "isEqual:"))
    && ((phoneNumberLabel = self->_phoneNumberLabel, !((unint64_t)phoneNumberLabel | v4[5]))
     || -[NSString isEqual:](phoneNumberLabel, "isEqual:")))
  {
    relationship = self->_relationship;
    if ((unint64_t)relationship | v4[6])
      v11 = -[NSString isEqual:](relationship, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_nameContactIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_phoneNumber, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_phoneNumberContactIdentifier, "hash");
  v7 = -[NSString hash](self->_phoneNumberLabel, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_relationship, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[HDCodableClinicalContact setName:](self, "setName:");
  if (v4[2])
    -[HDCodableClinicalContact setNameContactIdentifier:](self, "setNameContactIdentifier:");
  if (v4[3])
    -[HDCodableClinicalContact setPhoneNumber:](self, "setPhoneNumber:");
  if (v4[4])
    -[HDCodableClinicalContact setPhoneNumberContactIdentifier:](self, "setPhoneNumberContactIdentifier:");
  if (v4[5])
    -[HDCodableClinicalContact setPhoneNumberLabel:](self, "setPhoneNumberLabel:");
  if (v4[6])
    -[HDCodableClinicalContact setRelationship:](self, "setRelationship:");

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)nameContactIdentifier
{
  return self->_nameContactIdentifier;
}

- (void)setNameContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_nameContactIdentifier, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)phoneNumberContactIdentifier
{
  return self->_phoneNumberContactIdentifier;
}

- (void)setPhoneNumberContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumberContactIdentifier, a3);
}

- (NSString)phoneNumberLabel
{
  return self->_phoneNumberLabel;
}

- (void)setPhoneNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumberLabel, a3);
}

- (NSString)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(id)a3
{
  objc_storeStrong((id *)&self->_relationship, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_phoneNumberLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumberContactIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_nameContactIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
