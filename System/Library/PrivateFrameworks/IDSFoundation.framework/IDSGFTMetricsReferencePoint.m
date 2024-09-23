@implementation IDSGFTMetricsReferencePoint

- (IDSGFTMetricsReferencePoint)initWithFromType:(id)a3 fromUniqueID:(id)a4 anonymizer:(id)a5 templateDictionary:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IDSGFTMetricsReferencePoint *v15;
  IDSGFTMetricsReferencePoint *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  NSMutableDictionary *attributes;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  NSMutableDictionary *times;
  IDSGFTMetricsReferencePoint *v27;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)IDSGFTMetricsReferencePoint;
  v15 = -[IDSGFTMetricsReferencePoint init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromType, a3);
    objc_storeStrong(&v16->_fromUniqueID, a4);
    objc_storeStrong((id *)&v16->_anonymizer, a5);
    objc_storeStrong((id *)&v16->_template, a6);
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    attributes = v16->_attributes;
    v16->_attributes = (NSMutableDictionary *)v20;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    times = v16->_times;
    v16->_times = (NSMutableDictionary *)v25;

    v16->_lock._os_unfair_lock_opaque = 0;
    v27 = v16;
  }

  return v16;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<IDSGFTMetricsReferencePoint %@(%@) %@>"), *(double *)&self->_fromType, self->_fromType, self->_fromUniqueID, self->_times);
}

- (id)instanceForID:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  const char *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  double v13;
  const char *v14;
  double v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v4, v5, v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_objectForKeyedSubscript_(self->_times, v8, (uint64_t)v6, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v10, v11, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(self->_times, v14, (uint64_t)v12, v15, v6);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v12;
}

- (void)event:(id)a3
{
  double v3;

  objc_msgSend_event_uniqueID_reason_(self, a2, (uint64_t)a3, v3, &stru_1E3C2E4E8, &unk_1E3C86BB0);
}

- (void)event:(id)a3 time:(double)a4
{
  objc_msgSend_event_uniqueID_reason_time_(self, a2, (uint64_t)a3, a4, &stru_1E3C2E4E8, &unk_1E3C86BB0);
}

- (void)event:(id)a3 uniqueID:(id)a4
{
  double v4;

  objc_msgSend_event_uniqueID_reason_(self, a2, (uint64_t)a3, v4, a4, &unk_1E3C86BB0);
}

- (void)event:(id)a3 uniqueID:(id)a4 time:(double)a5
{
  objc_msgSend_event_uniqueID_reason_time_(self, a2, (uint64_t)a3, a5, a4, &unk_1E3C86BB0);
}

- (void)event:(id)a3 uniqueID:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  double v10;
  const char *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v12 = a3;
  v10 = ids_monotonic_time();
  objc_msgSend_event_uniqueID_reason_time_(self, v11, (uint64_t)v12, v10, v9, v8);

}

- (void)event:(id)a3 uniqueID:(id)a4 reason:(id)a5 time:(double)a6
{
  id v10;
  const char *v11;
  double v12;
  void *v13;
  os_unfair_lock_s *p_lock;
  const char *v15;
  double v16;
  void *v17;
  IDSGFTMetricsReferencePointEvent *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  id v27;

  v27 = a3;
  v10 = a5;
  objc_msgSend_instanceForID_(self, v11, (uint64_t)a4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_objectForKeyedSubscript_(v13, v15, (uint64_t)v27, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = [IDSGFTMetricsReferencePointEvent alloc];
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v19, v20, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend_initWithTime_reason_(v18, v22, (uint64_t)v21, v23, v10);
    objc_msgSend_setObject_forKeyedSubscript_(v13, v25, (uint64_t)v24, v26, v27);

  }
  os_unfair_lock_unlock(p_lock);

}

- (id)collectForTimeBase:(double)a3 anonymize:(BOOL)a4
{
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  const char *v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  const char *v39;
  double v40;
  void *v41;
  const char *v42;
  const char *v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  const char *v57;
  double v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  IDSGFTMetricsReferencePoint *v62;
  void *v63;
  const char *v64;
  double v65;
  void *v66;
  const char *v67;
  double v68;
  void *v69;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  double v77;
  void *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  double v82;
  int v83;
  const char *v84;
  double v85;
  void *v86;
  const char *v87;
  double v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  double v92;
  void *v93;
  const char *v94;
  double v95;
  os_unfair_lock_t lock;
  NSMutableDictionary *obj;
  uint64_t v99;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[2];
  _QWORD v115[2];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, a4, a3);
  v101 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_referenceTimeForTimeBase_(self, v6, v7, a3);
  v9 = v8;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  obj = self->_times;
  v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v110, v11, v117, 16);
  if (v102)
  {
    v99 = *(_QWORD *)v111;
    v15 = 0x1E0CB3000uLL;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v111 != v99)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * v16);
        v18 = (void *)objc_msgSend_mutableCopy(self->_template, v12, v13, v14);
        objc_msgSend_addEntriesFromDictionary_(v18, v19, (uint64_t)self->_attributes, v20);
        v103 = v16;
        if (a4)
        {
          objc_msgSend_anonymizeID_(self->_anonymizer, v21, (uint64_t)self->_fromUniqueID, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v18, v24, (uint64_t)v23, v25, CFSTR("fromID"));

          objc_msgSend_anonymizeID_(self->_anonymizer, v26, v17, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v18, v29, (uint64_t)v28, v30, CFSTR("toID"));

        }
        else
        {
          objc_msgSend_setObject_forKeyedSubscript_(v18, v21, (uint64_t)self->_fromUniqueID, v22, CFSTR("fromID"));
          objc_msgSend_setObject_forKeyedSubscript_(v18, v34, v17, v35, CFSTR("toID"));
        }
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v31, v32, v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v18, v37, (uint64_t)v36, v38, CFSTR("events"));

        objc_msgSend_objectForKeyedSubscript_(self->_times, v39, v17, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v106, 0.0, v116, 16);
        if (v105)
        {
          v104 = *(_QWORD *)v107;
          do
          {
            v45 = 0;
            do
            {
              if (*(_QWORD *)v107 != v104)
                objc_enumerationMutation(v41);
              v46 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * v45);
              objc_msgSend_objectForKeyedSubscript_(v41, v43, v46, v44);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_time(v47, v48, v49, v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_doubleValue(v51, v52, v53, v54);
              v56 = round((v55 - v9) * 1000.0 / 5.0) * 5.0;

              objc_msgSend_stringWithFormat_(*(void **)(v15 + 2368), v57, (uint64_t)CFSTR("%@.%@"), v58, self->_fromType, v46);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v114[0] = CFSTR("name");
              v114[1] = CFSTR("interval");
              v115[0] = v59;
              objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v60, v61, v56);
              v62 = self;
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v115[1] = v63;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v64, (uint64_t)v115, v65, v114, 2);
              v66 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_objectForKeyedSubscript_(v18, v67, (uint64_t)CFSTR("events"), v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v69, v70, (uint64_t)v66, v71);

              objc_msgSend_objectForKeyedSubscript_(v41, v72, v46, v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_reason(v74, v75, v76, v77);
              v78 = v18;
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v83 = objc_msgSend_intValue(v79, v80, v81, v82);

              if (v83)
              {
                objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v84, (uint64_t)CFSTR("%@.%@-reason"), v85, v62->_fromType, v46);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKeyedSubscript_(v41, v87, v46, v88);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_reason(v89, v90, v91, v92);
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v78, v94, (uint64_t)v93, v95, v86);

              }
              ++v45;
              self = v62;
              v15 = 0x1E0CB3000;
              v18 = v78;
            }
            while (v105 != v45);
            v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v43, (uint64_t)&v106, v44, v116, 16);
          }
          while (v105);
        }
        objc_msgSend_addObject_(v101, v43, (uint64_t)v18, v44);

        v16 = v103 + 1;
      }
      while (v103 + 1 != v102);
      v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v110, v14, v117, 16);
    }
    while (v102);
  }

  os_unfair_lock_unlock(lock);
  return v101;
}

- (NSString)fromType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFromType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (id)fromUniqueID
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setFromUniqueID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fromUniqueID, 0);
  objc_storeStrong((id *)&self->_fromType, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_anonymizer, 0);
  objc_storeStrong((id *)&self->_times, 0);
}

@end
