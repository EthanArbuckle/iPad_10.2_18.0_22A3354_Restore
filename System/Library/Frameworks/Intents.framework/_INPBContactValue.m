@implementation _INPBContactValue

- (void)setAliases:(id)a3
{
  NSArray *v4;
  NSArray *aliases;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  aliases = self->_aliases;
  self->_aliases = v4;

}

- (void)clearAliases
{
  -[NSArray removeAllObjects](self->_aliases, "removeAllObjects");
}

- (void)addAliases:(id)a3
{
  id v4;
  NSArray *aliases;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  aliases = self->_aliases;
  v8 = v4;
  if (!aliases)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_aliases;
    self->_aliases = v6;

    v4 = v8;
    aliases = self->_aliases;
  }
  -[NSArray addObject:](aliases, "addObject:", v4);

}

- (unint64_t)aliasesCount
{
  return -[NSArray count](self->_aliases, "count");
}

- (id)aliasesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_aliases, "objectAtIndexedSubscript:", a3);
}

- (void)setContactHandle:(id)a3
{
  objc_storeStrong((id *)&self->_contactHandle, a3);
}

- (BOOL)hasContactHandle
{
  return self->_contactHandle != 0;
}

- (void)setCustomIdentifier:(id)a3
{
  NSString *v4;
  NSString *customIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  customIdentifier = self->_customIdentifier;
  self->_customIdentifier = v4;

}

- (BOOL)hasCustomIdentifier
{
  return self->_customIdentifier != 0;
}

- (void)setFirstName:(id)a3
{
  NSString *v4;
  NSString *firstName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  firstName = self->_firstName;
  self->_firstName = v4;

}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (void)setFullName:(id)a3
{
  NSString *v4;
  NSString *fullName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  fullName = self->_fullName;
  self->_fullName = v4;

}

- (BOOL)hasFullName
{
  return self->_fullName != 0;
}

- (void)setHandle:(id)a3
{
  NSString *v4;
  NSString *handle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  handle = self->_handle;
  self->_handle = v4;

}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (void)setIsContactSuggestion:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isContactSuggestion = a3;
}

- (BOOL)hasIsContactSuggestion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsContactSuggestion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setIsMe:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isMe = a3;
}

- (BOOL)hasIsMe
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasIsMe:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setLastName:(id)a3
{
  NSString *v4;
  NSString *lastName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  lastName = self->_lastName;
  self->_lastName = v4;

}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (void)setMiddleName:(id)a3
{
  NSString *v4;
  NSString *middleName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  middleName = self->_middleName;
  self->_middleName = v4;

}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (void)setNamePrefix:(id)a3
{
  NSString *v4;
  NSString *namePrefix;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  namePrefix = self->_namePrefix;
  self->_namePrefix = v4;

}

- (BOOL)hasNamePrefix
{
  return self->_namePrefix != 0;
}

- (void)setNameSuffix:(id)a3
{
  NSString *v4;
  NSString *nameSuffix;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  nameSuffix = self->_nameSuffix;
  self->_nameSuffix = v4;

}

- (BOOL)hasNameSuffix
{
  return self->_nameSuffix != 0;
}

- (void)setNickName:(id)a3
{
  NSString *v4;
  NSString *nickName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  nickName = self->_nickName;
  self->_nickName = v4;

}

- (BOOL)hasNickName
{
  return self->_nickName != 0;
}

- (void)setPhonemeData:(id)a3
{
  NSString *v4;
  NSString *phonemeData;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phonemeData = self->_phonemeData;
  self->_phonemeData = v4;

}

- (BOOL)hasPhonemeData
{
  return self->_phonemeData != 0;
}

- (void)setPhoneticFirstName:(id)a3
{
  NSString *v4;
  NSString *phoneticFirstName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneticFirstName = self->_phoneticFirstName;
  self->_phoneticFirstName = v4;

}

- (BOOL)hasPhoneticFirstName
{
  return self->_phoneticFirstName != 0;
}

- (void)setPhoneticLastName:(id)a3
{
  NSString *v4;
  NSString *phoneticLastName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneticLastName = self->_phoneticLastName;
  self->_phoneticLastName = v4;

}

- (BOOL)hasPhoneticLastName
{
  return self->_phoneticLastName != 0;
}

- (void)setPhoneticMiddleName:(id)a3
{
  NSString *v4;
  NSString *phoneticMiddleName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneticMiddleName = self->_phoneticMiddleName;
  self->_phoneticMiddleName = v4;

}

- (BOOL)hasPhoneticMiddleName
{
  return self->_phoneticMiddleName != 0;
}

- (void)setPhoneticNamePrefix:(id)a3
{
  NSString *v4;
  NSString *phoneticNamePrefix;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneticNamePrefix = self->_phoneticNamePrefix;
  self->_phoneticNamePrefix = v4;

}

- (BOOL)hasPhoneticNamePrefix
{
  return self->_phoneticNamePrefix != 0;
}

- (void)setPhoneticNameSuffix:(id)a3
{
  NSString *v4;
  NSString *phoneticNameSuffix;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneticNameSuffix = self->_phoneticNameSuffix;
  self->_phoneticNameSuffix = v4;

}

- (BOOL)hasPhoneticNameSuffix
{
  return self->_phoneticNameSuffix != 0;
}

- (void)setRelationship:(id)a3
{
  NSString *v4;
  NSString *relationship;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  relationship = self->_relationship;
  self->_relationship = v4;

}

- (BOOL)hasRelationship
{
  return self->_relationship != 0;
}

- (void)setSearchProvider:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_searchProvider = a3;
  }
}

- (BOOL)hasSearchProvider
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSearchProvider:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)searchProviderAsString:(int)a3
{
  if (a3 < 4)
    return off_1E228B8E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSearchProvider:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLUS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SRR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SuggestedStore")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSuggestionType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xF7;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 8;
    self->_suggestionType = a3;
  }
}

- (BOOL)hasSuggestionType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasSuggestionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)suggestionTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E228B908[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSuggestionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SocialProfile")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("InstantMessageAddress")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setValueMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_valueMetadata, a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBContactValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = self->_aliases;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v7);
  }

  -[_INPBContactValue contactHandle](self, "contactHandle", v32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBContactValue contactHandle](self, "contactHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBContactValue customIdentifier](self, "customIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[_INPBContactValue firstName](self, "firstName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    PBDataWriterWriteStringField();
  -[_INPBContactValue fullName](self, "fullName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    PBDataWriterWriteStringField();
  -[_INPBContactValue handle](self, "handle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    PBDataWriterWriteStringField();
  -[_INPBContactValue image](self, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBContactValue image](self, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBContactValue hasIsContactSuggestion](self, "hasIsContactSuggestion"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBContactValue hasIsMe](self, "hasIsMe"))
    PBDataWriterWriteBOOLField();
  -[_INPBContactValue lastName](self, "lastName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    PBDataWriterWriteStringField();
  -[_INPBContactValue middleName](self, "middleName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    PBDataWriterWriteStringField();
  -[_INPBContactValue namePrefix](self, "namePrefix");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    PBDataWriterWriteStringField();
  -[_INPBContactValue nameSuffix](self, "nameSuffix");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    PBDataWriterWriteStringField();
  -[_INPBContactValue nickName](self, "nickName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    PBDataWriterWriteStringField();
  -[_INPBContactValue phonemeData](self, "phonemeData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    PBDataWriterWriteStringField();
  -[_INPBContactValue phoneticFirstName](self, "phoneticFirstName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    PBDataWriterWriteStringField();
  -[_INPBContactValue phoneticLastName](self, "phoneticLastName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    PBDataWriterWriteStringField();
  -[_INPBContactValue phoneticMiddleName](self, "phoneticMiddleName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    PBDataWriterWriteStringField();
  -[_INPBContactValue phoneticNamePrefix](self, "phoneticNamePrefix");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    PBDataWriterWriteStringField();
  -[_INPBContactValue phoneticNameSuffix](self, "phoneticNameSuffix");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    PBDataWriterWriteStringField();
  -[_INPBContactValue relationship](self, "relationship");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    PBDataWriterWriteStringField();
  if (-[_INPBContactValue hasSearchProvider](self, "hasSearchProvider"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBContactValue hasSuggestionType](self, "hasSuggestionType"))
    PBDataWriterWriteInt32Field();
  -[_INPBContactValue valueMetadata](self, "valueMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[_INPBContactValue valueMetadata](self, "valueMetadata");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBContactValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBContactValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBContactValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBContactValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBContactValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBContactValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBContactValue *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v5 = -[_INPBContactValue init](+[_INPBContactValue allocWithZone:](_INPBContactValue, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_aliases, "copyWithZone:", a3);
  -[_INPBContactValue setAliases:](v5, "setAliases:", v6);

  v7 = -[_INPBContactHandle copyWithZone:](self->_contactHandle, "copyWithZone:", a3);
  -[_INPBContactValue setContactHandle:](v5, "setContactHandle:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_customIdentifier, "copyWithZone:", a3);
  -[_INPBContactValue setCustomIdentifier:](v5, "setCustomIdentifier:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_firstName, "copyWithZone:", a3);
  -[_INPBContactValue setFirstName:](v5, "setFirstName:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_fullName, "copyWithZone:", a3);
  -[_INPBContactValue setFullName:](v5, "setFullName:", v10);

  v11 = (void *)-[NSString copyWithZone:](self->_handle, "copyWithZone:", a3);
  -[_INPBContactValue setHandle:](v5, "setHandle:", v11);

  v12 = -[_INPBImageValue copyWithZone:](self->_image, "copyWithZone:", a3);
  -[_INPBContactValue setImage:](v5, "setImage:", v12);

  if (-[_INPBContactValue hasIsContactSuggestion](self, "hasIsContactSuggestion"))
    -[_INPBContactValue setIsContactSuggestion:](v5, "setIsContactSuggestion:", -[_INPBContactValue isContactSuggestion](self, "isContactSuggestion"));
  if (-[_INPBContactValue hasIsMe](self, "hasIsMe"))
    -[_INPBContactValue setIsMe:](v5, "setIsMe:", -[_INPBContactValue isMe](self, "isMe"));
  v13 = (void *)-[NSString copyWithZone:](self->_lastName, "copyWithZone:", a3);
  -[_INPBContactValue setLastName:](v5, "setLastName:", v13);

  v14 = (void *)-[NSString copyWithZone:](self->_middleName, "copyWithZone:", a3);
  -[_INPBContactValue setMiddleName:](v5, "setMiddleName:", v14);

  v15 = (void *)-[NSString copyWithZone:](self->_namePrefix, "copyWithZone:", a3);
  -[_INPBContactValue setNamePrefix:](v5, "setNamePrefix:", v15);

  v16 = (void *)-[NSString copyWithZone:](self->_nameSuffix, "copyWithZone:", a3);
  -[_INPBContactValue setNameSuffix:](v5, "setNameSuffix:", v16);

  v17 = (void *)-[NSString copyWithZone:](self->_nickName, "copyWithZone:", a3);
  -[_INPBContactValue setNickName:](v5, "setNickName:", v17);

  v18 = (void *)-[NSString copyWithZone:](self->_phonemeData, "copyWithZone:", a3);
  -[_INPBContactValue setPhonemeData:](v5, "setPhonemeData:", v18);

  v19 = (void *)-[NSString copyWithZone:](self->_phoneticFirstName, "copyWithZone:", a3);
  -[_INPBContactValue setPhoneticFirstName:](v5, "setPhoneticFirstName:", v19);

  v20 = (void *)-[NSString copyWithZone:](self->_phoneticLastName, "copyWithZone:", a3);
  -[_INPBContactValue setPhoneticLastName:](v5, "setPhoneticLastName:", v20);

  v21 = (void *)-[NSString copyWithZone:](self->_phoneticMiddleName, "copyWithZone:", a3);
  -[_INPBContactValue setPhoneticMiddleName:](v5, "setPhoneticMiddleName:", v21);

  v22 = (void *)-[NSString copyWithZone:](self->_phoneticNamePrefix, "copyWithZone:", a3);
  -[_INPBContactValue setPhoneticNamePrefix:](v5, "setPhoneticNamePrefix:", v22);

  v23 = (void *)-[NSString copyWithZone:](self->_phoneticNameSuffix, "copyWithZone:", a3);
  -[_INPBContactValue setPhoneticNameSuffix:](v5, "setPhoneticNameSuffix:", v23);

  v24 = (void *)-[NSString copyWithZone:](self->_relationship, "copyWithZone:", a3);
  -[_INPBContactValue setRelationship:](v5, "setRelationship:", v24);

  if (-[_INPBContactValue hasSearchProvider](self, "hasSearchProvider"))
    -[_INPBContactValue setSearchProvider:](v5, "setSearchProvider:", -[_INPBContactValue searchProvider](self, "searchProvider"));
  if (-[_INPBContactValue hasSuggestionType](self, "hasSuggestionType"))
    -[_INPBContactValue setSuggestionType:](v5, "setSuggestionType:", -[_INPBContactValue suggestionType](self, "suggestionType"));
  v25 = -[_INPBValueMetadata copyWithZone:](self->_valueMetadata, "copyWithZone:", a3);
  -[_INPBContactValue setValueMetadata:](v5, "setValueMetadata:", v25);

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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  int isContactSuggestion;
  int v44;
  int isMe;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  int v106;
  int searchProvider;
  int v108;
  int suggestionType;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  char v114;
  BOOL v115;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_118;
  -[_INPBContactValue aliases](self, "aliases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aliases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue aliases](self, "aliases");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBContactValue aliases](self, "aliases");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aliases");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue contactHandle](self, "contactHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue contactHandle](self, "contactHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBContactValue contactHandle](self, "contactHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue customIdentifier](self, "customIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue customIdentifier](self, "customIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBContactValue customIdentifier](self, "customIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue firstName](self, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue firstName](self, "firstName");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBContactValue firstName](self, "firstName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue fullName](self, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue fullName](self, "fullName");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBContactValue fullName](self, "fullName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue handle](self, "handle");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBContactValue handle](self, "handle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue image](self, "image");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBContactValue image](self, "image");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_118;
  }
  else
  {

  }
  v42 = -[_INPBContactValue hasIsContactSuggestion](self, "hasIsContactSuggestion");
  if (v42 != objc_msgSend(v4, "hasIsContactSuggestion"))
    goto LABEL_118;
  if (-[_INPBContactValue hasIsContactSuggestion](self, "hasIsContactSuggestion"))
  {
    if (objc_msgSend(v4, "hasIsContactSuggestion"))
    {
      isContactSuggestion = self->_isContactSuggestion;
      if (isContactSuggestion != objc_msgSend(v4, "isContactSuggestion"))
        goto LABEL_118;
    }
  }
  v44 = -[_INPBContactValue hasIsMe](self, "hasIsMe");
  if (v44 != objc_msgSend(v4, "hasIsMe"))
    goto LABEL_118;
  if (-[_INPBContactValue hasIsMe](self, "hasIsMe"))
  {
    if (objc_msgSend(v4, "hasIsMe"))
    {
      isMe = self->_isMe;
      if (isMe != objc_msgSend(v4, "isMe"))
        goto LABEL_118;
    }
  }
  -[_INPBContactValue lastName](self, "lastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue lastName](self, "lastName");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[_INPBContactValue lastName](self, "lastName");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue middleName](self, "middleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "middleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue middleName](self, "middleName");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[_INPBContactValue middleName](self, "middleName");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "middleName");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue namePrefix](self, "namePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue namePrefix](self, "namePrefix");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v57 = (void *)v56;
    -[_INPBContactValue namePrefix](self, "namePrefix");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "namePrefix");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isEqual:", v59);

    if (!v60)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue nameSuffix](self, "nameSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nameSuffix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue nameSuffix](self, "nameSuffix");
  v61 = objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v62 = (void *)v61;
    -[_INPBContactValue nameSuffix](self, "nameSuffix");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nameSuffix");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v63, "isEqual:", v64);

    if (!v65)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue nickName](self, "nickName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nickName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue nickName](self, "nickName");
  v66 = objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    v67 = (void *)v66;
    -[_INPBContactValue nickName](self, "nickName");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nickName");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v68, "isEqual:", v69);

    if (!v70)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue phonemeData](self, "phonemeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phonemeData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue phonemeData](self, "phonemeData");
  v71 = objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    v72 = (void *)v71;
    -[_INPBContactValue phonemeData](self, "phonemeData");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phonemeData");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v73, "isEqual:", v74);

    if (!v75)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue phoneticFirstName](self, "phoneticFirstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticFirstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue phoneticFirstName](self, "phoneticFirstName");
  v76 = objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    v77 = (void *)v76;
    -[_INPBContactValue phoneticFirstName](self, "phoneticFirstName");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticFirstName");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v78, "isEqual:", v79);

    if (!v80)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue phoneticLastName](self, "phoneticLastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticLastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue phoneticLastName](self, "phoneticLastName");
  v81 = objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    v82 = (void *)v81;
    -[_INPBContactValue phoneticLastName](self, "phoneticLastName");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticLastName");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v83, "isEqual:", v84);

    if (!v85)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue phoneticMiddleName](self, "phoneticMiddleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticMiddleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue phoneticMiddleName](self, "phoneticMiddleName");
  v86 = objc_claimAutoreleasedReturnValue();
  if (v86)
  {
    v87 = (void *)v86;
    -[_INPBContactValue phoneticMiddleName](self, "phoneticMiddleName");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticMiddleName");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v88, "isEqual:", v89);

    if (!v90)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue phoneticNamePrefix](self, "phoneticNamePrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticNamePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue phoneticNamePrefix](self, "phoneticNamePrefix");
  v91 = objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    v92 = (void *)v91;
    -[_INPBContactValue phoneticNamePrefix](self, "phoneticNamePrefix");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticNamePrefix");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v93, "isEqual:", v94);

    if (!v95)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue phoneticNameSuffix](self, "phoneticNameSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneticNameSuffix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue phoneticNameSuffix](self, "phoneticNameSuffix");
  v96 = objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    v97 = (void *)v96;
    -[_INPBContactValue phoneticNameSuffix](self, "phoneticNameSuffix");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneticNameSuffix");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v98, "isEqual:", v99);

    if (!v100)
      goto LABEL_118;
  }
  else
  {

  }
  -[_INPBContactValue relationship](self, "relationship");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relationship");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_117;
  -[_INPBContactValue relationship](self, "relationship");
  v101 = objc_claimAutoreleasedReturnValue();
  if (v101)
  {
    v102 = (void *)v101;
    -[_INPBContactValue relationship](self, "relationship");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relationship");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v103, "isEqual:", v104);

    if (!v105)
      goto LABEL_118;
  }
  else
  {

  }
  v106 = -[_INPBContactValue hasSearchProvider](self, "hasSearchProvider");
  if (v106 != objc_msgSend(v4, "hasSearchProvider"))
    goto LABEL_118;
  if (-[_INPBContactValue hasSearchProvider](self, "hasSearchProvider"))
  {
    if (objc_msgSend(v4, "hasSearchProvider"))
    {
      searchProvider = self->_searchProvider;
      if (searchProvider != objc_msgSend(v4, "searchProvider"))
        goto LABEL_118;
    }
  }
  v108 = -[_INPBContactValue hasSuggestionType](self, "hasSuggestionType");
  if (v108 != objc_msgSend(v4, "hasSuggestionType"))
    goto LABEL_118;
  if (-[_INPBContactValue hasSuggestionType](self, "hasSuggestionType"))
  {
    if (objc_msgSend(v4, "hasSuggestionType"))
    {
      suggestionType = self->_suggestionType;
      if (suggestionType != objc_msgSend(v4, "suggestionType"))
        goto LABEL_118;
    }
  }
  -[_INPBContactValue valueMetadata](self, "valueMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBContactValue valueMetadata](self, "valueMetadata");
    v110 = objc_claimAutoreleasedReturnValue();
    if (!v110)
    {

LABEL_121:
      v115 = 1;
      goto LABEL_119;
    }
    v111 = (void *)v110;
    -[_INPBContactValue valueMetadata](self, "valueMetadata");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueMetadata");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v112, "isEqual:", v113);

    if ((v114 & 1) != 0)
      goto LABEL_121;
  }
  else
  {
LABEL_117:

  }
LABEL_118:
  v115 = 0;
LABEL_119:

  return v115;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  unint64_t v25;
  uint64_t v26;

  v26 = -[NSArray hash](self->_aliases, "hash");
  v25 = -[_INPBContactHandle hash](self->_contactHandle, "hash");
  v24 = -[NSString hash](self->_customIdentifier, "hash");
  v23 = -[NSString hash](self->_firstName, "hash");
  v22 = -[NSString hash](self->_fullName, "hash");
  v21 = -[NSString hash](self->_handle, "hash");
  v20 = -[_INPBImageValue hash](self->_image, "hash");
  if (-[_INPBContactValue hasIsContactSuggestion](self, "hasIsContactSuggestion"))
    v19 = 2654435761 * self->_isContactSuggestion;
  else
    v19 = 0;
  if (-[_INPBContactValue hasIsMe](self, "hasIsMe"))
    v18 = 2654435761 * self->_isMe;
  else
    v18 = 0;
  v17 = -[NSString hash](self->_lastName, "hash");
  v16 = -[NSString hash](self->_middleName, "hash");
  v15 = -[NSString hash](self->_namePrefix, "hash");
  v14 = -[NSString hash](self->_nameSuffix, "hash");
  v13 = -[NSString hash](self->_nickName, "hash");
  v3 = -[NSString hash](self->_phonemeData, "hash");
  v4 = -[NSString hash](self->_phoneticFirstName, "hash");
  v5 = -[NSString hash](self->_phoneticLastName, "hash");
  v6 = -[NSString hash](self->_phoneticMiddleName, "hash");
  v7 = -[NSString hash](self->_phoneticNamePrefix, "hash");
  v8 = -[NSString hash](self->_phoneticNameSuffix, "hash");
  v9 = -[NSString hash](self->_relationship, "hash");
  if (-[_INPBContactValue hasSearchProvider](self, "hasSearchProvider"))
    v10 = 2654435761 * self->_searchProvider;
  else
    v10 = 0;
  if (-[_INPBContactValue hasSuggestionType](self, "hasSuggestionType"))
    v11 = 2654435761 * self->_suggestionType;
  else
    v11 = 0;
  return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[_INPBValueMetadata hash](self->_valueMetadata, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  __CFString *v50;
  uint64_t v51;
  __CFString *v52;
  void *v53;
  void *v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_aliases, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v5 = self->_aliases;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v57;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v57 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("aliases"));
  }
  -[_INPBContactValue contactHandle](self, "contactHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("contactHandle"));

  if (self->_customIdentifier)
  {
    -[_INPBContactValue customIdentifier](self, "customIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("customIdentifier"));

  }
  if (self->_firstName)
  {
    -[_INPBContactValue firstName](self, "firstName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("firstName"));

  }
  if (self->_fullName)
  {
    -[_INPBContactValue fullName](self, "fullName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("fullName"));

  }
  if (self->_handle)
  {
    -[_INPBContactValue handle](self, "handle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("handle"));

  }
  -[_INPBContactValue image](self, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("image"));

  if (-[_INPBContactValue hasIsContactSuggestion](self, "hasIsContactSuggestion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBContactValue isContactSuggestion](self, "isContactSuggestion"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("isContactSuggestion"));

  }
  if (-[_INPBContactValue hasIsMe](self, "hasIsMe"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBContactValue isMe](self, "isMe"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("isMe"));

  }
  if (self->_lastName)
  {
    -[_INPBContactValue lastName](self, "lastName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("lastName"));

  }
  if (self->_middleName)
  {
    -[_INPBContactValue middleName](self, "middleName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("middleName"));

  }
  if (self->_namePrefix)
  {
    -[_INPBContactValue namePrefix](self, "namePrefix");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("namePrefix"));

  }
  if (self->_nameSuffix)
  {
    -[_INPBContactValue nameSuffix](self, "nameSuffix");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("nameSuffix"));

  }
  if (self->_nickName)
  {
    -[_INPBContactValue nickName](self, "nickName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("nickName"));

  }
  if (self->_phonemeData)
  {
    -[_INPBContactValue phonemeData](self, "phonemeData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("phonemeData"));

  }
  if (self->_phoneticFirstName)
  {
    -[_INPBContactValue phoneticFirstName](self, "phoneticFirstName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("phoneticFirstName"));

  }
  if (self->_phoneticLastName)
  {
    -[_INPBContactValue phoneticLastName](self, "phoneticLastName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v39, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("phoneticLastName"));

  }
  if (self->_phoneticMiddleName)
  {
    -[_INPBContactValue phoneticMiddleName](self, "phoneticMiddleName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v41, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("phoneticMiddleName"));

  }
  if (self->_phoneticNamePrefix)
  {
    -[_INPBContactValue phoneticNamePrefix](self, "phoneticNamePrefix");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v43, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("phoneticNamePrefix"));

  }
  if (self->_phoneticNameSuffix)
  {
    -[_INPBContactValue phoneticNameSuffix](self, "phoneticNameSuffix");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v45, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("phoneticNameSuffix"));

  }
  if (self->_relationship)
  {
    -[_INPBContactValue relationship](self, "relationship");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v47, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("relationship"));

  }
  if (-[_INPBContactValue hasSearchProvider](self, "hasSearchProvider"))
  {
    v49 = -[_INPBContactValue searchProvider](self, "searchProvider");
    if (v49 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v49);
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = off_1E228B8E8[v49];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("searchProvider"));

  }
  if (-[_INPBContactValue hasSuggestionType](self, "hasSuggestionType"))
  {
    v51 = -[_INPBContactValue suggestionType](self, "suggestionType");
    if (v51 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v51);
      v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = off_1E228B908[v51];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("suggestionType"));

  }
  -[_INPBContactValue valueMetadata](self, "valueMetadata");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "dictionaryRepresentation");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("valueMetadata"));

  return v3;
}

- (NSArray)aliases
{
  return self->_aliases;
}

- (_INPBContactHandle)contactHandle
{
  return self->_contactHandle;
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)handle
{
  return self->_handle;
}

- (_INPBImageValue)image
{
  return self->_image;
}

- (BOOL)isContactSuggestion
{
  return self->_isContactSuggestion;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (NSString)nickName
{
  return self->_nickName;
}

- (NSString)phonemeData
{
  return self->_phonemeData;
}

- (NSString)phoneticFirstName
{
  return self->_phoneticFirstName;
}

- (NSString)phoneticLastName
{
  return self->_phoneticLastName;
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (NSString)phoneticNamePrefix
{
  return self->_phoneticNamePrefix;
}

- (NSString)phoneticNameSuffix
{
  return self->_phoneticNameSuffix;
}

- (NSString)relationship
{
  return self->_relationship;
}

- (int)searchProvider
{
  return self->_searchProvider;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_phoneticNameSuffix, 0);
  objc_storeStrong((id *)&self->_phoneticNamePrefix, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticLastName, 0);
  objc_storeStrong((id *)&self->_phoneticFirstName, 0);
  objc_storeStrong((id *)&self->_phonemeData, 0);
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_contactHandle, 0);
  objc_storeStrong((id *)&self->_aliases, 0);
}

+ (Class)aliasesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
