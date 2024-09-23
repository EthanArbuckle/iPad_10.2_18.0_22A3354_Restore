@implementation NTPBVersionedPersonalizationVector

- (BOOL)hasPersonalizationVector
{
  return self->_personalizationVector != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasBundleSubscribedVector
{
  return self->_bundleSubscribedVector != 0;
}

- (BOOL)hasBundleSubscribedVectorVersion
{
  return self->_bundleSubscribedVectorVersion != 0;
}

- (BOOL)hasSportsUuidVector
{
  return self->_sportsUuidVector != 0;
}

- (BOOL)hasSportsFavoritesVector
{
  return self->_sportsFavoritesVector != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBVersionedPersonalizationVector;
  -[NTPBVersionedPersonalizationVector description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBVersionedPersonalizationVector dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *personalizationVector;
  NSString *version;
  NSData *bundleSubscribedVector;
  NSString *bundleSubscribedVectorVersion;
  NSData *sportsUuidVector;
  NSData *sportsFavoritesVector;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  personalizationVector = self->_personalizationVector;
  if (personalizationVector)
    objc_msgSend(v3, "setObject:forKey:", personalizationVector, CFSTR("personalization_vector"));
  version = self->_version;
  if (version)
    objc_msgSend(v4, "setObject:forKey:", version, CFSTR("version"));
  bundleSubscribedVector = self->_bundleSubscribedVector;
  if (bundleSubscribedVector)
    objc_msgSend(v4, "setObject:forKey:", bundleSubscribedVector, CFSTR("bundle_subscribed_vector"));
  bundleSubscribedVectorVersion = self->_bundleSubscribedVectorVersion;
  if (bundleSubscribedVectorVersion)
    objc_msgSend(v4, "setObject:forKey:", bundleSubscribedVectorVersion, CFSTR("bundle_subscribed_vector_version"));
  sportsUuidVector = self->_sportsUuidVector;
  if (sportsUuidVector)
    objc_msgSend(v4, "setObject:forKey:", sportsUuidVector, CFSTR("sports_uuid_vector"));
  sportsFavoritesVector = self->_sportsFavoritesVector;
  if (sportsFavoritesVector)
    objc_msgSend(v4, "setObject:forKey:", sportsFavoritesVector, CFSTR("sports_favorites_vector"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBVersionedPersonalizationVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_personalizationVector)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_version)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_bundleSubscribedVector)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_bundleSubscribedVectorVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sportsUuidVector)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_sportsFavoritesVector)
  {
    PBDataWriterWriteDataField();
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
  v6 = -[NSData copyWithZone:](self->_personalizationVector, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_version, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  v10 = -[NSData copyWithZone:](self->_bundleSubscribedVector, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_bundleSubscribedVectorVersion, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[NSData copyWithZone:](self->_sportsUuidVector, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSData copyWithZone:](self->_sportsFavoritesVector, "copyWithZone:", a3);
  v17 = (void *)v5[4];
  v5[4] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *personalizationVector;
  NSString *version;
  NSData *bundleSubscribedVector;
  NSString *bundleSubscribedVectorVersion;
  NSData *sportsUuidVector;
  NSData *sportsFavoritesVector;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((personalizationVector = self->_personalizationVector, !((unint64_t)personalizationVector | v4[3]))
     || -[NSData isEqual:](personalizationVector, "isEqual:"))
    && ((version = self->_version, !((unint64_t)version | v4[6]))
     || -[NSString isEqual:](version, "isEqual:"))
    && ((bundleSubscribedVector = self->_bundleSubscribedVector, !((unint64_t)bundleSubscribedVector | v4[1]))
     || -[NSData isEqual:](bundleSubscribedVector, "isEqual:"))
    && ((bundleSubscribedVectorVersion = self->_bundleSubscribedVectorVersion,
         !((unint64_t)bundleSubscribedVectorVersion | v4[2]))
     || -[NSString isEqual:](bundleSubscribedVectorVersion, "isEqual:"))
    && ((sportsUuidVector = self->_sportsUuidVector, !((unint64_t)sportsUuidVector | v4[5]))
     || -[NSData isEqual:](sportsUuidVector, "isEqual:")))
  {
    sportsFavoritesVector = self->_sportsFavoritesVector;
    if ((unint64_t)sportsFavoritesVector | v4[4])
      v11 = -[NSData isEqual:](sportsFavoritesVector, "isEqual:");
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
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSData hash](self->_personalizationVector, "hash");
  v4 = -[NSString hash](self->_version, "hash") ^ v3;
  v5 = -[NSData hash](self->_bundleSubscribedVector, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_bundleSubscribedVectorVersion, "hash");
  v7 = -[NSData hash](self->_sportsUuidVector, "hash");
  return v6 ^ v7 ^ -[NSData hash](self->_sportsFavoritesVector, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[NTPBVersionedPersonalizationVector setPersonalizationVector:](self, "setPersonalizationVector:");
  if (v4[6])
    -[NTPBVersionedPersonalizationVector setVersion:](self, "setVersion:");
  if (v4[1])
    -[NTPBVersionedPersonalizationVector setBundleSubscribedVector:](self, "setBundleSubscribedVector:");
  if (v4[2])
    -[NTPBVersionedPersonalizationVector setBundleSubscribedVectorVersion:](self, "setBundleSubscribedVectorVersion:");
  if (v4[5])
    -[NTPBVersionedPersonalizationVector setSportsUuidVector:](self, "setSportsUuidVector:");
  if (v4[4])
    -[NTPBVersionedPersonalizationVector setSportsFavoritesVector:](self, "setSportsFavoritesVector:");

}

- (NSData)personalizationVector
{
  return self->_personalizationVector;
}

- (void)setPersonalizationVector:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationVector, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSData)bundleSubscribedVector
{
  return self->_bundleSubscribedVector;
}

- (void)setBundleSubscribedVector:(id)a3
{
  objc_storeStrong((id *)&self->_bundleSubscribedVector, a3);
}

- (NSString)bundleSubscribedVectorVersion
{
  return self->_bundleSubscribedVectorVersion;
}

- (void)setBundleSubscribedVectorVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bundleSubscribedVectorVersion, a3);
}

- (NSData)sportsUuidVector
{
  return self->_sportsUuidVector;
}

- (void)setSportsUuidVector:(id)a3
{
  objc_storeStrong((id *)&self->_sportsUuidVector, a3);
}

- (NSData)sportsFavoritesVector
{
  return self->_sportsFavoritesVector;
}

- (void)setSportsFavoritesVector:(id)a3
{
  objc_storeStrong((id *)&self->_sportsFavoritesVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_sportsUuidVector, 0);
  objc_storeStrong((id *)&self->_sportsFavoritesVector, 0);
  objc_storeStrong((id *)&self->_personalizationVector, 0);
  objc_storeStrong((id *)&self->_bundleSubscribedVectorVersion, 0);
  objc_storeStrong((id *)&self->_bundleSubscribedVector, 0);
}

@end
