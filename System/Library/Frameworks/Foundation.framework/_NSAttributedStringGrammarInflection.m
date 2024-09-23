@implementation _NSAttributedStringGrammarInflection

+ (_NSAttributedStringGrammarInflection)_currentGlobalUserInflectionIfAvailable
{
  NSObject *v2;
  uint64_t v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getpid();
  v4 = objc_msgSend(CFSTR("com.apple.morphology.internal"), "UTF8String");
  if (!sandbox_check())
    return +[_NSAttributedStringGrammarInflection _currentGlobalUserInflection](_NSAttributedStringGrammarInflection, "_currentGlobalUserInflection");
  if (_NSInflectionLog_onceToken != -1)
    dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
  v2 = _NSInflectionLog_log;
  if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v6 = objc_msgSend(CFSTR("com.apple.morphology.internal"), "UTF8String", v4);
    _os_log_debug_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEBUG, "Could not read values in %s: accessing these preferences requires user-preference-read or file-read-data sandbox access", buf, 0xCu);
  }
  return 0;
}

- (_NSAttributedStringGrammarInflection)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSAttributedStringGrammarInflection;
  return -[_NSAttributedStringGrammarInflection init](&v3, sel_init);
}

- (_NSAttributedStringGrammarInflection)initWithCoder:(id)a3
{
  _NSAttributedStringGrammarInflection *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v4 = -[_NSAttributedStringGrammarInflection initWithExternalRepresentation:error:](self, "initWithExternalRepresentation:error:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalRepresentation")), v6);
  if (!v4)
    objc_msgSend(a3, "failWithError:", v6[0]);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[_NSAttributedStringGrammarInflection externalRepresentation](self, "externalRepresentation"), CFSTR("externalRepresentation"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSAttributedStringGrammarInflection;
  -[_NSAttributedStringGrammarInflection dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NSAttributedStringGrammarInflection *v4;

  v4 = objc_alloc_init(_NSAttributedStringGrammarInflection);
  v4->_grammaticalCase = -[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase");
  v4->_gender = -[_NSAttributedStringGrammarInflection gender](self, "gender");
  v4->_number = -[_NSAttributedStringGrammarInflection number](self, "number");
  v4->_person = -[_NSAttributedStringGrammarInflection person](self, "person");
  v4->_context = -[_NSAttributedStringGrammarInflection context](self, "context");
  v4->_determinationType = -[_NSAttributedStringGrammarInflection determinationType](self, "determinationType");
  v4->_englishCustomPronoun = (NSMorphologyCustomPronoun *)-[NSMorphologyCustomPronoun copy](-[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun"), "copy");
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  v4 = -[_NSAttributedStringGrammarInflection context](self, "context");
  v5 = v4 ^ -[_NSAttributedStringGrammarInflection gender](self, "gender") ^ v3;
  v6 = -[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase");
  v7 = v6 ^ -[_NSAttributedStringGrammarInflection number](self, "number");
  v8 = v5 ^ v7 ^ -[_NSAttributedStringGrammarInflection person](self, "person");
  v9 = v8 ^ -[_NSAttributedStringGrammarInflection determinationType](self, "determinationType");
  if (-[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun"))
    v9 ^= -[NSMorphologyCustomPronoun hash](-[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun"), "hash");
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  NSMorphologyCustomPronoun *v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[_NSAttributedStringGrammarInflection context](self, "context");
  if (v5 != objc_msgSend(a3, "context"))
    return 0;
  v6 = -[_NSAttributedStringGrammarInflection gender](self, "gender");
  if (v6 != objc_msgSend(a3, "gender"))
    return 0;
  v7 = -[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase");
  if (v7 != objc_msgSend(a3, "grammaticalCase"))
    return 0;
  v8 = -[_NSAttributedStringGrammarInflection number](self, "number");
  if (v8 != objc_msgSend(a3, "number"))
    return 0;
  v9 = -[_NSAttributedStringGrammarInflection person](self, "person");
  if (v9 != objc_msgSend(a3, "person"))
    return 0;
  v10 = -[_NSAttributedStringGrammarInflection determinationType](self, "determinationType");
  if (v10 != objc_msgSend(a3, "determinationType"))
    return 0;
  v11 = -[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun");
  return v11 == (NSMorphologyCustomPronoun *)objc_msgSend(a3, "englishCustomPronoun")
      || -[NSMorphologyCustomPronoun isEqual:](-[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun"), "isEqual:", objc_msgSend(a3, "englishCustomPronoun"));
}

- (BOOL)isIdentity
{
  return !-[_NSAttributedStringGrammarInflection context](self, "context")
      && !-[_NSAttributedStringGrammarInflection gender](self, "gender")
      && !-[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase")
      && !-[_NSAttributedStringGrammarInflection number](self, "number")
      && !-[_NSAttributedStringGrammarInflection person](self, "person")
      && !-[_NSAttributedStringGrammarInflection determinationType](self, "determinationType")
      && -[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun") == 0;
}

- (NSMorphologyCustomPronoun)englishCustomPronoun
{
  return (NSMorphologyCustomPronoun *)(id)-[NSMorphologyCustomPronoun copy](self->_englishCustomPronoun, "copy");
}

- (_NSAttributedStringGrammarInflection)initWithMorphology:(id)a3
{
  _NSAttributedStringGrammarInflection *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_NSAttributedStringGrammarInflection;
  v4 = -[_NSAttributedStringGrammarInflection init](&v14, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "grammaticalGender");
    if (v5 <= 3)
      -[_NSAttributedStringGrammarInflection setGender:](v4, "setGender:", qword_1822CD150[v5]);
    v6 = objc_msgSend(a3, "number");
    if (v6 <= 6)
      -[_NSAttributedStringGrammarInflection setNumber:](v4, "setNumber:", qword_1822CD170[v6]);
    v7 = objc_msgSend(a3, "grammaticalCase") - 1;
    if (v7 > 0xC)
      v8 = 0;
    else
      v8 = qword_1822CD1A8[v7];
    -[_NSAttributedStringGrammarInflection setGrammaticalCase:](v4, "setGrammaticalCase:", v8);
    v9 = objc_msgSend(a3, "definiteness");
    v10 = 3;
    if (v9 != 1)
      v10 = 0;
    if (v9 == 2)
      v11 = 2;
    else
      v11 = v10;
    -[_NSAttributedStringGrammarInflection setDeterminationType:](v4, "setDeterminationType:", v11);
    v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "_customPronouns"), "allValues");
    if (objc_msgSend(v12, "count") == 1)
      v4->_englishCustomPronoun = (NSMorphologyCustomPronoun *)objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", 0), "copy");
  }
  return v4;
}

- (_NSAttributedStringGrammarInflection)initWithInflectionRule:(id)a3
{
  if (+[NSInflectionRule automaticRule](NSInflectionRule, "automaticRule") == a3)
    return -[_NSAttributedStringGrammarInflection init](self, "init");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[_NSAttributedStringGrammarInflection initWithInflectionRule:]", "NSAttributedString_Grammar.m", 450, "[inflectionRule isKindOfClass:NSInflectionRuleExplicit.class]");
  return -[_NSAttributedStringGrammarInflection initWithMorphology:](self, "initWithMorphology:", objc_msgSend(a3, "morphology"));
}

- (id)description
{
  NSMutableString *v3;

  v3 = +[NSString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ %p { "), objc_opt_class(), self);
  if (-[_NSAttributedStringGrammarInflection context](self, "context"))
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" context = %d;"),
      -[_NSAttributedStringGrammarInflection context](self, "context"));
  if (-[_NSAttributedStringGrammarInflection gender](self, "gender"))
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" gender = %d;"),
      -[_NSAttributedStringGrammarInflection gender](self, "gender"));
  if (-[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase"))
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" grammaticalCase = %d;"),
      -[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase"));
  if (-[_NSAttributedStringGrammarInflection number](self, "number"))
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" number = %d;"),
      -[_NSAttributedStringGrammarInflection number](self, "number"));
  if (-[_NSAttributedStringGrammarInflection person](self, "person"))
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" person = %d;"),
      -[_NSAttributedStringGrammarInflection person](self, "person"));
  if (-[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun"))
    -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(" English pronoun = %@;"),
      -[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun"));
  -[NSMutableString appendString:](v3, "appendString:", CFSTR("}>"));
  return (id)-[NSMutableString copy](v3, "copy");
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (int64_t)gender
{
  return self->_gender;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (int64_t)grammaticalCase
{
  return self->_grammaticalCase;
}

- (void)setGrammaticalCase:(int64_t)a3
{
  self->_grammaticalCase = a3;
}

- (int64_t)determinationType
{
  return self->_determinationType;
}

- (void)setDeterminationType:(int64_t)a3
{
  self->_determinationType = a3;
}

- (int64_t)number
{
  return self->_number;
}

- (void)setNumber:(int64_t)a3
{
  self->_number = a3;
}

- (int64_t)person
{
  return self->_person;
}

- (void)setPerson:(int64_t)a3
{
  self->_person = a3;
}

- (void)setEnglishCustomPronoun:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)_initWithMarkdownDictionary:(id)a3
{
  return -[_NSAttributedStringGrammarInflection initWithExternalRepresentationDictionary:error:](self, "initWithExternalRepresentationDictionary:error:", a3, 0);
}

- (_NSAttributedStringGrammarInflection)initWithExternalRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", a3, 0, a4);
  if (v6)
  {
    v7 = v6;
    if ((_NSIsNSDictionary() & 1) != 0)
      return -[_NSAttributedStringGrammarInflection initWithExternalRepresentationDictionary:error:](self, "initWithExternalRepresentationDictionary:error:", v7, a4);
    if (a4)
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3840, 0);
  }

  return 0;
}

- (_NSAttributedStringGrammarInflection)initWithExternalRepresentationDictionary:(id)a3 error:(id *)a4
{
  _NSAttributedStringGrammarInflection *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSMorphologyCustomPronoun *v30;
  objc_super v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)_NSAttributedStringGrammarInflection;
  v6 = -[_NSAttributedStringGrammarInflection init](&v32, sel_init);
  if (!v6)
    return v6;
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("context"));
  if (v7 && (v8 = v7, (objc_msgSend(v7, "isEqual:", CFSTR("none")) & 1) == 0))
  {
    if ((objc_msgSend(v8, "isEqual:", CFSTR("technicalTerm")) & 1) == 0)
      goto LABEL_80;
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  -[_NSAttributedStringGrammarInflection setContext:](v6, "setContext:", v9);
  v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("grammaticalGender"));
  if (v10 && (v11 = v10, (objc_msgSend(v10, "isEqual:", CFSTR("none")) & 1) == 0))
  {
    if ((objc_msgSend(v11, "isEqual:", CFSTR("masculine")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqual:", CFSTR("feminine")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqual:", CFSTR("neuter")) & 1) != 0)
    {
      v12 = 3;
    }
    else
    {
      if ((objc_msgSend(v11, "isEqual:", CFSTR("common")) & 1) == 0)
        goto LABEL_80;
      v12 = 4;
    }
  }
  else
  {
    v12 = 0;
  }
  -[_NSAttributedStringGrammarInflection setGender:](v6, "setGender:", v12);
  v13 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("grammaticalCase"));
  if (v13 && (v14 = v13, (objc_msgSend(v13, "isEqual:", CFSTR("none")) & 1) == 0))
  {
    if ((objc_msgSend(v14, "isEqual:", CFSTR("accusative")) & 1) != 0)
    {
      v15 = 1;
    }
    else if ((objc_msgSend(v14, "isEqual:", CFSTR("dative")) & 1) != 0)
    {
      v15 = 2;
    }
    else if ((objc_msgSend(v14, "isEqual:", CFSTR("genitive")) & 1) != 0)
    {
      v15 = 3;
    }
    else if ((objc_msgSend(v14, "isEqual:", CFSTR("locative")) & 1) != 0)
    {
      v15 = 4;
    }
    else if ((objc_msgSend(v14, "isEqual:", CFSTR("nominative")) & 1) != 0)
    {
      v15 = 5;
    }
    else if ((objc_msgSend(v14, "isEqual:", CFSTR("partitive")) & 1) != 0)
    {
      v15 = 6;
    }
    else if ((objc_msgSend(v14, "isEqual:", CFSTR("instrumental")) & 1) != 0)
    {
      v15 = 7;
    }
    else if ((objc_msgSend(v14, "isEqual:", CFSTR("prepositional")) & 1) != 0)
    {
      v15 = 8;
    }
    else if ((objc_msgSend(v14, "isEqual:", CFSTR("object")) & 1) != 0)
    {
      v15 = 9;
    }
    else if ((objc_msgSend(v14, "isEqual:", CFSTR("directObject")) & 1) != 0)
    {
      v15 = 10;
    }
    else
    {
      if ((objc_msgSend(v14, "isEqual:", CFSTR("indirectObject")) & 1) == 0)
        goto LABEL_80;
      v15 = 11;
    }
  }
  else
  {
    v15 = 0;
  }
  -[_NSAttributedStringGrammarInflection setGrammaticalCase:](v6, "setGrammaticalCase:", v15);
  v16 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("number"));
  if (v16 && (v17 = v16, (objc_msgSend(v16, "isEqual:", CFSTR("none")) & 1) == 0))
  {
    if ((objc_msgSend(v17, "isEqual:", CFSTR("one")) & 1) != 0)
    {
      v18 = 1;
    }
    else if ((objc_msgSend(v17, "isEqual:", CFSTR("two")) & 1) != 0)
    {
      v18 = 2;
    }
    else if ((objc_msgSend(v17, "isEqual:", CFSTR("few")) & 1) != 0)
    {
      v18 = 3;
    }
    else if ((objc_msgSend(v17, "isEqual:", CFSTR("many")) & 1) != 0)
    {
      v18 = 4;
    }
    else if ((objc_msgSend(v17, "isEqual:", CFSTR("zero")) & 1) != 0)
    {
      v18 = 5;
    }
    else
    {
      if ((objc_msgSend(v17, "isEqual:", CFSTR("other")) & 1) == 0)
        goto LABEL_80;
      v18 = 6;
    }
  }
  else
  {
    v18 = 0;
  }
  -[_NSAttributedStringGrammarInflection setNumber:](v6, "setNumber:", v18);
  v19 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("person"));
  if (!v19 || (v20 = v19, (objc_msgSend(v19, "isEqual:", CFSTR("none")) & 1) != 0))
  {
    v21 = 0;
LABEL_17:
    -[_NSAttributedStringGrammarInflection setPerson:](v6, "setPerson:", v21);
    v22 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("customPronouns"));
    if (_NSIsNSDictionary() && objc_msgSend(v22, "count"))
    {
      v23 = objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("en"));
      if (!v23)
        goto LABEL_80;
      v24 = (void *)v23;
      if (!_NSIsNSDictionary())
        goto LABEL_80;
      v25 = objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("subjectForm"));
      v26 = objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("objectForm"));
      v27 = objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("possessiveForm"));
      v28 = objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("possessiveAdjectiveForm"));
      v29 = objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("reflexiveForm"));
      if (!_NSIsNSString())
        goto LABEL_80;
      if (!_NSIsNSString())
        goto LABEL_80;
      if (!_NSIsNSString())
        goto LABEL_80;
      if (!_NSIsNSString())
        goto LABEL_80;
      if (!_NSIsNSString())
        goto LABEL_80;
      v30 = objc_alloc_init(NSMorphologyCustomPronoun);
      -[NSMorphologyCustomPronoun setSubjectForm:](v30, "setSubjectForm:", v25);
      -[NSMorphologyCustomPronoun setObjectForm:](v30, "setObjectForm:", v26);
      -[NSMorphologyCustomPronoun setPossessiveForm:](v30, "setPossessiveForm:", v27);
      -[NSMorphologyCustomPronoun setPossessiveAdjectiveForm:](v30, "setPossessiveAdjectiveForm:", v28);
      -[NSMorphologyCustomPronoun setReflexiveForm:](v30, "setReflexiveForm:", v29);
      if (!v30)
        goto LABEL_80;
    }
    else
    {
      v30 = 0;
    }
    v6->_englishCustomPronoun = v30;
    return v6;
  }
  if ((objc_msgSend(v20, "isEqual:", CFSTR("first")) & 1) != 0)
  {
    v21 = 1;
    goto LABEL_17;
  }
  if ((objc_msgSend(v20, "isEqual:", CFSTR("second")) & 1) != 0)
  {
    v21 = 2;
    goto LABEL_17;
  }
  if ((objc_msgSend(v20, "isEqual:", CFSTR("third")) & 1) != 0)
  {
    v21 = 3;
    goto LABEL_17;
  }
LABEL_80:
  if (a4)
    *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3840, 0);

  return 0;
}

- (NSDictionary)externalRepresentationDictionary
{
  NSDictionary *v3;
  const __CFString *v4;
  int64_t v5;
  __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  unint64_t v9;
  __CFString *v10;
  unint64_t v11;
  __CFString *v12;
  NSMorphologyCustomPronoun *v13;
  uint64_t v14;
  _QWORD v16[5];
  _QWORD v17[5];
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[_NSAttributedStringGrammarInflection context](self, "context") == 1)
    v4 = CFSTR("technicalTerm");
  else
    v4 = 0;
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("context"));
  v5 = -[_NSAttributedStringGrammarInflection gender](self, "gender");
  v6 = 0;
  if ((unint64_t)(v5 - 1) <= 3)
    v6 = off_1E0F51BB8[v5 - 1];
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CFSTR("grammaticalGender"));
  v7 = -[_NSAttributedStringGrammarInflection grammaticalCase](self, "grammaticalCase") - 1;
  if (v7 > 0xA)
    v8 = 0;
  else
    v8 = off_1E0F51BD8[v7];
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, CFSTR("grammaticalCase"));
  v9 = -[_NSAttributedStringGrammarInflection number](self, "number") - 1;
  if (v9 > 5)
    v10 = 0;
  else
    v10 = off_1E0F51C30[v9];
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, CFSTR("number"));
  v11 = -[_NSAttributedStringGrammarInflection person](self, "person") - 1;
  if (v11 > 2)
    v12 = 0;
  else
    v12 = off_1E0F51C60[v11];
  -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, CFSTR("person"));
  v13 = -[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun");
  if (-[NSMorphologyCustomPronoun subjectForm](v13, "subjectForm"))
  {
    if (-[NSMorphologyCustomPronoun objectForm](v13, "objectForm"))
    {
      if (-[NSMorphologyCustomPronoun possessiveForm](v13, "possessiveForm"))
      {
        if (-[NSMorphologyCustomPronoun possessiveAdjectiveForm](v13, "possessiveAdjectiveForm"))
        {
          if (-[NSMorphologyCustomPronoun reflexiveForm](v13, "reflexiveForm"))
          {
            v18 = CFSTR("en");
            v16[0] = CFSTR("subjectForm");
            v17[0] = -[NSMorphologyCustomPronoun subjectForm](v13, "subjectForm");
            v16[1] = CFSTR("objectForm");
            v17[1] = -[NSMorphologyCustomPronoun objectForm](v13, "objectForm");
            v16[2] = CFSTR("possessiveForm");
            v17[2] = -[NSMorphologyCustomPronoun possessiveForm](v13, "possessiveForm");
            v16[3] = CFSTR("possessiveAdjectiveForm");
            v17[3] = -[NSMorphologyCustomPronoun possessiveAdjectiveForm](v13, "possessiveAdjectiveForm");
            v16[4] = CFSTR("reflexiveForm");
            v17[4] = -[NSMorphologyCustomPronoun reflexiveForm](v13, "reflexiveForm");
            v19[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
            v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
            if (v14)
              -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, CFSTR("customPronouns"));
          }
        }
      }
    }
  }
  return v3;
}

- (NSData)externalRepresentation
{
  return +[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", -[_NSAttributedStringGrammarInflection externalRepresentationDictionary](self, "externalRepresentationDictionary"), 2, 0);
}

+ (_NSAttributedStringGrammarInflection)userInflection
{
  return -[_NSAttributedStringGrammarInflection initWithMorphology:]([_NSAttributedStringGrammarInflection alloc], "initWithMorphology:", +[NSMorphology _userMorphologyWithOverrides]());
}

+ (_NSAttributedStringGrammarInflection)_currentGlobalUserInflection
{
  void *v2;
  _NSAttributedStringGrammarInflection *v3;

  v2 = (void *)CFPreferencesCopyValue(CFSTR("AppleUserMorphology"), CFSTR("com.apple.morphology.internal"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (_NSIsNSDictionary())
    v3 = (_NSAttributedStringGrammarInflection *)-[_NSAttributedStringGrammarInflection _initWithMarkdownDictionary:]([_NSAttributedStringGrammarInflection alloc], "_initWithMarkdownDictionary:", v2);
  else
    v3 = 0;

  return v3;
}

+ (void)_addGlobalUserInflectionObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "addObserver:forKeyPath:options:context:", a3, CFSTR("AppleUserMorphology"), a4, a5);
}

+ (void)_removeGlobalUserInflectionObserver:(id)a3 context:(void *)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "removeObserver:forKeyPath:context:", a3, CFSTR("AppleUserMorphology"), a4);
}

- (void)_setAsGlobalUserInflection
{
  id v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  CFPropertyListRef v7;
  const void *v8;
  const __CFString *v9;

  v2 = -[_NSAttributedStringGrammarInflection _markupDictionary](self, "_markupDictionary");
  v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B230];
  _CFPreferencesSetFileProtectionClass();
  _CFPreferencesSetFileProtectionClass();
  if (qword_1ECD0A400)
    v5 = (const __CFString *)qword_1ECD0A400;
  else
    v5 = CFSTR("com.apple.morphology.internal");
  CFPreferencesSetValue(CFSTR("AppleUserMorphology"), v2, v5, v3, v4);
  if (qword_1ECD0A400)
    v6 = (const __CFString *)qword_1ECD0A400;
  else
    v6 = CFSTR("com.apple.morphology.internal");
  v7 = CFPreferencesCopyValue(CFSTR("AppleUserMorphologyAllowThirdPartyAccess"), v6, v3, v4);
  if (v7)
  {
    v8 = v7;
    if (CFEqual(v7, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
    {
      if (qword_1ECD0A408)
        v9 = (const __CFString *)qword_1ECD0A408;
      else
        v9 = CFSTR("com.apple.morphology");
      CFPreferencesSetValue(CFSTR("AppleUserMorphology"), v2, v9, v3, v4);
    }
    CFRelease(v8);
  }
  +[NSMorphology _clearCachedUserMorphology](NSMorphology, "_clearCachedUserMorphology");
}

+ (BOOL)_thirdPartyApplicationsCanAccessUserInflection
{
  const __CFString *v2;
  void *v3;
  char v4;

  if (qword_1ECD0A400)
    v2 = (const __CFString *)qword_1ECD0A400;
  else
    v2 = CFSTR("com.apple.morphology.internal");
  v3 = (void *)CFPreferencesCopyValue(CFSTR("AppleUserMorphologyAllowThirdPartyAccess"), v2, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v4 = objc_msgSend(v3, "isEqual:", MEMORY[0x1E0C9AAB0]);

  return v4;
}

+ (void)_setThirdPartyApplicationsCanAccessUserInflection:(BOOL)a3
{
  _BOOL8 v3;
  const __CFString *v4;
  const __CFString *v5;
  NSNumber *v6;
  const __CFString *v7;
  const __CFString *v8;
  CFPropertyListRef v9;
  const void *v10;
  const __CFString *v11;
  const __CFString *v12;

  v3 = a3;
  v4 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B230];
  _CFPreferencesSetFileProtectionClass();
  _CFPreferencesSetFileProtectionClass();
  v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3);
  if (qword_1ECD0A400)
    v7 = (const __CFString *)qword_1ECD0A400;
  else
    v7 = CFSTR("com.apple.morphology.internal");
  CFPreferencesSetValue(CFSTR("AppleUserMorphologyAllowThirdPartyAccess"), v6, v7, v4, v5);
  if (v3)
  {
    if (qword_1ECD0A400)
      v8 = (const __CFString *)qword_1ECD0A400;
    else
      v8 = CFSTR("com.apple.morphology.internal");
    v9 = CFPreferencesCopyValue(CFSTR("AppleUserMorphology"), v8, v4, v5);
    if (v9)
    {
      v10 = v9;
      if (qword_1ECD0A408)
        v11 = (const __CFString *)qword_1ECD0A408;
      else
        v11 = CFSTR("com.apple.morphology");
      CFPreferencesSetValue(CFSTR("AppleUserMorphology"), v9, v11, v4, v5);
      CFRelease(v10);
    }
  }
  else
  {
    if (qword_1ECD0A408)
      v12 = (const __CFString *)qword_1ECD0A408;
    else
      v12 = CFSTR("com.apple.morphology");
    CFPreferencesSetValue(CFSTR("AppleUserMorphology"), 0, v12, v4, v5);
  }
}

- (void)_useInsteadOfUserInflectionInBlock:(id)a3
{
  NSMorphology *v4;

  v4 = -[NSMorphology initWithInflection:]([NSMorphology alloc], "initWithInflection:", self);
  -[NSMorphology _overrideUserInflectionInBlock:](v4, (uint64_t)a3);

}

+ (void)_usePreferencesDomainForFirstParty:(id)a3 thirdParty:(id)a4 simulateLockedDevice:(BOOL)a5 simulateThirdPartyProcess:(BOOL)a6 withinBlock:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  __int16 v10;

  v8 = qword_1ECD0A400;
  v9 = qword_1ECD0A408;
  v10 = _MergedGlobals_139;
  qword_1ECD0A400 = (uint64_t)a3;
  qword_1ECD0A408 = (uint64_t)a4;
  LOBYTE(_MergedGlobals_139) = a5;
  HIBYTE(_MergedGlobals_139) = a6;
  +[NSMorphology _clearCachedUserMorphology](NSMorphology, "_clearCachedUserMorphology");
  (*((void (**)(id))a7 + 2))(a7);
  qword_1ECD0A400 = v8;
  qword_1ECD0A408 = v9;
  _MergedGlobals_139 = v10;
  +[NSMorphology _clearCachedUserMorphology](NSMorphology, "_clearCachedUserMorphology");
}

+ (NSString)_protectedPreferencesDomain
{
  if (qword_1ECD0A400)
    return (NSString *)qword_1ECD0A400;
  else
    return (NSString *)CFSTR("com.apple.morphology.internal");
}

+ (NSString)_thirdPartyPreferencesDomain
{
  if (qword_1ECD0A408)
    return (NSString *)qword_1ECD0A408;
  else
    return (NSString *)CFSTR("com.apple.morphology");
}

+ (BOOL)_isSimulatingLockedDevice
{
  return _MergedGlobals_139;
}

+ (BOOL)_isSimulatingThirdPartyProcess
{
  return HIBYTE(_MergedGlobals_139);
}

- (id)_initWithGender:(int64_t)a3
{
  _NSAttributedStringGrammarInflection *v4;
  _NSAttributedStringGrammarInflection *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_NSAttributedStringGrammarInflection;
  v4 = -[_NSAttributedStringGrammarInflection init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[_NSAttributedStringGrammarInflection setGender:](v4, "setGender:", a3);
  return v5;
}

+ (NSArray)presetInflections
{
  if (qword_1ECD0A418 != -1)
    dispatch_once(&qword_1ECD0A418, &__block_literal_global_64);
  return (NSArray *)qword_1ECD0A410;
}

+ (BOOL)canSelectCustomInflection
{
  return 0;
}

- (NSString)localizedShortDescription
{
  NSMorphologyCustomPronoun *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v7;
  void *v8;
  const __CFString *v9;

  v3 = -[_NSAttributedStringGrammarInflection englishCustomPronoun](self, "englishCustomPronoun");
  v4 = -[NSMorphologyCustomPronoun subjectForm](v3, "subjectForm");
  v5 = -[NSMorphologyCustomPronoun objectForm](v3, "objectForm");
  if (v4 && v5)
    return +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("[CUSTOM PRONOUN] %@/%@"), &stru_1E0F56070, CFSTR("Morphology")), v4, v5);
  v7 = -[_NSAttributedStringGrammarInflection gender](self, "gender");
  switch(v7)
  {
    case 1:
      v8 = (void *)_NSFoundationBundle();
      v9 = CFSTR("Masculine");
      break;
    case 3:
      v8 = (void *)_NSFoundationBundle();
      v9 = CFSTR("Neutral");
      break;
    case 2:
      v8 = (void *)_NSFoundationBundle();
      v9 = CFSTR("Feminine");
      break;
    default:
      v8 = (void *)_NSFoundationBundle();
      v9 = CFSTR("Not Specified");
      break;
  }
  return (NSString *)objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_1E0F56070, CFSTR("Morphology"));
}

+ (BOOL)_canSelectUserInflectionWithPreferredLanguages:(id)a3
{
  return (unint64_t)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "length") >= 2
      && objc_msgSend(&unk_1E0FCEB90, "containsObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "substringToIndex:", 2), "lowercaseString"))&& _NSRequiresMorphunInflectionForLanguageIdentifier((void *)objc_msgSend(a3, "firstObject"));
}

+ (BOOL)canSelectUserInflection
{
  return objc_msgSend(a1, "_canSelectUserInflectionWithPreferredLanguages:", objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages"));
}

@end
