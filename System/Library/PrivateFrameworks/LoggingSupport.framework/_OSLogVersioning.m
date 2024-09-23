@implementation _OSLogVersioning

- (_OSLogVersioning)initWithCollection:(id)a3 closeOnRelease:(BOOL)a4 error:(id *)a5
{
  id v9;
  _OSLogVersioning *v10;
  _OSLogVersioning *v11;
  id v12;
  void *v13;
  int v14;
  size_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int *v25;
  _OSLogVersioning *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  uint64_t version;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v40;
  size_t v41;
  _QWORD v42[2];
  uint64_t (*v43)(uint64_t, uint64_t);
  void *v44;
  uint64_t *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  char __s1[1024];
  stat v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v40.receiver = self;
  v40.super_class = (Class)_OSLogVersioning;
  v10 = -[_OSLogVersioning init](&v40, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_40:
    v26 = v11;
    goto LABEL_41;
  }
  objc_storeStrong((id *)&v10->_lcr, a3);
  v11->_closeOnRelease = a4;
  v12 = v9;
  objc_msgSend(v12, "diagnosticsDirectoryReference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileDescriptor");

  v41 = 0;
  if (fcntl(v14, 50, __s1) == -1)
    goto LABEL_17;
  if (_os_trace_shared_paths_init_once != -1)
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  v15 = strlen((const char *)_os_trace_persist_path);
  if (!strncmp(__s1, (const char *)_os_trace_persist_path, v15))
  {
    v24 = 0;
LABEL_28:
    v11->_version = v24;
    goto LABEL_29;
  }
  v16 = (void *)_os_trace_mmap_at();
  if (!v16)
  {
    if (*__error() == 2)
    {
      memset(&v53, 0, sizeof(v53));
      if (fstatat(v14, "FaultsAndErrors", &v53, 0) || (v53.st_mode & 0xF000) != 0x4000)
      {
        v48 = 0;
        v49 = &v48;
        v50 = 0x2020000000;
        v51 = 0;
        v47 = 0;
        v27 = _os_trace_mmap_at();
        v28 = v27;
        if (v27)
        {
          v29 = v47;
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v43 = ___OSIsAncientArchive_block_invoke;
          v44 = &unk_1E4157568;
          v45 = &v48;
          v46 = v27;
          v30 = v42;
          v31 = 0;
          do
          {
            if (v29 - v31 < 0x10)
              break;
            v32 = *(_QWORD *)(v28 + v31 + 8);
            if (v29 - 16 - v31 < v32)
              break;
            if (!((unsigned int (*)(_QWORD *))v43)(v30))
              break;
            v31 = (v31 + v32 + 23) & 0xFFFFFFFFFFFFFFF8;
          }
          while (v31 - 1 < v29);

        }
        v33 = *((unsigned __int8 *)v49 + 24);
        _Block_object_dispose(&v48, 8);
        v24 = -1;
        if (v33)
          v24 = 1;
      }
      else
      {
        v24 = 1;
      }
      goto LABEL_28;
    }
LABEL_17:
    v25 = __error();
    _OSLogFailWithPOSIXError((id)*v25, a5);

    goto LABEL_18;
  }
  v17 = objc_alloc(MEMORY[0x1E0C99D50]);
  v18 = (void *)objc_msgSend(v17, "initWithBytesNoCopy:length:freeWhenDone:", v16, v41, 0);
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v18, 0, 0, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  munmap(v16, v41);
  if (v19)
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("OSArchiveVersion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 == 0;

    if (!v21)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("OSArchiveVersion"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_version = objc_msgSend(v22, "integerValue");

      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("EndTimeRef"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_hasEndTimeRef = v23 != 0;

LABEL_29:
      version = v11->_version;
      v35 = 1;
      if (version)
      {
        v36 = 2;
        v37 = 3;
        if (version >= 5)
          v37 = 0;
        if (version != -1)
          v36 = v37;
        if ((unint64_t)(version - 3) >= 3)
          v38 = v36;
        else
          v38 = 1;
        if (version != 5)
          v35 = v38;
      }
      v11->_state = v35;
      goto LABEL_40;
    }
  }
  _OSLogFailWithPOSIXError((id)0x16, a5);

LABEL_18:
  v26 = 0;
LABEL_41:

  return v26;
}

- (_OSLogVersioning)initWithCollection:(id)a3 error:(id *)a4
{
  return -[_OSLogVersioning initWithCollection:closeOnRelease:error:](self, "initWithCollection:closeOnRelease:error:", a3, 0, a4);
}

- (_OSLogVersioning)initWithURL:(id)a3 error:(id *)a4
{
  void *v6;
  _OSLogVersioning *v7;

  +[_OSLogCollectionReference referenceWithURL:error:](_OSLogCollectionReference, "referenceWithURL:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[_OSLogVersioning initWithCollection:closeOnRelease:error:](self, "initWithCollection:closeOnRelease:error:", v6, 1, a4);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_closeOnRelease)
    -[_OSLogCollectionReference close](self->_lcr, "close");
  v3.receiver = self;
  v3.super_class = (Class)_OSLogVersioning;
  -[_OSLogVersioning dealloc](&v3, sel_dealloc);
}

- (BOOL)performDestructiveUpdates:(id *)a3
{
  int64_t version;
  int64_t v6;
  void *v7;
  int v8;
  FTS *v9;
  int v10;
  int v11;
  _QWORD *v12;
  uint64_t v13;
  const char *v14;
  int v15;
  int v16;
  _DWORD *v17;
  int v18;
  FTSENT *i;
  int fts_info;
  char *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const unsigned __int8 *v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  int v39;
  int v41;
  uint64_t v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  BOOL result;
  uint64_t v52;
  id *v53;
  FTS *v54;
  int *v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  int64_t v60;
  id *v61;
  int64_t v62;
  _OSLogVersioning *v63;
  _OSLogCollectionReference *v64;
  size_t v65[4];
  char *v66[2];
  _BYTE v67[1024];
  char __str[1024];
  uuid_t v69;
  char *v70;
  uint64_t v71;
  size_t *v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (!_os_trace_device_unlocked_since_boot())
  {
    v52 = 1;
    v53 = a3;
LABEL_92:
    _OSLogFailWithPOSIXError((id)v52, v53);
    return 0;
  }
  version = self->_version;
  if (version == -1)
    goto LABEL_104;
  if (version <= 4)
    v6 = 4;
  else
    v6 = self->_version;
  v60 = v6 + 1;
  v61 = a3;
  v62 = v6;
  v63 = self;
  do
  {
    if (version == 2)
    {
      v64 = self->_lcr;
      -[_OSLogCollectionReference diagnosticsDirectoryReference](v64, "diagnosticsDirectoryReference");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "fileDescriptor");

      if (fcntl(v8, 50, v67) == -1)
      {
        __error();
        _os_assumes_log();
      }
      v66[0] = v67;
      v66[1] = 0;
      v9 = fts_open(v66, 2132, 0);
      if (!v9)
        goto LABEL_94;
      v10 = openat(v8, "timesync", 0);
      if (v10 == -1)
      {
        if (*__error() != 2)
        {
          v10 = -1;
LABEL_96:
          v54 = v9;
LABEL_97:
          v55 = __error();
          _OSLogFailWithPOSIXError((id)*v55, v61);
          if (v10 != -1 && close(v10) == -1)
          {
            v58 = *__error();
            v59 = *__error();
            if (v58 == 9)
            {
              qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
              qword_1EE52EA88 = v59;
              __break(1u);
            }
            _os_assumes_log();
            __error();
            _os_assert_log();
            result = _os_crash();
            __break(1u);
            return result;
          }
          if (v9)
            fts_close(v54);

          return 0;
        }
      }
      else
      {
        v11 = _os_trace_fdscandir_b();
        if (v11 >= 1)
        {
          v12 = 0;
          v13 = 8 * v11;
          while (1)
          {
            v14 = (const char *)(*v12 + 21);
            if (strcmp(v14, "."))
            {
              if (strcmp(v14, "..") && unlinkat(v10, v14, 0) == -1)
                break;
            }
            if ((_QWORD *)v13 == ++v12)
              goto LABEL_18;
          }
          __error();
          _os_assert_log();
          _os_crash();
          __break(1u);
LABEL_94:
          v54 = 0;
          v10 = -1;
          goto LABEL_97;
        }
LABEL_18:
        _os_trace_scandir_free_namelist();
        if (unlinkat(v8, "timesync", 128) == -1)
          goto LABEL_103;
        if (close(v10) == -1)
          goto LABEL_106;
      }
      if (mkdirat(v8, "timesync", 0x1EDu) == -1)
      {
        __error();
        _os_assert_log();
        _os_crash();
        __break(1u);
LABEL_103:
        __error();
        _os_assert_log();
        _os_crash();
        __break(1u);
LABEL_104:
        _os_assert_log();
        v42 = _os_crash();
        __break(1u);
LABEL_105:
        qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1EE52EA88 = v42;
        __break(1u);
LABEL_106:
        v56 = *__error();
        v57 = *__error();
        if (v56 == 9)
        {
          qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_1EE52EA88 = v57;
          __break(1u);
        }
        _os_assumes_log();
        __error();
        _os_assert_log();
        _os_crash();
        __break(1u);
      }
      v15 = openat(v8, "timesync", 0);
      if (v15 == -1)
        goto LABEL_96;
      v16 = v15;
      v17 = (_DWORD *)_os_trace_zalloc();
      memset(__str, 170, 26);
      snprintf(__str, 0x1AuLL, "%016llx.timesync", 1);
      v18 = openat(v16, __str, 1537, 420);
      if (v18 < 0)
      {
        free(v17);
        v17 = 0;
      }
      else
      {
        *v17 = v18;
        uuid_clear((unsigned __int8 *)v17 + 4);
        *((_QWORD *)v17 + 3) = _os_trace_calloc();
        *((_OWORD *)v17 + 2) = xmmword_19EA7F290;
      }
      for (i = fts_read(v9); i; i = fts_read(v9))
      {
        fts_info = i->fts_info;
        if (fts_info == 8)
        {
          v21 = strrchr(i->fts_name, 46);
          if (v21)
          {
            if (!strcmp(v21, ".tracev3"))
            {
              v65[0] = 0;
              v22 = _os_trace_mmap_at();
              if (v22)
              {
                v23 = (unsigned __int8 *)v22;
                v24 = 0;
                v25 = v65[0];
                *(_QWORD *)__str = MEMORY[0x1E0C809B0];
                *(_QWORD *)&__str[8] = 0x40000000;
                *(_QWORD *)&__str[16] = ___timesync_convert_tracev3_block_invoke;
                *(_QWORD *)&__str[24] = &__block_descriptor_tmp_69;
                *(_QWORD *)&__str[32] = v17;
                do
                {
                  if (v25 - v24 < 0x10)
                    break;
                  v26 = *(_QWORD *)&v23[v24 + 8];
                  if (v25 - v24 - 16 < v26)
                    break;
                  if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))&__str[16])((uint64_t)__str, &v23[v24]))break;
                  v24 = (v24 + v26 + 23) & 0xFFFFFFFFFFFFFFF8;
                }
                while (v24 - 1 < v25);
                munmap(v23, v65[0]);
              }
            }
          }
        }
        else if (fts_info == 1 && i->fts_level == 1 && !strcmp(i->fts_name, "FaultsAndErrors"))
        {
          fts_set(v9, i, 4);
        }
      }
      fts_close(v9);
      qsort_b(*((void **)v17 + 3), *((_QWORD *)v17 + 4), 0x40uLL, &__block_literal_global_73);
      v27 = operator new();
      *(_OWORD *)v27 = 0u;
      *(_OWORD *)(v27 + 16) = 0u;
      *(_DWORD *)(v27 + 32) = 1065353216;
      v28 = *((_QWORD *)v17 + 4);
      if (v28)
      {
        v29 = 0;
        v30 = 0;
        v31 = *((_QWORD *)v17 + 3);
        do
        {
          v32 = _os_trace_uuid_map_lookup((_QWORD *)v27, (_QWORD *)(v31 + v29 + 8));
          if (!v32)
          {
            v32 = *(_QWORD *)(v27 + 24) + 1;
            _os_trace_uuid_map_insert((float *)v27, (uint64_t *)(v31 + v29 + 8), v32);
            v31 = *((_QWORD *)v17 + 3);
            v28 = *((_QWORD *)v17 + 4);
          }
          *(_QWORD *)(v31 + v29) = v32;
          ++v30;
          v29 += 64;
        }
        while (v30 < v28);
      }
      _os_trace_uuid_map_destroy((void **)v27);
      qsort_b(*((void **)v17 + 3), *((_QWORD *)v17 + 4), 0x40uLL, &__block_literal_global_4);
      memset(v69, 0, sizeof(v69));
      self = v63;
      if (*((_QWORD *)v17 + 4))
      {
        v33 = 0;
        v34 = (const unsigned __int8 *)(*((_QWORD *)v17 + 3) + 32);
        v35 = 1;
        do
        {
          if (*(_QWORD *)v69 == *((_QWORD *)v34 - 3) && *(_QWORD *)&v69[8] == *((_QWORD *)v34 - 2))
          {
            v36 = *((_QWORD *)v34 + 3);
            if (v36 != v33)
            {
              *(_QWORD *)__str = 2126676;
              *(_QWORD *)&__str[8] = v36;
              *(_QWORD *)&__str[16] = 1000000000 * *((_QWORD *)v34 - 1) + 1000 * *(int *)v34;
              *(_QWORD *)&__str[24] = *((_QWORD *)v34 + 1);
              if (_os_trace_write() == -1)
              {
                __error();
                _os_assumes_log();
                v39 = -1;
              }
              else
              {
                v39 = 0;
              }
              if (v39)
                break;
            }
          }
          else
          {
            *(_DWORD *)__str = 3193776;
            memset(&__str[4], 0, 20);
            *(_QWORD *)&__str[24] = *((_QWORD *)v34 + 2);
            *(_QWORD *)&__str[32] = 1000000000 * *((_QWORD *)v34 - 1)
                                  + 1000 * *(int *)v34
                                  - *((_QWORD *)v34 + 3)
                                  * (unint64_t)*(unsigned int *)&__str[24]
                                  / HIDWORD(*(_QWORD *)&__str[24]);
            *(_QWORD *)&__str[40] = *((_QWORD *)v34 + 1);
            uuid_copy((unsigned __int8 *)&__str[8], v34 - 24);
            v65[0] = 2126676;
            v65[1] = *((_QWORD *)v34 + 3);
            v65[2] = 1000000000 * *((_QWORD *)v34 - 1) + 1000 * *(int *)v34;
            v65[3] = *((_QWORD *)v34 + 1);
            v70 = __str;
            v71 = 48;
            v72 = v65;
            v73 = 32;
            if (_os_trace_writev() == -1)
            {
              __error();
              _os_assumes_log();
              v37 = -1;
            }
            else
            {
              v37 = 0;
            }
            uuid_copy(v69, v34 - 24);
            if (v37)
              break;
          }
          v33 = *((_QWORD *)v34 + 3);
          v34 += 64;
        }
        while (v35++ < *((_QWORD *)v17 + 4));
      }
      if (!lseek(*v17, 0, 2))
      {
        memset(__str, 170, sizeof(__str));
        if (fcntl(*v17, 50, __str) == -1)
        {
          __error();
          _os_assumes_log();
        }
        if (unlink(__str) == -1)
        {
          __error();
          _os_assumes_log();
        }
      }
      if (close(*v17) == -1)
      {
        v41 = *__error();
        v42 = *__error();
        if (v41 == 9)
          goto LABEL_105;
        _os_assumes_log();
      }
      free(*((void **)v17 + 3));
      free(v17);

      v6 = v62;
      version = 2;
    }
  }
  while (version++ != v6);
  -[_OSLogCollectionReference diagnosticsDirectoryReference](self->_lcr, "diagnosticsDirectoryReference");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "fileDescriptor");

  v45 = openat(v44, "Info.plist", 514, 420);
  if ((_DWORD)v45 == -1)
  {
    v52 = *__error();
    v53 = v61;
    goto LABEL_92;
  }
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v45, 1);
  objc_msgSend(v46, "readDataToEndOfFileAndReturnError:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v47, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v47, 1, 0, v61);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    if (!v48)
    {
LABEL_88:

      return 0;
    }
  }
  else
  {
    v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v60);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v49, CFSTR("OSArchiveVersion"));

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v48, 100, 0, v61);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v50)
  {
    v47 = 0;
    goto LABEL_88;
  }
  if (!objc_msgSend(v46, "truncateAtOffset:error:", 0, v61)
    || (objc_msgSend(v46, "writeData:error:", v50, v61) & 1) == 0)
  {
    v47 = v50;
    goto LABEL_88;
  }
  objc_msgSend(v46, "closeAndReturnError:", 0);

  self->_state = (unint64_t)(v6 - 2) < 3;
  self->_version = v60;
  return 1;
}

- (BOOL)checkTimesyncDB:(BOOL *)a3 error:(id *)a4
{
  _OSLogCollectionReference *v6;
  void *v7;
  int v8;
  int v9;
  unsigned int v11;
  _QWORD v12[6];
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v6 = self->_lcr;
  -[_OSLogCollectionReference timesyncReference](v6, "timesyncReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileDescriptor");

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___OSValidateTimesync_block_invoke;
  v12[3] = &unk_1E4157590;
  v13 = v8;
  v12[4] = &v14;
  v12[5] = &v11;
  _timesync_foreach_reg_file_at(v8, (uint64_t)v12);
  v9 = *((_DWORD *)v15 + 6);
  _Block_object_dispose(&v14, 8);

  if (v9 < 0)
    _OSLogFailWithPOSIXError((id)v11, a4);
  else
    *a3 = v9 != 0;
  return v9 >= 0;
}

- (BOOL)repairTimesyncDB:(id *)a3
{
  _OSLogCollectionReference *v4;
  void *v5;
  int v6;
  int v7;
  unsigned int v9;
  _QWORD v10[6];
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v4 = self->_lcr;
  -[_OSLogCollectionReference timesyncReference](v4, "timesyncReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileDescriptor");

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___OSRepairTimesync_block_invoke;
  v10[3] = &unk_1E4157590;
  v11 = v6;
  v10[4] = &v12;
  v10[5] = &v9;
  _timesync_foreach_reg_file_at(v6, (uint64_t)v10);
  v7 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  if (v7)
    _OSLogFailWithPOSIXError((id)v9, a3);
  return v7 == 0;
}

- (BOOL)hasEndTimeRef
{
  return self->_hasEndTimeRef;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lcr, 0);
}

@end
