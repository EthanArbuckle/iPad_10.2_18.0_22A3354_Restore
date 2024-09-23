@implementation CHProductionRule

- (CHProductionRule)initWithLeftNode:(id)a3 rightNode:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  return (CHProductionRule *)objc_msgSend_initWithLeftNode_rightNode_probability_(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5, 1.0);
}

- (CHProductionRule)initWithLeftNode:(id)a3 rightNode:(id)a4 probability:(double)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CHProductionRule *v17;

  v9 = a3;
  v10 = a4;
  v16 = objc_msgSend_init(self, v11, v12, v13, v14, v15);
  v17 = (CHProductionRule *)v16;
  if (v16)
  {
    objc_storeStrong((id *)(v16 + 8), a3);
    objc_storeStrong((id *)&v17->_rightNode1, a4);
    v17->_probability = a5;
  }

  return v17;
}

- (CHProductionRule)initWithLeftNode:(id)a3 rightNode1:(id)a4 rightNode2:(id)a5
{
  uint64_t v5;

  return (CHProductionRule *)objc_msgSend_initWithLeftNode_rightNode1_rightNode2_probability_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, 1.0);
}

- (CHProductionRule)initWithLeftNode:(id)a3 rightNode1:(id)a4 rightNode2:(id)a5 probability:(double)a6
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CHProductionRule *v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19 = objc_msgSend_init(self, v14, v15, v16, v17, v18);
  v20 = (CHProductionRule *)v19;
  if (v19)
  {
    objc_storeStrong((id *)(v19 + 8), a3);
    objc_storeStrong((id *)&v20->_rightNode1, a4);
    objc_storeStrong((id *)&v20->_rightNode2, a5);
    v20->_probability = a6;
  }

  return v20;
}

- (BOOL)isTerminal
{
  return self->_rightNode2 == 0;
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
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  objc_msgSend_rightNode2(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_leftNode(self, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rightNode1(self, v15, v16, v17, v18, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend_rightNode2(self, v20, v21, v22, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_probability(self, v27, v28, v29, v30, v31);
    objc_msgSend_stringWithFormat_(v8, v32, (uint64_t)CFSTR("%@ -> %@ %@ %0.3f"), v33, v34, v35, v14, v25, v26, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_probability(self, v20, v21, v22, v23, v24);
    objc_msgSend_stringWithFormat_(v8, v38, (uint64_t)CFSTR("%@ -> %@ %0.3f"), v39, v40, v41, v14, v25, v42);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v37;
}

- (id)key
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  objc_msgSend_rightNode2(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_leftNode(self, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rightNode1(self, v15, v16, v17, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v20;
  if (v7)
  {
    objc_msgSend_rightNode2(self, v21, v22, v23, v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v8, v28, (uint64_t)CFSTR("%@ -> %@ %@"), v29, v30, v31, v14, v26, v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_stringWithFormat_(v8, v21, (uint64_t)CFSTR("%@ -> %@"), v23, v24, v25, v14, v20);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v32;
}

- (NSString)leftNode
{
  return self->_leftNode;
}

- (void)setLeftNode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)rightNode1
{
  return self->_rightNode1;
}

- (void)setRightNode1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)rightNode2
{
  return self->_rightNode2;
}

- (void)setRightNode2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightNode2, 0);
  objc_storeStrong((id *)&self->_rightNode1, 0);
  objc_storeStrong((id *)&self->_leftNode, 0);
}

@end
