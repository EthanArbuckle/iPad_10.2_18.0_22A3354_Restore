@implementation _GEOLocalExternalRequestCounterTicket

+ (id)externalRequestCounterForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6 persistence:(id)a7
{
  id v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS____GEOLocalExternalRequestCounterTicket;
  objc_msgSendSuper2(&v17, sel_externalRequestCounterForType_subtype_source_appId_, a3, a4, a5, a6);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    objc_storeStrong((id *)(v14 + 48), a7);

  return v15;
}

- (void)_incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  GEOGetExternalRequestLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v24 = v23;
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 138414338;
    v28 = v16;
    v29 = 2048;
    v30 = v24;
    v31 = 2048;
    v32 = v25;
    v33 = 2048;
    v34 = a6;
    v35 = 2048;
    v36 = a7;
    v37 = 2048;
    v38 = a8;
    v39 = 2112;
    v40 = v19;
    v41 = 2112;
    v42 = v20;
    v43 = 2112;
    v44 = v21;
    _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_INFO, "A:%@,SD:%.6f,ED:%.6f,S:%lld,R:%lld,I:%lu,RT:%@,RS:%@,S:%@", buf, 0x5Cu);
  }

  -[GEORequestCounterPersistence incrementExternalForApp:startTime:endTime:xmitBytes:recvBytes:usedInterfaces:requestType:requestSubtype:source:](self->_persistence, "incrementExternalForApp:startTime:endTime:xmitBytes:recvBytes:usedInterfaces:requestType:requestSubtype:source:", v16, v17, v18, a6, a7, a8, v19, v20, v21);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_requestSubtype, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
}

@end
