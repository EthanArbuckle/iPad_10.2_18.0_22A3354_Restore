@implementation WDElectrocardiogramPDFViewController

- (WDElectrocardiogramPDFViewController)initWithPDFData:(id)a3 sampleDate:(id)a4 firstName:(id)a5 lastName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WDElectrocardiogramPDFViewController *v15;
  WDElectrocardiogramPDFViewController *v16;
  uint64_t v17;
  PDFDocument *pdfDocument;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)WDElectrocardiogramPDFViewController;
  v15 = -[WDElectrocardiogramPDFViewController initWithNibName:bundle:](&v27, sel_initWithNibName_bundle_, 0, 0);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pdfData, a3);
    objc_storeStrong((id *)&v16->_sampleDate, a4);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDE30E8]), "initWithData:", v11);
    pdfDocument = v16->_pdfDocument;
    v16->_pdfDocument = (PDFDocument *)v17;

    objc_storeStrong((id *)&v16->_firstName, a5);
    objc_storeStrong((id *)&v16->_lastName, a6);
    WDBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PDF_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Cinnamon"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDElectrocardiogramPDFViewController setTitle:](v16, "setTitle:", v21);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, v16, sel_didTapDone);
    -[WDElectrocardiogramPDFViewController navigationItem](v16, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLeftBarButtonItem:", v22);

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 9, v16, sel_didTapShare_);
    -[WDElectrocardiogramPDFViewController navigationItem](v16, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRightBarButtonItem:", v24);

  }
  return v16;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_alloc_init(MEMORY[0x24BDE3120]);
  -[WDElectrocardiogramPDFViewController setView:](self, "setView:", v3);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramPDFViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[WDElectrocardiogramPDFViewController pdfDocument](self, "pdfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramPDFViewController pdfView](self, "pdfView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDocument:", v6);

  -[WDElectrocardiogramPDFViewController pdfDocument](self, "pdfDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramPDFViewController pdfView](self, "pdfView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityValue:", v9);

  -[WDElectrocardiogramPDFViewController pdfView](self, "pdfView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAutoScales:", 1);

}

- (void)didTapDone
{
  -[WDElectrocardiogramPDFViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)didTapShare:(id)a3
{
  id v4;
  WDElectrocardiogramActivityItemSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WDElectrocardiogramActivityItemSource *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [WDElectrocardiogramActivityItemSource alloc];
  -[WDElectrocardiogramPDFViewController pdfData](self, "pdfData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramPDFViewController sampleDate](self, "sampleDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramPDFViewController firstName](self, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramPDFViewController lastName](self, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WDElectrocardiogramActivityItemSource initWithPDFData:sampleDate:firstName:lastName:provenance:](v5, "initWithPDFData:sampleDate:firstName:lastName:provenance:", v6, v7, v8, v9, 1);

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BDF67E0]);
    v17[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithActivityItems:applicationActivities:", v12, 0);

    objc_msgSend(v13, "popoverPresentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSourceItem:", v4);

    v16 = *MEMORY[0x24BDF7490];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setExcludedActivityTypes:", v15);

    -[WDElectrocardiogramPDFViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
  }

}

- (unint64_t)overrideMask
{
  return 26;
}

- (NSData)pdfData
{
  return self->_pdfData;
}

- (NSDate)sampleDate
{
  return self->_sampleDate;
}

- (PDFDocument)pdfDocument
{
  return self->_pdfDocument;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_pdfDocument, 0);
  objc_storeStrong((id *)&self->_sampleDate, 0);
  objc_storeStrong((id *)&self->_pdfData, 0);
}

@end
