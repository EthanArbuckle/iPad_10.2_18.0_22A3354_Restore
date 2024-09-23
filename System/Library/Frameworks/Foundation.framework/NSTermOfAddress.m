@implementation NSTermOfAddress

- (BOOL)_isSupportedInLanguage:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSTermOfAddress *v7;
  Swift::String v8;

  v4 = (uint64_t)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = NSTermOfAddress.isSupportedInLanguage(_:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)_morphologyForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSTermOfAddress *v7;
  Swift::String v8;
  int8x16_t v9;
  uint64x2_t v10;
  int16x8_t v11;
  void *v12;
  __int16 v14;
  char v15;
  uint64_t v16;
  char v17;
  unsigned __int32 v18;
  __int16 v19;
  char v20;
  uint64_t v21;
  unsigned int v22;
  unsigned __int8 v23;
  Foundation::Morphology v24;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = (uint64_t)v4;
  v8._object = v6;
  NSTermOfAddress.morphologyForLanguage(_:)(v8);

  swift_bridgeObjectRelease();
  if (v21)
  {
    type metadata accessor for NSMorphologyPronoun(0, &lazy cache variable for type metadata for NSMorphology);
    v14 = v19;
    v15 = v20;
    v16 = v21;
    v17 = v22;
    v9.i64[0] = 0xFFFFFFFFFFLL;
    v9.i64[1] = 0xFFFFFFFFFFLL;
    v10 = (uint64x2_t)vandq_s8((int8x16_t)vdupq_n_s64(v22 | ((unint64_t)v23 << 32)), v9);
    v11 = (int16x8_t)vshlq_u64(v10, (uint64x2_t)xmmword_182064D90);
    *(int32x2_t *)v10.i8 = vmovn_s64((int64x2_t)vshlq_u64(v10, (uint64x2_t)xmmword_182064D80));
    *(int32x2_t *)v11.i8 = vmovn_s64((int64x2_t)v11);
    v11.i16[1] = v11.i16[2];
    v11.i16[2] = v10.i16[0];
    v11.i16[3] = v10.i16[2];
    v18 = vmovn_s16(v11).u32[0];
    *(_QWORD *)&v24.grammaticalGender.value = &v14;
    NSMorphology.init(_:)((NSMorphology *)v10.u32[1], v24);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (BOOL)_containsPronoun:(id)a3 withGrammemes:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSTermOfAddress *v10;
  Swift::String v11;

  v6 = (uint64_t)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = specialized static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  LOBYTE(v6) = NSTermOfAddress.containsPronoun(_:grammemes:)(v11, (Swift::OpaquePointer)v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (id)_withExtrapolatedPronouns
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSTermOfAddress *v30;
  NSTermOfAddress *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSTermOfAddress *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSTermOfAddress *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;

  v30 = self;
  TermOfAddress.init(_:)(v30, &v32);
  v26 = v33;
  v28 = v32;
  v22 = v35;
  v24 = v34;
  v2 = v36;
  v3 = v37;
  v4 = v38;
  v5 = (uint64_t)v39;
  v6 = v40;
  v7 = v41;
  v8 = v42;
  v9 = v43;
  v10 = v44;
  TermOfAddress.withExtrapolatedPronouns()((uint64_t)&v45);
  outlined consume of TermOfAddress._TermOfAddress(v28, v26, v24, v22, v2, v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = v57;
  if (v57 == 4)
    return 0;
  v14 = v55;
  v13 = v56;
  v15 = v54;
  v29 = v51;
  v31 = v52;
  v27 = v50;
  v23 = v53;
  v25 = v49;
  v17 = v47;
  v16 = v48;
  v19 = v45;
  v18 = v46;
  v32 = v45;
  v33 = v46;
  v34 = v47;
  v35 = v48;
  v36 = v49;
  v37 = v50;
  v38 = v51;
  v39 = v52;
  v40 = v53;
  v41 = v54;
  v42 = v55;
  v43 = v56;
  v44 = v57;
  TermOfAddress._bridgeToObjectiveC()(v52);
  v21 = v20;
  outlined consume of TermOfAddress?(v19, v18, v17, v16, v25, v27, v29, (uint64_t)v31, v23, v15, v14, v13, v11);
  return v21;
}

- (id)_initWithGender:(int64_t)a3 addressingUser:(BOOL)a4
{
  id result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSTermOfAddress;
  result = -[NSTermOfAddress init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a3;
    *((_QWORD *)result + 3) = 0;
    *((_QWORD *)result + 4) = 0;
    *((_BYTE *)result + 16) = a4;
  }
  return result;
}

- (id)_initWithPronouns:(id)a3 forLanguage:(id)a4
{
  NSTermOfAddress *v6;
  NSTermOfAddress *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSTermOfAddress;
  v6 = -[NSTermOfAddress init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_gender = 0;
    v6->_language = (NSString *)objc_msgSend(a4, "copy");
    v7->_pronouns = (NSArray *)objc_msgSend(a3, "copy");
    v7->_addressesCurrentUser = 0;
  }
  return v7;
}

+ (NSTermOfAddress)neutral
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__NSTermOfAddress_neutral__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD0A1A0 != -1)
    dispatch_once(&qword_1ECD0A1A0, v3);
  return (NSTermOfAddress *)_MergedGlobals_120;
}

uint64_t __26__NSTermOfAddress_neutral__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithGender:addressingUser:", 3, 0);
  _MergedGlobals_120 = result;
  return result;
}

+ (NSTermOfAddress)feminine
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__NSTermOfAddress_feminine__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD0A1B0 != -1)
    dispatch_once(&qword_1ECD0A1B0, v3);
  return (NSTermOfAddress *)qword_1ECD0A1A8;
}

uint64_t __27__NSTermOfAddress_feminine__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithGender:addressingUser:", 1, 0);
  qword_1ECD0A1A8 = result;
  return result;
}

+ (NSTermOfAddress)masculine
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__NSTermOfAddress_masculine__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD0A1C0 != -1)
    dispatch_once(&qword_1ECD0A1C0, v3);
  return (NSTermOfAddress *)qword_1ECD0A1B8;
}

uint64_t __28__NSTermOfAddress_masculine__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithGender:addressingUser:", 2, 0);
  qword_1ECD0A1B8 = result;
  return result;
}

+ (id)currentUser
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__NSTermOfAddress_currentUser__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD0A1D0 != -1)
    dispatch_once(&qword_1ECD0A1D0, v3);
  return (id)qword_1ECD0A1C8;
}

uint64_t __30__NSTermOfAddress_currentUser__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithGender:addressingUser:", 0, 1);
  qword_1ECD0A1C8 = result;
  return result;
}

+ (NSTermOfAddress)localizedForLanguageIdentifier:(NSString *)language withPronouns:(NSArray *)pronouns
{
  return (NSTermOfAddress *)-[NSTermOfAddress _initWithPronouns:forLanguage:]([NSTermOfAddress alloc], "_initWithPronouns:forLanguage:", pronouns, language);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSTermOfAddress;
  -[NSTermOfAddress dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (-[NSTermOfAddress isEqual:](self, "isEqual:", +[NSTermOfAddress neutral](NSTermOfAddress, "neutral")))
  {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p>{ neutral }"), objc_opt_class(), self, v6, v7);
  }
  if (-[NSTermOfAddress isEqual:](self, "isEqual:", +[NSTermOfAddress feminine](NSTermOfAddress, "feminine")))
  {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p>{ feminine }"), objc_opt_class(), self, v6, v7);
  }
  if (-[NSTermOfAddress isEqual:](self, "isEqual:", +[NSTermOfAddress masculine](NSTermOfAddress, "masculine")))
  {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p>{ masculine }"), objc_opt_class(), self, v6, v7);
  }
  v4 = -[NSTermOfAddress isEqual:](self, "isEqual:", +[NSTermOfAddress currentUser](NSTermOfAddress, "currentUser"));
  v5 = objc_opt_class();
  if (v4)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p>{ currentUser }"), v5, self, v6, v7);
  else
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p>{ languageIdentifier: %@, pronouns: %@ }"), v5, self, self->_language, self->_pronouns);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTermOfAddress)initWithCoder:(id)a3
{
  NSTermOfAddress *v4;
  uint64_t v5;
  char v6;
  id *p_language;
  uint64_t v8;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)NSTermOfAddress;
  v4 = -[NSTermOfAddress init](&v14, sel_init);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("Encoder does not allow keyed coding!");
    goto LABEL_13;
  }
  if (v4)
  {
    v5 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("termOfAddress"));
    v4->_gender = v5;
    if ((unint64_t)(v5 - 1) <= 2)
    {
      v4->_addressesCurrentUser = 0;
LABEL_6:
      v4->_language = 0;
      v4->_pronouns = 0;
      return v4;
    }
    v6 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("addressesUser"));
    v4->_addressesCurrentUser = v6;
    if ((v6 & 1) != 0)
      goto LABEL_6;
    v4->_language = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language")), "copy");
    p_language = (id *)&v4->_language;
    v8 = objc_msgSend((id)objc_msgSend(a3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("pronouns")), "copy");
    v4->_pronouns = (NSArray *)v8;
    if (!v4->_language || v8 == 0)
    {

      *p_language = 0;
      v4->_pronouns = 0;

      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      v13 = CFSTR("Could not decode language or pronouns for NSTermOfAddress");
LABEL_13:
      objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0));
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t gender;
  NSString *language;
  NSArray *pronouns;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Encoder does not allow keyed coding!"), 0));
  if (self->_addressesCurrentUser)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("addressesUser"));
  gender = self->_gender;
  if (gender)
    objc_msgSend(a3, "encodeInteger:forKey:", gender, CFSTR("termOfAddress"));
  language = self->_language;
  if (language)
    objc_msgSend(a3, "encodeObject:forKey:", language, CFSTR("language"));
  pronouns = self->_pronouns;
  if (pronouns)
    objc_msgSend(a3, "encodeObject:forKey:", pronouns, CFSTR("pronouns"));
}

- (unint64_t)hash
{
  unint64_t v3;
  NSString *language;
  NSArray *pronouns;

  v3 = self->_gender ^ objc_msgSend((id)objc_opt_class(), "hash") ^ self->_addressesCurrentUser;
  language = self->_language;
  if (language)
    v3 ^= -[NSString hash](language, "hash");
  pronouns = self->_pronouns;
  if (pronouns)
    v3 ^= -[NSArray hash](pronouns, "hash");
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  NSArray *pronouns;
  _BOOL4 v6;
  NSString *language;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && self->_gender == *((_QWORD *)a3 + 1)
    && self->_addressesCurrentUser == *((unsigned __int8 *)a3 + 16))
  {
    pronouns = self->_pronouns;
    if (pronouns == *((NSArray **)a3 + 4) || (v6 = -[NSArray isEqualToArray:](pronouns, "isEqualToArray:")))
    {
      language = self->_language;
      LOBYTE(v6) = language == *((NSString **)a3 + 3) || -[NSString isEqualToString:](language, "isEqualToString:");
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (NSString)languageIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)pronouns
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

@end
