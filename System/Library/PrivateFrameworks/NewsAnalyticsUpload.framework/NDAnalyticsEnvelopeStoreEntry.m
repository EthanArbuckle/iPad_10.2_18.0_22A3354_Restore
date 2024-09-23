@implementation NDAnalyticsEnvelopeStoreEntry

- (NDAnalyticsEnvelopeStoreEntry)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NDAnalyticsEnvelopeStoreEntry;
  return -[NDAnalyticsEnvelopeStoreEntry init](&v3, sel_init);
}

- (NDAnalyticsEnvelopeStoreEntry)initWithStringRepresentation:(id)a3
{
  id v4;
  void *v5;
  NDAnalyticsEnvelopeStoreEntry *v6;
  uint64_t v7;
  NSString *envelopeIdentifier;
  void *v9;

  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NDAnalyticsEnvelopeStoreEntry initWithStringRepresentation:].cold.1();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("$"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 3)
  {
    v6 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v6 = -[NDAnalyticsEnvelopeStoreEntry init](self, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    envelopeIdentifier = v6->_envelopeIdentifier;
    v6->_envelopeIdentifier = (NSString *)v7;

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_submissionDateMillisecondsSince1970 = objc_msgSend(v9, "fc_unsignedLongLongValue");

    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    self = (NDAnalyticsEnvelopeStoreEntry *)objc_claimAutoreleasedReturnValue();
    v6->_envelopeContentType = -[NDAnalyticsEnvelopeStoreEntry integerValue](self, "integerValue");
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

- (void)setEnvelopeSubmissionDate:(id)a3
{
  self->_submissionDateMillisecondsSince1970 = objc_msgSend(a3, "fc_millisecondTimeIntervalSince1970");
}

- (NSDate)envelopeSubmissionDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "fc_dateWithMillisecondTimeIntervalSince1970:", self->_submissionDateMillisecondsSince1970);
}

- (id)stringRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  void *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v17[0] = self->_envelopeIdentifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_submissionDateMillisecondsSince1970);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_envelopeContentType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__NDAnalyticsEnvelopeStoreEntry_stringRepresentation__block_invoke;
  v14[3] = &unk_24D1DF330;
  v9 = v8;
  v15 = v9;
  v16 = v7;
  v10 = v7;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

uint64_t __53__NDAnalyticsEnvelopeStoreEntry_stringRepresentation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (result - 1 != a3)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("$"));
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  FCDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NDAnalyticsEnvelopeStoreEntry envelopeIdentifier](self, "envelopeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "envelopeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[NDAnalyticsEnvelopeStoreEntry envelopeSubmissionDate](self, "envelopeSubmissionDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "envelopeSubmissionDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToDate:", v9))
      {
        v10 = -[NDAnalyticsEnvelopeStoreEntry envelopeContentType](self, "envelopeContentType");
        v11 = v10 == objc_msgSend(v5, "envelopeContentType");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[NDAnalyticsEnvelopeStoreEntry envelopeIdentifier](self, "envelopeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NDAnalyticsEnvelopeStoreEntry envelopeSubmissionDate](self, "envelopeSubmissionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[NDAnalyticsEnvelopeStoreEntry envelopeContentType](self, "envelopeContentType");

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NDAnalyticsEnvelopeStoreEntry stringRepresentation](self, "stringRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithStringRepresentation:", v5);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE6CB48], "descriptionWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDAnalyticsEnvelopeStoreEntry envelopeIdentifier](self, "envelopeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("identifier"), v4);

  -[NDAnalyticsEnvelopeStoreEntry envelopeSubmissionDate](self, "envelopeSubmissionDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("submissionDate"), v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NDAnalyticsEnvelopeStoreEntry envelopeContentType](self, "envelopeContentType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("contentType"), v6);

  objc_msgSend(v3, "descriptionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)envelopeIdentifier
{
  return self->_envelopeIdentifier;
}

- (void)setEnvelopeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)envelopeContentType
{
  return self->_envelopeContentType;
}

- (void)setEnvelopeContentType:(int)a3
{
  self->_envelopeContentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_envelopeIdentifier, 0);
}

- (void)initWithStringRepresentation:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_214674000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"stringRepresentation", v6, 2u);

  OUTLINED_FUNCTION_3();
}

@end
