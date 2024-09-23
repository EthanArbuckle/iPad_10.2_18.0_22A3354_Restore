@implementation CKObjectDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedDictionary, 0);
  objc_storeStrong((id *)&self->_descriptionPrefix, 0);
}

- (void)addPropertyIfExists:(id)a3 value:(id)a4 shouldRedact:(BOOL)a5
{
  if (a4)
    MEMORY[0x1E0DE7D20](self, sel__addProperty_value_shouldRedact_, a3, a4);
}

- (void)_addProperty:(id)a3 value:(id)a4 shouldRedact:(BOOL)a5
{
  _BOOL8 v7;
  id v9;
  const char *v10;
  const char *v11;
  CKOrderedDictionary *orderedDictionary;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  id v19;

  if (a4)
  {
    v7 = a5;
    v9 = a3;
    objc_msgSend__propertyDescriptionForProperty_shouldRedact_(self, v10, (uint64_t)a4, v7);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_forKey_(self->_orderedDictionary, v11, (uint64_t)v19, (uint64_t)v9);
  }
  else
  {
    orderedDictionary = self->_orderedDictionary;
    v13 = (void *)MEMORY[0x1E0C99E38];
    v14 = a3;
    objc_msgSend_null(v13, v15, v16, v17);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_forKey_(orderedDictionary, v18, (uint64_t)v19, (uint64_t)v14);
  }

}

- (id)_propertyDescriptionForProperty:(id)a3 shouldRedact:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  __CFString *v35;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend__arrayDescription_shouldRedact_(self, v7, (uint64_t)v6, v4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v35 = (__CFString *)v8;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend__dictionaryDescription_shouldRedact_(self, v9, (uint64_t)v6, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v10 = (void *)objc_opt_class();
  if (!objc_msgSend_conformsToProtocol_(v10, v11, (uint64_t)&unk_1EDF789C0, v12))
  {
    if (v4 && objc_msgSend_redact(self, v13, v14, v15))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_respondsToSelector() & 1) == 0)
      {
        v35 = CFSTR("<private>");
        goto LABEL_19;
      }
      objc_msgSend_performSelector_(v6, v26, (uint64_t)sel_redactedDescription, v27);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_description(v6, v13, v14, v15);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_18;
  }
  v16 = v6;
  if ((objc_msgSend_avoidShortDescription(self, v17, v18, v19) & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v28 = objc_msgSend_redact(self, v20, v21, v22);
    v32 = objc_msgSend_avoidShortDescription(self, v29, v30, v31);
    objc_msgSend_CKObjectDescriptionRedact_avoidShortDescription_(v16, v33, v28, v32);
    v34 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      v23 = objc_msgSend_redact(self, v20, v21, v22);
      objc_msgSend_CKShortDescriptionRedact_(v16, v24, v23, v25);
    }
    else
    {
      objc_msgSend_CKShortDescriptionRedact_(v16, v20, 0, v22);
    }
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (__CFString *)v34;

LABEL_19:
  return v35;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v14;
  uint64_t v15;
  CKOrderedDictionary *orderedDictionary;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;

  v5 = objc_msgSend_count(self->_orderedDictionary, a2, v2, v3);
  v9 = objc_msgSend_printAsDictionary(self, v6, v7, v8);
  if (v5)
  {
    if (v9)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], v10, (uint64_t)CFSTR("{ "), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], v10, (uint64_t)self->_descriptionPrefix, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v12, v14, (uint64_t)CFSTR(" "), v15);
    }
    orderedDictionary = self->_orderedDictionary;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_18A5E87B8;
    v30[3] = &unk_1E1F62268;
    v17 = v12;
    v31 = v17;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(orderedDictionary, v18, (uint64_t)v30, v19);
    v23 = objc_msgSend_length(v17, v20, v21, v22);
    objc_msgSend_deleteCharactersInRange_(v17, v24, v23 - 2, 2);
    if (objc_msgSend_printAsDictionary(self, v25, v26, v27))
      objc_msgSend_appendString_(v17, v28, (uint64_t)CFSTR(" }"), v29);
    else
      objc_msgSend_appendString_(v17, v28, (uint64_t)CFSTR(">"), v29);

  }
  else
  {
    if ((v9 & 1) != 0)
      return CFSTR("{}");
    objc_msgSend_stringByAppendingString_(self->_descriptionPrefix, v10, (uint64_t)CFSTR(">"), v11);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v17;
}

- (BOOL)printAsDictionary
{
  return self->_printAsDictionary;
}

- (CKObjectDescription)initWithObject:(id)a3 redact:(BOOL)a4 avoidShortDescription:(BOOL)a5
{
  id v8;
  CKObjectDescription *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKObjectDescription *v13;
  int ShouldPrintPointer;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSString *descriptionPrefix;
  uint64_t v25;
  CKOrderedDictionary *orderedDictionary;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  objc_super v33;

  v8 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CKObjectDescription;
  v9 = -[CKObjectDescription init](&v33, sel_init);
  v13 = v9;
  if (v9)
  {
    v9->_printAsDictionary = 0;
    v9->_redact = a4;
    v9->_avoidShortDescription = a5;
    if (v8)
    {
      ShouldPrintPointer = objc_msgSend_CKDescriptionShouldPrintPointer(v8, v10, v11, v12);
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_CKDescriptionClassName(v8, v16, v17, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v19;
      if (ShouldPrintPointer)
        objc_msgSend_stringWithFormat_(v15, v20, (uint64_t)CFSTR("<%@: %p;"), v21, v19, v8);
      else
        objc_msgSend_stringWithFormat_(v15, v20, (uint64_t)CFSTR("<%@"), v21, v19);
      v23 = objc_claimAutoreleasedReturnValue();
      descriptionPrefix = v13->_descriptionPrefix;
      v13->_descriptionPrefix = (NSString *)v23;

    }
    objc_msgSend_orderedDictionary(CKOrderedDictionary, v10, v11, v12);
    v25 = objc_claimAutoreleasedReturnValue();
    orderedDictionary = v13->_orderedDictionary;
    v13->_orderedDictionary = (CKOrderedDictionary *)v25;

    v27 = (void *)objc_opt_class();
    if (objc_msgSend_conformsToProtocol_(v27, v28, (uint64_t)&unk_1EDF789C0, v29))
      objc_msgSend_CKDescribePropertiesUsing_(v8, v30, (uint64_t)v13, v31);
  }

  return v13;
}

- (BOOL)avoidShortDescription
{
  return self->_avoidShortDescription;
}

- (void)addProperty:(id)a3 value:(id)a4 shouldRedact:(BOOL)a5
{
  MEMORY[0x1E0DE7D20](self, sel__addProperty_value_shouldRedact_, a3, a4);
}

- (BOOL)redact
{
  return self->_redact;
}

- (void)setPrintAsDictionary:(BOOL)a3
{
  self->_printAsDictionary = a3;
}

- (id)_arrayDescription:(id)a3 shouldRedact:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  _QWORD v16[5];
  BOOL v17;

  v6 = a3;
  if (objc_msgSend_avoidShortDescription(self, v7, v8, v9))
  {
    objc_msgSend_orderedDictionaryWithCapacity_(CKOrderedDictionary, v10, 2, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_forKey_(v12, v13, (uint64_t)CFSTR("array"), (uint64_t)CFSTR("type"));
    objc_msgSend_addObject_forKey_(v12, v14, (uint64_t)CFSTR("items"), (uint64_t)CFSTR("items"));
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_18A5F22B8;
    v16[3] = &unk_1E1F666B0;
    v16[4] = self;
    v17 = a4;
    objc_msgSend_CKMap_(v6, v10, (uint64_t)v16, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (CKObjectDescription)initWithObject:(id)a3 redact:(BOOL)a4
{
  return (CKObjectDescription *)objc_msgSend_initWithObject_redact_avoidShortDescription_(self, a2, (uint64_t)a3, a4, 0);
}

- (void)addBooleanProperty:(id)a3 value:(BOOL)a4
{
  objc_msgSend_addBooleanProperty_value_defaultValue_(self, a2, (uint64_t)a3, a4, -1);
}

- (void)addBooleanProperty:(id)a3 value:(BOOL)a4 defaultValue:(int64_t)a5
{
  _BOOL4 v6;
  char *v8;
  const __CFString *v9;
  char *v10;

  v6 = a4;
  v8 = (char *)a3;
  if (v6)
  {
    if (a5 != 1)
    {
      v9 = CFSTR("YES");
LABEL_6:
      v10 = v8;
      objc_msgSend_addObject_forKey_(self->_orderedDictionary, v8, (uint64_t)v9, (uint64_t)v8);
      v8 = v10;
    }
  }
  else if (a5)
  {
    v9 = CFSTR("NO");
    goto LABEL_6;
  }

}

- (void)addFlagsForKey:(id)a3 flagsAndConditions:(id)a4
{
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  v19 = a3;
  objc_msgSend_CKCompactMap_(a4, v6, (uint64_t)&unk_1E1F58B58, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v8, v9, v10, v11))
  {
    objc_msgSend_sortedArrayUsingSelector_(v8, v12, (uint64_t)sel_compare_, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v14, v15, (uint64_t)CFSTR("|"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_forKey_(self->_orderedDictionary, v18, (uint64_t)v17, (uint64_t)v19);
  }

}

- (id)_dictionaryDescription:(id)a3 shouldRedact:(BOOL)a4
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18A80B2C4;
  v5[3] = &unk_1E1F666D8;
  v5[4] = self;
  v6 = a4;
  objc_msgSend_CKMapValues_(a3, a2, (uint64_t)v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unorderedDictionary
{
  uint64_t v2;

  return (id)objc_msgSend_dictionaryRepresentationRecursive_(self->_orderedDictionary, a2, 1, v2);
}

- (NSString)descriptionPrefix
{
  return self->_descriptionPrefix;
}

- (void)setDescriptionPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionPrefix, a3);
}

- (CKOrderedDictionary)orderedDictionary
{
  return self->_orderedDictionary;
}

- (void)setOrderedDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_orderedDictionary, a3);
}

@end
