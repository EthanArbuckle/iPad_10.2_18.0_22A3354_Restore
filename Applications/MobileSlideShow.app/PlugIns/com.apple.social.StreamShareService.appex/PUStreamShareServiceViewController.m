@implementation PUStreamShareServiceViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];

  v16.receiver = self;
  v16.super_class = (Class)PUStreamShareServiceViewController;
  -[PUStreamShareServiceViewController viewDidLoad](&v16, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PUStreamShareServiceViewController navigationController](self, "navigationController"));
  objc_msgSend(v3, "_setBuiltinTransitionStyle:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "albumListForContentMode:", 1));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "albums", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "canContributeToCloudSharedAlbum")
          && objc_msgSend(v11, "canPerformEditOperation:", 4))
        {

          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[PUStreamShareServiceViewController _pushTitleController](self, "_pushTitleController");
LABEL_12:

}

- (id)sheetActions
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PUStreamShareServiceViewController albumListAction](self, "albumListAction"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (id)title
{
  return (id)PULocalizedString(CFSTR("PHOTO_STREAM_NAV_TITLE"), a2);
}

- (void)send
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PUStreamShareServiceViewController;
  -[PUStreamShareServiceViewController send](&v2, "send");
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PUStreamShareServiceViewController;
  -[PUStreamShareServiceViewController cancel](&v2, "cancel");
}

- (id)albumListAction
{
  void *v3;
  void *v4;
  id *p_selectedAlbum;
  PLAlbumProtocol *selectedAlbum;
  NSMutableArray *v7;
  NSArray *actions;
  PLAlbumContainer *v9;
  PLAlbumContainer *albumList;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned int v19;
  NSString *albumTitle;
  NSString *v21;
  NSString *v22;
  _QWORD *v23;
  _BOOL4 inCreateNewAlbum;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD *v29;
  void *v31;
  _QWORD v32[5];
  id v33;
  id location;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringForKey:", kPUPhotoStreamsAlbumSelectedGuid));

  p_selectedAlbum = (id *)&self->_selectedAlbum;
  selectedAlbum = self->_selectedAlbum;
  self->_selectedAlbum = 0;

  v7 = objc_opt_new(NSMutableArray);
  actions = self->_actions;
  self->_actions = &v7->super;

  v9 = (PLAlbumContainer *)objc_claimAutoreleasedReturnValue(+[PUPhotoStreamAlbumsTableViewController albumListForContentMode:](PUPhotoStreamAlbumsTableViewController, "albumListForContentMode:", 1));
  albumList = self->_albumList;
  self->_albumList = v9;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PLAlbumContainer containers](self->_albumList, "containers"));
  if (objc_msgSend(v31, "count"))
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndex:", 0));
    v12 = *p_selectedAlbum;
    *p_selectedAlbum = (id)v11;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PLAlbumContainer containers](self->_albumList, "containers"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cloudGUID"));
          v19 = objc_msgSend(v18, "isEqualToString:", v4);

          if (v19)
          {
            objc_storeStrong((id *)&self->_selectedAlbum, v17);
            goto LABEL_12;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_12:

  }
  if (self->_inCreateNewAlbum && (albumTitle = self->_albumTitle) != 0)
    v21 = albumTitle;
  else
    v21 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_selectedAlbum, "localizedTitle"));
  v22 = v21;
  objc_initWeak(&location, self);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100005BF0;
  v32[3] = &unk_100008300;
  objc_copyWeak(&v33, &location);
  v32[4] = self;
  v23 = objc_retainBlock(v32);
  inCreateNewAlbum = self->_inCreateNewAlbum;
  v25 = objc_alloc_init((Class)SLComposeSheetConfigurationItem);
  v27 = PULocalizedString(CFSTR("PHOTO_STREAM_STREAMS"), v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v25, "setTitle:", v28);

  objc_msgSend(v25, "setValue:", v22);
  if (inCreateNewAlbum)
    v29 = 0;
  else
    v29 = v23;
  objc_msgSend(v25, "setTapHandler:", v29);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return v25;
}

- (BOOL)isContentValid
{
  _BYTE *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = +[PLPhotoSharingHelper maxCharactersPerComment](PLPhotoSharingHelper, "maxCharactersPerComment");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PUStreamShareServiceViewController contentText](self, "contentText"));
  if (objc_msgSend(v4, "length") >= v3)
  {

    v6 = 0;
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PUStreamShareServiceViewController contentText](self, "contentText"));
  v6 = v3 - (_BYTE *)objc_msgSend(v5, "length");

  if (v6 <= 19)
  {
LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
    -[PUStreamShareServiceViewController setCharactersRemaining:](self, "setCharactersRemaining:", v7);

    goto LABEL_6;
  }
  -[PUStreamShareServiceViewController setCharactersRemaining:](self, "setCharactersRemaining:", 0);
LABEL_6:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PUStreamShareServiceViewController contentText](self, "contentText"));
  v9 = objc_msgSend(v8, "length") <= v3;

  return v9;
}

- (void)controller:(id)a3 didSelectAlbum:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  PLAlbumProtocol *selectedAlbum;
  id v9;
  dispatch_time_t v10;
  _QWORD block[5];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cloudGUID"));
  objc_msgSend(v6, "setObject:forKey:", v7, kPUPhotoStreamsAlbumSelectedGuid);

  selectedAlbum = self->_selectedAlbum;
  self->_selectedAlbum = (PLAlbumProtocol *)v5;
  v9 = v5;

  v10 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005BAC;
  block[3] = &unk_100008328;
  block[4] = self;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)titleControllerDidCancel:(id)a3
{
  -[PUStreamShareServiceViewController cancel](self, "cancel", a3);
}

- (void)titleController:(id)a3 didSetTitle:(id)a4
{
  id v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  objc_storeStrong((id *)&self->_albumTitle, a4);
  self->_inCreateNewAlbum = 1;
  v6 = objc_alloc_init((Class)PUCloudSharedCreateAlbumViewController);
  objc_msgSend(v6, "setDelegate:", self);
  if (-[PUStreamShareServiceViewController addToExistingWorkflow](self, "addToExistingWorkflow"))
    v8 = CFSTR("STREAM_NEXT_SHEET_BUTTON");
  else
    v8 = CFSTR("STREAM_CREATE_SHEET_BUTTON");
  v9 = PULocalizedString(v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v6, "setNextButtonTitle:", v10);
  -[PUStreamShareServiceViewController reloadSheetActions](self, "reloadSheetActions");
  -[PUStreamShareServiceViewController pushActionViewController:](self, "pushActionViewController:", v6);

}

- (void)albumStreamingCreateViewController:(id)a3 didSucceed:(BOOL)a4
{
  NSArray *v5;
  NSArray *recipients;
  id v7;
  id v8;

  if (a4)
  {
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "recipients"));
    recipients = self->_recipients;
    self->_recipients = v5;

    v8 = (id)objc_claimAutoreleasedReturnValue(-[PUStreamShareServiceViewController navigationController](self, "navigationController"));
    v7 = objc_msgSend(v8, "popToRootViewControllerAnimated:", 1);

  }
  else
  {
    -[PUStreamShareServiceViewController cancel](self, "cancel", a3);
  }
}

- (void)didSelectPost
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (qword_10000CD90 != -1)
    dispatch_once(&qword_10000CD90, &stru_100008368);
  v4 = qword_10000CD88;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004E14;
  v6[3] = &unk_1000084A8;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  pl_dispatch_async(v4, v6);

}

- (id)loadItemForTypeIdentifier:(id)a3 fromItemProvider:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  dispatch_semaphore_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a3;
  v6 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100004D2C;
  v24 = sub_100004D3C;
  v25 = 0;
  v7 = dispatch_semaphore_create(0);
  global_queue = dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004D44;
  v15[3] = &unk_1000084F8;
  v16 = v6;
  v17 = v5;
  v18 = v7;
  v19 = &v20;
  v10 = v7;
  v11 = v5;
  v12 = v6;
  dispatch_sync(v9, v15);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (BOOL)URLIsAssetsLibrary:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "scheme"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("assets-library"));

  return v4;
}

- (BOOL)URLIsMediaType:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pathExtension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PFUniformTypeUtilities typeWithFilenameExtension:](PFUniformTypeUtilities, "typeWithFilenameExtension:", v3));

  if ((objc_msgSend(v4, "conformsToType:", UTTypeAudiovisualContent) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "conformsToType:", UTTypeImage);

  return v5;
}

- (void)_pushTitleController
{
  id v3;

  v3 = (id)objc_opt_new(PUPhotoStreamCreateTitleViewController);
  objc_msgSend(v3, "setTitleDelegate:", self);
  -[PUStreamShareServiceViewController pushActionViewController:](self, "pushActionViewController:", v3);

}

- (void)controller:(id)a3 presentViewController:(id)a4
{
  -[PUStreamShareServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)controller:(id)a3 dismissViewControllerWithCompletion:(id)a4
{
  -[PUStreamShareServiceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, a4);
}

- (void)controller:(id)a3 didFinishTrimmingVideoSources:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *albumTitle;
  void *v21;
  PLAlbumProtocol *selectedAlbum;
  PUStreamShareServiceViewController *v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  _BYTE v30[128];

  v23 = self;
  v5 = a3;
  v6 = a4;
  v7 = PLUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "PXVideoTrimQueueController finished trimming assets. Sending to PLCloudStreamShareJob", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trimmedVideoInfo"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mediaURL", v23));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v16));

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v16));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));
          objc_msgSend(v15, "setMediaURL:", v19);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v12);
  }

  if (v23->_inCreateNewAlbum)
  {
    albumTitle = v23->_albumTitle;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PUStreamShareServiceViewController text](v23, "text"));
    +[PLCloudStreamShareJob publishMediaFromSources:toNewSharedAlbumWithName:withCommentText:recipients:](PLCloudStreamShareJob, "publishMediaFromSources:toNewSharedAlbumWithName:withCommentText:recipients:", v10, albumTitle, v21, v23->_recipients);
  }
  else
  {
    selectedAlbum = v23->_selectedAlbum;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PUStreamShareServiceViewController text](v23, "text"));
    +[PLCloudStreamShareJob publishMediaFromSources:toSharedAlbum:withCommentText:completionHandler:](PLCloudStreamShareJob, "publishMediaFromSources:toSharedAlbum:withCommentText:completionHandler:", v10, selectedAlbum, v21, 0);
  }

  v24.receiver = v23;
  v24.super_class = (Class)PUStreamShareServiceViewController;
  -[PUStreamShareServiceViewController didSelectPost](&v24, "didSelectPost");

}

- (void)controller:(id)a3 didCancelTrimmingVideoSources:(id)a4
{
  -[PUStreamShareServiceViewController cancel](self, "cancel", a3, a4);
}

- (BOOL)addToExistingWorkflow
{
  return self->_addToExistingWorkflow;
}

- (void)setAddToExistingWorkflow:(BOOL)a3
{
  self->_addToExistingWorkflow = a3;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setAlbumTitle:(id)a3
{
  objc_storeStrong((id *)&self->_albumTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_trimController, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_albumList, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_selectedAlbum, 0);
}

@end
