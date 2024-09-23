@implementation _GEORemoteExternalRequestCounterTicket

+ (id)externalRequestCounterForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6 remoteProxy:(id)a7
{
  id v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS____GEORemoteExternalRequestCounterTicket;
  objc_msgSendSuper2(&v17, sel_externalRequestCounterForType_subtype_source_appId_, a3, a4, a5, a6);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    objc_storeStrong((id *)(v14 + 48), a7);

  return v15;
}

- (void)_incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11
{
  -[GEORequestCounterRemoteProxy _incrementExternalForApp:startTime:endTime:xmitBytes:recvBytes:usedInterfaces:requestType:requestSubtype:source:](self->_remoteProxy, "_incrementExternalForApp:startTime:endTime:xmitBytes:recvBytes:usedInterfaces:requestType:requestSubtype:source:", a3, a4, a5, a6, a7, a8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteProxy, 0);
}

@end
