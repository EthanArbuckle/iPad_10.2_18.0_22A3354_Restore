@implementation FBAFFUValidationCellChoices

+ (void)showValidationChoicesForCellAtIndexPath:(id)a3 followup:(id)a4 fromViewController:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD v45[3];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "noChoiceText"));
  v45[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "negativeChoice"));
  v45[1] = v14;
  v34 = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "positiveChoice"));
  v45[2] = v15;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 3));

  v33 = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tableView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
  v18 = 2;
  do
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndex:", v18));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000379B0;
    v36[3] = &unk_1000E7548;
    v20 = v16;
    v37 = v20;
    v21 = v9;
    v38 = v21;
    v22 = v12;
    v39 = v22;
    v40 = v18;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v19, 0, v36));

    objc_msgSend(v17, "addAction:", v23);
    --v18;
  }
  while (v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000EA660, 0));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100037978;
  v41[3] = &unk_1000E7520;
  v42 = v20;
  v43 = v21;
  v44 = v22;
  v26 = v22;
  v27 = v21;
  v28 = v20;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 1, v41));

  objc_msgSend(v17, "addAction:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "popoverPresentationController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "tableView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "cellForRowAtIndexPath:", v27));

  objc_msgSend(v30, "setSourceView:", v32);
  objc_msgSend(v32, "bounds");
  objc_msgSend(v30, "setSourceRect:");
  objc_msgSend(v30, "setPermittedArrowDirections:", 15);
  objc_msgSend(v33, "presentViewController:animated:completion:", v17, 1, &stru_1000E7568);

}

@end
