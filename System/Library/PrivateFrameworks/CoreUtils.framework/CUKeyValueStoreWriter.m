@implementation CUKeyValueStoreWriter

- (CUKeyValueStoreWriter)init
{
  CUKeyValueStoreWriter *v2;
  CUKeyValueStoreWriter *v3;
  CUKeyValueStoreWriter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUKeyValueStoreWriter;
  v2 = -[CUKeyValueStoreWriter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_tempFD = -1;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[CUKeyValueStoreWriter cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CUKeyValueStoreWriter;
  -[CUKeyValueStoreWriter dealloc](&v3, sel_dealloc);
}

- (BOOL)startAtPath:(id)a3 error:(id *)a4
{
  id v6;
  NSString *v7;
  NSString *finalPath;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int tempFD;
  BOOL v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *tempPath;

  v6 = a3;
  v7 = (NSString *)objc_msgSend(v6, "copy");
  finalPath = self->_finalPath;
  self->_finalPath = v7;

  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".XXXXXX"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "getCString:maxLength:encoding:", self->_tempPath, 1024, 4) & 1) == 0)
  {
    if (a4)
    {
      v20 = "No file path";
      v21 = 4294960592;
LABEL_22:
      NSErrorWithOSStatusF(v21, (uint64_t)v20, v10, v11, v12, v13, v14, v15, (uint64_t)tempPath);
LABEL_23:
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_17:
    v19 = 0;
    goto LABEL_24;
  }
  v16 = mkstemp(self->_tempPath);
  if (v16 < 0)
  {
    if (a4)
    {
      if (*__error())
        v28 = *__error();
      else
        v28 = 4294960596;
      NSErrorWithOSStatusF(v28, (uint64_t)"Open temp file failed '%s'", v22, v23, v24, v25, v26, v27, (uint64_t)self->_tempPath);
      goto LABEL_23;
    }
    goto LABEL_17;
  }
  v17 = v16;
  tempFD = self->_tempFD;
  if ((tempFD & 0x80000000) == 0 && close(tempFD) && *__error())
    __error();
  self->_tempFD = v17;
  self->_cdb.head = 0;
  self->_cdb.hash = 0;
  self->_cdb.split = 0;
  self->_cdb.numentries = 0;
  self->_cdb.fd = v17;
  self->_cdb.pos = 2048;
  self->_cdb.b.x = self->_cdb.bspace;
  self->_cdb.b.fd = v17;
  self->_cdb.b.op = MEMORY[0x1E0C85D40];
  *(_QWORD *)&self->_cdb.b.p = 0x200000000000;
  if (lseek(v17, 2048, 0) == -1)
  {
    -[CUKeyValueStoreWriter cancel](self, "cancel");
    if (a4)
    {
      if (*__error())
        v21 = *__error();
      else
        v21 = 4294960596;
      tempPath = self->_tempPath;
      v20 = "Open failed '%s'";
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  v19 = 1;
  self->_cdbStarted = 1;
LABEL_24:

  return v19;
}

- (BOOL)finishAndReturnError:(id *)a3
{
  BOOL *p_cdbStarted;
  cdb_make *p_cdb;
  cdb_hplist *i;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;
  uint64_t v13;
  uint32x4_t v14;
  unsigned int v15;
  int v16;
  cdb_hp *v17;
  unsigned int v18;
  uint64_t v19;
  cdb_hplist *j;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  char *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t k;
  unsigned int v28;
  char *v29;
  unsigned int v30;
  int v31;
  _DWORD *v32;
  uint64_t v33;
  cdb_hp *hash;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  int v39;
  unsigned int pos;
  int tempFD;
  uint64_t v42;
  const std::__fs::filesystem::path *v43;
  std::error_code *v44;
  const std::__fs::filesystem::path *v45;
  _BOOL4 v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _DWORD __src[2];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  p_cdbStarted = &self->_cdbStarted;
  if (self->_cdbStarted)
  {
    p_cdb = &self->_cdb;
    bzero(self->_cdb.count, 0x400uLL);
    for (i = self->_cdb.head; i; i = (cdb_hplist *)*((_QWORD *)i + 1000))
    {
      v8 = *((int *)i + 2002);
      if ((_DWORD)v8)
      {
        v9 = v8 - 1;
        v10 = (unsigned __int8 *)i + 8 * v8 - 8;
        do
        {
          v11 = *v10;
          v10 -= 8;
          ++p_cdb->count[v11];
        }
        while ((_DWORD)v9--);
      }
    }
    v13 = 0;
    v14.i64[0] = 0x100000001;
    v14.i64[1] = 0x100000001;
    do
    {
      v14 = vmaxq_u32((uint32x4_t)vaddq_s32(*(int32x4_t *)&self->_cdb.count[v13], *(int32x4_t *)&self->_cdb.count[v13]), v14);
      v13 += 4;
    }
    while (v13 != 256);
    v15 = vmaxvq_u32(v14);
    if ((self->_cdb.numentries + v15) >> 29)
    {
LABEL_10:
      *__error() = 12;
    }
    else
    {
      v17 = (cdb_hp *)malloc_type_malloc(8 * (self->_cdb.numentries + v15), 0x100004000313F17uLL);
      self->_cdb.split = v17;
      if (v17)
      {
        v18 = 0;
        self->_cdb.hash = (cdb_hp *)((char *)v17 + 8 * self->_cdb.numentries);
        v19 = 0x3FFFFFFFFFFFFF00;
        do
        {
          v18 += self->_cdb.start[v19];
          self->_cdb.start[v19 + 256] = v18;
          ++v19;
        }
        while (v19 * 4);
        for (j = self->_cdb.head; j; j = (cdb_hplist *)*((_QWORD *)j + 1000))
        {
          v21 = *((int *)j + 2002);
          if ((_DWORD)v21)
          {
            v22 = v21 - 1;
            v23 = (unsigned __int8 *)j + 8 * v21 - 8;
            do
            {
              v24 = &p_cdb->bspace[4 * *v23];
              v25 = *((_DWORD *)v24 + 2816) - 1;
              *((_DWORD *)v24 + 2816) = v25;
              v26 = *(_QWORD *)v23;
              v23 -= 8;
              *((_QWORD *)self->_cdb.split + v25) = v26;
              LODWORD(v24) = v22--;
            }
            while ((_DWORD)v24);
          }
        }
        for (k = 0; k != 256; ++k)
        {
          v28 = p_cdb->count[k];
          v29 = &self->_cdb.final[8 * k];
          *(_DWORD *)v29 = self->_cdb.pos;
          v30 = 2 * v28;
          *((_WORD *)v29 + 2) = __PAIR16__((2 * v28) >> 24, 2 * v28);
          v29[6] = v28 >> 15;
          v29[7] = v28 >> 23;
          if (2 * v28)
            bzero(self->_cdb.hash, 16 * v28);
          if (v28)
          {
            v31 = 0;
            v32 = (_DWORD *)((char *)self->_cdb.split + 8 * p_cdb->start[k]);
            do
            {
              v33 = (*v32 >> 8) % v30;
              hash = self->_cdb.hash;
              while (*((_DWORD *)hash + 2 * v33 + 1))
              {
                if ((_DWORD)v33 + 1 == v30)
                  v33 = 0;
                else
                  v33 = (v33 + 1);
              }
              v35 = *(_QWORD *)v32;
              v32 += 2;
              *((_QWORD *)hash + v33) = v35;
              ++v31;
            }
            while (v31 != v28);
            if (v30)
            {
              v36 = 0;
              v37 = 8 * v30;
              do
              {
                v38 = (int *)((char *)self->_cdb.hash + v36);
                v39 = *v38;
                LODWORD(v38) = v38[1];
                __src[0] = v39;
                __src[1] = (_DWORD)v38;
                if (buffer_putalign((uint64_t)&self->_cdb.b, (char *)__src, 8uLL) == -1)
                  goto LABEL_40;
                pos = self->_cdb.pos;
                if (pos >= 0xFFFFFFF8)
                  goto LABEL_10;
                self->_cdb.pos = pos + 8;
                v36 += 8;
              }
              while (v37 != v36);
            }
          }
        }
        if (buffer_flush((uint64_t *)&self->_cdb.b) != -1 && lseek(self->_cdb.fd, 0, 0) != -1)
        {
          v16 = buffer_putflush((uint64_t)&self->_cdb.b, (uint64_t)self->_cdb.final);
          goto LABEL_41;
        }
      }
    }
LABEL_40:
    v16 = -1;
  }
  else
  {
    v16 = 0;
  }
LABEL_41:
  tempFD = self->_tempFD;
  if ((tempFD & 0x80000000) == 0)
  {
    if (close(tempFD) && *__error())
      __error();
    self->_tempFD = -1;
  }
  if (v16)
  {
    v42 = 0xFFFFFFFFLL;
  }
  else
  {
    v43 = -[NSString UTF8String](self->_finalPath, "UTF8String");
    if (v43 && (v46 = p_cdbStarted[20], v45 = (const std::__fs::filesystem::path *)(p_cdbStarted + 20), v46))
    {
      rename(v45, v43, v44);
      if (!v47)
        goto LABEL_53;
      if (!*__error())
      {
        v42 = 4294960596;
        goto LABEL_55;
      }
      v42 = *__error();
      if (!(_DWORD)v42)
      {
LABEL_53:
        v42 = 0;
        v45->__pn_.__r_.__value_.__s.__data_[0] = 0;
      }
    }
    else
    {
      v42 = 4294960592;
    }
  }
LABEL_55:
  -[CUKeyValueStoreWriter cancel](self, "cancel");
  if (a3 && (_DWORD)v42)
  {
    if (*__error())
      v54 = *__error();
    else
      v54 = 4294960596;
    NSErrorWithOSStatusF(v54, (uint64_t)"Finish failed: %#m", v48, v49, v50, v51, v52, v53, v42);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (_DWORD)v42 == 0;
}

- (void)cancel
{
  BOOL *p_cdbStarted;
  cdb_hp *split;
  cdb_hplist *head;
  cdb_hplist *v6;
  int tempFD;
  const char *v8;
  _BOOL4 v9;

  p_cdbStarted = &self->_cdbStarted;
  if (self->_cdbStarted)
  {
    split = self->_cdb.split;
    if (split)
    {
      free(split);
      self->_cdb.split = 0;
    }
    head = self->_cdb.head;
    if (head)
    {
      do
      {
        v6 = (cdb_hplist *)*((_QWORD *)head + 1000);
        free(head);
        self->_cdb.head = v6;
        head = v6;
      }
      while (v6);
    }
    *p_cdbStarted = 0;
  }
  tempFD = self->_tempFD;
  if ((tempFD & 0x80000000) == 0)
  {
    if (close(tempFD) && *__error())
      __error();
    self->_tempFD = -1;
  }
  v9 = p_cdbStarted[20];
  v8 = (const char *)(p_cdbStarted + 20);
  if (v9)
  {
    unlink(v8);
    *v8 = 0;
  }
}

- (BOOL)addKey:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  unint64_t v27;
  id v28;
  BOOL v29;
  id v30;
  char *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  unint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  size_t v51;
  uint64_t addend;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  id v78;
  unint64_t v79;
  id v80;
  id v81;
  unint64_t v82;
  int __src;
  __int16 v84;
  char v85;
  char v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v15 = a4;
  if (self->_cdbStarted)
  {
    v82 = 0;
    v16 = objc_retainAutorelease(v8);
    v81 = 0;
    v17 = (char *)objc_msgSend(v16, "encodedBytesAndReturnLength:error:", &v82, &v81);
    v18 = v81;
    v25 = v18;
    if (v17)
    {
      v26 = 0;
      v27 = v82;
      goto LABEL_4;
    }
    if (v18)
    {
      if (a5)
      {
LABEL_11:
        v28 = objc_retainAutorelease(v25);
        v25 = v28;
        v29 = 0;
        v26 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      v80 = 0;
      objc_msgSend(v16, "encodedDataAndReturnError:", &v80);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v80;
      v25 = v42;
      if (v41)
      {
        v26 = objc_retainAutorelease(v41);
        v17 = (char *)objc_msgSend(v26, "bytes");
        v27 = objc_msgSend(v26, "length");
        v82 = v27;
LABEL_4:
        if (HIDWORD(v27))
        {
          if (!a5)
          {
            v29 = 0;
            goto LABEL_54;
          }
          NSErrorWithOSStatusF(4294960591, (uint64_t)"Key too big %zu vs %u", v19, v20, v21, v22, v23, v24, v27);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          v29 = 0;
LABEL_12:
          *a5 = v28;
LABEL_54:

          goto LABEL_55;
        }
        v79 = 0;
        v30 = objc_retainAutorelease(v15);
        v78 = v25;
        v31 = (char *)objc_msgSend(v30, "encodedBytesAndReturnLength:error:", &v79, &v78);
        v32 = v78;

        if (v31)
        {
          v39 = 0;
          v40 = v79;
LABEL_15:
          if (!HIDWORD(v40))
          {
            v75 = v39;
            v51 = v82;
            __src = v82;
            v84 = v40;
            v85 = BYTE2(v40);
            v86 = BYTE3(v40);
            addend = buffer_putalign((uint64_t)&self->_cdb.b, (char *)&__src, 8uLL);
            if ((_DWORD)addend != -1)
            {
              addend = buffer_putalign((uint64_t)&self->_cdb.b, v17, v51);
              if ((_DWORD)addend != -1)
              {
                addend = buffer_putalign((uint64_t)&self->_cdb.b, v31, v40);
                if ((_DWORD)addend != -1)
                {
                  if ((_DWORD)v51)
                  {
                    v59 = 5381;
                    v60 = v51;
                    do
                    {
                      v61 = *v17++;
                      v59 = (33 * v59) ^ v61;
                      --v60;
                    }
                    while (v60);
                    v62 = v51;
                    v63 = v40;
                  }
                  else
                  {
                    v62 = 0;
                    v63 = v40;
                    v59 = 5381;
                  }
                  addend = cdb_make_addend((uint64_t)self->_cdb.bspace, v62, v63, v59);
                }
              }
            }
            v29 = (_DWORD)addend == 0;
            v39 = v75;
            if (!a5 || !(_DWORD)addend)
              goto LABEL_53;
            NSErrorWithOSStatusF(addend, (uint64_t)"Add failed", v53, v54, v55, v56, v57, v58, v74);
            goto LABEL_51;
          }
          if (a5)
          {
            NSErrorWithOSStatusF(4294960591, (uint64_t)"Value too big %zu vs %u", v33, v34, v35, v36, v37, v38, v40);
LABEL_51:
            v50 = (id)objc_claimAutoreleasedReturnValue();
            v29 = 0;
            goto LABEL_52;
          }
          v29 = 0;
LABEL_53:

          v25 = v32;
          goto LABEL_54;
        }
        if (v32)
        {
          if (a5)
          {
            v49 = v32;
            goto LABEL_25;
          }
          v29 = 0;
        }
        else
        {
          v77 = 0;
          objc_msgSend(v30, "encodedDataAndReturnError:", &v77);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v77;
          if (v65)
          {
            v39 = objc_retainAutorelease(v65);
            v31 = (char *)objc_msgSend(v39, "bytes");
            v40 = objc_msgSend(v39, "length");
            v79 = v40;
            v32 = v76;
            goto LABEL_15;
          }
          if (!a5)
          {
            v29 = 0;
            v39 = 0;
            v32 = v76;
            goto LABEL_53;
          }
          v49 = v76;
          if (v76)
          {
LABEL_25:
            v50 = objc_retainAutorelease(v49);
            v32 = v50;
            v29 = 0;
            v39 = 0;
LABEL_52:
            *a5 = v50;
            goto LABEL_53;
          }
          NSErrorWithOSStatusF(4294960534, (uint64_t)"Encode value failed", v66, v67, v68, v69, v70, v71, v74);
          v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *a5 = v72;

          v29 = 0;
          v32 = 0;
        }
        v39 = 0;
        goto LABEL_53;
      }
      if (a5)
      {
        if (v42)
          goto LABEL_11;
        NSErrorWithOSStatusF(4294960534, (uint64_t)"Encode key failed", v43, v44, v45, v46, v47, v48, v74);
        v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a5 = v64;

      }
    }
    v29 = 0;
    v26 = 0;
    goto LABEL_54;
  }
  if (a5)
  {
    NSErrorWithOSStatusF(4294960551, (uint64_t)"Not started", v9, v10, v11, v12, v13, v14, v74);
    v29 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
LABEL_55:

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalPath, 0);
}

@end
