@implementation INCodableAttributePromptDialog

- (id)__INCodableDescriptionFormatStringKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogFormatStringKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)INCodableAttributePromptDialog;
  v4 = a3;
  -[INCodableAttributeDialog updateWithDictionary:](&v11, sel_updateWithDictionary_, v4);
  -[INCodableAttributePromptDialog __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey", v11.receiver, v11.super_class);
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

  v9 = v8;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Primary")) & 1) != 0)
  {
    v10 = 0;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Concise")) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("DisambiguationIntroduction")) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SubsequentIntroduction")) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("DisambiguationSelection")) & 1) != 0)
  {
    v10 = 4;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("Confirmation")) & 1) != 0)
  {
    v10 = 5;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("Configuration")))
  {
    v10 = 6;
  }
  else
  {
    v10 = 0;
  }

  self->_type = v10;
}

- (id)__INCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogFormatStringIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INCodableAttributePromptDialog)initWithCoder:(id)a3
{
  id v4;
  INCodableAttributePromptDialog *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)INCodableAttributePromptDialog;
  v5 = -[INCodableAttributeDialog initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableAttributePromptDialog;
  v4 = a3;
  -[INCodableAttributeDialog encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[INCodableAttributePromptDialog type](self, "type", v5.receiver, v5.super_class), CFSTR("type"));

}

- (id)__INCodableDescriptionFormatStringLanguageCodeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogFormatStringLanguageCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryLanguageCodeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogFormatStringDictionaryLanguageCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogFormatStringDictionaryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INCodableAttributePromptDialog;
  v4 = -[INCodableAttributeDialog copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setType:", -[INCodableAttributePromptDialog type](self, "type"));
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INCodableAttributePromptDialog;
  v3 = -[INCodableAttributeDialog hash](&v5, sel_hash);
  return -[INCodableAttributePromptDialog type](self, "type") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (v8.receiver = self,
        v8.super_class = (Class)INCodableAttributePromptDialog,
        -[INCodableAttributeDialog isEqual:](&v8, sel_isEqual_, v4)))
  {
    v5 = -[INCodableAttributePromptDialog type](self, "type");
    v6 = v5 == objc_msgSend(v4, "type");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)INCodableAttributePromptDialog;
  -[INCodableAttributeDialog dictionaryRepresentationWithLocalizer:](&v12, sel_dictionaryRepresentationWithLocalizer_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributePromptDialog __INCodableDescriptionTypeKey](self, "__INCodableDescriptionTypeKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  v6 = -[INCodableAttributePromptDialog type](self, "type");
  if (v6 - 1 > 5)
    v7 = CFSTR("Primary");
  else
    v7 = off_1E2292760[v6 - 1];
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "if_dictionaryWithNonEmptyValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  v11.super_class = (Class)INCodableAttributePromptDialog;
  v12 = 0;
  -[INCodableAttributeDialog widgetPlistableRepresentationWithParameters:error:](&v11, sel_widgetPlistableRepresentationWithParameters_error_, a3, &v12);
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
    objc_msgSend(v6, "intents_setIntegerIfNonZero:forKey:", -[INCodableAttributePromptDialog type](self, "type"), CFSTR("type"));
    v9 = (void *)objc_msgSend(v6, "copy");
  }

  return v9;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  objc_super v12;
  id v13;

  v6 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___INCodableAttributePromptDialog;
  v13 = 0;
  objc_msgSendSuper2(&v12, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v13);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
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
    v10 = v7;
  }

  return v10;
}

- (id)__INTypeCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INTypeCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionTypeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogTypeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INIntentResponseCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributePromptDialogKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
