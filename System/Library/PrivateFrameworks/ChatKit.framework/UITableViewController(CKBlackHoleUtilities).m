@implementation UITableViewController(CKBlackHoleUtilities)

- (void)_confirmDeleteConversationFromView:()CKBlackHoleUtilities alertTitle:forMultipleConversations:withReportSpamHander:withNotReportSpamHandler:withCancelHandler:
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  char v41;
  id location[2];

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v32 = a8;
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v15, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  location[0] = 0;
  objc_initWeak(location, a1);
  CKFrameworkBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CLEAR_ALL"), &stru_1E276D870, CFSTR("ChatKit"), v15);
  else
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E276D870, CFSTR("ChatKit"), v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __182__UITableViewController_CKBlackHoleUtilities___confirmDeleteConversationFromView_alertTitle_forMultipleConversations_withReportSpamHander_withNotReportSpamHandler_withCancelHandler___block_invoke;
  v35[3] = &unk_1E274B358;
  v41 = a5;
  v22 = v16;
  v38 = v22;
  v23 = v17;
  v39 = v23;
  v24 = v18;
  v36 = v24;
  v25 = v14;
  v37 = v25;
  objc_copyWeak(&v40, location);
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v20, 2, v35);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAction:", v26);

  CKFrameworkBundle();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v21;
  v33[1] = 3221225472;
  v33[2] = __182__UITableViewController_CKBlackHoleUtilities___confirmDeleteConversationFromView_alertTitle_forMultipleConversations_withReportSpamHander_withNotReportSpamHandler_withCancelHandler___block_invoke_4;
  v33[3] = &unk_1E274B330;
  v29 = v32;
  v34 = v29;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v28, 1, v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAction:", v30);

  objc_msgSend(a1, "presentViewController:animated:completion:", v24, 1, 0);
  objc_destroyWeak(&v40);

  objc_destroyWeak(location);
}

@end
