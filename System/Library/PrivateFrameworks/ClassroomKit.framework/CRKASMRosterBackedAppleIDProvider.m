@implementation CRKASMRosterBackedAppleIDProvider

- (CRKASMRosterBackedAppleIDProvider)initWithRosterProvider:(id)a3
{
  id v5;
  CRKASMRosterBackedAppleIDProvider *v6;
  CRKASMRosterBackedAppleIDProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMRosterBackedAppleIDProvider;
  v6 = -[CRKASMRosterBackedAppleIDProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rosterProvider, a3);

  return v7;
}

- (NSString)appleID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CRKASMRosterBackedAppleIDProvider rosterProvider](self, "rosterProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "roster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (CRKASMRosterProviding)rosterProvider
{
  return self->_rosterProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rosterProvider, 0);
}

@end
