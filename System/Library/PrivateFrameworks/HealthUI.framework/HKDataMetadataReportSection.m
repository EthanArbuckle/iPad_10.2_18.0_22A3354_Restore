@implementation HKDataMetadataReportSection

- (HKDataMetadataReportSection)initWithSample:(id)a3 healthStore:(id)a4
{
  id v7;
  id v8;
  HKDataMetadataReportSection *v9;
  int v10;
  HKDataMetadataReportSection *v11;
  uint64_t v12;
  NSString *detailedReportName;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKDataMetadataReportSection;
  v9 = -[HKDataMetadataReportSection init](&v15, sel_init);
  if (!v9)
    goto LABEL_5;
  v10 = objc_msgSend(v7, "hasAssociatedReport");
  v11 = 0;
  if (v8 && v10)
  {
    objc_msgSend(v7, "detailedReportName");
    v12 = objc_claimAutoreleasedReturnValue();
    detailedReportName = v9->_detailedReportName;
    v9->_detailedReportName = (NSString *)v12;

    objc_storeStrong((id *)&v9->_sample, a3);
    objc_storeStrong((id *)&v9->_healthStore, a4);
LABEL_5:
    v11 = v9;
  }

  return v11;
}

- (id)sectionTitle
{
  return 0;
}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)documentImageForXMLFiles
{
  if (documentImageForXMLFiles_oncePredicate != -1)
    dispatch_once(&documentImageForXMLFiles_oncePredicate, &__block_literal_global_16);
  return (id)documentImageForXMLFiles__CachedImage;
}

void __55__HKDataMetadataReportSection_documentImageForXMLFiles__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  HKHealthUIFrameworkBundle();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("cda_doc"), v2, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)documentImageForXMLFiles__CachedImage;
  documentImageForXMLFiles__CachedImage = v0;

}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  _HKReportTableViewCell *v5;
  NSString *detailedReportName;
  void *v7;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("report_cell_identifier"));
  v5 = (_HKReportTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = objc_alloc_init(_HKReportTableViewCell);
  detailedReportName = self->_detailedReportName;
  -[HKDataMetadataReportSection documentImageForXMLFiles](self, "documentImageForXMLFiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKReportTableViewCell setReportName:reportImage:](v5, "setReportName:reportImage:", detailedReportName, v7);

  return v5;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  id v7;
  HKSample *sample;
  HKHealthStore *healthStore;
  _QWORD v10[5];
  id v11;
  BOOL v12;
  id location;

  v7 = a4;
  objc_initWeak(&location, v7);
  sample = self->_sample;
  healthStore = self->_healthStore;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__HKDataMetadataReportSection_selectCellForIndex_navigationController_animated___block_invoke;
  v10[3] = &unk_1E9C41010;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  v12 = a5;
  -[HKSample fetchDetailedReportWithHealthStore:reportDataBlock:](sample, "fetchDetailedReportWithHealthStore:reportDataBlock:", healthStore, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __80__HKDataMetadataReportSection_selectCellForIndex_navigationController_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  char v13;

  v5 = a2;
  v6 = v5;
  if (v5 && !a3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__HKDataMetadataReportSection_selectCellForIndex_navigationController_animated___block_invoke_2;
    v9[3] = &unk_1E9C40FE8;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    v13 = *(_BYTE *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v9);
    objc_destroyWeak(&v12);

  }
}

void __80__HKDataMetadataReportSection_selectCellForIndex_navigationController_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  HKCDADocumentDetailViewController *v3;

  v3 = -[HKCDADocumentDetailViewController initWithReportData:]([HKCDADocumentDetailViewController alloc], "initWithReportData:", *(_QWORD *)(a1 + 32));
  -[HKCDADocumentDetailViewController setTitle:](v3, "setTitle:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "pushViewController:animated:", v3, *(unsigned __int8 *)(a1 + 56));

}

- (HKSample)sample
{
  return self->_sample;
}

- (NSString)detailedReportName
{
  return self->_detailedReportName;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_detailedReportName, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
