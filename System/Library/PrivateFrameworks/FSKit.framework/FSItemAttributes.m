@implementation FSItemAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->attrs, 184, CFSTR("FSItemAttr"));

}

- (FSItemAttributes)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v17;
  objc_super v18;
  uint64_t v19;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FSItemAttributes;
  v19 = 0;
  v5 = -[FSItemAttributes init](&v18, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    v6 = objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("FSItemAttr"), &v19);
    if (v6 && v19 == 184)
    {
      v7 = *(_OWORD *)v6;
      v8 = *(_OWORD *)(v6 + 16);
      v9 = *(_OWORD *)(v6 + 32);
      *(_OWORD *)(v5 + 56) = *(_OWORD *)(v6 + 48);
      *(_OWORD *)(v5 + 40) = v9;
      *(_OWORD *)(v5 + 24) = v8;
      *(_OWORD *)(v5 + 8) = v7;
      v10 = *(_OWORD *)(v6 + 64);
      v11 = *(_OWORD *)(v6 + 80);
      v12 = *(_OWORD *)(v6 + 96);
      *(_OWORD *)(v5 + 120) = *(_OWORD *)(v6 + 112);
      *(_OWORD *)(v5 + 104) = v12;
      *(_OWORD *)(v5 + 88) = v11;
      *(_OWORD *)(v5 + 72) = v10;
      v13 = *(_OWORD *)(v6 + 128);
      v14 = *(_OWORD *)(v6 + 144);
      v15 = *(_OWORD *)(v6 + 160);
      *((_QWORD *)v5 + 23) = *(_QWORD *)(v6 + 176);
      *(_OWORD *)(v5 + 168) = v15;
      *(_OWORD *)(v5 + 152) = v14;
      *(_OWORD *)(v5 + 136) = v13;
    }
    else
    {

      v5 = 0;
    }
  }

  return (FSItemAttributes *)v5;
}

- (FSItemAttributes)init
{
  FSItemAttributes *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FSItemAttributes;
  result = -[FSItemAttributes init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->attrs.fa_int_flags = 0;
    result->attrs.fa_addedtime = 0u;
    result->attrs.fa_backuptime = 0u;
    result->attrs.fa_birthtime = 0u;
    result->attrs.fa_ctime = 0u;
    result->attrs.fa_mtime = 0u;
    result->attrs.fa_atime = 0u;
    *(_OWORD *)&result->attrs.fa_fileid = 0u;
    *(_OWORD *)&result->attrs.fa_size = 0u;
    *(_OWORD *)&result->attrs.fa_nlink = 0u;
    *(_OWORD *)&result->attrs.fa_seqno = 0u;
    *(_OWORD *)&result->attrs.__fa_rsvd0 = 0u;
  }
  return result;
}

- (FSItemAttributes)initWithLIAttributes:(const _LIFileAttributes *)a3
{
  FSItemAttributes *result;
  unint64_t fa_validmask;
  unint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FSItemAttributes;
  result = -[FSItemAttributes init](&v7, sel_init);
  if (result)
  {
    fa_validmask = a3->fa_validmask;
    result->attrs.fa_validmask = fa_validmask;
    v6 = a3->fa_validmask;
    if ((v6 & 1) != 0)
    {
      result->attrs.fa_type = a3->fa_type;
      if ((v6 & 2) == 0)
      {
LABEL_4:
        if ((v6 & 8) == 0)
          goto LABEL_5;
        goto LABEL_24;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_4;
    }
    result->attrs.fa_mode = a3->fa_mode;
    if ((v6 & 8) == 0)
    {
LABEL_5:
      if ((v6 & 4) == 0)
        goto LABEL_6;
      goto LABEL_25;
    }
LABEL_24:
    result->attrs.fa_uid = a3->fa_uid;
    if ((v6 & 4) == 0)
    {
LABEL_6:
      if ((v6 & 0x10) == 0)
        goto LABEL_7;
      goto LABEL_26;
    }
LABEL_25:
    result->attrs.fa_nlink = a3->fa_nlink;
    if ((v6 & 0x10) == 0)
    {
LABEL_7:
      if ((v6 & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_27;
    }
LABEL_26:
    result->attrs.fa_gid = a3->fa_gid;
    if ((v6 & 0x20) == 0)
    {
LABEL_8:
      if ((v6 & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_28;
    }
LABEL_27:
    result->attrs.fa_bsd_flags = a3->fa_bsd_flags;
    if ((v6 & 0x40) == 0)
    {
LABEL_9:
      if ((v6 & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_29;
    }
LABEL_28:
    result->attrs.fa_size = a3->fa_size;
    if ((v6 & 0x80) == 0)
    {
LABEL_10:
      if ((v6 & 0x100) == 0)
        goto LABEL_11;
      goto LABEL_30;
    }
LABEL_29:
    result->attrs.fa_allocsize = a3->fa_allocsize;
    if ((v6 & 0x100) == 0)
    {
LABEL_11:
      if ((v6 & 0x200) == 0)
        goto LABEL_12;
      goto LABEL_31;
    }
LABEL_30:
    result->attrs.fa_fileid = a3->fa_fileid;
    if ((v6 & 0x200) == 0)
    {
LABEL_12:
      if ((v6 & 0x400) == 0)
        goto LABEL_13;
      goto LABEL_32;
    }
LABEL_31:
    result->attrs.fa_parentid = a3->fa_parentid;
    if ((v6 & 0x400) == 0)
    {
LABEL_13:
      if ((v6 & 0x800) == 0)
        goto LABEL_14;
      goto LABEL_33;
    }
LABEL_32:
    result->attrs.fa_atime = a3->fa_atime;
    if ((v6 & 0x800) == 0)
    {
LABEL_14:
      if ((v6 & 0x1000) == 0)
        goto LABEL_15;
      goto LABEL_34;
    }
LABEL_33:
    result->attrs.fa_mtime = a3->fa_mtime;
    if ((v6 & 0x1000) == 0)
    {
LABEL_15:
      if ((v6 & 0x2000) == 0)
        goto LABEL_16;
      goto LABEL_35;
    }
LABEL_34:
    result->attrs.fa_ctime = a3->fa_ctime;
    if ((v6 & 0x2000) == 0)
    {
LABEL_16:
      if ((v6 & 0x4000) == 0)
        goto LABEL_17;
      goto LABEL_36;
    }
LABEL_35:
    result->attrs.fa_birthtime = a3->fa_birthtime;
    if ((v6 & 0x4000) == 0)
    {
LABEL_17:
      if ((v6 & 0x8000) == 0)
        goto LABEL_18;
      goto LABEL_37;
    }
LABEL_36:
    result->attrs.fa_backuptime = a3->fa_backuptime;
    if ((v6 & 0x8000) == 0)
    {
LABEL_18:
      if ((v6 & 0x10000) == 0)
      {
LABEL_20:
        result->attrs.fa_validmask = v6 | fa_validmask;
        return result;
      }
LABEL_19:
      result->attrs.fa_int_flags = a3->fa_int_flags;
      goto LABEL_20;
    }
LABEL_37:
    result->attrs.fa_addedtime = a3->fa_addedtime;
    if ((v6 & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  return result;
}

+ (id)requestWithLIAttributes:(const _LIFileAttributes *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithLIAttributes:", a3);
}

+ (id)requestWithData:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  if ((unint64_t)objc_msgSend(v4, "length") > 0xB7)
  {
    objc_msgSend(a1, "requestWithLIAttributes:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    fskit_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[FSItemAttributes requestWithData:].cold.1(v4, v6);

    v7 = 0;
  }

  return v7;
}

- (void)getLIAttributes:(_LIFileAttributes *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  timespec fa_atime;
  timespec fa_ctime;
  timespec fa_birthtime;
  timespec fa_backuptime;
  timespec fa_addedtime;

  v3 = *(_OWORD *)&self->attrs.__fa_rsvd0;
  v4 = *(_OWORD *)&self->attrs.fa_seqno;
  v5 = *(_OWORD *)&self->attrs.fa_size;
  *(_OWORD *)&a3->fa_nlink = *(_OWORD *)&self->attrs.fa_nlink;
  *(_OWORD *)&a3->fa_size = v5;
  *(_OWORD *)&a3->__fa_rsvd0 = v3;
  *(_OWORD *)&a3->fa_seqno = v4;
  v6 = *(_OWORD *)&self->attrs.fa_fileid;
  fa_atime = self->attrs.fa_atime;
  fa_ctime = self->attrs.fa_ctime;
  a3->fa_mtime = self->attrs.fa_mtime;
  a3->fa_ctime = fa_ctime;
  *(_OWORD *)&a3->fa_fileid = v6;
  a3->fa_atime = fa_atime;
  fa_birthtime = self->attrs.fa_birthtime;
  fa_backuptime = self->attrs.fa_backuptime;
  fa_addedtime = self->attrs.fa_addedtime;
  *(_QWORD *)&a3->fa_int_flags = *(_QWORD *)&self->attrs.fa_int_flags;
  a3->fa_backuptime = fa_backuptime;
  a3->fa_addedtime = fa_addedtime;
  a3->fa_birthtime = fa_birthtime;
}

- (void)setAttributeSeqno:(unint64_t)a3
{
  self->attrs.fa_seqno = a3;
}

- (void)invalidateAllProperties
{
  self->attrs.fa_validmask = 0;
}

- (BOOL)isValid:(int64_t)a3
{
  BOOL v3;
  int64_t v4;

  v3 = 0;
  if (a3 > 255)
  {
    if (a3 >= 0x4000)
    {
      if (a3 >= 0x10000)
      {
        if (a3 == 0x10000)
        {
          a3 = 0x2000;
        }
        else
        {
          if (a3 != 0x20000)
            return v3;
          a3 = 0x4000;
        }
      }
      else if (a3 == 0x4000)
      {
        a3 = 4096;
      }
      else
      {
        if (a3 != 0x8000)
          return v3;
        a3 = 1024;
      }
    }
    else if (a3 > 4095)
    {
      if (a3 == 4096)
      {
        a3 = 2048;
      }
      else
      {
        if (a3 != 0x2000)
          return v3;
        a3 = 0x8000;
      }
    }
    else if (a3 != 256 && a3 != 512)
    {
      return v3;
    }
    return (self->attrs.fa_validmask & a3) != 0;
  }
  if (a3 > 15)
  {
    if (a3 > 63)
    {
      if (a3 != 64 && a3 != 128)
        return v3;
    }
    else if (a3 == 16)
    {
      a3 = 4;
    }
    else if (a3 != 32)
    {
      return v3;
    }
    return (self->attrs.fa_validmask & a3) != 0;
  }
  v4 = a3 - 1;
  a3 = 8;
  switch(v4)
  {
    case 0:
      return (self->attrs.fa_validmask & a3) != 0;
    case 1:
      a3 = 16;
      return (self->attrs.fa_validmask & a3) != 0;
    case 3:
      a3 = 2;
      return (self->attrs.fa_validmask & a3) != 0;
    case 7:
      a3 = 1;
      return (self->attrs.fa_validmask & a3) != 0;
    default:
      return v3;
  }
  return v3;
}

- (unsigned)internalFlags
{
  NSObject *v3;

  if ((self->attrs.fa_validmask & 0x10000) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes internalFlags].cold.1();

  }
  return self->attrs.fa_int_flags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->attrs.fa_int_flags = a3;
  self->attrs.fa_validmask |= 0x10000uLL;
}

- (unsigned)uid
{
  NSObject *v3;

  if ((self->attrs.fa_validmask & 8) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes uid].cold.1();

  }
  return self->attrs.fa_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->attrs.fa_uid = a3;
  self->attrs.fa_validmask |= 8uLL;
}

- (unsigned)gid
{
  NSObject *v3;

  if ((self->attrs.fa_validmask & 0x10) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes gid].cold.1();

  }
  return self->attrs.fa_gid;
}

- (void)setGid:(unsigned int)a3
{
  self->attrs.fa_gid = a3;
  self->attrs.fa_validmask |= 0x10uLL;
}

- (unsigned)mode
{
  NSObject *v3;

  if ((self->attrs.fa_validmask & 2) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes mode].cold.1();

  }
  return self->attrs.fa_mode;
}

- (void)setMode:(unsigned int)a3
{
  self->attrs.fa_mode = a3;
  self->attrs.fa_validmask |= 2uLL;
}

- (unsigned)linkCount
{
  NSObject *v3;

  if ((self->attrs.fa_validmask & 4) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes linkCount].cold.1();

  }
  return self->attrs.fa_nlink;
}

- (void)setLinkCount:(unsigned int)a3
{
  self->attrs.fa_nlink = a3;
  self->attrs.fa_validmask |= 4uLL;
}

- (unsigned)flags
{
  NSObject *v3;

  if ((self->attrs.fa_validmask & 0x20) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes flags].cold.1();

  }
  return self->attrs.fa_bsd_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->attrs.fa_bsd_flags = a3;
  self->attrs.fa_validmask |= 0x20uLL;
}

- (BOOL)inhibitKOIO
{
  return (-[FSItemAttributes internalFlags](self, "internalFlags") & 1) == 0;
}

- (void)setInhibitKOIO:(BOOL)a3
{
  -[FSItemAttributes setInternalFlags:](self, "setInternalFlags:", self->attrs.fa_int_flags & 0xFFFFFFFE | !a3);
}

- (BOOL)supportsLimitedXAttrs
{
  return (-[FSItemAttributes internalFlags](self, "internalFlags") >> 2) & 1;
}

- (void)setSupportsLimitedXAttrs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  -[FSItemAttributes setInternalFlags:](self, "setInternalFlags:", self->attrs.fa_int_flags & 0xFFFFFFFB | v3);
}

- (unint64_t)size
{
  NSObject *v3;

  if ((self->attrs.fa_validmask & 0x40) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes size].cold.1();

  }
  return self->attrs.fa_size;
}

- (void)setSize:(unint64_t)a3
{
  self->attrs.fa_size = a3;
  self->attrs.fa_validmask |= 0x40uLL;
}

- (unint64_t)allocSize
{
  NSObject *v3;

  if ((self->attrs.fa_validmask & 0x80) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes allocSize].cold.1();

  }
  return self->attrs.fa_allocsize;
}

- (void)setAllocSize:(unint64_t)a3
{
  self->attrs.fa_allocsize = a3;
  self->attrs.fa_validmask |= 0x80uLL;
}

- (unint64_t)fileID
{
  NSObject *v3;

  if ((self->attrs.fa_validmask & 0x100) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes fileID].cold.1();

  }
  return self->attrs.fa_fileid;
}

- (void)setFileID:(unint64_t)a3
{
  self->attrs.fa_fileid = a3;
  self->attrs.fa_validmask |= 0x100uLL;
}

- (unint64_t)parentID
{
  NSObject *v3;

  if ((self->attrs.fa_validmask & 0x200) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes parentID].cold.1();

  }
  return self->attrs.fa_parentid;
}

- (void)setParentID:(unint64_t)a3
{
  self->attrs.fa_parentid = a3;
  self->attrs.fa_validmask |= 0x200uLL;
}

- (int64_t)type
{
  NSObject *v3;
  uint64_t v4;

  if ((self->attrs.fa_validmask & 1) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes type].cold.1();

  }
  v4 = self->attrs.fa_type - 1;
  if (v4 < 7)
    return v4 + 1;
  else
    return 0;
}

- (void)setType:(int64_t)a3
{
  unsigned int v3;

  if ((unint64_t)(a3 - 1) < 7)
    v3 = a3;
  else
    v3 = 0;
  self->attrs.fa_type = v3;
  self->attrs.fa_validmask |= 1uLL;
}

- (id)attrsData
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &self->attrs, 184);
}

- (timespec)modifyTime
{
  NSObject *v3;
  __darwin_time_t tv_sec;
  uint64_t tv_nsec;
  timespec result;

  if ((self->attrs.fa_validmask & 0x800) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes modifyTime].cold.1();

  }
  tv_sec = self->attrs.fa_mtime.tv_sec;
  tv_nsec = self->attrs.fa_mtime.tv_nsec;
  result.tv_nsec = tv_nsec;
  result.tv_sec = tv_sec;
  return result;
}

- (void)setModifyTime:(timespec)a3
{
  self->attrs.fa_mtime = a3;
  self->attrs.fa_validmask |= 0x800uLL;
}

- (timespec)accessTime
{
  NSObject *v3;
  __darwin_time_t tv_sec;
  uint64_t tv_nsec;
  timespec result;

  if ((self->attrs.fa_validmask & 0x400) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes accessTime].cold.1();

  }
  tv_sec = self->attrs.fa_atime.tv_sec;
  tv_nsec = self->attrs.fa_atime.tv_nsec;
  result.tv_nsec = tv_nsec;
  result.tv_sec = tv_sec;
  return result;
}

- (void)setAccessTime:(timespec)a3
{
  self->attrs.fa_atime = a3;
  self->attrs.fa_validmask |= 0x400uLL;
}

- (timespec)changeTime
{
  NSObject *v3;
  __darwin_time_t tv_sec;
  uint64_t tv_nsec;
  timespec result;

  if ((self->attrs.fa_validmask & 0x1000) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes changeTime].cold.1();

  }
  tv_sec = self->attrs.fa_ctime.tv_sec;
  tv_nsec = self->attrs.fa_ctime.tv_nsec;
  result.tv_nsec = tv_nsec;
  result.tv_sec = tv_sec;
  return result;
}

- (void)setChangeTime:(timespec)a3
{
  self->attrs.fa_ctime = a3;
  self->attrs.fa_validmask |= 0x1000uLL;
}

- (timespec)addedTime
{
  NSObject *v3;
  __darwin_time_t tv_sec;
  uint64_t tv_nsec;
  timespec result;

  if ((self->attrs.fa_validmask & 0x8000) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes addedTime].cold.1();

  }
  tv_sec = self->attrs.fa_addedtime.tv_sec;
  tv_nsec = self->attrs.fa_addedtime.tv_nsec;
  result.tv_nsec = tv_nsec;
  result.tv_sec = tv_sec;
  return result;
}

- (void)setAddedTime:(timespec)a3
{
  self->attrs.fa_addedtime = a3;
  self->attrs.fa_validmask |= 0x8000uLL;
}

- (timespec)backupTime
{
  NSObject *v3;
  __darwin_time_t tv_sec;
  uint64_t tv_nsec;
  timespec result;

  if ((self->attrs.fa_validmask & 0x4000) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes backupTime].cold.1();

  }
  tv_sec = self->attrs.fa_backuptime.tv_sec;
  tv_nsec = self->attrs.fa_backuptime.tv_nsec;
  result.tv_nsec = tv_nsec;
  result.tv_sec = tv_sec;
  return result;
}

- (void)setBackupTime:(timespec)a3
{
  self->attrs.fa_backuptime = a3;
  self->attrs.fa_validmask |= 0x4000uLL;
}

- (timespec)birthTime
{
  NSObject *v3;
  __darwin_time_t tv_sec;
  uint64_t tv_nsec;
  timespec result;

  if ((self->attrs.fa_validmask & 0x2000) == 0)
  {
    fskit_std_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[FSItemAttributes birthTime].cold.1();

  }
  tv_sec = self->attrs.fa_birthtime.tv_sec;
  tv_nsec = self->attrs.fa_birthtime.tv_nsec;
  result.tv_nsec = tv_nsec;
  result.tv_sec = tv_sec;
  return result;
}

- (void)setBirthTime:(timespec)a3
{
  self->attrs.fa_birthtime = a3;
  self->attrs.fa_validmask |= 0x2000uLL;
}

+ (void)requestWithData:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "length");
  _os_log_error_impl(&dword_23B2A6000, a2, OS_LOG_TYPE_ERROR, "requestWithData: passed NSData with only %lu bytes", (uint8_t *)&v3, 0xCu);
}

- (void)internalFlags
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid intflags", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)uid
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid uid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)gid
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid gid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)mode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)linkCount
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid nlink", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)flags
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid flags", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)size
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid size", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)allocSize
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid allocSize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)fileID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid fileID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)parentID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid parentid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)type
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)modifyTime
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid modify time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)accessTime
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid access time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)changeTime
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid change time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)addedTime
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid added time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)backupTime
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid backup time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)birthTime
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_23B2A6000, v0, v1, "Accessing invalid birth time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

@end
