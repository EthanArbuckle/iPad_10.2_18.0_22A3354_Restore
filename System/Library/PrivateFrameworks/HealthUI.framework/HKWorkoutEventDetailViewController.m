@implementation HKWorkoutEventDetailViewController

- (HKWorkoutEventDetailViewController)initWithEvent:(id)a3
{
  id v5;
  HKWorkoutEventDetailViewController *v6;
  HKWorkoutEventDetailViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *sections;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKWorkoutEventDetailViewController;
  v6 = -[HKTableViewController init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_event, a3);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKWorkoutEvent type](v7->_event, "type");
    _HKWorkoutEventTypeName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKWorkoutEventDetailViewController setTitle:](v7, "setTitle:", v10);

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sections = v7->_sections;
    v7->_sections = v11;

    -[HKWorkoutEventDetailViewController _loadSections](v7, "_loadSections");
  }

  return v7;
}

- (void)_addSectionIfNotNil:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_sections, "addObject:");
}

- (void)_loadSections
{
  HKDataMetadataDetailSection *v3;

  -[NSMutableArray removeAllObjects](self->_sections, "removeAllObjects");
  v3 = -[HKDataMetadataDetailSection initWithWorkoutEvent:]([HKDataMetadataDetailSection alloc], "initWithWorkoutEvent:", self->_event);
  -[HKWorkoutEventDetailViewController _addSectionIfNotNil:](self, "_addSectionIfNotNil:", v3);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSMutableArray count](self->_sections, "count", a3);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRowsInSection");

  return v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 50.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "cellForIndex:tableView:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (HKWorkoutEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
