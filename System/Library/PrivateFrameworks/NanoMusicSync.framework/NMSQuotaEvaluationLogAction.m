@implementation NMSQuotaEvaluationLogAction

+ (id)logActionWithActionType:(unint64_t)a3 state:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithActionType:state:", a3, v6);

  return v7;
}

- (NMSQuotaEvaluationLogAction)initWithActionType:(unint64_t)a3 state:(id)a4
{
  id v7;
  NMSQuotaEvaluationLogAction *v8;
  NMSQuotaEvaluationLogAction *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NMSQuotaEvaluationLogAction;
  v8 = -[NMSQuotaEvaluationLogAction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_state, a4);
  }

  return v9;
}

- (id)_identifierLogMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSQuotaEvaluationState mediaLibraryIdentifier](self->_state, "mediaLibraryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NMSQuotaEvaluationState mediaLibraryIdentifier](self->_state, "mediaLibraryIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[NMSQuotaEvaluationState externalLibraryIdentifier](self->_state, "externalLibraryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NMSQuotaEvaluationState externalLibraryIdentifier](self->_state, "externalLibraryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" - "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)logMessage
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NMSQuotaEvaluationLogAction _stringForType:](self, "_stringForType:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NMSQuotaEvaluationState containerIndex](self->_state, "containerIndex");
  v6 = -[NMSQuotaEvaluationState itemIndex](self->_state, "itemIndex");
  -[NMSQuotaEvaluationLogAction _identifierLogMessage](self, "_identifierLogMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\tCTNR:%3ld\tITEM:%3ld\t%@\titemSize:%llu\tlistSize:%llu"), v4, v5, v6, v7, -[NMSQuotaEvaluationState itemSize](self->_state, "itemSize"), -[NMSQuotaEvaluationState listTotalSize](self->_state, "listTotalSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_stringForType:(unint64_t)a3
{
  if (a3 > 2)
    return &stru_24D648498;
  else
    return off_24D646E48[a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

@end
