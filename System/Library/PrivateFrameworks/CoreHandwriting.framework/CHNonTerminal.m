@implementation CHNonTerminal

- (CHNonTerminal)initWithName:(id)a3 leftNode:(id)a4 rightNode:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger location;
  const char *length;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  const char *v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  NSRange v30;
  CHNonTerminal *v31;
  CHNonTerminal *v32;
  objc_super v34;
  NSRange v35;
  NSRange v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  location = objc_msgSend_inputRange(v9, v11, v12, v13, v14, v15);
  if (v10)
  {
    v22 = objc_msgSend_inputRange(v9, length, v18, v19, v20, v21);
    v24 = (NSUInteger)v23;
    v36.location = objc_msgSend_inputRange(v10, v23, v25, v26, v27, v28);
    v36.length = v29;
    v35.location = v22;
    v35.length = v24;
    v30 = NSUnionRange(v35, v36);
    length = (const char *)v30.length;
    location = v30.location;
  }
  v34.receiver = self;
  v34.super_class = (Class)CHNonTerminal;
  v31 = -[CHParseTreeNode initWithName:inputRange:](&v34, sel_initWithName_inputRange_, v8, location, length);
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_leftNode, a4);
    objc_storeStrong((id *)&v32->_rightNode, a5);
  }

  return v32;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;

  objc_msgSend_rightNode(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(self, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leftNode(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v20, v21, v22, v23, v24, v25);
  v26 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v26;
  if (v7)
  {
    objc_msgSend_rightNode(self, v27, v28, v29, v30, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v33, v34, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v8, v40, (uint64_t)CFSTR("%@ -> %@ %@"), v41, v42, v43, v14, v32, v39);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_stringWithFormat_(v8, v27, (uint64_t)CFSTR("%@ -> [%@]"), v29, v30, v31, v14, v26);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v44;
}

- (int64_t)getTerminalsCount
{
  CHParseTreeNode *leftNode;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t TerminalsCount;
  CHParseTreeNode *rightNode;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  leftNode = self->_leftNode;
  v4 = objc_opt_class();
  if ((objc_msgSend_isMemberOfClass_(leftNode, v5, v4, v6, v7, v8) & 1) != 0)
  {
    TerminalsCount = 1;
    rightNode = self->_rightNode;
    if (!rightNode)
      return TerminalsCount;
  }
  else
  {
    TerminalsCount = objc_msgSend_getTerminalsCount(self->_leftNode, v9, v10, v11, v12, v13);
    rightNode = self->_rightNode;
    if (!rightNode)
      return TerminalsCount;
  }
  v17 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(rightNode, v18, v17, v19, v20, v21))
    return TerminalsCount + 1;
  else
    return objc_msgSend_getTerminalsCount(self->_rightNode, v22, v23, v24, v25, v26) + TerminalsCount;
}

- (CHParseTreeNode)leftNode
{
  return self->_leftNode;
}

- (CHParseTreeNode)rightNode
{
  return self->_rightNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightNode, 0);
  objc_storeStrong((id *)&self->_leftNode, 0);
}

@end
