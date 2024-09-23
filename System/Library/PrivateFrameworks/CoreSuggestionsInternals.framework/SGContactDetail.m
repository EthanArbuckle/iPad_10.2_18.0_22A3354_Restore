@implementation SGContactDetail

- (SGContactDetail)initWithValue:(id)a3 label:(id)a4 type:(unint64_t)a5 recordId:(id)a6 duplicateKey:(id)a7 sourceKey:(id)a8 context:(id)a9 extractionInfo:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  SGContactDetail *v22;
  uint64_t v23;
  NSString *value;
  uint64_t v25;
  NSString *label;
  uint64_t v27;
  SGRecordId *recordId;
  uint64_t v29;
  NSString *context;
  uint64_t v31;
  NSString *sourceKey;
  void *v34;
  void *v35;
  void *v36;
  objc_super v39;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  if (v15)
  {
    if (v18)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactDetail.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("duplicateKey"));

    if (v21)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactDetail.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

  if (!v18)
    goto LABEL_8;
LABEL_3:
  if (v21)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGContactDetail.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extractionInfo"));

LABEL_4:
  v39.receiver = self;
  v39.super_class = (Class)SGContactDetail;
  v22 = -[SGContactDetail init](&v39, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    value = v22->_value;
    v22->_value = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    label = v22->_label;
    v22->_label = (NSString *)v25;

    v22->_type = a5;
    v27 = objc_msgSend(v17, "copy");
    recordId = v22->_recordId;
    v22->_recordId = (SGRecordId *)v27;

    v29 = objc_msgSend(v20, "copy");
    context = v22->_context;
    v22->_context = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    sourceKey = v22->_sourceKey;
    v22->_sourceKey = (NSString *)v31;

    objc_storeStrong((id *)&v22->_duplicateKey, a7);
    objc_storeStrong((id *)&v22->_extractionInfo, a10);
  }

  return v22;
}

- (NSString)normalizedValue
{
  NSString *normalizedValue;
  NSString *v4;
  NSString *v5;

  normalizedValue = self->_normalizedValue;
  if (!normalizedValue)
  {
    switch(self->_type)
    {
      case 0uLL:
        SGNormalizePhoneNumber();
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 1uLL:
        SGNormalizeAddress(self->_value);
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 2uLL:
        SGNormalizeEmailAddress();
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 3uLL:
        SGNormalizeInstantMessageAddress(self->_value);
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 4uLL:
        SGNormalizeSocialProfileIdentifier(self->_value);
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 5uLL:
        v4 = self->_value;
        goto LABEL_11;
      case 6uLL:
        SGNormalizeBirthday(self->_value);
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v5 = self->_normalizedValue;
        self->_normalizedValue = v4;

        normalizedValue = self->_normalizedValue;
        break;
      default:
        normalizedValue = 0;
        break;
    }
  }
  return normalizedValue;
}

- (BOOL)isEqual:(id)a3
{
  SGContactDetail *v4;
  SGContactDetail *v5;
  BOOL v6;

  v4 = (SGContactDetail *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGContactDetail isEqualToContactDetail:](self, "isEqualToContactDetail:", v5);

  return v6;
}

- (BOOL)isEqualToContactDetail:(id)a3
{
  id *v4;
  NSString *value;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *label;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  SGRecordId *recordId;
  SGRecordId *v16;
  SGRecordId *v17;
  SGRecordId *v18;
  char v19;
  NSString *context;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  char v25;
  NSString *v26;
  NSString *v27;

  v4 = (id *)a3;
  value = self->_value;
  v6 = (NSString *)v4[4];
  if (value == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = value;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_15;
  }
  label = self->_label;
  v11 = (NSString *)v4[5];
  if (label == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = label;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_15;
  }
  recordId = self->_recordId;
  v16 = (SGRecordId *)v4[2];
  if (recordId == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = recordId;
    v19 = -[SGRecordId isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_15;
  }
  context = self->_context;
  v21 = (NSString *)v4[8];
  if (context == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = context;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
    {
LABEL_15:
      v25 = 0;
      goto LABEL_21;
    }
  }
  v26 = self->_sourceKey;
  v27 = v26;
  if (v26 == v4[7])
    v25 = 1;
  else
    v25 = -[NSString isEqual:](v26, "isEqual:");

LABEL_21:
  return v25;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_value, "hash");
  return -[SGRecordId hash](self->_recordId, "hash") - v3 + 32 * v3;
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)label
{
  return self->_label;
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (NSString)sourceKey
{
  return self->_sourceKey;
}

- (NSString)context
{
  return self->_context;
}

- (SGDuplicateKey)duplicateKey
{
  return self->_duplicateKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateKey, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sourceKey, 0);
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_normalizedValue, 0);
}

+ (id)contactDetail:(id)a3 label:(id)a4 type:(unint64_t)a5 recordId:(id)a6 duplicateKey:(id)a7 sourceKey:(id)a8 context:(id)a9 extractionInfo:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SGContactDetail *v23;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a4;
  v22 = a3;
  v23 = -[SGContactDetail initWithValue:label:type:recordId:duplicateKey:sourceKey:context:extractionInfo:]([SGContactDetail alloc], "initWithValue:label:type:recordId:duplicateKey:sourceKey:context:extractionInfo:", v22, v21, a5, v20, v19, v18, v17, v16);

  return v23;
}

+ (id)contactDetailFromEntity:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGContactDetail.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entity"));

  }
  objc_msgSend(v5, "duplicateKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "entityType");

  if (v7 > 0x17)
    goto LABEL_11;
  if (((1 << v7) & 0xB88FC0) != 0)
  {
    objc_msgSend(v5, "title");
    v33 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "duplicateKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactDetailKey");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "duplicateKey");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SGEntityTypeToContactDetailType(objc_msgSend(v34, "entityType"));
    objc_msgSend(v5, "recordId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "duplicateKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extractionInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)v33;
    +[SGContactDetail contactDetail:label:type:recordId:duplicateKey:sourceKey:context:extractionInfo:](SGContactDetail, "contactDetail:label:type:recordId:duplicateKey:sourceKey:context:extractionInfo:", v33, v9, v10, v11, v12, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v8;
    goto LABEL_6;
  }
  if (v7 != 4)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "duplicateKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGContactDetail.m"), 227, CFSTR("Cannot construct SGContactDetail from entity of type %lld"), objc_msgSend(v18, "entityType"));
    v17 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v5, "duplicateKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identityKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v21;
  objc_msgSend(v21, "uniqueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "type");
  v23 = v22 - 1;
  if ((unint64_t)(v22 - 1) < 5 && ((0x1Du >> v23) & 1) != 0)
  {
    v27 = qword_1C3858CC8[v23];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = v18;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SGContactDetailType SGIdentityKeyTypeToContactDetailType(SGIdentityKeyType)");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("SGContactDetail.m"), 129, CFSTR("Unhandled identity key type %u"), v22);

    v18 = v24;
    v27 = -1;
  }
  objc_msgSend(v5, "recordId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duplicateKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extractionInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGContactDetail contactDetail:label:type:recordId:duplicateKey:sourceKey:context:extractionInfo:](SGContactDetail, "contactDetail:label:type:recordId:duplicateKey:sourceKey:context:extractionInfo:", v18, 0, v27, v28, v29, v30, 0, v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v17;
}

@end
