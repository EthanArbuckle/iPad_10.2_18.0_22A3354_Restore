@implementation CKVMatchingSpan

- (CKVMatchingSpan)initWithOntologyGraph:(id)a3 ontologyLabel:(id)a4 semanticValue:(id)a5 beginIndex:(unint64_t)a6 endIndex:(unint64_t)a7 itemId:(id)a8 originAppId:(id)a9 score:(float)a10 matchScore:(float)a11 priorInfo:(id)a12
{
  id v21;
  id v22;
  CKVMatchingSpan *v23;
  CKVMatchingSpan *v24;
  USOGraph **p_ontologyGraph;
  uint64_t v26;
  NSString *itemId;
  CKVMatchingSpanMetadata *v28;
  double v29;
  uint64_t v30;
  CKVMatchingSpanMetadata *metadata;
  CKVMatchingSpan *v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  NSString *ontologyLabel;
  NSString *semanticValue;
  NSString *v40;
  uint64_t v41;
  NSString *originAppId;
  id v44;
  id v45;
  id v46;
  id v47;
  objc_super v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  NSString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v45 = a4;
  v46 = a5;
  v21 = a8;
  v47 = a9;
  v22 = a12;
  v48.receiver = self;
  v48.super_class = (Class)CKVMatchingSpan;
  v23 = -[CKVMatchingSpan init](&v48, sel_init);
  v24 = v23;
  if (!v23)
    goto LABEL_8;
  p_ontologyGraph = &v23->_ontologyGraph;
  objc_storeStrong((id *)&v23->_ontologyGraph, a3);
  if (!*p_ontologyGraph)
  {
    v33 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[CKVMatchingSpan initWithOntologyGraph:ontologyLabel:semanticValue:beginIndex:endIndex:itemId:originAppId:s"
            "core:matchScore:priorInfo:]";
      v34 = "%s nil ontologyGraph";
      v35 = v33;
      v36 = 12;
LABEL_19:
      _os_log_error_impl(&dword_1A48B3000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  objc_storeStrong((id *)&v24->_ontologyLabel, a4);
  if (!-[NSString length](v24->_ontologyLabel, "length", v44, v45, v46, v47))
  {
    v37 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    ontologyLabel = v24->_ontologyLabel;
    *(_DWORD *)buf = 136315394;
    v50 = "-[CKVMatchingSpan initWithOntologyGraph:ontologyLabel:semanticValue:beginIndex:endIndex:itemId:originAppId:sco"
          "re:matchScore:priorInfo:]";
    v51 = 2112;
    v52 = ontologyLabel;
    v34 = "%s invalid ontologyLabel: %@";
LABEL_17:
    v35 = v37;
LABEL_18:
    v36 = 22;
    goto LABEL_19;
  }
  objc_storeStrong((id *)&v24->_semanticValue, a5);
  if (!-[NSString length](v24->_semanticValue, "length"))
  {
    v37 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    semanticValue = v24->_semanticValue;
    *(_DWORD *)buf = 136315394;
    v50 = "-[CKVMatchingSpan initWithOntologyGraph:ontologyLabel:semanticValue:beginIndex:endIndex:itemId:originAppId:sco"
          "re:matchScore:priorInfo:]";
    v51 = 2112;
    v52 = semanticValue;
    v34 = "%s invalid semanticValue: %@";
    goto LABEL_17;
  }
  v24->_beginIndex = a6;
  v24->_endIndex = a7;
  v26 = objc_msgSend(v21, "copy");
  itemId = v24->_itemId;
  v24->_itemId = (NSString *)v26;

  if (!-[NSString length](v24->_itemId, "length"))
  {
    v37 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v40 = v24->_itemId;
      *(_DWORD *)buf = 136315394;
      v50 = "-[CKVMatchingSpan initWithOntologyGraph:ontologyLabel:semanticValue:beginIndex:endIndex:itemId:originAppId:s"
            "core:matchScore:priorInfo:]";
      v51 = 2112;
      v52 = v40;
      v34 = "%s invalid itemId: %@";
      goto LABEL_17;
    }
LABEL_21:
    v32 = 0;
    goto LABEL_22;
  }
  objc_storeStrong((id *)&v24->_originAppId, a9);
  if (!-[NSString length](v24->_originAppId, "length"))
  {
    v41 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    originAppId = v24->_originAppId;
    *(_DWORD *)buf = 136315394;
    v50 = "-[CKVMatchingSpan initWithOntologyGraph:ontologyLabel:semanticValue:beginIndex:endIndex:itemId:originAppId:sco"
          "re:matchScore:priorInfo:]";
    v51 = 2112;
    v52 = originAppId;
    v34 = "%s invalid originAppId: %@";
    v35 = v41;
    goto LABEL_18;
  }
  v24->_score = a10;
  v28 = [CKVMatchingSpanMetadata alloc];
  *(float *)&v29 = a11;
  v30 = -[CKVMatchingSpanMetadata initWithMatchingSpanPriorInfo:matchScore:](v28, "initWithMatchingSpanPriorInfo:matchScore:", v22, v29);
  metadata = v24->_metadata;
  v24->_metadata = (CKVMatchingSpanMetadata *)v30;

LABEL_8:
  v32 = v24;
LABEL_22:

  return v32;
}

- (CKVMatchingSpan)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use internal initializer"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  void *v3;
  NSString *ontologyLabel;
  NSString *originAppId;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKVMatchingSpan;
  -[CKVMatchingSpan description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ontologyLabel = self->_ontologyLabel;
  originAppId = self->_originAppId;
  -[CKVMatchingSpanMetadata description](self->_metadata, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" ontologyLabel: %@, originAppId: %@, metadata: %@"), ontologyLabel, originAppId, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", self->_ontologyGraph, CFSTR("ontologyGraph"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_ontologyLabel, CFSTR("ontologyLabel"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_beginIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("b"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_endIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("e"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_itemId, CFSTR("itemId"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_originAppId, CFSTR("appId"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_semanticValue, CFSTR("semanticValue"));
  *(float *)&v6 = self->_score;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("score"), v6);
  objc_msgSend(v7, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));

}

- (CKVMatchingSpan)initWithCoder:(id)a3
{
  id v4;
  CKVMatchingSpan *v5;
  uint64_t v6;
  USOGraph *ontologyGraph;
  uint64_t v8;
  NSString *ontologyLabel;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *itemId;
  uint64_t v14;
  NSString *originAppId;
  uint64_t v16;
  NSString *semanticValue;
  float v18;
  uint64_t v19;
  CKVMatchingSpanMetadata *metadata;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKVMatchingSpan;
  v5 = -[CKVMatchingSpan init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ontologyGraph"));
    v6 = objc_claimAutoreleasedReturnValue();
    ontologyGraph = v5->_ontologyGraph;
    v5->_ontologyGraph = (USOGraph *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ontologyLabel"));
    v8 = objc_claimAutoreleasedReturnValue();
    ontologyLabel = v5->_ontologyLabel;
    v5->_ontologyLabel = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("b"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_beginIndex = objc_msgSend(v10, "unsignedLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("e"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_endIndex = objc_msgSend(v11, "unsignedLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemId"));
    v12 = objc_claimAutoreleasedReturnValue();
    itemId = v5->_itemId;
    v5->_itemId = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appId"));
    v14 = objc_claimAutoreleasedReturnValue();
    originAppId = v5->_originAppId;
    v5->_originAppId = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("semanticValue"));
    v16 = objc_claimAutoreleasedReturnValue();
    semanticValue = v5->_semanticValue;
    v5->_semanticValue = (NSString *)v16;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("score"));
    v5->_score = v18;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
    v19 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (CKVMatchingSpanMetadata *)v19;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_storeStrong((id *)(v5 + 16), self->_ontologyGraph);
  v6 = -[NSString copyWithZone:](self->_ontologyLabel, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(_QWORD *)(v5 + 40) = self->_beginIndex;
  *(_QWORD *)(v5 + 48) = self->_endIndex;
  v8 = -[NSString copyWithZone:](self->_itemId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_originAppId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v10;

  v12 = -[NSString copyWithZone:](self->_semanticValue, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  *(float *)(v5 + 8) = self->_score;
  v14 = -[CKVMatchingSpanMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  CKVMatchingSpan *v4;
  CKVMatchingSpan *v5;
  BOOL v6;

  v4 = (CKVMatchingSpan *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CKVMatchingSpan isEqualToMatchingSpan:](self, "isEqualToMatchingSpan:", v5);

  return v6;
}

- (BOOL)isEqualToMatchingSpan:(id)a3
{
  id v4;
  void *v5;
  NSString *ontologyLabel;
  void *v7;
  unint64_t beginIndex;
  unint64_t endIndex;
  NSString *itemId;
  void *v11;
  NSString *originAppId;
  void *v13;
  NSString *semanticValue;
  void *v15;
  float score;
  float v17;
  BOOL v18;
  CKVMatchingSpanMetadata *metadata;
  void *v21;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  ontologyLabel = self->_ontologyLabel;
  objc_msgSend(v4, "ontologyLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(ontologyLabel) = -[NSString isEqualToString:](ontologyLabel, "isEqualToString:", v7);

  if ((ontologyLabel & 1) == 0)
    goto LABEL_9;
  beginIndex = self->_beginIndex;
  if (beginIndex != objc_msgSend(v5, "beginIndex"))
    goto LABEL_9;
  endIndex = self->_endIndex;
  if (endIndex != objc_msgSend(v5, "endIndex"))
    goto LABEL_9;
  itemId = self->_itemId;
  objc_msgSend(v5, "itemId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(itemId) = -[NSString isEqualToString:](itemId, "isEqualToString:", v11);

  if ((itemId & 1) == 0)
    goto LABEL_9;
  originAppId = self->_originAppId;
  objc_msgSend(v5, "originAppId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(originAppId) = -[NSString isEqualToString:](originAppId, "isEqualToString:", v13);

  if ((originAppId & 1) == 0)
    goto LABEL_9;
  semanticValue = self->_semanticValue;
  objc_msgSend(v5, "semanticValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(semanticValue) = -[NSString isEqualToString:](semanticValue, "isEqualToString:", v15);

  if ((semanticValue & 1) != 0 && (score = self->_score, objc_msgSend(v5, "score"), score == v17))
  {
    metadata = self->_metadata;
    objc_msgSend(v5, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CKVMatchingSpanMetadata isEqual:](metadata, "isEqual:", v21);

  }
  else
  {
LABEL_9:
    v18 = 0;
  }

  return v18;
}

- (id)ontologyGraphData:(id *)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[USOGraph getCppGraph](self->_ontologyGraph, "getCppGraph");
  siri::ontology::UsoGraphProtoWriter::toProtobuf();
  v3 = v6;
  PB::Writer::Writer((PB::Writer *)&v6);
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v3 + 24))(v3, &v6);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, v6 - v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PB::Writer::~Writer((PB::Writer *)&v6);
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  double v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  NSUInteger v15;

  v15 = -[NSString hash](self->_ontologyLabel, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_beginIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_endIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = -[NSString hash](self->_itemId, "hash");
  v8 = -[NSString hash](self->_originAppId, "hash");
  v9 = -[NSString hash](self->_semanticValue, "hash");
  *(float *)&v10 = self->_score;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = v4 ^ v15 ^ v6 ^ v7 ^ v8 ^ v9 ^ v12 ^ -[CKVMatchingSpanMetadata hash](self->_metadata, "hash");

  return v13;
}

- (USOGraph)ontologyGraph
{
  return self->_ontologyGraph;
}

- (NSString)ontologyLabel
{
  return self->_ontologyLabel;
}

- (NSString)semanticValue
{
  return self->_semanticValue;
}

- (unint64_t)beginIndex
{
  return self->_beginIndex;
}

- (unint64_t)endIndex
{
  return self->_endIndex;
}

- (NSString)itemId
{
  return self->_itemId;
}

- (NSString)originAppId
{
  return self->_originAppId;
}

- (CKVMatchingSpanMetadata)metadata
{
  return self->_metadata;
}

- (float)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_originAppId, 0);
  objc_storeStrong((id *)&self->_itemId, 0);
  objc_storeStrong((id *)&self->_semanticValue, 0);
  objc_storeStrong((id *)&self->_ontologyLabel, 0);
  objc_storeStrong((id *)&self->_ontologyGraph, 0);
}

+ (id)matchingSpanFromSpanMatchResult:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v30 = 0;
  objc_msgSend(v3, "toOntologyGraph:", &v30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v30;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "_extractOntologyLabelFromGraph:", v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "spanInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "spanRange");
    v9 = v8;

    objc_msgSend(v3, "entityInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "entityType") == 1)
    {
      v29 = v5;
      objc_msgSend(v10, "toKVItem:", &v29);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v29;

      if (v11)
      {
        v12 = objc_alloc((Class)objc_opt_class());
        objc_msgSend(v3, "spanValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sourceIdentifierOrConstant");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "score");
        v16 = v15;
        objc_msgSend(v3, "spanInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "matchScore");
        LODWORD(v19) = v18;
        LODWORD(v20) = v16;
        v21 = (void *)objc_msgSend(v12, "initWithOntologyGraph:ontologyLabel:semanticValue:beginIndex:endIndex:itemId:originAppId:score:matchScore:priorInfo:", v4, v28, v26, v7, v7 + v9, v13, v20, v19, v14, 0);

      }
      else
      {
        v24 = CKLogContextVocabulary;
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v32 = "+[CKVMatchingSpan matchingSpanFromSpanMatchResult:]";
          v33 = 2112;
          v34 = v3;
          v35 = 2112;
          v36 = v27;
          _os_log_error_impl(&dword_1A48B3000, v24, OS_LOG_TYPE_ERROR, "%s Failed to resolve item from result: %@ error: %@", buf, 0x20u);
        }
        v21 = 0;
      }

      v5 = v27;
    }
    else
    {
      v23 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "+[CKVMatchingSpan matchingSpanFromSpanMatchResult:]";
        v33 = 2112;
        v34 = v3;
        _os_log_error_impl(&dword_1A48B3000, v23, OS_LOG_TYPE_ERROR, "%s Unsupported entityInfo for result: %@", buf, 0x16u);
      }
      v21 = 0;
    }

  }
  else
  {
    v22 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "+[CKVMatchingSpan matchingSpanFromSpanMatchResult:]";
      v33 = 2112;
      v34 = v5;
      _os_log_error_impl(&dword_1A48B3000, v22, OS_LOG_TYPE_ERROR, "%s Omitting result: %@", buf, 0x16u);
    }
    v21 = 0;
  }

  return v21;
}

+ (id)_extractOntologyLabelFromGraph:(id)a3
{
  char *v3;
  size_t v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  std::string::size_type v11;
  void *v12;
  const void *v13;
  siri::ontology::UsoEntityNode *v14;
  __int128 v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  std::string *v20;
  uint64_t *v21;
  std::string v22;
  char v23;
  void *__p;
  char *v25;
  char *v26;

  objc_msgSend(a3, "getCppRootNode");
  siri::ontology::UsoGraph::getSuccessors();
  v3 = v25;
  if (v25 == __p)
    goto LABEL_32;
  if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)__p + 16))(*(_QWORD *)__p) != 2)
  {
LABEL_35:
    v18 = 0;
    goto LABEL_36;
  }
  siri::ontology::UsoGraph::getSuccessors();
  v4 = v22.__r_.__value_.__l.__size_ - v22.__r_.__value_.__r.__words[0];
  v5 = (uint64_t)(v22.__r_.__value_.__l.__size_ - v22.__r_.__value_.__r.__words[0]) >> 3;
  v6 = (uint64_t)v26;
  v7 = (char *)__p;
  if (v5 > (v26 - (_BYTE *)__p) >> 3)
  {
    if (__p)
    {
      operator delete(__p);
      v6 = 0;
      __p = 0;
      v25 = 0;
      v26 = 0;
    }
    if ((v4 & 0x8000000000000000) != 0)
      goto LABEL_47;
    v8 = v6 >> 2;
    if (v6 >> 2 <= v5)
      v8 = (uint64_t)(v22.__r_.__value_.__l.__size_ - v22.__r_.__value_.__r.__words[0]) >> 3;
    v9 = (unint64_t)v6 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v8;
    if (v9 >> 61)
LABEL_47:
      std::vector<std::reference_wrapper<siri::ontology::UsoGraphNode>>::__throw_length_error[abi:ne180100]();
    v7 = (char *)operator new(8 * v9);
    __p = v7;
    v25 = v7;
    v26 = &v7[8 * v9];
    goto LABEL_19;
  }
  v10 = (v25 - (_BYTE *)__p) >> 3;
  if (v10 >= v5)
  {
LABEL_19:
    if (v22.__r_.__value_.__l.__size_ == v22.__r_.__value_.__r.__words[0])
      goto LABEL_22;
    v12 = v7;
    v13 = (const void *)v22.__r_.__value_.__r.__words[0];
    goto LABEL_21;
  }
  v11 = v22.__r_.__value_.__r.__words[0] + 8 * v10;
  if (v25 != __p)
  {
    memmove(__p, v22.__r_.__value_.__l.__data_, v25 - (_BYTE *)__p);
    v7 = v25;
  }
  v4 = v22.__r_.__value_.__l.__size_ - v11;
  if (v22.__r_.__value_.__l.__size_ != v11)
  {
    v12 = v7;
    v13 = (const void *)v11;
LABEL_21:
    memmove(v12, v13, v4);
  }
LABEL_22:
  v3 = &v7[v4];
  v25 = &v7[v4];
  if (v22.__r_.__value_.__r.__words[0])
  {
    v22.__r_.__value_.__l.__size_ = v22.__r_.__value_.__r.__words[0];
    operator delete(v22.__r_.__value_.__l.__data_);
    v3 = v25;
  }
  if (v3 == __p)
  {
LABEL_32:
    v18 = 0;
    if (!v3)
      return v18;
    goto LABEL_37;
  }
  if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)__p + 16))(*(_QWORD *)__p) != 3)
    goto LABEL_35;
  v14 = *(siri::ontology::UsoEntityNode **)__p;
  siri::ontology::UsoEntityNode::getEntitySpans(*(siri::ontology::UsoEntityNode **)__p);
  v15 = *(_OWORD *)&v22.__r_.__value_.__l.__data_;
  if (v22.__r_.__value_.__r.__words[0])
  {
    v22.__r_.__value_.__l.__size_ = v22.__r_.__value_.__r.__words[0];
    operator delete((void *)v15);
  }
  if (*((_QWORD *)&v15 + 1) == (_QWORD)v15)
    goto LABEL_35;
  siri::ontology::UsoEntityNode::getEntitySpans(v14);
  v16 = v21;
  v17 = *v21;
  v22.__r_.__value_.__s.__data_[0] = 0;
  v23 = 0;
  if (!*(_BYTE *)(v17 + 64))
  {
    operator delete(v21);
    goto LABEL_35;
  }
  if ((*(char *)(v17 + 63) & 0x80000000) == 0)
  {
    v22 = *(std::string *)(v17 + 40);
    v23 = 1;
LABEL_40:
    operator delete(v16);
    goto LABEL_41;
  }
  std::string::__init_copy_ctor_external(&v22, *(const std::string::value_type **)(v17 + 40), *(_QWORD *)(v17 + 48));
  v16 = v21;
  v23 = 1;
  if (v21)
    goto LABEL_40;
LABEL_41:
  if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v22;
  else
    v20 = (std::string *)v22.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 && SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
LABEL_36:
  v3 = (char *)__p;
  if (__p)
  {
LABEL_37:
    v25 = v3;
    operator delete(v3);
  }
  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
