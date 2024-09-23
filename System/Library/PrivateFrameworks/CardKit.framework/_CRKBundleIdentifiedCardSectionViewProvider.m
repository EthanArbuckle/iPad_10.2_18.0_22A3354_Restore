@implementation _CRKBundleIdentifiedCardSectionViewProvider

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v3;
  void *v4;
  char v5;
  char v6;

  NSStringFromSelector(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_providerIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
    v6 = 1;
  else
    v6 = objc_opt_respondsToSelector();
  return v6 & 1;
}

- (BOOL)vetoDisplayOfCardSection:(id)a3
{
  return -[CRKCardSectionViewProviding vetoDisplayOfCardSection:](self->_realCardSectionViewProvider, "vetoDisplayOfCardSection:", a3);
}

- (unint64_t)displayPriorityForCardSection:(id)a3
{
  return -[CRKCardSectionViewProviding displayPriorityForCardSection:](self->_realCardSectionViewProvider, "displayPriorityForCardSection:", a3);
}

- (CRCard)card
{
  return (CRCard *)-[CRKCardSectionViewProviding card](self->_realCardSectionViewProvider, "card");
}

- (NSArray)viewConfigurations
{
  return (NSArray *)-[CRKCardSectionViewProviding viewConfigurations](self->_realCardSectionViewProvider, "viewConfigurations");
}

- (NSString)providerIdentifier
{
  return self->providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CRKCardSectionViewProviding)realCardSectionViewProvider
{
  return self->_realCardSectionViewProvider;
}

- (void)setRealCardSectionViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_realCardSectionViewProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realCardSectionViewProvider, 0);
  objc_storeStrong((id *)&self->viewConfigurations, 0);
  objc_storeStrong((id *)&self->card, 0);
  objc_storeStrong((id *)&self->providerIdentifier, 0);
}

@end
