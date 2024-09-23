@implementation MSUserAccountInfo

- (MSUserAccountInfo)initWithHomeUserID:(id)a3 sharedUserID:(id)a4
{
  id v7;
  id v8;
  MSUserAccountInfo *v9;
  MSUserAccountInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSUserAccountInfo;
  v9 = -[MSUserAccountInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeUserID, a3);
    objc_storeStrong((id *)&v10->_sharedUserID, a4);
  }

  return v10;
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_homeUserID, CFSTR("ResolvedSpeakerHomeUserID"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_sharedUserID, CFSTR("ResolvedSpeakerSharedUserID"));
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *homeUserID;
  id v5;

  homeUserID = self->_homeUserID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", homeUserID, CFSTR("MSSHomeUserIDEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedUserID, CFSTR("MSSSharedUserIDEncodedKey"));

}

- (MSUserAccountInfo)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *homeUserID;
  NSString *v7;
  NSString *sharedUserID;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSHomeUserIDEncodedKey"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  homeUserID = self->_homeUserID;
  self->_homeUserID = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSSharedUserIDEncodedKey"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  sharedUserID = self->_sharedUserID;
  self->_sharedUserID = v7;

  return -[MSUserAccountInfo initWithHomeUserID:sharedUserID:](self, "initWithHomeUserID:sharedUserID:", self->_homeUserID, self->_sharedUserID);
}

- (NSString)homeUserID
{
  return self->_homeUserID;
}

- (NSString)sharedUserID
{
  return self->_sharedUserID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserID, 0);
  objc_storeStrong((id *)&self->_homeUserID, 0);
}

@end
