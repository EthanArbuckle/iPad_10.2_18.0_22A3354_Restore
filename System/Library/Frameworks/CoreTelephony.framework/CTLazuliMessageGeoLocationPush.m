@implementation CTLazuliMessageGeoLocationPush

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliMessageGeoLocationPush coordinates](self, "coordinates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", coordinates = %@"), v4);

  -[CTLazuliMessageGeoLocationPush additionalDescription](self, "additionalDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", additionalDescription = %@"), v5);

  -[CTLazuliMessageGeoLocationPush chipList](self, "chipList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", chipList = %@"), v6);

  -[CTLazuliMessageGeoLocationPush metaData](self, "metaData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", metaData = %@"), v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliMessageGeoLocationPush:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a3;
  -[CTLazuliMessageGeoLocationPush coordinates](self, "coordinates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToCTLazuliLocationCoordinates:", v7))
  {
    v9 = 0;
    goto LABEL_27;
  }
  -[CTLazuliMessageGeoLocationPush additionalDescription](self, "additionalDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v5, "additionalDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v20 = 0;
      v21 = 0;
      goto LABEL_9;
    }
  }
  -[CTLazuliMessageGeoLocationPush additionalDescription](self, "additionalDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionalDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqualToString:") & 1) != 0)
  {
    v21 = 1;
LABEL_9:
    -[CTLazuliMessageGeoLocationPush chipList](self, "chipList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(v5, "chipList"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliMessageGeoLocationPush chipList](self, "chipList");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chipList");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v22, "isEqualToCTLazuliChatBotSuggestedChipList:", v3))
      {
        v9 = 0;
        goto LABEL_19;
      }
      v19 = 1;
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
    -[CTLazuliMessageGeoLocationPush metaData](self, "metaData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v5, "metaData"), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CTLazuliMessageGeoLocationPush metaData](self, "metaData", v16, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "metaData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "isEqualToCTLazuliCustomMetaData:", v13);

      if (v11)
      {

        if (!v19)
        {
LABEL_20:
          if (!v10)

          if (v21)
          {

          }
          goto LABEL_24;
        }
LABEL_19:

        goto LABEL_20;
      }
      v15 = v17;
    }
    else
    {
      v15 = 0;
      v9 = 1;
    }

    if ((v19 & 1) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }

  v9 = 0;
LABEL_24:
  if (!v8)

LABEL_27:
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliMessageGeoLocationPush *v4;
  CTLazuliMessageGeoLocationPush *v5;
  BOOL v6;

  v4 = (CTLazuliMessageGeoLocationPush *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliMessageGeoLocationPush isEqualToCTLazuliMessageGeoLocationPush:](self, "isEqualToCTLazuliMessageGeoLocationPush:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliMessageGeoLocationPush *v4;

  v4 = +[CTLazuliMessageGeoLocationPush allocWithZone:](CTLazuliMessageGeoLocationPush, "allocWithZone:", a3);
  -[CTLazuliMessageGeoLocationPush setCoordinates:](v4, "setCoordinates:", self->_coordinates);
  -[CTLazuliMessageGeoLocationPush setAdditionalDescription:](v4, "setAdditionalDescription:", self->_additionalDescription);
  -[CTLazuliMessageGeoLocationPush setChipList:](v4, "setChipList:", self->_chipList);
  -[CTLazuliMessageGeoLocationPush setMetaData:](v4, "setMetaData:", self->_metaData);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_coordinates, CFSTR("kCoordinatesKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_additionalDescription, CFSTR("kAdditionalDescriptionKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_chipList, CFSTR("kChipListKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metaData, CFSTR("kMetaDataKey"));

}

- (CTLazuliMessageGeoLocationPush)initWithCoder:(id)a3
{
  id v4;
  CTLazuliMessageGeoLocationPush *v5;
  uint64_t v6;
  CTLazuliLocationCoordinates *coordinates;
  uint64_t v8;
  NSString *additionalDescription;
  uint64_t v10;
  CTLazuliChatBotSuggestedChipList *chipList;
  uint64_t v12;
  CTLazuliCustomMetaData *metaData;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliMessageGeoLocationPush;
  v5 = -[CTLazuliMessageGeoLocationPush init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoordinatesKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    coordinates = v5->_coordinates;
    v5->_coordinates = (CTLazuliLocationCoordinates *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAdditionalDescriptionKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    additionalDescription = v5->_additionalDescription;
    v5->_additionalDescription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kChipListKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMetaDataKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v12;

  }
  return v5;
}

- (CTLazuliMessageGeoLocationPush)initWithReflection:(const void *)a3
{
  CTLazuliMessageGeoLocationPush *v4;
  CTLazuliLocationCoordinates *v5;
  CTLazuliLocationCoordinates *coordinates;
  char *v7;
  uint64_t v8;
  NSString *additionalDescription;
  CTLazuliChatBotSuggestedChipList *v10;
  uint64_t v11;
  CTLazuliChatBotSuggestedChipList *chipList;
  CTLazuliCustomMetaData *v13;
  uint64_t v14;
  CTLazuliCustomMetaData *metaData;
  CTLazuliMessageGeoLocationPush *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CTLazuliMessageGeoLocationPush;
  v4 = -[CTLazuliMessageGeoLocationPush init](&v17, sel_init);
  if (!v4)
    return v4;
  v5 = -[CTLazuliLocationCoordinates initWithReflection:]([CTLazuliLocationCoordinates alloc], "initWithReflection:", a3);
  coordinates = v4->_coordinates;
  v4->_coordinates = v5;

  if (*((_BYTE *)a3 + 40))
  {
    if (*((char *)a3 + 39) >= 0)
      v7 = (char *)a3 + 16;
    else
      v7 = (char *)*((_QWORD *)a3 + 2);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    additionalDescription = v4->_additionalDescription;
    v4->_additionalDescription = (NSString *)v8;
  }
  else
  {
    additionalDescription = v4->_additionalDescription;
    v4->_additionalDescription = 0;
  }

  if (*((_BYTE *)a3 + 72))
  {
    v10 = [CTLazuliChatBotSuggestedChipList alloc];
    if (!*((_BYTE *)a3 + 72))
      goto LABEL_18;
    v11 = -[CTLazuliChatBotSuggestedChipList initWithReflection:](v10, "initWithReflection:", (char *)a3 + 48);
    chipList = v4->_chipList;
    v4->_chipList = (CTLazuliChatBotSuggestedChipList *)v11;
  }
  else
  {
    chipList = v4->_chipList;
    v4->_chipList = 0;
  }

  if (!*((_BYTE *)a3 + 104))
  {
    metaData = v4->_metaData;
    v4->_metaData = 0;
    goto LABEL_16;
  }
  v13 = [CTLazuliCustomMetaData alloc];
  if (*((_BYTE *)a3 + 104))
  {
    v14 = -[CTLazuliCustomMetaData initWithReflection:](v13, "initWithReflection:", (char *)a3 + 80);
    metaData = v4->_metaData;
    v4->_metaData = (CTLazuliCustomMetaData *)v14;
LABEL_16:

    return v4;
  }
LABEL_18:
  result = (CTLazuliMessageGeoLocationPush *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliLocationCoordinates)coordinates
{
  return self->_coordinates;
}

- (void)setCoordinates:(id)a3
{
  objc_storeStrong((id *)&self->_coordinates, a3);
}

- (NSString)additionalDescription
{
  return self->_additionalDescription;
}

- (void)setAdditionalDescription:(id)a3
{
  objc_storeStrong((id *)&self->_additionalDescription, a3);
}

- (CTLazuliChatBotSuggestedChipList)chipList
{
  return self->_chipList;
}

- (void)setChipList:(id)a3
{
  objc_storeStrong((id *)&self->_chipList, a3);
}

- (CTLazuliCustomMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_chipList, 0);
  objc_storeStrong((id *)&self->_additionalDescription, 0);
  objc_storeStrong((id *)&self->_coordinates, 0);
}

@end
