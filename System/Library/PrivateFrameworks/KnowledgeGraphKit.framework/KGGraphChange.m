@implementation KGGraphChange

- (KGGraphChange)initWithTransactionToken:(id)a3 nodesInserted:(id)a4 edgesInserted:(id)a5 nodesUpdated:(id)a6 edgesUpdated:(id)a7 nodesDeleted:(id)a8 edgesDeleted:(id)a9
{
  id v16;
  id v17;
  KGGraphChange *v18;
  KGGraphChange *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)KGGraphChange;
  v18 = -[KGGraphChange init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_transactionToken, a3);
    objc_storeStrong((id *)&v19->_nodesInserted, a4);
    objc_storeStrong((id *)&v19->_edgesInserted, a5);
    objc_storeStrong((id *)&v19->_nodesUpdated, a6);
    objc_storeStrong((id *)&v19->_edgesUpdated, a7);
    objc_storeStrong((id *)&v19->_nodesDeleted, a8);
    objc_storeStrong((id *)&v19->_edgesDeleted, a9);
  }

  return v19;
}

- (KGGraphChange)initWithTransactionToken:(id)a3 nodesInserted:(id)a4 nodesUpdated:(id)a5 nodesDeleted:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  KGGraphChange *v15;
  KGGraphChange *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KGGraphChange;
  v15 = -[KGGraphChange init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_transactionToken, a3);
    objc_storeStrong((id *)&v16->_nodesInserted, a4);
    objc_storeStrong((id *)&v16->_nodesUpdated, a5);
    objc_storeStrong((id *)&v16->_nodesDeleted, a6);
  }

  return v16;
}

- (KGGraphChange)initWithTransactionToken:(id)a3 edgesInserted:(id)a4 edgesUpdated:(id)a5 edgesDeleted:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  KGGraphChange *v15;
  KGGraphChange *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KGGraphChange;
  v15 = -[KGGraphChange init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_transactionToken, a3);
    objc_storeStrong((id *)&v16->_edgesInserted, a4);
    objc_storeStrong((id *)&v16->_edgesUpdated, a5);
    objc_storeStrong((id *)&v16->_edgesDeleted, a6);
  }

  return v16;
}

- (KGTransactionToken)transactionToken
{
  return self->_transactionToken;
}

- (KGElementIdentifierSet)nodesInserted
{
  return self->_nodesInserted;
}

- (KGElementIdentifierSet)edgesInserted
{
  return self->_edgesInserted;
}

- (KGElementIdentifierSet)nodesUpdated
{
  return self->_nodesUpdated;
}

- (KGElementIdentifierSet)edgesUpdated
{
  return self->_edgesUpdated;
}

- (KGElementIdentifierSet)nodesDeleted
{
  return self->_nodesDeleted;
}

- (KGElementIdentifierSet)edgesDeleted
{
  return self->_edgesDeleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgesDeleted, 0);
  objc_storeStrong((id *)&self->_nodesDeleted, 0);
  objc_storeStrong((id *)&self->_edgesUpdated, 0);
  objc_storeStrong((id *)&self->_nodesUpdated, 0);
  objc_storeStrong((id *)&self->_edgesInserted, 0);
  objc_storeStrong((id *)&self->_nodesInserted, 0);
  objc_storeStrong((id *)&self->_transactionToken, 0);
}

@end
