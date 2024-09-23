@implementation CSListItem

- (CSListItem)initWithIdentifier:(id)a3 groupingIdentifier:(id)a4 sectionIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  CSListItem *v12;
  CSListItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CSListItem;
  v12 = -[CSListItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_groupingIdentifier, a4);
    objc_storeStrong((id *)&v13->_sectionIdentifier, a5);
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSListItem;
  -[CSListItem description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSListItem descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSListItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSListItem descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  -[CSListItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_groupingIdentifier, CFSTR("groupingIdentifier"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_sectionIdentifier, CFSTR("sectionIdentifier"));
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", self->_contentHost, CFSTR("contentHost"));
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", self->_onTapAction, CFSTR("onTapAction"));
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", self->_swipeActions, CFSTR("swipeActions"));
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NCNotificationListSupplementaryViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (UIAction)onTapAction
{
  return self->_onTapAction;
}

- (void)setOnTapAction:(id)a3
{
  objc_storeStrong((id *)&self->_onTapAction, a3);
}

- (NSArray)swipeActions
{
  return self->_swipeActions;
}

- (void)setSwipeActions:(id)a3
{
  objc_storeStrong((id *)&self->_swipeActions, a3);
}

- (CSListItemHosting)contentHost
{
  return self->_contentHost;
}

- (void)setContentHost:(id)a3
{
  objc_storeStrong((id *)&self->_contentHost, a3);
}

- (NSDate)contentCreatedDate
{
  return self->_contentCreatedDate;
}

- (void)setContentCreatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_contentCreatedDate, a3);
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setRelevanceScore:(double)a3
{
  self->_relevanceScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentCreatedDate, 0);
  objc_storeStrong((id *)&self->_contentHost, 0);
  objc_storeStrong((id *)&self->_swipeActions, 0);
  objc_storeStrong((id *)&self->_onTapAction, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
