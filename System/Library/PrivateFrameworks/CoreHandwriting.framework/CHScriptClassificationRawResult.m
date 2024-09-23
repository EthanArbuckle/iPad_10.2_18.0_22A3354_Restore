@implementation CHScriptClassificationRawResult

- (CHScriptClassificationRawResult)initWithProbabilityByScriptClassifications:(id)a3
{
  id v5;
  CHScriptClassificationRawResult *v6;
  CHScriptClassificationRawResult *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *orderedScriptClassification;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CHScriptClassificationRawResult;
  v6 = -[CHScriptClassificationRawResult init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_probabilityByScriptClassifications, a3);
    objc_msgSend_probabilityByScriptClassifications(v7, v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keysSortedByValueUsingComparator_(v13, v14, (uint64_t)&unk_1E77F32F0, v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    orderedScriptClassification = v7->_orderedScriptClassification;
    v7->_orderedScriptClassification = (NSArray *)v18;

  }
  return v7;
}

- (id)scriptClassificationAtIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_orderedScriptClassification(self, a2, a3, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, a3, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)scriptProbabilityAtIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  objc_msgSend_orderedScriptClassification(self, a2, a3, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v8, v9, a3, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_probabilityByScriptClassifications(self, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v13, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)fallbackScriptClassificationForWeakLabel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  for (i = 0; ; ++i)
  {
    objc_msgSend_orderedScriptClassification(self, a2, v2, v3, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_count(v8, v9, v10, v11, v12, v13);

    if (v14 <= i)
      break;
    objc_msgSend_orderedScriptClassification(self, v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v20, v21, i, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_containsObject_(&unk_1E7827C98, v26, (uint64_t)v25, v27, v28, v29) & 1) == 0)
      return v25;

  }
  v25 = &unk_1E7828550;
  return v25;
}

- (BOOL)isValidScriptClassificationForShapeStroke
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  float v28;
  BOOL result;

  objc_msgSend_scriptClassificationAtIndex_(self, a2, 0, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_integerValue(v6, v7, v8, v9, v10, v11);

  result = 0;
  if (objc_msgSend_isScriptClassificationMath_(CHStrokeUtilities, v13, v12, v14, v15, v16))
  {
    if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 0xE)
      return 1;
    objc_msgSend_scriptProbabilityAtIndex_(self, v17, 0, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v21, v22, v23, v24, v25, v26);
    v28 = v27;

    if (v28 >= 0.9)
      return 1;
  }
  return result;
}

+ (id)validFallbackScriptClassificationsForNontext
{
  if (qword_1EF568028 != -1)
    dispatch_once(&qword_1EF568028, &unk_1E77F3310);
  return (id)qword_1EF568020;
}

+ (id)changeableTextMathScriptClassifications
{
  if (qword_1EF568038 != -1)
    dispatch_once(&qword_1EF568038, &unk_1E77F3330);
  return (id)qword_1EF568030;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend_probabilityByScriptClassifications(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v13, v10, (uint64_t)v9, (uint64_t)CFSTR("scriptClassificationRawResultsProbability"), v11, v12);

}

- (CHScriptClassificationRawResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CHScriptClassificationRawResult *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)&v25, 3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v10, (uint64_t)v9, v11, v12, v13, v25, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("scriptClassificationRawResultsProbability"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (CHScriptClassificationRawResult *)objc_msgSend_initWithProbabilityByScriptClassifications_(self, v19, (uint64_t)v18, v20, v21, v22);
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToScriptClassificationRawResult:(id)a3
{
  CHScriptClassificationRawResult *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHScriptClassificationRawResult *v10;
  NSDictionary *probabilityByScriptClassifications;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *v17;
  NSDictionary *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char isEqualToArray;
  NSArray *orderedScriptClassification;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *v36;
  NSArray *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = (CHScriptClassificationRawResult *)a3;
  v10 = v4;
  if (self == v4)
  {
    isEqualToArray = 1;
    goto LABEL_11;
  }
  probabilityByScriptClassifications = self->_probabilityByScriptClassifications;
  objc_msgSend_probabilityByScriptClassifications(v4, v5, v6, v7, v8, v9);
  v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (probabilityByScriptClassifications == v17)
  {

  }
  else
  {
    v18 = self->_probabilityByScriptClassifications;
    objc_msgSend_probabilityByScriptClassifications(v10, v12, v13, v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend_isEqualToDictionary_(v18, v20, (uint64_t)v19, v21, v22, v23);

    if (!(_DWORD)v18)
    {
      isEqualToArray = 0;
      goto LABEL_11;
    }
  }
  orderedScriptClassification = self->_orderedScriptClassification;
  objc_msgSend_orderedScriptClassification(v10, v24, v25, v26, v27, v28);
  v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (orderedScriptClassification == v36)
  {
    isEqualToArray = 1;
  }
  else
  {
    v37 = self->_orderedScriptClassification;
    objc_msgSend_orderedScriptClassification(v10, v31, v32, v33, v34, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToArray = objc_msgSend_isEqualToArray_(v37, v39, (uint64_t)v38, v40, v41, v42);

  }
LABEL_11:

  return isEqualToArray;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToScriptClassificationRawResult;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToScriptClassificationRawResult = objc_msgSend_isEqualToScriptClassificationRawResult_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToScriptClassificationRawResult;
  }
  else
  {

    return 0;
  }
}

- (NSArray)orderedScriptClassification
{
  return self->_orderedScriptClassification;
}

- (NSDictionary)probabilityByScriptClassifications
{
  return self->_probabilityByScriptClassifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probabilityByScriptClassifications, 0);
  objc_storeStrong((id *)&self->_orderedScriptClassification, 0);
}

@end
