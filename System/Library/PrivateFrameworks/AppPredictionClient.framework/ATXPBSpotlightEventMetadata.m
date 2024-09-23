@implementation ATXPBSpotlightEventMetadata

- (BOOL)hasQueryAtEngagement
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (uint64_t)setDidSearchDuringSession:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 44) |= 2u;
    *(_BYTE *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasDidSearchDuringSession:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 44) = *(_BYTE *)(result + 44) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasDidSearchDuringSession
{
  if (result)
    return (*(unsigned __int8 *)(result + 44) >> 1) & 1;
  return result;
}

- (BOOL)hasSearchEngagedBundleId
{
  if (result)
    return *(_QWORD *)(result + 32) != 0;
  return result;
}

- (uint64_t)setSearchEngagedActionType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 44) |= 1u;
    *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasSearchEngagedActionType:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 44) = *(_BYTE *)(result + 44) & 0xFE | a2;
  return result;
}

- (uint64_t)hasSearchEngagedActionType
{
  if (result)
    return *(_BYTE *)(result + 44) & 1;
  return result;
}

- (BOOL)hasEngagedAppString
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
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
  v8.super_class = (Class)ATXPBSpotlightEventMetadata;
  -[ATXPBSpotlightEventMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBSpotlightEventMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *queryAtEngagement;
  void *v6;
  NSString *searchEngagedBundleId;
  void *v8;
  NSString *engagedAppString;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  queryAtEngagement = self->_queryAtEngagement;
  if (queryAtEngagement)
    objc_msgSend(v3, "setObject:forKey:", queryAtEngagement, CFSTR("queryAtEngagement"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSearchDuringSession);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("didSearchDuringSession"));

  }
  searchEngagedBundleId = self->_searchEngagedBundleId;
  if (searchEngagedBundleId)
    objc_msgSend(v4, "setObject:forKey:", searchEngagedBundleId, CFSTR("searchEngagedBundleId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_searchEngagedActionType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("searchEngagedActionType"));

  }
  engagedAppString = self->_engagedAppString;
  if (engagedAppString)
    objc_msgSend(v4, "setObject:forKey:", engagedAppString, CFSTR("engagedAppString"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSpotlightEventMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_queryAtEngagement)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_searchEngagedBundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_engagedAppString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (v4)
    {
      -[ATXPBSpotlightEventMetadata setQueryAtEngagement:]((uint64_t)v3, v4);
      v3 = v7;
    }
    if ((*(_BYTE *)(a1 + 44) & 2) != 0)
    {
      *((_BYTE *)v3 + 40) = *(_BYTE *)(a1 + 40);
      *((_BYTE *)v3 + 44) |= 2u;
    }
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      -[ATXPBSpotlightEventMetadata setSearchEngagedBundleId:]((uint64_t)v7, v5);
      v3 = v7;
    }
    if ((*(_BYTE *)(a1 + 44) & 1) != 0)
    {
      *((_QWORD *)v3 + 1) = *(_QWORD *)(a1 + 8);
      *((_BYTE *)v3 + 44) |= 1u;
    }
    v6 = *(void **)(a1 + 16);
    if (v6)
    {
      -[ATXPBSpotlightEventMetadata setEngagedAppString:]((uint64_t)v7, v6);
      v3 = v7;
    }
  }

}

- (void)setQueryAtEngagement:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setSearchEngagedBundleId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setEngagedAppString:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
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
  v6 = -[NSString copyWithZone:](self->_queryAtEngagement, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_didSearchDuringSession;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_searchEngagedBundleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_searchEngagedActionType;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_engagedAppString, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *queryAtEngagement;
  char has;
  NSString *searchEngagedBundleId;
  NSString *engagedAppString;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  queryAtEngagement = self->_queryAtEngagement;
  if ((unint64_t)queryAtEngagement | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](queryAtEngagement, "isEqual:"))
      goto LABEL_22;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0)
      goto LABEL_22;
    if (self->_didSearchDuringSession)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_22;
  }
  searchEngagedBundleId = self->_searchEngagedBundleId;
  if (!((unint64_t)searchEngagedBundleId | *((_QWORD *)v4 + 4)))
    goto LABEL_15;
  if (!-[NSString isEqual:](searchEngagedBundleId, "isEqual:"))
  {
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
  has = (char)self->_has;
LABEL_15:
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_searchEngagedActionType != *((_QWORD *)v4 + 1))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_22;
  }
  engagedAppString = self->_engagedAppString;
  if ((unint64_t)engagedAppString | *((_QWORD *)v4 + 2))
    v9 = -[NSString isEqual:](engagedAppString, "isEqual:");
  else
    v9 = 1;
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_queryAtEngagement, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_didSearchDuringSession;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_searchEngagedBundleId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761u * self->_searchEngagedActionType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_engagedAppString, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)v3[3];
    v7 = v3;
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 24), v4);
      v3 = v7;
    }
    if ((*((_BYTE *)v3 + 44) & 2) != 0)
    {
      *(_BYTE *)(a1 + 40) = *((_BYTE *)v3 + 40);
      *(_BYTE *)(a1 + 44) |= 2u;
    }
    v5 = (void *)v3[4];
    if (v5)
    {
      objc_storeStrong((id *)(a1 + 32), v5);
      v3 = v7;
    }
    if ((*((_BYTE *)v3 + 44) & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = v3[1];
      *(_BYTE *)(a1 + 44) |= 1u;
    }
    v6 = (void *)v3[2];
    if (v6)
    {
      objc_storeStrong((id *)(a1 + 16), v6);
      v3 = v7;
    }
  }

}

- (uint64_t)queryAtEngagement
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (BOOL)didSearchDuringSession
{
  if (result)
    return *(_BYTE *)(result + 40) != 0;
  return result;
}

- (uint64_t)searchEngagedBundleId
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (uint64_t)searchEngagedActionType
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)engagedAppString
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchEngagedBundleId, 0);
  objc_storeStrong((id *)&self->_queryAtEngagement, 0);
  objc_storeStrong((id *)&self->_engagedAppString, 0);
}

@end
