@implementation BCSRealTimeTimingSignposter

+ (id)signposterForBCSType:(uint64_t)a1
{
  objc_opt_self();
  return -[BCSRealTimeSignposter _initWithType:signpostIdentifier:]([BCSRealTimeTimingSignposter alloc], "_initWithType:signpostIdentifier:", a2, a2);
}

+ (id)signposterForBCSType:(uint64_t)a3 signpostIdentifier:
{
  objc_opt_self();
  return -[BCSRealTimeSignposter _initWithType:signpostIdentifier:]([BCSRealTimeTimingSignposter alloc], "_initWithType:signpostIdentifier:", a2, a3);
}

+ (id)signposterForShardIdentifier:(uint64_t)a1
{
  id v2;
  BCSRealTimeTimingSignposter *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  v3 = [BCSRealTimeTimingSignposter alloc];
  v4 = objc_msgSend(v2, "type");

  return -[BCSRealTimeShardSignposter _initWithShardType:signpostIdentifier:](v3, "_initWithShardType:signpostIdentifier:", v4, v2);
}

+ (id)signposterForItemIdentifier:(uint64_t)a1
{
  id v2;
  BCSRealTimeTimingSignposter *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  v3 = [BCSRealTimeTimingSignposter alloc];
  v4 = objc_msgSend(v2, "type");

  return -[BCSRealTimeSignposter _initWithType:signpostIdentifier:](v3, "_initWithType:signpostIdentifier:", v4, v2);
}

- (void)timingMeasurementDidBegin:(id)a3
{
  switch(objc_msgSend(a3, "timingMeasurementType"))
  {
    case 0:
      -[BCSRealTimeTimingSignposter _handleCloudKitConfigFetch:](self, 0);
      break;
    case 1:
      -[BCSRealTimeTimingSignposter _handleCloudKitShardFetch:](self, 0);
      break;
    case 2:
      -[BCSRealTimeTimingSignposter _handleCloudKitItemFetch:](self, 0);
      break;
    case 3:
      -[BCSRealTimeTimingSignposter _handleCloudKitMegashardFetch:](self, 0);
      break;
    case 4:
      -[BCSRealTimeTimingSignposter _handleCloudKitConfigFetchAndDecode:](self, 0);
      break;
    case 5:
      -[BCSRealTimeTimingSignposter _handleCloudKitShardFetchAndDecode:](self, 0);
      break;
    case 6:
      -[BCSRealTimeTimingSignposter _handleCloudKitItemFetchAndDecode:](self, 0);
      break;
    case 7:
      -[BCSRealTimeTimingSignposter _handleCloudKitMegashardFetchAndDecode:](self, 0);
      break;
    case 8:
      -[BCSRealTimeTimingSignposter _handleConfigResolution:](self, 0);
      break;
    case 9:
      -[BCSRealTimeTimingSignposter _handleShardResolution:](self, 0);
      break;
    case 10:
      -[BCSRealTimeTimingSignposter _handleItemResolution:](self, 0);
      break;
    case 11:
    case 15:
    case 17:
      -[BCSRealTimeTimingSignposter _handleItemFetch:](self, 0);
      break;
    case 12:
      -[BCSRealTimeTimingSignposter _handleBusinessLinkChoppedFetch:](self, 0);
      break;
    case 13:
      -[BCSRealTimeTimingSignposter _handleBusinessLinkHashFetch:](self, 0);
      break;
    case 14:
    case 16:
      -[BCSRealTimeTimingSignposter _handleItemIsRegistered:](self, 0);
      break;
    case 18:
      -[BCSRealTimeTimingSignposter _handlePIRItemFetch:](self, 0);
      break;
    case 19:
      -[BCSRealTimeTimingSignposter _handleBlastDoorProcessing:](self, 0);
      break;
    default:
      return;
  }
}

- (void)_handleCloudKitConfigFetch:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_CloudKitFetchConfig";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchConfig";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchConfig";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchConfig";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchConfig";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchConfig";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchConfig";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchConfig";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchConfig";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleCloudKitShardFetch:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_CloudKitFetchShard";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchShard";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchShard";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchShard";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchShard";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchShard";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchShard";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchShard";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchShard";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleCloudKitItemFetch:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_CloudKitFetchBucket";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchBucket";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchBucket";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchBucket";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchBucket";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchBucket";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchBucket";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchBucket";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchBucket";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleCloudKitMegashardFetch:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_CloudKitFetchMegashard";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchMegashard";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchMegashard";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchMegashard";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchMegashard";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchMegashard";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchMegashard";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchMegashard";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchMegashard";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleCloudKitConfigFetchAndDecode:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_CloudKitFetchConfigAndDecode";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchConfigAndDecode";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchConfigAndDecode";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchConfigAndDecode";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchConfigAndDecode";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchConfigAndDecode";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchConfigAndDecode";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchConfigAndDecode";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchConfigAndDecode";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleCloudKitShardFetchAndDecode:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_CloudKitFetchShardAndDecode";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchShardAndDecode";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchShardAndDecode";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchShardAndDecode";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchShardAndDecode";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchShardAndDecode";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchShardAndDecode";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchShardAndDecode";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchShardAndDecode";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleCloudKitItemFetchAndDecode:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_CloudKitFetchBucketAndDecode";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchBucketAndDecode";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchBucketAndDecode";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchBucketAndDecode";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchBucketAndDecode";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchBucketAndDecode";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchBucketAndDecode";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchBucketAndDecode";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchBucketAndDecode";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleCloudKitMegashardFetchAndDecode:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_CloudKitFetchMegashardAndDecode";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchMegashardAndDecode";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchMegashardAndDecode";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchMegashardAndDecode";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchMegashardAndDecode";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_CloudKitFetchMegashardAndDecode";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_CloudKitFetchMegashardAndDecode";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_CloudKitFetchMegashardAndDecode";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_CloudKitFetchMegashardAndDecode";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleConfigResolution:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_ConfigResolution";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_ConfigResolution";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_ConfigResolution";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_ConfigResolution";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_ConfigResolution";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_ConfigResolution";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_ConfigResolution";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_ConfigResolution";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_ConfigResolution";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleShardResolution:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v10 = "didEnd";
      else
        v10 = "didBegin";
      NSStringFromBCSShardType(objc_msgSend(a1, "shardType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_ShardResolution";
      v22 = 2080;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for shard type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "shardType"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_42;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_42;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_ShardResolution";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_42;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_42;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_ShardResolution";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_42;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_42;
          LOWORD(v20) = 0;
          v8 = "BusinessDomain_ShardResolution";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v18 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_42;
          v7 = v18;
          if (!os_signpost_enabled(v5))
            goto LABEL_42;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_ShardResolution";
          break;
        case 5:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v19 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_42;
          v7 = v19;
          if (!os_signpost_enabled(v5))
            goto LABEL_42;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_ShardResolution";
          break;
        default:
          return;
      }
LABEL_41:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v5, OS_SIGNPOST_EVENT, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_42:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "shardType"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_42;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_42;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_ShardResolution";
          goto LABEL_41;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_42;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_42;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_ShardResolution";
          goto LABEL_41;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v13 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_42;
          v7 = v13;
          if (!os_signpost_enabled(v5))
            goto LABEL_42;
          LOWORD(v20) = 0;
          v8 = "BusinessDomain_ShardResolution";
          goto LABEL_41;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v14 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_42;
          v7 = v14;
          if (!os_signpost_enabled(v5))
            goto LABEL_42;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_ShardResolution";
          goto LABEL_41;
        case 5:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_42;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_42;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_ShardResolution";
          goto LABEL_41;
        default:
          return;
      }
    }
  }
}

- (void)_handleItemResolution:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_ItemResolution";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_ItemResolution";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_ItemResolution";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_ItemResolution";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_ItemResolution";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_ItemResolution";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_ItemResolution";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_ItemResolution";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_ItemResolution";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleItemFetch:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_ItemFetch";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_ItemFetch";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_ItemFetch";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_ItemFetch";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_ItemFetch";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_ItemFetch";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_ItemFetch";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_ItemFetch";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_ItemFetch";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleBusinessLinkChoppedFetch:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_ItemFetchChop";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_ItemFetchChop";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_ItemFetchChop";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_ItemFetchChop";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_ItemFetchChop";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_ItemFetchChop";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_ItemFetchChop";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_ItemFetchChop";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_ItemFetchChop";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleBusinessLinkHashFetch:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_ItemHashFetch";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_ItemHashFetch";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_ItemHashFetch";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_ItemHashFetch";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_ItemHashFetch";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_ItemHashFetch";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_ItemHashFetch";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_ItemHashFetch";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_ItemHashFetch";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleItemIsRegistered:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "IsEnabledCheck";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggestIsEnabledCheck";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLinkIsEnabledCheck";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCallerIsEnabledCheck";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmailIsEnabledCheck";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggestIsEnabledCheck";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLinkIsEnabledCheck";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCallerIsEnabledCheck";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmailIsEnabledCheck";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handleBlastDoorProcessing:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_BlastDoorProcessing";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_BlastDoorProcessing";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_BlastDoorProcessing";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_BlastDoorProcessing";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_BlastDoorProcessing";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_BlastDoorProcessing";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_BlastDoorProcessing";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_BlastDoorProcessing";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_BlastDoorProcessing";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)_handlePIRItemFetch:(void *)a1
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABSLogSignpost();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (a2)
        v18 = "didEnd";
      else
        v18 = "didBegin";
      NSStringFromBCSType(objc_msgSend(a1, "type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315650;
      v21 = "_PIRItemFetch";
      v22 = 2080;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_debug_impl(&dword_20ACAD000, v4, OS_LOG_TYPE_DEBUG, "Signposting %s %s for type: %@", (uint8_t *)&v20, 0x20u);

    }
    if (a2 == 1)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v9 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v9;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_PIRItemFetch";
          break;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v15 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v15;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_PIRItemFetch";
          break;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v16 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v16;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_PIRItemFetch";
          break;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v17 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v17;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_PIRItemFetch";
          break;
        default:
          return;
      }
      v13 = v5;
      v14 = OS_SIGNPOST_INTERVAL_END;
LABEL_33:
      _os_signpost_emit_with_name_impl(&dword_20ACAD000, v13, v14, v7, v8, (const char *)&unk_20AD230D5, (uint8_t *)&v20, 2u);
LABEL_34:

    }
    else if (!a2)
    {
      switch(objc_msgSend(a1, "type"))
      {
        case 1:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v6 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v6;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "ChatSuggest_PIRItemFetch";
          goto LABEL_22;
        case 2:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v10 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v10;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessLink_PIRItemFetch";
          goto LABEL_22;
        case 3:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v11 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v11;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessCaller_PIRItemFetch";
          goto LABEL_22;
        case 4:
          ABSLogCommon();
          v5 = objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "signpostIdentifier");
          if ((unint64_t)(v12 - 1) > 0xFFFFFFFFFFFFFFFDLL)
            goto LABEL_34;
          v7 = v12;
          if (!os_signpost_enabled(v5))
            goto LABEL_34;
          LOWORD(v20) = 0;
          v8 = "BusinessEmail_PIRItemFetch";
LABEL_22:
          v13 = v5;
          v14 = OS_SIGNPOST_INTERVAL_BEGIN;
          goto LABEL_33;
        default:
          return;
      }
    }
  }
}

- (void)timingMeasurementDidEnd:(id)a3
{
  switch(objc_msgSend(a3, "timingMeasurementType"))
  {
    case 0:
      -[BCSRealTimeTimingSignposter _handleCloudKitConfigFetch:](self, 1);
      break;
    case 1:
      -[BCSRealTimeTimingSignposter _handleCloudKitShardFetch:](self, 1);
      break;
    case 2:
      -[BCSRealTimeTimingSignposter _handleCloudKitItemFetch:](self, 1);
      break;
    case 3:
      -[BCSRealTimeTimingSignposter _handleCloudKitMegashardFetch:](self, 1);
      break;
    case 4:
      -[BCSRealTimeTimingSignposter _handleCloudKitConfigFetchAndDecode:](self, 1);
      break;
    case 5:
      -[BCSRealTimeTimingSignposter _handleCloudKitShardFetchAndDecode:](self, 1);
      break;
    case 6:
      -[BCSRealTimeTimingSignposter _handleCloudKitItemFetchAndDecode:](self, 1);
      break;
    case 7:
      -[BCSRealTimeTimingSignposter _handleCloudKitMegashardFetchAndDecode:](self, 1);
      break;
    case 8:
      -[BCSRealTimeTimingSignposter _handleConfigResolution:](self, 1);
      break;
    case 9:
      -[BCSRealTimeTimingSignposter _handleShardResolution:](self, 1);
      break;
    case 10:
      -[BCSRealTimeTimingSignposter _handleItemResolution:](self, 1);
      break;
    case 11:
    case 15:
    case 17:
      -[BCSRealTimeTimingSignposter _handleItemFetch:](self, 1);
      break;
    case 12:
      -[BCSRealTimeTimingSignposter _handleBusinessLinkChoppedFetch:](self, 1);
      break;
    case 13:
      -[BCSRealTimeTimingSignposter _handleBusinessLinkHashFetch:](self, 1);
      break;
    case 14:
    case 16:
      -[BCSRealTimeTimingSignposter _handleItemIsRegistered:](self, 1);
      break;
    case 18:
      -[BCSRealTimeTimingSignposter _handlePIRItemFetch:](self, 1);
      break;
    case 19:
      -[BCSRealTimeTimingSignposter _handleBlastDoorProcessing:](self, 1);
      break;
    default:
      return;
  }
}

@end
