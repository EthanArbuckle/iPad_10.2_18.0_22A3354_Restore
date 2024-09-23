@implementation FSVolume

- (BOOL)setupForPath:(id)a3 error:(id *)a4
{
  int v5;
  int v6;

  objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v5 = fpfs_open();
  v6 = v5;
  if (a4 && v5 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", *__error());
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 >= 0;
}

uint64_t __31__FSVolume_setupForPath_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  int v4;
  int *v5;
  int v6;
  uint64_t result;
  _OWORD v8[2];
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v11 = 0;
  v10 = xmmword_23B1CA558;
  if ((fstatfs(a2, (statfs *)(*(_QWORD *)(a1 + 32) + 8)) & 0x80000000) == 0)
  {
    v9 = 0;
    memset(v8, 0, sizeof(v8));
    if ((getattrlist((const char *)(*(_QWORD *)(a1 + 32) + 96), &v10, v8, 0x28uLL, 0x21u) & 0x80000000) == 0)
    {
      if ((~DWORD2(v8[0]) & 0x180000) != 0
        || (~HIDWORD(v8[0]) & 0x90000) != 0
        || (v3 = *(_QWORD *)(a1 + 32), v4 = *(_DWORD *)(v3 + 72), (v4 & 0x1000) == 0))
      {
        v5 = __error();
        v6 = 19;
      }
      else
      {
        if ((v4 & 1) == 0)
        {
          result = 0;
          *(_DWORD *)(v3 + 2176) = DWORD1(v8[0]);
          return result;
        }
        v5 = __error();
        v6 = 30;
      }
      *v5 = v6;
    }
  }
  return 0xFFFFFFFFLL;
}

- (id)freeSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FSVolume mountPath](self, "mountPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesOfFileSystemForPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D18]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)totalSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FSVolume mountPath](self, "mountPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesOfFileSystemForPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D28]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)mountPath
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), self->_stfs.f_mntonname);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>, device:'%s' mounted-on:'%s' fstype:%s"), objc_opt_class(), self, self->_stfs.f_mntfromname, self->_stfs.f_mntonname, self->_stfs.f_fstypename);
}

- (NSUUID)eventStreamUUID
{
  return (NSUUID *)+[FSVolume eventStreamUUIDForDevice:](FSVolume, "eventStreamUUIDForDevice:", self->_deviceID);
}

+ (id)eventStreamUUIDForDevice:(int)a3
{
  const __CFUUID *v3;
  const __CFUUID *v4;
  CFStringRef v5;
  void *v6;

  v3 = FSEventsCopyUUIDForDevice(a3);
  if (v3)
  {
    v4 = v3;
    v5 = CFUUIDCreateString(0, v3);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v5);
    CFRelease(v5);
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int)deviceID
{
  return self->_deviceID;
}

- (unint64_t)rootFileID
{
  return self->_rootFileID;
}

@end
