@implementation NSPersonNameComponentsFormatter

+ (BOOL)_shortNameIsEnabled
{
  void *v2;

  objc_msgSend(a1, "__registerDefaults");
  if (_overriddenSettings
    && (v2 = (void *)objc_msgSend((id)_overriddenSettings, "objectForKeyedSubscript:", CFSTR("NSPersonNameDefaultShortNameEnabled"))) != 0)
  {
    return objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSPersonNameDefaultShortNameEnabled"));
  }
}

+ (unint64_t)__inferredScriptIndexForComponents:(id)a3 ignoreUndeterminedComponents:(BOOL)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = +[NSPersonNameComponents _allComponents](NSPersonNameComponents, "_allComponents");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v7);
      v13 = (void *)objc_msgSend(a1, "__stringByStrippingNonInitialPunctuationFromString:", objc_msgSend(a3, "valueForKeyPath:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i)));
      if (v13)
      {
        v14 = v13;
        if (objc_msgSend(v13, "length"))
        {
          v15 = objc_msgSend(a1, "__inferredScriptIndexFromString:", v14);
          v16 = v15 == 1 && a4;
          if (v15 && !v16)
          {
            if (v10 == v15 || v10 == 0)
              v10 = v15;
            else
              v10 = 1;
          }
        }
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  }
  while (v9);
  return v10;
}

+ (id)__stringByStrippingNonInitialPunctuationFromString:(id)a3
{
  uint64_t v4;
  BOOL v5;

  if (qword_1ECD09A88 != -1)
    dispatch_once(&qword_1ECD09A88, &__block_literal_global_279);
  if (objc_msgSend(a3, "length")
    && (!objc_msgSend(a3, "rangeOfCharacterFromSet:", qword_1ECD09A80) ? (v5 = v4 == 0) : (v5 = 1), v5))
  {
    return (id)objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByCharactersInSet:", qword_1ECD09A80), "componentsJoinedByString:", &stru_1E0F56070);
  }
  else
  {
    return a3;
  }
}

- (int64_t)__computedNameOrderForComponents:(id)a3
{
  int v5;
  int64_t result;

  v5 = objc_msgSend(a3, "_isEmpty");
  if (!a3 || v5)
    return -[NSPersonNameComponentsFormatter __localizedNameOrderUsingNativeOrdering:](self, "__localizedNameOrderUsingNativeOrdering:", 1);
  if (!+[NSPersonNameComponentsFormatter _isCJKScript:](NSPersonNameComponentsFormatter, "_isCJKScript:", a3))
  {
    if (-[NSPersonNameComponentsFormatter _preferredLocalizationForExplicitlySetLocale](self, "_preferredLocalizationForExplicitlySetLocale"))
    {
      result = +[NSPersonNameComponentsFormatter __nameOrderForLocalization:usingNativeOrdering:](NSPersonNameComponentsFormatter, "__nameOrderForLocalization:usingNativeOrdering:", -[NSPersonNameComponentsFormatter _preferredLocalizationForExplicitlySetLocale](self, "_preferredLocalizationForExplicitlySetLocale"), 1);
      if (result)
        goto LABEL_8;
    }
    if (!-[NSPersonNameComponentsFormatter _forceFamilyNameFirst](self, "_forceFamilyNameFirst"))
    {
      if (-[NSPersonNameComponentsFormatter _forceGivenNameFirst](self, "_forceGivenNameFirst"))
      {
        result = 1;
      }
      else
      {
        result = +[NSPersonNameComponentsFormatter _defaultDisplayNameOrder](NSPersonNameComponentsFormatter, "_defaultDisplayNameOrder");
        if (!result)
          result = -[NSPersonNameComponentsFormatter __localizedNameOrderUsingNativeOrdering:](self, "__localizedNameOrderUsingNativeOrdering:", 0);
      }
      goto LABEL_8;
    }
  }
  result = 2;
LABEL_8:
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (NSString)_preferredLocalizationForExplicitlySetLocale
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSString copy](self->__preferredLocalizationForExplicitlySetLocale, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

+ (int64_t)_defaultDisplayNameOrder
{
  void *v2;

  objc_msgSend(a1, "__registerDefaults");
  if (_overriddenSettings
    && (v2 = (void *)objc_msgSend((id)_overriddenSettings, "objectForKeyedSubscript:", CFSTR("NSPersonNameDefaultDisplayNameOrder"))) != 0)
  {
    return objc_msgSend(v2, "integerValue");
  }
  else
  {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", CFSTR("NSPersonNameDefaultDisplayNameOrder"));
  }
}

+ (void)__registerDefaults
{
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__NSPersonNameComponentsFormatter___registerDefaults__block_invoke;
  v2[3] = &unk_1E0F4D2D8;
  v2[4] = a1;
  if (__registerDefaults_onceToken != -1)
    dispatch_once(&__registerDefaults_onceToken, v2);
}

+ (BOOL)_isCJKScript:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(a3, "_scriptDeterminingStringRepresentationWithPhoneticDesired:", 0);
  v5 = objc_msgSend(v4, "length");
  if (v5)
    LOBYTE(v5) = objc_msgSend(+[NSPersonNameComponentsFormatter _cjkLanguagesSet](NSPersonNameComponentsFormatter, "_cjkLanguagesSet"), "containsObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "__inferredScriptIndexFromString:", v4)));
  return v5;
}

- (BOOL)_forceGivenNameFirst
{
  NSPersonNameComponentsFormatter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = objc_msgSend(v2->_private, "forceGivenNameFirst");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_forceFamilyNameFirst
{
  NSPersonNameComponentsFormatter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = objc_msgSend(v2->_private, "forceFamilyNameFirst");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (id)_cjkLanguagesSet
{
  if (qword_1ECD09A98 != -1)
    dispatch_once(&qword_1ECD09A98, &__block_literal_global_283);
  return (id)qword_1ECD09A90;
}

+ (unint64_t)__inferredScriptIndexFromString:(id)a3
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend((id)objc_msgSend(a1, "__stringByStrippingNonInitialPunctuationFromString:", a3), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E0F56070);
  v4 = objc_msgSend(v3, "length");
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v11 - v6;
  if (v8 > 0x100)
    v7 = (char *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
  else
    bzero((char *)v11 - v6, 2 * v5);
  objc_msgSend(v3, "getCharacters:range:", v7, 0, objc_msgSend(v3, "length"));
  v9 = NSOrthographyScriptIndexForCharacters((uint64_t)v7, objc_msgSend(v3, "length"), 0);
  if (v4 >= 0x101)
    free(v7);
  return v9;
}

id __73__NSPersonNameComponentsFormatter__preferredLocalizationForCurrentLocale__block_invoke()
{
  id result;

  result = +[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:](NSPersonNameComponentsFormatter, "_preferredLocalizationFromLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale"));
  qword_1ECD09A28 = (uint64_t)result;
  return result;
}

id __50__NSPersonNameComponentsFormatter___currentLocale__block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  qword_1ECD09A18 = (uint64_t)result;
  return result;
}

uint64_t __53__NSPersonNameComponentsFormatter___registerDefaults__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_preferredLocalizationFromLocale:", objc_msgSend(*(id *)(a1 + 32), "__currentLocale"));
  v3 = objc_msgSend(*(id *)(a1 + 32), "__style:isRestrictedForLocalization:", 1, v2) ^ 1;
  v4 = objc_msgSend(*(id *)(a1 + 32), "__shortNameFormatForLocalization:", v2);
  v5 = objc_msgSend(*(id *)(a1 + 32), "__nameOrderForLocalization:usingNativeOrdering:", v2, 0);
  v8[0] = MEMORY[0x1E0C9AAB0];
  v7[0] = CFSTR("NSPersonNameDefaultShouldPreferNicknamesPreference");
  v7[1] = CFSTR("NSPersonNameDefaultShortNameEnabled");
  v8[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3);
  v7[2] = CFSTR("NSPersonNameDefaultShortNameFormat");
  v8[2] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4);
  v7[3] = CFSTR("NSPersonNameDefaultDisplayNameOrder");
  v8[3] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  return _CFXPreferencesRegisterDefaultValues();
}

+ (id)_preferredLocalizationFromLocale:(id)a3
{
  uint64_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend(&unk_1E0FCFAD0, "objectForKeyedSubscript:", CFSTR("localeInfo")), "allKeys");
  v6[0] = objc_msgSend(a3, "localeIdentifier");
  return -[NSArray objectAtIndexedSubscript:](+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v4, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1)), "objectAtIndexedSubscript:", 0);
}

+ (int64_t)__shortNameFormatForLocalization:(id)a3
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "__supportedNameDefaultsFromLocalization:", a3), "objectForKeyedSubscript:", CFSTR("shortNameStyle")), "integerValue");
}

+ (int64_t)__nameOrderForLocalization:(id)a3 usingNativeOrdering:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(a1, "__supportedNameDefaultsFromLocalization:", a3);
  v6 = v5;
  if (a4 || (v7 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nameOrderForNonNativeScripts"))) == 0)
    v7 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nameOrder"));
  return objc_msgSend(v7, "integerValue");
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  _QWORD *v6;
  uint64_t v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithData:", self->_private);
  v7 = objc_msgSend(self->_private, "locale");
  if (v7)
    v6[2] = objc_msgSend(+[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:](NSPersonNameComponentsFormatter, "_preferredLocalizationFromLocale:", v7), "copy");
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSPersonNameComponentsFormatter)initWithData:(id)a3
{
  NSPersonNameComponentsFormatter *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSPersonNameComponentsFormatter;
  v4 = -[NSPersonNameComponentsFormatter init](&v6, sel_init);
  if (v4)
  {
    v4->_private = (id)objc_msgSend(a3, "copy");
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (NSString)stringFromPersonNameComponents:(NSPersonNameComponents *)components
{
  NSString *result;

  if (!components)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSPersonNameComponentsFormatter.m"), 1749, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("components != nil"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSPersonNameComponentsFormatter.m"), 1750, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[components isKindOfClass:STATIC_CLASS_REF(NSPersonNameComponents)]"));
  result = (NSString *)objc_msgSend(+[NSPersonNameComponentsFormatter _styleFormatterForStyle:masterFormatter:](NSPersonNameComponentsFormatter, "_styleFormatterForStyle:masterFormatter:", -[NSPersonNameComponentsFormatter style](self, "style"), self), "stringFromComponents:attributesByRange:", components, 0);
  if (!result)
  {
    if (qword_1ECD09AB0 != -1)
      dispatch_once(&qword_1ECD09AB0, &__block_literal_global_1108);
    if (byte_1ECD09A11)
      return (NSString *)&stru_1E0F56070;
    else
      return 0;
  }
  return result;
}

- (BOOL)__localizedRestrictionExistsForComponents:(id)a3 ignoreUndeterminedComponents:(BOOL)a4
{
  return +[NSPersonNameComponentsFormatter __style:isRestrictedForScript:](NSPersonNameComponentsFormatter, "__style:isRestrictedForScript:", -[NSPersonNameComponentsFormatter style](self, "style"), +[NSPersonNameComponentsFormatter __inferredScriptIndexForComponents:ignoreUndeterminedComponents:](NSPersonNameComponentsFormatter, "__inferredScriptIndexForComponents:ignoreUndeterminedComponents:", a3, a4));
}

- (NSPersonNameComponentsFormatterStyle)style
{
  os_unfair_lock_s *p_lock;
  NSPersonNameComponentsFormatterStyle v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_msgSend(self->_private, "style");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isPhonetic
{
  NSPersonNameComponentsFormatter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = objc_msgSend(v2->_private, "phonetic");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_ignoresFallbacks
{
  NSPersonNameComponentsFormatter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = objc_msgSend(v2->_private, "ignoresFallbacks");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (id)__givenNameFirstOrdering
{
  if (qword_1ECD09A58 != -1)
    dispatch_once(&qword_1ECD09A58, &__block_literal_global_267);
  return (id)qword_1ECD09A50;
}

+ (BOOL)__style:(int64_t)a3 isRestrictedForLocalization:(id)a4
{
  void *v6;
  uint64_t v7;

  v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "__supportedNameDefaultsFromLocalization:", a4), "objectForKeyedSubscript:", CFSTR("styleRestrictions"));
  v7 = objc_msgSend(a1, "__stringValueForStyle:", a3);
  return v6 && objc_msgSend(v6, "objectForKeyedSubscript:", v7) != 0;
}

+ (BOOL)__style:(int64_t)a3 isRestrictedForScript:(unint64_t)a4
{
  void *v6;
  uint64_t v7;

  v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "__supportedScriptDefaultsFromScriptName:", objc_msgSend(a1, "__scriptIdentifierFromIndex:", a4)), "objectForKeyedSubscript:", CFSTR("styleRestrictions"));
  v7 = objc_msgSend(a1, "__stringValueForStyle:", a3);
  return v6 && objc_msgSend(v6, "objectForKeyedSubscript:", v7) != 0;
}

+ (id)__stringValueForStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_1E0F55810[a3];
}

+ (id)__supportedScriptDefaultsFromScriptName:(id)a3
{
  if (a3)
    return (id)objc_msgSend((id)objc_msgSend(&unk_1E0FD0D90, "objectForKeyedSubscript:", CFSTR("scriptInfo")), "objectForKeyedSubscript:", a3);
  else
    return 0;
}

+ (id)__scriptIdentifierFromIndex:(unint64_t)a3
{
  return +[NSOrthography _scriptNameForScriptIndex:](NSOrthography, "_scriptNameForScriptIndex:", a3);
}

+ (id)__supportedNameDefaultsFromLocalization:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(&unk_1E0FD0430, "objectForKeyedSubscript:", CFSTR("localeInfo")), "objectForKeyedSubscript:", a3);
}

- (BOOL)__localizedRestrictionExistsForStyle:(int64_t)a3
{
  NSString *v4;

  v4 = -[NSPersonNameComponentsFormatter _preferredLocalizationForExplicitlySetLocale](self, "_preferredLocalizationForExplicitlySetLocale");
  if (!v4)
    v4 = +[NSPersonNameComponentsFormatter _preferredLocalizationForCurrentLocale](NSPersonNameComponentsFormatter, "_preferredLocalizationForCurrentLocale");
  return +[NSPersonNameComponentsFormatter __style:isRestrictedForLocalization:](NSPersonNameComponentsFormatter, "__style:isRestrictedForLocalization:", a3, v4);
}

+ (NSString)_preferredLocalizationForCurrentLocale
{
  if (qword_1ECD09A30 != -1)
    dispatch_once(&qword_1ECD09A30, &__block_literal_global_255);
  return (NSString *)qword_1ECD09A28;
}

+ (id)_styleFormatterForStyle:(int64_t)a3 masterFormatter:(id)a4
{
  __objc2_class **v4;

  v4 = off_1E0F11540;
  switch(a3)
  {
    case 0:
    case 2:
      return (id)objc_msgSend(objc_alloc(*v4), "initWithMasterFormatter:", a4);
    case 1:
      v4 = off_1E0F11548;
      return (id)objc_msgSend(objc_alloc(*v4), "initWithMasterFormatter:", a4);
    case 3:
      v4 = off_1E0F11538;
      return (id)objc_msgSend(objc_alloc(*v4), "initWithMasterFormatter:", a4);
    case 4:
      v4 = off_1E0F11508;
      return (id)objc_msgSend(objc_alloc(*v4), "initWithMasterFormatter:", a4);
    default:
      if (a3 != 31)
        return 0;
      v4 = off_1E0F11510;
      return (id)objc_msgSend(objc_alloc(*v4), "initWithMasterFormatter:", a4);
  }
}

+ (id)__currentLocale
{
  if (qword_1ECD09A20 != -1)
    dispatch_once(&qword_1ECD09A20, &__block_literal_global_85);
  return (id)qword_1ECD09A18;
}

+ (int64_t)__abbreviatedNameFormatForPersonNameComponents:(id)a3
{
  int64_t v5;
  int64_t v6;

  v5 = objc_msgSend(a1, "__abbreviatedNameFormatForString:", objc_msgSend(a3, "givenName"));
  v6 = objc_msgSend(a1, "__abbreviatedNameFormatForString:", objc_msgSend(a3, "familyName"));
  if (v6 != v5)
  {
    if (v5 == 6 || v6 == 2 || v6 == 4)
    {
      return v6;
    }
    else if (v6 != 6 && (v5 & 0xFFFFFFFFFFFFFFFDLL) != 1)
    {
      if (v6 == 3)
      {
        return 4;
      }
      else if (v6 == 5)
      {
        if (((v5 - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0)
          return 2;
        else
          return 6;
      }
      else
      {
        return 2;
      }
    }
  }
  return v5;
}

+ (int64_t)__abbreviatedNameFormatForString:(id)a3
{
  int64_t result;

  if (!objc_msgSend(a3, "length"))
    return 6;
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "__supportedScriptDefaultsFromScriptName:", objc_msgSend(a1, "__scriptIdentifierFromIndex:", objc_msgSend(a1, "__inferredScriptIndexFromString:", a3))), "objectForKeyedSubscript:", CFSTR("abbreviatedNameStyle")), "integerValue");
  if (!result)
    return 5;
  return result;
}

+ (BOOL)__shortStyleRestrictionExistsForComponents:(id)a3 shortStyle:(int64_t)a4
{
  return +[NSPersonNameComponentsFormatter __shortStyle:isRestrictedForScript:](NSPersonNameComponentsFormatter, "__shortStyle:isRestrictedForScript:", a4, +[NSPersonNameComponentsFormatter __inferredScriptIndexForComponents:](NSPersonNameComponentsFormatter, "__inferredScriptIndexForComponents:", a3));
}

+ (unint64_t)__inferredScriptIndexForComponents:(id)a3
{
  return objc_msgSend(a1, "__inferredScriptIndexForComponents:ignoreUndeterminedComponents:", a3, 0);
}

+ (BOOL)__shortStyle:(int64_t)a3 isRestrictedForScript:(unint64_t)a4
{
  void *v6;
  uint64_t v7;

  v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "__supportedScriptDefaultsFromScriptName:", objc_msgSend(a1, "__scriptIdentifierFromIndex:", a4)), "objectForKeyedSubscript:", CFSTR("shortStyleRestrictions"));
  v7 = objc_msgSend(a1, "__stringValueForShortStyle:", a3);
  if (v7)
    LOBYTE(v7) = objc_msgSend(v6, "objectForKeyedSubscript:", v7) != 0;
  return v7;
}

+ (id)__stringValueForShortStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_1E0F55838[a3];
}

+ (BOOL)_shouldPreferNicknames
{
  void *v2;

  objc_msgSend(a1, "__registerDefaults");
  if (_overriddenSettings
    && (v2 = (void *)objc_msgSend((id)_overriddenSettings, "objectForKeyedSubscript:", CFSTR("NSPersonNameDefaultShouldPreferNicknamesPreference"))) != 0)
  {
    return objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSPersonNameDefaultShouldPreferNicknamesPreference"));
  }
}

- (int64_t)__computedShortNameFormat
{
  int64_t result;

  result = +[NSPersonNameComponentsFormatter _defaultShortNameFormat](NSPersonNameComponentsFormatter, "_defaultShortNameFormat");
  if (!result)
    return -[NSPersonNameComponentsFormatter __localizedShortNameFormat](self, "__localizedShortNameFormat");
  return result;
}

+ (int64_t)_defaultShortNameFormat
{
  void *v2;

  objc_msgSend(a1, "__registerDefaults");
  if (_overriddenSettings
    && (v2 = (void *)objc_msgSend((id)_overriddenSettings, "objectForKeyedSubscript:", CFSTR("NSPersonNameDefaultShortNameFormat"))) != 0)
  {
    return objc_msgSend(v2, "integerValue");
  }
  else
  {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", CFSTR("NSPersonNameDefaultShortNameFormat"));
  }
}

+ (BOOL)_isMixedScript:(id)a3
{
  return objc_msgSend(a1, "__inferredScriptIndexForComponents:", a3) == 1;
}

- (void)dealloc
{
  NSString *preferredLocalizationForExplicitlySetLocale;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  preferredLocalizationForExplicitlySetLocale = self->__preferredLocalizationForExplicitlySetLocale;
  if (preferredLocalizationForExplicitlySetLocale)
  {

    self->__preferredLocalizationForExplicitlySetLocale = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSPersonNameComponentsFormatter;
  -[NSPersonNameComponentsFormatter dealloc](&v4, sel_dealloc);
}

NSCharacterSet *__86__NSPersonNameComponentsFormatter___stringByStrippingNonInitialPunctuationFromString___block_invoke()
{
  NSCharacterSet *result;

  result = -[NSCharacterSet invertedSet](+[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet"), "invertedSet");
  qword_1ECD09A80 = (uint64_t)result;
  return result;
}

- (void)set_ignoresFallbacks:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(self->_private, "setIgnoresFallbacks:", v3);
  os_unfair_lock_unlock(p_lock);
}

+ (int64_t)_nameOrderWithOverridesForComponents:(id)a3 options:(unint64_t)a4
{
  return objc_msgSend((id)objc_msgSend(a1, "_formatterWithStyle:options:", 0, a4), "_nameOrderWithOverridesForComponents:", a3);
}

+ (id)_formatterWithStyle:(int64_t)a3 options:(unint64_t)a4
{
  id v6;

  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v6, "setStyle:", a3);
  objc_msgSend(v6, "setPhonetic:", (a4 >> 1) & 1);
  objc_msgSend(v6, "set_forceFamilyNameFirst:", (a4 >> 30) & 1);
  objc_msgSend(v6, "set_forceGivenNameFirst:", (a4 >> 31) & 1);
  return v6;
}

- (NSPersonNameComponentsFormatter)init
{
  NSPersonNameComponentsFormatter *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSPersonNameComponentsFormatter;
  v2 = -[NSPersonNameComponentsFormatter init](&v4, sel_init);
  if (v2)
  {
    v2->_private = objc_alloc_init(_NSPersonNameComponentsFormatterData);
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)setStyle:(NSPersonNameComponentsFormatterStyle)style
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(self->_private, "setStyle:", style);
  os_unfair_lock_unlock(p_lock);
}

- (void)set_forceGivenNameFirst:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(self->_private, "setForceGivenNameFirst:", v3);
  os_unfair_lock_unlock(p_lock);
}

- (void)set_forceFamilyNameFirst:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(self->_private, "setForceFamilyNameFirst:", v3);
  os_unfair_lock_unlock(p_lock);
}

- (void)setPhonetic:(BOOL)phonetic
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;

  v3 = phonetic;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(self->_private, "setPhonetic:", v3);
  os_unfair_lock_unlock(p_lock);
}

id __59__NSPersonNameComponentsFormatter___givenNameFirstOrdering__block_invoke()
{
  id result;
  _QWORD v1[6];

  v1[5] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("namePrefix");
  v1[1] = CFSTR("givenName");
  v1[2] = CFSTR("middleName");
  v1[3] = CFSTR("familyName");
  v1[4] = CFSTR("nameSuffix");
  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 5);
  qword_1ECD09A50 = (uint64_t)result;
  return result;
}

uint64_t __51__NSPersonNameComponentsFormatter__cjkLanguagesSet__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &off_1E0FBE9A0, &off_1E0FBE9B8, &off_1E0FBE9D0, &off_1E0FBE9E8, 0);
  qword_1ECD09A90 = result;
  return result;
}

uint64_t __57__NSPersonNameComponentsFormatter_westernInitialsCreator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "rangeOfComposedCharacterSequenceAtIndex:", 0);
  return objc_msgSend(a2, "substringWithRange:", v3, v4);
}

- (int64_t)__localizedNameOrderUsingNativeOrdering:(BOOL)a3
{
  _BOOL8 v3;
  NSString *v4;

  v3 = a3;
  v4 = -[NSPersonNameComponentsFormatter _preferredLocalizationForExplicitlySetLocale](self, "_preferredLocalizationForExplicitlySetLocale");
  if (!v4)
    v4 = +[NSPersonNameComponentsFormatter _preferredLocalizationForCurrentLocale](NSPersonNameComponentsFormatter, "_preferredLocalizationForCurrentLocale");
  return +[NSPersonNameComponentsFormatter __nameOrderForLocalization:usingNativeOrdering:](NSPersonNameComponentsFormatter, "__nameOrderForLocalization:usingNativeOrdering:", v4, v3);
}

+ (id)westernInitialsCreator
{
  return &__block_literal_global_301;
}

+ (id)__initialsForString:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a1, "performSelector:", +[NSPersonNameComponentsFormatter __initialsCreatorForScript:](NSPersonNameComponentsFormatter, "__initialsCreatorForScript:", +[NSPersonNameComponentsFormatter __inferredScriptIndexFromString:](NSPersonNameComponentsFormatter, "__inferredScriptIndexFromString:")));
  return (id)(*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, a3);
}

+ (SEL)__initialsCreatorForScript:(unint64_t)a3
{
  NSString *v3;

  v3 = (NSString *)objc_msgSend((id)objc_msgSend(a1, "__supportedScriptDefaultsFromScriptName:", objc_msgSend(a1, "__scriptIdentifierFromIndex:", a3)), "objectForKeyedSubscript:", CFSTR("initialsCreator"));
  if (v3)
    return NSSelectorFromString(v3);
  else
    return sel_westernInitialsCreator;
}

- (void)receiveObservedValue:(id)a3
{
  objc_super v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSObservationFormatterSupport.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!value || [value isKindOfClass:STATIC_CLASS_REF(NSPersonNameComponents)]"));
    v6.receiver = self;
    v6.super_class = (Class)NSPersonNameComponentsFormatter;
    -[NSPersonNameComponentsFormatter receiveObservedValue:](&v6, sel_receiveObservedValue_, -[NSPersonNameComponentsFormatter stringFromPersonNameComponents:](self, "stringFromPersonNameComponents:", a3));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NSPersonNameComponentsFormatter;
    -[NSPersonNameComponentsFormatter receiveObservedValue:](&v7, sel_receiveObservedValue_, 0);
  }
}

- (NSLocale)_locale
{
  os_unfair_lock_s *p_lock;
  NSLocale *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (NSLocale *)objc_msgSend(self->_private, "locale");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)set_locale:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(self->_private, "setLocale:", a3);
  if (a3)
    self->__preferredLocalizationForExplicitlySetLocale = (NSString *)objc_msgSend(+[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:](NSPersonNameComponentsFormatter, "_preferredLocalizationFromLocale:", a3), "copy");
  os_unfair_lock_unlock(p_lock);
}

- (NSLocale)locale
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_msgSend(self->_private, "locale");
  os_unfair_lock_unlock(p_lock);
  if (!v4)
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  return (NSLocale *)v4;
}

- (void)setLocale:(NSLocale *)locale
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(self->_private, "setLocale:", locale);
  if (locale)
    self->__preferredLocalizationForExplicitlySetLocale = (NSString *)objc_msgSend(+[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:](NSPersonNameComponentsFormatter, "_preferredLocalizationFromLocale:", locale), "copy");
  os_unfair_lock_unlock(p_lock);
}

+ (id)__preferredLanguages
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
}

+ (BOOL)__shouldCacheFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly
{
  return 1;
}

+ (BOOL)__shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly
{
  uint64_t v3;

  if (objc_msgSend(a1, "__shouldCacheFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly", MEMORY[0x1E0C809B0], 3221225472, __107__NSPersonNameComponentsFormatter___shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly__block_invoke, &unk_1E0F4D2D8, a1, *MEMORY[0x1E0C80C00]))
  {
    if (qword_1ECD09A38 != -1)
      dispatch_once(&qword_1ECD09A38, &v3);
  }
  else
  {
    __107__NSPersonNameComponentsFormatter___shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly__block_invoke((uint64_t)&v3);
  }
  return _MergedGlobals_7_3;
}

uint64_t __107__NSPersonNameComponentsFormatter___shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _MergedGlobals_7_3 = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "__preferredLanguages");
  result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v10;
    v5 = *MEMORY[0x1E0C997E8];
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v4)
        objc_enumerationMutation(v1);
      v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6)), "objectForKey:", v5);
      result = objc_msgSend(v7, "isEqualToString:", CFSTR("ja"));
      if ((result & 1) != 0)
        break;
      result = objc_msgSend(v7, "isEqualToString:", CFSTR("zh"));
      if ((_DWORD)result)
      {
        _MergedGlobals_7_3 = 1;
        return result;
      }
      if (v3 == ++v6)
      {
        result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
        v3 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

+ (NSString)localizedStringFromPersonNameComponents:(NSPersonNameComponents *)components style:(NSPersonNameComponentsFormatterStyle)nameFormatStyle options:(NSPersonNameComponentsFormatterOptions)nameOptions
{
  if (!components)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSPersonNameComponentsFormatter.m"), 1712, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("components != nil"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSPersonNameComponentsFormatter.m"), 1713, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[components isKindOfClass:STATIC_CLASS_REF(NSPersonNameComponents)]"));
  return (NSString *)objc_msgSend((id)objc_msgSend(a1, "_formatterWithStyle:options:", nameFormatStyle, nameOptions), "stringFromPersonNameComponents:", components);
}

+ (id)__familyNameFirstOrdering
{
  if (qword_1ECD09A48 != -1)
    dispatch_once(&qword_1ECD09A48, &__block_literal_global_266);
  return (id)qword_1ECD09A40;
}

id __60__NSPersonNameComponentsFormatter___familyNameFirstOrdering__block_invoke()
{
  id result;
  _QWORD v1[6];

  v1[5] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("namePrefix");
  v1[1] = CFSTR("familyName");
  v1[2] = CFSTR("givenName");
  v1[3] = CFSTR("middleName");
  v1[4] = CFSTR("nameSuffix");
  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 5);
  qword_1ECD09A40 = (uint64_t)result;
  return result;
}

- (id)stringForObjectValue:(id)a3
{
  if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
    return -[NSPersonNameComponentsFormatter stringFromPersonNameComponents:](self, "stringFromPersonNameComponents:", a3);
  else
    return 0;
}

- (NSAttributedString)annotatedStringFromPersonNameComponents:(NSPersonNameComponents *)components
{
  NSAttributedString *result;

  if (!components)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSPersonNameComponentsFormatter.m"), 1763, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("components != nil"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSPersonNameComponentsFormatter.m"), 1764, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[components isKindOfClass:STATIC_CLASS_REF(NSPersonNameComponents)]"));
  result = (NSAttributedString *)objc_msgSend(+[NSPersonNameComponentsFormatter _styleFormatterForStyle:masterFormatter:](NSPersonNameComponentsFormatter, "_styleFormatterForStyle:masterFormatter:", -[NSPersonNameComponentsFormatter style](self, "style"), self), "annotatedStringFromPersonNameComponents:", components);
  if (!result)
  {
    if (qword_1ECD09AB0 != -1)
      dispatch_once(&qword_1ECD09AB0, &__block_literal_global_1108);
    if (byte_1ECD09A11)
      return -[NSAttributedString initWithString:]([NSAttributedString alloc], "initWithString:", &stru_1E0F56070);
    else
      return 0;
  }
  return result;
}

+ (void)forEachExistingComponentWithComponents:(id)a3 performBlock:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = +[NSPersonNameComponents _allComponents](NSPersonNameComponents, "_allComponents");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = (void *)objc_msgSend(a3, "valueForKeyPath:", v11);
          if (objc_msgSend(v12, "length"))
            (*((void (**)(id, uint64_t, void *))a4 + 2))(a4, v11, v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v8);
    }
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSPersonNameComponentsFormatter.m"), 1808, CFSTR("block to perform should not be nil"));
  }
}

+ (BOOL)isKatakana:(id)a3
{
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__NSPersonNameComponentsFormatter_isKatakana___block_invoke;
  v6[3] = &unk_1E0F4D2D8;
  v6[4] = a1;
  if (qword_1ECD09A68 != -1)
    dispatch_once(&qword_1ECD09A68, v6);
  return objc_msgSend(a1, "__contents:exclusivelyInCharacterSet:", a3, qword_1ECD09A60);
}

uint64_t __46__NSPersonNameComponentsFormatter_isKatakana___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "__getCharacterSetWithPattern:", CFSTR("[:scx=Kana:]"));
  qword_1ECD09A60 = result;
  return result;
}

+ (id)__thaiConsonantSet
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__NSPersonNameComponentsFormatter___thaiConsonantSet__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD09A78 != -1)
    dispatch_once(&qword_1ECD09A78, v3);
  return (id)qword_1ECD09A70;
}

id __53__NSPersonNameComponentsFormatter___thaiConsonantSet__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "__characterSetWithPattern:", CFSTR("[กขฃคฅฆงจฉชซฌญฎฏฐฑฒณดตถทธนบปผฝพฟภมยรลวศษสหฬอฮ]"));
  qword_1ECD09A70 = (uint64_t)result;
  return result;
}

+ (id)__characterSetWithPattern:(id)a3
{
  CFIndex v4;
  unint64_t v5;
  char *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  CFRange v17;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__33;
  v14 = __Block_byref_object_dispose__33;
  v10 = 0;
  v11 = &v10;
  v15 = 0;
  v4 = objc_msgSend(a3, "length", MEMORY[0x1E0C809B0], 3221225472, __61__NSPersonNameComponentsFormatter___characterSetWithPattern___block_invoke, &unk_1E0F556A0, &v10);
  if (CFStringGetCharactersPtr((CFStringRef)a3))
  {
    __61__NSPersonNameComponentsFormatter___characterSetWithPattern___block_invoke((uint64_t)&v9);
  }
  else
  {
    v5 = 2 * v4;
    if ((unint64_t)(2 * v4) < 0x101)
    {
      if (v4)
      {
        MEMORY[0x1E0C80A78](0);
        v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v6, 2 * v4);
      }
      else
      {
        v6 = 0;
      }
    }
    else
    {
      v6 = (char *)malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
    }
    v17.location = 0;
    v17.length = v4;
    CFStringGetCharacters((CFStringRef)a3, v17, (UniChar *)v6);
    __61__NSPersonNameComponentsFormatter___characterSetWithPattern___block_invoke((uint64_t)&v9);
    if (v5 >= 0x101)
      free(v6);
  }
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __61__NSPersonNameComponentsFormatter___characterSetWithPattern___block_invoke(uint64_t a1)
{
  uset_openPattern();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = _CFCreateCharacterSetFromUSet();
  return uset_close();
}

+ (USet)__getCharacterSetWithPattern:(id)a3
{
  CFIndex v4;
  USet *v5;
  unint64_t v6;
  char *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  CFRange v15;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (a3)
  {
    v4 = objc_msgSend(a3, "length", v9);
    if (CFStringGetCharactersPtr((CFStringRef)a3))
    {
      v13 = 0;
      v10[3] = uset_openPattern();
    }
    else
    {
      v6 = 2 * v4;
      if ((unint64_t)(2 * v4) < 0x101)
      {
        if (v4)
        {
          MEMORY[0x1E0C80A78](0);
          v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
          bzero(v7, 2 * v4);
        }
        else
        {
          v7 = 0;
        }
      }
      else
      {
        v7 = (char *)malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
      }
      v15.location = 0;
      v15.length = v4;
      CFStringGetCharacters((CFStringRef)a3, v15, (UniChar *)v7);
      v13 = 0;
      v10[3] = uset_openPattern();
      if (v6 >= 0x101)
        free(v7);
    }
    v5 = (USet *)v10[3];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

+ (BOOL)__contents:(id)a3 exclusivelyInCharacterSet:(USet *)a4
{
  CFIndex v5;
  BOOL v6;
  unint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  CFRange v16;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a3 || !objc_msgSend(a3, "length"))
    return 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = objc_msgSend(a3, "length");
  if (CFStringGetCharactersPtr((CFStringRef)a3))
  {
    *((_BYTE *)v12 + 24) = uset_containsAllCodePoints() != 0;
  }
  else
  {
    v7 = 2 * v5;
    if ((unint64_t)(2 * v5) < 0x101)
    {
      if (v5)
      {
        MEMORY[0x1E0C80A78](0);
        v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v8, 2 * v5);
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = (char *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
    }
    v16.location = 0;
    v16.length = v5;
    CFStringGetCharacters((CFStringRef)a3, v16, (UniChar *)v8);
    *((_BYTE *)v12 + 24) = uset_containsAllCodePoints() != 0;
    if (v7 >= 0x101)
      free(v8);
  }
  v6 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (id)__longestComponentFromComponents:(id)a3
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__NSPersonNameComponentsFormatter___longestComponentFromComponents___block_invoke;
  v5[3] = &unk_1E0F556C8;
  v5[4] = v12;
  v5[5] = &v6;
  objc_msgSend(a1, "forEachExistingComponentWithComponents:performBlock:", a3, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v12, 8);
  return v3;
}

unint64_t __68__NSPersonNameComponentsFormatter___longestComponentFromComponents___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t result;
  uint64_t v6;

  result = objc_msgSend(a3, "length");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result > *(_QWORD *)(v6 + 24))
  {
    *(_QWORD *)(v6 + 24) = result;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a3;
  }
  return result;
}

+ (id)__naiveDelimiterForCombinedNameString:(id)a3
{
  if ((unint64_t)(objc_msgSend(a1, "__inferredScriptIndexFromString:") - 2) > 3)
    return CFSTR(" ");
  if (objc_msgSend(a1, "isKatakana:", a3))
    return CFSTR("・");
  return &stru_1E0F56070;
}

+ (id)_cjkLocaleIdentifiers
{
  if (qword_1ECD09AA8 != -1)
    dispatch_once(&qword_1ECD09AA8, &__block_literal_global_288_0);
  return (id)qword_1ECD09AA0;
}

uint64_t __56__NSPersonNameComponentsFormatter__cjkLocaleIdentifiers__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ja"), CFSTR("zh"), CFSTR("ko"), 0);
  qword_1ECD09AA0 = result;
  return result;
}

+ (BOOL)_currentLocaleIsCJK
{
  id v3;

  v3 = +[NSPersonNameComponentsFormatter __currentLocale](NSPersonNameComponentsFormatter, "__currentLocale");
  return objc_msgSend((id)objc_msgSend(a1, "_cjkLocaleIdentifiers"), "containsObject:", objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997E8]));
}

- (BOOL)__localizedRestrictionExistsForShortStyle:(int64_t)a3
{
  NSString *v4;

  v4 = -[NSPersonNameComponentsFormatter _preferredLocalizationForExplicitlySetLocale](self, "_preferredLocalizationForExplicitlySetLocale");
  if (!v4)
    v4 = +[NSPersonNameComponentsFormatter _preferredLocalizationForCurrentLocale](NSPersonNameComponentsFormatter, "_preferredLocalizationForCurrentLocale");
  return +[NSPersonNameComponentsFormatter __shortStyle:isRestrictedForLocalization:](NSPersonNameComponentsFormatter, "__shortStyle:isRestrictedForLocalization:", a3, v4);
}

- (int64_t)__localizedShortNameFormat
{
  NSString *v2;

  v2 = -[NSPersonNameComponentsFormatter _preferredLocalizationForExplicitlySetLocale](self, "_preferredLocalizationForExplicitlySetLocale");
  if (!v2)
    v2 = +[NSPersonNameComponentsFormatter _preferredLocalizationForCurrentLocale](NSPersonNameComponentsFormatter, "_preferredLocalizationForCurrentLocale");
  return +[NSPersonNameComponentsFormatter __shortNameFormatForLocalization:](NSPersonNameComponentsFormatter, "__shortNameFormatForLocalization:", v2);
}

+ (id)_localizedDelimiterForComponents:(id)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "__naiveDelimiterForCombinedNameString:", objc_msgSend(a3, "_scriptDeterminingStringRepresentationWithPhoneticDesired:", (a4 >> 1) & 1));
}

+ (id)_relevantKeyPathsForStyle:(int64_t)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(+[NSPersonNameComponentsFormatter _styleFormatterForStyle:masterFormatter:](NSPersonNameComponentsFormatter, "_styleFormatterForStyle:masterFormatter:", a3, objc_msgSend(a1, "_formatterWithStyle:options:", a3, a4)), "orderedKeysOfInterest");
}

+ (id)_fallbackDescriptorForStyle:(int64_t)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(+[NSPersonNameComponentsFormatter _styleFormatterForStyle:masterFormatter:](NSPersonNameComponentsFormatter, "_styleFormatterForStyle:masterFormatter:", a3, objc_msgSend(a1, "_formatterWithStyle:options:", a3, a4)), "fallbackDescriptor");
}

- (NSPersonNameComponents)personNameComponentsFromString:(NSString *)string
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (!string)
    return 0;
  v4[0] = 0;
  if (-[NSPersonNameComponentsFormatter getObjectValue:forString:errorDescription:](self, "getObjectValue:forString:errorDescription:", v4, string, 0))
  {
    return (NSPersonNameComponents *)v4[0];
  }
  else
  {
    return 0;
  }
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  os_unfair_lock_s *p_lock;
  void *v10;
  objc_class *NPNameParserClass;
  void *v12;
  BOOL result;
  NSString *v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v10 = (void *)*((_QWORD *)self->_private + 4);
  if (!v10)
  {
    NPNameParserClass = (objc_class *)getNPNameParserClass();
    if (!NPNameParserClass)
      goto LABEL_8;
    *((_QWORD *)self->_private + 4) = objc_alloc_init(NPNameParserClass);
    v10 = (void *)*((_QWORD *)self->_private + 4);
  }
  os_unfair_lock_unlock(p_lock);
  v12 = (void *)objc_msgSend(v10, "personNameComponentsFromString:", string);
  if (!v12)
  {
LABEL_8:
    if (!error)
      return 0;
    v14 = (NSString *)objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("Person's name could not be detected"), &stru_1E0F56070, CFSTR("Formatter"));
    result = 0;
    *error = v14;
    return result;
  }
  if (obj)
    *obj = v12;
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersonNameComponentsFormatter)initWithCoder:(id)a3
{
  NSPersonNameComponentsFormatter *v5;
  uint64_t v6;
  NSString *v8;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ cannot be decoded by non-keyed archivers"), objc_opt_class());

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0));
  }
  v5 = -[NSPersonNameComponentsFormatter initWithData:](self, "initWithData:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.nameComponentsFormatterPrivate")));
  v6 = objc_msgSend(v5->_private, "locale");
  if (v6)
    v5->__preferredLocalizationForExplicitlySetLocale = (NSString *)objc_msgSend(+[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:](NSPersonNameComponentsFormatter, "_preferredLocalizationFromLocale:", v6), "copy");
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPersonNameComponents cannot be encoded by non-keyed archivers"), 0));
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(a3, "encodeObject:forKey:", self->_private, CFSTR("NS.nameComponentsFormatterPrivate"));
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[NSPersonNameComponentsFormatter isEqualToFormatter:](self, "isEqualToFormatter:");
}

- (BOOL)isEqualToFormatter:(id)a3
{
  BOOL v5;

  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[_NSPersonNameComponentsFormatterData isEqualToFormatterData:](self->_private, *((void **)a3 + 1));
  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

+ (id)_localizedShortNameForComponents:(id)a3 withStyle:(int64_t)a4 options:(unint64_t)a5
{
  _NSPersonNameComponentsStyleFormatterShort *v9;

  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSPersonNameComponentsFormatter.m"), 2298, CFSTR("Components should not be nil"));
  v9 = -[_NSPersonNameComponentsStyleFormatterShort initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterShort alloc], "initWithMasterFormatter:", objc_msgSend(a1, "_formatterWithStyle:options:", 1, a5));
  -[_NSPersonNameComponentsStyleFormatterShort setShortNameFormat:](v9, "setShortNameFormat:", a4);
  -[_NSPersonNameComponentsStyleFormatterShort setForceShortNameEnabled:](v9, "setForceShortNameEnabled:", 1);
  return -[_NSPersonNameComponentsStyleFormatter stringFromComponents:attributesByRange:](v9, "stringFromComponents:attributesByRange:", a3, 0);
}

+ (id)thaiInitialsCreator
{
  return &__block_literal_global_302_0;
}

uint64_t __54__NSPersonNameComponentsFormatter_thaiInitialsCreator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "rangeOfCharacterFromSet:", +[NSPersonNameComponentsFormatter __thaiConsonantSet](NSPersonNameComponentsFormatter, "__thaiConsonantSet"));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return (uint64_t)a2;
  else
    return objc_msgSend(a2, "substringWithRange:", v3, v4);
}

+ (id)tibetanInitialsCreator
{
  return &__block_literal_global_303_0;
}

uint64_t __57__NSPersonNameComponentsFormatter_tibetanInitialsCreator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = objc_msgSend(a2, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__NSPersonNameComponentsFormatter_tibetanInitialsCreator__block_invoke_2;
  v6[3] = &unk_1E0F55790;
  v6[4] = a2;
  v6[5] = &v11;
  v6[6] = &v7;
  objc_msgSend(a2, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 514, v6);
  if ((unint64_t)v12[3] <= 2)
    v4 = objc_msgSend(a2, "substringToIndex:", v8[3]);
  else
    v4 = 0;
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t __57__NSPersonNameComponentsFormatter_tibetanInitialsCreator__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v9;

  v9 = result;
  if (a4 == 1
    && ((result = objc_msgSend(*(id *)(result + 32), "characterAtIndex:"), (_DWORD)result == 3853)
     || (_DWORD)result == 3851))
  {
    *a7 = 1;
  }
  else if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 40) + 8) + 24) < 3uLL)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 48) + 8) + 24) += a4;
  }
  else
  {
    *a7 = 1;
  }
  return result;
}

+ (id)arabicInitialsCreator
{
  return &__block_literal_global_304;
}

uint64_t __56__NSPersonNameComponentsFormatter_arabicInitialsCreator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  int v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__33;
  v17 = __Block_byref_object_dispose__33;
  v18 = 0;
  v3 = objc_msgSend(a2, "length");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__NSPersonNameComponentsFormatter_arabicInitialsCreator__block_invoke_2;
  v12[3] = &unk_1E0F517D8;
  v12[4] = &v13;
  objc_msgSend(a2, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 2, v12);
  v4 = (id)v14[5];
  v5 = objc_msgSend((id)v14[5], "length");
  v6 = v14;
  if (v5)
  {
    v7 = objc_msgSend((id)v14[5], "isEqualToString:", CFSTR("ه"));
    v6 = v14;
    if (v7)
    {
      v8 = CFSTR("ه‍");
LABEL_6:
      v6[5] = (uint64_t)v8;
      goto LABEL_7;
    }
    v9 = objc_msgSend((id)v14[5], "isEqualToString:", CFSTR("ہ"));
    v6 = v14;
    if (v9)
    {
      v8 = CFSTR("ھ");
      goto LABEL_6;
    }
  }
LABEL_7:
  v10 = v6[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __56__NSPersonNameComponentsFormatter_arabicInitialsCreator__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a7 = 1;
  return result;
}

+ (BOOL)__shortStyle:(int64_t)a3 isRestrictedForLocalization:(id)a4
{
  void *v6;
  uint64_t v7;

  v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "__supportedNameDefaultsFromLocalization:", a4), "objectForKeyedSubscript:", CFSTR("shortStyleRestrictions"));
  v7 = objc_msgSend(a1, "__stringValueForShortStyle:", a3);
  return v6 && objc_msgSend(v6, "objectForKeyedSubscript:", v7) != 0;
}

@end
