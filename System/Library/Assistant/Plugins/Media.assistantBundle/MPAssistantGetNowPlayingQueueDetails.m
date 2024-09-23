@implementation MPAssistantGetNowPlayingQueueDetails

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  id v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  void *v17;
  dispatch_queue_t v18;
  dispatch_group_t v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  dispatch_time_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  dispatch_time_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  NSString *v43;
  NSString *v44;
  NSObject *v45;
  NSString *v46;
  void *v47;
  NSObject *v48;
  _QWORD block[5];
  id v50;
  id v51;
  uint64_t *v52;
  _QWORD v53[4];
  id v54;
  NSObject *v55;
  _QWORD v56[4];
  id v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  void *v62;
  MPAssistantGetNowPlayingQueueDetails *v63;
  NSObject *v64;
  uint64_t *v65;
  _QWORD v66[4];
  id v67;
  MPAssistantGetNowPlayingQueueDetails *v68;
  NSObject *v69;
  id v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t buf[4];
  NSString *v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantGetNowPlayingQueueDetails aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Get Now Playing Queue Details"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v4;
    v10 = self->_requestAceHash;
    -[MPAssistantGetNowPlayingQueueDetails hashedRouteUIDs](self, "hashedRouteUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = -[MPAssistantGetNowPlayingQueueDetails previousItemCount](self, "previousItemCount");
    v14 = -[MPAssistantGetNowPlayingQueueDetails nextItemCount](self, "nextItemCount");
    -[MPAssistantGetNowPlayingQueueDetails preemptiveNowPlayingQueueDetailsTimeOut](self, "preemptiveNowPlayingQueueDetailsTimeOut");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v77 = v10;
    v78 = 2048;
    v79 = v12;
    v80 = 2048;
    v81 = v13;
    v82 = 2048;
    v83 = v14;
    v84 = 2114;
    v85 = v15;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Get Now Playing Queue Details (invoke) <%{public}@>: %lu UIDs, prev %ld, next %ld, timeout %{public}@", buf, 0x34u);

    v4 = v9;
  }

  v16 = self->_requestAceHash;
  -[MPAssistantGetNowPlayingQueueDetails hashedRouteUIDs](self, "hashedRouteUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Get Now Playing Queue Details"), v16, v17);

  v18 = dispatch_queue_create("com.apple.Assistant.GetNowPlayingQueueDetails", 0);
  v19 = dispatch_group_create();
  -[MPAssistantGetNowPlayingQueueDetails hashedRouteUIDs](self, "hashedRouteUIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count") == 1;

  v22 = MEMORY[0x1E0C809B0];
  if (v21)
  {
    v23 = objc_alloc_init(MEMORY[0x1E0D4B310]);
    -[MPAssistantGetNowPlayingQueueDetails hashedRouteUIDs](self, "hashedRouteUIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v22;
    v66[1] = 3221225472;
    v66[2] = sub_1CC9A1378;
    v66[3] = &unk_1E88E3798;
    v25 = v23;
    v67 = v25;
    v68 = self;
    v70 = v4;
    v69 = v19;
    v71 = &v72;
    objc_msgSend(v25, "decodeHashedRouteUIDs:completion:", v24, v66);

  }
  else
  {
    dispatch_group_enter(v19);
    v59 = v22;
    v60 = 3221225472;
    v61 = sub_1CC9A15AC;
    v62 = &unk_1E88E37C0;
    v63 = self;
    v65 = &v72;
    v64 = v19;
    MRAVEndpointGetMyGroupLeaderWithTimeout();

  }
  v26 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v19, v26);
  if (v73[3])
  {
    v27 = v4;
    v48 = v18;
    v28 = objc_alloc_init(MEMORY[0x1E0D882D8]);
    dispatch_group_enter(v19);
    v29 = -[MPAssistantGetNowPlayingQueueDetails previousItemCount](self, "previousItemCount");
    v30 = -[MPAssistantGetNowPlayingQueueDetails previousItemCount](self, "previousItemCount");
    v31 = -v29;
    v32 = v73[3];
    v56[0] = v22;
    v56[1] = 3221225472;
    v56[2] = sub_1CC9A1700;
    v56[3] = &unk_1E88E3C80;
    v33 = v28;
    v57 = v33;
    v34 = v19;
    v58 = v34;
    -[MPAssistantGetNowPlayingQueueDetails getSAMPMediaItems:origin:completion:](self, "getSAMPMediaItems:origin:completion:", v31, v30, v32, v56);
    v35 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v34, v35);
    dispatch_group_enter(v34);
    v36 = -[MPAssistantGetNowPlayingQueueDetails nextItemCount](self, "nextItemCount");
    v37 = v73[3];
    v53[0] = v22;
    v53[1] = 3221225472;
    v53[2] = sub_1CC9A172C;
    v53[3] = &unk_1E88E3C80;
    v38 = v33;
    v54 = v38;
    v39 = v34;
    v55 = v39;
    -[MPAssistantGetNowPlayingQueueDetails getSAMPMediaItems:origin:completion:](self, "getSAMPMediaItems:origin:completion:", 0, v36, v37, v53);
    block[0] = v22;
    block[1] = 3221225472;
    block[2] = sub_1CC9A1758;
    block[3] = &unk_1E88E37E8;
    v52 = &v72;
    block[4] = self;
    v50 = v38;
    v4 = v27;
    v51 = v27;
    v40 = v38;
    dispatch_group_notify(v39, MEMORY[0x1E0C80D38], block);

    v18 = v48;
    v41 = v57;
  }
  else
  {
    v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("timed out"));
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantGetNowPlayingQueueDetails aceId](self, "aceId");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Get Now Playing Queue Details"), v42);
      v43 = (NSString *)objc_claimAutoreleasedReturnValue();
      v44 = self->_requestAceHash;
      self->_requestAceHash = v43;

    }
    _MPLogCategoryAssistant();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = self->_requestAceHash;
      objc_msgSend(v40, "dictionary");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v77 = v46;
      v78 = 2114;
      v79 = (uint64_t)v47;
      _os_log_impl(&dword_1CC97B000, v45, OS_LOG_TYPE_ERROR, "Get Now Playing Queue Details (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    objc_msgSend(v40, "dictionary");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v41);
  }

  _Block_object_dispose(&v72, 8);
}

- (void)getSAMPMediaItems:(id)a3 origin:(void *)a4 completion:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v7;
  const void *v8;
  const void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;
  int64_t v14;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a5;
  v8 = (const void *)MRPlaybackQueueRequestCreate();
  MRPlaybackQueueRequestSetIncludeMetadata();
  v9 = (const void *)MRNowPlayingPlayerPathCreate();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1CC9A120C;
  v11[3] = &unk_1E88E3810;
  v13 = var0;
  v14 = var1;
  v12 = v7;
  v10 = v7;
  MEMORY[0x1D17B027C](v8, v9, MEMORY[0x1E0C80D38], v11);
  CFRelease(v8);
  CFRelease(v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
