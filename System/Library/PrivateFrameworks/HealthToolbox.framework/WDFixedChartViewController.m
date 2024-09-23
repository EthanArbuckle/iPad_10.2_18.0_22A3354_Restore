@implementation WDFixedChartViewController

- (WDFixedChartViewController)initWithInteractiveChartViewController:(id)a3 sessionSample:(id)a4 profile:(id)a5 title:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WDFixedChartViewController *v15;
  WDFixedChartViewController *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HKDataMetadataDetailSection *metadataSection;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)WDFixedChartViewController;
  v15 = -[WDFixedChartViewController initWithStyle:](&v23, sel_initWithStyle_, 1);
  v16 = v15;
  if (v15)
  {
    -[WDFixedChartViewController setTitle:](v15, "setTitle:", v14);
    objc_storeStrong((id *)&v16->_chartController, a3);
    v17 = objc_alloc(MEMORY[0x24BE4A588]);
    objc_msgSend(v13, "displayTypeController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unitController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "initWithSample:displayTypeController:unitController:", v12, v18, v19);
    metadataSection = v16->_metadataSection;
    v16->_metadataSection = (HKDataMetadataDetailSection *)v20;

  }
  return v16;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDFixedChartViewController;
  -[HKTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[WDFixedChartViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x24BDF7DE0]);
  objc_msgSend(v3, "setEstimatedRowHeight:", 300.0);
  v4 = objc_alloc(MEMORY[0x24BDF6F90]);
  -[WDFixedChartViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:", 0.0, 0.0);
  objc_msgSend(v3, "setTableHeaderView:", v6);

}

- (id)cellForChart
{
  void *v3;
  void *v4;
  void *v5;

  -[WDFixedChartViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", CFSTR("FixedChartReuseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A928]), "initWithReuseIdentifier:", CFSTR("FixedChartReuseIdentifier"));
  -[HKInteractiveChartViewController view](self->_chartController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHostedView:", v5);

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1)
    return -[HKDataMetadataDetailSection numberOfRowsInSection](self->_metadataSection, "numberOfRowsInSection", a3);
  else
    return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "section");
  if (v9 == 1)
  {
    -[HKDataMetadataDetailSection cellForIndex:tableView:](self->_metadataSection, "cellForIndex:tableView:", objc_msgSend(v8, "row"), v7);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v9)
  {
    -[WDFixedChartViewController cellForChart](self, "cellForChart");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = (void *)v10;
  }

  return v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.5;
}

- (HKValueRange)fixedRange
{
  return self->_fixedRange;
}

- (HKInteractiveChartViewController)chartController
{
  return self->_chartController;
}

- (HKDataMetadataDetailSection)metadataSection
{
  return self->_metadataSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataSection, 0);
  objc_storeStrong((id *)&self->_chartController, 0);
  objc_storeStrong((id *)&self->_fixedRange, 0);
}

@end
