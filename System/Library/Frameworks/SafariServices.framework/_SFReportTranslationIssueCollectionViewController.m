@implementation _SFReportTranslationIssueCollectionViewController

- (_SFReportTranslationIssueCollectionViewController)initWithBrowserContentController:(id)a3
{
  id v4;
  _SFReportTranslationIssueCollectionViewController *v5;
  _SFReportTranslationIssueCollectionViewController *v6;
  _SFReportTranslationIssueCollectionViewController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFReportTranslationIssueCollectionViewController;
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
  id result;

  switch(objc_msgSend(a3, "row"))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      _WBSLocalizedString();
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (int64_t)_numberOfIssueCategories
{
  return 7;
}

- (void)_reportFeedbackForSelectedRowIndex:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  objc_msgSend(WeakRetained, "activeDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "translationContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "requestSendFeedbackForTranslationIssue:", a3);
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
