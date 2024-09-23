@implementation GEOAnalyticsDataServiceRemoteProxy

- (int)networkEventFileDescriptorForRepresentativeDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  const __CFString *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return -1;
  v3 = a3;
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 24, CFSTR("anayticsData"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  v17[0] = CFSTR("message");
  v17[1] = CFSTR("userInfo");
  v18[0] = CFSTR("analyticdata.readNetEventData");
  v15 = CFSTR("day");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendDictionaryWithMessageReplySync:error:", v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7 && (v9 = MEMORY[0x18D765A14](v7), v10 = MEMORY[0x1E0C812F8], v9 == MEMORY[0x1E0C812F8]))
  {
    xpc_dictionary_get_dictionary(v8, "userInfo");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12 && MEMORY[0x18D765A14](v12) == v10)
      v11 = xpc_dictionary_dup_fd(v13, "fd");
    else
      v11 = -1;

  }
  else
  {
    v11 = -1;
  }

  return v11;
}

- (int)requestResponseMetadataFileDescriptorForBatchID:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  const __CFString *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 24, CFSTR("anayticsData"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("message");
  v18[1] = CFSTR("userInfo");
  v19[0] = CFSTR("analyticdata.readReqRespMetadata");
  v16 = CFSTR("bid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendDictionaryWithMessageReplySync:error:", v7, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8 && (v10 = MEMORY[0x18D765A14](v8), v11 = MEMORY[0x1E0C812F8], v10 == MEMORY[0x1E0C812F8]))
  {
    xpc_dictionary_get_dictionary(v9, "userInfo");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13 && MEMORY[0x18D765A14](v13) == v11)
      v12 = xpc_dictionary_dup_fd(v14, "fd");
    else
      v12 = -1;

  }
  else
  {
    v12 = -1;
  }

  return v12;
}

@end
