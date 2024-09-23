@implementation AXSBImageExplorerData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSBImageExplorerData)initWithCoder:(id)a3
{
  id v4;
  AXSBImageExplorerData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXSBImageExplorerData;
  v5 = -[AXSBImageExplorerData init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostAppBundleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSBImageExplorerData setHostAppBundleID:](v5, "setHostAppBundleID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostAppName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSBImageExplorerData setHostAppName:](v5, "setHostAppName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("axLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSBImageExplorerData setAxLabel:](v5, "setAxLabel:", v8);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("axCustomContent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSBImageExplorerData setCustomContent:](v5, "setCustomContent:", v12);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AXSBImageExplorerData hostAppBundleID](self, "hostAppBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("hostAppBundleID"));

  -[AXSBImageExplorerData hostAppName](self, "hostAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("hostAppName"));

  -[AXSBImageExplorerData axLabel](self, "axLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("axLabel"));

  -[AXSBImageExplorerData customContent](self, "customContent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("axCustomContent"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)AXSBImageExplorerData;
  -[AXSBImageExplorerData description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSBImageExplorerData hostAppBundleID](self, "hostAppBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSBImageExplorerData hostAppName](self, "hostAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSBImageExplorerData axLabel](self, "axLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSBImageExplorerData customContent](self, "customContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ bundleID : %@ appName: %@ axLabel:%@ axCustomContent : %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)hostAppBundleID
{
  return self->_hostAppBundleID;
}

- (void)setHostAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_hostAppBundleID, a3);
}

- (NSString)hostAppName
{
  return self->_hostAppName;
}

- (void)setHostAppName:(id)a3
{
  objc_storeStrong((id *)&self->_hostAppName, a3);
}

- (NSString)axLabel
{
  return self->_axLabel;
}

- (void)setAxLabel:(id)a3
{
  objc_storeStrong((id *)&self->_axLabel, a3);
}

- (NSArray)customContent
{
  return self->_customContent;
}

- (void)setCustomContent:(id)a3
{
  objc_storeStrong((id *)&self->_customContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customContent, 0);
  objc_storeStrong((id *)&self->_axLabel, 0);
  objc_storeStrong((id *)&self->_hostAppName, 0);
  objc_storeStrong((id *)&self->_hostAppBundleID, 0);
}

@end
