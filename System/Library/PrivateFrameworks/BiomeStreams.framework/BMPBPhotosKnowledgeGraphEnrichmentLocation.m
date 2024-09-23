@implementation BMPBPhotosKnowledgeGraphEnrichmentLocation

- (BOOL)hasStreet
{
  return self->_street != 0;
}

- (BOOL)hasCity
{
  return self->_city != 0;
}

- (BOOL)hasState
{
  return self->_state != 0;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (BOOL)hasEncodedLocation
{
  return self->_encodedLocation != 0;
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
  v8.super_class = (Class)BMPBPhotosKnowledgeGraphEnrichmentLocation;
  -[BMPBPhotosKnowledgeGraphEnrichmentLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBPhotosKnowledgeGraphEnrichmentLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *street;
  NSString *city;
  NSString *state;
  NSString *country;
  NSData *encodedLocation;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  street = self->_street;
  if (street)
    objc_msgSend(v3, "setObject:forKey:", street, CFSTR("street"));
  city = self->_city;
  if (city)
    objc_msgSend(v4, "setObject:forKey:", city, CFSTR("city"));
  state = self->_state;
  if (state)
    objc_msgSend(v4, "setObject:forKey:", state, CFSTR("state"));
  country = self->_country;
  if (country)
    objc_msgSend(v4, "setObject:forKey:", country, CFSTR("country"));
  encodedLocation = self->_encodedLocation;
  if (encodedLocation)
    objc_msgSend(v4, "setObject:forKey:", encodedLocation, CFSTR("encodedLocation"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBPhotosKnowledgeGraphEnrichmentLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_street)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_city)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_state)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_encodedLocation)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_street)
  {
    objc_msgSend(v4, "setStreet:");
    v4 = v5;
  }
  if (self->_city)
  {
    objc_msgSend(v5, "setCity:");
    v4 = v5;
  }
  if (self->_state)
  {
    objc_msgSend(v5, "setState:");
    v4 = v5;
  }
  if (self->_country)
  {
    objc_msgSend(v5, "setCountry:");
    v4 = v5;
  }
  if (self->_encodedLocation)
  {
    objc_msgSend(v5, "setEncodedLocation:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_street, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[NSString copyWithZone:](self->_city, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_state, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSString copyWithZone:](self->_country, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[NSData copyWithZone:](self->_encodedLocation, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *street;
  NSString *city;
  NSString *state;
  NSString *country;
  NSData *encodedLocation;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((street = self->_street, !((unint64_t)street | v4[5]))
     || -[NSString isEqual:](street, "isEqual:"))
    && ((city = self->_city, !((unint64_t)city | v4[1])) || -[NSString isEqual:](city, "isEqual:"))
    && ((state = self->_state, !((unint64_t)state | v4[4]))
     || -[NSString isEqual:](state, "isEqual:"))
    && ((country = self->_country, !((unint64_t)country | v4[2]))
     || -[NSString isEqual:](country, "isEqual:")))
  {
    encodedLocation = self->_encodedLocation;
    if ((unint64_t)encodedLocation | v4[3])
      v10 = -[NSData isEqual:](encodedLocation, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_street, "hash");
  v4 = -[NSString hash](self->_city, "hash") ^ v3;
  v5 = -[NSString hash](self->_state, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_country, "hash");
  return v6 ^ -[NSData hash](self->_encodedLocation, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[5])
    -[BMPBPhotosKnowledgeGraphEnrichmentLocation setStreet:](self, "setStreet:");
  if (v4[1])
    -[BMPBPhotosKnowledgeGraphEnrichmentLocation setCity:](self, "setCity:");
  if (v4[4])
    -[BMPBPhotosKnowledgeGraphEnrichmentLocation setState:](self, "setState:");
  if (v4[2])
    -[BMPBPhotosKnowledgeGraphEnrichmentLocation setCountry:](self, "setCountry:");
  if (v4[3])
    -[BMPBPhotosKnowledgeGraphEnrichmentLocation setEncodedLocation:](self, "setEncodedLocation:");

}

- (NSString)street
{
  return self->_street;
}

- (void)setStreet:(id)a3
{
  objc_storeStrong((id *)&self->_street, a3);
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_storeStrong((id *)&self->_city, a3);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_storeStrong((id *)&self->_country, a3);
}

- (NSData)encodedLocation
{
  return self->_encodedLocation;
}

- (void)setEncodedLocation:(id)a3
{
  objc_storeStrong((id *)&self->_encodedLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_encodedLocation, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_city, 0);
}

@end
