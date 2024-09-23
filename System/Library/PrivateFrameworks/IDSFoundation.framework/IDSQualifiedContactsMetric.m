@implementation IDSQualifiedContactsMetric

- (NSString)name
{
  return (NSString *)CFSTR("QualifiedContacts");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSNumber *qualifiedHandlesCount;
  NSNumber *qualifiedHandlesIML;
  NSNumber *handlesCount;
  NSNumber *qualifiedEmergencyHandles;
  NSNumber *qualifiedEmergencyHandlesIML;
  NSNumber *emergencyHandlesCount;
  NSNumber *qualifiedPrimaryHandles;
  NSNumber *qualifiedPrimaryHandlesIML;
  NSNumber *primaryHandlesCount;
  NSNumber *familyHandlesCount;
  NSNumber *emergencyHandleMsgCount;
  NSNumber *primaryHandleMsgCount;
  NSNumber *qualifiedHandleMsgCount;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  qualifiedHandlesCount = self->_qualifiedHandlesCount;
  if (qualifiedHandlesCount)
    CFDictionarySetValue(v3, CFSTR("qualifiedHandlesCount"), qualifiedHandlesCount);
  qualifiedHandlesIML = self->_qualifiedHandlesIML;
  if (qualifiedHandlesIML)
    CFDictionarySetValue(v4, CFSTR("qualifiedHandlesIML"), qualifiedHandlesIML);
  handlesCount = self->_handlesCount;
  if (handlesCount)
    CFDictionarySetValue(v4, CFSTR("handlesCount"), handlesCount);
  qualifiedEmergencyHandles = self->_qualifiedEmergencyHandles;
  if (qualifiedEmergencyHandles)
    CFDictionarySetValue(v4, CFSTR("qualifiedEmergencyHandles"), qualifiedEmergencyHandles);
  qualifiedEmergencyHandlesIML = self->_qualifiedEmergencyHandlesIML;
  if (qualifiedEmergencyHandlesIML)
    CFDictionarySetValue(v4, CFSTR("qualifiedEmergencyHandlesIML"), qualifiedEmergencyHandlesIML);
  emergencyHandlesCount = self->_emergencyHandlesCount;
  if (emergencyHandlesCount)
    CFDictionarySetValue(v4, CFSTR("emergencyHandlesCount"), emergencyHandlesCount);
  qualifiedPrimaryHandles = self->_qualifiedPrimaryHandles;
  if (qualifiedPrimaryHandles)
    CFDictionarySetValue(v4, CFSTR("qualifiedPrimaryHandles"), qualifiedPrimaryHandles);
  qualifiedPrimaryHandlesIML = self->_qualifiedPrimaryHandlesIML;
  if (qualifiedPrimaryHandlesIML)
    CFDictionarySetValue(v4, CFSTR("qualifiedPrimaryHandlesIML"), qualifiedPrimaryHandlesIML);
  primaryHandlesCount = self->_primaryHandlesCount;
  if (primaryHandlesCount)
    CFDictionarySetValue(v4, CFSTR("primaryHandlesCount"), primaryHandlesCount);
  familyHandlesCount = self->_familyHandlesCount;
  if (familyHandlesCount)
    CFDictionarySetValue(v4, CFSTR("familyHandlesCount"), familyHandlesCount);
  emergencyHandleMsgCount = self->_emergencyHandleMsgCount;
  if (emergencyHandleMsgCount)
    CFDictionarySetValue(v4, CFSTR("emergencyHandleMsgCount"), emergencyHandleMsgCount);
  primaryHandleMsgCount = self->_primaryHandleMsgCount;
  if (primaryHandleMsgCount)
    CFDictionarySetValue(v4, CFSTR("primaryHandleMsgCount"), primaryHandleMsgCount);
  qualifiedHandleMsgCount = self->_qualifiedHandleMsgCount;
  if (qualifiedHandleMsgCount)
    CFDictionarySetValue(v4, CFSTR("qualifiedHandleMsgCount"), qualifiedHandleMsgCount);
  return (NSDictionary *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToMetric;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToMetric = objc_msgSend_isEqualToMetric_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToMetric = 0;

  return isEqualToMetric;
}

- (BOOL)isEqualToMetric:(id)a3
{
  const char *v4;
  uint64_t v5;
  IDSQualifiedContactsMetric *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  const char *v45;
  uint64_t v46;
  double v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  const char *v52;
  double v53;
  const char *v54;
  uint64_t v55;
  double v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  double v60;
  const char *v61;
  double v62;
  const char *v63;
  uint64_t v64;
  double v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  double v69;
  const char *v70;
  double v71;
  const char *v72;
  uint64_t v73;
  double v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  double v78;
  const char *v79;
  double v80;
  const char *v81;
  uint64_t v82;
  double v83;
  const char *v84;
  uint64_t v85;
  double v86;
  const char *v87;
  double v88;
  const char *v89;
  uint64_t v90;
  double v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  double v95;
  const char *v96;
  double v97;
  char isEqualToNumber;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;

  v6 = (IDSQualifiedContactsMetric *)a3;
  if (v6 == self)
  {
    isEqualToNumber = 1;
  }
  else
  {
    objc_msgSend_handlesCount(self, v4, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handlesCount(v6, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToNumber_(v8, v13, (uint64_t)v12, v14))
    {
      objc_msgSend_qualifiedHandlesCount(self, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_qualifiedHandlesCount(v6, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToNumber_(v18, v23, (uint64_t)v22, v24))
      {
        objc_msgSend_qualifiedHandlesIML(self, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_qualifiedHandlesIML(v6, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToNumber_(v28, v33, (uint64_t)v32, v34))
        {
          objc_msgSend_primaryHandlesCount(self, v35, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_primaryHandlesCount(v6, v39, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqualToNumber_(v38, v43, (uint64_t)v42, v44))
          {
            v109 = v38;
            objc_msgSend_qualifiedPrimaryHandles(self, v45, v46, v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_qualifiedPrimaryHandles(v6, v49, v50, v51);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = v48;
            if (objc_msgSend_isEqualToNumber_(v48, v52, (uint64_t)v110, v53))
            {
              objc_msgSend_qualifiedPrimaryHandlesIML(self, v54, v55, v56);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_qualifiedPrimaryHandlesIML(v6, v58, v59, v60);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = v57;
              if (objc_msgSend_isEqualToNumber_(v57, v61, (uint64_t)v107, v62))
              {
                objc_msgSend_familyHandlesCount(self, v63, v64, v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_familyHandlesCount(v6, v67, v68, v69);
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                v106 = v66;
                if (objc_msgSend_isEqualToNumber_(v66, v70, (uint64_t)v105, v71))
                {
                  objc_msgSend_emergencyHandlesCount(self, v72, v73, v74);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_emergencyHandlesCount(v6, v76, v77, v78);
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  v104 = v75;
                  if (objc_msgSend_isEqualToNumber_(v75, v79, (uint64_t)v103, v80))
                  {
                    objc_msgSend_qualifiedEmergencyHandles(self, v81, v82, v83);
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_qualifiedEmergencyHandles(v6, v84, v85, v86);
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend_isEqualToNumber_(v102, v87, (uint64_t)v101, v88))
                    {
                      objc_msgSend_qualifiedEmergencyHandlesIML(self, v89, v90, v91);
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_qualifiedEmergencyHandlesIML(v6, v93, v94, v95);
                      v100 = (void *)objc_claimAutoreleasedReturnValue();
                      isEqualToNumber = objc_msgSend_isEqualToNumber_(v92, v96, (uint64_t)v100, v97);

                    }
                    else
                    {
                      isEqualToNumber = 0;
                    }
                    v38 = v109;

                  }
                  else
                  {
                    isEqualToNumber = 0;
                    v38 = v109;
                  }

                }
                else
                {
                  isEqualToNumber = 0;
                  v38 = v109;
                }

              }
              else
              {
                isEqualToNumber = 0;
                v38 = v109;
              }

            }
            else
            {
              isEqualToNumber = 0;
              v38 = v109;
            }

          }
          else
          {
            isEqualToNumber = 0;
          }

        }
        else
        {
          isEqualToNumber = 0;
        }

      }
      else
      {
        isEqualToNumber = 0;
      }

    }
    else
    {
      isEqualToNumber = 0;
    }

  }
  return isEqualToNumber;
}

- (NSString)description
{
  const char *v3;
  uint64_t v4;
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  void *v44;
  uint64_t v46;
  void *v47;
  void *v48;

  v47 = (void *)MEMORY[0x1E0CB3940];
  v46 = objc_opt_class();
  objc_msgSend_handlesCount(self, v3, v4, v5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_qualifiedHandlesCount(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_qualifiedHandlesIML(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryHandlesCount(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_qualifiedPrimaryHandles(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_qualifiedPrimaryHandlesIML(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_familyHandlesCount(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emergencyHandlesCount(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_qualifiedEmergencyHandles(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_qualifiedEmergencyHandlesIML(self, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v47, v42, (uint64_t)CFSTR("<%@: %p; handlesCount = %@; qualifiedHandlesCount = %@; qualifiedHandlesIML = %@; primaryHandlesCount = %@; qualifiedPrimaryHandles = %@; qualifiedPrimaryHandlesIML = %@; familyHandlesCount = %@; emergencyHandlesCount = %@; qualifiedEmergencyHandles = %@; qualifiedEmergencyHandlesIML = %@>"),
    v43,
    v46,
    self,
    v48,
    v9,
    v13,
    v17,
    v21,
    v25,
    v29,
    v33,
    v37,
    v41);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v44;
}

- (NSNumber)qualifiedHandlesCount
{
  return self->_qualifiedHandlesCount;
}

- (void)setQualifiedHandlesCount:(id)a3
{
  objc_storeStrong((id *)&self->_qualifiedHandlesCount, a3);
}

- (NSNumber)qualifiedHandlesIML
{
  return self->_qualifiedHandlesIML;
}

- (void)setQualifiedHandlesIML:(id)a3
{
  objc_storeStrong((id *)&self->_qualifiedHandlesIML, a3);
}

- (NSNumber)handlesCount
{
  return self->_handlesCount;
}

- (void)setHandlesCount:(id)a3
{
  objc_storeStrong((id *)&self->_handlesCount, a3);
}

- (NSNumber)qualifiedEmergencyHandles
{
  return self->_qualifiedEmergencyHandles;
}

- (void)setQualifiedEmergencyHandles:(id)a3
{
  objc_storeStrong((id *)&self->_qualifiedEmergencyHandles, a3);
}

- (NSNumber)qualifiedEmergencyHandlesIML
{
  return self->_qualifiedEmergencyHandlesIML;
}

- (void)setQualifiedEmergencyHandlesIML:(id)a3
{
  objc_storeStrong((id *)&self->_qualifiedEmergencyHandlesIML, a3);
}

- (NSNumber)emergencyHandlesCount
{
  return self->_emergencyHandlesCount;
}

- (void)setEmergencyHandlesCount:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyHandlesCount, a3);
}

- (NSNumber)qualifiedPrimaryHandles
{
  return self->_qualifiedPrimaryHandles;
}

- (void)setQualifiedPrimaryHandles:(id)a3
{
  objc_storeStrong((id *)&self->_qualifiedPrimaryHandles, a3);
}

- (NSNumber)qualifiedPrimaryHandlesIML
{
  return self->_qualifiedPrimaryHandlesIML;
}

- (void)setQualifiedPrimaryHandlesIML:(id)a3
{
  objc_storeStrong((id *)&self->_qualifiedPrimaryHandlesIML, a3);
}

- (NSNumber)primaryHandlesCount
{
  return self->_primaryHandlesCount;
}

- (void)setPrimaryHandlesCount:(id)a3
{
  objc_storeStrong((id *)&self->_primaryHandlesCount, a3);
}

- (NSNumber)familyHandlesCount
{
  return self->_familyHandlesCount;
}

- (void)setFamilyHandlesCount:(id)a3
{
  objc_storeStrong((id *)&self->_familyHandlesCount, a3);
}

- (NSNumber)emergencyHandleMsgCount
{
  return self->_emergencyHandleMsgCount;
}

- (void)setEmergencyHandleMsgCount:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyHandleMsgCount, a3);
}

- (NSNumber)primaryHandleMsgCount
{
  return self->_primaryHandleMsgCount;
}

- (void)setPrimaryHandleMsgCount:(id)a3
{
  objc_storeStrong((id *)&self->_primaryHandleMsgCount, a3);
}

- (NSNumber)qualifiedHandleMsgCount
{
  return self->_qualifiedHandleMsgCount;
}

- (void)setQualifiedHandleMsgCount:(id)a3
{
  objc_storeStrong((id *)&self->_qualifiedHandleMsgCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualifiedHandleMsgCount, 0);
  objc_storeStrong((id *)&self->_primaryHandleMsgCount, 0);
  objc_storeStrong((id *)&self->_emergencyHandleMsgCount, 0);
  objc_storeStrong((id *)&self->_familyHandlesCount, 0);
  objc_storeStrong((id *)&self->_primaryHandlesCount, 0);
  objc_storeStrong((id *)&self->_qualifiedPrimaryHandlesIML, 0);
  objc_storeStrong((id *)&self->_qualifiedPrimaryHandles, 0);
  objc_storeStrong((id *)&self->_emergencyHandlesCount, 0);
  objc_storeStrong((id *)&self->_qualifiedEmergencyHandlesIML, 0);
  objc_storeStrong((id *)&self->_qualifiedEmergencyHandles, 0);
  objc_storeStrong((id *)&self->_handlesCount, 0);
  objc_storeStrong((id *)&self->_qualifiedHandlesIML, 0);
  objc_storeStrong((id *)&self->_qualifiedHandlesCount, 0);
}

@end
