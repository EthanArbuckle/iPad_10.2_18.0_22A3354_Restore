@implementation CRKFTSEntry

- (CRKFTSEntry)initWithFTSEntry:(_ftsent *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  CRKFTSEntry *v9;
  CRKFTSEntry *v10;
  uint64_t v11;
  NSString *path;
  stat *fts_statp;
  __int128 v14;
  timespec st_atimespec;
  timespec st_ctimespec;
  timespec st_birthtimespec;
  __int128 v18;
  __int128 v19;
  void *v22;
  objc_super v23;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKFTSEntry.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("FTSEntry"));

  }
  -[CRKFTSEntry errorForFTSEntry:](self, "errorForFTSEntry:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)CRKFTSEntry;
    v10 = -[CRKFTSEntry init](&v23, sel_init);
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3->fts_accpath);
      v11 = objc_claimAutoreleasedReturnValue();
      path = v10->_path;
      v10->_path = (NSString *)v11;

      fts_statp = a3->fts_statp;
      *(_OWORD *)&v10->_stat.st_dev = *(_OWORD *)&fts_statp->st_dev;
      v14 = *(_OWORD *)&fts_statp->st_uid;
      st_atimespec = fts_statp->st_atimespec;
      st_ctimespec = fts_statp->st_ctimespec;
      v10->_stat.st_mtimespec = fts_statp->st_mtimespec;
      v10->_stat.st_ctimespec = st_ctimespec;
      *(_OWORD *)&v10->_stat.st_uid = v14;
      v10->_stat.st_atimespec = st_atimespec;
      st_birthtimespec = fts_statp->st_birthtimespec;
      v18 = *(_OWORD *)&fts_statp->st_size;
      v19 = *(_OWORD *)fts_statp->st_qspare;
      *(_OWORD *)&v10->_stat.st_blksize = *(_OWORD *)&fts_statp->st_blksize;
      *(_OWORD *)v10->_stat.st_qspare = v19;
      v10->_stat.st_birthtimespec = st_birthtimespec;
      *(_OWORD *)&v10->_stat.st_size = v18;
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (id)errorForFTSEntry:(_ftsent *)a3
{
  unsigned int fts_info;
  BOOL v4;
  int v5;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  fts_info = a3->fts_info;
  v4 = fts_info > 0xA;
  v5 = (1 << fts_info) & 0x490;
  if (v4 || v5 == 0)
  {
    if (a3->fts_accpath)
    {
      return 0;
    }
    else
    {
      v10 = CFSTR("kCRKFilePathErrorKey");
      v11[0] = CFSTR("<nil>");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CRKErrorWithCodeAndUserInfo(19, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      return v9;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], a3->fts_errno, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (NSString)path
{
  return self->_path;
}

- (stat)stat
{
  __int128 v3;
  timespec st_ctimespec;
  timespec v5;
  timespec st_atimespec;

  v3 = *(_OWORD *)self->st_qspare;
  *(_OWORD *)&retstr->st_size = *(_OWORD *)&self->st_blksize;
  *(_OWORD *)&retstr->st_blksize = v3;
  *(_OWORD *)retstr->st_qspare = *(_OWORD *)&self[1].st_dev;
  st_ctimespec = self->st_ctimespec;
  retstr->st_atimespec = self->st_mtimespec;
  retstr->st_mtimespec = st_ctimespec;
  v5 = *(timespec *)&self->st_size;
  retstr->st_ctimespec = self->st_birthtimespec;
  retstr->st_birthtimespec = v5;
  st_atimespec = self->st_atimespec;
  *(_OWORD *)&retstr->st_dev = *(_OWORD *)&self->st_uid;
  *(timespec *)&retstr->st_uid = st_atimespec;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
