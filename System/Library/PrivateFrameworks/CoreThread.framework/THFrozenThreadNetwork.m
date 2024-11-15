@implementation THFrozenThreadNetwork

- (THFrozenThreadNetwork)initWithCredentialsDataSet:(id)a3 creationDate:(id)a4 lastModificationDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  THFrozenThreadNetwork *v12;
  THFrozenThreadNetwork *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)THFrozenThreadNetwork;
  v12 = -[THFrozenThreadNetwork init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_credentialsDataSet, a3);
    objc_storeStrong((id *)&v13->_creationDate, a4);
    objc_storeStrong((id *)&v13->_lastModificationDate, a5);
  }

  return v13;
}

- (THThreadNetworkCredentialsDataSet)credentialsDataSet
{
  return self->_credentialsDataSet;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_credentialsDataSet, 0);
}

@end
