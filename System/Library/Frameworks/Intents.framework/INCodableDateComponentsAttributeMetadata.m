@implementation INCodableDateComponentsAttributeMetadata

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  unint64_t v24;
  void *v25;
  NSString *v26;
  NSString *formatString;
  void *v28;
  NSString *v29;
  NSString *formatStringID;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)INCodableDateComponentsAttributeMetadata;
  -[INCodableAttributeMetadata updateWithDictionary:](&v31, sel_updateWithDictionary_, v4);
  -[INCodableDateComponentsAttributeMetadata __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = INCodableDateComponentsAttributeMetadataTypeFromString(v8);
  self->_type = v9;
  -[INCodableDateComponentsAttributeMetadata __INCodableDescriptionFormatKey](self, "__INCodableDescriptionFormatKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  v14 = INCodableDateComponentsAttributeMetadataFormatFromString(v13);
  self->_format = v14;
  -[INCodableDateComponentsAttributeMetadata __INCodableDescriptionDateStyleKey](self, "__INCodableDescriptionDateStyleKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  v19 = INCodableDateComponentsAttributeMetadataStyleFromString(v18);
  self->_dateStyle = v19;
  -[INCodableDateComponentsAttributeMetadata __INCodableDescriptionTimeStyleKey](self, "__INCodableDescriptionTimeStyleKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  v24 = INCodableDateComponentsAttributeMetadataStyleFromString(v23);
  self->_timeStyle = v24;
  -[INCodableDateComponentsAttributeMetadata __INCodableDescriptionTemplateKey](self, "__INCodableDescriptionTemplateKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v25);
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  formatString = self->_formatString;
  self->_formatString = v26;

  -[INCodableDateComponentsAttributeMetadata __INCodableDescriptionTemplateIDKey](self, "__INCodableDescriptionTemplateIDKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v28);
  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
  formatStringID = self->_formatStringID;
  self->_formatStringID = v29;

}

- (id)__INCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionTimeStyleKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTimeStyleKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionTemplateIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTemplateIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionTemplateKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTemplateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataFormatKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionDateStyleKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataDateStyleKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  int64_t v5;
  __CFString *v6;
  int64_t v7;
  __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[6];
  _QWORD v32[8];

  v32[6] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)INCodableDateComponentsAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata dictionaryRepresentationWithLocalizer:](&v30, sel_dictionaryRepresentationWithLocalizer_, v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableDateComponentsAttributeMetadata __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v29;
  v5 = -[INCodableDateComponentsAttributeMetadata type](self, "type");
  v6 = CFSTR("DateTime");
  if (v5 == 1)
    v6 = CFSTR("Date");
  if (v5 == 2)
    v6 = CFSTR("Time");
  v28 = v6;
  v32[0] = v28;
  -[INCodableDateComponentsAttributeMetadata __INCodableDescriptionFormatKey](self, "__INCodableDescriptionFormatKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v27;
  v7 = -[INCodableDateComponentsAttributeMetadata format](self, "format");
  v8 = CFSTR("Style");
  if (v7 == 1)
    v8 = CFSTR("Relative");
  if (v7 == 2)
    v8 = CFSTR("Template");
  v26 = v8;
  v32[1] = v26;
  -[INCodableDateComponentsAttributeMetadata __INCodableDescriptionDateStyleKey](self, "__INCodableDescriptionDateStyleKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v24;
  v9 = -[INCodableDateComponentsAttributeMetadata dateStyle](self, "dateStyle");
  if (v9 > 3)
    v10 = CFSTR("Full");
  else
    v10 = off_1E228FB88[v9];
  v32[2] = v10;
  -[INCodableDateComponentsAttributeMetadata __INCodableDescriptionTimeStyleKey](self, "__INCodableDescriptionTimeStyleKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v11;
  v12 = -[INCodableDateComponentsAttributeMetadata timeStyle](self, "timeStyle");
  if (v12 > 3)
    v13 = CFSTR("Full");
  else
    v13 = off_1E228FB88[v12];
  v32[3] = v13;
  -[INCodableDateComponentsAttributeMetadata __INCodableDescriptionTemplateKey](self, "__INCodableDescriptionTemplateKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v14;
  -[INCodableDateComponentsAttributeMetadata localizedFormatStringWithLocalizer:](self, "localizedFormatStringWithLocalizer:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[4] = v16;
  -[INCodableDateComponentsAttributeMetadata __INCodableDescriptionTemplateIDKey](self, "__INCodableDescriptionTemplateIDKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v17;
  -[INCodableDateComponentsAttributeMetadata formatStringID](self, "formatStringID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[5] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "if_dictionaryByAddingEntriesFromDictionary:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  if (!v15)

  objc_msgSend(v21, "if_dictionaryWithNonEmptyValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)localizedFormatString
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableDateComponentsAttributeMetadata localizedFormatStringWithLocalizer:](self, "localizedFormatStringWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedFormatStringWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[INCodableDateComponentsAttributeMetadata formatStringID](self, "formatStringID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableDateComponentsAttributeMetadata formatString](self, "formatString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeMetadata _localizationTable](self, "_localizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v5, v6, v7, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;
  id v12;

  v11.receiver = self;
  v11.super_class = (Class)INCodableDateComponentsAttributeMetadata;
  v12 = 0;
  -[INCodableAttributeMetadata widgetPlistableRepresentationWithParameters:error:](&v11, sel_widgetPlistableRepresentationWithParameters_error_, 0, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }
  else
  {
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_type, CFSTR("type"));
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_format, CFSTR("format"));
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_dateStyle, CFSTR("dateStyle"));
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", self->_timeStyle, CFSTR("timeStyle"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_formatString, CFSTR("formatString"));
    objc_msgSend(v6, "intents_setPlistSafeObject:forKey:", self->_formatStringID, CFSTR("formatStringID"));
    v9 = (void *)objc_msgSend(v6, "copy");
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableDateComponentsAttributeMetadata;
  v4 = a3;
  -[INCodableAttributeMetadata encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_format, CFSTR("format"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_dateStyle, CFSTR("dateStyle"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_timeStyle, CFSTR("timeStyle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_formatString, CFSTR("formatString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_formatStringID, CFSTR("formatStringID"));

}

- (INCodableDateComponentsAttributeMetadata)initWithCoder:(id)a3
{
  id v4;
  INCodableDateComponentsAttributeMetadata *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *formatString;
  uint64_t v11;
  NSString *formatStringID;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INCodableDateComponentsAttributeMetadata;
  v5 = -[INCodableAttributeMetadata initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_format = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("format"));
    v5->_dateStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dateStyle"));
    v5->_timeStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timeStyle"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("formatString"));
    v9 = objc_claimAutoreleasedReturnValue();
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formatStringID"));
    v11 = objc_claimAutoreleasedReturnValue();
    formatStringID = v5->_formatStringID;
    v5->_formatStringID = (NSString *)v11;

  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)format
{
  return self->_format;
}

- (unint64_t)dateStyle
{
  return self->_dateStyle;
}

- (unint64_t)timeStyle
{
  return self->_timeStyle;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (NSString)formatStringID
{
  return self->_formatStringID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatStringID, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
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
  uint64_t v13;
  void *v14;
  objc_super v16;
  id v17;

  v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___INCodableDateComponentsAttributeMetadata;
  v17 = 0;
  objc_msgSendSuper2(&v16, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v17);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    v7[5] = objc_msgSend(v6, "intents_intForKey:", CFSTR("type"));
    v7[6] = objc_msgSend(v6, "intents_intForKey:", CFSTR("format"));
    v7[7] = objc_msgSend(v6, "intents_intForKey:", CFSTR("dateStyle"));
    v7[8] = objc_msgSend(v6, "intents_intForKey:", CFSTR("timeStyle"));
    objc_msgSend(v6, "intents_stringForKey:", CFSTR("formatString"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v7[9];
    v7[9] = v11;

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("formatStringID"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v7[10];
    v7[10] = v13;

    v10 = v7;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionTimeStyleKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTimeStyleKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionTemplateIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTemplateIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionTemplateKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTemplateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionFormatKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataFormatKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionDateStyleKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataDateStyleKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTimeStyleKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTimeStyleKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTemplateIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTemplateIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTemplateKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataTemplateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionFormatKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataFormatKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionDateStyleKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeMetadata _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableDateComponentsAttributeMetadataDateStyleKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
