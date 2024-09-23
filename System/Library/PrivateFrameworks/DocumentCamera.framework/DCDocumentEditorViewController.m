@implementation DCDocumentEditorViewController

+ (BOOL)isAvailable
{
  int v2;

  v2 = MGGetBoolAnswer();
  if (v2)
    LOBYTE(v2) = MGGetBoolAnswer() ^ 1;
  return v2;
}

+ (id)docInfoCollectionFromScannedDocument:(id)a3 imageCache:(id)a4
{
  id v5;
  void *v6;
  ICDocCamDocumentInfoCollection *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  int v19;
  ICDocCamDocumentInfo *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  ICDocCamDocumentInfoCollection *v28;
  ICDocCamDocumentInfoCollection *v29;
  _BYTE *v31;
  ICDocCamDocumentInfoCollection *v32;
  id v33;
  void *v34;
  id v35;
  int v36;
  uint64_t v37;
  void *v38;
  uint8_t v39;
  _BYTE v40[7];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v35 = a4;
  objc_msgSend(v5, "docInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(ICDocCamDocumentInfoCollection);
  -[ICDocCamDocumentInfoCollection docInfos](v7, "docInfos");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v5;
  objc_msgSend(v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v7;
  -[ICDocCamDocumentInfoCollection setTitle:](v7, "setTitle:", v8);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = v6;
  v37 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v37)
  {
    v10 = *(_QWORD *)v42;
    v31 = v40;
    v33 = v9;
    while (2)
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v9);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v12, "croppedAndFilteredImageUUID", v31);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "getImage:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fullImageUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "getImage:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v14)
          v18 = v16 == 0;
        else
          v18 = 1;
        v19 = !v18;
        if (v18)
        {
          v20 = (ICDocCamDocumentInfo *)os_log_create("com.apple.documentcamera", ");
          if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_ERROR))
            +[DCDocumentEditorViewController docInfoCollectionFromScannedDocument:imageCache:].cold.1(&v39, v31, &v20->super);
        }
        else
        {
          v20 = -[ICDocCamDocumentInfo initWithDelegate:]([ICDocCamDocumentInfo alloc], "initWithDelegate:", 0);
          objc_msgSend(v12, "metaData");
          v36 = v19;
          v21 = v10;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v22, "copy");
          -[ICDocCamDocumentInfo setMetaData:](v20, "setMetaData:", v23);

          objc_msgSend(v12, "imageQuad");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v24, "copy");
          -[ICDocCamDocumentInfo setImageQuad:](v20, "setImageQuad:", v25);

          objc_msgSend(v35, "setImage:metaData:", v14, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDocCamDocumentInfo setCroppedAndFilteredImageUUID:](v20, "setCroppedAndFilteredImageUUID:", v26);

          -[ICDocCamDocumentInfo setCroppedButNotFilteredImageUUID:](v20, "setCroppedButNotFilteredImageUUID:", 0);
          v10 = v21;
          v19 = v36;
          objc_msgSend(v35, "setImage:metaData:", v17, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDocCamDocumentInfo setFullImageUUID:](v20, "setFullImageUUID:", v27);

          v9 = v33;
          -[ICDocCamDocumentInfo setMeshAnimImageUUID:](v20, "setMeshAnimImageUUID:", 0);
          -[ICDocCamDocumentInfo setCurrentFilter:](v20, "setCurrentFilter:", objc_msgSend(v12, "currentFilter"));
          -[ICDocCamDocumentInfo setCurrentOrientation:](v20, "setCurrentOrientation:", objc_msgSend(v12, "currentOrientation"));
          -[ICDocCamDocumentInfo setScanDataDelegateIdentifier:](v20, "setScanDataDelegateIdentifier:", 0);
          objc_msgSend(v34, "addObject:", v20);
        }

        if (!v19)
        {

          v29 = 0;
          v28 = v32;
          goto LABEL_21;
        }
      }
      v37 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v37)
        continue;
      break;
    }
  }

  v28 = v32;
  v29 = v32;
LABEL_21:

  return v29;
}

- (DCDocumentEditorViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{

  return 0;
}

- (DCDocumentEditorViewController)initWithRootViewController:(id)a3
{

  return 0;
}

- (DCDocumentEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (DCDocumentEditorViewController)initWithCoder:(id)a3
{

  return 0;
}

- (DCDocumentEditorViewController)initWithDelegate:(id)a3 scannedDocument:(id)a4
{
  id v6;
  id v7;
  ICDocCamImageCache *v8;
  void *v9;
  ICDocCamExtractedDocumentViewController *v10;
  DCDocumentEditorViewController *v11;
  DCDocumentEditorViewController *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = -[ICDocCamImageCache initWithDataCryptorDelegate:]([ICDocCamImageCache alloc], "initWithDataCryptorDelegate:", 0);
  +[DCDocumentEditorViewController docInfoCollectionFromScannedDocument:imageCache:](DCDocumentEditorViewController, "docInfoCollectionFromScannedDocument:imageCache:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICDocCamExtractedDocumentViewController initWithDelegate:documentInfoCollection:imageCache:currentIndex:mode:]([ICDocCamExtractedDocumentViewController alloc], "initWithDelegate:documentInfoCollection:imageCache:currentIndex:mode:", self, v9, v8, 0, 1);
  v14.receiver = self;
  v14.super_class = (Class)DCDocumentEditorViewController;
  v11 = -[DCDocumentEditorViewController initWithRootViewController:](&v14, sel_initWithRootViewController_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_extractedDocumentController, v10);
    objc_storeWeak((id *)&v12->_docCamDelegate, v6);
    objc_storeStrong((id *)&v12->_docInfoCollection, v9);
    objc_storeStrong((id *)&v12->_imageCache, v8);
    objc_storeStrong((id *)&v12->_scannedDocument, a4);
  }

  return v12;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DCDocumentEditorViewController;
  -[DCDocumentEditorViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DCDocumentEditorViewController;
  -[DCDocumentEditorViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)_autoDismiss
{
  id v2;

  -[DCDocumentEditorViewController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3 scanDataDelegate:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  id v17;

  -[DCDocumentEditorViewController docCamDelegate](self, "docCamDelegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modificationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v10)
    {
      -[DCDocumentEditorViewController scannedDocument](self, "scannedDocument");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[DCDocumentEditorViewController imageCache](self, "imageCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "replaceContentsWithDocInfoCollection:imageCache:", v12, v13);

    }
    v14 = v8 != v10;
    -[DCDocumentEditorViewController imageCache](self, "imageCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deleteAllImages");

    +[DCDocCamPDFGenerator deleteAllDocCamPDFs](DCDocCamPDFGenerator, "deleteAllDocCamPDFs");
    -[DCDocumentEditorViewController docCamDelegate](self, "docCamDelegate");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[DCDocumentEditorViewController scannedDocument](self, "scannedDocument");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "documentEditorViewController:didFinishWithDocument:wasModified:", self, v16, v14);

  }
  else
  {
    -[DCDocumentEditorViewController _autoDismiss](self, "_autoDismiss");
  }
}

- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[DCDocumentEditorViewController extractedDocumentControllerDidTapDone:].cold.1(v3, v4, v5);

}

- (void)extractedDocumentController:(id)a3 didTapRecrop:(id)a4 index:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ICDocCamImageQuadEditViewController *v15;
  id v16;
  id v17;
  ICDocCamImageQuadEditViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  DCDocumentEditorViewController *v40;
  id v41;
  int64_t v42;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    -[DCDocumentEditorViewController imageCache](self, "imageCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fullImageUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v10;
    objc_msgSend(v10, "getImage:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "imageQuad");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "currentOrientation");
    v15 = [ICDocCamImageQuadEditViewController alloc];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __81__DCDocumentEditorViewController_extractedDocumentController_didTapRecrop_index___block_invoke;
    v38[3] = &unk_24C5B8378;
    v16 = v9;
    v39 = v16;
    v40 = self;
    v17 = v8;
    v41 = v17;
    v42 = a5;
    v34 = (void *)v13;
    v35 = (void *)v12;
    v18 = -[ICDocCamImageQuadEditViewController initWithImage:quad:scanDataDelegate:orientation:completionHandler:](v15, "initWithImage:quad:scanDataDelegate:orientation:completionHandler:", v12, v13, 0, v14, v38);
    -[ICDocCamImageQuadEditViewController setShowImageAsAspectFit:](v18, "setShowImageAsAspectFit:", 1);
    -[DCDocumentEditorViewController setUseCustomRecropTransition:](self, "setUseCustomRecropTransition:", 1);
    objc_msgSend(v17, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", self);

    -[ICDocCamImageQuadEditViewController navigationController](v18, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", self);

    objc_msgSend(v16, "croppedAndFilteredImageUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[DCDocumentEditorViewController imageCache](self, "imageCache");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "croppedAndFilteredImageUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "getImage:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[DCDocumentEditorViewController extractedDocumentControllerImageForDocument:](self, "extractedDocumentControllerImageForDocument:", v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v37 = v8;
    objc_msgSend(v16, "croppedButNotFilteredImageUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[DCDocumentEditorViewController imageCache](self, "imageCache");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "croppedButNotFilteredImageUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "getImage:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v17, "croppedButNotFilteredImageForDocInfo:", v16);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a5, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCDocumentEditorViewController setIndexPathForRecrop:](self, "setIndexPathForRecrop:", v29);

    -[DCDocumentEditorViewController setFilteredImageForRecrop:](self, "setFilteredImageForRecrop:", v24);
    v30 = objc_alloc(MEMORY[0x24BDF6AC8]);
    v31 = objc_retainAutorelease(v28);
    v32 = (void *)objc_msgSend(v30, "initWithCGImage:scale:orientation:", objc_msgSend(v31, "CGImage"), objc_msgSend(v16, "currentOrientation"), 1.0);
    -[DCDocumentEditorViewController setUnfilteredImageForRecrop:](self, "setUnfilteredImageForRecrop:", v32);

    -[DCDocumentEditorViewController setOrientationForRecrop:](self, "setOrientationForRecrop:", objc_msgSend(v16, "currentOrientation"));
    objc_msgSend(v17, "navigationController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "pushViewController:animated:", v18, 1);

    v8 = v37;
  }

}

void __81__DCDocumentEditorViewController_extractedDocumentController_didTapRecrop_index___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v28 = a3;
  v7 = a4;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setImageQuad:", v7);
    +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:normalizedImageQuad:](ICDocCamImageFilters, "perspectiveCorrectedImageFromImage:normalizedImageQuad:", v28, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:constantColor:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:constantColor:", v8, objc_msgSend(*(id *)(a1 + 32), "currentOrientation"), objc_msgSend(*(id *)(a1 + 32), "currentFilter"), objc_msgSend(*(id *)(a1 + 32), "constantColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "imageCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metaData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "croppedAndFilteredImageUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "replaceImage:metaData:uuid:", v9, v11, v12);

    objc_msgSend(*(id *)(a1 + 48), "didUpdateDocumentImage:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 32), "croppedAndFilteredImageUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 40);
  if (v13)
  {
    objc_msgSend(v14, "imageCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "croppedAndFilteredImageUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getImage:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v14, "extractedDocumentControllerImageForDocument:", *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "croppedButNotFilteredImageUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 40), "imageCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "croppedButNotFilteredImageUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "getImage:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "croppedButNotFilteredImageForDocInfo:", *(_QWORD *)(a1 + 32));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 56), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setIndexPathForRecrop:", v22);

  objc_msgSend(*(id *)(a1 + 40), "setFilteredImageForRecrop:", v17);
  v23 = objc_alloc(MEMORY[0x24BDF6AC8]);
  v24 = objc_retainAutorelease(v21);
  v25 = (void *)objc_msgSend(v23, "initWithCGImage:scale:orientation:", objc_msgSend(v24, "CGImage"), objc_msgSend(*(id *)(a1 + 32), "currentOrientation"), 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setUnfilteredImageForRecrop:", v25);

  objc_msgSend(*(id *)(a1 + 40), "setOrientationForRecrop:", objc_msgSend(*(id *)(a1 + 32), "currentOrientation"));
  objc_msgSend(*(id *)(a1 + 48), "navigationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v26, "popViewControllerAnimated:", 1);

}

- (void)extractedDocumentControllerDidTapAddImage
{
  ICDocCamNavigationController *v3;
  void *v4;
  void *v5;
  void *v6;
  ICDocCamNavigationController *v7;

  if (-[DCDocumentEditorViewController documentCameraController:canAddImages:](self, "documentCameraController:canAddImages:", 0, 1))
  {
    v3 = [ICDocCamNavigationController alloc];
    -[DCDocumentEditorViewController imageCache](self, "imageCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICDocCamNavigationController initWithImageCache:docCamDelegate:remoteDocCamDelegate:](v3, "initWithImageCache:docCamDelegate:remoteDocCamDelegate:", v4, self, self);

    -[ICDocCamNavigationController setModalTransitionStyle:](v7, "setModalTransitionStyle:", 2);
    -[DCDocumentEditorViewController extractedDocumentController](self, "extractedDocumentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

  }
  else
  {
    -[DCDocumentEditorViewController extractedDocumentController](self, "extractedDocumentController");
    v7 = (ICDocCamNavigationController *)objc_claimAutoreleasedReturnValue();
    +[ICDocCamViewController warnAboutMaxScansReachedForViewController:completionHandler:](ICDocCamViewController, "warnAboutMaxScansReachedForViewController:completionHandler:");
  }

}

- (void)extractedDocumentController:(id)a3 shareDocument:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  DCMarkupActivity *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  DCMarkupActivityItem *v25;
  void *v26;
  void *v27;
  DCDocumentInfoCollectionActivityItemSource *v28;
  void *v29;
  DCDocumentInfoCollectionActivityItemSource *v30;
  DCActivityViewController *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  DCMarkupActivityItem *v37;
  id v38;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  DCDocumentEditorViewController *v43;
  id v44;
  _QWORD v45[6];
  _QWORD v46[3];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "croppedAndFilteredImageUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[DCDocumentEditorViewController extractedDocumentControllerImageForDocument:](self, "extractedDocumentControllerImageForDocument:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[DCDocumentEditorViewController imageCache](self, "imageCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "croppedAndFilteredImageUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getImage:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
LABEL_3:
    objc_msgSend(v8, "currentImageView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v16;
    v19 = v18;
    v20 = [DCMarkupActivity alloc];
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __83__DCDocumentEditorViewController_extractedDocumentController_shareDocument_sender___block_invoke;
    v45[3] = &__block_descriptor_48_e47__CGRect__CGPoint_dd__CGSize_dd__16__0__UIView_8l;
    v45[4] = v17;
    v45[5] = v19;
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __83__DCDocumentEditorViewController_extractedDocumentController_shareDocument_sender___block_invoke_2;
    v41[3] = &unk_24C5B83C0;
    v21 = v9;
    v42 = v21;
    v43 = self;
    v40 = v10;
    v22 = v8;
    v44 = v22;
    v23 = -[DCMarkupActivity initFromView:presentingViewController:frameBlock:completionBlock:](v20, "initFromView:presentingViewController:frameBlock:completionBlock:", v39, v22, v45, v41);
    objc_msgSend(v23, "setInkStyle:", 1);
    v46[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = [DCMarkupActivityItem alloc];
    -[DCDocumentEditorViewController imageCache](self, "imageCache");
    v38 = v8;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[DCMarkupActivityItem initWithDocumentInfo:imageCache:](v25, "initWithDocumentInfo:imageCache:", v21, v26);

    objc_msgSend(v11, "arrayByAddingObject:", v37);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = [DCDocumentInfoCollectionActivityItemSource alloc];
    -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[DCActivityItemSource initWithDocumentInfoCollection:](v28, "initWithDocumentInfoCollection:", v29);

    objc_msgSend(v27, "arrayByAddingObject:", v30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = -[DCActivityViewController initWithActivityItems:applicationActivities:]([DCActivityViewController alloc], "initWithActivityItems:applicationActivities:", v11, v24);
    -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCActivityViewController setDocumentInfoCollection:](v31, "setDocumentInfoCollection:", v32);

    -[DCDocumentEditorViewController imageCache](self, "imageCache");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCActivityViewController setImageCache:](v31, "setImageCache:", v33);

    v8 = v38;
    -[DCActivityViewController setCompletionWithItemsHandler:](v31, "setCompletionWithItemsHandler:", &__block_literal_global_5);
    objc_msgSend((id)objc_opt_class(), "activityTypeOrder");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCActivityViewController setActivityTypeOrder:](v31, "setActivityTypeOrder:", v34);

    -[DCActivityViewController setModalPresentationStyle:](v31, "setModalPresentationStyle:", 7);
    v35 = v22;
    v10 = v40;
    objc_msgSend(v35, "presentViewController:animated:completion:", v31, 1, 0);
    -[DCActivityViewController popoverPresentationController](v31, "popoverPresentationController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setBarButtonItem:", v40);
    objc_msgSend(v36, "setPermittedArrowDirections:", 3);

  }
LABEL_4:

}

uint64_t __83__DCDocumentEditorViewController_extractedDocumentController_shareDocument_sender___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(a2, "bounds");
  return objc_msgSend(v2, "dc_aspectFitImageFrameForViewWithFrame:imageSize:");
}

void __83__DCDocumentEditorViewController_extractedDocumentController_shareDocument_sender___block_invoke_2(id *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = v3;
      objc_msgSend(a1[4], "croppedAndFilteredImageUUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[5], "imageCache");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "metaData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(a1[4], "croppedAndFilteredImageUUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "replaceImage:metaData:uuid:", v8, v6, v7);
      }
      else
      {
        objc_msgSend(v5, "setImage:metaData:", v8, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "setCroppedAndFilteredImageUUID:", v7);
      }

      objc_msgSend(a1[6], "didUpdateDocumentImage:", a1[4]);
      v3 = v8;
    }

  }
}

void __83__DCDocumentEditorViewController_extractedDocumentController_shareDocument_sender___block_invoke_3(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v8 = a4;
  v9 = a5;
  if (a3)
    NSLog(CFSTR("We used activity type%@"), v12);
  else
    NSLog(CFSTR("We didn't want to share anything after all."));
  if (v9)
  {
    objc_msgSend(v9, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedFailureReason");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("An Error occurred: %@, %@"), v10, v11);

  }
}

+ (id)activityTypeOrder
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDF7490];
  v5[0] = CFSTR("com.apple.documentcamera.markup");
  v5[1] = v2;
  v3 = *MEMORY[0x24BDF7480];
  v5[2] = *MEMORY[0x24BDF74D8];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)extractedDocumentControllerDidSelectShareFromMenuForDocument:(id)a3 sourceRect:(CGRect)a4 sourceView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v22[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  objc_msgSend(v11, "croppedAndFilteredImageUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[DCDocumentEditorViewController extractedDocumentControllerImageForDocument:](self, "extractedDocumentControllerImageForDocument:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[DCDocumentEditorViewController imageCache](self, "imageCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "croppedAndFilteredImageUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getImage:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
LABEL_3:
    v17 = objc_alloc(MEMORY[0x24BDF67E0]);
    v22[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithActivityItems:applicationActivities:", v18, MEMORY[0x24BDBD1A8]);

    objc_msgSend(v19, "setModalPresentationStyle:", 7);
    -[DCDocumentEditorViewController extractedDocumentController](self, "extractedDocumentController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "presentViewController:animated:completion:", v19, 1, 0);

    objc_msgSend(v19, "popoverPresentationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSourceRect:", x, y, width, height);
    objc_msgSend(v21, "setSourceView:", v12);
    objc_msgSend(v21, "setPermittedArrowDirections:", 3);

  }
LABEL_4:

}

- (void)extractedDocumentControllerDidSelectCopyFromMenuForDocument:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "croppedAndFilteredImageUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[DCDocumentEditorViewController extractedDocumentControllerImageForDocument:](self, "extractedDocumentControllerImageForDocument:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[DCDocumentEditorViewController imageCache](self, "imageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "croppedAndFilteredImageUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getImage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v7);

  }
LABEL_4:

}

- (id)extractedDocumentControllerTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Scanned Documents"), CFSTR("Scanned Documents"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)extractedDocumentControllerDidChangeTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (id)extractedDocumentControllerMarkupModelDataForDocument:(id)a3
{
  return (id)objc_msgSend(a3, "markupModelData");
}

- (void)extractedDocumentControllerDiscardMarkupModelDataForDocument:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "setMarkupModelData:", 0);
  objc_msgSend(v21, "croppedAndFilteredImageUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DCDocumentEditorViewController imageCache](self, "imageCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fullImageUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getImage:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "imageQuad");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICDocCamImageFilters perspectiveCorrectedImageFromImage:normalizedImageQuad:](ICDocCamImageFilters, "perspectiveCorrectedImageFromImage:normalizedImageQuad:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[ICDocCamImageFilters filteredImage:orientation:imageFilterType:constantColor:](ICDocCamImageFilters, "filteredImage:orientation:imageFilterType:constantColor:", v9, objc_msgSend(v21, "currentOrientation"), objc_msgSend(v21, "currentFilter"), objc_msgSend(v21, "constantColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCDocumentEditorViewController imageCache](self, "imageCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "metaData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "croppedAndFilteredImageUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replaceImage:metaData:uuid:", v10, v12, v13);

  }
  objc_msgSend(v21, "croppedButNotFilteredImageUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[DCDocumentEditorViewController imageCache](self, "imageCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "croppedButNotFilteredImageUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deleteImage:", v16);

  }
  objc_msgSend(v21, "meshAnimImageUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[DCDocumentEditorViewController imageCache](self, "imageCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "meshAnimImageUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deleteImage:", v19);

  }
  -[DCDocumentEditorViewController extractedDocumentController](self, "extractedDocumentController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "didUpdateDocumentImage:", v21);

}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6
{
  -[DCDocumentEditorViewController documentCameraController:didFinishWithDocInfoCollection:imageCache:warnUser:closeViewController:](self, "documentCameraController:didFinishWithDocInfoCollection:imageCache:warnUser:closeViewController:", a3, a4, a5, a6, 1);
}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD block[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v8 = a6;
  v40 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v12 = a4;
  v13 = a5;
  if (v8 && !a7)
  {
    v14 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[DCDocumentEditorViewController documentCameraController:didFinishWithDocInfoCollection:imageCache:warnUser:closeViewController:].cold.2(v14, v15, v16);

  }
  objc_msgSend(v12, "docInfos", v32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (!v18)
  {
    v19 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[DCDocumentEditorViewController documentCameraController:didFinishWithDocInfoCollection:imageCache:warnUser:closeViewController:].cold.1(v19, v20, v21);

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v12, "docInfos");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v36;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v26);
        -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "docInfos");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v27);

        -[DCDocumentEditorViewController extractedDocumentController](self, "extractedDocumentController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "didUpdateDocumentInfoArrayNewCurrentDocument:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v24);
  }

  -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bumpModificationDate");

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __130__DCDocumentEditorViewController_documentCameraController_didFinishWithDocInfoCollection_imageCache_warnUser_closeViewController___block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __130__DCDocumentEditorViewController_documentCameraController_didFinishWithDocInfoCollection_imageCache_warnUser_closeViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "extractedDocumentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __130__DCDocumentEditorViewController_documentCameraController_didFinishWithDocInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2;
  v4[3] = &unk_24C5B7AE0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

void __130__DCDocumentEditorViewController_documentCameraController_didFinishWithDocInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "extractedDocumentController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)documentCameraControllerDidCancel:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[DCDocumentEditorViewController extractedDocumentController](self, "extractedDocumentController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__DCDocumentEditorViewController_documentCameraControllerDidCancel___block_invoke;
  v6[3] = &unk_24C5B7AE0;
  v6[4] = self;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

}

void __68__DCDocumentEditorViewController_documentCameraControllerDidCancel___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "extractedDocumentController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "docInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "count") + a4 < 0x19;

  return a4;
}

- (id)documentCameraControllerCreateDataCryptorIfNecessary
{
  return 0;
}

- (id)scanDataDelegateWithIdentifier:(id)a3
{
  return 0;
}

- (void)remoteDocumentCameraControllerDidCancel:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[DCDocumentEditorViewController extractedDocumentController](self, "extractedDocumentController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__DCDocumentEditorViewController_remoteDocumentCameraControllerDidCancel___block_invoke;
  v6[3] = &unk_24C5B7AE0;
  v6[4] = self;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

}

void __74__DCDocumentEditorViewController_remoteDocumentCameraControllerDidCancel___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "extractedDocumentController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a4, "docInfos", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "docInfos");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v10);

        -[DCDocumentEditorViewController extractedDocumentController](self, "extractedDocumentController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "didUpdateDocumentInfoArrayNewCurrentDocument:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[DCDocumentEditorViewController docInfoCollection](self, "docInfoCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bumpModificationDate");

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__DCDocumentEditorViewController_remoteDocumentCameraController_didFinishWithInfoCollection___block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __93__DCDocumentEditorViewController_remoteDocumentCameraController_didFinishWithInfoCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "extractedDocumentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __93__DCDocumentEditorViewController_remoteDocumentCameraController_didFinishWithInfoCollection___block_invoke_2;
  v4[3] = &unk_24C5B7AE0;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

void __93__DCDocumentEditorViewController_remoteDocumentCameraController_didFinishWithInfoCollection___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "extractedDocumentController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)remoteDocumentCameraController:(id)a3 didFailWithError:(id)a4
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[DCDocumentEditorViewController extractedDocumentController](self, "extractedDocumentController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__DCDocumentEditorViewController_remoteDocumentCameraController_didFailWithError___block_invoke;
  v7[3] = &unk_24C5B7AE0;
  v7[4] = self;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __82__DCDocumentEditorViewController_remoteDocumentCameraController_didFailWithError___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "extractedDocumentController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  ICDocCamRecropTransitionAnimator *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  ICDocCamRecropTransitionAnimator *v13;

  if (-[DCDocumentEditorViewController useCustomRecropTransition](self, "useCustomRecropTransition", a3, a4, a5, a6))
  {
    v8 = [ICDocCamRecropTransitionAnimator alloc];
    -[DCDocumentEditorViewController filteredImageForRecrop](self, "filteredImageForRecrop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCDocumentEditorViewController unfilteredImageForRecrop](self, "unfilteredImageForRecrop");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[DCDocumentEditorViewController orientationForRecrop](self, "orientationForRecrop");
    -[DCDocumentEditorViewController indexPathForRecrop](self, "indexPathForRecrop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ICDocCamRecropTransitionAnimator initWithImage:unfilteredImage:orientation:indexPath:duration:completion:](v8, "initWithImage:unfilteredImage:orientation:indexPath:duration:completion:", v9, v10, v11, v12, 0, 0.65);

    -[DCDocumentEditorViewController setFilteredImageForRecrop:](self, "setFilteredImageForRecrop:", 0);
    -[DCDocumentEditorViewController setUnfilteredImageForRecrop:](self, "setUnfilteredImageForRecrop:", 0);
    -[ICDocCamRecropTransitionAnimator setPresenting:](v13, "setPresenting:", a4 == 1);
    if (!-[ICDocCamRecropTransitionAnimator presenting](v13, "presenting"))
      -[DCDocumentEditorViewController setUseCustomRecropTransition:](self, "setUseCustomRecropTransition:", 0);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICDocCamExtractedDocumentViewController)extractedDocumentController
{
  return self->_extractedDocumentController;
}

- (void)setExtractedDocumentController:(id)a3
{
  objc_storeStrong((id *)&self->_extractedDocumentController, a3);
}

- (DCDocumentEditorViewControllerDelegate)docCamDelegate
{
  return (DCDocumentEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_docCamDelegate);
}

- (void)setDocCamDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_docCamDelegate, a3);
}

- (VNDocumentCameraScan)scannedDocument
{
  return self->_scannedDocument;
}

- (void)setScannedDocument:(id)a3
{
  objc_storeStrong((id *)&self->_scannedDocument, a3);
}

- (ICDocCamDocumentInfoCollection)docInfoCollection
{
  return self->_docInfoCollection;
}

- (void)setDocInfoCollection:(id)a3
{
  objc_storeStrong((id *)&self->_docInfoCollection, a3);
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (BOOL)useCustomRecropTransition
{
  return self->_useCustomRecropTransition;
}

- (void)setUseCustomRecropTransition:(BOOL)a3
{
  self->_useCustomRecropTransition = a3;
}

- (int64_t)orientationForRecrop
{
  return self->_orientationForRecrop;
}

- (void)setOrientationForRecrop:(int64_t)a3
{
  self->_orientationForRecrop = a3;
}

- (NSIndexPath)indexPathForRecrop
{
  return self->_indexPathForRecrop;
}

- (void)setIndexPathForRecrop:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathForRecrop, a3);
}

- (UIImage)filteredImageForRecrop
{
  return self->_filteredImageForRecrop;
}

- (void)setFilteredImageForRecrop:(id)a3
{
  objc_storeStrong((id *)&self->_filteredImageForRecrop, a3);
}

- (UIImage)unfilteredImageForRecrop
{
  return self->_unfilteredImageForRecrop;
}

- (void)setUnfilteredImageForRecrop:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredImageForRecrop, a3);
}

- (UIView)sourceViewForZoomTransition
{
  return self->_sourceViewForZoomTransition;
}

- (void)setSourceViewForZoomTransition:(id)a3
{
  objc_storeStrong((id *)&self->_sourceViewForZoomTransition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceViewForZoomTransition, 0);
  objc_storeStrong((id *)&self->_unfilteredImageForRecrop, 0);
  objc_storeStrong((id *)&self->_filteredImageForRecrop, 0);
  objc_storeStrong((id *)&self->_indexPathForRecrop, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_docInfoCollection, 0);
  objc_storeStrong((id *)&self->_scannedDocument, 0);
  objc_destroyWeak((id *)&self->_docCamDelegate);
  objc_storeStrong((id *)&self->_extractedDocumentController, 0);
}

+ (void)docInfoCollectionFromScannedDocument:(NSObject *)a3 imageCache:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_20CE8E000, a3, (uint64_t)a3, "File missing", a1);
}

- (void)extractedDocumentControllerDidTapDone:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_20CE8E000, a1, a3, "[DCDocumentEditorViewController extractedDocumentControllerDidTapDone:] should never be called.", v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)documentCameraController:(uint64_t)a3 didFinishWithDocInfoCollection:imageCache:warnUser:closeViewController:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_20CE8E000, a1, a3, "This should never be called with a count of 0.", v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)documentCameraController:(uint64_t)a3 didFinishWithDocInfoCollection:imageCache:warnUser:closeViewController:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_20CE8E000, a1, a3, "Cannot warn user if not closing the view controller", v3);
  OUTLINED_FUNCTION_1_0();
}

@end
