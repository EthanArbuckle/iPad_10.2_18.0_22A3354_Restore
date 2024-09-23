@implementation CKCodeServiceImplementation

- (id)initInternalWithContainerImplementation:(id)a3 serviceName:(id)a4 boxedDatabaseScope:(id)a5 serviceInstanceURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKCodeServiceImplementation *v14;
  CKCodeServiceImplementation *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *serviceName;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSNumber *boxedDatabaseScope;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSURL *serviceInstanceURL;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  NSObject *v43;
  dispatch_queue_t v44;
  OS_dispatch_queue *underlyingDispatchQueue;
  uint64_t v46;
  NSOperationQueue *operationQueue;
  const char *v48;
  uint64_t v49;
  objc_super v51;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v51.receiver = self;
  v51.super_class = (Class)CKCodeServiceImplementation;
  v14 = -[CKCodeServiceImplementation init](&v51, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_containerImplementation, v10);
    v19 = objc_msgSend_copy(v11, v16, v17, v18);
    serviceName = v15->_serviceName;
    v15->_serviceName = (NSString *)v19;

    v24 = objc_msgSend_copy(v12, v21, v22, v23);
    boxedDatabaseScope = v15->_boxedDatabaseScope;
    v15->_boxedDatabaseScope = (NSNumber *)v24;

    v29 = objc_msgSend_copy(v13, v26, v27, v28);
    serviceInstanceURL = v15->_serviceInstanceURL;
    v15->_serviceInstanceURL = (NSURL *)v29;

    v31 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_containerIdentifier(v10, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v31, v36, (uint64_t)CFSTR("%@.%@"), v37, CFSTR("com.apple.cloudkit.codeservice-queue"), v35);
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = (const char *)objc_msgSend_UTF8String(v38, v39, v40, v41);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = dispatch_queue_create(v42, v43);
    underlyingDispatchQueue = v15->_underlyingDispatchQueue;
    v15->_underlyingDispatchQueue = (OS_dispatch_queue *)v44;

    v46 = objc_opt_new();
    operationQueue = v15->_operationQueue;
    v15->_operationQueue = (NSOperationQueue *)v46;

    objc_msgSend_setUnderlyingQueue_(v15->_operationQueue, v48, (uint64_t)v15->_underlyingDispatchQueue, v49);
  }

  return v15;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v38[0] = CFSTR("serviceName");
  objc_msgSend_serviceName(self, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = CFSTR("container");
  v39[0] = v6;
  objc_msgSend_containerImplementation(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v39, (uint64_t)v38, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_mutableCopy(v12, v13, v14, v15);

  objc_msgSend_boxedDatabaseScope(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_boxedDatabaseScope(self, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_integerValue(v24, v25, v26, v27);
    CKDatabaseScopeString(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v16, v30, (uint64_t)v29, (uint64_t)CFSTR("databaseScope"));

  }
  objc_msgSend_serviceInstanceURL(self, v21, v22, v23);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend_serviceInstanceURL(self, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v16, v36, (uint64_t)v35, (uint64_t)CFSTR("serviceInstanceURL"));

  }
  return v16;
}

- (id)description
{
  return (id)((uint64_t (*)(CKCodeServiceImplementation *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (void)_addPreparedOperation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_operationQueue(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addOperation_(v10, v8, (uint64_t)v4, v9);

}

- (void)addOperation:(id)a3 wrappingCodeService:(id)a4 convenienceConfiguration:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  char hasDiscretionaryNetworkBehavior;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  char hasAutomaticallyRetryNetworkFailures;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  CKException *v95;
  const char *v96;
  id v97;
  id v98;

  v98 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v95 = [CKException alloc];
    v97 = (id)objc_msgSend_initWithCode_format_(v95, v96, 12, (uint64_t)CFSTR("Only CKCodeOperation must be submitted to a CKCodeService"));
    objc_exception_throw(v97);
  }
  objc_msgSend_configuration(v98, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasDiscretionaryNetworkBehavior(v13, v14, v15, v16) & 1) != 0)
    goto LABEL_7;
  objc_msgSend_group(v98, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultConfiguration(v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasDiscretionaryNetworkBehavior(v24, v25, v26, v27))
    goto LABEL_6;
  objc_msgSend_configuration(v9, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasDiscretionaryNetworkBehavior(v31, v32, v33, v34) & 1) != 0)
  {

LABEL_6:
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend_group(v9, v35, v36, v37);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultConfiguration(v72, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  hasDiscretionaryNetworkBehavior = objc_msgSend_hasDiscretionaryNetworkBehavior(v76, v77, v78, v79);

  if ((hasDiscretionaryNetworkBehavior & 1) == 0)
  {
    objc_msgSend_configuration(v98, v38, v39, v40);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDiscretionaryNetworkBehavior_(v13, v81, 0, v82);
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend_configuration(v98, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_hasAutomaticallyRetryNetworkFailures(v41, v42, v43, v44) & 1) == 0)
  {
    objc_msgSend_group(v98, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultConfiguration(v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v52, v53, v54, v55))
    {
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend_configuration(v9, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_hasAutomaticallyRetryNetworkFailures(v59, v60, v61, v62) & 1) != 0)
    {

      goto LABEL_12;
    }
    objc_msgSend_group(v9, v63, v64, v65);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultConfiguration(v83, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    hasAutomaticallyRetryNetworkFailures = objc_msgSend_hasAutomaticallyRetryNetworkFailures(v87, v88, v89, v90);

    if ((hasAutomaticallyRetryNetworkFailures & 1) != 0)
      goto LABEL_14;
    objc_msgSend_configuration(v98, v66, v92, v67);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAutomaticallyRetryNetworkFailures_(v41, v93, 0, v94);
  }
LABEL_13:

LABEL_14:
  objc_msgSend_setCodeService_(v98, v66, (uint64_t)v8, v67);
  objc_msgSend_applyConvenienceConfiguration_(v98, v68, (uint64_t)v9, v69);
  objc_msgSend__addPreparedOperation_(self, v70, (uint64_t)v98, v71);

}

- (id)CKStatusReportArray
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_operationQueue(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_operationCount(v8, v9, v10, v11);
  objc_msgSend_operationQueue(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_maxConcurrentOperationCount(v16, v17, v18, v19);
  objc_msgSend_stringWithFormat_(v4, v21, (uint64_t)CFSTR("%@, %lu/%ld operations"), v22, self, v12, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v24, (uint64_t)v23, v25);

  objc_msgSend_operationQueue(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_operationCount(v29, v30, v31, v32);

  if (v33)
  {
    objc_msgSend_addObject_(v3, v34, (uint64_t)CFSTR("\nOperations: {"), v35);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend_operationQueue(self, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operations(v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v57, (uint64_t)v61, 16);
    if (v45)
    {
      v48 = v45;
      v49 = *(_QWORD *)v58;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v58 != v49)
            objc_enumerationMutation(v43);
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v46, (uint64_t)CFSTR("\t%@"), v47, *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v50));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v3, v52, (uint64_t)v51, v53);

          ++v50;
        }
        while (v48 != v50);
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v57, (uint64_t)v61, 16);
      }
      while (v48);
    }

    objc_msgSend_addObject_(v3, v54, (uint64_t)CFSTR("}"), v55);
  }
  return v3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSURL)serviceInstanceURL
{
  return self->_serviceInstanceURL;
}

- (NSNumber)boxedDatabaseScope
{
  return self->_boxedDatabaseScope;
}

- (CKContainerImplementation)containerImplementation
{
  return (CKContainerImplementation *)objc_loadWeakRetained((id *)&self->_containerImplementation);
}

- (OS_dispatch_queue)underlyingDispatchQueue
{
  return self->_underlyingDispatchQueue;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_underlyingDispatchQueue, 0);
  objc_destroyWeak((id *)&self->_containerImplementation);
  objc_storeStrong((id *)&self->_boxedDatabaseScope, 0);
  objc_storeStrong((id *)&self->_serviceInstanceURL, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
