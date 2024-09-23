@implementation SFBookmarkInfoViewController

void __62___SFBookmarkInfoViewController__returnWasPressedInTextField___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);

  if (v2 == v3)
    v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

uint64_t __67___SFBookmarkInfoViewController__setFolderPickerExpanded_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePreferredContentSize");
}

uint64_t __57___SFBookmarkInfoViewController__reloadFolderInfoForced___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_DWORD *)(v5 + 1080);
  if (!v6)
    goto LABEL_4;
  objc_msgSend(v3, "syntheticFolder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bookmarkList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "folderID");

  v5 = *(_QWORD *)(a1 + 32);
  if (v6 == v9)
  {
    *(_DWORD *)(v5 + 1080) = 0;
    objc_msgSend(v4, "syntheticFolder");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 1072);
    *(_QWORD *)(v11 + 1072) = v10;
    v13 = 1;
  }
  else
  {
LABEL_4:
    v14 = *(void **)(v5 + 1072);
    objc_msgSend(v4, "syntheticFolder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "isEqual:", v12);
  }

  return v13;
}

BOOL __57___SFBookmarkInfoViewController__reloadFolderInfoForced___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  _BOOL8 v6;

  objc_msgSend(a2, "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064))
  {
    v5 = objc_msgSend(v3, "identifier");
    v6 = v5 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "identifier");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
