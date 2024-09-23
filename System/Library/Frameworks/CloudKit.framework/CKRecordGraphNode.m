@implementation CKRecordGraphNode

- (CKRecordGraphNode)init
{
  CKRecordGraphNode *v2;
  uint64_t v3;
  NSMutableSet *edges;
  uint64_t v5;
  NSMutableSet *indegrees;
  CKRecord *record;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKRecordGraphNode;
  v2 = -[CKRecordGraphNode init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    edges = v2->_edges;
    v2->_edges = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    indegrees = v2->_indegrees;
    v2->_indegrees = (NSMutableSet *)v5;

    record = v2->_record;
    v2->_record = 0;

  }
  return v2;
}

- (unint64_t)indegree
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_indegrees(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v4, v5, v6, v7);

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  objc_msgSend_record(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_hash(v8, v9, v10, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CKRecordGraphNode *v4;
  CKRecordGraphNode *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  char isEqual;

  v4 = (CKRecordGraphNode *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_record(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_record(v5, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_recordID(v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v13, v22, (uint64_t)v21, v23);

    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_indegree(self, a2, v2, v3);
  objc_msgSend_edges(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_count(v10, v11, v12, v13);
  objc_msgSend_record(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v19, (uint64_t)CFSTR("indegree=%d, edges=%d, record=%@"), v20, v6, v14, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)description
{
  return (id)((uint64_t (*)(CKRecordGraphNode *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSMutableSet)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
  objc_storeStrong((id *)&self->_edges, a3);
}

- (NSMutableSet)indegrees
{
  return self->_indegrees;
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_indegrees, 0);
  objc_storeStrong((id *)&self->_edges, 0);
}

@end
