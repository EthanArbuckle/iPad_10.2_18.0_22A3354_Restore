@implementation SGRealtimeContact

- (SGRealtimeContact)initWithState:(int)a3 updatedFields:(int)a4 contact:(id)a5 identifier:(id)a6
{
  id v11;
  id v12;
  SGRealtimeContact *v13;
  SGRealtimeContact *v14;
  void *v16;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGRealtimeContact.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  }
  v17.receiver = self;
  v17.super_class = (Class)SGRealtimeContact;
  v13 = -[SGRealtimeContact init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_state = a3;
    v13->_updatedFields = objc_msgSend(v11, "updatedFields");
    objc_storeStrong((id *)&v14->_contact, a5);
    objc_storeStrong((id *)&v14->_cnContactIdentifier, a6);
    -[SGRealtimeContact setExtractionInfo](v14, "setExtractionInfo");
  }

  return v14;
}

- (id)markedAsHarvested
{
  SGRealtimeContact *v2;

  v2 = -[SGRealtimeContact initWithState:updatedFields:contact:identifier:]([SGRealtimeContact alloc], "initWithState:updatedFields:contact:identifier:", self->_state, self->_updatedFields, self->_contact, self->_cnContactIdentifier);
  v2->_isHarvested = 1;
  return v2;
}

- (SGRealtimeContact)initWithCoder:(id)a3
{
  id v5;
  SGRealtimeContact *v6;
  void *v7;
  uint64_t v8;
  SGExtractionInfo *extractionInfo;
  void *v10;
  void *v11;
  SGContact *v12;
  void *contact;
  void *v14;
  uint64_t v15;
  NSString *cnContactIdentifier;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SGRealtimeContact;
  v6 = -[SGRealtimeContact init](&v18, sel_init);
  if (v6)
  {
    v6->_state = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("state"));
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("extractionInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    extractionInfo = v6->_extractionInfo;
    v6->_extractionInfo = (SGExtractionInfo *)v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("contact"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v11;
      contact = v6->_contact;
      v6->_contact = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      contact = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(contact, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGRealtimeContact.m"), 64, CFSTR("nonnull property %s *%s was null when decoded"), "SGContact", "contact");
    }

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v14, CFSTR("cnContactIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    cnContactIdentifier = v6->_cnContactIdentifier;
    v6->_cnContactIdentifier = (NSString *)v15;

    v6->_isHarvested = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("isHarvested"));
    v6->_updatedFields = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("updatedFields"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extractionInfo, CFSTR("extractionInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contact, CFSTR("contact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cnContactIdentifier, CFSTR("cnContactIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isHarvested, CFSTR("isHarvested"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_updatedFields, CFSTR("updatedFields"));

}

- (BOOL)isEqual:(id)a3
{
  SGRealtimeContact *v4;
  SGRealtimeContact *v5;
  BOOL v6;

  v4 = (SGRealtimeContact *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGRealtimeContact isEqualToRealtimeContact:](self, "isEqualToRealtimeContact:", v5);

  return v6;
}

- (BOOL)isEqualToRealtimeContact:(id)a3
{
  id *v4;
  int state;
  NSString *cnContactIdentifier;
  NSString *v7;
  BOOL v8;
  SGExtractionInfo *extractionInfo;
  SGExtractionInfo *v11;
  SGExtractionInfo *v12;
  SGExtractionInfo *v13;
  char v14;
  SGContact *contact;
  SGContact *v16;
  SGContact *v17;
  SGContact *v18;
  BOOL v19;
  int isHarvested;

  v4 = (id *)a3;
  state = self->_state;
  if (state != objc_msgSend(v4, "state"))
  {
    v8 = 0;
    goto LABEL_6;
  }
  cnContactIdentifier = self->_cnContactIdentifier;
  objc_msgSend(v4, "cnContactIdentifier");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (cnContactIdentifier != v7)
    goto LABEL_3;
  extractionInfo = self->_extractionInfo;
  v11 = (SGExtractionInfo *)v4[5];
  if (extractionInfo == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = extractionInfo;
    v14 = -[SGExtractionInfo isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_3;
  }
  contact = self->_contact;
  v16 = (SGContact *)v4[3];
  if (contact == v16)
  {

LABEL_15:
    isHarvested = self->_isHarvested;
    v8 = isHarvested == objc_msgSend(v4, "isHarvested");
    goto LABEL_4;
  }
  v17 = v16;
  v18 = contact;
  v19 = -[SGContact isEqual:](v18, "isEqual:", v17);

  if (v19)
    goto LABEL_15;
LABEL_3:
  v8 = 0;
LABEL_4:

LABEL_6:
  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)self->_cnContactIdentifier;
}

- (void)setExtractionInfo
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  float v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *k;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  float v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *m;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  float v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  float v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  double v74;
  void *v75;
  void *v76;
  uint64_t v77;
  SGExtractionInfo *extractionInfo;
  SGRealtimeContact *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  -[SGContact name](self->_contact, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SGContact name](self->_contact, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extractionInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "extractionType");

  }
  else
  {
    v6 = 0;
  }

  v7 = (void *)objc_opt_new();
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v79 = self;
  -[SGContact phones](self->_contact, "phones");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v92, v99, 16);
  if (v9)
  {
    v2 = (void *)v9;
    v10 = *(_QWORD *)v93;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v93 != v10)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "extractionInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v6 |= objc_msgSend(v15, "extractionType");

        v11 = v11 + 1.0;
        objc_msgSend(v14, "extractionInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "confidence");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "floatValue");
        v12 = v12 + v18;

        objc_msgSend(v14, "extractionInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "modelVersion");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v20)
          v22 = (void *)v20;
        else
          v22 = &unk_1E4781388;
        objc_msgSend(v7, "addObject:", v22);

      }
      v2 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v92, v99, 16);
    }
    while (v2);
  }
  else
  {
    v11 = 0.0;
    v12 = 0.0;
  }

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  -[SGContact postalAddresses](v79->_contact, "postalAddresses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
  if (v24)
  {
    v2 = (void *)v24;
    v25 = *(_QWORD *)v89;
    do
    {
      for (j = 0; j != v2; j = (char *)j + 1)
      {
        if (*(_QWORD *)v89 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v27, "extractionInfo");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v6 |= objc_msgSend(v28, "extractionType");

        v11 = v11 + 1.0;
        objc_msgSend(v27, "extractionInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "confidence");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "floatValue");
        v12 = v12 + v31;

        objc_msgSend(v27, "extractionInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "modelVersion");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v33;
        if (v33)
          v35 = (void *)v33;
        else
          v35 = &unk_1E4781388;
        objc_msgSend(v7, "addObject:", v35);

      }
      v2 = (void *)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
    }
    while (v2);
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[SGContact emailAddresses](v79->_contact, "emailAddresses");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
  if (v37)
  {
    v2 = (void *)v37;
    v38 = *(_QWORD *)v85;
    do
    {
      for (k = 0; k != v2; k = (char *)k + 1)
      {
        if (*(_QWORD *)v85 != v38)
          objc_enumerationMutation(v36);
        v40 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)k);
        objc_msgSend(v40, "extractionInfo");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v6 |= objc_msgSend(v41, "extractionType");

        v11 = v11 + 1.0;
        objc_msgSend(v40, "extractionInfo");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "confidence");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "floatValue");
        v12 = v12 + v44;

        objc_msgSend(v40, "extractionInfo");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "modelVersion");
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = (void *)v46;
        if (v46)
          v48 = (void *)v46;
        else
          v48 = &unk_1E4781388;
        objc_msgSend(v7, "addObject:", v48);

      }
      v2 = (void *)objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
    }
    while (v2);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  -[SGContact socialProfiles](v79->_contact, "socialProfiles");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
  if (v50)
  {
    v2 = (void *)v50;
    v51 = *(_QWORD *)v81;
    do
    {
      for (m = 0; m != v2; m = (char *)m + 1)
      {
        if (*(_QWORD *)v81 != v51)
          objc_enumerationMutation(v49);
        v53 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)m);
        objc_msgSend(v53, "extractionInfo");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v6 |= objc_msgSend(v54, "extractionType");

        v11 = v11 + 1.0;
        objc_msgSend(v53, "extractionInfo");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "confidence");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "floatValue");
        v12 = v12 + v57;

        objc_msgSend(v53, "extractionInfo");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "modelVersion");
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = (void *)v59;
        if (v59)
          v61 = (void *)v59;
        else
          v61 = &unk_1E4781388;
        objc_msgSend(v7, "addObject:", v61);

      }
      v2 = (void *)objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
    }
    while (v2);
  }

  -[SGContact birthday](v79->_contact, "birthday");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    -[SGContact birthday](v79->_contact, "birthday");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "extractionInfo");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v6 |= objc_msgSend(v64, "extractionType");

    v11 = v11 + 1.0;
    -[SGContact birthday](v79->_contact, "birthday");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "extractionInfo");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "confidence");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "floatValue");
    v12 = v12 + v68;

    -[SGContact birthday](v79->_contact, "birthday");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "extractionInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "modelVersion");
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = (void *)v70;
    if (v70)
      v72 = (void *)v70;
    else
      v72 = &unk_1E4781388;
    objc_msgSend(v7, "addObject:", v72);

  }
  v73 = objc_msgSend(v7, "count");
  if (v73 == 1)
  {
    objc_msgSend(v7, "allObjects");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v75 = &unk_1E47813A0;
  }
  if (v11 <= 0.0)
  {
    v76 = 0;
  }
  else
  {
    *(float *)&v74 = v12 / v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[SGExtractionInfo extractionInfoWithExtractionType:modelVersion:confidence:](SGExtractionInfo, "extractionInfoWithExtractionType:modelVersion:confidence:", v6, v75, v76);
  v77 = objc_claimAutoreleasedReturnValue();
  extractionInfo = v79->_extractionInfo;
  v79->_extractionInfo = (SGExtractionInfo *)v77;

  if (v11 > 0.0)
  if (v73 == 1)
  {

  }
}

- (void)setCnContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cnContactIdentifier, a3);
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGRealtimeContact state=%i identifier=%@\ncontact = %@\n>"), self->_state, self->_cnContactIdentifier, self->_contact);
}

- (int)state
{
  return self->_state;
}

- (int)updatedFields
{
  return self->_updatedFields;
}

- (SGContact)contact
{
  return self->_contact;
}

- (NSString)cnContactIdentifier
{
  return self->_cnContactIdentifier;
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (BOOL)isHarvested
{
  return self->_isHarvested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_cnContactIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)realtimeContactForNewContact:(id)a3
{
  id v3;
  SGRealtimeContact *v4;

  v3 = a3;
  v4 = -[SGRealtimeContact initWithState:updatedFields:contact:identifier:]([SGRealtimeContact alloc], "initWithState:updatedFields:contact:identifier:", 1, 0, v3, &stru_1E4762D08);

  return v4;
}

+ (id)realtimeContactForFields:(id)a3 updatedFields:(int)a4 addedToCuratedContact:(id)a5
{
  uint64_t v5;
  id v7;
  id v8;
  SGRealtimeContact *v9;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = a3;
  v9 = -[SGRealtimeContact initWithState:updatedFields:contact:identifier:]([SGRealtimeContact alloc], "initWithState:updatedFields:contact:identifier:", 2, v5, v8, v7);

  return v9;
}

@end
