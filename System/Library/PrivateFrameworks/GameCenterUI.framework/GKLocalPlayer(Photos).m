@implementation GKLocalPlayer(Photos)

- (uint64_t)deletePhoto
{
  return objc_msgSend(a1, "deletePhotoWithCompletionHandler:", &__block_literal_global_3);
}

- (void)deletePhotoWithCompletionHandler:()Photos
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhotos:", 0);

  objc_msgSend(a1, "clearInMemoryCachedAvatars");
  objc_msgSend(a1, "daemonProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profileServicePrivate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deletePhotoWithHandler:", v4);

}

- (void)setPhoto:()Photos avatarType:withCompletionHandler:
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v8 = a3;
  v9 = a5;
  dispatch_get_global_queue(2, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__GKLocalPlayer_Photos__setPhoto_avatarType_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E59C4D08;
  v14 = v8;
  v15 = a1;
  v16 = v9;
  v17 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)setPhotoFromCNContactImage:()Photos pendingContact:withCompletionHandler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKLocalPlayer+Photos.m", 113, "-[GKLocalPlayer(Photos) setPhotoFromCNContactImage:pendingContact:withCompletionHandler:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dispatchGroupWithName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E59C4D58;
  v15 = v9;
  v22 = v15;
  v16 = v8;
  v23 = v16;
  v24 = a1;
  v17 = v13;
  v25 = v17;
  objc_msgSend(v17, "perform:", v21);
  if (v10)
  {
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke_4;
    v18[3] = &unk_1E59C4D80;
    v20 = v10;
    v19 = v17;
    objc_msgSend(v19, "notifyOnMainQueueWithBlock:", v18);

  }
}

- (void)deleteMonogramsWithHandler:()Photos
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  uint64_t v22;

  v4 = a3;
  objc_msgSend(a1, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKLocalPlayer+Photos.m", 165, "-[GKLocalPlayer(Photos) deleteMonogramsWithHandler:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dispatchGroupWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "internal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GKAvatarSubdirectoryNameForPlayerID();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      v15 = objc_msgSend((id)objc_opt_class(), "sizeForPhotoSize:", qword_1AB7F7EB0[v13]);
      v20[0] = v14;
      v20[1] = 3221225472;
      v20[2] = __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke;
      v20[3] = &unk_1E59C4DD0;
      v22 = v15;
      v16 = v12;
      v21 = v16;
      objc_msgSend(v9, "perform:", v20);

      ++v13;
    }
    while (v13 != 4);
    if (objc_msgSend(a1, "avatarType") == 1)
    {
      v19[0] = v14;
      v19[1] = 3221225472;
      v19[2] = __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_3;
      v19[3] = &unk_1E59C4A28;
      v19[4] = a1;
      objc_msgSend(v9, "perform:", v19);
    }
    if (v4)
    {
      v17[0] = v14;
      v17[1] = 3221225472;
      v17[2] = __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_16;
      v17[3] = &unk_1E59C4DA8;
      v18 = v4;
      objc_msgSend(v9, "notifyOnMainQueueWithBlock:", v17);

    }
  }

}

- (id)deleteAvatarAlertControllerWithHandler:()Photos
{
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = v6 == 1;
  v8 = (void *)MEMORY[0x1E0DC3450];
  GKGameCenterUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v10, v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __64__GKLocalPlayer_Photos__deleteAvatarAlertControllerWithHandler___block_invoke;
  v28[3] = &unk_1E59C4DF8;
  v28[4] = a1;
  v18 = v4;
  v29 = v18;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 2, v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v19);

  v20 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __64__GKLocalPlayer_Photos__deleteAvatarAlertControllerWithHandler___block_invoke_28;
  v26[3] = &unk_1E59C4E20;
  v27 = v18;
  v23 = v18;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v24);

  return v13;
}

@end
