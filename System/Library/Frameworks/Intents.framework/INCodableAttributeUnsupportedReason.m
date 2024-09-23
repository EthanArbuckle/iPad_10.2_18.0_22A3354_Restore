@implementation INCodableAttributeUnsupportedReason

- (id)__INCodableDescriptionFormatStringIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonFormatStringIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonFormatStringKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *code;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INCodableAttributeUnsupportedReason;
  v4 = a3;
  -[INCodableAttributeDialog updateWithDictionary:](&v8, sel_updateWithDictionary_, v4);
  -[INCodableAttributeUnsupportedReason __INCodableDescriptionCodeKey](self, "__INCodableDescriptionCodeKey", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  code = self->_code;
  self->_code = v6;

}

- (id)__INCodableDescriptionCodeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)predicateFormat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[INSchema _supportedTypesDictionary](INSchema, "_supportedTypesDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeDialog _codableAttribute](self, "_codableAttribute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_typeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UnsupportedReasons"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v10 = v8;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v25 = v6;
      v26 = v3;
      v14 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Code"), v25, v26, (_QWORD)v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v18 = v17;
            else
              v18 = 0;
          }
          else
          {
            v18 = 0;
          }
          v19 = v18;

          -[INCodableAttributeUnsupportedReason code](self, "code");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqualToString:", v20);

          if (v21)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Predicate"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v23 = v22;
              else
                v23 = 0;
            }
            else
            {
              v23 = 0;
            }
            v6 = v25;
            v3 = v26;
            v9 = v23;

            goto LABEL_29;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v13)
          continue;
        break;
      }
      v9 = 0;
      v6 = v25;
      v3 = v26;
    }
    else
    {
      v9 = 0;
    }
LABEL_29:

  }
  else
  {
    v9 = 0;
  }

  return (NSString *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INCodableAttributeUnsupportedReason;
  v4 = -[INCodableAttributeDialog copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[INCodableAttributeUnsupportedReason code](self, "code");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCode:", v5);

  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INCodableAttributeUnsupportedReason;
  v3 = -[INCodableAttributeDialog hash](&v7, sel_hash);
  -[INCodableAttributeUnsupportedReason code](self, "code");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (v9.receiver = self,
        v9.super_class = (Class)INCodableAttributeUnsupportedReason,
        -[INCodableAttributeDialog isEqual:](&v9, sel_isEqual_, v4)))
  {
    -[INCodableAttributeUnsupportedReason code](self, "code");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "code");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)INCodableAttributeUnsupportedReason;
  -[INCodableAttributeDialog dictionaryRepresentationWithLocalizer:](&v11, sel_dictionaryRepresentationWithLocalizer_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeUnsupportedReason __INCodableDescriptionCodeKey](self, "__INCodableDescriptionCodeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  -[INCodableAttributeUnsupportedReason code](self, "code");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "if_dictionaryWithNonEmptyValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  id v13;

  v12.receiver = self;
  v12.super_class = (Class)INCodableAttributeUnsupportedReason;
  v13 = 0;
  -[INCodableAttributeDialog widgetPlistableRepresentationWithParameters:error:](&v12, sel_widgetPlistableRepresentationWithParameters_error_, a3, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }
  else
  {
    -[INCodableAttributeUnsupportedReason code](self, "code");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", v10, CFSTR("code"));

    v9 = (void *)objc_msgSend(v6, "copy");
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INCodableAttributeUnsupportedReason;
  v4 = a3;
  -[INCodableAttributeDialog encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[INCodableAttributeUnsupportedReason code](self, "code", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("code"));

}

- (INCodableAttributeUnsupportedReason)initWithCoder:(id)a3
{
  id v4;
  INCodableAttributeUnsupportedReason *v5;
  uint64_t v6;
  NSString *code;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INCodableAttributeUnsupportedReason;
  v5 = -[INCodableAttributeDialog initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("code"));
    v6 = objc_claimAutoreleasedReturnValue();
    code = v5->_code;
    v5->_code = (NSString *)v6;

  }
  return v5;
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_code, 0);
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;
  id v15;

  v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___INCodableAttributeUnsupportedReason;
  v15 = 0;
  objc_msgSendSuper2(&v14, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v15);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    objc_msgSend(v6, "intents_stringForKey:", CFSTR("code"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v7[5];
    v7[5] = v11;

    v10 = v7;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__INTypeCodableDescriptionCodeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionCodeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringLanguageCodeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonFormatStringLanguageCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryLanguageCodeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonFormatStringDictionaryLanguageCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeUnsupportedReasonFormatStringDictionaryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
