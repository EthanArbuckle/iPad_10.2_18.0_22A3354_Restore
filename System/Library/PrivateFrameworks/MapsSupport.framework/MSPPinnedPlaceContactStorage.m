@implementation MSPPinnedPlaceContactStorage

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (BOOL)hasLabeledValueIdentifier
{
  return self->_labeledValueIdentifier != 0;
}

- (BOOL)hasHandleValue
{
  return self->_handleValue != 0;
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
  v8.super_class = (Class)MSPPinnedPlaceContactStorage;
  -[MSPPinnedPlaceContactStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPPinnedPlaceContactStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *contactIdentifier;
  NSString *labeledValueIdentifier;
  NSString *handleValue;
  PBUnknownFields *unknownFields;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier)
    objc_msgSend(v3, "setObject:forKey:", contactIdentifier, CFSTR("contactIdentifier"));
  labeledValueIdentifier = self->_labeledValueIdentifier;
  if (labeledValueIdentifier)
    objc_msgSend(v4, "setObject:forKey:", labeledValueIdentifier, CFSTR("labeledValueIdentifier"));
  handleValue = self->_handleValue;
  if (handleValue)
    objc_msgSend(v4, "setObject:forKey:", handleValue, CFSTR("handleValue"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPPinnedPlaceContactStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_contactIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_labeledValueIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_handleValue)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_contactIdentifier)
  {
    objc_msgSend(v4, "setContactIdentifier:");
    v4 = v5;
  }
  if (self->_labeledValueIdentifier)
  {
    objc_msgSend(v5, "setLabeledValueIdentifier:");
    v4 = v5;
  }
  if (self->_handleValue)
  {
    objc_msgSend(v5, "setHandleValue:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_contactIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_labeledValueIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_handleValue, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *contactIdentifier;
  NSString *labeledValueIdentifier;
  NSString *handleValue;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((contactIdentifier = self->_contactIdentifier, !((unint64_t)contactIdentifier | v4[2]))
     || -[NSString isEqual:](contactIdentifier, "isEqual:"))
    && ((labeledValueIdentifier = self->_labeledValueIdentifier, !((unint64_t)labeledValueIdentifier | v4[4]))
     || -[NSString isEqual:](labeledValueIdentifier, "isEqual:")))
  {
    handleValue = self->_handleValue;
    if ((unint64_t)handleValue | v4[3])
      v8 = -[NSString isEqual:](handleValue, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_contactIdentifier, "hash");
  v4 = -[NSString hash](self->_labeledValueIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_handleValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[MSPPinnedPlaceContactStorage setContactIdentifier:](self, "setContactIdentifier:");
  if (v4[4])
    -[MSPPinnedPlaceContactStorage setLabeledValueIdentifier:](self, "setLabeledValueIdentifier:");
  if (v4[3])
    -[MSPPinnedPlaceContactStorage setHandleValue:](self, "setHandleValue:");

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
}

- (NSString)labeledValueIdentifier
{
  return self->_labeledValueIdentifier;
}

- (void)setLabeledValueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_labeledValueIdentifier, a3);
}

- (NSString)handleValue
{
  return self->_handleValue;
}

- (void)setHandleValue:(id)a3
{
  objc_storeStrong((id *)&self->_handleValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeledValueIdentifier, 0);
  objc_storeStrong((id *)&self->_handleValue, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
