@implementation CLSActivityReport

- (CLSActivityReport)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSActivityReport *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *contextTopic;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  __CFString *v26;
  NSString *contextStableObjectID;
  __CFString *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  CLSAggregatedValue *time;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  CLSAggregatedValue *progress;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  CLSActivityReportItem *primaryReportItem;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  NSArray *additionalReportItems;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  NSString *handoutAuthorizedObjectID;
  __CFString *v55;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)CLSActivityReport;
  v6 = -[CLSActivityReport init](&v56, sel_init);
  if (v6)
  {
    v6->_contextType = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("contextType"));
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("contextTitle"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = (__CFString *)v9;
    else
      v10 = &stru_1E974C8A0;
    v55 = v10;
    objc_storeStrong((id *)&v6->_contextTitle, v10);
    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("contextTopic"));
    v13 = objc_claimAutoreleasedReturnValue();
    contextTopic = v6->_contextTopic;
    v6->_contextTopic = (NSString *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("contextAppBundleIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
      v18 = (__CFString *)v17;
    else
      v18 = &stru_1E974C8A0;
    objc_storeStrong((id *)&v6->_contextAppBundleIdentifier, v18);
    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, CFSTR("contextID"));
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
      v22 = (__CFString *)v21;
    else
      v22 = &stru_1E974C8A0;
    objc_storeStrong((id *)&v6->_contextID, v22);
    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, CFSTR("contextStableObjectID"));
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
      v26 = (__CFString *)v25;
    else
      v26 = &stru_1E974C8A0;
    contextStableObjectID = v6->_contextStableObjectID;
    v6->_contextStableObjectID = &v26->isa;
    v28 = v26;

    v29 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, CFSTR("time"));
    v31 = objc_claimAutoreleasedReturnValue();
    time = v6->_time;
    v6->_time = (CLSAggregatedValue *)v31;

    v33 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, CFSTR("progress"));
    v35 = objc_claimAutoreleasedReturnValue();
    progress = v6->_progress;
    v6->_progress = (CLSAggregatedValue *)v35;

    v37 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, CFSTR("primaryReportItem"));
    v39 = objc_claimAutoreleasedReturnValue();
    primaryReportItem = v6->_primaryReportItem;
    v6->_primaryReportItem = (CLSActivityReportItem *)v39;

    v41 = (void *)MEMORY[0x1E0C99E60];
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    objc_msgSend_setWithObjects_(v41, v44, v42, v43, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v46, (uint64_t)v45, CFSTR("additionalReportItems"));
    v47 = objc_claimAutoreleasedReturnValue();
    additionalReportItems = v6->_additionalReportItems;
    v6->_additionalReportItems = (NSArray *)v47;

    v6->_handoutAttachmentType = objc_msgSend_decodeInt32ForKey_(v4, v49, (uint64_t)CFSTR("handoutAttachmentType"));
    v50 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, CFSTR("handoutAuthorizedObjectID"));
    v52 = objc_claimAutoreleasedReturnValue();
    handoutAuthorizedObjectID = v6->_handoutAuthorizedObjectID;
    v6->_handoutAuthorizedObjectID = (NSString *)v52;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t contextType;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  id v17;

  contextType = self->_contextType;
  v17 = a3;
  objc_msgSend_encodeInteger_forKey_(v17, v5, contextType, CFSTR("contextType"));
  objc_msgSend_encodeObject_forKey_(v17, v6, (uint64_t)self->_contextTitle, CFSTR("contextTitle"));
  objc_msgSend_encodeObject_forKey_(v17, v7, (uint64_t)self->_contextTopic, CFSTR("contextTopic"));
  objc_msgSend_encodeObject_forKey_(v17, v8, (uint64_t)self->_contextAppBundleIdentifier, CFSTR("contextAppBundleIdentifier"));
  objc_msgSend_encodeObject_forKey_(v17, v9, (uint64_t)self->_contextID, CFSTR("contextID"));
  objc_msgSend_encodeObject_forKey_(v17, v10, (uint64_t)self->_contextStableObjectID, CFSTR("contextStableObjectID"));
  objc_msgSend_encodeObject_forKey_(v17, v11, (uint64_t)self->_time, CFSTR("time"));
  objc_msgSend_encodeObject_forKey_(v17, v12, (uint64_t)self->_progress, CFSTR("progress"));
  objc_msgSend_encodeObject_forKey_(v17, v13, (uint64_t)self->_primaryReportItem, CFSTR("primaryReportItem"));
  objc_msgSend_encodeObject_forKey_(v17, v14, (uint64_t)self->_additionalReportItems, CFSTR("additionalReportItems"));
  objc_msgSend_encodeInteger_forKey_(v17, v15, self->_handoutAttachmentType, CFSTR("handoutAttachmentType"));
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)self->_handoutAuthorizedObjectID, CFSTR("handoutAuthorizedObjectID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)CLSActivityReport;
  v4 = -[CLSReportItem copyWithZone:](&v54, sel_copyWithZone_, a3);
  v7 = objc_msgSend_contextType(self, v5, v6);
  objc_msgSend_setContextType_(v4, v8, v7);
  objc_msgSend_contextTopic(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContextTopic_(v4, v12, (uint64_t)v11);

  objc_msgSend_contextTitle(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContextTitle_(v4, v16, (uint64_t)v15);

  objc_msgSend_contextAppBundleIdentifier(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContextAppBundleIdentifier_(v4, v20, (uint64_t)v19);

  objc_msgSend_contextID(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContextID_(v4, v24, (uint64_t)v23);

  objc_msgSend_contextStableObjectID(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContextStableObjectID_(v4, v28, (uint64_t)v27);

  objc_msgSend_time(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTime_(v4, v32, (uint64_t)v31);

  objc_msgSend_progress(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProgress_(v4, v36, (uint64_t)v35);

  objc_msgSend_primaryReportItem(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPrimaryReportItem_(v4, v40, (uint64_t)v39);

  objc_msgSend_additionalReportItems(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdditionalReportItems_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_handoutAttachmentType(self, v45, v46);
  objc_msgSend_setHandoutAttachmentType_(v4, v48, v47);
  objc_msgSend_handoutAuthorizedObjectID(self, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHandoutAuthorizedObjectID_(v4, v52, (uint64_t)v51);

  return v4;
}

- (int64_t)compare:(id)a3
{
  void *v4;
  CLSActivityReportItem *primaryReportItem;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  int64_t v10;

  objc_msgSend_convertToItemCompatibleWithItem_copyIfSameType_(a3, a2, (uint64_t)self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  primaryReportItem = self->_primaryReportItem;
  objc_msgSend_primaryReportItem(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_compare_(primaryReportItem, v9, (uint64_t)v8);

  return v10;
}

- (void)add:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_time(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_time(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_add_(v7, v11, (uint64_t)v10);

  objc_msgSend_progress(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_progress(v4, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_add_(v14, v18, (uint64_t)v17);

  objc_msgSend_primaryReportItem(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_primaryReportItem(v4, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_add_(v21, v25, (uint64_t)v24);

  v26 = (void *)objc_opt_new();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  objc_msgSend_additionalReportItems(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v77, v82, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v78;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v78 != v33)
          objc_enumerationMutation(v29);
        v35 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v34);
        v36 = (void *)MEMORY[0x1D82573E4]();
        v39 = (void *)objc_msgSend_copy(v35, v37, v38);
        objc_msgSend_identifier(v35, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v26, v43, (uint64_t)v39, v42);

        objc_autoreleasePoolPop(v36);
        ++v34;
      }
      while (v32 != v34);
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v44, (uint64_t)&v77, v82, 16);
    }
    while (v32);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v72 = v4;
  objc_msgSend_additionalReportItems(v4, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v73, v81, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v74;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v74 != v51)
          objc_enumerationMutation(v47);
        v53 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v52);
        v54 = (void *)MEMORY[0x1D82573E4]();
        objc_msgSend_identifier(v53, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v26, v58, (uint64_t)v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (v59)
        {
          objc_msgSend_add_(v59, v60, (uint64_t)v53);
        }
        else
        {
          v62 = (void *)objc_msgSend_copy(v53, v60, v61);
          objc_msgSend_identifier(v53, v63, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v26, v66, (uint64_t)v62, v65);

        }
        objc_autoreleasePoolPop(v54);
        ++v52;
      }
      while (v50 != v52);
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v67, (uint64_t)&v73, v81, 16);
    }
    while (v50);
  }

  objc_msgSend_allValues(v26, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAdditionalReportItems_(self, v71, (uint64_t)v70);

}

- (void)scalarMultiply:(double)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  id v24;

  objc_msgSend_time(self, a2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scalarMultiply_(v6, v7, v8, a3);

  objc_msgSend_progress(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scalarMultiply_(v11, v12, v13, a3);

  objc_msgSend_primaryReportItem(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scalarMultiply_(v16, v17, v18, a3);

  objc_msgSend_additionalReportItems(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multiply_withScalar_(CLSReportItem, v22, (uint64_t)v21, a3);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setAdditionalReportItems_(self, v23, (uint64_t)v24);
}

- (id)description
{
  id v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  unsigned int v55;
  const char *v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = objc_opt_class();
  v6 = (void *)objc_msgSend_initWithFormat_(v3, v5, (uint64_t)CFSTR("<%@ %p"), v4, self);
  v9 = objc_msgSend_contextType(self, v7, v8);
  DefaultNameFromContextType(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v11, (uint64_t)CFSTR(" %@: %@"), CFSTR("contextType"), v10);

  objc_msgSend_contextTopic(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v15, (uint64_t)CFSTR(" %@: %@"), CFSTR("contextTopic"), v14);

  objc_msgSend_contextTitle(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v19, (uint64_t)CFSTR(" %@: %@"), CFSTR("contextTitle"), v18);

  objc_msgSend_contextAppBundleIdentifier(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v23, (uint64_t)CFSTR(" %@: %@"), CFSTR("contextAppBundleIdentifier"), v22);

  objc_msgSend_contextID(self, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v27, (uint64_t)CFSTR(" %@: %@"), CFSTR("contextID"), v26);

  objc_msgSend_contextStableObjectID(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v31, (uint64_t)CFSTR(" %@: %@"), CFSTR("contextStableObjectID"), v30);

  objc_msgSend_time(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v35, (uint64_t)CFSTR(" %@: %@"), CFSTR("time"), v34);

  objc_msgSend_progress(self, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v39, (uint64_t)CFSTR(" %@: %@"), CFSTR("progress"), v38);

  objc_msgSend_primaryReportItem(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend_primaryReportItem(self, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v46, (uint64_t)CFSTR(" %@: %@"), CFSTR("primaryReportItem"), v45);

  }
  objc_msgSend_additionalReportItems(self, v43, v44);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_count(v47, v48, v49);

  if (v50)
  {
    objc_msgSend_additionalReportItems(self, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v54, (uint64_t)CFSTR(" %@: %@"), CFSTR("additionalReportItems"), v53);

  }
  v55 = objc_msgSend_handoutAttachmentType(self, v51, v52);
  NSStringFromHandoutAttachmentType(v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v58, (uint64_t)CFSTR(" %@: %@"), CFSTR("handoutAttachmentType"), v57);

  objc_msgSend_handoutAuthorizedObjectID(self, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v62, (uint64_t)CFSTR(" %@: %@"), CFSTR("handoutAuthorizedObjectID"), v61);

  objc_msgSend_appendString_(v6, v63, (uint64_t)CFSTR(">"));
  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  unsigned int v49;
  const char *v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  objc_super v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v88.receiver = self;
  v88.super_class = (Class)CLSActivityReport;
  -[CLSReportItem dictionaryRepresentation](&v88, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_contextType(self, v4, v5);
  DefaultNameFromContextType(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, CFSTR("contextType"));

  objc_msgSend_contextTopic(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, CFSTR("contextTopic"));

  objc_msgSend_contextTitle(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v16, (uint64_t)v15, CFSTR("contextTitle"));

  objc_msgSend_contextAppBundleIdentifier(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, CFSTR("contextAppBundleIdentifier"));

  objc_msgSend_contextID(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, CFSTR("contextID"));

  objc_msgSend_contextStableObjectID(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)v27, CFSTR("contextStableObjectID"));

  objc_msgSend_time(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v34, CFSTR("time"));

  objc_msgSend_progress(self, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v42, (uint64_t)v41, CFSTR("progress"));

  objc_msgSend_handoutAuthorizedObjectID(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v46, (uint64_t)v45, CFSTR("handoutAuthorizedObjectID"));

  v49 = objc_msgSend_handoutAttachmentType(self, v47, v48);
  NSStringFromHandoutAttachmentType(v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v52, (uint64_t)v51, CFSTR("handoutAttachmentType"));

  objc_msgSend_primaryReportItem(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v59, (uint64_t)v58, CFSTR("primaryReportItem"));

  objc_msgSend_additionalReportItems(self, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend_count(v62, v63, v64);

  if (v65)
  {
    v66 = (void *)objc_opt_new();
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    objc_msgSend_additionalReportItems(self, v67, v68, 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v84, v89, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v85;
      do
      {
        v74 = 0;
        do
        {
          if (*(_QWORD *)v85 != v73)
            objc_enumerationMutation(v69);
          v75 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v74);
          v76 = (void *)MEMORY[0x1D82573E4]();
          objc_msgSend_dictionaryRepresentation(v75, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v66, v80, (uint64_t)v79);

          objc_autoreleasePoolPop(v76);
          ++v74;
        }
        while (v72 != v74);
        v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v81, (uint64_t)&v84, v89, 16);
      }
      while (v72);
    }

    objc_msgSend_setObject_forKeyedSubscript_(v3, v82, (uint64_t)v66, CFSTR("additionalReportItems"));
  }
  return v3;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void)setContextType:(int64_t)a3
{
  self->_contextType = a3;
}

- (NSString)contextTopic
{
  return self->_contextTopic;
}

- (void)setContextTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contextTitle
{
  return self->_contextTitle;
}

- (void)setContextTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)contextAppBundleIdentifier
{
  return self->_contextAppBundleIdentifier;
}

- (void)setContextAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CLSAggregatedValue)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CLSAggregatedValue)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CLSActivityReportItem)primaryReportItem
{
  return self->_primaryReportItem;
}

- (void)setPrimaryReportItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)additionalReportItems
{
  return self->_additionalReportItems;
}

- (void)setAdditionalReportItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)contextStableObjectID
{
  return self->_contextStableObjectID;
}

- (void)setContextStableObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int)handoutAttachmentType
{
  return self->_handoutAttachmentType;
}

- (void)setHandoutAttachmentType:(int)a3
{
  self->_handoutAttachmentType = a3;
}

- (NSString)handoutAuthorizedObjectID
{
  return self->_handoutAuthorizedObjectID;
}

- (void)setHandoutAuthorizedObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoutAuthorizedObjectID, 0);
  objc_storeStrong((id *)&self->_contextStableObjectID, 0);
  objc_storeStrong((id *)&self->_additionalReportItems, 0);
  objc_storeStrong((id *)&self->_primaryReportItem, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_contextAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contextTitle, 0);
  objc_storeStrong((id *)&self->_contextTopic, 0);
}

@end
