@implementation NTKCFaceDetailDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  -[UITableViewDiffableDataSource snapshot](self, "snapshot", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ntk_identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "isEqual:", CFSTR("com.apple.nanotimekit.off"));

  if ((v6 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "ntk_localizedSectionName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v9 = v10;
    else
      v9 = 0;

  }
  return v9;
}

@end
