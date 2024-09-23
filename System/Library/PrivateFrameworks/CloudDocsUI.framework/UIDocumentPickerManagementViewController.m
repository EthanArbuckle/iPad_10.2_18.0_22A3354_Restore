@implementation UIDocumentPickerManagementViewController

void __63___UIDocumentPickerManagementViewController__updateContentSize__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "size");
  objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEstimatedRowHeight:", v5);

  objc_msgSend(v11, "size");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "allPickers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 * (double)(unint64_t)objc_msgSend(v9, "count");

  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", 500.0, v10);
}

uint64_t __77___UIDocumentPickerManagementViewController_tableView_canMoveRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDF8110]);

  return v3;
}

uint64_t __116___UIDocumentPickerManagementViewController_tableView_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDF8110]);

  return v3;
}

@end
