@implementation NSURL(GKFriendRequestAddition)

+ (id)_gkGenerateFriendRequestURL:()GKFriendRequestAddition
{
  id v3;
  void *v4;
  id v5;
  void *v6;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  _QWORD v47[3];
  _QWORD v48[4];
  _QWORD v49[6];

  v49[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "friendSupportPageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3998]);
    objc_msgSend(v3, "friendSupportPageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "initWithString:", v6);

  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  }
  objc_msgSend(v3, "initiator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v48[0] = CFSTR("fc");
    objc_msgSend(v3, "friendCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v10;
    v48[1] = CFSTR("rqs");
    objc_msgSend(v3, "friendRequestState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v11;
    v48[2] = CFSTR("pn");
    objc_msgSend(v3, "initiator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v13;
    v48[3] = CFSTR("pid");
    objc_msgSend(v3, "initiator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "playerID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
    v17 = objc_claimAutoreleasedReturnValue();

    v45 = (void *)v17;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "compressedDataUsingAlgorithm:error:", 3, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v7;
    v21 = objc_alloc(MEMORY[0x1E0CB39D8]);
    objc_msgSend(v3, "friendRequestVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("vn"), v22);
    v47[0] = v23;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("zd"), v20);
    v47[1] = v24;
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("pid"), CFSTR("UnknownID"));
    v47[2] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQueryItems:", v26);

    objc_msgSend(v7, "URL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "absoluteString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    if (v29 >> 3 >= 0x271)
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v27, "absoluteString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v43, "length"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "absoluteString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("messages url is too long: %@ - %@"), v32, v33);
      v44 = v18;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKUtils+FriendRequest.m");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "lastPathComponent");
      v36 = v20;
      v37 = v19;
      v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ (generatedURL.absoluteString.length < messagesMaxURLLength)\n[%s (%s:%d)]"), v34, "+[NSURL(GKFriendRequestAddition) _gkGenerateFriendRequestURL:]", objc_msgSend(v38, "UTF8String"), 81);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v37;
      v20 = v36;

      v7 = v46;
      v18 = v44;

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v39);
    }

  }
  else
  {
    if (!os_log_GKGeneral)
      v40 = GKOSLoggers();
    v41 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      +[NSURL(GKFriendRequestAddition) _gkGenerateFriendRequestURL:].cold.1(v41);
    v27 = 0;
  }

  return v27;
}

+ (void)_gkGenerateFriendRequestURL:()GKFriendRequestAddition .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "Generate Friend Request URL display name is nil.", v1, 2u);
}

@end
