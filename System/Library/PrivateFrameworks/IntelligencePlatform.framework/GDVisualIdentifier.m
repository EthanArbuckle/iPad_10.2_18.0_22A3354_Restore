@implementation GDVisualIdentifier

- (id)description
{
  id v3;
  const char *v4;
  const __CFString *suggestedName;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  suggestedName = (const __CFString *)self->_suggestedName;
  if (!suggestedName)
    suggestedName = CFSTR("nil");
  return (id)objc_msgSend_initWithFormat_(v3, v4, (uint64_t)CFSTR("<GDVisualIdentifier id:%@ vid:%@ ar:%@ sn:%@>"), *(_OWORD *)&self->_relationshipIdentifier, self->_associationReason, suggestedName);
}

- (GDRelationshipIdentifier)relationshipIdentifier
{
  return self->_relationshipIdentifier;
}

- (NSString)visualIdentifier
{
  return self->_visualIdentifier;
}

- (NSString)associationReason
{
  return self->_associationReason;
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_storeStrong((id *)&self->_associationReason, 0);
  objc_storeStrong((id *)&self->_visualIdentifier, 0);
  objc_storeStrong((id *)&self->_relationshipIdentifier, 0);
}

- (GDVisualIdentifier)initWithRelationshipIdTriplesIterator:(id)a3
{
  id v4;
  GDVisualIdentifier *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  GDRelationshipIdentifier *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  GDRelationshipIdentifier *relationshipIdentifier;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void **p_visualIdentifier;
  uint64_t v26;
  void *v27;
  GDVisualIdentifier *v28;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)GDVisualIdentifier;
  v5 = -[GDVisualIdentifier init](&v36, sel_init);
  if (v5)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = v4;
    obj = v4;
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v32, v37, 16);
    if (v7)
    {
      v10 = v7;
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (!v5->_relationshipIdentifier)
          {
            v14 = [GDRelationshipIdentifier alloc];
            objc_msgSend_relationshipId(v13, v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend_initWithString_(v14, v18, (uint64_t)v17);
            relationshipIdentifier = v5->_relationshipIdentifier;
            v5->_relationshipIdentifier = (GDRelationshipIdentifier *)v19;

          }
          objc_msgSend_relationshipPredicate(v13, v8, v9);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          p_visualIdentifier = (void **)&v5->_visualIdentifier;
          if ((objc_msgSend_isEqual_(v21, v22, (uint64_t)CFSTR("nm_visualIdentifier")) & 1) != 0
            || (p_visualIdentifier = (void **)&v5->_associationReason,
                (objc_msgSend_isEqual_(v21, v23, (uint64_t)CFSTR("nm_associationReason")) & 1) != 0)
            || (p_visualIdentifier = (void **)&v5->_suggestedName,
                objc_msgSend_isEqual_(v21, v23, (uint64_t)CFSTR("nm_suggestedName"))))
          {
            objc_msgSend_object(v13, v23, v24);
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = *p_visualIdentifier;
            *p_visualIdentifier = (void *)v26;

          }
        }
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v32, v37, 16);
      }
      while (v10);
    }

    if (!v5->_relationshipIdentifier || !v5->_visualIdentifier)
    {
      v28 = 0;
      v4 = v30;
      goto LABEL_20;
    }
    v4 = v30;
    if (!v5->_associationReason)
    {
      v28 = 0;
      goto LABEL_20;
    }
  }
  v28 = v5;
LABEL_20:

  return v28;
}

@end
