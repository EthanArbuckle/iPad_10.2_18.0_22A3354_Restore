@implementation ManageSubscriptionsRequest

- (ManageSubscriptionsRequest)init
{
  return -[ManageSubscriptionsRequest initWithFamilyID:sceneID:](self, "initWithFamilyID:sceneID:", 0, 0);
}

- (ManageSubscriptionsRequest)initWithFamilyID:(id)a3
{
  return -[ManageSubscriptionsRequest initWithFamilyID:sceneID:](self, "initWithFamilyID:sceneID:", a3, 0);
}

- (ManageSubscriptionsRequest)initWithFamilyID:(id)a3 sceneID:(id)a4
{
  id v7;
  id v8;
  ManageSubscriptionsRequest *v9;
  ManageSubscriptionsRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ManageSubscriptionsRequest;
  v9 = -[ManageSubscriptionsRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_familyID, a3);
    objc_storeStrong((id *)&v10->_sceneID, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ManageSubscriptionsRequest familyID](self, "familyID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("familyID"));

  -[ManageSubscriptionsRequest sceneID](self, "sceneID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sceneID"));

}

- (ManageSubscriptionsRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ManageSubscriptionsRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("familyID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ManageSubscriptionsRequest initWithFamilyID:sceneID:](self, "initWithFamilyID:sceneID:", v5, v6);
  return v7;
}

- (NSString)familyID
{
  return self->_familyID;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
  objc_storeStrong((id *)&self->_sceneID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_familyID, 0);
}

@end
