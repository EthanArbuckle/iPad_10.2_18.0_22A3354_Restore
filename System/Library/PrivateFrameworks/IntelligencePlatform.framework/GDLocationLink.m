@implementation GDLocationLink

- (GDLocationLink)initWithRelationshipIdTriplesIterator:(id)a3
{
  id v4;
  GDLocationLink *v5;
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
  void *label;
  const char *v29;
  uint64_t v30;
  GDEntityIdentifier *locationEntityIdentifier;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  GDLocationLink *v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)GDLocationLink;
  v5 = -[GDLocationLink init](&v42, sel_init);
  if (!v5)
  {
LABEL_18:
    v35 = v5;
    goto LABEL_21;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v37 = v4;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v38, v43, 16);
  if (!v8)
    goto LABEL_16;
  v11 = v8;
  v12 = *(_QWORD *)v39;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v39 != v12)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v13);
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
      if (objc_msgSend_isEqual_(v22, v23, (uint64_t)CFSTR("PS107")))
      {
        v25 = [GDEntityIdentifier alloc];
        objc_msgSend_object(v14, v26, v27);
        label = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend_initWithString_(v25, v29, (uint64_t)label);
        locationEntityIdentifier = v5->_locationEntityIdentifier;
        v5->_locationEntityIdentifier = (GDEntityIdentifier *)v30;

      }
      else
      {
        if (!objc_msgSend_isEqual_(v22, v24, (uint64_t)CFSTR("PS733")))
          goto LABEL_14;
        objc_msgSend_object(v14, v32, v33);
        v34 = objc_claimAutoreleasedReturnValue();
        label = v5->_label;
        v5->_label = (NSString *)v34;
      }

LABEL_14:
      ++v13;
    }
    while (v11 != v13);
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v38, v43, 16);
  }
  while (v11);
LABEL_16:

  if (v5->_relationshipIdentifier)
  {
    v4 = v37;
    if (v5->_locationEntityIdentifier)
      goto LABEL_18;
    v35 = 0;
  }
  else
  {
    v35 = 0;
    v4 = v37;
  }
LABEL_21:

  return v35;
}

- (GDRelationshipIdentifier)relationshipIdentifier
{
  return self->_relationshipIdentifier;
}

- (GDEntityIdentifier)locationEntityIdentifier
{
  return self->_locationEntityIdentifier;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_locationEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_relationshipIdentifier, 0);
}

@end
