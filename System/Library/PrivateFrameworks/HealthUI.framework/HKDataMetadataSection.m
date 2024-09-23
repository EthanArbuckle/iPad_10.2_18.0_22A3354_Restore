@implementation HKDataMetadataSection

- (id)sectionFooterViewInTableView:(id)a3
{
  return 0;
}

- (id)sectionTitle
{
  return 0;
}

- (id)sectionFooter
{
  return 0;
}

- (unint64_t)numberOfRowsInSection
{
  return 0;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
}

@end
