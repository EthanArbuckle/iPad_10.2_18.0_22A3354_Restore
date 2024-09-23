@implementation BCSRealTimeFlagSignposter

+ (id)signposterForBCSType:(uint64_t)a1
{
  objc_opt_self();
  return -[BCSRealTimeSignposter _initWithType:signpostIdentifier:]([BCSRealTimeFlagSignposter alloc], "_initWithType:signpostIdentifier:", a2, a2);
}

+ (id)signposterForShardIdentifier:(uint64_t)a1
{
  id v2;
  BCSRealTimeFlagSignposter *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  v3 = [BCSRealTimeFlagSignposter alloc];
  v4 = objc_msgSend(v2, "type");

  return -[BCSRealTimeShardSignposter _initWithShardType:signpostIdentifier:](v3, "_initWithShardType:signpostIdentifier:", v4, v2);
}

+ (id)signposterForItemIdentifier:(uint64_t)a1
{
  id v2;
  BCSRealTimeFlagSignposter *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  v3 = [BCSRealTimeFlagSignposter alloc];
  v4 = objc_msgSend(v2, "type");

  return -[BCSRealTimeSignposter _initWithType:signpostIdentifier:](v3, "_initWithType:signpostIdentifier:", v4, v2);
}

- (void)flagMeasurementDidChange:(BOOL)a3 forMeasurement:(id)a4
{
  _BOOL4 v4;
  id v6;
  int64_t signposterType;
  NSObject *v8;
  int64_t v9;
  NSObject *v10;
  os_signpost_id_t v11;
  unint64_t v12;
  const char *v13;
  NSObject *v14;
  int64_t v15;
  unint64_t v16;
  NSObject *v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v4 = a3;
  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (self)
  {
    signposterType = self->_signposterType;
    switch(signposterType)
    {
      case 2:
        v35 = v6;
        ABSLogSignpost();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          if (v4)
            v31 = "_ItemCacheHit";
          else
            v31 = "_ItemCacheMiss";
          NSStringFromBCSType(-[BCSRealTimeSignposter type](self, "type"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v37 = v31;
          v38 = 2112;
          v39 = v32;
          _os_log_debug_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_DEBUG, "Signposting %s for type: %@", buf, 0x16u);

        }
        v15 = -[BCSRealTimeSignposter type](self, "type");
        ABSLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = -[BCSRealTimeSignposter signpostIdentifier](self, "signpostIdentifier");
        v16 = v11 - 1;
        if (v4)
        {
          if (v15 == 2)
          {
            if (v16 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
              goto LABEL_72;
            *(_WORD *)buf = 0;
            v13 = "BusinessLink_ItemCacheHit";
          }
          else
          {
            if (v16 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
              goto LABEL_72;
            *(_WORD *)buf = 0;
            v13 = "ChatSuggest_ItemCacheHit";
          }
        }
        else if (v15 == 2)
        {
          if (v16 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
            goto LABEL_72;
          *(_WORD *)buf = 0;
          v13 = "BusinessLink_ItemCacheMiss";
        }
        else
        {
          if (v16 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
            goto LABEL_72;
          *(_WORD *)buf = 0;
          v13 = "ChatSuggest_ItemCacheMiss";
        }
        goto LABEL_71;
      case 1:
        v35 = v6;
        ABSLogSignpost();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          if (v4)
            v33 = "_ShardCacheHit";
          else
            v33 = "_ShardCacheMiss";
          NSStringFromBCSShardType(-[BCSRealTimeShardSignposter shardType](self, "shardType"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v37 = v33;
          v38 = 2112;
          v39 = v34;
          _os_log_debug_impl(&dword_20ACAD000, v17, OS_LOG_TYPE_DEBUG, "Signposting %s for shard type: %@", buf, 0x16u);

        }
        v18 = -[BCSRealTimeShardSignposter shardType](self, "shardType") - 1;
        if (v4)
        {
          v6 = v35;
          switch(v18)
          {
            case 0:
              ABSLogCommon();
              v10 = objc_claimAutoreleasedReturnValue();
              v19 = -[BCSRealTimeSignposter signpostIdentifier](self, "signpostIdentifier");
              if (v19 - 1 > 0xFFFFFFFFFFFFFFFDLL)
                goto LABEL_72;
              v11 = v19;
              if (!os_signpost_enabled(v10))
                goto LABEL_72;
              *(_WORD *)buf = 0;
              v13 = "ChatSuggest_ShardCacheHit";
              goto LABEL_71;
            case 1:
              ABSLogCommon();
              v10 = objc_claimAutoreleasedReturnValue();
              v21 = -[BCSRealTimeSignposter signpostIdentifier](self, "signpostIdentifier");
              if (v21 - 1 > 0xFFFFFFFFFFFFFFFDLL)
                goto LABEL_72;
              v11 = v21;
              if (!os_signpost_enabled(v10))
                goto LABEL_72;
              *(_WORD *)buf = 0;
              v13 = "BusinessLink_ShardCacheHit";
              goto LABEL_71;
            case 2:
              ABSLogCommon();
              v10 = objc_claimAutoreleasedReturnValue();
              v22 = -[BCSRealTimeSignposter signpostIdentifier](self, "signpostIdentifier");
              if (v22 - 1 > 0xFFFFFFFFFFFFFFFDLL)
                goto LABEL_72;
              v11 = v22;
              if (!os_signpost_enabled(v10))
                goto LABEL_72;
              *(_WORD *)buf = 0;
              v13 = "BusinessDomain_ShardCacheHit";
              goto LABEL_71;
            case 3:
              ABSLogCommon();
              v10 = objc_claimAutoreleasedReturnValue();
              v23 = -[BCSRealTimeSignposter signpostIdentifier](self, "signpostIdentifier");
              if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL)
                goto LABEL_72;
              v11 = v23;
              if (!os_signpost_enabled(v10))
                goto LABEL_72;
              *(_WORD *)buf = 0;
              v13 = "BusinessCaller_ShardCacheHit";
              goto LABEL_71;
            case 4:
              ABSLogCommon();
              v10 = objc_claimAutoreleasedReturnValue();
              v24 = -[BCSRealTimeSignposter signpostIdentifier](self, "signpostIdentifier");
              if (v24 - 1 > 0xFFFFFFFFFFFFFFFDLL)
                goto LABEL_72;
              v11 = v24;
              if (!os_signpost_enabled(v10))
                goto LABEL_72;
              *(_WORD *)buf = 0;
              v13 = "BusinessEmail_ShardCacheHit";
              goto LABEL_71;
            default:
              goto LABEL_73;
          }
        }
        else
        {
          v6 = v35;
          switch(v18)
          {
            case 0:
              ABSLogCommon();
              v10 = objc_claimAutoreleasedReturnValue();
              v20 = -[BCSRealTimeSignposter signpostIdentifier](self, "signpostIdentifier");
              if (v20 - 1 > 0xFFFFFFFFFFFFFFFDLL)
                goto LABEL_72;
              v11 = v20;
              if (!os_signpost_enabled(v10))
                goto LABEL_72;
              *(_WORD *)buf = 0;
              v13 = "ChatSuggest_ShardCacheMiss";
              goto LABEL_71;
            case 1:
              ABSLogCommon();
              v10 = objc_claimAutoreleasedReturnValue();
              v25 = -[BCSRealTimeSignposter signpostIdentifier](self, "signpostIdentifier");
              if (v25 - 1 > 0xFFFFFFFFFFFFFFFDLL)
                goto LABEL_72;
              v11 = v25;
              if (!os_signpost_enabled(v10))
                goto LABEL_72;
              *(_WORD *)buf = 0;
              v13 = "BusinessLink_ShardCacheMiss";
              goto LABEL_71;
            case 2:
              ABSLogCommon();
              v10 = objc_claimAutoreleasedReturnValue();
              v26 = -[BCSRealTimeSignposter signpostIdentifier](self, "signpostIdentifier");
              if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL)
                goto LABEL_72;
              v11 = v26;
              if (!os_signpost_enabled(v10))
                goto LABEL_72;
              *(_WORD *)buf = 0;
              v13 = "BusinessDomain_ShardCacheMiss";
              goto LABEL_71;
            case 3:
              ABSLogCommon();
              v10 = objc_claimAutoreleasedReturnValue();
              v27 = -[BCSRealTimeSignposter signpostIdentifier](self, "signpostIdentifier");
              if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL)
                goto LABEL_72;
              v11 = v27;
              if (!os_signpost_enabled(v10))
                goto LABEL_72;
              *(_WORD *)buf = 0;
              v13 = "BusinessCaller_ShardCacheMiss";
              goto LABEL_71;
            case 4:
              ABSLogCommon();
              v10 = objc_claimAutoreleasedReturnValue();
              v28 = -[BCSRealTimeSignposter signpostIdentifier](self, "signpostIdentifier");
              if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL)
                goto LABEL_72;
              v11 = v28;
              if (!os_signpost_enabled(v10))
                goto LABEL_72;
              *(_WORD *)buf = 0;
              v13 = "BusinessEmail_ShardCacheMiss";
              goto LABEL_71;
            default:
              goto LABEL_73;
          }
        }
      case 0:
        v35 = v6;
        ABSLogSignpost();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          if (v4)
            v29 = "_ConfigCacheHit";
          else
            v29 = "_ConfigCacheMiss";
          NSStringFromBCSType(-[BCSRealTimeSignposter type](self, "type"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v37 = v29;
          v38 = 2112;
          v39 = v30;
          _os_log_debug_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEBUG, "Signposting %s for type: %@", buf, 0x16u);

        }
        v9 = -[BCSRealTimeSignposter type](self, "type");
        ABSLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = -[BCSRealTimeSignposter signpostIdentifier](self, "signpostIdentifier");
        v12 = v11 - 1;
        if (v4)
        {
          if (v9 == 2)
          {
            if (v12 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
              goto LABEL_72;
            *(_WORD *)buf = 0;
            v13 = "BusinessLink_ConfigCacheHit";
          }
          else
          {
            if (v12 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
              goto LABEL_72;
            *(_WORD *)buf = 0;
            v13 = "ChatSuggest_ConfigCacheHit";
          }
        }
        else if (v9 == 2)
        {
          if (v12 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
            goto LABEL_72;
          *(_WORD *)buf = 0;
          v13 = "BusinessLink_ConfigCacheMiss";
        }
        else
        {
          if (v12 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
            goto LABEL_72;
          *(_WORD *)buf = 0;
          v13 = "ChatSuggest_ConfigCacheMiss";
        }
LABEL_71:
        _os_signpost_emit_with_name_impl(&dword_20ACAD000, v10, OS_SIGNPOST_EVENT, v11, v13, (const char *)&unk_20AD230D5, buf, 2u);
LABEL_72:

        v6 = v35;
        break;
    }
  }
LABEL_73:

}

@end
