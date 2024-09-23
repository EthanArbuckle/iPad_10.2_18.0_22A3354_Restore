@implementation _SFReportScribbleIssueCollectionViewController

- (_SFReportScribbleIssueCollectionViewController)initWithBrowserContentController:(id)a3
{
  id v4;
  _SFReportScribbleIssueCollectionViewController *v5;
  _SFReportScribbleIssueCollectionViewController *v6;
  _SFReportScribbleIssueCollectionViewController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFReportScribbleIssueCollectionViewController;
  v5 = -[_SFReportFeedbackCollectionViewController initWithBrowserContentController:](&v9, sel_initWithBrowserContentController_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserContentController, v4);
    v7 = v6;
  }

  return v6;
}

- (id)_issueStringForRowAtIndexPath:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "row") && objc_msgSend(v3, "row") != 1)
    objc_msgSend(v3, "row");
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_numberOfIssueCategories
{
  return 4;
}

- (void)_reportFeedbackForSelectedRowIndex:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "reportScribbleFeedbackForSelectedRowIndex:", a3);

}

- (id)_headerText
{
  return (id)_WBSLocalizedString();
}

- (id)_footerText
{
  return (id)_WBSLocalizedString();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browserContentController);
}

@end
