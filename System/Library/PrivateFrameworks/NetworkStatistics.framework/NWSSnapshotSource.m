@implementation NWSSnapshotSource

- (NWSSnapshotSource)init
{
  NWSSnapshotSource *v2;
  int v3;
  int v4;
  NWSSnapshotSource *v5;
  int v6;
  int v8;
  _BYTE v9[20];
  uint64_t v10;
  int v11;
  objc_super v12;
  _OWORD v13[6];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)NWSSnapshotSource;
  v2 = -[NWSSnapshotSource init](&v12, sel_init);
  if (!v2)
    goto LABEL_10;
  v3 = socket(32, 2, 2);
  if (v3 != -1)
  {
    v4 = v3;
    v8 = 1;
    if (!setsockopt(v3, 0xFFFF, 4130, &v8, 4u))
    {
      v14 = 0;
      memset(v13, 0, sizeof(v13));
      __strlcpy_chk();
      if (ioctl(v4, 0xC0644E03uLL, v13) != -1)
      {
        v10 = 0;
        *(_QWORD *)&v9[12] = 0;
        v11 = 0;
        *(_DWORD *)v9 = 139296;
        *(_DWORD *)&v9[4] = v13[0];
        *(_DWORD *)&v9[8] = 0;
        if (!connect(v4, (const sockaddr *)v9, 0x20u))
        {
          v6 = fcntl(v4, 3, 0);
          if (fcntl(v4, 4, v6 | 4u) != -1)
          {
            v2->_sockFd = v4;
LABEL_10:
            v5 = v2;
            goto LABEL_11;
          }
        }
      }
    }
    close(v4);
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  close(self->_sockFd);
  v3.receiver = self;
  v3.super_class = (Class)NWSSnapshotSource;
  -[NWSSnapshotSource dealloc](&v3, sel_dealloc);
}

- (int64_t)send:(void *)a3 length:(unint64_t)a4 err:(int *)a5
{
  ssize_t v6;
  int64_t v7;
  int v8;

  v6 = send(self->_sockFd, a3, a4, 0);
  v7 = v6;
  if (a5)
  {
    if (v6 < 0)
      v8 = *__error();
    else
      v8 = 0;
    *a5 = v8;
  }
  return v7;
}

- (int64_t)recv:(void *)a3 length:(unint64_t)a4 err:(int *)a5
{
  ssize_t v6;
  int64_t v7;
  int v8;

  v6 = recv(self->_sockFd, a3, a4, 0);
  v7 = v6;
  if (a5)
  {
    if (v6 < 0)
      v8 = *__error();
    else
      v8 = 0;
    *a5 = v8;
  }
  return v7;
}

+ (id)routeSnapshotForIPv4Host:(sockaddr_in *)a3 viaInterfaceIndex:(int)a4
{
  uint64_t v4;
  NWSSnapshotSource *v6;
  void *v7;
  NWSRouteSnapshotter *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  v6 = objc_alloc_init(NWSSnapshotSource);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:]([NWSRouteSnapshotter alloc], "initWithSource:dest:mask:ifindex:", v6, v7, 0, v4);
  -[NWSRouteSnapshotter snapshot](v8, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)routeSnapshotForIPv6Host:(sockaddr_in6 *)a3 viaInterfaceIndex:(int)a4
{
  uint64_t v4;
  NWSSnapshotSource *v6;
  void *v7;
  NWSRouteSnapshotter *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  v6 = objc_alloc_init(NWSSnapshotSource);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, 28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NWSRouteSnapshotter initWithSource:dest:mask:ifindex:]([NWSRouteSnapshotter alloc], "initWithSource:dest:mask:ifindex:", v6, v7, 0, v4);
  -[NWSRouteSnapshotter snapshot](v8, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
