@implementation GDSoftwareLink

- (GDSoftwareLink)initWithRelationshipIdTriplesIterator:(id)a3
{
  id v4;
  GDSoftwareLink *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  GDRelationshipIdentifier *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  GDRelationshipIdentifier *relationshipIdentifier;
  void *v22;
  const char *v23;
  const char *v24;
  GDEntityIdentifier *v25;
  const char *v26;
  uint64_t v27;
  void *conversationIdentifier;
  const char *v29;
  uint64_t v30;
  GDEntityIdentifier *softwareEntityIdentifier;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  GDSoftwareLink *v38;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)GDSoftwareLink;
  v5 = -[GDSoftwareLink init](&v45, sel_init);
  if (!v5)
  {
LABEL_20:
    v38 = v5;
    goto LABEL_23;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v40 = v4;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v41, v46, 16);
  if (!v8)
    goto LABEL_18;
  v11 = v8;
  v12 = *(_QWORD *)v42;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v42 != v12)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v13);
      if (!v5->_relationshipIdentifier)
      {
        v15 = [GDRelationshipIdentifier alloc];
        objc_msgSend_relationshipId(v14, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend_initWithString_(v15, v19, (uint64_t)v18);
        relationshipIdentifier = v5->_relationshipIdentifier;
        v5->_relationshipIdentifier = (GDRelationshipIdentifier *)v20;

      }
      objc_msgSend_relationshipPredicate(v14, v9, v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v22, v23, (uint64_t)CFSTR("nm_softwareIdentifier")))
      {
        v25 = [GDEntityIdentifier alloc];
        objc_msgSend_object(v14, v26, v27);
        conversationIdentifier = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend_initWithString_(v25, v29, (uint64_t)conversationIdentifier);
        softwareEntityIdentifier = v5->_softwareEntityIdentifier;
        v5->_softwareEntityIdentifier = (GDEntityIdentifier *)v30;

      }
      else if (objc_msgSend_isEqual_(v22, v24, (uint64_t)CFSTR("PS69")))
      {
        objc_msgSend_object(v14, v32, v33);
        v34 = objc_claimAutoreleasedReturnValue();
        conversationIdentifier = v5->_conversationIdentifier;
        v5->_conversationIdentifier = (NSString *)v34;
      }
      else
      {
        if (!objc_msgSend_isEqual_(v22, v32, (uint64_t)CFSTR("PS396")))
          goto LABEL_16;
        objc_msgSend_object(v14, v35, v36);
        v37 = objc_claimAutoreleasedReturnValue();
        conversationIdentifier = v5->_identifierType;
        v5->_identifierType = (NSString *)v37;
      }

LABEL_16:
      ++v13;
    }
    while (v11 != v13);
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v41, v46, 16);
  }
  while (v11);
LABEL_18:

  if (v5->_relationshipIdentifier)
  {
    v4 = v40;
    if (v5->_softwareEntityIdentifier)
      goto LABEL_20;
    v38 = 0;
  }
  else
  {
    v38 = 0;
    v4 = v40;
  }
LABEL_23:

  return v38;
}

- (GDRelationshipIdentifier)relationshipIdentifier
{
  return self->_relationshipIdentifier;
}

- (GDEntityIdentifier)softwareEntityIdentifier
{
  return self->_softwareEntityIdentifier;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSString)identifierType
{
  return self->_identifierType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierType, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_softwareEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_relationshipIdentifier, 0);
}

@end
