@implementation INAppendToNoteIntent

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INAppendToNoteIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INAppendToNoteIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 8;
}

- (id)_categoryVerb
{
  return CFSTR("Add");
}

- (INAppendToNoteIntent)initWithTargetNote:(INNote *)targetNote content:(INNoteContent *)content
{
  INNote *v6;
  INNoteContent *v7;
  INAppendToNoteIntent *v8;
  INAppendToNoteIntent *v9;
  objc_super v11;

  v6 = targetNote;
  v7 = content;
  v11.receiver = self;
  v11.super_class = (Class)INAppendToNoteIntent;
  v8 = -[INIntent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[INAppendToNoteIntent setTargetNote:](v8, "setTargetNote:", v6);
    -[INAppendToNoteIntent setContent:](v9, "setContent:", v7);
  }

  return v9;
}

- (INNote)targetNote
{
  void *v2;
  void *v3;
  void *v4;

  -[INAppendToNoteIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetNote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromNote(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INNote *)v4;
}

- (void)setTargetNote:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INAppendToNoteIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToNote(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTargetNote:", v5);
}

- (INNoteContent)content
{
  void *v2;
  void *v3;
  void *v4;

  -[INAppendToNoteIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromNoteContent(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INNoteContent *)v4;
}

- (void)setContent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INAppendToNoteIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToNoteContent(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setContent:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("targetNote");
  -[INAppendToNoteIntent targetNote](self, "targetNote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("content");
  v10[0] = v4;
  -[INAppendToNoteIntent content](self, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)

  if (!v3)
  return v7;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INAppendToNoteIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Notebook");
}

- (id)verb
{
  return CFSTR("AppendToNote");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
