@implementation ProfileCharacteristicDiffableDataSource

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**footerTitleProvider)(id, id, int64_t, void *);
  void *v11;

  v6 = a3;
  -[UITableViewDiffableDataSource snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  footerTitleProvider = (void (**)(id, id, int64_t, void *))self->_footerTitleProvider;
  if (footerTitleProvider)
  {
    footerTitleProvider[2](footerTitleProvider, v6, a4, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)footerTitleProvider
{
  return self->_footerTitleProvider;
}

- (void)setFooterTitleProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_footerTitleProvider, 0);
}

@end
