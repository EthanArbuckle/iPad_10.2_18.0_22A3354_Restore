@implementation THThreadNetworkCredentialsDataSet

- (THThreadNetworkCredentialsDataSet)init
{
  return -[THThreadNetworkCredentialsDataSet initWithDataSetArray:userInfo:](self, "initWithDataSetArray:userInfo:", 0, 0);
}

- (THThreadNetworkCredentialsDataSet)initWithDataSetArray:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  THThreadNetworkCredentialsDataSet *v9;
  THThreadNetworkCredentialsDataSet *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)THThreadNetworkCredentialsDataSet;
  v9 = -[THThreadNetworkCredentialsDataSet init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSetArray, a3);
    objc_storeStrong((id *)&v10->_userInfo, a4);
  }

  return v10;
}

- (THThreadNetworkCredentialsDataSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  THThreadNetworkCredentialsDataSet *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[THThreadNetworkCredentialsDataSet initWithDataSetArray:userInfo:](self, "initWithDataSetArray:userInfo:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[THThreadNetworkCredentialsDataSet dataSetArray](self, "dataSetArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ds"));

  -[THThreadNetworkCredentialsDataSet userInfo](self, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("info"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)dataSetArray
{
  return self->_dataSetArray;
}

- (void)setDataSetArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_dataSetArray, 0);
}

@end
