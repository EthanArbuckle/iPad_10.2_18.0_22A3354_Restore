@implementation NSMorphology

+ (id)_heuristicMorphologyForLanguage:(id)a3 prefix:(id)a4 suffix:(id)a5 featureName:(id *)a6 matchedPrefix:(BOOL *)a7 matchedSuffix:(BOOL *)a8
{
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void (*v21)(_QWORD);

  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = v17;
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = specialized static NSMorphology._heuristicMorphology(language:prefix:suffix:featureNamePointer:matchedPrefixPointer:matchedSuffixPointer:)((uint64_t)v13, v15, (uint64_t)v16, v18, (uint64_t)v19, v20, a6, a7, (char *)a8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v21;
}

- (id)_morphunConstraints
{
  return @objc NSMorphology.morphunConstraints()(self, (uint64_t)a2, (void (*)(void))NSMorphology.morphunConstraints());
}

- (uint64_t)mergeMorphology:(char)a3 override:
{
  void *v5;

  if (result)
  {
    v5 = (void *)result;
    if (objc_msgSend(a2, "grammaticalGender"))
    {
      if ((a3 & 1) == 0 && objc_msgSend(v5, "grammaticalGender"))
      {
        if (!objc_msgSend(a2, "partOfSpeech"))
        {
LABEL_12:
          if (objc_msgSend(a2, "number"))
          {
            if ((a3 & 1) == 0 && objc_msgSend(v5, "number"))
            {
              if (!objc_msgSend(a2, "grammaticalCase"))
              {
LABEL_22:
                if (objc_msgSend(a2, "determination"))
                {
                  if ((a3 & 1) == 0 && objc_msgSend(v5, "determination"))
                  {
                    if (!objc_msgSend(a2, "grammaticalPerson"))
                    {
LABEL_32:
                      if (objc_msgSend(a2, "pronounType"))
                      {
                        if ((a3 & 1) == 0 && objc_msgSend(v5, "pronounType"))
                        {
                          if (!objc_msgSend(a2, "definiteness"))
                          {
LABEL_42:
                            if (objc_msgSend(a2, "_adjectival"))
                            {
                              if ((a3 & 1) == 0 && objc_msgSend(v5, "_adjectival"))
                              {
                                result = objc_msgSend(a2, "_clusivity");
                                if (!result)
                                  return result;
LABEL_50:
                                result = objc_msgSend(v5, "_clusivity");
                                if (result)
                                  return result;
                                return objc_msgSend(v5, "set_clusivity:", objc_msgSend(a2, "_clusivity"));
                              }
                              objc_msgSend(v5, "set_adjectival:", objc_msgSend(a2, "_adjectival"));
                            }
                            result = objc_msgSend(a2, "_clusivity");
                            if (!result)
                              return result;
                            if ((a3 & 1) != 0)
                              return objc_msgSend(v5, "set_clusivity:", objc_msgSend(a2, "_clusivity"));
                            goto LABEL_50;
                          }
                          goto LABEL_40;
                        }
                        objc_msgSend(v5, "setPronounType:", objc_msgSend(a2, "pronounType"));
                      }
                      if (!objc_msgSend(a2, "definiteness"))
                        goto LABEL_42;
                      if ((a3 & 1) != 0)
                      {
LABEL_41:
                        objc_msgSend(v5, "setDefiniteness:", objc_msgSend(a2, "definiteness"));
                        goto LABEL_42;
                      }
LABEL_40:
                      if (objc_msgSend(v5, "definiteness"))
                        goto LABEL_42;
                      goto LABEL_41;
                    }
                    goto LABEL_30;
                  }
                  objc_msgSend(v5, "setDetermination:", objc_msgSend(a2, "determination"));
                }
                if (!objc_msgSend(a2, "grammaticalPerson"))
                  goto LABEL_32;
                if ((a3 & 1) != 0)
                {
LABEL_31:
                  objc_msgSend(v5, "setGrammaticalPerson:", objc_msgSend(a2, "grammaticalPerson"));
                  goto LABEL_32;
                }
LABEL_30:
                if (objc_msgSend(v5, "grammaticalPerson"))
                  goto LABEL_32;
                goto LABEL_31;
              }
              goto LABEL_20;
            }
            objc_msgSend(v5, "setNumber:", objc_msgSend(a2, "number"));
          }
          if (!objc_msgSend(a2, "grammaticalCase"))
            goto LABEL_22;
          if ((a3 & 1) != 0)
          {
LABEL_21:
            objc_msgSend(v5, "setGrammaticalCase:", objc_msgSend(a2, "grammaticalCase"));
            goto LABEL_22;
          }
LABEL_20:
          if (objc_msgSend(v5, "grammaticalCase"))
            goto LABEL_22;
          goto LABEL_21;
        }
        goto LABEL_10;
      }
      objc_msgSend(v5, "setGrammaticalGender:", objc_msgSend(a2, "grammaticalGender"));
    }
    if (!objc_msgSend(a2, "partOfSpeech"))
      goto LABEL_12;
    if ((a3 & 1) != 0)
    {
LABEL_11:
      objc_msgSend(v5, "setPartOfSpeech:", objc_msgSend(a2, "partOfSpeech"));
      goto LABEL_12;
    }
LABEL_10:
    if (objc_msgSend(v5, "partOfSpeech"))
      goto LABEL_12;
    goto LABEL_11;
  }
  return result;
}

- (void)isIdentity
{
  void *v1;

  if (result)
  {
    v1 = result;
    if (objc_msgSend(result, "grammaticalGender")
      || objc_msgSend(v1, "grammaticalCase")
      || objc_msgSend(v1, "partOfSpeech")
      || objc_msgSend(v1, "definiteness")
      || objc_msgSend(v1, "number")
      || objc_msgSend(v1, "determination")
      || objc_msgSend(v1, "grammaticalPerson")
      || objc_msgSend(v1, "pronounType")
      || objc_msgSend(v1, "_clusivity"))
    {
      return 0;
    }
    else
    {
      return (void *)(objc_msgSend(v1, "_adjectival") == 0);
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSMorphology;
  -[NSMorphology dealloc](&v3, sel_dealloc);
}

- (NSDictionary)_customPronouns
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_customPronouns, "copy");
}

- (void)_setCustomPronouns:(id)a3
{
  NSMutableDictionary *customPronouns;

  customPronouns = self->_customPronouns;
  if (customPronouns != a3)
  {

    self->_customPronouns = (NSMutableDictionary *)objc_msgSend(a3, "copy");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[4] = -[NSMorphology grammaticalGender](self, "grammaticalGender");
  v4[7] = -[NSMorphology grammaticalCase](self, "grammaticalCase");
  v4[5] = -[NSMorphology partOfSpeech](self, "partOfSpeech");
  v4[11] = -[NSMorphology definiteness](self, "definiteness");
  v4[6] = -[NSMorphology number](self, "number");
  v4[8] = -[NSMorphology determination](self, "determination");
  v4[9] = -[NSMorphology grammaticalPerson](self, "grammaticalPerson");
  v4[10] = -[NSMorphology pronounType](self, "pronounType");
  v4[2] = -[NSMorphology _adjectival](self, "_adjectival");
  v4[3] = -[NSMorphology _clusivity](self, "_clusivity");
  v4[1] = -[NSMutableDictionary mutableCopy](self->_customPronouns, "mutableCopy");
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSGrammaticalGender v4;
  uint64_t v5;
  NSGrammaticalPartOfSpeech v6;
  uint64_t v7;
  uint64_t v8;
  NSGrammaticalDetermination v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  v4 = -[NSMorphology grammaticalGender](self, "grammaticalGender");
  v5 = v4 ^ -[NSMorphology grammaticalCase](self, "grammaticalCase") ^ v3;
  v6 = -[NSMorphology partOfSpeech](self, "partOfSpeech");
  v7 = v6 ^ -[NSMorphology definiteness](self, "definiteness");
  v8 = v5 ^ v7 ^ -[NSMorphology number](self, "number");
  v9 = -[NSMorphology determination](self, "determination");
  v10 = v9 ^ -[NSMorphology grammaticalPerson](self, "grammaticalPerson");
  v11 = v10 ^ -[NSMorphology pronounType](self, "pronounType");
  v12 = v8 ^ v11 ^ -[NSMorphology _adjectival](self, "_adjectival");
  v13 = v12 ^ -[NSMorphology _clusivity](self, "_clusivity");
  return v13 ^ -[NSMutableDictionary hash](self->_customPronouns, "hash");
}

- (BOOL)isEqual:(id)a3
{
  NSGrammaticalGender v5;
  NSGrammaticalCase v6;
  NSGrammaticalPartOfSpeech v7;
  NSGrammaticalDefiniteness v8;
  NSGrammaticalNumber v9;
  NSGrammaticalDetermination v10;
  NSGrammaticalPerson v11;
  NSGrammaticalPronounType v12;
  int64_t v13;
  int64_t v14;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[NSMorphology grammaticalGender](self, "grammaticalGender");
  if (v5 != objc_msgSend(a3, "grammaticalGender"))
    return 0;
  v6 = -[NSMorphology grammaticalCase](self, "grammaticalCase");
  if (v6 != objc_msgSend(a3, "grammaticalCase"))
    return 0;
  v7 = -[NSMorphology partOfSpeech](self, "partOfSpeech");
  if (v7 != objc_msgSend(a3, "partOfSpeech"))
    return 0;
  v8 = -[NSMorphology definiteness](self, "definiteness");
  if (v8 != objc_msgSend(a3, "definiteness"))
    return 0;
  v9 = -[NSMorphology number](self, "number");
  if (v9 != objc_msgSend(a3, "number"))
    return 0;
  v10 = -[NSMorphology determination](self, "determination");
  if (v10 != objc_msgSend(a3, "determination"))
    return 0;
  v11 = -[NSMorphology grammaticalPerson](self, "grammaticalPerson");
  if (v11 != objc_msgSend(a3, "grammaticalPerson"))
    return 0;
  v12 = -[NSMorphology pronounType](self, "pronounType");
  if (v12 != objc_msgSend(a3, "pronounType"))
    return 0;
  v13 = -[NSMorphology _adjectival](self, "_adjectival");
  if (v13 != objc_msgSend(a3, "_adjectival"))
    return 0;
  v14 = -[NSMorphology _clusivity](self, "_clusivity");
  if (v14 != objc_msgSend(a3, "_clusivity"))
    return 0;
  if (-[NSMutableDictionary count](self->_customPronouns, "count") || objc_msgSend(*((id *)a3 + 1), "count"))
    return -[NSMutableDictionary isEqual:](self->_customPronouns, "isEqual:", *((_QWORD *)a3 + 1));
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *customPronouns;

  objc_msgSend(a3, "encodeInteger:forKey:", -[NSMorphology grammaticalGender](self, "grammaticalGender"), CFSTR("grammaticalGender"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSMorphology grammaticalCase](self, "grammaticalCase"), CFSTR("grammaticalCase"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSMorphology partOfSpeech](self, "partOfSpeech"), CFSTR("partOfSpeech"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSMorphology definiteness](self, "definiteness"), CFSTR("definiteness"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSMorphology number](self, "number"), CFSTR("number"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSMorphology determination](self, "determination"), CFSTR("determination"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSMorphology grammaticalPerson](self, "grammaticalPerson"), CFSTR("grammaticalPerson"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSMorphology pronounType](self, "pronounType"), CFSTR("pronounType"));
  customPronouns = self->_customPronouns;
  if (customPronouns)
  {
    if (-[NSMutableDictionary count](customPronouns, "count"))
      objc_msgSend(a3, "encodeObject:forKey:", self->_customPronouns, CFSTR("customPronouns"));
  }
}

- (NSMorphology)initWithCoder:(id)a3
{
  NSMorphology *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)NSMorphology;
  v4 = -[NSMorphology init](&v15, sel_init);
  if (v4)
  {
    v4->_grammaticalGender = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("grammaticalGender"));
    v4->_grammaticalCase = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("grammaticalCase"));
    v4->_partOfSpeech = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("partOfSpeech"));
    v4->_definiteness = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("definiteness"));
    v4->_number = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("number"));
    v4->_determination = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("determination"));
    v4->_grammaticalPerson = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("grammaticalPerson"));
    v4->_pronounType = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("pronounType"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0), CFSTR("customPronouns"));
    if (v8)
    {
      if (!_NSIsNSDictionary())
      {
LABEL_14:
        objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, 0));

        return 0;
      }
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
LABEL_6:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
          if (!_NSIsNSString())
            goto LABEL_14;
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_14;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
            if (v10)
              goto LABEL_6;
            break;
          }
        }
      }
    }
    v4->_customPronouns = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy");
  }
  return v4;
}

- (id)description
{
  id v3;
  NSGrammaticalGender v4;
  NSString *v5;
  NSGrammaticalNumber v6;
  NSString *v7;
  NSGrammaticalPartOfSpeech v8;
  NSString *v9;
  NSGrammaticalCase v10;
  NSString *v11;
  NSGrammaticalDefiniteness v12;
  NSString *v13;
  NSGrammaticalDetermination v14;
  NSString *v15;
  NSGrammaticalPerson v16;
  NSString *v17;
  NSGrammaticalPronounType v18;
  NSString *v19;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)NSMorphology;
  v3 = -[NSMorphology description](&v21, sel_description);
  v4 = -[NSMorphology grammaticalGender](self, "grammaticalGender");
  if ((unint64_t)v4 >= 4)
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(NSGrammaticalGender)(%lld)"), v4);
  else
    v5 = (NSString *)off_1E0F4C9D0[v4];
  v6 = -[NSMorphology number](self, "number");
  if ((unint64_t)v6 >= (NSGrammaticalNumberPluralMany|NSGrammaticalNumberSingular))
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(NSGrammaticalNumber)(%lld)"), v6);
  else
    v7 = (NSString *)off_1E0F4C9F0[v6];
  v8 = -[NSMorphology partOfSpeech](self, "partOfSpeech");
  if ((unint64_t)v8 >= (NSGrammaticalPartOfSpeechAbbreviation|NSGrammaticalPartOfSpeechDeterminer))
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(NSGrammaticalPartOfSpeech)(%lld)"), v8);
  else
    v9 = (NSString *)off_1E0F4CA28[v8];
  v10 = -[NSMorphology grammaticalCase](self, "grammaticalCase");
  if ((unint64_t)v10 >= (NSGrammaticalCaseTranslative|NSGrammaticalCaseNominative))
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(NSGrammaticalCase)(%lld)"), v10);
  else
    v11 = (NSString *)off_1E0F4CAA0[v10];
  v12 = -[NSMorphology definiteness](self, "definiteness");
  if ((unint64_t)v12 >= (NSGrammaticalDefinitenessDefinite|NSGrammaticalDefinitenessIndefinite))
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(NSGrammaticalDefiniteness)(%lld)"), v12);
  else
    v13 = (NSString *)off_1E0F4CB18[v12];
  v14 = -[NSMorphology determination](self, "determination");
  if ((unint64_t)v14 >= (NSGrammaticalDeterminationDependent|NSGrammaticalDeterminationIndependent))
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(NSGrammaticalDetermination)(%lld)"), v14);
  else
    v15 = (NSString *)off_1E0F4CB30[v14];
  v16 = -[NSMorphology grammaticalPerson](self, "grammaticalPerson");
  if ((unint64_t)v16 >= 4)
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(NSGrammaticalPerson)(%lld)"), v16);
  else
    v17 = (NSString *)off_1E0F4CB48[v16];
  v18 = -[NSMorphology pronounType](self, "pronounType");
  if ((unint64_t)v18 >= 4)
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(NSGrammaticalPronounType)(%lld)"), v18);
  else
    v19 = (NSString *)off_1E0F4CB68[v18];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ { grammaticalGender = %@, number = %@, partOfSpeech = %@, case = %@, definiteness = %@, determination = %@, grammaticalPerson = %@, pronounType = %@, customPronouns = %@ }"), v3, v5, v7, v9, v11, v13, v15, v17, v19, self->_customPronouns);
}

- (NSGrammaticalGender)grammaticalGender
{
  return self->_grammaticalGender;
}

- (void)setGrammaticalGender:(NSGrammaticalGender)grammaticalGender
{
  self->_grammaticalGender = grammaticalGender;
}

- (NSGrammaticalPartOfSpeech)partOfSpeech
{
  return self->_partOfSpeech;
}

- (void)setPartOfSpeech:(NSGrammaticalPartOfSpeech)partOfSpeech
{
  self->_partOfSpeech = partOfSpeech;
}

- (NSGrammaticalNumber)number
{
  return self->_number;
}

- (void)setNumber:(NSGrammaticalNumber)number
{
  self->_number = number;
}

- (NSGrammaticalCase)grammaticalCase
{
  return self->_grammaticalCase;
}

- (void)setGrammaticalCase:(NSGrammaticalCase)grammaticalCase
{
  self->_grammaticalCase = grammaticalCase;
}

- (NSGrammaticalDetermination)determination
{
  return self->_determination;
}

- (void)setDetermination:(NSGrammaticalDetermination)determination
{
  self->_determination = determination;
}

- (NSGrammaticalPerson)grammaticalPerson
{
  return self->_grammaticalPerson;
}

- (void)setGrammaticalPerson:(NSGrammaticalPerson)grammaticalPerson
{
  self->_grammaticalPerson = grammaticalPerson;
}

- (NSGrammaticalPronounType)pronounType
{
  return self->_pronounType;
}

- (void)setPronounType:(NSGrammaticalPronounType)pronounType
{
  self->_pronounType = pronounType;
}

- (NSGrammaticalDefiniteness)definiteness
{
  return self->_definiteness;
}

- (void)setDefiniteness:(NSGrammaticalDefiniteness)definiteness
{
  self->_definiteness = definiteness;
}

- (NSMorphologyCustomPronoun)customPronounForLanguage:(NSString *)language
{
  return (NSMorphologyCustomPronoun *)(id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_customPronouns, "objectForKeyedSubscript:", -[NSString lowercaseString](language, "lowercaseString")), "copy");
}

- (BOOL)setCustomPronoun:(NSMorphologyCustomPronoun *)features forLanguage:(NSString *)language error:(NSError *)error
{
  _BOOL4 v8;
  void *v9;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  if (!features
    || (v11[0] = MEMORY[0x1E0C809B0],
        v11[1] = 3221225472,
        v11[2] = __69__NSMorphology_NSCustomPronouns__setCustomPronoun_forLanguage_error___block_invoke,
        v11[3] = &unk_1E0F4C970,
        v11[4] = features,
        v8 = +[NSMorphologyCustomPronoun _validateCustomPronounWithAccessor:forLanguage:error:](NSMorphologyCustomPronoun, "_validateCustomPronounWithAccessor:forLanguage:error:", v11, language, error)))
  {
    if (!self->_customPronouns)
      self->_customPronouns = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = (void *)-[NSMorphologyCustomPronoun copy](features, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_customPronouns, "setObject:forKeyedSubscript:", v9, -[NSString lowercaseString](language, "lowercaseString"));

    LOBYTE(v8) = 1;
  }
  return v8;
}

uint64_t __69__NSMorphology_NSCustomPronouns__setCustomPronoun_forLanguage_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
}

+ (void)_clearCachedUserMorphology
{
  NSObject *v2;
  uint8_t v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_91);

  qword_1ECD09B18 = 0;
  qword_1ECD09B20 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_91);
  if (_NSInflectionLog_onceToken != -1)
    dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
  v2 = _NSInflectionLog_log;
  if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_INFO, "User morphology was cleared.", v3, 2u);
  }
}

+ (void)_getUserMorphology:(id *)a3 userInflection:(id *)a4
{
  CFPropertyListRef v6;
  NSObject *v7;
  int v8;
  BOOL v9;
  NSString *v10;
  CFPropertyListRef v11;
  NSObject *v12;
  NSString *v13;
  NSObject *v14;
  NSObject *v15;
  _NSAttributedStringGrammarInflection *v16;
  uint64_t v17;
  const char *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD09B28 != -1)
    dispatch_once(&qword_1ECD09B28, &__block_literal_global_2);
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_91);
  if (!qword_1ECD09B18)
  {
    if (+[_NSAttributedStringGrammarInflection _isSimulatingLockedDevice](_NSAttributedStringGrammarInflection, "_isSimulatingLockedDevice"))
    {
LABEL_30:

      if (qword_1ECD09B18)
      {
        v16 = [_NSAttributedStringGrammarInflection alloc];
        v17 = -[_NSAttributedStringGrammarInflection initWithMorphology:](v16, "initWithMorphology:", qword_1ECD09B18);
      }
      else
      {
        v17 = 0;
      }
      qword_1ECD09B20 = v17;
      goto LABEL_34;
    }
    v6 = (CFPropertyListRef)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "dictionaryForKey:", CFSTR("AppleUserMorphology"));
    if (v6)
    {
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v7 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = (uint64_t)v6;
        v21 = 2082;
        v22 = "true";
        _os_log_impl(&dword_1817D9000, v7, OS_LOG_TYPE_INFO, "User morphology preferences value read from the standard user defaults: %@ (is present? %{public}s)", buf, 0x16u);
      }
    }
    getpid();
    v18 = -[NSString UTF8String](+[_NSAttributedStringGrammarInflection _protectedPreferencesDomain](_NSAttributedStringGrammarInflection, "_protectedPreferencesDomain"), "UTF8String");
    v8 = sandbox_check();
    v9 = +[_NSAttributedStringGrammarInflection _isSimulatingThirdPartyProcess](_NSAttributedStringGrammarInflection, "_isSimulatingThirdPartyProcess", v18);
    if (v6 || v9)
    {
      if (!v6)
        goto LABEL_20;
    }
    else
    {
      if (v8)
        goto LABEL_20;
      v10 = +[_NSAttributedStringGrammarInflection _protectedPreferencesDomain](_NSAttributedStringGrammarInflection, "_protectedPreferencesDomain");
      v11 = (id)CFPreferencesCopyValue(CFSTR("AppleUserMorphology"), (CFStringRef)v10, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      if (!v11)
        goto LABEL_20;
      v6 = v11;
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v12 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = (uint64_t)v6;
        v21 = 2082;
        v22 = "true";
        _os_log_impl(&dword_1817D9000, v12, OS_LOG_TYPE_INFO, "User morphology preferences value read from the protected domain: %@ (is present? %{public}s)", buf, 0x16u);
      }
    }
    if ((_NSIsNSDictionary() & 1) != 0)
    {
LABEL_25:
      if (_NSIsNSDictionary())
      {
        qword_1ECD09B18 = -[NSMorphology _initWithExternalRepresentationDictionary:]([NSMorphology alloc], "_initWithExternalRepresentationDictionary:", v6);
        if (_NSInflectionLog_onceToken != -1)
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        v15 = _NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v20 = qword_1ECD09B18;
          _os_log_impl(&dword_1817D9000, v15, OS_LOG_TYPE_INFO, "User morphology produced: %@", buf, 0xCu);
        }
      }
      goto LABEL_30;
    }
LABEL_20:
    v13 = +[_NSAttributedStringGrammarInflection _thirdPartyPreferencesDomain](_NSAttributedStringGrammarInflection, "_thirdPartyPreferencesDomain");
    v6 = (id)CFPreferencesCopyValue(CFSTR("AppleUserMorphology"), (CFStringRef)v13, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (v6)
    {
      if (_NSInflectionLog_onceToken != -1)
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      v14 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = (uint64_t)v6;
        v21 = 2082;
        v22 = "true";
        _os_log_impl(&dword_1817D9000, v14, OS_LOG_TYPE_INFO, "User morphology preferences value read from the shared domain: %@ (is present? %{public}s)", buf, 0x16u);
      }
    }
    goto LABEL_25;
  }
LABEL_34:
  if (a3)
    *a3 = (id)objc_msgSend((id)qword_1ECD09B18, "copy");
  if (a4)
    *a4 = (id)objc_msgSend((id)qword_1ECD09B20, "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_91);
}

uint64_t __84__NSMorphology_NSMorphologyUserSettingsInternal___getUserMorphology_userInflection___block_invoke()
{
  NSObject *global_queue;

  global_queue = dispatch_get_global_queue(25, 0);
  return notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)&_getUserMorphology_userInflection__keybagToken, global_queue, &__block_literal_global_178);
}

uint64_t __84__NSMorphology_NSMorphologyUserSettingsInternal___getUserMorphology_userInflection___block_invoke_2()
{
  return +[NSMorphology _clearCachedUserMorphology](NSMorphology, "_clearCachedUserMorphology");
}

+ (id)_userInflection
{
  id result;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  objc_msgSend(a1, "_getUserMorphology:userInflection:", 0, v3);
  result = (id)v3[0];
  if (!v3[0])
    return objc_alloc_init(_NSAttributedStringGrammarInflection);
  return result;
}

+ (id)_userMorphologyWithOverrides
{
  void *v0;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_self();
  if (_NSMorphologyUserInflectionTemporaryOverride)
    return (id)_NSMorphologyUserInflectionTemporaryOverride;
  v2[0] = 0;
  objc_msgSend(v0, "_getUserMorphology:userInflection:", v2, 0);
  return (id)v2[0];
}

- (void)_overrideUserInflectionInBlock:(void *)a1
{
  id v4;
  id v5;

  if (a1)
  {
    v5 = (id)_NSMorphologyUserInflectionTemporaryOverride;
    v4 = a1;
    _NSMorphologyUserInflectionTemporaryOverride = (uint64_t)v4;
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    _NSMorphologyUserInflectionTemporaryOverride = (uint64_t)v5;

  }
}

- (BOOL)isUnspecified
{
  NSMutableDictionary *customPronouns;

  if (-[NSMorphology grammaticalGender](self, "grammaticalGender")
    || -[NSMorphology number](self, "number")
    || -[NSMorphology partOfSpeech](self, "partOfSpeech"))
  {
    return 0;
  }
  customPronouns = self->_customPronouns;
  return !customPronouns || -[NSMutableDictionary count](customPronouns, "count") == 0;
}

+ (NSMorphology)userMorphology
{
  NSMorphology *result;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  objc_msgSend(a1, "_getUserMorphology:userInflection:", v3, 0);
  result = (NSMorphology *)v3[0];
  if (!v3[0])
    return objc_alloc_init(NSMorphology);
  return result;
}

- (id)_initWithExternalRepresentation:(id)a3 error:(id *)a4
{
  NSMorphology *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSMutableDictionary *customPronouns;
  objc_super v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)NSMorphology;
  v6 = -[NSMorphology init](&v27, sel_init);
  if (!v6)
    return v6;
  v7 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", a3, 0, a4);
  if (!v7)
  {
LABEL_40:

    return 0;
  }
  v8 = v7;
  if ((_NSIsNSDictionary() & 1) == 0
    || (_NSGrammaticalGenderGetFromExternalRepresentation((void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("grammaticalGender")), &v6->_grammaticalGender) & 1) == 0|| (_NSGrammaticalNumberGetFromExternalRepresentation((void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("number")), &v6->_number) & 1) == 0|| (_NSGrammaticalPartOfSpeechGetFromExternalRepresentation((void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("partOfSpeech")), &v6->_partOfSpeech) & 1) == 0|| (_NSGrammaticalCaseGetFromExternalRepresentation((void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("grammaticalCase")), &v6->_grammaticalCase) & 1) == 0|| (_NSGrammaticalPronounTypeGetFromExternalRepresentation((void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pronounType")), &v6->_pronounType) & 1) == 0)
  {
    goto LABEL_38;
  }
  v9 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("determination"));
  if (v9)
  {
    v10 = v9;
    if ((objc_msgSend(v9, "isEqual:", CFSTR("independent")) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      if ((objc_msgSend(v10, "isEqual:", CFSTR("dependent")) & 1) == 0)
        goto LABEL_38;
      v11 = 2;
    }
  }
  else
  {
    v11 = 0;
  }
  v6->_determination = v11;
  v12 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("definiteness"));
  if (v12)
  {
    v13 = v12;
    if ((objc_msgSend(v12, "isEqual:", CFSTR("indefinite")) & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      if ((objc_msgSend(v13, "isEqual:", CFSTR("definite")) & 1) == 0)
        goto LABEL_38;
      v14 = 2;
    }
  }
  else
  {
    v14 = 0;
  }
  v6->_definiteness = v14;
  v15 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("customPronouns"));
  if (!v15)
    return v6;
  v16 = (void *)v15;
  if ((_NSIsNSDictionary() & 1) == 0)
  {
LABEL_38:
    if (a4)
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3840, 0);
    goto LABEL_40;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
LABEL_25:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v19)
        objc_enumerationMutation(v16);
      v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v20);
      v22 = objc_msgSend(v16, "objectForKey:", v21);
      if (!_NSIsNSString() || (_NSIsNSDictionary() & 1) == 0)
        goto LABEL_38;
      if (+[NSMorphologyCustomPronoun isSupportedForLanguage:](NSMorphologyCustomPronoun, "isSupportedForLanguage:", v21))
      {
        v23 = -[NSMorphologyCustomPronoun _initWithExternalRepresentationDictionary:]([NSMorphologyCustomPronoun alloc], "_initWithExternalRepresentationDictionary:", v22);
        if (!v23)
          goto LABEL_38;
        v24 = v23;
        customPronouns = v6->_customPronouns;
        if (!customPronouns)
        {
          customPronouns = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v6->_customPronouns = customPronouns;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](customPronouns, "setObject:forKeyedSubscript:", v24, v21);

      }
      if (v18 == ++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
        if (v18)
          goto LABEL_25;
        return v6;
      }
    }
  }
  return v6;
}

- (id)_initWithExternalRepresentationDictionary:(id)a3
{
  NSMorphology *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSMutableDictionary *customPronouns;
  objc_super v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)NSMorphology;
  v4 = -[NSMorphology init](&v23, sel_init);
  if (!v4)
    return v4;
  if (!_NSGrammaticalGenderGetFromExternalRepresentation((void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("grammaticalGender")), &v4->_grammaticalGender)|| !_NSGrammaticalNumberGetFromExternalRepresentation((void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("number")), &v4->_number)|| !_NSGrammaticalPartOfSpeechGetFromExternalRepresentation((void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("partOfSpeech")), &v4->_partOfSpeech)|| !_NSGrammaticalCaseGetFromExternalRepresentation((void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("grammaticalCase")), &v4->_grammaticalCase)|| !_NSGrammaticalPronounTypeGetFromExternalRepresentation((void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("pronounType")), &v4->_pronounType))
  {
    goto LABEL_36;
  }
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("determination"));
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, "isEqual:", CFSTR("independent")) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqual:", CFSTR("dependent")))
        goto LABEL_36;
      v7 = 2;
    }
  }
  else
  {
    v7 = 0;
  }
  v4->_determination = v7;
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("definiteness"));
  if (v8)
  {
    v9 = v8;
    if ((objc_msgSend(v8, "isEqual:", CFSTR("indefinite")) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      if (!objc_msgSend(v9, "isEqual:", CFSTR("definite")))
        goto LABEL_36;
      v10 = 2;
    }
  }
  else
  {
    v10 = 0;
  }
  v4->_definiteness = v10;
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("customPronouns"));
  if (!v11)
    return v4;
  v12 = (void *)v11;
  if (!_NSIsNSDictionary())
  {
LABEL_36:

    return 0;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
LABEL_23:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v15)
        objc_enumerationMutation(v12);
      v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16);
      v18 = objc_msgSend(v12, "objectForKey:", v17);
      if (!_NSIsNSString() || !_NSIsNSDictionary())
        goto LABEL_36;
      if (+[NSMorphologyCustomPronoun isSupportedForLanguage:](NSMorphologyCustomPronoun, "isSupportedForLanguage:", v17))
      {
        v19 = -[NSMorphologyCustomPronoun _initWithExternalRepresentationDictionary:]([NSMorphologyCustomPronoun alloc], "_initWithExternalRepresentationDictionary:", v18);
        if (!v19)
          goto LABEL_36;
        v20 = v19;
        customPronouns = v4->_customPronouns;
        if (!customPronouns)
        {
          customPronouns = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v4->_customPronouns = customPronouns;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](customPronouns, "setObject:forKeyedSubscript:", v20, v17);

      }
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
        if (v14)
          goto LABEL_23;
        return v4;
      }
    }
  }
  return v4;
}

- (NSDictionary)_externalRepresentationDictionary
{
  id v3;
  unint64_t v4;
  __CFString *v5;
  unint64_t v6;
  __CFString *v7;
  unint64_t v8;
  __CFString *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NSMorphology grammaticalGender](self, "grammaticalGender"))
  {
    v4 = -[NSMorphology grammaticalGender](self, "grammaticalGender") - 1;
    if (v4 > 2)
      v5 = 0;
    else
      v5 = off_1E0F4CB88[v4];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("grammaticalGender"));
  }
  if (-[NSMorphology number](self, "number"))
  {
    v6 = -[NSMorphology number](self, "number") - 1;
    if (v6 > 5)
      v7 = 0;
    else
      v7 = off_1E0F4CBA0[v6];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("number"));
  }
  if (-[NSMorphology partOfSpeech](self, "partOfSpeech"))
  {
    v8 = -[NSMorphology partOfSpeech](self, "partOfSpeech") - 1;
    if (v8 > 0xD)
      v9 = 0;
    else
      v9 = off_1E0F4CBD0[v8];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("partOfSpeech"));
  }
  return (NSDictionary *)v3;
}

- (NSData)_externalRepresentation
{
  return +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", -[NSMorphology _externalRepresentationDictionary](self, "_externalRepresentationDictionary"), 0, 0);
}

- (NSMorphology)initWithInflection:(id)a3
{
  NSMorphology *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = -[NSMorphology init](self, "init");
  if (v4)
  {
    v5 = objc_msgSend(a3, "gender");
    if (v5 <= 3)
      -[NSMorphology setGrammaticalGender:](v4, "setGrammaticalGender:", qword_18218C0E8[v5]);
    v6 = objc_msgSend(a3, "number");
    if (v6 <= 6)
      -[NSMorphology setNumber:](v4, "setNumber:", qword_18218C108[v6]);
    v7 = objc_msgSend(a3, "englishCustomPronoun");
    if (v7)
      -[NSMorphology setCustomPronoun:forLanguage:error:](v4, "setCustomPronoun:forLanguage:error:", v7, CFSTR("en"), 0);
  }
  return v4;
}

- (int64_t)_clusivity
{
  return self->_clusivity;
}

- (void)set_clusivity:(int64_t)a3
{
  self->_clusivity = a3;
}

- (int64_t)_adjectival
{
  return self->_adjectival;
}

- (void)set_adjectival:(int64_t)a3
{
  self->_adjectival = a3;
}

- (void)applyPluralityRulesForNumbers:(id)a3 inLanguages:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const __CFNumber *v11;
  void *v12;
  int v13;
  NSString *v14;
  _BOOL4 v15;
  uint64_t valuePtr;
  _OWORD v17[20];
  char v18[168];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[NSMorphology number](self, "number") == NSGrammaticalNumberPlural)
    return;
  v7 = objc_msgSend(a3, "count");
  if (v7 < 1)
    goto LABEL_23;
  v8 = v7;
  v9 = 0;
  for (i = 0; i != v8; ++i)
  {
    v11 = (const __CFNumber *)objc_msgSend(a3, "objectAtIndexedSubscript:", i);
    v12 = (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", i);
    valuePtr = -1;
    if (CFNumberGetValue(v11, kCFNumberCFIndexType, &valuePtr))
    {
      if (v9)
        continue;
    }
    else
    {
      valuePtr = -1;
      if (v9)
        continue;
    }
    memset(v18, 0, 157);
    if ((objc_msgSend(v12, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v18, 157, 0, 4, 0, 0, objc_msgSend(v12, "length"), 0) & 1) == 0)strcpy(v18, "en");
    uplrules_open();
    memset(v17, 0, 314);
    -[__CFNumber doubleValue](v11, "doubleValue");
    v13 = uplrules_select();
    uplrules_close();
    v9 = 0;
    if (v13 >= 1)
    {
      v14 = -[NSString initWithCharactersNoCopy:length:freeWhenDone:]([NSString alloc], "initWithCharactersNoCopy:length:freeWhenDone:", v17, v13, 0);
      if (-[NSString isEqual:](v14, "isEqual:", CFSTR("one")))
      {
        v9 = 1;
LABEL_18:

        continue;
      }
      if (-[NSString isEqual:](v14, "isEqual:", CFSTR("two")))
      {
        v9 = 4;
        goto LABEL_18;
      }
      v15 = -[NSString isEqual:](v14, "isEqual:", CFSTR("other"));

      if (v15)
        v9 = 3;
      else
        v9 = 0;
    }
  }
  if (!v9)
LABEL_23:
    v9 = 3;
  if (-[NSMorphology number](self, "number"))
  {
    if (-[NSMorphology number](self, "number") != v9)
    {
      v9 = 3;
      goto LABEL_27;
    }
  }
  else
  {
LABEL_27:
    -[NSMorphology setNumber:](self, "setNumber:", v9);
  }
}

- (NSMorphology)initWithMorphunAttributeValues:(id)a3
{
  NSMorphology *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[24];
  _QWORD v24[26];

  v24[24] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)NSMorphology;
  v4 = -[NSMorphology init](&v13, sel_init);
  if (v4)
  {
    v23[0] = CFSTR("abbreviation");
    v23[1] = CFSTR("adjective");
    v24[0] = &unk_1E0FCED60;
    v24[1] = &unk_1E0FCED88;
    v23[2] = CFSTR("adverb");
    v23[3] = CFSTR("conjunction");
    v24[2] = &unk_1E0FCEDB0;
    v24[3] = &unk_1E0FCEDD8;
    v23[4] = CFSTR("interjection");
    v23[5] = CFSTR("letter");
    v24[4] = &unk_1E0FCEE00;
    v24[5] = &unk_1E0FCEE28;
    v24[6] = &unk_1E0FCEE50;
    v23[6] = CFSTR("noun");
    v23[7] = CFSTR("proper-noun");
    v21[0] = CFSTR("f");
    v21[1] = CFSTR("v");
    v22[0] = &off_1E0FBD830;
    v22[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 15);
    v24[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v24[8] = &unk_1E0FCEE78;
    v23[8] = CFSTR("number");
    v23[9] = CFSTR("particle");
    v24[9] = &unk_1E0FCEEA0;
    v24[10] = &unk_1E0FCEEC8;
    v23[10] = CFSTR("pronoun");
    v23[11] = CFSTR("verb");
    v24[11] = &unk_1E0FCEEF0;
    v24[12] = &unk_1E0FCEF18;
    v23[12] = CFSTR("feminine");
    v23[13] = CFSTR("masculine");
    v24[13] = &unk_1E0FCEF40;
    v24[14] = &unk_1E0FCEF68;
    v23[14] = CFSTR("neuter");
    v23[15] = CFSTR("common");
    v19[1] = CFSTR("v");
    v20[0] = &off_1E0FBD950;
    v19[0] = CFSTR("f");
    v20[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 4);
    v24[15] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v24[16] = &unk_1E0FCEF90;
    v23[16] = CFSTR("singular");
    v23[17] = CFSTR("plural");
    v24[17] = &unk_1E0FCEFB8;
    v24[18] = &unk_1E0FCEFE0;
    v23[18] = CFSTR("accusative");
    v23[19] = CFSTR("dative");
    v24[19] = &unk_1E0FCF008;
    v24[20] = &unk_1E0FCF030;
    v23[20] = CFSTR("genitive");
    v23[21] = CFSTR("locative");
    v24[21] = &unk_1E0FCF058;
    v24[22] = &unk_1E0FCF080;
    v23[22] = CFSTR("nominative");
    v23[23] = CFSTR("prepositional");
    v24[23] = &unk_1E0FCF0A8;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 24);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(a3);
          v10 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9));
          if (v10)
          {
            v11 = v10;
            switch(objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("f")), "unsignedIntegerValue"))
            {
              case 0:
                -[NSMorphology setPartOfSpeech:](v4, "setPartOfSpeech:", objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("v")), "unsignedIntegerValue"));
                break;
              case 1:
                -[NSMorphology setGrammaticalGender:](v4, "setGrammaticalGender:", objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("v")), "unsignedIntegerValue"));
                break;
              case 2:
                -[NSMorphology setNumber:](v4, "setNumber:", objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("v")), "unsignedIntegerValue"));
                break;
              case 4:
                -[NSMorphology setGrammaticalCase:](v4, "setGrammaticalCase:", objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("v")), "unsignedIntegerValue"));
                break;
              default:
                break;
            }
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v7);
    }
  }
  return v4;
}

- (BOOL)addConstraintsTo:(MDInflectableStringConcept *)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  __int128 v15;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  CFTypeRef v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = -[NSMorphology _morphunConstraints](self, "_morphunConstraints");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v6 = 138543874;
    v15 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
        v12 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", v11, v15);
        cf = 0;
        _MergedGlobals_109(a3, v11, v12, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1)
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          v13 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            v18 = v11;
            v19 = 2114;
            v20 = v12;
            v21 = 2114;
            v22 = cf;
            _os_log_impl(&dword_1817D9000, v13, OS_LOG_TYPE_INFO, "Unable to set constraint %{public}@=%{public}@: %{public}@", buf, 0x20u);
          }
          CFRelease(cf);
        }
        v8 |= objc_msgSend(v12, "isEqualToString:", CFSTR("pos")) ^ 1;
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8 & 1;
}

@end
