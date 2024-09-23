@implementation CKReplaceDeltasRequest

- (CKReplaceDeltasRequest)initWithValueID:(id)a3 deltaIdentifiersToReplace:(id)a4 replacementDeltas:(id)a5 replacementDeltasContainNewData:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  char v15;
  char v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  CKReplaceDeltasRequest *v20;
  uint64_t v21;
  CKMergeableValueID *valueID;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *deltaIdentifiersToReplace;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSArray *replacementDeltas;
  void *v34;
  CKException *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  id v45;
  objc_super v46;
  id v47;
  id v48;
  id v49;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v49 = 0;
  v13 = _CKCheckArgument((uint64_t)"valueID", v10, 0, 0, 0, &v49);
  v14 = v49;
  if ((v13 & 1) == 0)
    goto LABEL_7;

  v48 = 0;
  v15 = _CKCheckArgument((uint64_t)"deltaIdentifiersToReplace", v11, 0, 0, 0, &v48);
  v14 = v48;
  if ((v15 & 1) == 0
    || (v14,
        v47 = 0,
        v16 = _CKCheckArgument((uint64_t)"replacementDeltas", v12, 0, 0, 0, &v47),
        v14 = v47,
        (v16 & 1) == 0))
  {
LABEL_7:
    v34 = v14;
    v35 = [CKException alloc];
    v39 = objc_msgSend_code(v34, v36, v37, v38);
    objc_msgSend_localizedDescription(v34, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (id)objc_msgSend_initWithCode_format_(v35, v44, v39, (uint64_t)CFSTR("%@"), v43);

    objc_exception_throw(v45);
  }

  v46.receiver = self;
  v46.super_class = (Class)CKReplaceDeltasRequest;
  v20 = -[CKReplaceDeltasRequest init](&v46, sel_init);
  if (v20)
  {
    v21 = objc_msgSend_copy(v10, v17, v18, v19);
    valueID = v20->_valueID;
    v20->_valueID = (CKMergeableValueID *)v21;

    v26 = objc_msgSend_copy(v11, v23, v24, v25);
    deltaIdentifiersToReplace = v20->_deltaIdentifiersToReplace;
    v20->_deltaIdentifiersToReplace = (NSArray *)v26;

    v31 = objc_msgSend_copy(v12, v28, v29, v30);
    replacementDeltas = v20->_replacementDeltas;
    v20->_replacementDeltas = (NSArray *)v31;

    v20->_replacementDeltasContainNewData = a6;
  }

  return v20;
}

- (CKReplaceDeltasRequest)init
{
  CKException *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  const char *v8;
  id v9;

  v3 = [CKException alloc];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend_initWithName_format_(v3, v8, v4, (uint64_t)CFSTR("-[%@ %@] is unavailable"), v6, v7);

  objc_exception_throw(v9);
}

- (BOOL)isEqual:(id)a3
{
  CKReplaceDeltasRequest *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int isEqual;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  char v44;

  v4 = (CKReplaceDeltasRequest *)a3;
  if (self == v4)
  {
    v44 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    v8 = objc_msgSend_replacementDeltasContainNewData(self, v5, v6, v7);
    if (v8 != objc_msgSend_replacementDeltasContainNewData(v4, v9, v10, v11))
      goto LABEL_7;
    objc_msgSend_valueID(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueID(v4, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v15, v20, (uint64_t)v19, v21);

    if (!isEqual)
      goto LABEL_7;
    objc_msgSend_deltaIdentifiersToReplace(self, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deltaIdentifiersToReplace(v4, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_isEqual_(v26, v31, (uint64_t)v30, v32);

    if (v33)
    {
      objc_msgSend_replacementDeltas(self, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_replacementDeltas(v4, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_isEqual_(v37, v42, (uint64_t)v41, v43);

    }
    else
    {
LABEL_7:
      v44 = 0;
    }
  }

  return v44;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  objc_msgSend_valueID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_deltaIdentifiersToReplace(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_replacementDeltas(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);
  v29 = v25 ^ objc_msgSend_replacementDeltasContainNewData(self, v26, v27, v28);

  return v29;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  id v28;

  v4 = a3;
  objc_msgSend_valueID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("valueID"), (uint64_t)v8, 0);

  objc_msgSend_deltaIdentifiersToReplace(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("deltaIdentifiersToReplace"), (uint64_t)v13, 0);

  objc_msgSend_replacementDeltas(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v19, (uint64_t)CFSTR("replacementDeltas"), (uint64_t)v18, 0);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  v24 = objc_msgSend_replacementDeltasContainNewData(self, v21, v22, v23);
  objc_msgSend_numberWithBool_(v20, v25, v24, v26);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v27, (uint64_t)CFSTR("replacementDeltasContainNewData"), (uint64_t)v28, 0);

}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKReplaceDeltasRequest *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKReplaceDeltasRequest *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKReplaceDeltasRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  CKReplaceDeltasRequest *v32;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_valueID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend_setWithObjects_(v9, v12, v10, v13, v11, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deltaIdentifiersToReplace);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend_setWithObjects_(v18, v21, v19, v22, v20, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_replacementDeltas);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v25, (uint64_t)v23, (uint64_t)v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_replacementDeltasContainNewData);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_decodeBoolForKey_(v4, v28, (uint64_t)v27, v29);

  v32 = (CKReplaceDeltasRequest *)objc_msgSend_initWithValueID_deltaIdentifiersToReplace_replacementDeltas_replacementDeltasContainNewData_(self, v31, (uint64_t)v8, (uint64_t)v17, v26, v30);
  return v32;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id v29;

  v29 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_valueID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_valueID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v29, v10, (uint64_t)v8, (uint64_t)v9);

  objc_msgSend_deltaIdentifiersToReplace(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deltaIdentifiersToReplace);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v29, v16, (uint64_t)v14, (uint64_t)v15);

  objc_msgSend_replacementDeltas(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_replacementDeltas);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v29, v22, (uint64_t)v20, (uint64_t)v21);

  v26 = objc_msgSend_replacementDeltasContainNewData(self, v23, v24, v25);
  NSStringFromSelector(sel_replacementDeltasContainNewData);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v29, v28, v26, (uint64_t)v27);

  objc_autoreleasePoolPop(v4);
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_deltaIdentifiersToReplace(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v4, v9, (uint64_t)v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPlistObject_forKey_(v3, v12, (uint64_t)v11, (uint64_t)CFSTR("ids"));

  objc_msgSend_valueID(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, (uint64_t)CFSTR("valueID"));

  objc_msgSend_properties(v3, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v21;
}

- (CKMergeableValueID)valueID
{
  return self->_valueID;
}

- (NSArray)deltaIdentifiersToReplace
{
  return self->_deltaIdentifiersToReplace;
}

- (NSArray)replacementDeltas
{
  return self->_replacementDeltas;
}

- (BOOL)replacementDeltasContainNewData
{
  return self->_replacementDeltasContainNewData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementDeltas, 0);
  objc_storeStrong((id *)&self->_deltaIdentifiersToReplace, 0);
  objc_storeStrong((id *)&self->_valueID, 0);
}

@end
