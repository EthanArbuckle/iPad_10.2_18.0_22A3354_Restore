@implementation AFMutableConversationItem

- (AFMutableConversationItem)initWithIdentifier:(id)a3 revisionIdentifier:(id)a4 type:(int64_t)a5 aceObject:(id)a6 dialogPhase:(id)a7 presentationState:(int64_t)a8 aceCommandIdentifier:(id)a9 virgin:(BOOL)a10 transient:(BOOL)a11 supplemental:(BOOL)a12 immersiveExperience:(BOOL)a13 persistentAcrossInvocations:(BOOL)a14 associatedDataStore:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  AFMutableConversationItem *v25;
  uint64_t v26;
  NSUUID *identifier;
  uint64_t v28;
  NSUUID *revisionIdentifier;
  uint64_t v30;
  NSString *aceCommandIdentifier;
  id v34;
  objc_super v35;

  v34 = a3;
  v20 = a4;
  v21 = a6;
  v22 = a7;
  v23 = a9;
  v24 = a15;
  v35.receiver = self;
  v35.super_class = (Class)AFMutableConversationItem;
  v25 = -[AFMutableConversationItem init](&v35, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v34, "copy");
    identifier = v25->_identifier;
    v25->_identifier = (NSUUID *)v26;

    v28 = objc_msgSend(v20, "copy");
    revisionIdentifier = v25->_revisionIdentifier;
    v25->_revisionIdentifier = (NSUUID *)v28;

    v25->_type = a5;
    objc_storeStrong((id *)&v25->_aceObject, a6);
    objc_storeStrong((id *)&v25->_dialogPhase, a7);
    v25->_presentationState = a8;
    v30 = objc_msgSend(v23, "copy");
    aceCommandIdentifier = v25->_aceCommandIdentifier;
    v25->_aceCommandIdentifier = (NSString *)v30;

    v25->_virgin = a10;
    v25->_transient = a11;
    v25->_supplemental = a12;
    v25->_immersiveExperience = a13;
    v25->_persistentAcrossInvocations = a14;
    objc_storeStrong((id *)&v25->_associatedDataStore, a15);
  }

  return v25;
}

- (AFMutableConversationItem)initWithIdentifier:(id)a3 type:(int64_t)a4 aceObject:(id)a5 dialogPhase:(id)a6 presentationState:(int64_t)a7 aceCommandIdentifier:(id)a8 virgin:(BOOL)a9 transient:(BOOL)a10 supplemental:(BOOL)a11 immersiveExperience:(BOOL)a12 persistentAcrossInvocations:(BOOL)a13 associatedDataStore:(id)a14
{
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  AFMutableConversationItem *v25;
  uint64_t v27;

  v18 = (objc_class *)MEMORY[0x1E0CB3A28];
  v19 = a14;
  v20 = a8;
  v21 = a6;
  v22 = a5;
  v23 = a3;
  v24 = objc_alloc_init(v18);
  BYTE4(v27) = a13;
  BYTE3(v27) = a12;
  BYTE2(v27) = a11;
  LOWORD(v27) = __PAIR16__(a10, a9);
  v25 = -[AFMutableConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:](self, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v23, v24, a4, v22, v21, a7, v20, v27, v19);

  return v25;
}

- (AFMutableConversationItem)initWithType:(int64_t)a3 aceObject:(id)a4 dialogPhase:(id)a5 presentationState:(int64_t)a6 aceCommandIdentifier:(id)a7 virgin:(BOOL)a8 transient:(BOOL)a9 supplemental:(BOOL)a10 immersiveExperience:(BOOL)a11 persistentAcrossInvocations:(BOOL)a12 associatedDataStore:(id)a13
{
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  AFMutableConversationItem *v23;
  uint64_t v25;

  v17 = (objc_class *)MEMORY[0x1E0CB3A28];
  v18 = a13;
  v19 = a7;
  v20 = a5;
  v21 = a4;
  v22 = objc_alloc_init(v17);
  BYTE4(v25) = a12;
  BYTE3(v25) = a11;
  BYTE2(v25) = a10;
  BYTE1(v25) = a9;
  LOBYTE(v25) = a8;
  v23 = -[AFMutableConversationItem initWithIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:](self, "initWithIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v22, a3, v21, v20, a6, v19, v25, v18);

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  AFConversationItem *v14;
  uint64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  AFConversationItem *v20;

  v20 = [AFConversationItem alloc];
  -[AFMutableConversationItem identifier](self, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFMutableConversationItem revisionIdentifier](self, "revisionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AFMutableConversationItem type](self, "type");
  -[AFMutableConversationItem aceObject](self, "aceObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFMutableConversationItem dialogPhase](self, "dialogPhase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AFMutableConversationItem presentationState](self, "presentationState");
  -[AFMutableConversationItem aceCommandIdentifier](self, "aceCommandIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AFMutableConversationItem isVirgin](self, "isVirgin");
  v9 = -[AFMutableConversationItem isTransient](self, "isTransient");
  v10 = -[AFMutableConversationItem isSupplemental](self, "isSupplemental");
  v11 = -[AFMutableConversationItem isImmersiveExperience](self, "isImmersiveExperience");
  v12 = -[AFMutableConversationItem isPersistentAcrossInvocations](self, "isPersistentAcrossInvocations");
  -[AFMutableConversationItem associatedDataStore](self, "associatedDataStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE4(v16) = v12;
  BYTE3(v16) = v11;
  BYTE2(v16) = v10;
  BYTE1(v16) = v9;
  LOBYTE(v16) = v8;
  v14 = -[AFConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:](v20, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v19, v18, v17, v4, v5, v6, v7, v16, v13);

  return v14;
}

- (NSString)description
{
  unint64_t v3;
  __CFString *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;

  v3 = -[AFMutableConversationItem type](self, "type");
  if (v3 > 5)
    v4 = 0;
  else
    v4 = off_1E3A2D298[v3];
  v5 = -[AFMutableConversationItem presentationState](self, "presentationState");
  if (v5 > 3)
    v6 = 0;
  else
    v6 = off_1E3A2D2C8[v5];
  -[AFMutableConversationItem aceObject](self, "aceObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "af_dialogIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", dialogIdentifier=%@"), v8);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = &stru_1E3A37708;
  }
  if (-[AFMutableConversationItem _shouldRedactSpeakableText](self, "_shouldRedactSpeakableText"))
  {
    v9 = CFSTR("<private>");
    v10 = CFSTR("<private>");
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", dialogText=\"%@\"), v9);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  -[AFMutableConversationItem aceObject](self, "aceObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "af_text");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[AFMutableConversationItem aceObject](self, "aceObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "af_speakableText");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_13;
  v13 = &stru_1E3A37708;
LABEL_15:
  v33 = v4;
  v34 = (void *)v8;
  v32 = v6;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, speakableText=\"%@\"), v13, v10);
    v14 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v14;
  }
  else
  {
    v25 = v13;
  }
  v29 = (void *)MEMORY[0x1E0CB3940];
  -[AFMutableConversationItem identifier](self, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "UUIDString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFMutableConversationItem revisionIdentifier](self, "revisionIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFMutableConversationItem aceObject](self, "aceObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_class();
  -[AFMutableConversationItem dialogPhase](self, "dialogPhase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFMutableConversationItem aceCommandIdentifier](self, "aceCommandIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AFMutableConversationItem isTransient](self, "isTransient"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  if (-[AFMutableConversationItem isSupplemental](self, "isSupplemental"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  if (-[AFMutableConversationItem isImmersiveExperience](self, "isImmersiveExperience"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  if (-[AFMutableConversationItem isPersistentAcrossInvocations](self, "isPersistentAcrossInvocations"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v29, "stringWithFormat:", CFSTR("<ConversationItem %p; %@ (revision %@): type=%@, aceObject=%@, dialogPhase=%@, presentationState=%@, aceCommandIdentifier=%@%@%@, transient=%@, supplemental=%@, immersiveExperience=%@, persistentAcrossInvocations=%@>"),
    self,
    v28,
    v15,
    v33,
    v27,
    v17,
    v32,
    v18,
    v26,
    v25,
    v19,
    v20,
    v21,
    v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v23;
}

- (void)_didMutate
{
  NSUUID *v3;
  NSUUID *revisionIdentifier;

  v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
  revisionIdentifier = self->_revisionIdentifier;
  self->_revisionIdentifier = v3;

}

- (void)setAceObject:(id)a3
{
  objc_storeStrong((id *)&self->_aceObject, a3);
  -[AFMutableConversationItem _didMutate](self, "_didMutate");
}

- (void)setDialogPhase:(id)a3
{
  objc_storeStrong((id *)&self->_dialogPhase, a3);
  -[AFMutableConversationItem _didMutate](self, "_didMutate");
}

- (BOOL)_shouldRedactSpeakableText
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AFMutableConversationItem aceObject](self, "aceObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LODWORD(v3) = objc_msgSend(v2, "canUseServerTTS") ^ 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      objc_msgSend(v2, "views", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v10;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v3);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "canUseServerTTS"))
            {

              LOBYTE(v3) = 1;
              goto LABEL_5;
            }
          }
          v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          if (v6)
            continue;
          break;
        }
      }

    }
    LOBYTE(v3) = 0;
  }
LABEL_5:

  return (char)v3;
}

- (id)_propertyListStringForType
{
  int64_t v2;

  v2 = -[AFMutableConversationItem type](self, "type");
  if ((unint64_t)(v2 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_1E3A2D2E8[v2 - 1];
}

- (int64_t)_typeForPropertyListString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RecognizedSpeech")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("View")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartialSpeechResult")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Help")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AcousticID Spinner")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_propertyListStringForPresentationState
{
  int64_t v2;

  v2 = -[AFMutableConversationItem presentationState](self, "presentationState");
  if ((unint64_t)(v2 - 1) > 2)
    return CFSTR("Unknown");
  else
    return off_1E3A2D310[v2 - 1];
}

- (int64_t)_presentationStateForPropertyListString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Committed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Provisional")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Cancelled")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)propertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_1E3AA59C8, CFSTR("Version"));
  -[AFMutableConversationItem identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Identifier"));

  -[AFMutableConversationItem revisionIdentifier](self, "revisionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("RevisionIdentifier"));

  -[AFMutableConversationItem _propertyListStringForType](self, "_propertyListStringForType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("Type"));

  -[AFMutableConversationItem aceObject](self, "aceObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("AceObject"));

  -[AFMutableConversationItem dialogPhase](self, "dialogPhase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "aceDialogPhaseValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("AceDialogPhase"));
  -[AFMutableConversationItem _propertyListStringForPresentationState](self, "_propertyListStringForPresentationState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("PresentationState"));

  -[AFMutableConversationItem aceCommandIdentifier](self, "aceCommandIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("AceCommandIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AFMutableConversationItem isTransient](self, "isTransient"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("Transient"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AFMutableConversationItem isSupplemental](self, "isSupplemental"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("Supplemental"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AFMutableConversationItem isImmersiveExperience](self, "isImmersiveExperience"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("ImmersiveExperience"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AFMutableConversationItem isPersistentAcrossInvocations](self, "isPersistentAcrossInvocations"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("PersistentAcrossInvocations"));

  -[AFMutableConversationItem associatedDataStore](self, "associatedDataStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "propertyListRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("AssociatedDataStore"));
  return v3;
}

- (AFMutableConversationItem)initWithPropertyListRepresentation:(id)a3
{
  id v4;
  AFDictionarySchema *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  AFMutableConversationItem *v10;
  void *v11;
  void *v12;
  void *v13;
  AFMutableConversationItem *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  AFMutableConversationItem *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  char v47;
  AFDataStore *v48;
  void *v49;
  AFDataStore *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  AFMutableConversationItem *v67;
  id v68;
  _QWORD v69[4];
  AFMutableConversationItem *v70;
  _QWORD v71[4];
  AFMutableConversationItem *v72;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(AFDictionarySchema);
  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v6, CFSTR("Version"));

  +[AFCoercion stringToUUIDCoercion](AFCoercion, "stringToUUIDCoercion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v7, CFSTR("Identifier"));

  +[AFCoercion stringToUUIDCoercion](AFCoercion, "stringToUUIDCoercion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v8, CFSTR("RevisionIdentifier"));

  v9 = MEMORY[0x1E0C809B0];
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __64__AFMutableConversationItem_initWithPropertyListRepresentation___block_invoke;
  v71[3] = &unk_1E3A2D278;
  v10 = self;
  v72 = v10;
  +[AFCoercion coercionWithBlock:](AFCoercion, "coercionWithBlock:", v71);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v11, CFSTR("Type"));

  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v12, CFSTR("AceObject"));

  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v13, CFSTR("AceDialogPhase"));

  v69[0] = v9;
  v69[1] = 3221225472;
  v69[2] = __64__AFMutableConversationItem_initWithPropertyListRepresentation___block_invoke_2;
  v69[3] = &unk_1E3A2D278;
  v14 = v10;
  v70 = v14;
  +[AFCoercion coercionWithBlock:](AFCoercion, "coercionWithBlock:", v69);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v15, CFSTR("PresentationState"));

  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v16, CFSTR("AceCommandIdentifier"));

  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v17, CFSTR("Transient"));

  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v18, CFSTR("Supplemental"));

  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v19, CFSTR("ImmersiveExperience"));

  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v20, CFSTR("PersistentAcrossInvocations"));

  v68 = 0;
  -[AFDictionarySchema coerceObject:error:](v5, "coerceObject:error:", v4, &v68);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v68;
  if (!v21)
  {
    v32 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      v37 = 0;
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315650;
    v74 = "-[AFMutableConversationItem initWithPropertyListRepresentation:]";
    v75 = 2114;
    v76 = (uint64_t)v22;
    v77 = 2112;
    v78 = v4;
    v33 = "%s returning nil; passed invalid property list (%{public}@): %@";
    v34 = v32;
    v35 = 32;
LABEL_20:
    _os_log_error_impl(&dword_19AF50000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
    goto LABEL_10;
  }
  objc_msgSend(v21, "objectForKey:", CFSTR("Version"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "integerValue");

  if (v24 != 1)
  {
    v36 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)buf = 136315394;
    v74 = "-[AFMutableConversationItem initWithPropertyListRepresentation:]";
    v75 = 2050;
    v76 = v24;
    v33 = "%s unable to deserialize property list with version %{public}ld; returning nil";
    v34 = v36;
    v35 = 22;
    goto LABEL_20;
  }
  v66 = v4;
  objc_msgSend(v21, "objectForKey:", CFSTR("Identifier"));
  v63 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("RevisionIdentifier"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if (!v25)
    v25 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v62 = v25;
  objc_msgSend(v21, "objectForKey:", CFSTR("Type"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "integerValue");

  v28 = (void *)MEMORY[0x1E0D87F40];
  objc_msgSend(v21, "objectForKey:", CFSTR("AceObject"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "aceObjectWithDictionary:", v29);
  v30 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "objectForKey:", CFSTR("AceDialogPhase"));
  v31 = objc_claimAutoreleasedReturnValue();
  v64 = v22;
  v65 = (void *)v31;
  v61 = (void *)v30;
  v67 = v14;
  if (v31)
    +[AFDialogPhase dialogPhaseForAceDialogPhase:](AFDialogPhase, "dialogPhaseForAceDialogPhase:", v31);
  else
    +[AFDialogPhase userRequestDialogPhase](AFDialogPhase, "userRequestDialogPhase");
  v60 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("PresentationState"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v38, "integerValue");

  objc_msgSend(v21, "objectForKey:", CFSTR("AceCommandIdentifier"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("Transient"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "BOOLValue");

  objc_msgSend(v21, "objectForKey:", CFSTR("Supplemental"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "BOOLValue");

  objc_msgSend(v21, "objectForKey:", CFSTR("ImmersiveExperience"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "BOOLValue");

  objc_msgSend(v21, "objectForKey:", CFSTR("PersistentAcrossInvocations"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "BOOLValue");

  v48 = [AFDataStore alloc];
  objc_msgSend(v21, "objectForKey:", CFSTR("AssociatedDataStore"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[AFDataStore initWithPropertyListRepresentation:](v48, "initWithPropertyListRepresentation:", v49);

  if (v50)
  {
    BYTE4(v58) = v47;
    BYTE3(v58) = v45;
    BYTE2(v58) = v43;
    BYTE1(v58) = v41;
    LOBYTE(v58) = 0;
    v52 = v62;
    v51 = (void *)v63;
    v53 = v27;
    v55 = (void *)v60;
    v54 = v61;
    v37 = -[AFMutableConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:](v67, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v63, v62, v53, v61, v60, v59, v39, v58, v50);
    v67 = v37;
    v22 = v64;
  }
  else
  {
    v56 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v74 = "-[AFMutableConversationItem initWithPropertyListRepresentation:]";
      v75 = 2112;
      v76 = (uint64_t)v66;
      _os_log_error_impl(&dword_19AF50000, v56, OS_LOG_TYPE_ERROR, "%s returning nil; unable co create associated data store from property list %@",
        buf,
        0x16u);
    }
    v37 = 0;
    v51 = (void *)v63;
    v22 = v64;
    v54 = v61;
    v52 = v62;
    v55 = (void *)v60;
  }

  v4 = v66;
  v14 = v67;
LABEL_18:

  return v37;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)revisionIdentifier
{
  return self->_revisionIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (AFDialogPhase)dialogPhase
{
  return self->_dialogPhase;
}

- (NSString)aceCommandIdentifier
{
  return self->_aceCommandIdentifier;
}

- (void)setAceCommandIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (BOOL)isVirgin
{
  return self->_virgin;
}

- (void)setVirgin:(BOOL)a3
{
  self->_virgin = a3;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (BOOL)isSupplemental
{
  return self->_supplemental;
}

- (void)setSupplemental:(BOOL)a3
{
  self->_supplemental = a3;
}

- (BOOL)isImmersiveExperience
{
  return self->_immersiveExperience;
}

- (void)setImmersiveExperience:(BOOL)a3
{
  self->_immersiveExperience = a3;
}

- (BOOL)isPersistentAcrossInvocations
{
  return self->_persistentAcrossInvocations;
}

- (void)setPersistentAcrossInvocations:(BOOL)a3
{
  self->_persistentAcrossInvocations = a3;
}

- (AFDataStore)associatedDataStore
{
  return self->_associatedDataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDataStore, 0);
  objc_storeStrong((id *)&self->_aceCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_dialogPhase, 0);
  objc_storeStrong((id *)&self->_aceObject, 0);
  objc_storeStrong((id *)&self->_revisionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

id __64__AFMutableConversationItem_initWithPropertyListRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a2;
  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coerceObject:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "_typeForPropertyListString:", v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __64__AFMutableConversationItem_initWithPropertyListRepresentation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a2;
  +[AFCoercion typeAssertionWithClass:](AFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coerceObject:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "_presentationStateForPropertyListString:", v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
