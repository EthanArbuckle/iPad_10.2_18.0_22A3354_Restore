@implementation PosterBoardApplication

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  id (*v17)(uint64_t, uint64_t);
  void ***v18;
  BOOL v19;
  void **v21;
  void **v22;
  void **v23;
  _QWORD v24[4];
  Block_layout *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PosterBoardTestingUtilities knownPPTTests](PosterBoardTestingUtilities, "knownPPTTests"));
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (v9)
  {
    -[PosterBoardApplication setCurrentTestName:](self, "setCurrentTestName:", v6);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100002F5C;
    v30[3] = &unk_10000C348;
    v10 = (id)objc_claimAutoreleasedReturnValue(+[PosterBoardTestingUtilities posterRackViewController](PosterBoardTestingUtilities, "posterRackViewController"));
    v31 = v10;
    v11 = objc_retainBlock(v30);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100002F68;
    v28[3] = &unk_10000C370;
    v12 = v10;
    v29 = v12;
    v13 = objc_retainBlock(v28);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100003028;
    v24[3] = &unk_10000C400;
    v25 = &stru_10000C3B0;
    v14 = v11;
    v26 = v14;
    v15 = v13;
    v27 = v15;
    v16 = objc_retainBlock(v24);
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("scrollPosterRack")))
    {
      v23 = _NSConcreteStackBlock;
      v17 = sub_100003040;
      v18 = &v23;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("scrollPosterGallery")))
    {
      v22 = _NSConcreteStackBlock;
      v17 = sub_100003050;
      v18 = &v22;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("switchPoster")))
      {
        v19 = 0;
        goto LABEL_10;
      }
      v21 = _NSConcreteStackBlock;
      v17 = sub_100003060;
      v18 = &v21;
    }
    v18[1] = (void **)3221225472;
    v18[2] = (void **)v17;
    v18[3] = (void **)&unk_10000C428;
    v18[4] = (void **)&self->super.super.super.isa;
    v18[5] = (void **)v7;
    ((void (*)(_QWORD *, void ***))v16[2])(v16, v18);

    v19 = 1;
LABEL_10:

    goto LABEL_11;
  }
  v19 = 0;
LABEL_11:

  return v19;
}

- (void)_runScrollPosterRackWithTestOptions:(id)a3 completion:(id)a4
{
  id v5;
  _UNKNOWN **v6;
  void *v7;
  _BYTE *v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BYTE *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  char **v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  char **v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  id v30;
  void *v31;
  NSMutableArray *v32;
  void *v33;
  id v34;
  PosterBoardApplication *v35;
  void *v36;
  _QWORD v37[4];
  NSMutableArray *v38;
  _QWORD v39[4];
  id v40;
  PosterBoardApplication *v41;
  NSMutableArray *v42;
  _BYTE *v43;
  id v44;
  _QWORD v45[4];
  NSMutableArray *v46;

  v5 = a3;
  v35 = self;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PosterBoardApplication currentTestName](self, "currentTestName"));
  v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("minNumberOfPostersInSwitcher")));
  v7 = v6;
  if (!v6)
    v6 = &off_10000CE58;
  v8 = objc_msgSend(v6, "unsignedIntegerValue");

  v9 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("maxNumberOfPostersInSwitcher")));
  v10 = v9;
  if (!v9)
    v9 = &off_10000CE70;
  v34 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PosterBoardTestingUtilities posterRackViewController](PosterBoardTestingUtilities, "posterRackViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "posterExtensionDataStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "switcherConfiguration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configurations"));
  v15 = objc_msgSend(v14, "count");

  v16 = objc_opt_new(NSMutableArray);
  v17 = objc_opt_new(NSMutableArray);
  v18 = &selRef_advanceTime_;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToResetSwitcher](PBFPPTOperation, "operationToResetSwitcher"));
  -[NSMutableArray addObject:](v17, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToPushInToPosterSwitcher](PBFPPTOperation, "operationToPushInToPosterSwitcher"));
  -[NSMutableArray addObject:](v17, "addObject:", v20);

  if (v8 >= v15)
    v21 = v8 - v15;
  else
    v21 = 0;
  if (v8 > v15)
  {
    v22 = 0;
    do
    {
      v23 = v18;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10000343C;
      v45[3] = &unk_10000C450;
      v46 = v16;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18 + 156, "operationToAddPosterWithProvider:descriptorIdentifier:completion:", CFSTR("com.apple.PosterTester.SamplePoster"), CFSTR("red"), v45));
      -[NSMutableArray addObject:](v17, "addObject:", v24);

      v18 = v23;
      ++v22;
    }
    while (v22 < v21);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18 + 156, "operationToWaitForTimeInterval:", 5.0));
  -[NSMutableArray addObject:](v17, "addObject:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18 + 156, "operationToScrollToFirstPoster:", 0));
  -[NSMutableArray addObject:](v17, "addObject:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18 + 156, "operationToStartTest:", v36));
  -[NSMutableArray addObject:](v17, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18 + 156, "operationToWaitForTimeInterval:", 5.0));
  -[NSMutableArray addObject:](v17, "addObject:", v28);

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000034A8;
  v39[3] = &unk_10000C4A0;
  v40 = v36;
  v41 = v35;
  v29 = v16;
  v42 = v29;
  v43 = v15;
  v44 = v34;
  v30 = v36;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithName:block:](PBFPPTBlockOperation, "operationWithName:block:", CFSTR("scrollPosterRack"), v39));
  -[NSMutableArray addObject:](v17, "addObject:", v31);

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000036DC;
  v37[3] = &unk_10000C4C8;
  v38 = v29;
  v32 = v29;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18 + 156, "operationToDeletePosters:", v37));
  -[NSMutableArray addObject:](v17, "addObject:", v33);

  objc_msgSend(v18 + 156, "enqueueOperations:", v17);
}

- (void)_runScrollPosterGalleryWithTestOptions:(id)a3 completion:(id)a4
{
  void *v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PosterBoardApplication currentTestName](self, "currentTestName", a3, a4));
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToResetSwitcher](PBFPPTOperation, "operationToResetSwitcher"));
  -[NSMutableArray addObject:](v5, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToPushInToPosterSwitcher](PBFPPTOperation, "operationToPushInToPosterSwitcher"));
  -[NSMutableArray addObject:](v5, "addObject:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToScrollToFirstPoster:](PBFPPTOperation, "operationToScrollToFirstPoster:", 0));
  -[NSMutableArray addObject:](v5, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToWaitForTimeInterval:](PBFPPTOperation, "operationToWaitForTimeInterval:", 5.0));
  -[NSMutableArray addObject:](v5, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToStartTest:](PBFPPTOperation, "operationToStartTest:", v4));
  -[NSMutableArray addObject:](v5, "addObject:", v10);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000038B4;
  v13[3] = &unk_10000C540;
  v14 = v4;
  v11 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithName:block:](PBFPPTBlockOperation, "operationWithName:block:", CFSTR("presentAndScrollPosterGallery"), v13));
  -[NSMutableArray addObject:](v5, "addObject:", v12);

  +[PBFPPTOperation enqueueOperations:](PBFPPTOperation, "enqueueOperations:", v5);
}

- (void)_runSwitchPosterWithTestOptions:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  NSMutableArray *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  Block_layout *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  void *v33;
  _QWORD v34[4];
  NSMutableArray *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  NSMutableArray *v39;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PosterBoardApplication currentTestName](self, "currentTestName"));
  v7 = objc_opt_new(NSMutableArray);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("testPosterProvider")));
  v9 = (void *)v8;
  v10 = CFSTR("com.apple.PosterTester.SamplePoster");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("testPosterProviderDescriptorIdentifier")));
  v13 = CFSTR("red");
  if (v12)
    v13 = v12;
  v14 = v13;

  v15 = objc_opt_new(NSMutableArray);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithName:block:](PBFPPTBlockOperation, "operationWithName:block:", CFSTR("selectLastPoster"), &stru_10000C580));
  -[NSMutableArray addObject:](v15, "addObject:", v16);

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100003FC4;
  v38[3] = &unk_10000C450;
  v17 = v7;
  v39 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToAddPosterWithProvider:descriptorIdentifier:completion:](PBFPPTOperation, "operationToAddPosterWithProvider:descriptorIdentifier:completion:", v11, v14, v38));

  -[NSMutableArray addObject:](v15, "addObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToResetSwitcher](PBFPPTOperation, "operationToResetSwitcher"));
  -[NSMutableArray addObject:](v15, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToWaitForTimeInterval:](PBFPPTOperation, "operationToWaitForTimeInterval:", 5.0));
  -[NSMutableArray addObject:](v15, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToPushInToPosterSwitcher](PBFPPTOperation, "operationToPushInToPosterSwitcher"));
  -[NSMutableArray addObject:](v15, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToWaitForTimeInterval:](PBFPPTOperation, "operationToWaitForTimeInterval:", 1.0));
  -[NSMutableArray addObject:](v15, "addObject:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToStartTest:](PBFPPTOperation, "operationToStartTest:", v6));
  -[NSMutableArray addObject:](v15, "addObject:", v23);

  v24 = PBFPPTEventActionsToSwipeLeftInMiddleOfInterface();
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToSynthesizeEventsForEventActions:](PBFPPTOperation, "operationToSynthesizeEventsForEventActions:", v25));
  -[NSMutableArray addObject:](v15, "addObject:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToWaitForTimeInterval:](PBFPPTOperation, "operationToWaitForTimeInterval:", 1.0));
  -[NSMutableArray addObject:](v15, "addObject:", v27);

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100004030;
  v36[3] = &unk_10000C540;
  v37 = v6;
  v28 = v6;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTBlockOperation operationWithName:block:](PBFPPTBlockOperation, "operationWithName:block:", CFSTR("selectedPoster"), v36));
  -[NSMutableArray addObject:](v15, "addObject:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToWaitForTimeInterval:](PBFPPTOperation, "operationToWaitForTimeInterval:", 2.0));
  -[NSMutableArray addObject:](v15, "addObject:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToFinishTest:](PBFPPTOperation, "operationToFinishTest:", v28));
  -[NSMutableArray addObject:](v15, "addObject:", v31);

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100004164;
  v34[3] = &unk_10000C4C8;
  v35 = v17;
  v32 = v17;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[PBFPPTOperation operationToDeletePosters:](PBFPPTOperation, "operationToDeletePosters:", v34));
  -[NSMutableArray addObject:](v15, "addObject:", v33);

  +[PBFPPTOperation enqueueOperations:](PBFPPTOperation, "enqueueOperations:", v15);
}

- (NSString)runningPPTTestName
{
  return self->_runningPPTTestName;
}

- (NSString)currentTestName
{
  return self->_currentTestName;
}

- (void)setCurrentTestName:(id)a3
{
  objc_storeStrong((id *)&self->_currentTestName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTestName, 0);
  objc_storeStrong((id *)&self->_runningPPTTestName, 0);
}

@end
