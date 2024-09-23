@implementation SGEventMetadata

- (SGEventMetadata)initWithType:(unsigned __int8)a3 categoryDescription:(id)a4 originBundleId:(id)a5 confidence:(double)a6 schemaOrg:(id)a7 participants:(id)a8
{
  return -[SGEventMetadata initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:eventActivities:](self, "initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:eventActivities:", a3, a4, a5, a7, a8, 0, a6);
}

- (SGEventMetadata)initWithType:(unsigned __int8)a3 categoryDescription:(id)a4 originBundleId:(id)a5 confidence:(double)a6 schemaOrg:(id)a7 participants:(id)a8 eventActivities:(id)a9
{
  __CFString *v16;
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  SGEventMetadata *v21;
  SGEventMetadata *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v16 = (__CFString *)a4;
  v17 = (__CFString *)a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v30.receiver = self;
  v30.super_class = (Class)SGEventMetadata;
  v21 = -[SGEventMetadata init](&v30, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_type = a3;
    if (v16)
      v23 = v16;
    else
      v23 = CFSTR("Unknown");
    objc_storeStrong((id *)&v21->_categoryDescription, v23);
    if (v17)
      v24 = v17;
    else
      v24 = CFSTR("Unknown");
    objc_storeStrong((id *)&v22->_originBundleId, v24);
    v22->_confidence = a6;
    v25 = (void *)MEMORY[0x1E0C9AA60];
    if (v18)
      v26 = v18;
    else
      v26 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v22->_schemaOrg, v26);
    if (v19)
      v27 = v19;
    else
      v27 = v25;
    objc_storeStrong((id *)&v22->_participants, v27);
    if (v20)
      v28 = v20;
    else
      v28 = v25;
    objc_storeStrong((id *)&v22->_eventActivities, v28);
  }

  return v22;
}

- (id)toJsonString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  v3 = (void *)MEMORY[0x1A8583A40](self, a2);
  v4 = (void *)MEMORY[0x1E0CB36D8];
  -[SGEventMetadata jsonObject](self, "jsonObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "dataWithJSONObject:options:error:", v5, 0, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  objc_autoreleasePoolPop(v3);
  if (v6)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
  else
    v8 = 0;

  return v8;
}

- (id)jsonObject
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSString *categoryDescription;
  NSString *originBundleId;
  void *v13;
  NSArray *schemaOrg;
  NSArray *participants;
  void *v16;
  void *DeepCopy;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[7];
  _QWORD v24[7];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_eventActivities;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v8), "jsonObject", (_QWORD)v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }

  v23[0] = CFSTR("SGEventMetadataTypeKey");
  objc_msgSend((id)objc_opt_class(), "describeType:", self->_type);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  categoryDescription = self->_categoryDescription;
  originBundleId = self->_originBundleId;
  v24[0] = v10;
  v24[1] = categoryDescription;
  v23[1] = CFSTR("SGEventMetadataCategoryDescriptionKey");
  v23[2] = CFSTR("SGEventMetadataBundleIdKey");
  v24[2] = originBundleId;
  v23[3] = CFSTR("SGEventMetadataConfidenceKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  schemaOrg = self->_schemaOrg;
  participants = self->_participants;
  v24[3] = v13;
  v24[4] = schemaOrg;
  v23[4] = CFSTR("SGEventMetadataSchemaOrgKey");
  v23[5] = CFSTR("SGEventMetadataParticipantsKey");
  v23[6] = CFSTR("SGEventMetadataEventActivitiesKey");
  v24[5] = participants;
  v24[6] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v16, 0);

  return DeepCopy;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)categoryDescription
{
  return self->_categoryDescription;
}

- (NSString)originBundleId
{
  return self->_originBundleId;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSArray)schemaOrg
{
  return self->_schemaOrg;
}

- (NSArray)participants
{
  return self->_participants;
}

- (NSArray)eventActivities
{
  return self->_eventActivities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventActivities, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_schemaOrg, 0);
  objc_storeStrong((id *)&self->_originBundleId, 0);
  objc_storeStrong((id *)&self->_categoryDescription, 0);
}

+ (id)eventMetadataFromEKEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  SGEventActivity *v18;
  SGEventMetadata *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SGEventMetadata *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  void *v38;
  void *context;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(v4, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v27 = (void *)MEMORY[0x1A8583A40]();
    objc_msgSend(v4, "customObjectForKey:", CFSTR("SuggestionsSchemaOrg"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "customObjectForKey:", CFSTR("SuggestionsNLEventDictionaryKey"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customObjectForKey:", CFSTR("SuggestionsOriginBundleId"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v30 = v29;
      if (!v7)
        goto LABEL_20;
    }
    else
    {
      v30 = 0;
      if (!v7)
        goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = v7;
      v26 = -[SGEventMetadata initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:]([SGEventMetadata alloc], "initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:", 1, 0, v30, v31, 0, 1.0);
      goto LABEL_28;
    }
LABEL_20:
    if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v26 = 0;
LABEL_29:

      objc_autoreleasePoolPop(v27);
      goto LABEL_30;
    }
    v41 = v4;
    v31 = v28;
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("SuggestionsNLEventDictionaryEventTypeKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v33 = v32;
    else
      v33 = 0;
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("SuggestionsNLEventDictionaryEventConfidenceScoreKey"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    v36 = v35;

    v26 = -[SGEventMetadata initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:]([SGEventMetadata alloc], "initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:", 2, v33, v30, 0, 0, v36);
    v4 = v41;
LABEL_28:

    goto LABEL_29;
  }
  v40 = v4;
  context = (void *)MEMORY[0x1A8583A40]();
  v7 = v6;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SGEventMetadataConfidenceKey"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "doubleValue");
  v9 = v8;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SGEventMetadataEventActivitiesKey"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v43;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1A8583A40]();
        v18 = -[SGEventActivity initWithDictionary:]([SGEventActivity alloc], "initWithDictionary:", v16);
        if (v18)
          objc_msgSend(v10, "addObject:", v18);

        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v13);
  }

  v19 = [SGEventMetadata alloc];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SGEventMetadataTypeKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(a1, "eventTypeFromString:", v20);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SGEventMetadataCategoryDescriptionKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SGEventMetadataBundleIdKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SGEventMetadataSchemaOrgKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SGEventMetadataParticipantsKey"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SGEventMetadata initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:eventActivities:](v19, "initWithType:categoryDescription:originBundleId:confidence:schemaOrg:participants:eventActivities:", v21, v22, v23, v24, v25, v10, v9);

  objc_autoreleasePoolPop(context);
  v4 = v40;
LABEL_30:

  return v26;
}

+ (id)describeType:(unsigned __int8)a3
{
  if (a3 > 2u)
    return CFSTR("Unknown");
  else
    return off_1E4761A18[a3];
}

+ (unsigned)eventTypeFromString:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("StructuredEvent")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NLEvent")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
