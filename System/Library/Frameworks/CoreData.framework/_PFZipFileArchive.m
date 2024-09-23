@implementation _PFZipFileArchive

- (_PFZipFileArchive)init
{
  _PFZipFileArchive *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PFZipFileArchive;
  result = -[_PFZipFileArchive init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_entryNameToCentralDirectoryFileHeader = 0u;
    *(_OWORD *)&result->_centralDirectoryEntries = 0u;
    *(_OWORD *)&result->_entryNameToData = 0u;
  }
  return result;
}

- (uint64_t)initWithPath:(char)a3 options:(uint64_t)a4 error:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  if (!a1)
    return 0;
  v7 = objc_msgSend(a1, "init");
  v8 = v7;
  if (!a2 || !v7)
  {
    if (!v7)
      return v8;
    goto LABEL_11;
  }
  if (!objc_msgSend(a2, "length"))
  {
LABEL_11:

    return 0;
  }
  v9 = a3 & 3;
  *(_QWORD *)(v8 + 40) = a2;
  if (v9 != 1)
  {
    if (v9 == 2)
    {
      v13 = (void *)MEMORY[0x1E0C99D50];
      v14 = a2;
      v15 = 1;
    }
    else
    {
      if (v9 == 3)
      {
        v10 = _openFile(a2);
        if ((v10 & 0x8000000000000000) == 0)
        {
          close(v10);
          goto LABEL_20;
        }
        goto LABEL_11;
      }
      v13 = (void *)MEMORY[0x1E0C99D50];
      v14 = a2;
      v15 = 0;
    }
    v16 = (void *)objc_msgSend(v13, "dataWithContentsOfFile:options:error:", v14, v15, a4);
    if (v16)
    {
      v8 = -[_PFZipFileArchive initWithData:options:error:]((void *)v8, v16, a3);
      if (!v8)
        return v8;
      goto LABEL_20;
    }
    goto LABEL_11;
  }
  v12 = _openFile(a2);
  *(_QWORD *)(v8 + 32) = v12;
  if (v12 < 0)
    goto LABEL_11;
  *(_DWORD *)(v8 + 72) |= 0x10u;
LABEL_20:
  if ((a3 & 4) != 0)
    *(_DWORD *)(v8 + 72) |= 8u;
  return v8;
}

- (uint64_t)initWithData:(void *)a1 options:(void *)a2 error:(char)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  BOOL v26;
  BOOL v27;
  _BOOL4 v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _BOOL4 v35;
  unint64_t v36;
  BOOL v37;
  BOOL v38;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  unint64_t v49;
  unsigned __int16 *v50;
  uint64_t v51;
  unint64_t v52;
  int v54;
  uint64_t v56;
  void *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v5 = objc_msgSend(a1, "init");
  if (!v5)
    return 0;
  v59 = a3;
  v60 = v5;
  v64 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = objc_msgSend(a2, "bytes");
  v58 = a2;
  v7 = objc_msgSend(a2, "length");
  if (v7 < 0x15)
    goto LABEL_79;
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = -20;
  v12 = 20;
  v13 = v6;
  do
  {
    v14 = *(_DWORD *)(v13 + v7 - 20);
    if (v14 == 117853008)
    {
      v15 = 0;
      if (v7 >= 0x39)
      {
        v16 = *(_QWORD *)(v13 + v7 - 12);
        if (v16 <= v7 - 56)
        {
          v17 = v6 + v16;
          if (*(_DWORD *)(v6 + v16) == 101075792)
          {
            v9 = *(_QWORD *)(v17 + 24);
            v10 = *(_QWORD *)(v17 + 48);
            v15 = *(_QWORD *)(v13 + v7 - 12);
          }
          else
          {
            v15 = 0;
          }
        }
      }
    }
    else if (v14 == 101010256)
    {
      v15 = v7 - v12;
      v9 = *(unsigned __int16 *)(v13 + v7 - 12);
      v10 = *(unsigned int *)(v13 + v7 - 4);
    }
    else
    {
      v15 = 0;
      if (v12 >= 0x38 && v14 == 101075792)
      {
        v15 = v7 + v11;
        v9 = *(_QWORD *)(v13 + v7 + 4);
        v10 = *(_QWORD *)(v13 + v7 + 28);
      }
    }
    if (v12 > 0x101CE)
      break;
    if (v15)
      break;
    ++v12;
    --v11;
    --v13;
  }
  while (v12 < v7);
  if (!v9)
    goto LABEL_79;
  v65 = 0;
  v18 = 0;
  v61 = v6 + 16;
  v62 = v6 + 8;
  v19 = v10;
  v72 = v6;
  do
  {
    if (v19 < v10)
      break;
    if (v19 >= v8)
      break;
    v20 = v19 + 46;
    if (v19 + 46 <= v10)
      break;
    if (v20 > v8)
      break;
    v21 = v6 + v19;
    if (*(_DWORD *)v21 != 33639248)
      break;
    v23 = *(unsigned int *)(v21 + 20);
    v22 = *(unsigned int *)(v21 + 24);
    v24 = *(unsigned __int16 *)(v21 + 28);
    v25 = *(unsigned int *)(v21 + 42);
    v26 = v23 == 0xFFFFFFFFLL || v22 == 0xFFFFFFFFLL;
    v27 = v26 || v25 == 0xFFFFFFFF;
    v28 = v27;
    v29 = v20 + v24;
    if (v20 + v24 <= v10 || v29 > v8)
      break;
    v70 = v18;
    v71 = v9;
    v30 = 0;
    v31 = *(unsigned __int16 *)(v21 + 10);
    v32 = *(unsigned __int16 *)(v21 + 30);
    v68 = *(unsigned int *)(v21 + 16);
    v69 = *(unsigned __int16 *)(v21 + 32);
    v73 = v32;
    if (*(_WORD *)(v21 + 28))
    {
      if (v10 > v25)
      {
        v33 = *(unsigned __int16 *)(v21 + 10);
        v34 = v72 + v20;
        v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v34, v24, 4);
        v31 = v33;
        v32 = v73;
        if (!v30)
        {
          v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v34, v24, 12);
          v31 = v33;
          v32 = v73;
        }
      }
    }
    v35 = v32 > 4 && v28;
    v26 = v35;
    v36 = v29 + v32;
    v37 = !v26 || v29 >= v36;
    v38 = !v37 && v36 > v10;
    if (!v38 || v36 > v8)
    {
      v6 = v72;
    }
    else
    {
      v49 = v29;
      v6 = v72;
      do
      {
        v50 = (unsigned __int16 *)(v72 + v49);
        v51 = *(unsigned __int16 *)(v72 + v49 + 2);
        v52 = v49 + 4;
        v49 += 4 + v51;
        if (v49 <= v52 || v49 > v36)
          break;
        v54 = *v50;
        if (v51 >= 0x18 && v54 == 1)
        {
          if (v22 == 0xFFFFFFFFLL)
            v22 = *(_QWORD *)(v72 + v52);
          if (v23 == 0xFFFFFFFFLL)
            v23 = *(_QWORD *)(v62 + v52);
          if (v25 == 0xFFFFFFFF)
            v25 = *(_QWORD *)(v61 + v52);
        }
      }
      while (v49 < v36);
    }
    if (v30)
    {
      v66 = (void *)MEMORY[0x1E0C99D80];
      v67 = v10;
      v40 = v30;
      v41 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
      v42 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
      v43 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v68);
      v44 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
      v45 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
      v46 = v41;
      v6 = v72;
      v47 = objc_msgSend(v66, "dictionaryWithObjectsAndKeys:", v46, CFSTR("NSZipFileArchiveCompressionType"), v42, CFSTR("NSZipFileArchiveHeaderOffset"), v43, CFSTR("NSZipFileArchiveCRC"), v44, CFSTR("NSZipFileArchiveCompressedLength"), v45, CFSTR("NSZipFileArchiveUncompressedLength"), 0);
      objc_msgSend(v64, "addObject:", v40);
      v48 = v40;
      v10 = v67;
      objc_msgSend(v63, "setObject:forKey:", v47, v48);
      v32 = v73;
      v65 = 1;
    }
    v19 = v29 + v32 + v69;
    v18 = v70 + 1;
    v9 = v71;
  }
  while (v70 + 1 != v71);
  if ((v65 & 1) == 0)
  {
LABEL_79:

    return 0;
  }
  v56 = v60;
  *(_QWORD *)(v60 + 16) = v58;
  *(_QWORD *)(v60 + 48) = v64;
  *(_QWORD *)(v60 + 56) = v63;
  if ((v59 & 4) != 0)
    *(_DWORD *)(v60 + 72) |= 8u;
  return v56;
}

- (uint64_t)initWithEntryNames:(uint64_t)a1 contents:(void *)a2 properties:(void *)a3 options:(void *)a4
{
  uint64_t v4;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  BOOL v13;

  v4 = a1;
  if (!a1)
    return v4;
  v8 = objc_msgSend(a2, "count");
  v9 = objc_msgSend((id)v4, "init");
  v4 = v9;
  if (v8)
  {
    v10 = 1;
    do
    {
      v11 = objc_msgSend(a3, "objectForKey:", objc_msgSend(a2, "objectAtIndex:", v10 - 1));
      v12 = v11 != 0;
      if (v11)
        v13 = v10 >= v8;
      else
        v13 = 1;
      ++v10;
    }
    while (!v13);
    if (!v4)
      goto LABEL_17;
LABEL_12:
    if (a2 && a3 && v12 && v8)
    {
      *(_QWORD *)(v4 + 8) = objc_msgSend(a3, "copy");
      *(_QWORD *)(v4 + 48) = objc_msgSend(a2, "copy");
      *(_QWORD *)(v4 + 56) = objc_msgSend(a4, "copy");
      *(_DWORD *)(v4 + 72) |= 8u;
      return v4;
    }
    goto LABEL_17;
  }
  v12 = 1;
  if (v9)
    goto LABEL_12;
LABEL_17:
  if (v4)
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  NSDictionary *contents;
  NSData *data;
  __zFlags zFlags;
  NSString *path;
  NSArray *names;
  NSDictionary *properties;
  NSMutableDictionary *cachedContents;
  objc_super v10;

  if (self)
  {
    contents = self->_contents;
    if (contents)
    {

      self->_contents = 0;
    }
    data = self->_data;
    if (data)
    {

      self->_data = 0;
    }
    self->_provider = 0;
    zFlags = self->_zFlags;
    self->_zFlags = (__zFlags)(*(_DWORD *)&zFlags & 0xFFFFFFF8);
    if ((*(_BYTE *)&zFlags & 0x10) != 0)
    {
      close(self->_desc);
      *(_DWORD *)&self->_zFlags &= ~0x10u;
    }
    path = self->_path;
    if (path)
    {

      self->_path = 0;
    }
    names = self->_names;
    if (names)
    {

      self->_names = 0;
    }
    properties = self->_properties;
    if (properties)
    {

      self->_properties = 0;
    }
    cachedContents = self->_cachedContents;
    if (cachedContents)
    {

      self->_cachedContents = 0;
    }

    self->_entryNameToData = 0;
    self->_entryNameToLocalFileHeader = 0;

    self->_entryNameToCentralDirectoryFileHeader = 0;
    self->_localFileHeaders = 0;

    self->_centralDirectoryEntries = 0;
    self->_endRecord = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)_PFZipFileArchive;
  -[_PFZipFileArchive dealloc](&v10, sel_dealloc);
}

- (uint64_t)contentsForEntryName:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unsigned __int16 *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v25;
  Bytef *v26;
  const Bytef *v27;
  int v28;
  int v29;
  z_stream v30;

  if (!a1)
    return 0;
  v4 = *(void **)(a1 + 8);
  if (v4)
  {
    v5 = objc_msgSend(v4, "objectForKey:", a2);
LABEL_4:
    v6 = v5;
    goto LABEL_5;
  }
  if (*(_QWORD *)(a1 + 16))
  {
    v8 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", a2);
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", CFSTR("NSZipFileArchiveHeaderOffset")), "unsignedIntegerValue");
      v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("NSZipFileArchiveCompressionType")), "unsignedIntegerValue");
      v12 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("NSZipFileArchiveCRC")), "unsignedIntegerValue");
      v13 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("NSZipFileArchiveCompressedLength")), "unsignedIntegerValue");
      v14 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("NSZipFileArchiveUncompressedLength")), "unsignedIntegerValue");
      v15 = *(void **)(a1 + 16);
      v16 = objc_msgSend(v15, "bytes");
      v17 = objc_msgSend(v15, "length");
      if (v17 > v10 && v10 <= 0xFFFFFFFFFFFFFFE1)
      {
        v6 = 0;
        if (!v14 || !v13 || v10 + 30 >= v17)
          return v6;
        v18 = (unsigned __int16 *)(v16 + v10);
        if (*(_DWORD *)(v16 + v10) == 67324752 && v11 == v18[4])
        {
          v19 = v10 + 30 + v18[13] + v18[14];
          if (v19 < v17)
          {
            v6 = 0;
            v20 = v19 + v13;
            if (v19 + v13 >= v17 || v20 <= v19 || v20 <= v10)
              return v6;
            if (v11 == 8)
            {
              v25 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v14);
              v26 = (Bytef *)objc_msgSend(v25, "mutableBytes");
              *(_OWORD *)&v30.avail_in = 0u;
              memset(&v30.total_out, 0, 72);
              v30.next_in = (Bytef *)(v16 + v19);
              v30.avail_in = v13;
              v30.next_out = v26;
              *(_QWORD *)&v30.avail_out = v14;
              if (v25
                && (v27 = v26, !inflateInit2_(&v30, -15, "1.2.12", 112))
                && (v28 = inflate(&v30, 4), v29 = inflateEnd(&v30), v28 == 1))
              {
                v6 = 0;
                if (!v29 && v30.total_out == v14)
                {
                  if (v12 == _crcFromBytes(v27, v14))
                    v6 = (uint64_t)v25;
                  else
                    v6 = 0;
                }
              }
              else
              {
                v6 = 0;
              }
LABEL_5:
              if (!v6)
                return v6;
              goto LABEL_6;
            }
            if (!v11 && v12 == _crcFromBytes((const Bytef *)(v16 + v19), v13))
            {
              v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v16 + v19, v13);
              goto LABEL_4;
            }
          }
        }
      }
    }
    return 0;
  }
  if (!objc_msgSend(*(id *)(a1 + 48), "containsObject:", a2))
    return 0;
  v21 = *(_DWORD *)(a1 + 72);
  if ((v21 & 1) == 0)
  {
    if ((v21 & 2) != 0)
    {
      objc_msgSend(*(id *)(a1 + 24), "archive:streamForEntryName:", a1, a2);
    }
    else if ((v21 & 0x10) == 0)
    {
      v22 = *(void **)(a1 + 40);
      if (v22)
      {
        v23 = _openFile(v22);
        if ((v23 & 0x8000000000000000) == 0)
          close(v23);
      }
    }
    return 0;
  }
  v6 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", a2);
  if (!v6)
  {
    v5 = objc_msgSend(*(id *)(a1 + 24), "archive:contentsForEntryName:", a1, a2);
    goto LABEL_4;
  }
LABEL_6:
  if ((*(_BYTE *)(a1 + 72) & 8) == 0)
  {
    v7 = *(id *)(a1 + 64);
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *(_QWORD *)(a1 + 64) = v7;
    }
    objc_msgSend(v7, "setObject:forKey:", v6, a2, v30.next_in, *(_OWORD *)&v30.avail_in, *(_OWORD *)&v30.next_out);
  }
  return v6;
}

- (uint64_t)writeToFile:(uint64_t)a3 options:(uint64_t)a4 error:
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  size_t v19;
  void *v20;
  int v21;
  BOOL v22;
  int v23;
  const Bytef *v24;
  uInt v25;
  unsigned int v26;
  unsigned __int8 *v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  Bytef *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  int v37;
  __int16 v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  const std::__fs::filesystem::path *v48;
  const std::__fs::filesystem::path *v49;
  std::error_code *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int16 v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  __int16 v68;
  void *v69;
  int v70;
  int v71;
  z_stream strm;

  if (result)
  {
    v4 = result;
    v66 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v67 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v5 = objc_msgSend(*(id *)(v4 + 48), "count");
    v6 = objc_alloc(MEMORY[0x1E0C99D48]);
    v7 = (id)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    v8 = (void *)objc_msgSend(v7, "components:fromDate:", 252, objc_msgSend(MEMORY[0x1E0C99D68], "date"));
    v9 = objc_msgSend(v8, "year");
    v10 = objc_msgSend(v8, "month");
    v11 = objc_msgSend(v8, "day");
    v12 = objc_msgSend(v8, "hour");
    v13 = objc_msgSend(v8, "minute");
    v14 = objc_msgSend(v8, "second");
    v15 = ((_WORD)v9 << 9) - 30720;
    if (v9 < 0x7BC)
      v15 = 0;
    if (v5)
    {
      v16 = 0;
      v62 = v11 | (32 * v10) | v15;
      v63 = (32 * v13) | (v12 << 11) | (v14 >> 1);
      v64 = v4;
      v65 = v5;
      do
      {
        v17 = (void *)objc_msgSend(*(id *)(v4 + 48), "objectAtIndex:", v16);
        v18 = (const char *)objc_msgSend(v17, "UTF8String");
        v19 = strlen(v18);
        v20 = (void *)-[_PFZipFileArchive contentsForEntryName:](v4, (uint64_t)v17);
        v21 = objc_msgSend(v20, "length");
        if (v19)
          v22 = v20 == 0;
        else
          v22 = 1;
        if (!v22)
        {
          v23 = v21;
          v24 = (const Bytef *)objc_msgSend(v20, "bytes");
          v25 = objc_msgSend(v20, "length");
          v26 = crc32(0, 0, 0);
          LODWORD(v24) = crc32(v26, v24, v25);
          v27 = (unsigned __int8 *)objc_msgSend(v20, "bytes");
          v28 = objc_msgSend(v20, "length");
          v70 = (int)v24;
          if (v28)
          {
            while (1)
            {
              v30 = *v27++;
              v29 = v30;
              if (v30 <= 0x1F && v29 - 7 >= 7 && v29 - 26 > 1)
                break;
              if (!--v28)
                goto LABEL_15;
            }
            v68 = 0;
          }
          else
          {
LABEL_15:
            v68 = 1;
          }
          v31 = (Bytef *)objc_msgSend(v20, "bytes");
          v32 = objc_msgSend(v20, "length");
          v33 = 0;
          v71 = v23;
          if (v31)
          {
            v34 = v32;
            if (v32)
            {
              v35 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v32 - 1);
              memset(&strm.avail_in, 0, 104);
              strm.next_in = v31;
              strm.avail_in = v34;
              strm.next_out = (Bytef *)objc_msgSend(v35, "mutableBytes");
              strm.avail_out = v34 - 1;
              if (v35
                && !deflateInit2_(&strm, 6, 8, -15, 8, 0, "1.2.12", 112)
                && (v36 = deflate(&strm, 4), v37 = deflateEnd(&strm), v36 == 1))
              {
                v33 = 0;
                if (!v37 && v34 == strm.total_in)
                {
                  objc_msgSend(v35, "setLength:", strm.total_out);
                  v33 = v35;
                }
              }
              else
              {
                v33 = 0;
              }
            }
          }
          v38 = 8 * (v33 != 0);
          if (v33)
            v39 = v33;
          else
            v39 = v20;
          v69 = v39;
          v40 = objc_msgSend(v39, "length");
          v41 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v19 + 30);
          objc_msgSend(v41, "replaceBytesInRange:withBytes:", 0, 30, &localHeaderTemplate);
          objc_msgSend(v41, "replaceBytesInRange:withBytes:", 30, v19, v18);
          v42 = objc_msgSend(v41, "mutableBytes");
          *(_WORD *)(v42 + 4) = 20;
          *(_WORD *)(v42 + 8) = v38;
          *(_WORD *)(v42 + 10) = v63;
          *(_WORD *)(v42 + 12) = v62;
          *(_DWORD *)(v42 + 14) = v70;
          *(_DWORD *)(v42 + 18) = v40;
          *(_DWORD *)(v42 + 22) = v71;
          *(_WORD *)(v42 + 26) = v19;
          v43 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v19 + 46);
          objc_msgSend(v43, "replaceBytesInRange:withBytes:", 0, 46, &directoryHeaderTemplate);
          objc_msgSend(v43, "replaceBytesInRange:withBytes:", 46, v19, v18);
          v44 = objc_msgSend(v43, "mutableBytes");
          *(_WORD *)(v44 + 6) = 20;
          *(_WORD *)(v44 + 10) = v38;
          *(_WORD *)(v44 + 12) = v63;
          *(_WORD *)(v44 + 14) = v62;
          *(_DWORD *)(v44 + 16) = v70;
          *(_DWORD *)(v44 + 20) = v40;
          *(_DWORD *)(v44 + 24) = v71;
          *(_WORD *)(v44 + 28) = v19;
          *(_WORD *)(v44 + 36) = v68;
          *(_DWORD *)(v44 + 42) = objc_msgSend(v67, "length");
          objc_msgSend(v67, "appendData:", v41);
          objc_msgSend(v67, "appendData:", v69);
          objc_msgSend(v66, "appendData:", v43);
          v4 = v64;
          v5 = v65;
        }
        ++v16;
      }
      while (v16 != v5);
    }
    v45 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 22);
    objc_msgSend(v45, "replaceBytesInRange:withBytes:", 0, 22, &endOfDirectoryTemplate);
    v46 = objc_msgSend(v45, "mutableBytes");
    *(_WORD *)(v46 + 8) = v5;
    *(_WORD *)(v46 + 10) = v5;
    *(_DWORD *)(v46 + 12) = objc_msgSend(v66, "length");
    *(_DWORD *)(v46 + 16) = objc_msgSend(v67, "length");
    objc_msgSend(v67, "appendData:", v66);
    objc_msgSend(v67, "appendData:", v45);
    if (!v67)
      return 0;
    if ((a3 & 1) == 0)
      return objc_msgSend(v67, "writeToFile:options:error:", a2);
    v47 = (void *)objc_msgSend((id)objc_msgSend(a2, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(CFSTR("."), "stringByAppendingString:", objc_msgSend(a2, "lastPathComponent")), "stringByAppendingString:", CFSTR(".nosync")));
    v48 = (const std::__fs::filesystem::path *)objc_msgSend(a2, "fileSystemRepresentation");
    v49 = (const std::__fs::filesystem::path *)objc_msgSend(v47, "fileSystemRepresentation");
    result = objc_msgSend(v67, "writeToFile:options:error:", v47, a3 & 0xFFFFFFFFFFFFFFFELL, a4);
    if ((_DWORD)result)
    {
      rename(v49, v48, v50);
      if (!v51)
        return 1;
      v52 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData: Ubiquity: Error writing file '%@', rename failed with errno %d"), a2, *__error());
      _NSCoreDataLog(1, (uint64_t)CFSTR("%@"), v53, v54, v55, v56, v57, v58, v52);
      return 0;
    }
  }
  return result;
}

@end
