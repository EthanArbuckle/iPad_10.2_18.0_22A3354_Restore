@implementation HFControlPanelItemSingleControlRule

- (HFControlPanelItemSingleControlRule)initWithFilter:(id)a3 displayResultsGenerator:(id)a4
{
  id v6;
  id v7;
  HFControlPanelItemSingleControlRule *v8;
  uint64_t v9;
  id filter;
  uint64_t v11;
  id displayResultsGenerator;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFControlPanelItemSingleControlRule;
  v8 = -[HFControlPanelItemSingleControlRule init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    filter = v8->_filter;
    v8->_filter = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    displayResultsGenerator = v8->_displayResultsGenerator;
    v8->_displayResultsGenerator = (id)v11;

  }
  return v8;
}

- (id)controlPanelItemForControlItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HFControlPanelItem *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  HFControlPanelItem *v11;

  v4 = a3;
  -[HFControlPanelItemSingleControlRule filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_firstObjectPassingTest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [HFControlPanelItem alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFControlPanelItemSingleControlRule displayResultsGenerator](self, "displayResultsGenerator");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HFControlPanelItem initWithControlItems:displayResults:](v7, "initWithControlItems:displayResults:", v8, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)filter
{
  return self->_filter;
}

- (id)displayResultsGenerator
{
  return self->_displayResultsGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_displayResultsGenerator, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
