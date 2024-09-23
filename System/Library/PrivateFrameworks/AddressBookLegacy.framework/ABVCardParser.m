@implementation ABVCardParser

+ (__CFArray)supportedProperties
{
  return +[ABVCardPersonValueSetter supportedProperties](ABVCardPersonValueSetter, "supportedProperties");
}

- (ABVCardParser)init
{
  return -[ABVCardParser initWithData:](self, "initWithData:", 0);
}

- (ABVCardParser)initWithData:(id)a3
{
  return -[ABVCardParser initWithData:watchdogTimer:](self, "initWithData:watchdogTimer:", a3, +[ABVCardWatchdogTimer timerWithTimeProvider:](ABVCardWatchdogTimer, "timerWithTimeProvider:", objc_alloc_init(_ABVCardTimeProvider)));
}

- (ABVCardParser)initWithData:(id)a3 watchdogTimer:(id)a4
{
  ABVCardLexer *v7;
  void *v8;
  ABVCardParser *v9;
  objc_super v11;

  if (a3
    && objc_msgSend(a3, "length")
    && (v11.receiver = self,
        v11.super_class = (Class)ABVCardParser,
        self = -[ABVCardParser init](&v11, sel_init),
        self->_data = (NSData *)a3,
        self->_timer = (ABVCardWatchdogTimer *)a4,
        v7 = -[ABVCardLexer initWithData:watchdogTimer:]([ABVCardLexer alloc], "initWithData:watchdogTimer:", a3, a4), (self->_lexer = v7) != 0))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", a3, 4);
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("BEGIN:VCARD"))
      && objc_msgSend(v8, "rangeOfString:", CFSTR("VERSION:3.0")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_defaultEncoding = 4;
    }
    if (!self->_defaultEncoding)
      self->_defaultEncoding = 1;

  }
  else
  {
    v9 = self;
    return 0;
  }
  return self;
}

- (void)dealloc
{
  void *source;
  objc_super v4;

  -[ABVCardParser cleanUpCardState](self, "cleanUpCardState");
  source = self->_source;
  if (source)
    CFRelease(source);
  v4.receiver = self;
  v4.super_class = (Class)ABVCardParser;
  -[ABVCardParser dealloc](&v4, sel_dealloc);
}

- (BOOL)hasImportErrors
{
  return self->_hasImportErrors;
}

- (void)cleanUpCardState
{
  NSData *v3;

  self->_imageURI = 0;
  *(_OWORD *)&self->_first = 0u;
  *(_OWORD *)&self->_org = 0u;

  self->_emails = 0;
  self->_urls = 0;

  self->_relatedNames = 0;
  self->_dates = 0;

  self->_phones = 0;
  self->_addresses = 0;

  self->_aims = 0;
  self->_jabbers = 0;

  self->_msns = 0;
  self->_yahoos = 0;

  self->_icqs = 0;
  self->_untypedIMs = 0;

  self->_socialProfiles = 0;
  self->_instantMessengers = 0;

  self->_activityAlerts = 0;
  self->_notes = 0;

  self->_otherNotes = 0;
  self->_extensions = 0;

  self->_imageData = 0;
  self->_uid = 0;
  *(_QWORD *)&self->_cropRectX = 0;
  *(_QWORD *)&self->_cropRectWidth = 0;
  v3 = self->_cropRectChecksum;
  self->_cropRectChecksum = 0;

  self->_addressingGrammars = 0;
}

- (void)setSource:(void *)a3
{
  void *source;

  source = self->_source;
  if (source != a3)
  {
    if (source)
      CFRelease(source);
    if (a3)
      CFRetain(a3);
    self->_source = a3;
  }
}

- (void)source
{
  return self->_source;
}

- (void)addMultiValues:(id)a3 toProperty:(unsigned int)a4 valueComparator:(id)a5
{
  uint64_t v5;
  uint64_t v8;
  ABPropertyType TypeOfProperty;
  void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  BOOL v19;
  int v20;
  uint64_t v21;
  void *v22;
  CFIndex Count;
  unsigned int v24;
  _BYTE *cf;

  v5 = *(_QWORD *)&a4;
  if (-[ABVCardValueSetter propertyIsValidForPerson:](self->_valueSetter, "propertyIsValidForPerson:", *(_QWORD *)&a4))
  {
    v8 = objc_msgSend(a3, "count");
    TypeOfProperty = ABPersonGetTypeOfProperty(v5);
    v10 = -[ABVCardValueSetter valueForProperty:](self->_valueSetter, "valueForProperty:", v5);
    if (v10)
    {
      v11 = v10;
      Count = ABMultiValueGetCount(v10);
      cf = ABMultiValueCreateMutableCopy(v11);
    }
    else
    {
      cf = ABMultiValueCreateMutable(TypeOfProperty);
      Count = 0;
    }
    v24 = v5;
    v12 = 0;
    if (v8)
    {
      v13 = 0;
      v14 = (const __CFString *)*MEMORY[0x1E0C9B0D0];
      do
      {
        v15 = (void *)objc_msgSend(a3, "objectAtIndex:", v13, Count);
        v16 = objc_msgSend(v15, "grouping");
        if (!v16
          || (v17 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_extensions, "objectForKey:", v16), "objectForKey:", CFSTR("X-ABLabel")), !objc_msgSend(v17, "count"))|| (v18 = (const __CFString *)objc_msgSend(v17, "objectAtIndex:", 0)) == 0)
        {
          v18 = (const __CFString *)objc_msgSend(v15, "name");
        }
        if (v18)
          v19 = v18 == v14;
        else
          v19 = 1;
        v20 = !v19;
        if (v19)
          v18 = -[ABVCardParser defaultLabel](self, "defaultLabel");
        v21 = objc_msgSend(v15, "value");
        if ((const __CFString *)v21 != v14)
        {
          v22 = (void *)v21;
          if (v21)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v22, "length"))
              v12 += !ABMultiValueAddValueAndLabelIfUnique(cf, v22, v18, v20, (uint64_t (**)(void *, CFTypeRef, const void *, CFTypeRef *))a5);
          }
        }
        ++v13;
      }
      while (v8 != v13);
    }
    if (Count != v12)
      -[ABVCardParser setLocalRecordHasAdditionalProperties:](self, "setLocalRecordHasAdditionalProperties:", 1);
    if (v8)
      -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", cf, v24);
    CFRelease(cf);
  }
}

- (void)_setValueFromExtension:(id)a3 forKey:(id)a4 onAddress:(id)a5 toKey:(id)a6
{
  void *v8;
  uint64_t v9;

  v8 = (void *)objc_msgSend(a3, "objectForKey:", a4);
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_msgSend(v8, "objectAtIndex:", 0);
    if (v9)
      objc_msgSend(a5, "setObject:forKey:", v9, a6);
  }
}

- (void)addAddressMultiValues
{
  uint64_t v3;
  void *v4;
  const void *v5;
  _BYTE *MutableCopy;
  CFIndex v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  int v15;
  CFIndex Count;

  if (-[ABVCardValueSetter propertyIsValidForPerson:](self->_valueSetter, "propertyIsValidForPerson:", kABPersonAddressProperty))
  {
    v3 = -[NSMutableArray count](self->_addresses, "count");
    v4 = -[ABVCardValueSetter valueForProperty:](self->_valueSetter, "valueForProperty:", kABPersonAddressProperty);
    if (v4)
    {
      v5 = v4;
      Count = ABMultiValueGetCount(v4);
      MutableCopy = ABMultiValueCreateMutableCopy(v5);
    }
    else
    {
      MutableCopy = ABMultiValueCreateMutable(0x105u);
      Count = 0;
    }
    if (v3 < 1)
    {
      v7 = 0;
    }
    else
    {
      v7 = 0;
      for (i = 0; i != v3; ++i)
      {
        v9 = (void *)-[NSMutableArray objectAtIndex:](self->_addresses, "objectAtIndex:", i);
        v10 = objc_msgSend(v9, "grouping");
        v11 = (void *)objc_msgSend(v9, "value");
        if (v10
          && ((v12 = (void *)-[NSMutableDictionary objectForKey:](self->_extensions, "objectForKey:", v10),
               v13 = (void *)objc_msgSend(v12, "objectForKey:", CFSTR("X-ABLabel")),
               !objc_msgSend(v13, "count"))
            ? (v14 = 0)
            : (v14 = (const __CFString *)objc_msgSend(v13, "objectAtIndex:", 0)),
              -[ABVCardParser _setValueFromExtension:forKey:onAddress:toKey:](self, "_setValueFromExtension:forKey:onAddress:toKey:", v12, CFSTR("X-ABADR"), v11, CFSTR("CountryCode")), -[ABVCardParser _setValueFromExtension:forKey:onAddress:toKey:](self, "_setValueFromExtension:forKey:onAddress:toKey:", v12, CFSTR("X-APPLE-SUBLOCALITY"), v11, CFSTR("SubLocality")), -[ABVCardParser _setValueFromExtension:forKey:onAddress:toKey:](self, "_setValueFromExtension:forKey:onAddress:toKey:", v12, CFSTR("X-APPLE-SUBADMINISTRATIVEAREA"), v11,
                CFSTR("SubAdministrativeArea")),
              v14))
        {
          v15 = 1;
        }
        else
        {
          v14 = (const __CFString *)objc_msgSend(v9, "name");
          v15 = 0;
        }
        if (objc_msgSend(v11, "count"))
          v7 += !ABMultiValueAddValueAndLabelIfUnique(MutableCopy, v11, v14, v15, __block_literal_global_7);
      }
    }
    if (Count > v7)
      -[ABVCardParser setLocalRecordHasAdditionalProperties:](self, "setLocalRecordHasAdditionalProperties:", 1);
    if (v3 >= 1)
      -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", MutableCopy, kABPersonAddressProperty);
    CFRelease(MutableCopy);
  }
}

- (void)addSocialProfileMultiValues
{
  void *v3;
  const void *v4;
  _BYTE *MutableCopy;
  uint64_t v6;
  CFIndex v7;
  uint64_t i;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  CFIndex Count;

  if (-[ABVCardValueSetter propertyIsValidForPerson:](self->_valueSetter, "propertyIsValidForPerson:", kABPersonSocialProfileProperty))
  {
    v3 = -[ABVCardValueSetter valueForProperty:](self->_valueSetter, "valueForProperty:", kABPersonSocialProfileProperty);
    if (v3)
    {
      v4 = v3;
      Count = ABMultiValueGetCount(v3);
      MutableCopy = ABMultiValueCreateMutableCopy(v4);
    }
    else
    {
      MutableCopy = ABMultiValueCreateMutable(0x105u);
      Count = 0;
    }
    v6 = -[NSMutableArray count](self->_socialProfiles, "count");
    v7 = 0;
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        v9 = (void *)-[NSMutableArray objectAtIndex:](self->_socialProfiles, "objectAtIndex:", i);
        v10 = (void *)objc_msgSend(v9, "value");
        v11 = (const __CFString *)objc_msgSend(v9, "name");
        if (objc_msgSend(v9, "grouping"))
        {
          v12 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_extensions, "objectForKey:", objc_msgSend(v9, "grouping")), "objectForKey:", CFSTR("X-SOCIALPROFILE-ABUSERID"));
          if (objc_msgSend(v12, "count"))
            objc_msgSend(v10, "setObject:forKey:", objc_msgSend(v12, "objectAtIndex:", 0), CFSTR("identifier"));
        }
        v7 += !ABMultiValueAddValueAndLabelIfUnique(MutableCopy, v10, v11, 0, 0);
      }
    }
    if (Count > v7)
      -[ABVCardParser setLocalRecordHasAdditionalProperties:](self, "setLocalRecordHasAdditionalProperties:", 1);
    if (v6)
      -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", MutableCopy, kABPersonSocialProfileProperty);
    CFRelease(MutableCopy);
  }
}

- (int)_addIMHandles:(id)a3 toService:(__CFString *)a4 multiValue:(void *)a5 uniquenessCheckingMultiValue:(void *)a6
{
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  int v24;
  void *v25;
  void *v26;
  int v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = v7;
    v32 = 0;
    v33 = *(_QWORD *)v35;
    v9 = (const __CFString *)*MEMORY[0x1E0C9B0D0];
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v33)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "value");
        v13 = objc_msgSend(v11, "grouping");
        if (v13)
        {
          v14 = (void *)-[NSMutableDictionary objectForKey:](self->_extensions, "objectForKey:", v13);
          v15 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("X-ABLabel"));
          if (objc_msgSend(v15, "count"))
            v16 = (const __CFString *)objc_msgSend(v15, "objectAtIndex:", 0);
          else
            v16 = 0;
          v20 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("x-teamidentifier"));
          if (objc_msgSend(v20, "count"))
            v19 = objc_msgSend(v20, "objectAtIndex:", 0);
          else
            v19 = 0;
          v21 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("x-bundleidentifiers"));
          if (objc_msgSend(v21, "count"))
            v18 = objc_msgSend(v21, "objectAtIndex:", 0);
          else
            v18 = 0;
          v22 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("x-userid"));
          if (objc_msgSend(v22, "count"))
          {
            v17 = objc_msgSend(v22, "objectAtIndex:", 0);
            if (v16)
              goto LABEL_21;
          }
          else
          {
            v17 = 0;
            if (v16)
            {
LABEL_21:
              if (v16 != v9)
                goto LABEL_23;
            }
          }
        }
        else
        {
          v17 = 0;
          v18 = 0;
          v19 = 0;
        }
        v16 = (const __CFString *)objc_msgSend(v11, "name");
LABEL_23:
        if (v16)
          v23 = v16 == v9;
        else
          v23 = 1;
        v24 = !v23;
        if (v23)
          v16 = -[ABVCardParser defaultLabel](self, "defaultLabel");
        if (v12)
        {
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v12, CFSTR("username"), a4, CFSTR("service"), 0);
          v26 = v25;
          if (v19)
            objc_msgSend(v25, "setObject:forKey:", v19, CFSTR("teamIdentifier"));
          if (v18)
            objc_msgSend(v26, "setObject:forKey:", v18, CFSTR("bundleIdentifiers"));
          if (v17)
            objc_msgSend(v26, "setObject:forKey:", v17, CFSTR("identifier"));
          if (!ABMultiValueAddValueAndLabelIfUnique(a5, v26, v16, v24, 0))
            v32 += ABMultiValueAddValueAndLabelIfUnique(a6, v26, v16, v24, 0);

        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (!v8)
        return v32;
    }
  }
  return 0;
}

- (int)_addIMPPProfiles:(id)a3 multiValue:(void *)a4 uniquenessCheckingMultiValue:(void *)a5
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v30;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v30 != v8)
        objc_enumerationMutation(a3);
      v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
      v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "value"), "mutableCopy");
      v12 = objc_msgSend(v10, "name");
      v13 = objc_msgSend(v10, "grouping");
      if (v13)
      {
        v14 = (void *)-[NSMutableDictionary objectForKey:](self->_extensions, "objectForKey:", v13);
        v15 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("X-ABLabel"));
        if (objc_msgSend(v15, "count"))
          v12 = objc_msgSend(v15, "objectAtIndex:", 0);
        v16 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("x-teamidentifier"));
        if (objc_msgSend(v16, "count"))
          v17 = objc_msgSend(v16, "objectAtIndex:", 0);
        else
          v17 = 0;
        v19 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("x-bundleidentifiers"));
        if (objc_msgSend(v19, "count"))
          v18 = objc_msgSend(v19, "objectAtIndex:", 0);
        else
          v18 = 0;
        v20 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("x-ueserid"));
        if (objc_msgSend(v20, "count"))
        {
          v21 = objc_msgSend(v20, "objectAtIndex:", 0);
          goto LABEL_19;
        }
      }
      else
      {
        v17 = 0;
        v18 = 0;
      }
      v21 = 0;
LABEL_19:
      v22 = (const __CFString *)v12;
      if (v12)
      {
        if (!v17)
          goto LABEL_22;
LABEL_21:
        objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("teamIdentifier"));
        goto LABEL_22;
      }
      v22 = -[ABVCardParser defaultLabel](self, "defaultLabel");
      if (v17)
        goto LABEL_21;
LABEL_22:
      if (v18)
        objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("bundleIdentifiers"));
      if (v21)
        objc_msgSend(v11, "setObject:forKey:", v21, CFSTR("identifier"));
      if (!ABMultiValueAddValueAndLabelIfUnique(a4, v11, v22, v12 != 0, 0))
        v7 += ABMultiValueAddValueAndLabelIfUnique(a5, v11, v22, v12 != 0, 0);

      ++v9;
    }
    while (v6 != v9);
    v23 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v6 = v23;
  }
  while (v23);
  return v7;
}

- (void)addInstantMessageMultiValues
{
  void *v3;
  const void *v4;
  CFIndex Count;
  ABMutableMultiValueRef MutableCopy;
  ABMutableMultiValueRef Mutable;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (-[ABVCardValueSetter propertyIsValidForPerson:](self->_valueSetter, "propertyIsValidForPerson:", kABPersonInstantMessageProperty))
  {
    v3 = -[ABVCardValueSetter valueForProperty:](self->_valueSetter, "valueForProperty:", kABPersonInstantMessageProperty);
    if (v3)
    {
      v4 = v3;
      Count = ABMultiValueGetCount(v3);
      MutableCopy = ABMultiValueCreateMutableCopy(v4);
    }
    else
    {
      MutableCopy = ABMultiValueCreateMutable(0x105u);
      Count = 0;
    }
    Mutable = ABMultiValueCreateMutable(0x105u);
    v8 = -[ABVCardParser _addIMPPProfiles:multiValue:uniquenessCheckingMultiValue:](self, "_addIMPPProfiles:multiValue:uniquenessCheckingMultiValue:", self->_instantMessengers, MutableCopy, Mutable);
    v9 = -[ABVCardParser _addIMHandles:toService:multiValue:uniquenessCheckingMultiValue:](self, "_addIMHandles:toService:multiValue:uniquenessCheckingMultiValue:", self->_aims, CFSTR("AIM"), MutableCopy, Mutable)+ (uint64_t)v8;
    v10 = v9
        + -[ABVCardParser _addIMHandles:toService:multiValue:uniquenessCheckingMultiValue:](self, "_addIMHandles:toService:multiValue:uniquenessCheckingMultiValue:", self->_jabbers, CFSTR("Jabber"), MutableCopy, Mutable);
    v11 = v10
        + -[ABVCardParser _addIMHandles:toService:multiValue:uniquenessCheckingMultiValue:](self, "_addIMHandles:toService:multiValue:uniquenessCheckingMultiValue:", self->_msns, CFSTR("MSN"), MutableCopy, Mutable);
    v12 = v11
        + -[ABVCardParser _addIMHandles:toService:multiValue:uniquenessCheckingMultiValue:](self, "_addIMHandles:toService:multiValue:uniquenessCheckingMultiValue:", self->_yahoos, CFSTR("Yahoo"), MutableCopy, Mutable);
    v13 = v12
        + -[ABVCardParser _addIMHandles:toService:multiValue:uniquenessCheckingMultiValue:](self, "_addIMHandles:toService:multiValue:uniquenessCheckingMultiValue:", self->_icqs, CFSTR("ICQ"), MutableCopy, Mutable);
    if (Count > v13
               + -[ABVCardParser _addIMHandles:toService:multiValue:uniquenessCheckingMultiValue:](self, "_addIMHandles:toService:multiValue:uniquenessCheckingMultiValue:", self->_untypedIMs, 0, MutableCopy, Mutable))-[ABVCardParser setLocalRecordHasAdditionalProperties:](self, "setLocalRecordHasAdditionalProperties:", 1);
    -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", MutableCopy, kABPersonInstantMessageProperty);
    CFRelease(MutableCopy);
    CFRelease(Mutable);
  }
}

- (BOOL)_setPersonSounds:(void *)a3 identifier:(int)a4 fromActivity:(id)a5 alert:(id)a6 otherValue:(id)a7
{
  int v10;
  CFIndex IndexForIdentifier;
  void *v14;
  CFIndex Count;
  void *v16;
  BOOL v17;
  int v19;

  v10 = a4;
  v19 = a4;
  if (a4 != -3 && (!a5 || !a6))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Either identifier must be kABPersonSoundIdentifierOther or alert and activity must be non nil"));
    return 0;
  }
  IndexForIdentifier = ABMultiValueGetIndexForIdentifier(a3, a4);
  if (IndexForIdentifier == -1)
    v14 = 0;
  else
    v14 = (void *)ABMultiValueCopyValueAtIndex(a3, IndexForIdentifier);
  if (v10 != -3)
    a7 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_activityAlerts, "objectForKeyedSubscript:", a5), "objectForKeyedSubscript:", a6);
  if (!a7 || v14)
  {
    if (a7)
    {
      if (objc_msgSend(v14, "caseInsensitiveCompare:", a7))
        goto LABEL_13;
    }
    else if (IndexForIdentifier != -1)
    {
      ABMultiValueRemoveValueAndLabelAtIndex(a3, IndexForIdentifier);
LABEL_28:
      v17 = 1;
      goto LABEL_29;
    }
    v17 = 0;
LABEL_29:

    return v17;
  }
LABEL_13:
  if (IndexForIdentifier == -1)
  {
    Count = ABMultiValueGetCount(a3);
    ABMultiValueInsertAndCreateIdentifier((uint64_t)a3, a7, 0, Count, 0, &v19, 0);
    v10 = v19;
  }
  else
  {
    ABMultiValueReplaceValueAtIndex(a3, a7, IndexForIdentifier);
  }
  if (v10 == -3)
    goto LABEL_28;
  if (a5 && a6)
  {
    if ((unint64_t)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_activityAlerts, "objectForKeyedSubscript:", a5), "count") < 2)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_activityAlerts, "removeObjectForKey:", a5);
    }
    else
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[NSMutableDictionary objectForKeyedSubscript:](self->_activityAlerts, "objectForKeyedSubscript:", a5));
      objc_msgSend(v16, "removeObjectForKey:", a6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activityAlerts, "setObject:forKeyedSubscript:", v16, a5);
    }
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Either identifier must be kABPersonSoundIdentifierOther or alert and activity must be non nil"));

  return 0;
}

- (void)addActivityAlertMultiValues
{
  uint64_t v3;
  void *v4;
  ABMutableMultiValueRef MutableCopy;
  const void *v6;
  _BOOL4 v7;
  int v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;

  v3 = kABPersonSoundProperty;
  if (-[ABVCardValueSetter propertyIsValidForPerson:](self->_valueSetter, "propertyIsValidForPerson:", kABPersonSoundProperty))
  {
    v4 = -[ABVCardValueSetter valueForProperty:](self->_valueSetter, "valueForProperty:", v3);
    if (v4)
      MutableCopy = ABMultiValueCreateMutableCopy(v4);
    else
      MutableCopy = ABMultiValueCreateMutable(0x101u);
    v6 = MutableCopy;
    v7 = -[ABVCardParser _setPersonSounds:identifier:fromActivity:alert:otherValue:](self, "_setPersonSounds:identifier:fromActivity:alert:otherValue:", MutableCopy, 0xFFFFFFFFLL, CFSTR("com.apple.activityalert.call"), CFSTR("sound"), 0);
    v8 = v7 | -[ABVCardParser _setPersonSounds:identifier:fromActivity:alert:otherValue:](self, "_setPersonSounds:identifier:fromActivity:alert:otherValue:", v6, 4294967195, CFSTR("com.apple.activityalert.call"), CFSTR("vibration"), 0);
    v9 = -[ABVCardParser _setPersonSounds:identifier:fromActivity:alert:otherValue:](self, "_setPersonSounds:identifier:fromActivity:alert:otherValue:", v6, 4294967292, CFSTR("com.apple.activityalert.call"), CFSTR("ignoreMute"), 0);
    v10 = v8 | v9 | -[ABVCardParser _setPersonSounds:identifier:fromActivity:alert:otherValue:](self, "_setPersonSounds:identifier:fromActivity:alert:otherValue:", v6, 4294967294, CFSTR("com.apple.activityalert.text"), CFSTR("sound"), 0);
    v11 = -[ABVCardParser _setPersonSounds:identifier:fromActivity:alert:otherValue:](self, "_setPersonSounds:identifier:fromActivity:alert:otherValue:", v6, 4294967194, CFSTR("com.apple.activityalert.text"), CFSTR("vibration"), 0);
    v12 = v10 | v11 | -[ABVCardParser _setPersonSounds:identifier:fromActivity:alert:otherValue:](self, "_setPersonSounds:identifier:fromActivity:alert:otherValue:", v6, 4294967291, CFSTR("com.apple.activityalert.text"), CFSTR("ignoreMute"), 0);
    if (-[NSMutableDictionary count](self->_activityAlerts, "count"))
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", self->_activityAlerts, 0, 0);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v13, 4);
    }
    else
    {
      v14 = 0;
    }
    v15 = v12 | -[ABVCardParser _setPersonSounds:identifier:fromActivity:alert:otherValue:](self, "_setPersonSounds:identifier:fromActivity:alert:otherValue:", v6, 4294967293, 0, 0, v14);

    if (v15 == 1)
    {
      -[ABVCardParser setLocalRecordHasAdditionalProperties:](self, "setLocalRecordHasAdditionalProperties:", 1);
      -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", v6, v3);
    }
    CFRelease(v6);
  }
}

- (BOOL)parseVERSION
{
  id v3;
  id v4;

  v3 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", 1, 0, 36864, 1);
  v4 = v3;
  if (v3)
    self->_30vCard = objc_msgSend(v3, "compare:options:", CFSTR("3.0"), 1) == 0;
  return v4 != 0;
}

- (BOOL)_setIntValueOrNoteIfNull:(int)a3 forProperty:(int)a4
{
  -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3), *(_QWORD *)&a4);
  return 1;
}

- (BOOL)_setDataValueOrNoteIfNull:(id)a3 forProperty:(unsigned int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (a3 && objc_msgSend(a3, "length"))
  {
    -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", a3, v4);
    return 1;
  }
  else
  {
    -[ABVCardParser noteLackOfValueForProperty:](self, "noteLackOfValueForProperty:", v4);
    return 0;
  }
}

- (BOOL)_setStringValueOrNoteIfNull:(id)a3 forProperty:(unsigned int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  if (a3 && objc_msgSend(a3, "length"))
  {
    -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", a3, v4);
    return 1;
  }
  else
  {
    -[ABVCardParser noteLackOfValueForProperty:](self, "noteLackOfValueForProperty:", v4);
    return 0;
  }
}

- (BOOL)_setMultiValuesOrNoteIfNull:(id)a3 forProperty:(unsigned int)a4 valueComparator:(id)a5
{
  if (a3)
    -[ABVCardParser addMultiValues:toProperty:valueComparator:](self, "addMultiValues:toProperty:valueComparator:", a3, *(_QWORD *)&a4, a5);
  else
    -[ABVCardParser noteLackOfValueForProperty:](self, "noteLackOfValueForProperty:", *(_QWORD *)&a4);
  return a3 != 0;
}

- (BOOL)parseN
{
  NSString *v3;
  NSString *v4;

  v3 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  self->_last = v3;
  -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", v3, kABPersonLastNameProperty);
  if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
  {
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
    v4 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
    self->_first = v4;
    -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", v4, kABPersonFirstNameProperty);
    if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
    {
      -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
      -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1), kABPersonMiddleNameProperty);
      if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
      {
        -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
        -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1), kABPersonPrefixProperty);
        if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
        {
          -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
          -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1), kABPersonSuffixProperty);
          if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
            -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
        }
      }
    }
  }
  return 1;
}

- (BOOL)parseNICKNAME
{
  _BOOL4 v3;

  v3 = -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1), kABPersonNicknameProperty);
  if (v3 && -[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  return v3;
}

- (BOOL)parseABMaiden
{
  id v3;
  _BOOL4 v4;

  v3 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  v4 = -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", v3, kABPersonPreviousFamilyNameProperty);
  if (v4 && -[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  return v4;
}

- (BOOL)parseAddressingGrammar
{
  id v3;
  ABVCardParameter *v4;

  if (!self->_addressingGrammars)
    self->_addressingGrammars = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (1)
  {
    v3 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
    v4 = -[ABVCardParameter initWithName:]([ABVCardParameter alloc], "initWithName:", &stru_1E3CA4E68);
    -[ABVCardParameter setValue:](v4, "setValue:", v3);
    if (self->_grouping)
      -[ABVCardParameter setGrouping:](v4, "setGrouping:");
    -[NSMutableArray addObject:](self->_addressingGrammars, "addObject:", v4);

    if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) != 4097)
      break;
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  }
  return 1;
}

- (BOOL)parseORG
{
  self->_org = (NSString *)-[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
  {
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
    -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1), kABPersonDepartmentProperty);
    if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
      -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  }
  return 1;
}

- (id)parseSingleValue
{
  id v3;

  v3 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  return v3;
}

- (id)parseRemainingLine
{
  id v3;

  v3 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 0x8000, 1);
  if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  return v3;
}

- (id)parseValueArray
{
  id v3;

  v3 = -[ABVCardLexer nextArraySeperatedByToken:stoppingAt:inEncoding:](self->_lexer, "nextArraySeperatedByToken:stoppingAt:inEncoding:", 64, 36864, self->_encoding);
  if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  return v3;
}

- (id)parseURL
{
  id v3;

  v3 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 0x8000, 1);
  if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  return v3;
}

- (id)_genericLabel
{
  id result;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id *v11;

  result = (id)-[NSMutableArray count](self->_itemParameters, "count");
  if (result)
  {
    v4 = result;
    v5 = 0;
    while (1)
    {
      v6 = (void *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_itemParameters, "objectAtIndex:", v5), "types");
      v7 = objc_msgSend(v6, "count");
      if (v7)
        break;
LABEL_9:
      if ((id)++v5 == v4)
        return 0;
    }
    v8 = v7;
    v9 = 0;
    while (1)
    {
      v10 = (void *)objc_msgSend(v6, "objectAtIndex:", v9);
      if (!objc_msgSend(v10, "compare:options:", CFSTR("HOME"), 1))
      {
        v11 = (id *)&kABHomeLabel;
        return *v11;
      }
      if (!objc_msgSend(v10, "compare:options:", CFSTR("WORK"), 1))
      {
        v11 = (id *)&kABWorkLabel;
        return *v11;
      }
      if (!objc_msgSend(v10, "compare:options:", CFSTR("OTHER"), 1))
        break;
      if (v8 == ++v9)
        goto LABEL_9;
    }
    v11 = (id *)&kABOtherLabel;
    return *v11;
  }
  return result;
}

- (id)genericLabel
{
  id result;

  result = -[ABVCardParser _genericLabel](self, "_genericLabel");
  if (!result)
    return CFSTR("_$!<Work>!$_");
  return result;
}

- (id)defaultLabel
{
  return CFSTR("_$!<Other>!$_");
}

- (id)defaultADRLabel
{
  return CFSTR("_$!<Home>!$_");
}

- (id)defaultURLLabel
{
  return CFSTR("_$!<HomePage>!$_");
}

- (id)phoneLabel
{
  ABVCardParser *v2;
  id result;
  void *v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  id *v18;
  ABVCardParser *v19;
  char *v20;
  char v21;

  v2 = self;
  result = (id)-[NSMutableArray count](self->_itemParameters, "count");
  v20 = (char *)result;
  if (result)
  {
    v4 = 0;
    v21 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v19 = v2;
    do
    {
      v10 = (void *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](v2->_itemParameters, "objectAtIndex:", v9), "types");
      v11 = objc_msgSend(v10, "count");
      if (v11)
      {
        v12 = v11;
        for (i = 0; v12 != i; ++i)
        {
          v14 = (void *)objc_msgSend(v10, "objectAtIndex:", i);
          v15 = v14;
          if ((v6 & 1) != 0 || objc_msgSend(v14, "compare:options:", CFSTR("HOME"), 1))
          {
            if ((v7 & 1) != 0 || objc_msgSend(v15, "compare:options:", CFSTR("WORK"), 1))
            {
              if ((v5 & 1) != 0 || objc_msgSend(v15, "compare:options:", CFSTR("OTHER"), 1))
              {
                if ((v8 & 1) != 0 || objc_msgSend(v15, "compare:options:", CFSTR("FAX"), 1))
                {
                  if (!objc_msgSend(v15, "compare:options:", CFSTR("MAIN"), 1))
                  {
                    v18 = (id *)&kABPersonPhoneMainLabel;
                    return *v18;
                  }
                  if ((v21 & 1) != 0 || objc_msgSend(v15, "compare:options:", CFSTR("CELL"), 1))
                  {
                    if (!objc_msgSend(v15, "compare:options:", CFSTR("IPHONE"), 1))
                    {
                      v18 = (id *)&kABPersonPhoneIPhoneLabel;
                      return *v18;
                    }
                    if (!objc_msgSend(v15, "compare:options:", CFSTR("APPLEWATCH"), 1))
                    {
                      v18 = (id *)kABPersonPhoneAppleWatchLabel;
                      return *v18;
                    }
                    if (!objc_msgSend(v15, "compare:options:", CFSTR("PAGER"), 1))
                    {
                      v18 = (id *)&kABPersonPhonePagerLabel;
                      return *v18;
                    }
                    if (objc_msgSend(v15, "compare:options:", CFSTR("TYPE"), 1))
                    {
                      v16 = objc_msgSend(v15, "compare:options:", CFSTR("PREF"), 1);
                      if (v4)
                        v17 = 1;
                      else
                        v17 = v16 == 0;
                      if (!v17)
                        v4 = v15;
                    }
                  }
                  else
                  {
                    v21 = 1;
                  }
                }
                else
                {
                  v8 = 1;
                }
              }
              else
              {
                v5 = 1;
              }
            }
            else
            {
              v7 = 1;
            }
          }
          else
          {
            v6 = 1;
          }
        }
      }
      ++v9;
      v2 = v19;
    }
    while (v9 != v20);
    if ((v6 & 1) != 0)
    {
      if ((v8 & 1) != 0)
        v18 = (id *)&kABPersonPhoneHomeFAXLabel;
      else
        v18 = (id *)&kABHomeLabel;
      return *v18;
    }
    if ((v7 & 1) != 0)
    {
      if ((v8 & 1) == 0)
      {
        v18 = (id *)&kABWorkLabel;
        return *v18;
      }
LABEL_50:
      v18 = (id *)&kABPersonPhoneWorkFAXLabel;
      return *v18;
    }
    if ((v5 & 1) != 0)
    {
      if ((v8 & 1) != 0)
        v18 = (id *)&kABPersonPhoneOtherFAXLabel;
      else
        v18 = (id *)&kABOtherLabel;
      return *v18;
    }
    if ((v8 & 1) != 0)
      goto LABEL_50;
    if ((v21 & 1) != 0)
      return CFSTR("_$!<Mobile>!$_");
    else
      return v4;
  }
  return result;
}

- (BOOL)parseABUID
{
  id v3;
  id v4;

  v3 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
  v4 = v3;
  if (v3)
    self->_uid = (NSString *)v3;
  return v4 != 0;
}

- (BOOL)parseUID
{
  return 0;
}

- (BOOL)parseEMAIL
{
  id v3;
  id v4;
  ABVCardParameter *v5;

  if (!self->_emails)
    self->_emails = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[ABVCardParser genericLabel](self, "genericLabel");
  while (1)
  {
    v4 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
    v5 = -[ABVCardParameter initWithName:]([ABVCardParameter alloc], "initWithName:", v3);
    -[ABVCardParameter setValue:](v5, "setValue:", v4);
    if (self->_grouping)
      -[ABVCardParameter setGrouping:](v5, "setGrouping:");
    -[NSMutableArray addObject:](self->_emails, "addObject:", v5);

    if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) != 4097)
      break;
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  }
  return 1;
}

- (BOOL)parseTEL
{
  id v3;
  id v4;
  ABVCardParameter *v5;

  if (!self->_phones)
    self->_phones = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[ABVCardParser phoneLabel](self, "phoneLabel");
  while (1)
  {
    v4 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
    v5 = -[ABVCardParameter initWithName:]([ABVCardParameter alloc], "initWithName:", v3);
    -[ABVCardParameter setValue:](v5, "setValue:", v4);
    if (self->_grouping)
      -[ABVCardParameter setGrouping:](v5, "setGrouping:");
    -[NSMutableArray addObject:](self->_phones, "addObject:", v5);

    if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) != 4097)
      break;
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  }
  return 1;
}

- (BOOL)parseADR
{
  id v3;
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  ABVCardParameter *v23;

  if (!self->_addresses)
    self->_addresses = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = 1;
  v6 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v4, "appendString:", v7);
      v5 = 0;
    }
  }
  if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
  {
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
    v8 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "length");
      if (v10)
        v11 = v5;
      else
        v11 = 1;
      if (v10)
        v12 = v9;
      else
        v12 = 0;
      if ((v11 & 1) != 0)
        v9 = v12;
      else
        objc_msgSend(v4, "appendString:", CFSTR("\n"));
    }
    if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
    {
      -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
      v13 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
      if (!v13)
        goto LABEL_25;
      v14 = v13;
      if (!objc_msgSend(v13, "length"))
        goto LABEL_25;
      if (((v9 == 0) & ~v5) != 0)
      {
        v9 = v14;
      }
      else
      {
        objc_msgSend(v4, "appendString:", v14);
        if (!v9)
          goto LABEL_25;
      }
      objc_msgSend(v4, "appendString:", CFSTR("\n"));
      objc_msgSend(v4, "appendString:", v9);
LABEL_25:
      if (objc_msgSend(v4, "length"))
        objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Street"));
      if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
      {
        -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
        v15 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
        if (v15)
        {
          v16 = v15;
          if (objc_msgSend(v15, "length"))
            objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("City"));
        }
        if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
        {
          -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
          v17 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
          if (v17)
          {
            v18 = v17;
            if (objc_msgSend(v17, "length"))
              objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("State"));
          }
          if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
          {
            -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
            v19 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
            if (v19)
            {
              v20 = v19;
              if (objc_msgSend(v19, "length"))
                objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("ZIP"));
            }
            if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
            {
              -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
              v21 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
              if (v21)
              {
                v22 = v21;
                if (objc_msgSend(v21, "length"))
                  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("Country"));
              }
              if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
                -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
            }
          }
        }
      }
    }
  }
  v23 = -[ABVCardParameter initWithName:]([ABVCardParameter alloc], "initWithName:", -[ABVCardParser genericLabel](self, "genericLabel"));
  -[ABVCardParameter setValue:](v23, "setValue:", v3);
  if (self->_grouping)
    -[ABVCardParameter setGrouping:](v23, "setGrouping:");
  -[NSMutableArray addObject:](self->_addresses, "addObject:", v23);

  return 1;
}

- (BOOL)parseADD
{
  id v3;
  id v4;
  id v5;
  id v6;
  int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  ABVCardParameter *v18;

  if (!self->_addresses)
    self->_addresses = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  if (v5 && (v6 = v5, objc_msgSend(v5, "length")))
  {
    objc_msgSend(v4, "appendString:", v6);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
  {
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
    v8 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
    if (v8)
    {
      v9 = v8;
      if (objc_msgSend(v8, "length"))
      {
        if (v7)
          objc_msgSend(v4, "appendString:", CFSTR("\n"));
        objc_msgSend(v4, "appendString:", v9);
      }
    }
    if (objc_msgSend(v4, "length"))
      objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Street"));
    if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
    {
      -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
      v10 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
      if (v10)
      {
        v11 = v10;
        if (objc_msgSend(v10, "length"))
          objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("City"));
      }
      if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
      {
        -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
        v12 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
        if (v12)
        {
          v13 = v12;
          if (objc_msgSend(v12, "length"))
            objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("State"));
        }
        if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
        {
          -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
          v14 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
          if (v14)
          {
            v15 = v14;
            if (objc_msgSend(v14, "length"))
              objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ZIP"));
          }
          if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
          {
            -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
            v16 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
            if (v16)
            {
              v17 = v16;
              if (objc_msgSend(v16, "length"))
                objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("Country"));
            }
            if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
              -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
          }
        }
      }
    }
  }
  v18 = -[ABVCardParameter initWithName:]([ABVCardParameter alloc], "initWithName:", -[ABVCardParser genericLabel](self, "genericLabel"));
  -[ABVCardParameter setValue:](v18, "setValue:", v3);
  -[NSMutableArray addObject:](self->_addresses, "addObject:", v18);

  return 1;
}

- (BOOL)parseABExtensionType:(id)a3
{
  id v5;
  id v6;
  id v7;

  v5 = -[ABVCardLexer nextArraySeperatedByToken:stoppingAt:inEncoding:](self->_lexer, "nextArraySeperatedByToken:stoppingAt:inEncoding:", 4096, 0x8000, self->_encoding);
  if (v5 && self->_grouping)
  {
    v6 = v5;
    v7 = (id)-[NSMutableDictionary objectForKey:](self->_extensions, "objectForKey:");
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableDictionary setObject:forKey:](self->_extensions, "setObject:forKey:", v7, self->_grouping);

    }
    objc_msgSend(v7, "setObject:forKey:", v6, a3);
  }
  return 1;
}

- (id)_socialProfileUserId
{
  NSMutableArray *itemParameters;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  itemParameters = self->_itemParameters;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(itemParameters);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "name"), "lowercaseString"), "isEqualToString:", CFSTR("x-userid")))v5 = (void *)objc_msgSend(v8, "value");
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

- (id)_socialProfileUsername
{
  NSMutableArray *itemParameters;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  itemParameters = self->_itemParameters;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(itemParameters);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "name"), "lowercaseString"), "isEqualToString:", CFSTR("x-user")))v5 = (void *)objc_msgSend(v8, "value");
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

- (id)_socialProfileDisplayName
{
  NSMutableArray *itemParameters;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  itemParameters = self->_itemParameters;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(itemParameters);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "name"), "lowercaseString"), "isEqualToString:", CFSTR("x-displayname")))v5 = (void *)objc_msgSend(v8, "value");
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

- (id)_socialProfileTeamIdentifier
{
  NSMutableArray *itemParameters;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  itemParameters = self->_itemParameters;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(itemParameters);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "name"), "lowercaseString"), "isEqualToString:", CFSTR("x-teamidentifier")))v5 = (void *)objc_msgSend(v8, "value");
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

- (id)_socialProfileBundleIdentifiers
{
  NSMutableArray *itemParameters;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  itemParameters = self->_itemParameters;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(itemParameters);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "name"), "lowercaseString"), "isEqualToString:", CFSTR("x-bundleidentifiers")))v5 = (void *)objc_msgSend(v8, "value");
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

- (id)_socialProfileService
{
  NSMutableArray *itemParameters;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  itemParameters = self->_itemParameters;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(itemParameters);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "name"), "lowercaseString"), "isEqualToString:", CFSTR("type")))v5 = (void *)objc_msgSend(v8, "value");
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

- (BOOL)parseSocialProfiles
{
  void *v3;
  ABVCardParameter *v4;

  if (!self->_socialProfiles)
    self->_socialProfiles = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = socialProfileFromURL(-[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1), -[ABVCardParser _socialProfileService](self, "_socialProfileService"), (uint64_t)-[ABVCardParser _socialProfileUsername](self, "_socialProfileUsername"), (uint64_t)-[ABVCardParser _socialProfileUserId](self, "_socialProfileUserId"), (uint64_t)-[ABVCardParser _socialProfileDisplayName](self, "_socialProfileDisplayName"), (uint64_t)-[ABVCardParser _socialProfileTeamIdentifier](self, "_socialProfileTeamIdentifier"), (uint64_t)-[ABVCardParser _socialProfileBundleIdentifiers](self, "_socialProfileBundleIdentifiers"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[ABVCardParameter initWithName:]([ABVCardParameter alloc], "initWithName:", -[ABVCardParser genericLabel](self, "genericLabel"));
    -[ABVCardParameter setValue:](v4, "setValue:", v3);
    if (self->_grouping)
      -[ABVCardParameter setGrouping:](v4, "setGrouping:");
    -[NSMutableArray addObject:](self->_socialProfiles, "addObject:", v4);

  }
  return 1;
}

- (id)parseInstantMessengerProfile:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *itemParameters;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v3 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "rangeOfString:", CFSTR(":"));
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    v3 = (id)objc_msgSend(v3, "substringFromIndex:", v5 + 1);
  v6 = objc_msgSend(v3, "stringByRemovingPercentEncoding");
  if (v6)
    v7 = v6;
  else
    v7 = (uint64_t)v3;
  v29 = (id)v7;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  itemParameters = self->_itemParameters;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(itemParameters);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (!objc_msgSend((id)objc_msgSend(v13, "name"), "compare:options:", CFSTR("SERVICE-TYPE"), 1)
          || !objc_msgSend((id)objc_msgSend(v13, "name"), "compare:options:", CFSTR("X-SERVICE-TYPE"), 1))
        {
          v14 = objc_msgSend(v13, "value");
          goto LABEL_18;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](itemParameters, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      v14 = 0;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_18:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = self->_itemParameters;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  v28 = (void *)v14;
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = 0;
    v30 = 0;
    v20 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        if (objc_msgSend((id)objc_msgSend(v22, "name", v28), "compare:options:", CFSTR("X-TEAMIDENTIFIER"), 1))
        {
          if (objc_msgSend((id)objc_msgSend(v22, "name"), "compare:options:", CFSTR("X-BUNDLEIDENTIFIERS"), 1))
          {
            if (!objc_msgSend((id)objc_msgSend(v22, "name"), "compare:options:", CFSTR("X-USERID"), 1))
              v30 = objc_msgSend(v22, "value");
          }
          else
          {
            v19 = objc_msgSend(v22, "value");
          }
        }
        else
        {
          v18 = objc_msgSend(v22, "value");
        }
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v30 = 0;
  }
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("InstantMessageCanonicalNames"), CFSTR("plist")));
  v24 = (uint64_t)v28;
  if (objc_msgSend(v23, "objectForKey:", objc_msgSend(v28, "lowercaseString")))
    v24 = objc_msgSend(v23, "objectForKey:", objc_msgSend(v28, "lowercaseString"));
  v25 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v29, CFSTR("username"), v28);
  v26 = v25;
  if (v24)
    objc_msgSend(v25, "setObject:forKey:", v24, CFSTR("service"));
  if (v18)
    objc_msgSend(v26, "setObject:forKey:", v18, CFSTR("teamIdentifier"));
  if (v19)
    objc_msgSend(v26, "setObject:forKey:", v19, CFSTR("bundleIdentifiers"));
  if (v30)
    objc_msgSend(v26, "setObject:forKey:", v30, CFSTR("identifier"));
  return v26;
}

- (BOOL)parseIMPP
{
  id v3;
  ABVCardParameter *v4;

  if (!self->_instantMessengers)
    self->_instantMessengers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[ABVCardParser parseInstantMessengerProfile:](self, "parseInstantMessengerProfile:", -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1));
  v4 = -[ABVCardParameter initWithName:]([ABVCardParameter alloc], "initWithName:", -[ABVCardParser genericLabel](self, "genericLabel"));
  -[ABVCardParameter setValue:](v4, "setValue:", v3);
  if (self->_grouping)
    -[ABVCardParameter setGrouping:](v4, "setGrouping:");
  -[NSMutableArray addObject:](self->_instantMessengers, "addObject:", v4);

  return 1;
}

- (BOOL)parseGuardianWhitelisted
{
  id v3;
  id v4;
  _BOOL4 v5;

  v3 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("false")))
    v4 = 0;
  else
    v4 = v3;
  v5 = -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", v4, kABPersonDowntimeWhitelistProperty);
  if (v5 && -[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  return v5;
}

- (BOOL)parseSensitiveContentConfigurationData
{
  ABVCardParser *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
  LOBYTE(v2) = -[ABVCardParser _setDataValueOrNoteIfNull:forProperty:](v2, "_setDataValueOrNoteIfNull:forProperty:", v4, kABPersonSensitiveContentConfigurationProperty);

  return (char)v2;
}

- (BOOL)parseIMAGETYPE
{
  id v3;
  _BOOL4 v4;

  v3 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  v4 = -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", v3, kABPersonImageTypeProperty);
  if (v4 && -[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  return v4;
}

- (BOOL)parseIMAGEHASH
{
  id v3;
  void *v4;
  _BOOL4 v5;

  v3 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
  v5 = -[ABVCardParser _setDataValueOrNoteIfNull:forProperty:](self, "_setDataValueOrNoteIfNull:forProperty:", v4, kABPersonImageHashProperty);
  if (v5 && -[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 4097)
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");

  return v5;
}

- (BOOL)addIMValueTo:(id)a3
{
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ABVCardParameter *v11;

  v5 = -[ABVCardParser genericLabel](self, "genericLabel");
  v6 = 1;
  while (1)
  {
    v7 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
    v8 = objc_msgSend(a3, "count");
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      while ((objc_msgSend(v7, "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v10), "value")) & 1) == 0)
      {
        if (v9 == ++v10)
          goto LABEL_6;
      }
LABEL_10:
      v6 = 0;
      goto LABEL_11;
    }
LABEL_6:
    if ((v6 & 1) == 0)
      goto LABEL_10;
    v11 = -[ABVCardParameter initWithName:]([ABVCardParameter alloc], "initWithName:", v5);
    -[ABVCardParameter setValue:](v11, "setValue:", v7);
    if (self->_grouping)
      -[ABVCardParameter setGrouping:](v11, "setGrouping:");
    objc_msgSend(a3, "addObject:", v11);

    v6 = 1;
LABEL_11:
    if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) != 4097)
      return 1;
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
  }
}

- (BOOL)parseActivityAlerts
{
  id v3;
  _QWORD v5[5];

  if (!self->_activityAlerts)
    self->_activityAlerts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = -[ABVCardParser parseRemainingLine](self, "parseRemainingLine");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__ABVCardParser_parseActivityAlerts__block_invoke;
  v5[3] = &unk_1E3CA3F50;
  v5[4] = self;
  +[ABVCardActivityAlertSerialization parseString:intoTypeAndInfo:](ABVCardActivityAlertSerialization, "parseString:intoTypeAndInfo:", v3, v5);
  return 1;
}

uint64_t __36__ABVCardParser_parseActivityAlerts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "length");
  if (result)
  {
    result = objc_msgSend(a3, "count");
    if (result)
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 208);
      v8 = a2;
      v9[0] = a3;
      return objc_msgSend(v7, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
    }
  }
  return result;
}

- (id)dateFromISO8601String:(id)a3
{
  unint64_t v4;
  id v5;
  id v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  uint64_t v14;

  v4 = objc_msgSend(a3, "length");
  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  if (objc_msgSend(a3, "rangeOfString:", CFSTR("-")) == 0x7FFFFFFFFFFFFFFFLL && v4 == 8)
  {
    objc_msgSend(v5, "setCalendar:", objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]));
    objc_msgSend(v5, "setTimeZone:", objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("Zulu")));
    objc_msgSend(v5, "setYear:", (int)objc_msgSend((id)objc_msgSend(a3, "substringWithRange:", 0, 4), "intValue"));
    objc_msgSend(v5, "setMonth:", (int)objc_msgSend((id)objc_msgSend(a3, "substringWithRange:", 4, 2), "intValue"));
    objc_msgSend(v5, "setDay:", (int)objc_msgSend((id)objc_msgSend(a3, "substringWithRange:", 6, 2), "intValue"));
    objc_msgSend(v5, "setHour:", 12);
    objc_msgSend(v5, "setMinute:", 0);
    v9 = v5;
    v10 = 0;
  }
  else
  {
    v14 = 0;
    v13 = 0uLL;
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", a3);
    objc_msgSend(v7, "scanInt:", (char *)&v14 + 4);
    if (objc_msgSend(v7, "scanLocation") + 1 >= v4
      || (objc_msgSend(v7, "setScanLocation:"),
          objc_msgSend(v7, "scanInt:", &v14),
          objc_msgSend(v7, "scanLocation") + 1 >= v4))
    {
      v11 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v7, "setScanLocation:");
    objc_msgSend(v7, "scanInt:", (char *)&v13 + 12);
    if (objc_msgSend(v7, "scanLocation") + 1 >= v4
      || (objc_msgSend(v7, "setScanLocation:"),
          objc_msgSend(v7, "scanInt:", (char *)&v13 + 8),
          objc_msgSend(v7, "scanLocation") + 1 >= v4)
      || (objc_msgSend(v7, "setScanLocation:"),
          objc_msgSend(v7, "scanInt:", (char *)&v13 + 4),
          objc_msgSend(v7, "scanLocation") + 1 >= v4))
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v7, "setScanLocation:");
      objc_msgSend(v7, "scanInt:", &v13);
      v8 = v13 == 0;
    }
    if (!*(_QWORD *)((char *)&v13 + 4) && v8)
      DWORD2(v13) = 12;
    objc_msgSend(v5, "setCalendar:", objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]));
    objc_msgSend(v5, "setTimeZone:", objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("Zulu")));
    objc_msgSend(v5, "setYear:", SHIDWORD(v14));
    objc_msgSend(v5, "setMonth:", (int)v14);
    objc_msgSend(v5, "setDay:", SHIDWORD(v13));
    objc_msgSend(v5, "setHour:", SDWORD2(v13));
    objc_msgSend(v5, "setMinute:", SDWORD1(v13));
    v10 = (int)v13;
    v9 = v5;
  }
  objc_msgSend(v9, "setSecond:", v10);
  v11 = (void *)objc_msgSend(v5, "date");
LABEL_14:

  return v11;
}

- (BOOL)parseBDAY
{
  __CFString *v3;
  __CFString *v4;
  id v5;
  const __CFAllocator *v6;
  __CFDateFormatter *v7;
  __CFDateFormatter *v8;
  CFDateRef DateFromString;
  CFDateRef v10;

  v3 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  if (v3)
  {
    v4 = v3;
    if (-[__CFString length](v3, "length"))
    {
      if (-[__CFString rangeOfString:](v4, "rangeOfString:", CFSTR(",")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v5 = -[ABVCardParser dateFromISO8601String:](self, "dateFromISO8601String:", v4);
        if (v5)
          -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", v5, kABPersonBirthdayProperty);
        else
          -[ABVCardParser noteLackOfValueForProperty:](self, "noteLackOfValueForProperty:", kABPersonBirthdayProperty);
      }
      else
      {
        v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v7 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
        if (v7)
        {
          v8 = v7;
          CFDateFormatterSetFormat(v7, CFSTR("%a, %b %e, %Y"));
          DateFromString = CFDateFormatterCreateDateFromString(v6, v8, v4, 0);
          if (DateFromString)
          {
            v10 = DateFromString;
            -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", DateFromString, kABPersonBirthdayProperty);
            CFRelease(v10);
          }
          else
          {
            -[ABVCardParser noteLackOfValueForProperty:](self, "noteLackOfValueForProperty:", kABPersonBirthdayProperty);
          }
          CFRelease(v8);
        }
      }
    }
  }
  return 1;
}

- (BOOL)parseAlternateBirthday
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  ABVCardDateScanner *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (-[NSMutableArray count](self->_itemParameters, "count") == 1)
  {
    v4 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_itemParameters, "objectAtIndexedSubscript:", 0);
    if (!objc_msgSend((id)objc_msgSend(v4, "name"), "compare:options:", CFSTR("CALSCALE"), 1))
    {
      if (objc_msgSend((id)objc_msgSend(v4, "value"), "compare:options:", CFSTR("(null)"), 1))
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v4, "value"), CFSTR("calendarIdentifier"));
    }
  }
  v5 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v5, "length"))
    {
      v7 = +[ABVCardDateScanner scannerWithString:](ABVCardDateScanner, "scannerWithString:", v6);
      v8 = -[ABVCardDateScanner scanCalendarUnit:](v7, "scanCalendarUnit:", 2);
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8), CFSTR("era"));
      v9 = -[ABVCardDateScanner scanCalendarUnit:](v7, "scanCalendarUnit:", 4);
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9), CFSTR("year"));
      v10 = -[ABVCardDateScanner scanCalendarUnit:](v7, "scanCalendarUnit:", 8);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10), CFSTR("month"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ABVCardDateScanner scanLeapMarker](v7, "scanLeapMarker")), CFSTR("isLeapMonth"));
      v11 = -[ABVCardDateScanner scanCalendarUnit:](v7, "scanCalendarUnit:", 16);
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11), CFSTR("day"));
    }
  }
  v12 = ABValidateAlternateBirthday(v3);
  if (v12)
    -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", v3, kABPersonAlternateBirthdayProperty);
  return v12;
}

- (BOOL)parseABDATE
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  ABVCardParameter *v8;

  if (!self->_dates)
    self->_dates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[ABVCardParser defaultLabel](self, "defaultLabel");
  v4 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "length"))
    {
      v6 = -[ABVCardParser dateFromISO8601String:](self, "dateFromISO8601String:", v5);
      if (v6)
      {
        v7 = v6;
        v8 = -[ABVCardParameter initWithName:]([ABVCardParameter alloc], "initWithName:", v3);
        -[ABVCardParameter setValue:](v8, "setValue:", v7);
        if (self->_grouping)
          -[ABVCardParameter setGrouping:](v8, "setGrouping:");
        -[NSMutableArray addObject:](self->_dates, "addObject:", v8);

      }
    }
  }
  return 1;
}

- (BOOL)parsePhoto:(id)a3
{
  if (a3)
    self->_imageData = (NSData *)(id)objc_msgSend(a3, "abDecodeVCardBase64");
  return a3 != 0;
}

- (BOOL)parseWallpaper:(id)a3
{
  uint64_t v4;
  id v6;

  if (a3)
  {
    v4 = objc_msgSend(a3, "abDecodeVCardBase64");
    return -[ABVCardParser _setDataValueOrNoteIfNull:forProperty:](self, "_setDataValueOrNoteIfNull:forProperty:", v4, kABPersonWallpaperProperty);
  }
  else
  {
    v6 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
    return -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", v6, kABPersonWallpaperURIProperty);
  }
}

- (void)parseABShowAs
{
  id v3;

  v3 = -[ABVCardLexer nextArraySeperatedByToken:stoppingAt:inEncoding:](self->_lexer, "nextArraySeperatedByToken:stoppingAt:inEncoding:", 4096, 0x8000, self->_encoding);
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "compare:options:", CFSTR("COMPANY"), 1))
      -[ABVCardParser noteLackOfValueForProperty:](self, "noteLackOfValueForProperty:", kABPersonKindProperty);
    else
      -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", kABPersonKindOrganization, kABPersonKindProperty);
  }
}

- (void)parseSharedPhotoDisplayPreference
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;

  v3 = -[ABVCardLexer nextArraySeperatedByToken:stoppingAt:inEncoding:](self->_lexer, "nextArraySeperatedByToken:stoppingAt:inEncoding:", 4096, 0x8000, self->_encoding);
  v4 = kABPersonDisplayFlagsProperty;
  v5 = objc_msgSend(-[ABVCardValueSetter valueForProperty:](self->_valueSetter, "valueForProperty:", kABPersonDisplayFlagsProperty), "integerValue") & 0xFFFFFFFFFFFFFF3FLL;
  if (objc_msgSend(v3, "count"))
  {
    v6 = (void *)objc_msgSend(v3, "objectAtIndex:", 0);
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("AUTOUPDATE")))
    {
      v5 |= 0x40uLL;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("ALWAYS_ASK")))
    {
      v5 |= 0x80uLL;
    }
    else
    {
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("IMPLICIT_AUTOUPDATE"));
      v8 = 192;
      if (!v7)
        v8 = 0;
      v5 |= v8;
    }
  }
  -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5), v4);
}

- (BOOL)parseABReleatedNames
{
  id v3;
  id v4;
  id v5;
  ABVCardParameter *v6;

  if (!self->_relatedNames)
    self->_relatedNames = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[ABVCardParser defaultLabel](self, "defaultLabel");
  v4 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", self->_encoding, self->_quotedPrintable, 36864, 1);
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "length"))
    {
      v6 = -[ABVCardParameter initWithName:]([ABVCardParameter alloc], "initWithName:", v3);
      -[ABVCardParameter setValue:](v6, "setValue:", v5);
      if (self->_grouping)
        -[ABVCardParameter setGrouping:](v6, "setGrouping:");
      -[NSMutableArray addObject:](self->_relatedNames, "addObject:", v6);

    }
  }
  return 1;
}

- (BOOL)_handleUnknownTag:(id)a3 withValue:(id)a4
{
  return 0;
}

- (BOOL)_usesArrayForExternalPropKey:(id)a3
{
  return objc_msgSend(a3, "compare:options:", CFSTR("CATEGORIES"), 1) == 0;
}

- (BOOL)_usesRemainingLineForExternalPropKey:(id)a3
{
  BOOL v4;

  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("X-APPLE-OL")) & 1) != 0)
    return 1;
  v4 = 1;
  if (objc_msgSend(a3, "compare:options:", CFSTR("X-PHONETIC-COMPANY-NAME"), 1))
    return objc_msgSend(a3, "compare:options:", CFSTR("LABEL"), 1) == 0;
  return v4;
}

- (BOOL)parseItem
{
  unint64_t defaultEncoding;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL *p_base64;
  int v10;
  id v11;
  int v12;
  const __CFString *v13;
  id v14;
  uint64_t v15;
  BOOL *p_quotedPrintable;
  uint64_t v17;
  ABVCardParameter *v18;
  const __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  ABVCardParameter *v24;
  __CFString *v25;
  CFStringEncoding v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  NSMutableArray *yahoos;
  const __CFString *v40;
  id v41;
  const ABPropertyID *v42;
  const __CFString *v43;
  NSMutableArray *v44;
  NSMutableArray *jabbers;
  NSMutableArray *aims;
  _BOOL4 v47;
  id v48;
  id v49;
  NSMutableString *otherNotes;
  NSMutableString *v51;
  uint64_t v52;
  NSMutableString *v53;
  NSMutableArray *msns;
  id v55;
  id v56;
  id v57;
  ABVCardParameter *v58;
  NSMutableArray *icqs;
  uint64_t v61;
  unsigned int v62;
  void *v63;

  defaultEncoding = self->_defaultEncoding;
  *(_WORD *)&self->_quotedPrintable = 0;
  self->_grouping = 0;
  self->_encoding = defaultEncoding;
  v4 = -[ABVCardLexer nextArraySeperatedByToken:stoppingAt:inEncoding:](self->_lexer, "nextArraySeperatedByToken:stoppingAt:inEncoding:", 256, 46080, 1);
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(v4, "lastObject");
    if (v6 == 2)
      self->_grouping = (NSString *)objc_msgSend(v4, "objectAtIndex:", 0);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(v7, "compare:options:", CFSTR("END"), 1);
  if (!v8)
    return v8;
  v63 = v7;
  p_base64 = &self->_base64;
  self->_itemParameters = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = -[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 0);
  if (v10 != 8193)
  {
    v12 = v10;
    v62 = kABPersonMemojiMetadataProperty;
    v13 = CFSTR("QUOTED-PRINTABLE");
    while (1)
    {
      if (-[ABVCardLexer errorCount](self->_lexer, "errorCount") >= 10)
      {
LABEL_56:

        goto LABEL_245;
      }
      if (v12 != 4097)
      {
        if (v12 == 65537)
          goto LABEL_56;
        goto LABEL_43;
      }
      v14 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", 1, 0, 46080, 1);
      v15 = objc_msgSend(v14, "compare:options:", v13, 1);
      p_quotedPrintable = &self->_quotedPrintable;
      if (!v15
        || (v17 = objc_msgSend(v14, "compare:options:", CFSTR("BASE64"), 1), p_quotedPrintable = &self->_base64, !v17))
      {
        *p_quotedPrintable = 1;
      }
      v18 = -[ABVCardParameter initWithName:]([ABVCardParameter alloc], "initWithName:", v14);
      -[NSMutableArray addObject:](self->_itemParameters, "addObject:", v18);
      if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 1) == 1025)
        break;
LABEL_42:

LABEL_43:
      v12 = -[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 0);
      if (v12 == 8193)
        goto LABEL_7;
    }
    v19 = v13;
    -[ABVCardLexer advanceToPeakPoint](self->_lexer, "advanceToPeakPoint");
    if (self->_quotedPrintable)
      v20 = 46080;
    else
      v20 = 45056;
    v21 = -[ABVCardLexer nextArraySeperatedByToken:stoppingAt:inEncoding:](self->_lexer, "nextArraySeperatedByToken:stoppingAt:inEncoding:", 128, v20, 4);
    if (-[__CFString count](v21, "count"))
      v22 = (__CFString *)-[__CFString objectAtIndex:](v21, "objectAtIndex:", 0);
    else
      v22 = 0;
    if (objc_msgSend(v14, "compare:options:", CFSTR("TYPE"), 1))
    {
      if (!objc_msgSend(v14, "compare:options:", CFSTR("CHARSET"), 1))
      {
        if (-[__CFString compare:options:](v22, "compare:options:", CFSTR("UTF-7"), 1))
        {
          v26 = CFStringConvertIANACharSetNameToEncoding(v22);
          v13 = v19;
          if (v26 == -1)
          {
            self->_encoding = 0;
            ABDiagnosticsEnabled();
            _ABLog2(4, (uint64_t)"-[ABVCardParser parseItem]", 2144, 0, (uint64_t)CFSTR("%@ is an invalid encoding"), v27, v28, v29, (uint64_t)v22);
          }
          else
          {
            self->_encoding = CFStringConvertEncodingToNSStringEncoding(v26);
          }
          goto LABEL_42;
        }
        self->_encoding = 4000100;
        goto LABEL_41;
      }
      if (!objc_msgSend(v14, "compare:options:", CFSTR("ENCODING"), 1))
      {
        v13 = v19;
        if (-[__CFString compare:options:](v22, "compare:options:", v19, 1))
        {
          if (!-[__CFString compare:options:](v22, "compare:options:", CFSTR("b"), 1)
            || !-[__CFString compare:options:](v22, "compare:options:", CFSTR("BASE64"), 1))
          {
            *p_base64 = 1;
          }
        }
        else
        {
          self->_quotedPrintable = 1;
        }
        goto LABEL_42;
      }
      if (objc_msgSend(v14, "compare:options:", CFSTR("X-USER"), 1)
        && objc_msgSend(v14, "compare:options:", CFSTR("X-USERID"), 1)
        && objc_msgSend(v14, "compare:options:", CFSTR("SERVICE-TYPE"), 1)
        && objc_msgSend(v14, "compare:options:", CFSTR("X-SERVICE-TYPE"), 1)
        && objc_msgSend(v14, "compare:options:", CFSTR("X-DISPLAYNAME"), 1)
        && objc_msgSend(v14, "compare:options:", CFSTR("X-TEAMIDENTIFIER"), 1)
        && objc_msgSend(v14, "compare:options:", CFSTR("X-ABCROP-RECTANGLE"), 1)
        && objc_msgSend(v14, "compare:options:", CFSTR("CALSCALE"), 1))
      {
        if (objc_msgSend(v14, "compare:options:", CFSTR("X-BUNDLEIDENTIFIERS"), 1))
        {
          v13 = v19;
          if (!objc_msgSend(v14, "compare:options:", CFSTR("VND-63-MEMOJI-DETAILS"), 1))
          {
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v22, 0);
            -[ABVCardParser _setDataValueOrNoteIfNull:forProperty:](self, "_setDataValueOrNoteIfNull:forProperty:", v23, v62);

          }
          goto LABEL_42;
        }
        v24 = v18;
        v25 = v21;
        goto LABEL_40;
      }
    }
    else
    {
      -[ABVCardParameter addTypes:](v18, "addTypes:", v21);
    }
    v24 = v18;
    v25 = v22;
LABEL_40:
    -[ABVCardParameter setValue:](v24, "setValue:", v25);
LABEL_41:
    v13 = v19;
    goto LABEL_42;
  }
LABEL_7:
  if (*p_base64)
    v11 = -[ABVCardLexer nextBase64Data](self->_lexer, "nextBase64Data");
  else
    v11 = 0;
  switch(objc_msgSend(v63, "length"))
  {
    case 1:
      if (objc_msgSend(v63, "compare:options:", CFSTR("N"), 1))
        goto LABEL_198;
      if (!-[ABVCardParser parseN](self, "parseN"))
      {
        ABDiagnosticsEnabled();
        v33 = CFSTR("Malformed N");
        v34 = 2297;
        goto LABEL_241;
      }
      goto LABEL_242;
    case 2:
      if (objc_msgSend(v63, "compare:options:", CFSTR("FN"), 1))
        goto LABEL_198;
      self->_formattedName = (NSString *)-[ABVCardParser parseSingleValue](self, "parseSingleValue");
      goto LABEL_242;
    case 3:
      if (objc_msgSend(v63, "compare:options:", CFSTR("UID"), 1))
      {
        if (objc_msgSend(v63, "compare:options:", CFSTR("TEL"), 1))
        {
          if (objc_msgSend(v63, "compare:options:", CFSTR("ADR"), 1))
          {
            if (objc_msgSend(v63, "compare:options:", CFSTR("ORG"), 1))
            {
              if (objc_msgSend(v63, "compare:options:", CFSTR("URL"), 1))
              {
                if (objc_msgSend(v63, "compare:options:", CFSTR("ADD"), 1))
                  goto LABEL_198;
                if (!-[ABVCardParser parseADD](self, "parseADD"))
                {
                  ABDiagnosticsEnabled();
                  v33 = CFSTR("Malformed ADD");
                  v34 = 2233;
                  goto LABEL_241;
                }
              }
              else
              {
                v55 = -[ABVCardParser parseURL](self, "parseURL");
                if (v55)
                {
                  v56 = v55;
                  if (objc_msgSend(v55, "length"))
                  {
                    if (!self->_urls)
                      self->_urls = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v57 = -[ABVCardParser _genericLabel](self, "_genericLabel");
                    if (!v57)
                      v57 = -[ABVCardParser defaultURLLabel](self, "defaultURLLabel");
                    v58 = -[ABVCardParameter initWithName:]([ABVCardParameter alloc], "initWithName:", v57);
                    -[ABVCardParameter setValue:](v58, "setValue:", v56);
                    if (self->_grouping)
                      -[ABVCardParameter setGrouping:](v58, "setGrouping:");
                    -[NSMutableArray addObject:](self->_urls, "addObject:", v58);

                  }
                }
              }
            }
            else if (!-[ABVCardParser parseORG](self, "parseORG"))
            {
              ABDiagnosticsEnabled();
              v33 = CFSTR("Malformed ORG");
              v34 = 2201;
              goto LABEL_241;
            }
          }
          else if (!-[ABVCardParser parseADR](self, "parseADR"))
          {
            ABDiagnosticsEnabled();
            v33 = CFSTR("Malformed ADR");
            v34 = 2196;
            goto LABEL_241;
          }
        }
        else if (!-[ABVCardParser parseTEL](self, "parseTEL"))
        {
          ABDiagnosticsEnabled();
          v33 = CFSTR("Malformed TEL");
          v34 = 2191;
          goto LABEL_241;
        }
      }
      else
      {
        -[ABVCardParser parseUID](self, "parseUID");
      }
      goto LABEL_242;
    case 4:
      if (objc_msgSend(v63, "compare:options:", CFSTR("NOTE"), 1))
      {
        if (objc_msgSend(v63, "compare:options:", CFSTR("BDAY"), 1))
        {
          if (objc_msgSend(v63, "compare:options:", CFSTR("IMPP"), 1))
            goto LABEL_198;
          if (!-[ABVCardParser parseIMPP](self, "parseIMPP"))
          {
            ABDiagnosticsEnabled();
            v33 = CFSTR("Malformed IMPP");
            v34 = 2337;
            goto LABEL_241;
          }
        }
        else if (!-[ABVCardParser parseBDAY](self, "parseBDAY"))
        {
          ABDiagnosticsEnabled();
          v33 = CFSTR("Malformed BDAY");
          v34 = 2332;
          goto LABEL_241;
        }
      }
      else
      {
        self->_notes = (NSMutableString *)objc_msgSend(-[ABVCardParser parseSingleValue](self, "parseSingleValue"), "mutableCopy");
      }
      goto LABEL_242;
    case 5:
      if (objc_msgSend(v63, "compare:options:", CFSTR("EMAIL"), 1))
      {
        if (!objc_msgSend(v63, "compare:options:", CFSTR("TITLE"), 1))
        {
          v41 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
          v42 = &kABPersonJobTitleProperty;
          goto LABEL_179;
        }
        if (objc_msgSend(v63, "compare:options:", CFSTR("X-AIM"), 1))
        {
          if (objc_msgSend(v63, "compare:options:", CFSTR("X-MSN"), 1))
          {
            if (objc_msgSend(v63, "compare:options:", CFSTR("X-ICQ"), 1))
            {
              if (objc_msgSend(v63, "compare:options:", CFSTR("PHOTO"), 1))
                goto LABEL_198;
              if (!-[ABVCardParser parsePhoto:](self, "parsePhoto:", v11))
                self->_imageURI = (NSString *)-[ABVCardParser parseSingleValue](self, "parseSingleValue");
              if (-[NSMutableArray count](self->_itemParameters, "count"))
              {
                v35 = 0;
                while (1)
                {
                  v36 = (void *)-[NSMutableArray objectAtIndex:](self->_itemParameters, "objectAtIndex:", v35);
                  if (!objc_msgSend((id)objc_msgSend(v36, "name"), "compare:options:", CFSTR("X-ABCROP-RECTANGLE"), 1))
                  {
                    v37 = (void *)objc_msgSend(v36, "value");
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v38 = (void *)objc_msgSend(v37, "componentsSeparatedByString:", CFSTR("&"));
                      if (objc_msgSend(v38, "count") == 6)
                      {
                        if (objc_msgSend((id)objc_msgSend(v38, "objectAtIndex:", 0), "isEqualToString:", CFSTR("ABClipRect_1")))break;
                      }
                    }
                  }
                  if (++v35 >= (unint64_t)-[NSMutableArray count](self->_itemParameters, "count"))
                    goto LABEL_242;
                }
                self->_cropRectX = objc_msgSend((id)objc_msgSend(v38, "objectAtIndex:", 1), "intValue");
                self->_cropRectY = objc_msgSend((id)objc_msgSend(v38, "objectAtIndex:", 2), "intValue");
                self->_cropRectWidth = objc_msgSend((id)objc_msgSend(v38, "objectAtIndex:", 3), "intValue");
                self->_cropRectHeight = objc_msgSend((id)objc_msgSend(v38, "objectAtIndex:", 4), "intValue");
                self->_cropRectChecksum = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", objc_msgSend(v38, "objectAtIndex:", 5), 0);
              }
            }
            else
            {
              icqs = self->_icqs;
              if (!icqs)
              {
                icqs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
                self->_icqs = icqs;
              }
              if (!-[ABVCardParser addIMValueTo:](self, "addIMValueTo:", icqs))
              {
                ABDiagnosticsEnabled();
                v33 = CFSTR("Malformed X-ICQ");
                v34 = 2265;
                goto LABEL_241;
              }
            }
          }
          else
          {
            msns = self->_msns;
            if (!msns)
            {
              msns = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              self->_msns = msns;
            }
            if (!-[ABVCardParser addIMValueTo:](self, "addIMValueTo:", msns))
            {
              ABDiagnosticsEnabled();
              v33 = CFSTR("Malformed X-MSN");
              v34 = 2258;
              goto LABEL_241;
            }
          }
        }
        else
        {
          aims = self->_aims;
          if (!aims)
          {
            aims = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            self->_aims = aims;
          }
          if (!-[ABVCardParser addIMValueTo:](self, "addIMValueTo:", aims))
          {
            ABDiagnosticsEnabled();
            v33 = CFSTR("Malformed X-AIM");
            v34 = 2251;
            goto LABEL_241;
          }
        }
      }
      else if (!-[ABVCardParser parseEMAIL](self, "parseEMAIL"))
      {
        ABDiagnosticsEnabled();
        v33 = CFSTR("Malformed EMAIL");
        v34 = 2240;
        goto LABEL_241;
      }
      goto LABEL_242;
    case 7:
      if (objc_msgSend(v63, "compare:options:", CFSTR("VERSION"), 1))
      {
        if (objc_msgSend(v63, "compare:options:", CFSTR("X-ABUID"), 1))
        {
          if (!objc_msgSend(v63, "compare:options:", CFSTR("X-ABADR"), 1))
          {
            v43 = CFSTR("X-ABADR");
            goto LABEL_196;
          }
          if (objc_msgSend(v63, "compare:options:", CFSTR("X-YAHOO"), 1))
            goto LABEL_198;
          yahoos = self->_yahoos;
          if (!yahoos)
          {
            yahoos = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            self->_yahoos = yahoos;
          }
          if (!-[ABVCardParser addIMValueTo:](self, "addIMValueTo:", yahoos))
          {
            ABDiagnosticsEnabled();
            v33 = CFSTR("Malformed X-YAHOO");
            v34 = 2322;
            goto LABEL_241;
          }
        }
        else
        {
          -[ABVCardParser parseABUID](self, "parseABUID");
        }
      }
      else if (!-[ABVCardParser parseVERSION](self, "parseVERSION"))
      {
        ABDiagnosticsEnabled();
        v33 = CFSTR("Malformed VERSION");
        v34 = 2309;
        goto LABEL_241;
      }
      goto LABEL_242;
    case 8:
      if (objc_msgSend(v63, "compare:options:", CFSTR("NICKNAME"), 1))
      {
        if (objc_msgSend(v63, "compare:options:", CFSTR("X-JABBER"), 1))
        {
          if (objc_msgSend(v63, "compare:options:", CFSTR("X-ABDATE"), 1))
            goto LABEL_198;
          if (!-[ABVCardParser parseABDATE](self, "parseABDATE"))
          {
            ABDiagnosticsEnabled();
            v33 = CFSTR("Malformed ABDATE");
            v34 = 2356;
            goto LABEL_241;
          }
        }
        else
        {
          jabbers = self->_jabbers;
          if (!jabbers)
          {
            jabbers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            self->_jabbers = jabbers;
          }
          if (!-[ABVCardParser addIMValueTo:](self, "addIMValueTo:", jabbers))
          {
            ABDiagnosticsEnabled();
            v33 = CFSTR("Malformed X-JABBER");
            v34 = 2351;
            goto LABEL_241;
          }
        }
      }
      else if (!-[ABVCardParser parseNICKNAME](self, "parseNICKNAME"))
      {
        ABDiagnosticsEnabled();
        v33 = CFSTR("Malformed NICKNAME");
        v34 = 2344;
        goto LABEL_241;
      }
      goto LABEL_242;
    case 9:
      if (!objc_msgSend(v63, "compare:options:", CFSTR("X-ABLabel"), 1))
      {
        -[ABVCardParser parseABExtensionType:](self, "parseABExtensionType:", CFSTR("X-ABLabel"));
        goto LABEL_198;
      }
      if (!objc_msgSend(v63, "compare:options:", CFSTR("X-ABOrder"), 1))
      {
        -[ABVCardParser parseABOrder](self, "parseABOrder");
        goto LABEL_198;
      }
      if (!objc_msgSend(v63, "compare:options:", CFSTR("X-ABPhoto"), 1))
      {
        -[ABVCardParser parseABPhoto](self, "parseABPhoto");
        goto LABEL_198;
      }
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-ALTBDAY"), 1))
        goto LABEL_198;
      if (!-[ABVCardParser parseAlternateBirthday](self, "parseAlternateBirthday"))
      {
        ABDiagnosticsEnabled();
        v33 = CFSTR("Malformed X-ALTBDAY");
        v34 = 2394;
        goto LABEL_241;
      }
      goto LABEL_242;
    case 10:
      if (!objc_msgSend(v63, "compare:options:", CFSTR("X-ABShowAs"), 1))
        -[ABVCardParser parseABShowAs](self, "parseABShowAs");
      goto LABEL_198;
    case 11:
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-IMAGETYPE"), 1))
      {
        if (objc_msgSend(v63, "compare:options:", CFSTR("X-IMAGEHASH"), 1))
        {
          v40 = CFSTR("X-WALLPAPER");
          goto LABEL_127;
        }
        -[ABVCardParser parseIMAGEHASH](self, "parseIMAGEHASH");
      }
      else
      {
        -[ABVCardParser parseIMAGETYPE](self, "parseIMAGETYPE");
      }
      goto LABEL_198;
    case 12:
      if (!objc_msgSend(v63, "compare:options:", CFSTR("X-MAIDENNAME"), 1))
        -[ABVCardParser parseABMaiden](self, "parseABMaiden");
      goto LABEL_198;
    case 14:
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-MS-IMADDRESS"), 1))
      {
        if (objc_msgSend(v63, "compare:options:", CFSTR("X-PHONETIC-ORG"), 1))
          goto LABEL_198;
        v41 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
        v42 = &kABPersonOrganizationPhoneticProperty;
        goto LABEL_179;
      }
      if (!self->_untypedIMs)
      {
        v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        self->_untypedIMs = v44;
        if (!-[ABVCardParser addIMValueTo:](self, "addIMValueTo:", v44))
        {
          ABDiagnosticsEnabled();
          v33 = CFSTR("Malformed X-MS-IMADDRESS");
          v34 = 2429;
          goto LABEL_241;
        }
      }
      goto LABEL_242;
    case 15:
      if (!objc_msgSend(v63, "compare:options:", CFSTR("X-SOCIALPROFILE"), 1))
        -[ABVCardParser parseSocialProfiles](self, "parseSocialProfiles");
      goto LABEL_198;
    case 16:
      if (!objc_msgSend(v63, "compare:options:", CFSTR("X-ABRELATEDNAMES"), 1))
      {
        -[ABVCardParser parseABReleatedNames](self, "parseABReleatedNames");
        goto LABEL_198;
      }
      if (!objc_msgSend(v63, "compare:options:", CFSTR("X-ACTIVITY-ALERT"), 1))
      {
        if (!-[ABVCardParser parseActivityAlerts](self, "parseActivityAlerts"))
        {
          ABDiagnosticsEnabled();
          v33 = CFSTR("Malformed X-ACTIVITY-ALERT");
          v34 = 2447;
LABEL_241:
          _ABLog2(4, (uint64_t)"-[ABVCardParser parseItem]", v34, 0, (uint64_t)v33, v30, v31, v32, v61);
        }
        goto LABEL_242;
      }
      v40 = CFSTR("VND-63-WALLPAPER");
LABEL_127:
      if (!objc_msgSend(v63, "compare:options:", v40, 1))
      {
        -[ABVCardParser parseWallpaper:](self, "parseWallpaper:", v11);
        goto LABEL_242;
      }
      goto LABEL_198;
    case 17:
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-APPLE-MAPS-DATA"), 1))
        goto LABEL_198;
      v41 = -[ABVCardParser parseRemainingLine](self, "parseRemainingLine");
      v42 = &kABPersonMapsDataProperty;
      goto LABEL_179;
    case 19:
      if (!objc_msgSend(v63, "compare:options:", CFSTR("X-PRONUNCIATION-ORG"), 1))
      {
        v41 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
        v42 = &kABPersonOrganizationPronunciationProperty;
        goto LABEL_179;
      }
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-APPLE-SUBLOCALITY"), 1))
        goto LABEL_198;
      v43 = CFSTR("X-APPLE-SUBLOCALITY");
LABEL_196:
      -[ABVCardParser parseABExtensionType:](self, "parseABExtensionType:", v43);
      goto LABEL_242;
    case 20:
      if (!objc_msgSend(v63, "compare:options:", CFSTR("X-PHONETIC-LAST-NAME"), 1))
      {
        v41 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
        v42 = &kABPersonLastNamePhoneticProperty;
        goto LABEL_179;
      }
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-ADDRESSING-GRAMMAR"), 1))
        goto LABEL_198;
      -[ABVCardParser parseAddressingGrammar](self, "parseAddressingGrammar");
      goto LABEL_242;
    case 21:
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-PHONETIC-FIRST-NAME"), 1))
        goto LABEL_198;
      v41 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
      v42 = &kABPersonFirstNamePhoneticProperty;
      goto LABEL_179;
    case 22:
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-PHONETIC-MIDDLE-NAME"), 1))
        goto LABEL_198;
      v41 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
      v42 = &kABPersonMiddleNamePhoneticProperty;
      goto LABEL_179;
    case 25:
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-PRONUNCIATION-LAST-NAME"), 1))
        goto LABEL_198;
      v41 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
      v42 = &kABPersonLastNamePronunciationProperty;
      goto LABEL_179;
    case 26:
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-PRONUNCIATION-FIRST-NAME"), 1))
        goto LABEL_198;
      v41 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
      v42 = &kABPersonFirstNamePronunciationProperty;
      goto LABEL_179;
    case 27:
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-PRONUNCIATION-MIDDLE-NAME"), 1))
      {
        if (!objc_msgSend(v63, "compare:options:", CFSTR("X-SHARED-PHOTO-DISPLAY-PREF"), 1))
        {
          -[ABVCardParser parseSharedPhotoDisplayPreference](self, "parseSharedPhotoDisplayPreference");
          goto LABEL_242;
        }
LABEL_198:
        v47 = -[ABVCardParser _usesArrayForExternalPropKey:](self, "_usesArrayForExternalPropKey:", v63);
        if (v47)
        {
          v48 = -[ABVCardParser parseValueArray](self, "parseValueArray");
        }
        else
        {
          if (!-[ABVCardParser _usesRemainingLineForExternalPropKey:](self, "_usesRemainingLineForExternalPropKey:", v63))
          {
            v49 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
            if (!objc_msgSend(v49, "length"))
              v49 = 0;
            goto LABEL_205;
          }
          v48 = -[ABVCardParser parseRemainingLine](self, "parseRemainingLine");
        }
        v49 = v48;
LABEL_205:
        if (objc_msgSend(v63, "compare:options:", CFSTR("LOGO"), 1)
          && objc_msgSend(v63, "compare:options:", CFSTR("SOUND"), 1)
          && objc_msgSend(v63, "compare:options:", CFSTR("LABEL"), 1)
          && objc_msgSend(v63, "compare:options:", CFSTR("PRODID"), 1)
          && objc_msgSend(v63, "compare:options:", CFSTR("SORT-STRING"), 1)
          && objc_msgSend(v63, "compare:options:", CFSTR("UID"), 1)
          && objc_msgSend(v63, "compare:options:", CFSTR("REV"), 1)
          && v49
          && !-[ABVCardParser _handleUnknownTag:withValue:](self, "_handleUnknownTag:withValue:", v63, v49))
        {
          otherNotes = self->_otherNotes;
          if (!otherNotes)
          {
            otherNotes = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
            self->_otherNotes = otherNotes;
          }
          if (-[NSMutableString length](otherNotes, "length"))
            -[NSMutableString appendString:](self->_otherNotes, "appendString:", CFSTR("\n"));
          -[NSMutableString appendString:](self->_otherNotes, "appendString:", v63);
          -[NSMutableString appendString:](self->_otherNotes, "appendString:", CFSTR(": "));
          v51 = self->_otherNotes;
          if (v47)
          {
            v52 = objc_msgSend(v49, "componentsJoinedByString:", CFSTR(", "));
            v53 = v51;
          }
          else
          {
            v53 = self->_otherNotes;
            v52 = (uint64_t)v49;
          }
          -[NSMutableString appendString:](v53, "appendString:", v52);
        }
        goto LABEL_242;
      }
      v41 = -[ABVCardParser parseSingleValue](self, "parseSingleValue");
      v42 = &kABPersonMiddleNamePronunciationProperty;
LABEL_179:
      -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", v41, *(unsigned int *)v42);
LABEL_242:

      if (-[ABVCardLexer advanceToEOL](self->_lexer, "advanceToEOL")
        && -[ABVCardLexer advancePastEOL](self->_lexer, "advancePastEOL"))
      {
        LOBYTE(v8) = 1;
      }
      else
      {
LABEL_245:
        LOBYTE(v8) = 0;
      }
      break;
    case 28:
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-APPLE-GUARDIAN-WHITELISTED"), 1))
        goto LABEL_198;
      if (-[ABVCardParser parseGuardianWhitelisted](self, "parseGuardianWhitelisted"))
        goto LABEL_242;
      ABDiagnosticsEnabled();
      v33 = CFSTR("Malformed X-APPLE-GUARDIAN-WHITELISTED");
      v34 = 2516;
      goto LABEL_241;
    case 29:
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-APPLE-SUBADMINISTRATIVEAREA"), 1))
        goto LABEL_198;
      v43 = CFSTR("X-APPLE-SUBADMINISTRATIVEAREA");
      goto LABEL_196;
    case 31:
      if (objc_msgSend(v63, "compare:options:", CFSTR("VND-63-SENSITIVE-CONTENT-CONFIG"), 1))
        goto LABEL_198;
      -[ABVCardParser parseSensitiveContentConfigurationData](self, "parseSensitiveContentConfigurationData");
      goto LABEL_242;
    case 32:
      if (objc_msgSend(v63, "compare:options:", CFSTR("X-ADDRESSBOOKSERVER-PHONEME-DATA"), 1))
        goto LABEL_198;
      v41 = -[ABVCardParser parseRemainingLine](self, "parseRemainingLine");
      v42 = &kABPersonPhonemeDataProperty;
      goto LABEL_179;
    default:
      goto LABEL_198;
  }
  return v8;
}

- (BOOL)importToPerson:(void *)a3 foundProperties:(const __CFArray *)a4
{
  ABVCardPersonValueSetter *v6;
  BOOL v7;
  __CFArray *v8;
  const __CFArray *v9;

  v6 = -[ABVCardPersonValueSetter initWithPerson:]([ABVCardPersonValueSetter alloc], "initWithPerson:", a3);
  v7 = -[ABVCardParser importToValueSetter:](self, "importToValueSetter:", v6);
  if (a4)
  {
    v8 = -[ABVCardPersonValueSetter foundProperties](v6, "foundProperties");
    if (v8)
    {
      v9 = v8;
      CFRetain(v8);
      *a4 = v9;
    }
  }

  return v7;
}

- (BOOL)importToValueSetter:(id)a3
{
  id v5;
  NSMutableString *notes;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  BOOL v12;
  NSData *imageData;
  _BOOL4 v15;
  int cropRectWidth;
  ABVCardValueSetter *valueSetter;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *formattedName;
  uint64_t v27;

  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);

  self->_valueSetter = (ABVCardValueSetter *)a3;
  self->_extensions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[ABVCardLexer advanceToString](self->_lexer, "advanceToString");
  if (-[ABVCardLexer nextTokenPeak:](self->_lexer, "nextTokenPeak:", 0) != 5)
  {
    ABDiagnosticsEnabled();
    v10 = CFSTR("Malformed BEGIN");
    v11 = 2634;
LABEL_20:
    _ABLog2(4, (uint64_t)"-[ABVCardParser importToValueSetter:]", v11, 0, (uint64_t)v10, v7, v8, v9, v27);
    goto LABEL_21;
  }
  if (!-[ABVCardLexer advanceToToken:throughTypes:](self->_lexer, "advanceToToken:throughTypes:", 8193, 0x4000))
  {
    ABDiagnosticsEnabled();
    v10 = CFSTR("Malformed :");
    v11 = 2639;
    goto LABEL_20;
  }
  if (!-[ABVCardLexer advanceToToken:throughTypes:](self->_lexer, "advanceToToken:throughTypes:", 6, 0x4000))
  {
    ABDiagnosticsEnabled();
    v10 = CFSTR("Malformed VCARD");
    v11 = 2645;
    goto LABEL_20;
  }
  if (!-[ABVCardLexer advanceToEOL](self->_lexer, "advanceToEOL"))
  {
    ABDiagnosticsEnabled();
    v10 = CFSTR("Malformed space after EOL");
    v11 = 2651;
    goto LABEL_20;
  }
  if (!-[ABVCardLexer advancePastEOL](self->_lexer, "advancePastEOL"))
  {
    ABDiagnosticsEnabled();
    v10 = CFSTR("Malformed EOL");
    v11 = 2657;
    goto LABEL_20;
  }
  while (-[ABVCardParser parseItem](self, "parseItem"))
    ;
  -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", self->_org, kABPersonOrganizationProperty);
  if (!self->_last && !self->_first && !self->_org)
  {
    formattedName = self->_formattedName;
    if (formattedName)
    {
      if (-[NSString length](formattedName, "length"))
        -[ABVCardValueSetter setValue:forProperty:](self->_valueSetter, "setValue:forProperty:", self->_formattedName, kABPersonLastNameProperty);
    }
  }
  if (-[NSString length](self->_org, "length"))
    objc_msgSend(-[ABVCardValueSetter fullName](self->_valueSetter, "fullName"), "length");
  -[ABVCardParser _setMultiValuesOrNoteIfNull:forProperty:valueComparator:](self, "_setMultiValuesOrNoteIfNull:forProperty:valueComparator:", self->_emails, kABPersonEmailProperty, 0);
  -[ABVCardParser _setMultiValuesOrNoteIfNull:forProperty:valueComparator:](self, "_setMultiValuesOrNoteIfNull:forProperty:valueComparator:", self->_phones, kABPersonPhoneProperty, &__block_literal_global_8);
  -[ABVCardParser addAddressMultiValues](self, "addAddressMultiValues");
  -[ABVCardParser addSocialProfileMultiValues](self, "addSocialProfileMultiValues");
  -[ABVCardParser addInstantMessageMultiValues](self, "addInstantMessageMultiValues");
  -[ABVCardParser _setMultiValuesOrNoteIfNull:forProperty:valueComparator:](self, "_setMultiValuesOrNoteIfNull:forProperty:valueComparator:", self->_dates, kABPersonDateProperty, 0);
  -[ABVCardParser _setMultiValuesOrNoteIfNull:forProperty:valueComparator:](self, "_setMultiValuesOrNoteIfNull:forProperty:valueComparator:", self->_relatedNames, kABPersonRelatedNamesProperty, 0);
  -[ABVCardParser _setMultiValuesOrNoteIfNull:forProperty:valueComparator:](self, "_setMultiValuesOrNoteIfNull:forProperty:valueComparator:", self->_urls, kABPersonURLProperty, 0);
  -[ABVCardParser _setMultiValuesOrNoteIfNull:forProperty:valueComparator:](self, "_setMultiValuesOrNoteIfNull:forProperty:valueComparator:", self->_addressingGrammars, kABPersonAddressingGrammarProperty, 0);
  -[ABVCardParser addActivityAlertMultiValues](self, "addActivityAlertMultiValues");
  if (self->_otherNotes)
  {
    if (-[NSMutableString length](self->_notes, "length"))
    {
      -[NSMutableString appendString:](self->_notes, "appendString:", CFSTR("\n"));
      notes = self->_notes;
    }
    else
    {
      notes = (NSMutableString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "string"), "mutableCopy");
      self->_notes = notes;
    }
    -[NSMutableString appendString:](notes, "appendString:", self->_otherNotes);
  }
  -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", self->_notes, kABPersonNoteProperty);
  if (-[ABVCardValueSetter valueForProperty:](self->_valueSetter, "valueForProperty:", kABPersonImageSyncFailedTimeProperty))
  {
    goto LABEL_43;
  }
  if (!-[NSData length](self->_cropRectChecksum, "length"))
    goto LABEL_35;
  imageData = self->_imageData;
  if (imageData)
  {
    v15 = 0;
  }
  else
  {
    imageData = (NSData *)-[ABVCardValueSetter imageData](self->_valueSetter, "imageData");
    self->_imageData = imageData;
    v15 = imageData != 0;
  }
  if (objc_msgSend((id)-[NSData _cn_md5Hash](imageData, "_cn_md5Hash"), "isEqualToData:", self->_cropRectChecksum))
  {
    cropRectWidth = self->_cropRectWidth;
    if (cropRectWidth)
      cropRectWidth = self->_cropRectHeight != 0;
    goto LABEL_36;
  }
  if (v15)
  {

    cropRectWidth = 0;
    self->_imageData = 0;
  }
  else
  {
LABEL_35:
    cropRectWidth = 0;
  }
LABEL_36:
  if (self->_imageData)
  {
    valueSetter = self->_valueSetter;
    if (cropRectWidth)
      -[ABVCardValueSetter setImageData:cropRectX:cropRectY:cropRectWidth:cropRectHeight:](valueSetter, "setImageData:cropRectX:cropRectY:cropRectWidth:cropRectHeight:");
    else
      -[ABVCardValueSetter setImageData:](valueSetter, "setImageData:");
  }
  else if (!self->_imageURI)
  {
    -[ABVCardParser noteLackOfValueForImageData](self, "noteLackOfValueForImageData");
  }
  -[ABVCardParser _setStringValueOrNoteIfNull:forProperty:](self, "_setStringValueOrNoteIfNull:forProperty:", self->_imageURI, kABPersonImageURIProperty);
LABEL_43:
  if (-[ABVCardLexer advanceToToken:throughTypes:](self->_lexer, "advanceToToken:throughTypes:", 8193, 0x4000)
    && -[ABVCardLexer advanceToToken:throughTypes:](self->_lexer, "advanceToToken:throughTypes:", 6, 0x4000))
  {
    -[ABVCardLexer advancePastEOL](self->_lexer, "advancePastEOL");
    -[ABVCardParser cleanUpCardState](self, "cleanUpCardState");
    v12 = 1;
    goto LABEL_22;
  }
  if (-[NSData length](self->_data, "length") > 0x3E7)
  {
    ABDiagnosticsEnabled();
    v22 = -[NSData length](self->_data, "length");
    _ABLog2(4, (uint64_t)"-[ABVCardParser importToValueSetter:]", 2804, 0, (uint64_t)CFSTR("failed to import vcard, file too large to log (actual size %lu)"), v23, v24, v25, v22);
  }
  else
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_data, 4);
    ABDiagnosticsEnabled();
    _ABLog2(4, (uint64_t)"-[ABVCardParser importToValueSetter:]", 2801, 0, (uint64_t)CFSTR("failed to import vcard:\n%@\n"), v19, v20, v21, (uint64_t)v18);

  }
  -[ABVCardParser cleanUpCardState](self, "cleanUpCardState");
LABEL_21:
  v12 = 0;
LABEL_22:
  objc_msgSend(v5, "drain");
  return v12;
}

BOOL __37__ABVCardParser_importToValueSetter___block_invoke()
{
  const void *v0;
  const void *v1;
  const void *v2;
  const void *v3;
  BOOL v4;
  _BOOL8 v5;
  _BOOL8 v7;

  v0 = (const void *)CPPhoneNumberCopyHomeCountryCode();
  v1 = (const void *)CFPhoneNumberCreate();
  v2 = (const void *)CFPhoneNumberCreate();
  v3 = v2;
  if (v1)
    v4 = v2 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v7 = CFEqual(v1, v2) != 0;
    goto LABEL_10;
  }
  v7 = 0;
  v5 = 0;
  if (v1)
  {
LABEL_10:
    CFRelease(v1);
    v5 = v7;
    if (!v3)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v2)
LABEL_8:
    CFRelease(v3);
LABEL_9:
  CFRelease(v0);
  return v5;
}

- (void)copyNextPersonWithLength:(int *)a3 foundProperties:(const __CFArray *)a4
{
  ABRecordRef v7;
  int v8;
  unsigned int v9;

  if (!-[ABVCardWatchdogTimer isStarted](self->_timer, "isStarted"))
    -[ABVCardWatchdogTimer start](self->_timer, "start");
  if (-[ABVCardLexer atEOF](self->_lexer, "atEOF"))
  {
    v7 = 0;
    if (a3)
    {
      v8 = 0;
LABEL_11:
      *a3 = v8;
    }
  }
  else
  {
    v9 = -[ABVCardLexer cursor](self->_lexer, "cursor");
    v7 = ABPersonCreateInSource(self->_source);
    if (v7 && !-[ABVCardParser importToPerson:foundProperties:](self, "importToPerson:foundProperties:", v7, a4))
    {
      self->_hasImportErrors = 1;
      CFRelease(v7);
      v7 = 0;
    }
    if (a3)
    {
      v8 = -[ABVCardLexer cursor](self->_lexer, "cursor") - v9;
      goto LABEL_11;
    }
  }
  return (void *)v7;
}

- (__CFArray)peopleAndProperties:(const __CFArray *)a3
{
  const __CFAllocator *v5;
  const CFArrayCallBacks *v6;
  __CFArray *Mutable;
  __CFArray *v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  void *value;

  if (!-[ABVCardWatchdogTimer isStarted](self->_timer, "isStarted"))
    -[ABVCardWatchdogTimer start](self->_timer, "start");
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v8 = CFArrayCreateMutable(v5, 0, v6);
  if (!-[ABVCardLexer atEOF](self->_lexer, "atEOF"))
  {
    while (1)
    {
      value = 0;
      v9 = -[ABVCardParser copyNextPersonWithLength:foundProperties:](self, "copyNextPersonWithLength:foundProperties:", 0, &value);
      if (v9)
      {
        v10 = v9;
        CFArrayAppendValue(Mutable, v9);
        CFRelease(v10);
      }
      if (value)
      {
        CFArrayAppendValue(v8, value);
        CFRelease(value);
      }
      if (-[ABVCardParser hasImportErrors](self, "hasImportErrors"))
        break;
      if (-[ABVCardLexer atEOF](self->_lexer, "atEOF"))
        goto LABEL_10;
    }
    ABDiagnosticsEnabled();
    _ABLog2(4, (uint64_t)"-[ABVCardParser peopleAndProperties:]", 2860, 0, (uint64_t)CFSTR("Aborting vCard parsing due to import errors."), v11, v12, v13, v15);
    if (!a3)
      goto LABEL_13;
LABEL_11:
    *a3 = v8;
    goto LABEL_15;
  }
LABEL_10:
  if (a3)
    goto LABEL_11;
LABEL_13:
  if (v8)
    CFRelease(v8);
LABEL_15:
  if (Mutable)
    return (__CFArray *)CFAutorelease(Mutable);
  else
    return 0;
}

- (id)sortedPeopleAndProperties:(const __CFArray *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  ABVCardWatchdogTimer *timer;
  uint64_t v13;
  CFTypeRef cf;

  cf = 0;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[ABVCardParser peopleAndProperties:](self, "peopleAndProperties:", &cf));
  if (-[ABVCardParser hasImportErrors](self, "hasImportErrors"))
  {
    ABDiagnosticsEnabled();
    v9 = CFSTR("Aborting vCard sorting and returning 0 contact due to import errors.");
    v10 = 2888;
LABEL_8:
    _ABLog2(4, (uint64_t)"-[ABVCardParser sortedPeopleAndProperties:]", v10, 0, (uint64_t)v9, v6, v7, v8, v13);
    return (id)MEMORY[0x1E0C9AA60];
  }
  _sortOrdering = ABPersonGetSortOrdering();
  objc_msgSend(v5, "sortUsingFunction:context:", _SortPeople, self);
  timer = self->_timer;
  if (timer && !-[ABVCardWatchdogTimer isValid](timer, "isValid"))
  {
    ABDiagnosticsEnabled();
    v9 = CFSTR("Aborting vCard sorting and returning 0 contact due to sorting being too long.");
    v10 = 2895;
    goto LABEL_8;
  }
  if (a3)
  {
    *a3 = (const __CFArray *)cf;
  }
  else if (cf)
  {
    CFRelease(cf);
  }
  return v5;
}

- (id)_valueSetter
{
  return self->_valueSetter;
}

@end
