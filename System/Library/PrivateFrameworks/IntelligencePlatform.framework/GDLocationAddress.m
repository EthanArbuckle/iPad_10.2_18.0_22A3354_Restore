@implementation GDLocationAddress

- (id)description
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;

  v61 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_relationshipIdentifier(self, a2, v2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subPremises(self, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v6;
  if (v6)
    v9 = (const __CFString *)v6;
  else
    v9 = &stru_1E5DDB0B8;
  v58 = v9;
  objc_msgSend_subThoroughfare(self, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v63 = (void *)v10;
  if (v10)
    v13 = (const __CFString *)v10;
  else
    v13 = &stru_1E5DDB0B8;
  v57 = v13;
  objc_msgSend_thoroughfare(self, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue();
  v62 = (void *)v14;
  if (v14)
    v17 = (const __CFString *)v14;
  else
    v17 = &stru_1E5DDB0B8;
  v56 = v17;
  objc_msgSend_subLocality(self, v15, v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v18;
  if (v18)
    v21 = (const __CFString *)v18;
  else
    v21 = &stru_1E5DDB0B8;
  v55 = v21;
  objc_msgSend_locality(self, v19, v20);
  v22 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v22;
  if (v22)
    v26 = (const __CFString *)v22;
  else
    v26 = &stru_1E5DDB0B8;
  v54 = v26;
  objc_msgSend_subAdministrativeArea(self, v23, v24);
  v27 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v27;
  if (v27)
    v31 = (const __CFString *)v27;
  else
    v31 = &stru_1E5DDB0B8;
  v53 = v31;
  objc_msgSend_administrativeArea(self, v28, v29);
  v32 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v32;
  if (v32)
    v36 = (const __CFString *)v32;
  else
    v36 = &stru_1E5DDB0B8;
  objc_msgSend_postalCode(self, v33, v34);
  v37 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v37;
  if (v37)
    v41 = (const __CFString *)v37;
  else
    v41 = &stru_1E5DDB0B8;
  objc_msgSend_country(self, v38, v39);
  v42 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v42;
  if (v42)
    v46 = (const __CFString *)v42;
  else
    v46 = &stru_1E5DDB0B8;
  objc_msgSend_ISOCountryCode(self, v43, v44);
  v47 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v47;
  if (v47)
    v50 = (const __CFString *)v47;
  else
    v50 = &stru_1E5DDB0B8;
  objc_msgSend_stringWithFormat_(v61, v48, (uint64_t)CFSTR("<GDLocationAddress id:%@ sp:%@ st:%@ t:%@ sl:%@ l:%@ sa:%@ a:%@ p:%@ c:%@ i:%@>"), v59, v58, v57, v56, v55, v54, v53, v36, v41, v46, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return v51;
}

- (GDRelationshipIdentifier)relationshipIdentifier
{
  return self->_relationshipIdentifier;
}

- (NSString)subPremises
{
  return self->_subPremises;
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (NSString)locality
{
  return self->_locality;
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)ISOCountryCode
{
  return self->_ISOCountryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ISOCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_subPremises, 0);
  objc_storeStrong((id *)&self->_relationshipIdentifier, 0);
}

- (GDLocationAddress)initWithRelationshipIdTriplesIterator:(id)a3
{
  id v4;
  GDLocationAddress *v5;
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
  void **p_subPremises;
  uint64_t v26;
  void *v27;
  GDLocationAddress *v28;
  void **p_ISOCountryCode;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)GDLocationAddress;
  v5 = -[GDLocationAddress init](&v37, sel_init);
  if (!v5)
    goto LABEL_23;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = v4;
  obj = v4;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v33, v38, 16);
  if (v7)
  {
    v10 = v7;
    p_ISOCountryCode = (void **)&v5->_ISOCountryCode;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (!v5->_relationshipIdentifier)
        {
          v14 = [GDRelationshipIdentifier alloc];
          objc_msgSend_relationshipId(v13, v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend_initWithString_(v14, v18, (uint64_t)v17);
          relationshipIdentifier = v5->_relationshipIdentifier;
          v5->_relationshipIdentifier = (GDRelationshipIdentifier *)v19;

        }
        objc_msgSend_relationshipPredicate(v13, v8, v9, p_ISOCountryCode);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        p_subPremises = (void **)&v5->_subPremises;
        if ((objc_msgSend_isEqual_(v21, v22, (uint64_t)CFSTR("PS730")) & 1) != 0)
          goto LABEL_19;
        p_subPremises = (void **)&v5->_subThoroughfare;
        if ((objc_msgSend_isEqual_(v21, v23, (uint64_t)CFSTR("PS570")) & 1) != 0)
          goto LABEL_19;
        p_subPremises = (void **)&v5->_thoroughfare;
        if ((objc_msgSend_isEqual_(v21, v23, (uint64_t)CFSTR("PS316")) & 1) != 0
          || (p_subPremises = (void **)&v5->_subLocality,
              (objc_msgSend_isEqual_(v21, v23, (uint64_t)CFSTR("PS569")) & 1) != 0)
          || (p_subPremises = (void **)&v5->_locality,
              (objc_msgSend_isEqual_(v21, v23, (uint64_t)CFSTR("PS453")) & 1) != 0)
          || (p_subPremises = (void **)&v5->_subAdministrativeArea,
              (objc_msgSend_isEqual_(v21, v23, (uint64_t)CFSTR("PS568")) & 1) != 0)
          || (p_subPremises = (void **)&v5->_administrativeArea,
              (objc_msgSend_isEqual_(v21, v23, (uint64_t)CFSTR("PS455")) & 1) != 0)
          || (p_subPremises = (void **)&v5->_postalCode,
              (objc_msgSend_isEqual_(v21, v23, (uint64_t)CFSTR("PS315")) & 1) != 0)
          || (p_subPremises = (void **)&v5->_country, (objc_msgSend_isEqual_(v21, v23, (uint64_t)CFSTR("PS450")) & 1) != 0)
          || (p_subPremises = p_ISOCountryCode, objc_msgSend_isEqual_(v21, v23, (uint64_t)CFSTR("PS454"))))
        {
LABEL_19:
          objc_msgSend_object(v13, v23, v24);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = *p_subPremises;
          *p_subPremises = (void *)v26;

        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v33, v38, 16);
    }
    while (v10);
  }

  v4 = v31;
  if (!v5->_relationshipIdentifier)
    v28 = 0;
  else
LABEL_23:
    v28 = v5;

  return v28;
}

+ (unint64_t)triplesColumnsRequiredForRendering
{
  return 31;
}

@end
