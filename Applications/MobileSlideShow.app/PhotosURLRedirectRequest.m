@implementation PhotosURLRedirectRequest

- (PhotosURLRedirectRequest)initWithDestinationURL:(id)a3 rootController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PhotosURLRedirectRequest *v12;
  NSString *v13;
  NSString *invitationToken;
  PhotosURLRedirectRequest *v15;
  uint64_t Log;
  NSObject *v17;
  void *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosURLRedirectRequest.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

    if (v9)
      goto LABEL_3;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosURLRedirectRequest.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootController"));

LABEL_3:
  v10 = PXSharedAlbumURLHandlingInvitationTokenForURL(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    v21.receiver = self;
    v21.super_class = (Class)PhotosURLRedirectRequest;
    v12 = -[PhotosURLRedirectRequest init](&v21, "init");
    if (v12)
    {
      v13 = (NSString *)objc_msgSend(v11, "copy");
      invitationToken = v12->_invitationToken;
      v12->_invitationToken = v13;

      objc_storeStrong((id *)&v12->_rootController, a4);
    }
    self = v12;
    v15 = self;
  }
  else
  {
    Log = PLPhotoSharingGetLog();
    v17 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Invalid URL: %@", buf, 0xCu);
    }

    v15 = 0;
  }

  return v15;
}

- (void)_showAlertForError:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSString *invitationToken;
  int v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  Block_layout *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  dispatch_time_t v49;
  id v50;
  _QWORD block[4];
  id v52;
  id v53;
  id v54;

  switch(a3)
  {
    case 0uLL:
      v4 = PXLocalizedString(CFSTR("PXLockdown_SharedAlbumsNotAvailableTitle"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v6 = PXLocalizedString(CFSTR("PXLockdown_SharedAlbumsNotAvailableMessageAnonymous"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      invitationToken = self->_invitationToken;
      v53 = 0;
      v54 = 0;
      v9 = PXSharedAlbumURLHandlingParseInvitationToken(invitationToken, &v54, &v53);
      v10 = v54;
      v11 = v53;
      if (v9)
      {
        v12 = PXLocalizedString(CFSTR("PXLockdown_SharedAlbumsNotAvailableMessageFormat"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = PXLocalizedStringWithValidatedFormat(v13, CFSTR("%@ %@"));
        v15 = objc_claimAutoreleasedReturnValue(v14);

        v7 = (void *)v15;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1));
      v17 = PLLocalizedFrameworkString(CFSTR("OK"), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 1, 0));
      objc_msgSend(v16, "addAction:", v19);

      break;
    case 1uLL:
      v40 = PLLocalizedFrameworkString(CFSTR("SIGN_INTO_ICLOUD_TITLE"), 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = PLLocalizedFrameworkString(CFSTR("SIGN_INTO_ICLOUD_MESSAGE"), 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v41, v43, 1));

      v44 = PLLocalizedFrameworkString(CFSTR("CANCEL"), 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v45, 1, 0));
      objc_msgSend(v16, "addAction:", v46);

      v47 = PLLocalizedFrameworkString(CFSTR("SETTINGS_BUTTON"), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v47);
      v29 = &stru_10006D5D8;
      goto LABEL_11;
    case 2uLL:
      v20 = PLLocalizedFrameworkString(CFSTR("ENABLE_SHAREDALBUM_TITLE"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = PLLocalizedFrameworkString(CFSTR("ENABLE_SHAREDALBUM_MESSAGE"), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v21, v23, 1));

      v24 = PLLocalizedFrameworkString(CFSTR("CANCEL"), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v25, 1, 0));
      objc_msgSend(v16, "addAction:", v26);

      v27 = PLLocalizedFrameworkString(CFSTR("SETTINGS_BUTTON"), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v29 = &stru_10006D5F8;
LABEL_11:
      v36 = v28;
      v37 = 0;
      goto LABEL_12;
    case 3uLL:
      v30 = PLLocalizedFrameworkString(CFSTR("UNABLE_TO_SUBSCRIBE_ERROR_TITLE"), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = PLLocalizedFrameworkString(CFSTR("UNABLE_TO_SUBSCRIBE_ERROR_MESSAGE"), 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v31, v33, 1));

      goto LABEL_8;
    case 4uLL:
      v34 = PLLocalizedFrameworkString(CFSTR("SHAREDALBUM_NO_LONGER_SHARED_ERROR_TITLE"), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v31, 0, 1));
LABEL_8:

      v35 = PLLocalizedFrameworkString(CFSTR("OK"), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v36 = v28;
      v37 = 1;
      v29 = 0;
LABEL_12:
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v36, v37, v29));
      objc_msgSend(v16, "addAction:", v48);

      break;
    default:
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosURLRedirectRequest.m"), 134, CFSTR("Unknown Request Error"));

      v16 = 0;
      break;
  }
  v49 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045AA8;
  block[3] = &unk_10006D620;
  v52 = v16;
  v50 = v16;
  dispatch_after(v49, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_navigateToPhotoStreamTab
{
  PhotosURLNavigationRequest *v3;
  id v4;

  if (-[PXRootLibraryNavigationController contentModeIsAvailableForNavigation:](self->_rootController, "contentModeIsAvailableForNavigation:", 1))
  {
    -[PXRootLibraryNavigationController navigateToContentMode:animated:completion:](self->_rootController, "navigateToContentMode:animated:completion:", 1, 0, 0);
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("photos://cloudfeed")));
    v3 = -[PhotosURLNavigationRequest initWithDestinationURL:rootController:]([PhotosURLNavigationRequest alloc], "initWithDestinationURL:rootController:", v4, self->_rootController);
    -[PhotosURLNavigationRequest navigateAllowingRetry:completion:](v3, "navigateAllowingRetry:completion:", 1, 0);

  }
}

- (BOOL)_checkAndAlertSubscribedStreamsLimitReached
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
  v3 = +[PLPhotoSharingHelper hasReachedLimitOfSubscribedStreamsInLibrary:](PLPhotoSharingHelper, "hasReachedLimitOfSubscribedStreamsInLibrary:", v2);

  if (v3)
  {
    v4 = PLServicesLocalizedFrameworkString(CFSTR("CANNOT_SUBSCRIBE_TO_GENERIC_STREAM_TITLE"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = PLServicesLocalizedFrameworkString(CFSTR("SUBSCRIBE_STREAMS_LIMIT_REACHED_MESSAGE"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v17 = +[PLPhotoSharingHelper maxSubscribedStreams](PLPhotoSharingHelper, "maxSubscribedStreams");
    v8 = PFLocalizedStringWithValidatedFormat(v7, CFSTR("%lu"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, v9, 1, v17));
    v11 = PLLocalizedFrameworkString(CFSTR("OK"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v12, 1, 0));
    objc_msgSend(v10, "addAction:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "px_firstKeyWindow"));
    objc_msgSend(v15, "pl_presentViewController:animated:", v10, 1);

  }
  return v3;
}

- (void)performRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  PhotosURLRedirectRequest *v9;
  uint64_t v10;
  uint64_t Log;
  NSObject *v12;
  void *v13;
  NSString *invitationToken;
  uint8_t v15[8];
  _QWORD v16[5];

  if (PLIsLockdownMode(self, a2))
  {
    -[PhotosURLRedirectRequest _showAlertForError:](self, "_showAlertForError:", 0);
    return;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoSharingHelper sharingPersonID](PLPhotoSharingHelper, "sharingPersonID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedPrimaryAppleAccount"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "photoLibraryURL"));
    v8 = +[PLPhotoSharingHelper sharedStreamsEnabledForPhotoLibraryURL:](PLPhotoSharingHelper, "sharedStreamsEnabledForPhotoLibraryURL:", v7);

    if ((v8 & 1) != 0)
    {
      if (objc_msgSend(v3, "length"))
      {
        if (-[PhotosURLRedirectRequest _checkAndAlertSubscribedStreamsLimitReached](self, "_checkAndAlertSubscribedStreamsLimitReached"))
        {
          -[PhotosURLRedirectRequest _navigateToPhotoStreamTab](self, "_navigateToPhotoStreamTab");
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSASConnection sharedConnection](MSASConnection, "sharedConnection"));
          invitationToken = self->_invitationToken;
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100045908;
          v16[3] = &unk_10006D670;
          v16[4] = self;
          objc_msgSend(v13, "acceptInvitationWithToken:personID:completionBlock:", invitationToken, v3, v16);

        }
      }
      else
      {
        Log = PLPhotoSharingGetLog(0);
        v12 = objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "ERROR: Failed to subscribe to shared stream because the personID was nil", v15, 2u);
        }

      }
      goto LABEL_11;
    }
    v9 = self;
    v10 = 2;
  }
  else
  {
    v9 = self;
    v10 = 1;
  }
  -[PhotosURLRedirectRequest _showAlertForError:](v9, "_showAlertForError:", v10);
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_invitationToken, 0);
}

@end
