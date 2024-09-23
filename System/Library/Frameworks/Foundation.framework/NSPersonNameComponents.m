@implementation NSPersonNameComponents

- (NSString)middleName
{
  return (NSString *)objc_msgSend(self->_private, "middleName");
}

- (NSPersonNameComponents)phoneticRepresentation
{
  return (NSPersonNameComponents *)objc_msgSend(self->_private, "phoneticRepresentation");
}

- (NSString)nickname
{
  return (NSString *)objc_msgSend(self->_private, "nickname");
}

- (NSString)nameSuffix
{
  return (NSString *)objc_msgSend(self->_private, "nameSuffix");
}

- (NSString)namePrefix
{
  return (NSString *)objc_msgSend(self->_private, "namePrefix");
}

- (void)setGivenName:(NSString *)givenName
{
  objc_msgSend(self->_private, "setGivenName:", givenName);
}

- (void)setFamilyName:(NSString *)familyName
{
  objc_msgSend(self->_private, "setFamilyName:", familyName);
}

- (void)setMiddleName:(NSString *)middleName
{
  objc_msgSend(self->_private, "setMiddleName:", middleName);
}

- (void)setNameSuffix:(NSString *)nameSuffix
{
  objc_msgSend(self->_private, "setNameSuffix:", nameSuffix);
}

- (void)setNickname:(NSString *)nickname
{
  objc_msgSend(self->_private, "setNickname:", nickname);
}

- (void)setNamePrefix:(NSString *)namePrefix
{
  objc_msgSend(self->_private, "setNamePrefix:", namePrefix);
}

- (id)_scriptDeterminingStringRepresentationWithPhoneticDesired:(BOOL)a3
{
  _BOOL8 v3;
  NSString *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = +[NSString string](NSMutableString, "string");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = +[NSPersonNameComponents __componentsRequiredForScriptDetectionWithPhoneticDesired:](NSPersonNameComponents, "__componentsRequiredForScriptDetectionWithPhoneticDesired:", v3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = -[NSPersonNameComponents valueForKeyPath:](self, "valueForKeyPath:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        if (v11)
          -[NSString appendString:](v5, "appendString:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v8);
  }
  return v5;
}

+ (id)__componentsRequiredForScriptDetectionWithPhoneticDesired:(BOOL)a3
{
  _QWORD *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6[0] = CFSTR("phoneticRepresentation.givenName");
    v6[1] = CFSTR("phoneticRepresentation.middleName");
    v6[2] = CFSTR("phoneticRepresentation.familyName");
    v3 = v6;
  }
  else
  {
    v5[0] = CFSTR("givenName");
    v5[1] = CFSTR("middleName");
    v5[2] = CFSTR("familyName");
    v3 = v5;
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
}

- (BOOL)_isEmpty
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self)
    return 1;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_msgSend((id)objc_opt_class(), "_allProperties");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (!v4)
    return 1;
  v5 = v4;
  v6 = *(_QWORD *)v15;
  v7 = 1;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v3);
      v9 = (void *)-[NSPersonNameComponents valueForKeyPath:](self, "valueForKeyPath:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = objc_msgSend(v9, "length") == 0;
      else
        v10 = v9 == 0;
      if (!v10)
        v7 = 0;
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  }
  while (v5);
  return v7;
}

+ (id)_allProperties
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("givenName");
  v3[1] = CFSTR("familyName");
  v3[2] = CFSTR("middleName");
  v3[3] = CFSTR("namePrefix");
  v3[4] = CFSTR("nameSuffix");
  v3[5] = CFSTR("nickname");
  v3[6] = CFSTR("phoneticRepresentation");
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7));
}

+ (id)_allComponents
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("givenName");
  v3[1] = CFSTR("familyName");
  v3[2] = CFSTR("middleName");
  v3[3] = CFSTR("namePrefix");
  v3[4] = CFSTR("nameSuffix");
  v3[5] = CFSTR("nickname");
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6));
}

- (void)setPhoneticRepresentation:(NSPersonNameComponents *)phoneticRepresentation
{
  objc_msgSend(self->_private, "setPhoneticRepresentation:", phoneticRepresentation);
}

- (NSString)givenName
{
  return (NSString *)objc_msgSend(self->_private, "givenName");
}

- (NSString)familyName
{
  return (NSString *)objc_msgSend(self->_private, "familyName");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)objc_msgSend(self->_private, "copyWithZone:", a3);
  return v5;
}

- (NSPersonNameComponents)init
{
  NSPersonNameComponents *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSPersonNameComponents;
  v2 = -[NSPersonNameComponents init](&v4, sel_init);
  if (v2)
    v2->_private = objc_alloc_init(_NSPersonNameComponentsData);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSPersonNameComponents;
  -[NSPersonNameComponents dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersonNameComponents)initWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPersonNameComponents cannot be decoded by non-keyed archivers"), 0));
  }
  if (self && objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.nameComponentsPrivate")))
    self->_private = (id)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.nameComponentsPrivate")), "copy");
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPersonNameComponents cannot be encoded by non-keyed archivers"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", self->_private, CFSTR("NS.nameComponentsPrivate"));
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSPersonNameComponents;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {givenName = %@, familyName = %@, middleName = %@, namePrefix = %@, nameSuffix = %@, nickname = %@ phoneticRepresentation = %@ }"), -[NSPersonNameComponents description](&v3, sel_description), -[NSPersonNameComponents givenName](self, "givenName"), -[NSPersonNameComponents familyName](self, "familyName"), -[NSPersonNameComponents middleName](self, "middleName"), -[NSPersonNameComponents namePrefix](self, "namePrefix"), -[NSPersonNameComponents nameSuffix](self, "nameSuffix"), -[NSPersonNameComponents nickname](self, "nickname"), -[NSPersonNameComponents phoneticRepresentation](self, "phoneticRepresentation"));
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[NSPersonNameComponents isEqualToComponents:](self, "isEqualToComponents:");
}

- (BOOL)isEqualToComponents:(id)a3
{
  id v3;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = +[NSPersonNameComponents _allProperties](NSPersonNameComponents, "_allProperties");
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 1;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__NSPersonNameComponents_isEqualToComponents___block_invoke;
    v7[3] = &unk_1E0F4E6C8;
    v7[4] = self;
    v7[5] = v3;
    v7[6] = &v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);
    LOBYTE(v3) = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  return (char)v3;
}

uint64_t __46__NSPersonNameComponents_isEqualToComponents___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  uint64_t result;
  BOOL v8;

  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  result = objc_msgSend(*(id *)(a1 + 40), "valueForKey:", a2);
  if (result)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (v8 || v6 && (!result || (result = objc_msgSend(v6, "isEqual:", result), (result & 1) == 0)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v3 = +[NSPersonNameComponents _allProperties](NSPersonNameComponents, "_allProperties");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__NSPersonNameComponents_hash__block_invoke;
  v6[3] = &unk_1E0F4E6F0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __30__NSPersonNameComponents_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t result;

  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = objc_msgSend(v3, "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result - v4 + 32 * v4;
  return result;
}

@end
