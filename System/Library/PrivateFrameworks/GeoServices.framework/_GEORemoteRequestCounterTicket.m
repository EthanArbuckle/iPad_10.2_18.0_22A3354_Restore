@implementation _GEORemoteRequestCounterTicket

+ (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5 remoteProxy:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "requestCounterTicketForType:auditToken:traits:", a3, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    objc_storeStrong((id *)(v13 + 136), a6);

  return v14;
}

- (void)_incrementForApp:(id)a3 offlineCohortId:(id)a4 requestMode:(int)a5 startTime:(id)a6 endTime:(id)a7 requestType:(id)a8 result:(unsigned __int8)a9 error:(id)a10 xmitBytes:(int64_t)a11 recvBytes:(int64_t)a12 usedInterfaces:(unint64_t)a13
{
  -[GEORequestCounterRemoteProxy _incrementForApp:offlineCohortId:requestMode:startTime:endTime:requestType:result:error:xmitBytes:recvBytes:usedInterfaces:](self->_remoteProxy, "_incrementForApp:offlineCohortId:requestMode:startTime:endTime:requestType:result:error:xmitBytes:recvBytes:usedInterfaces:", a3, a4, *(_QWORD *)&a5, a6, a7, a8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteProxy, 0);
}

@end
