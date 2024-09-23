@implementation CMCaptureFrameSenderEndpointsServerSideSingleton

+ (BOOL)addEndpoint:(id)a3 endpointUniqueID:(id)a4 endpointType:(id)a5 endpointPID:(int)a6 endpointProxyPID:(int)a7 endpointAuditToken:(id)a8 endpointProxyAuditToken:(id)a9 endpointCameraUniqueID:(id)a10
{
  uint64_t v11;
  uint64_t v12;
  const __CFString *v16;
  char v17;

  v11 = *(_QWORD *)&a7;
  v12 = *(_QWORD *)&a6;
  os_unfair_lock_lock(&sServerSideEndpointsLock);
  if (cfs_serverSideEndpoints_initServerSiderEndpoints != -1)
    dispatch_once(&cfs_serverSideEndpoints_initServerSiderEndpoints, &__block_literal_global_161);
  v16 = CFSTR("unknown");
  if (a10)
    v16 = (const __CFString *)a10;
  v17 = objc_msgSend((id)sServerSideEndpoints, "addEndpoint:endpointUniqueID:endpointType:endpointPID:endpointProxyPID:endpointAuditToken:endpointProxyAuditToken:endpointCameraUniqueID:", a3, a4, a5, v12, v11, a8, a9, v16);
  os_unfair_lock_unlock(&sServerSideEndpointsLock);
  return v17;
}

+ (NSDictionary)endpointsByPID
{
  NSDictionary *v2;

  os_unfair_lock_lock(&sServerSideEndpointsLock);
  if (cfs_serverSideEndpoints_initServerSiderEndpoints != -1)
    dispatch_once(&cfs_serverSideEndpoints_initServerSiderEndpoints, &__block_literal_global_161);
  v2 = (NSDictionary *)objc_msgSend((id)sServerSideEndpoints, "endpointsByPID");
  os_unfair_lock_unlock(&sServerSideEndpointsLock);
  return v2;
}

+ (BOOL)removeAllEndpointsWithPID:(int)a3
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)&a3;
  os_unfair_lock_lock(&sServerSideEndpointsLock);
  if (cfs_serverSideEndpoints_initServerSiderEndpoints != -1)
    dispatch_once(&cfs_serverSideEndpoints_initServerSiderEndpoints, &__block_literal_global_161);
  v4 = objc_msgSend((id)sServerSideEndpoints, "removeAllEndpointsWithPID:", v3);
  os_unfair_lock_unlock(&sServerSideEndpointsLock);
  return v4;
}

+ (BOOL)removeEndpointWithUniqueID:(id)a3
{
  char v4;

  os_unfair_lock_lock(&sServerSideEndpointsLock);
  if (cfs_serverSideEndpoints_initServerSiderEndpoints != -1)
    dispatch_once(&cfs_serverSideEndpoints_initServerSiderEndpoints, &__block_literal_global_161);
  v4 = objc_msgSend((id)sServerSideEndpoints, "removeEndpointWithUniqueID:", a3);
  os_unfair_lock_unlock(&sServerSideEndpointsLock);
  return v4;
}

+ (id)createXPCArrayOfFrameSenderEndpoints
{
  void *v2;

  os_unfair_lock_lock(&sServerSideEndpointsLock);
  if (cfs_serverSideEndpoints_initServerSiderEndpoints != -1)
    dispatch_once(&cfs_serverSideEndpoints_initServerSiderEndpoints, &__block_literal_global_161);
  v2 = (void *)objc_msgSend((id)sServerSideEndpoints, "createXPCArrayOfFrameSenderEndpoints");
  os_unfair_lock_unlock(&sServerSideEndpointsLock);
  return v2;
}

@end
