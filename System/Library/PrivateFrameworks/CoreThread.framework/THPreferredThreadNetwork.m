@implementation THPreferredThreadNetwork

- (THPreferredThreadNetwork)initWithThreadNetwork:(id)a3 networkSignature:(id)a4 credentialsDataSetRecord:(id)a5 creationDate:(id)a6 lastModificationDate:(id)a7 userInfo:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  THPreferredThreadNetwork *v19;
  THPreferredThreadNetwork *v20;
  uint64_t v21;
  NSString *userInfo;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)THPreferredThreadNetwork;
  v19 = -[THPreferredThreadNetwork init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_network, a3);
    objc_storeStrong((id *)&v20->_networkSignature, a4);
    objc_storeStrong((id *)&v20->_credentialsDataSetRecord, a5);
    objc_storeStrong((id *)&v20->_creationDate, a6);
    objc_storeStrong((id *)&v20->_lastModificationDate, a7);
    v21 = objc_msgSend(v18, "copy", v24, v25);
    userInfo = v20->_userInfo;
    v20->_userInfo = (NSString *)v21;

  }
  return v20;
}

- (void)updateUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (THPreferredThreadNetwork)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  THPreferredThreadNetwork *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("net"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sig"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cr"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ui"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v6 && v5 && v7)
  {
    self = -[THPreferredThreadNetwork initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:](self, "initWithThreadNetwork:networkSignature:credentialsDataSetRecord:creationDate:lastModificationDate:userInfo:", v6, v7, v5, v8, v9, v10);
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[THPreferredThreadNetwork credentialsDataSetRecord](self, "credentialsDataSetRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ds"));

  -[THPreferredThreadNetwork network](self, "network");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("net"));

  -[THPreferredThreadNetwork networkSignature](self, "networkSignature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("net"));

  -[THPreferredThreadNetwork creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("cr"));

  -[THPreferredThreadNetwork lastModificationDate](self, "lastModificationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("lm"));

  -[THPreferredThreadNetwork userInfo](self, "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("ui"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THThreadNetwork)network
{
  return self->_network;
}

- (THNetworkSignature)networkSignature
{
  return self->_networkSignature;
}

- (THThreadNetworkCredentialsActiveDataSetRecord)credentialsDataSetRecord
{
  return self->_credentialsDataSetRecord;
}

- (NSString)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_credentialsDataSetRecord, 0);
  objc_storeStrong((id *)&self->_networkSignature, 0);
  objc_storeStrong((id *)&self->_network, 0);
}

@end
