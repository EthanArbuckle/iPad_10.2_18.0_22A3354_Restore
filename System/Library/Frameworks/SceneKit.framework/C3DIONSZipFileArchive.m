@implementation C3DIONSZipFileArchive

- (C3DIONSZipFileArchive)initWithPath:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  if (!a3 || !objc_msgSend(a3, "length"))
    return 0;
  v20.receiver = self;
  v20.super_class = (Class)C3DIONSZipFileArchive;
  v9 = -[C3DIONSZipFileArchive init](&v20, sel_init);
  v10 = (uint64_t)v9;
  if (!v9)
    return (C3DIONSZipFileArchive *)v10;
  v11 = a4 & 3;
  *((_QWORD *)v9 + 9) = 0;
  *(_OWORD *)(v9 + 88) = 0u;
  *(_OWORD *)(v9 + 104) = 0u;
  *((_QWORD *)v9 + 15) = 0;
  switch(v11)
  {
    case 1uLL:
      v14 = _openFile(a3);
      *(_QWORD *)(v10 + 32) = v14;
      if ((v14 & 0x8000000000000000) == 0)
      {
        *(_DWORD *)(v10 + 80) |= 0x10u;
        goto LABEL_15;
      }
LABEL_17:

      return 0;
    case 2uLL:
      v15 = (void *)MEMORY[0x1E0C99D50];
      v16 = a3;
      v17 = 1;
      break;
    case 3uLL:
      v12 = _openFile(a3);
      if ((v12 & 0x8000000000000000) == 0)
      {
        v13 = v12;
        *(_QWORD *)(v10 + 40) = objc_msgSend(a3, "copy");
        close(v13);
        goto LABEL_15;
      }
      goto LABEL_17;
    default:
      v15 = (void *)MEMORY[0x1E0C99D50];
      v16 = a3;
      v17 = 0;
      break;
  }
  v18 = objc_msgSend(v15, "dataWithContentsOfFile:options:error:", v16, v17, a5);
  if (!v18)
    goto LABEL_17;
  v10 = objc_msgSend((id)v10, "initWithData:options:error:", v18, a4, a5);
  if (!v10)
    goto LABEL_17;
LABEL_15:
  if ((a4 & 4) != 0)
    *(_DWORD *)(v10 + 80) |= 8u;
  return (C3DIONSZipFileArchive *)v10;
}

- (C3DIONSZipFileArchive)initWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v5;
  C3DIONSZipFileArchive *v7;
  C3DIONSZipFileArchive *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  BOOL v30;
  BOOL v31;
  _BOOL4 v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _BOOL4 v39;
  unint64_t v40;
  BOOL v41;
  BOOL v42;
  id v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unsigned __int16 *v48;
  uint64_t v49;
  unint64_t v50;
  int v52;
  id v55;
  char v56;
  C3DIONSZipFileArchive *v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  objc_super v70;
  _QWORD v71[5];
  _QWORD v72[7];

  v5 = a4;
  v72[5] = *MEMORY[0x1E0C80C00];
  v70.receiver = self;
  v70.super_class = (Class)C3DIONSZipFileArchive;
  v7 = -[C3DIONSZipFileArchive init](&v70, sel_init, a3, a4, a5);
  v8 = v7;
  if (!a3)
    goto LABEL_80;
  if (!v7)
    goto LABEL_80;
  v63 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v62 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = objc_msgSend(a3, "bytes");
  v10 = objc_msgSend(a3, "length");
  if (v10 < 0x15)
    goto LABEL_80;
  v11 = v9;
  v12 = v10;
  v13 = 0;
  v14 = 0;
  v15 = -20;
  v16 = 20;
  v17 = v11;
  do
  {
    v18 = *(_DWORD *)(v17 + v10 - 20);
    if (v18 == 117853008)
    {
      v19 = 0;
      if (v10 >= 0x39)
      {
        v20 = *(_QWORD *)(v17 + v10 - 12);
        if (v20 <= v10 - 56)
        {
          v21 = v11 + v20;
          if (*(_DWORD *)(v11 + v20) == 101075792)
          {
            v13 = *(_QWORD *)(v21 + 24);
            v14 = *(_QWORD *)(v21 + 48);
            v19 = *(_QWORD *)(v17 + v10 - 12);
          }
          else
          {
            v19 = 0;
          }
        }
      }
    }
    else if (v18 == 101010256)
    {
      v19 = v10 - v16;
      v13 = *(unsigned __int16 *)(v17 + v10 - 12);
      v14 = *(unsigned int *)(v17 + v10 - 4);
    }
    else
    {
      v19 = 0;
      if (v16 >= 0x38 && v18 == 101075792)
      {
        v19 = v10 + v15;
        v13 = *(_QWORD *)(v17 + v10 + 4);
        v14 = *(_QWORD *)(v17 + v10 + 28);
      }
    }
    if (v16 > 0x101CE)
      break;
    if (v19)
      break;
    ++v16;
    --v15;
    --v17;
  }
  while (v16 < v10);
  if (!v13)
    goto LABEL_80;
  v55 = a3;
  v56 = v5;
  v57 = v8;
  v58 = 0;
  v22 = 0;
  v59 = v11 + 16;
  v60 = v11 + 8;
  v23 = v14;
  v69 = v11;
  do
  {
    if (v23 < v14)
      break;
    if (v23 >= v12)
      break;
    v24 = v23 + 46;
    if (v23 + 46 <= v14)
      break;
    if (v24 > v12)
      break;
    v25 = v11 + v23;
    if (*(_DWORD *)v25 != 33639248)
      break;
    v68 = v13;
    v27 = *(unsigned int *)(v25 + 20);
    v26 = *(unsigned int *)(v25 + 24);
    v28 = *(unsigned __int16 *)(v25 + 28);
    v29 = *(unsigned int *)(v25 + 42);
    v30 = v27 == 0xFFFFFFFFLL || v26 == 0xFFFFFFFFLL;
    v31 = v30 || v29 == 0xFFFFFFFF;
    v32 = v31;
    v33 = v24 + v28;
    if (v24 + v28 <= v14 || v33 > v12)
      break;
    v34 = 0;
    v35 = *(unsigned __int16 *)(v25 + 10);
    v64 = *(unsigned int *)(v25 + 16);
    v65 = v22;
    v36 = *(unsigned __int16 *)(v25 + 30);
    v67 = *(unsigned __int16 *)(v25 + 32);
    if (*(_WORD *)(v25 + 28))
    {
      if (v14 > v29)
      {
        v61 = *(unsigned __int16 *)(v25 + 10);
        v37 = v69 + v24;
        v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v37, v28, 4);
        v35 = v61;
        if (!v34)
        {
          v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v37, v28, 12);
          v35 = v61;
        }
      }
    }
    v38 = v36;
    v39 = v36 > 4 && v32;
    v30 = v39;
    v40 = v33 + v36;
    v41 = !v30 || v33 >= v40;
    v42 = !v41 && v40 > v14;
    if (!v42 || v40 > v12)
    {
      v11 = v69;
      v47 = v65;
    }
    else
    {
      v46 = v33;
      v11 = v69;
      v47 = v65;
      do
      {
        v48 = (unsigned __int16 *)(v69 + v46);
        v49 = *(unsigned __int16 *)(v69 + v46 + 2);
        v50 = v46 + 4;
        v46 += 4 + v49;
        if (v46 <= v50 || v46 > v40)
          break;
        v52 = *v48;
        if (v49 >= 0x18 && v52 == 1)
        {
          if (v26 == 0xFFFFFFFFLL)
            v26 = *(_QWORD *)(v69 + v50);
          if (v27 == 0xFFFFFFFFLL)
            v27 = *(_QWORD *)(v60 + v50);
          if (v29 == 0xFFFFFFFF)
            v29 = *(_QWORD *)(v59 + v50);
        }
      }
      while (v46 < v40);
    }
    if (v34)
    {
      v71[0] = CFSTR("C3DIONSZipFileArchiveCompressionType");
      v44 = v34;
      v66 = v38;
      v72[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
      v71[1] = CFSTR("C3DIONSZipFileArchiveHeaderOffset");
      v72[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v29);
      v71[2] = CFSTR("C3DIONSZipFileArchiveCRC");
      v72[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v64);
      v71[3] = CFSTR("C3DIONSZipFileArchiveCompressedLength");
      v72[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v27);
      v71[4] = CFSTR("C3DIONSZipFileArchiveUncompressedLength");
      v72[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v26);
      v45 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 5);
      objc_msgSend(v63, "addObject:", v44);
      objc_msgSend(v62, "setObject:forKey:", v45, v44);
      v38 = v66;
      v11 = v69;
      v58 = 1;
    }
    v13 = v68;
    v23 = v33 + v38 + v67;
    v22 = v47 + 1;
  }
  while (v22 != v68);
  v8 = v57;
  if ((v58 & 1) != 0)
  {
    v57->_data = (NSData *)v55;
    v57->_names = (NSArray *)v63;
    v57->_properties = (NSDictionary *)v62;
    if ((v56 & 4) != 0)
      *(_DWORD *)&v57->_zFlags |= 8u;
  }
  else
  {
LABEL_80:
    if (v8)
    {

      return 0;
    }
  }
  return v8;
}

- (C3DIONSZipFileArchive)initWithEntryNames:(id)a3 contents:(id)a4 properties:(id)a5 options:(unint64_t)a6
{
  unint64_t v10;
  C3DIONSZipFileArchive *v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  BOOL v15;
  objc_super v17;

  v10 = objc_msgSend(a3, "count");
  v17.receiver = self;
  v17.super_class = (Class)C3DIONSZipFileArchive;
  v11 = -[C3DIONSZipFileArchive init](&v17, sel_init);
  if (v10)
  {
    v12 = 1;
    do
    {
      v13 = objc_msgSend(a4, "objectForKey:", objc_msgSend(a3, "objectAtIndex:", v12 - 1));
      v14 = v13 != 0;
      if (v13)
        v15 = v12 >= v10;
      else
        v15 = 1;
      ++v12;
    }
    while (!v15);
    if (!a3)
      goto LABEL_16;
  }
  else
  {
    v14 = 1;
    if (!a3)
      goto LABEL_16;
  }
  if (a4 && v14 && v11 && v10)
  {
    v11->_contents = (NSDictionary *)objc_msgSend(a4, "copy");
    v11->_names = (NSArray *)objc_msgSend(a3, "copy");
    v11->_properties = (NSDictionary *)objc_msgSend(a5, "copy");
    *(_DWORD *)&v11->_zFlags |= 8u;
    return v11;
  }
LABEL_16:
  if (v11)
  {

    return 0;
  }
  return v11;
}

- (C3DIONSZipFileArchive)initWithEntryNames:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  int v9;
  objc_super v11;

  v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)C3DIONSZipFileArchive;
  v8 = -[C3DIONSZipFileArchive init](&v11, sel_init);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *((_DWORD *)v8 + 20) |= 1u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *((_DWORD *)v8 + 20) |= 2u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = *((_DWORD *)v8 + 20) | 4;
    *((_DWORD *)v8 + 20) = v9;
  }
  else
  {
    if (!v8)
      return (C3DIONSZipFileArchive *)v8;
    v9 = *((_DWORD *)v8 + 20);
  }
  if ((v9 & 3) != 0)
  {
    *((_QWORD *)v8 + 3) = a4;
    *((_QWORD *)v8 + 6) = objc_msgSend(a3, "copy");
    if ((v5 & 4) != 0)
      *((_DWORD *)v8 + 20) |= 8u;
  }
  else
  {

    return 0;
  }
  return (C3DIONSZipFileArchive *)v8;
}

- (void)dealloc
{
  objc_super v3;

  -[C3DIONSZipFileArchive invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)C3DIONSZipFileArchive;
  -[C3DIONSZipFileArchive dealloc](&v3, sel_dealloc);
}

- (id)entryNames
{
  return self->_names;
}

- (id)contentsForEntryName:(id)a3
{
  NSDictionary *contents;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *cachedContents;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSData *data;
  uint64_t v17;
  unint64_t v18;
  unsigned __int16 *v19;
  unint64_t v20;
  unint64_t v21;
  __zFlags zFlags;
  NSString *path;
  uint64_t v24;
  void *v26;
  Bytef *v27;
  const Bytef *v28;
  int v29;
  int v30;
  z_stream v31;

  contents = self->_contents;
  if (contents)
  {
    v6 = -[NSDictionary objectForKey:](contents, "objectForKey:", a3);
LABEL_3:
    v7 = (void *)v6;
    goto LABEL_4;
  }
  if (self->_data)
  {
    v9 = -[NSDictionary objectForKey:](self->_properties, "objectForKey:", a3);
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", CFSTR("C3DIONSZipFileArchiveHeaderOffset")), "unsignedIntegerValue");
      v12 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", CFSTR("C3DIONSZipFileArchiveCompressionType")), "unsignedIntegerValue");
      v13 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", CFSTR("C3DIONSZipFileArchiveCRC")), "unsignedIntegerValue");
      v14 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", CFSTR("C3DIONSZipFileArchiveCompressedLength")), "unsignedIntegerValue");
      v15 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", CFSTR("C3DIONSZipFileArchiveUncompressedLength")), "unsignedIntegerValue");
      data = self->_data;
      v17 = -[NSData bytes](data, "bytes");
      v18 = -[NSData length](data, "length");
      if (v18 > v11 && v11 <= 0xFFFFFFFFFFFFFFE1)
      {
        v7 = 0;
        if (!v15 || !v14 || v11 + 30 >= v18)
          return v7;
        v19 = (unsigned __int16 *)(v17 + v11);
        if (*(_DWORD *)(v17 + v11) == 67324752 && v12 == v19[4])
        {
          v20 = v11 + 30 + v19[13] + v19[14];
          if (v20 < v18)
          {
            v7 = 0;
            v21 = v20 + v14;
            if (v20 + v14 >= v18 || v21 <= v20 || v21 <= v11)
              return v7;
            if (v12 == 8)
            {
              v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v15);
              v27 = (Bytef *)objc_msgSend(v26, "mutableBytes");
              *(_OWORD *)&v31.avail_in = 0u;
              memset(&v31.total_out, 0, 72);
              v31.next_in = (Bytef *)(v17 + v20);
              v31.avail_in = v14;
              v31.next_out = v27;
              *(_QWORD *)&v31.avail_out = v15;
              if (v26
                && (v28 = v27, !inflateInit2_(&v31, -15, "1.2.12", 112))
                && (v29 = inflate(&v31, 4), v30 = inflateEnd(&v31), v29 == 1))
              {
                v7 = 0;
                if (!v30 && v31.total_out == v15)
                {
                  if (v13 == _crcFromBytes(v28, v15))
                    v7 = v26;
                  else
                    v7 = 0;
                }
              }
              else
              {
                v7 = 0;
              }
LABEL_4:
              if (!v7)
                return v7;
              goto LABEL_5;
            }
            if (!v12 && v13 == _crcFromBytes((const Bytef *)(v17 + v20), v14))
            {
              v6 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17 + v20, v14);
              goto LABEL_3;
            }
          }
        }
      }
    }
    return 0;
  }
  if (!-[NSArray containsObject:](self->_names, "containsObject:", a3))
    return 0;
  zFlags = self->_zFlags;
  if ((*(_BYTE *)&zFlags & 1) == 0)
  {
    if ((*(_BYTE *)&zFlags & 2) != 0)
    {
      objc_msgSend(self->_provider, "archive:streamForEntryName:", self, a3);
    }
    else if ((*(_BYTE *)&zFlags & 0x10) == 0)
    {
      path = self->_path;
      if (path)
      {
        v24 = _openFile(path);
        if ((v24 & 0x8000000000000000) == 0)
          close(v24);
      }
    }
    return 0;
  }
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_cachedContents, "objectForKey:", a3);
  if (!v7)
  {
    v6 = objc_msgSend(self->_provider, "archive:contentsForEntryName:", self, a3);
    goto LABEL_3;
  }
LABEL_5:
  if ((*(_BYTE *)&self->_zFlags & 8) == 0)
  {
    cachedContents = self->_cachedContents;
    if (!cachedContents)
    {
      cachedContents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_cachedContents = cachedContents;
    }
    -[NSMutableDictionary setObject:forKey:](cachedContents, "setObject:forKey:", v7, a3, v31.next_in, *(_OWORD *)&v31.avail_in, *(_OWORD *)&v31.next_out);
  }
  return v7;
}

- (id)streamForEntryName:(id)a3
{
  NSDictionary *contents;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __zFlags zFlags;
  NSString *path;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *cachedContents;

  contents = self->_contents;
  if (contents)
  {
    v6 = -[NSDictionary objectForKey:](contents, "objectForKey:", a3);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)MEMORY[0x1E0C99DB0];
      return (id)objc_msgSend(v8, "inputStreamWithData:", v7);
    }
    return 0;
  }
  if (!self->_data && -[NSArray containsObject:](self->_names, "containsObject:", a3))
  {
    zFlags = self->_zFlags;
    if ((*(_BYTE *)&zFlags & 1) != 0)
    {
      v13 = -[NSMutableDictionary objectForKey:](self->_cachedContents, "objectForKey:", a3);
      if (!v13)
      {
        v14 = objc_msgSend(self->_provider, "archive:contentsForEntryName:", self, a3);
        if (!v14)
          return 0;
        v13 = v14;
        if ((*(_BYTE *)&self->_zFlags & 8) == 0)
        {
          cachedContents = self->_cachedContents;
          if (!cachedContents)
          {
            cachedContents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            self->_cachedContents = cachedContents;
          }
          -[NSMutableDictionary setObject:forKey:](cachedContents, "setObject:forKey:", v13, a3);
        }
      }
      v8 = (void *)MEMORY[0x1E0C99DB0];
      v7 = v13;
      return (id)objc_msgSend(v8, "inputStreamWithData:", v7);
    }
    if ((*(_BYTE *)&zFlags & 2) != 0)
      return (id)objc_msgSend(self->_provider, "archive:streamForEntryName:", self, a3);
    if ((*(_BYTE *)&zFlags & 0x10) == 0)
    {
      path = self->_path;
      if (path)
      {
        v12 = _openFile(path);
        if ((v12 & 0x8000000000000000) == 0)
          close(v12);
      }
    }
  }
  return 0;
}

- (BOOL)writeContentsForEntryName:(id)a3 toFile:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v9;

  v9 = -[C3DIONSZipFileArchive contentsForEntryName:](self, "contentsForEntryName:", a3);
  if (v9)
    LOBYTE(v9) = objc_msgSend(v9, "writeToFile:options:error:", a4, a5, a6);
  return (char)v9;
}

- (id)propertiesForEntryName:(id)a3
{
  id result;

  result = -[NSDictionary objectForKey:](self->_properties, "objectForKey:");
  if (!result)
  {
    if (-[NSArray containsObject:](self->_names, "containsObject:", a3))
    {
      if ((*(_BYTE *)&self->_zFlags & 4) == 0)
        return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      result = (id)objc_msgSend(self->_provider, "archive:propertiesForEntryName:", self, a3);
      if (!result)
        return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)archiveData
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  id v6;
  const char *v7;
  size_t v8;
  id v9;
  int v10;
  BOOL v11;
  int v12;
  const Bytef *v13;
  uInt v14;
  uLong v15;
  unsigned __int8 *v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  Bytef *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  int v26;
  __int16 v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  C3DIONSZipFileArchive *v36;
  NSUInteger v37;
  void *v38;
  void *v39;
  __int16 v40;
  int v41;
  int v42;
  z_stream strm;

  v38 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v39 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v3 = -[NSArray count](self->_names, "count");
  v4 = v3;
  if (v3)
  {
    v5 = 0;
    v36 = self;
    v37 = v3;
    do
    {
      v6 = -[NSArray objectAtIndex:](self->_names, "objectAtIndex:", v5);
      v7 = (const char *)objc_msgSend(v6, "UTF8String");
      v8 = strlen(v7);
      v9 = -[C3DIONSZipFileArchive contentsForEntryName:](self, "contentsForEntryName:", v6);
      v10 = objc_msgSend(v9, "length");
      if (v8)
        v11 = v9 == 0;
      else
        v11 = 1;
      if (!v11)
      {
        v12 = v10;
        v13 = (const Bytef *)objc_msgSend(v9, "bytes");
        v14 = objc_msgSend(v9, "length");
        v15 = crc32(0, 0, 0);
        LODWORD(v13) = crc32(v15, v13, v14);
        v16 = (unsigned __int8 *)objc_msgSend(v9, "bytes");
        v17 = objc_msgSend(v9, "length");
        v42 = (int)v13;
        if (v17)
        {
          while (1)
          {
            v19 = *v16++;
            v18 = v19;
            if (v19 <= 0x1F && v18 - 7 >= 7 && v18 - 26 > 1)
              break;
            if (!--v17)
              goto LABEL_12;
          }
          v40 = 0;
        }
        else
        {
LABEL_12:
          v40 = 1;
        }
        v20 = (Bytef *)objc_msgSend(v9, "bytes");
        v21 = objc_msgSend(v9, "length");
        v22 = 0;
        v41 = v12;
        if (v20)
        {
          v23 = v21;
          if (v21)
          {
            v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v21 - 1);
            memset(&strm.avail_in, 0, 104);
            strm.next_in = v20;
            strm.avail_in = v23;
            strm.next_out = (Bytef *)objc_msgSend(v24, "mutableBytes");
            strm.avail_out = v23 - 1;
            if (v24
              && !deflateInit2_(&strm, 6, 8, -15, 8, 0, "1.2.12", 112)
              && (v25 = deflate(&strm, 4), v26 = deflateEnd(&strm), v25 == 1))
            {
              v22 = 0;
              if (!v26 && v23 == strm.total_in)
              {
                objc_msgSend(v24, "setLength:", strm.total_out);
                v22 = v24;
              }
            }
            else
            {
              v22 = 0;
            }
          }
        }
        v27 = 8 * (v22 != 0);
        if (v22)
          v9 = v22;
        v28 = objc_msgSend(v9, "length");
        v29 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v8 + 30);
        objc_msgSend(v29, "replaceBytesInRange:withBytes:", 0, 30, &localHeaderTemplate);
        objc_msgSend(v29, "replaceBytesInRange:withBytes:", 30, v8, v7);
        v30 = objc_msgSend(v29, "mutableBytes");
        *(_WORD *)(v30 + 4) = 20;
        *(_WORD *)(v30 + 8) = v27;
        *(_DWORD *)(v30 + 10) = 0;
        *(_DWORD *)(v30 + 14) = v42;
        *(_DWORD *)(v30 + 18) = v28;
        *(_DWORD *)(v30 + 22) = v41;
        *(_WORD *)(v30 + 26) = v8;
        v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v8 + 46);
        objc_msgSend(v31, "replaceBytesInRange:withBytes:", 0, 46, &directoryHeaderTemplate);
        objc_msgSend(v31, "replaceBytesInRange:withBytes:", 46, v8, v7);
        v32 = objc_msgSend(v31, "mutableBytes");
        *(_WORD *)(v32 + 6) = 20;
        *(_WORD *)(v32 + 10) = v27;
        *(_DWORD *)(v32 + 12) = 0;
        *(_DWORD *)(v32 + 16) = v42;
        *(_DWORD *)(v32 + 20) = v28;
        *(_DWORD *)(v32 + 24) = v41;
        *(_WORD *)(v32 + 28) = v8;
        *(_WORD *)(v32 + 36) = v40;
        *(_DWORD *)(v32 + 42) = objc_msgSend(v39, "length");
        objc_msgSend(v39, "appendData:", v29);
        objc_msgSend(v39, "appendData:", v9);
        objc_msgSend(v38, "appendData:", v31);
        self = v36;
        v4 = v37;
      }
      ++v5;
    }
    while (v5 != v4);
  }
  v33 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 22);
  objc_msgSend(v33, "replaceBytesInRange:withBytes:", 0, 22, &endOfDirectoryTemplate);
  v34 = objc_msgSend(v33, "mutableBytes");
  *(_WORD *)(v34 + 8) = v4;
  *(_WORD *)(v34 + 10) = v4;
  *(_DWORD *)(v34 + 12) = objc_msgSend(v38, "length");
  *(_DWORD *)(v34 + 16) = objc_msgSend(v39, "length");
  objc_msgSend(v39, "appendData:", v38);
  objc_msgSend(v39, "appendData:", v33);
  return v39;
}

- (id)archiveStream
{
  id result;

  result = -[C3DIONSZipFileArchive archiveData](self, "archiveData");
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithData:", result);
  return result;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;

  v8 = -[C3DIONSZipFileArchive archiveData](self, "archiveData");
  if (v8)
    LOBYTE(v8) = objc_msgSend(v8, "writeToFile:options:error:", a3, a4, a5);
  return (char)v8;
}

- (void)invalidate
{
  NSDictionary *contents;
  NSData *data;
  __zFlags zFlags;
  NSString *path;
  NSArray *names;
  NSDictionary *properties;
  NSMutableDictionary *cachedContents;

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
}

- (BOOL)isValid
{
  return self->_contents || self->_data || (*(_BYTE *)&self->_zFlags & 0x13) != 0 || self->_path != 0;
}

@end
