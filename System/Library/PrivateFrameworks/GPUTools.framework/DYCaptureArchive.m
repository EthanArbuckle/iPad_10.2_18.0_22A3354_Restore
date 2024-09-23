@implementation DYCaptureArchive

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)standardFunctionStreamFilenamePrefixes
{
  if (+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes_once != -1)
    dispatch_once(&+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes_once, &__block_literal_global);
  return (id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes;
}

uint64_t __58__DYCaptureArchive_standardFunctionStreamFilenamePrefixes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  +[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes = objc_opt_new();
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", *MEMORY[0x24BE393E8]);
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", *MEMORY[0x24BE393B0]);
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", *MEMORY[0x24BE393F8]);
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", *MEMORY[0x24BE393D0]);
  v0 = *MEMORY[0x24BE393D8];
  v1 = *MEMORY[0x24BE393E0];
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), *MEMORY[0x24BE393D8], *MEMORY[0x24BE393E0]));
  v2 = *MEMORY[0x24BE393F0];
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v0, *MEMORY[0x24BE393F0]));
  v3 = *MEMORY[0x24BE393C0];
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v0, *MEMORY[0x24BE393C0]));
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", v1);
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", v2);
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", v3);
  v4 = *MEMORY[0x24BE393B8];
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), *MEMORY[0x24BE393B8], v1));
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v4, v2));
  objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v4, v3));
  return objc_msgSend((id)+[DYCaptureArchive standardFunctionStreamFilenamePrefixes]::prefixes, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), *MEMORY[0x24BE39400], v3));
}

+ (id)standardFunctionStreamFilenamePredicate
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__DYCaptureArchive_standardFunctionStreamFilenamePredicate__block_invoke;
  block[3] = &unk_250D587B0;
  block[4] = a1;
  if (+[DYCaptureArchive standardFunctionStreamFilenamePredicate]::predicate_once != -1)
    dispatch_once(&+[DYCaptureArchive standardFunctionStreamFilenamePredicate]::predicate_once, block);
  return (id)+[DYCaptureArchive standardFunctionStreamFilenamePredicate]::predicate;
}

id __59__DYCaptureArchive_standardFunctionStreamFilenamePredicate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id result;
  _QWORD v3[5];

  v1 = objc_msgSend(*(id *)(a1 + 32), "standardFunctionStreamFilenamePrefixes");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__DYCaptureArchive_standardFunctionStreamFilenamePredicate__block_invoke_2;
  v3[3] = &unk_250D58788;
  v3[4] = v1;
  result = (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v3);
  +[DYCaptureArchive standardFunctionStreamFilenamePredicate]::predicate = (uint64_t)result;
  return result;
}

BOOL __59__DYCaptureArchive_standardFunctionStreamFilenamePredicate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD v5[5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__DYCaptureArchive_standardFunctionStreamFilenamePredicate__block_invoke_3;
  v5[3] = &unk_250D58760;
  v5[4] = a2;
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectsPassingTest:", v5), "count") != 0;
}

uint64_t __59__DYCaptureArchive_standardFunctionStreamFilenamePredicate__block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2);
  *a3 = result;
  return result;
}

+ (id)internalFilenamePredicate
{
  if (+[DYCaptureArchive internalFilenamePredicate]::predicate_once != -1)
    dispatch_once(&+[DYCaptureArchive internalFilenamePredicate]::predicate_once, &__block_literal_global_8);
  return (id)+[DYCaptureArchive internalFilenamePredicate]::predicate;
}

id __45__DYCaptureArchive_internalFilenamePredicate__block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_9);
  +[DYCaptureArchive internalFilenamePredicate]::predicate = (uint64_t)result;
  return result;
}

BOOL __45__DYCaptureArchive_internalFilenamePredicate__block_invoke_2(uint64_t a1, void *a2)
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(a2, "characterAtIndex:", 0) == 40
      && objc_msgSend(a2, "characterAtIndex:", objc_msgSend(a2, "length") - 1) == 41;
}

+ (BOOL)isFunctionStreamFilename:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a1, "standardFunctionStreamFilenamePredicate"), "evaluateWithObject:", a3);
}

+ (BOOL)isInternalFilename:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a1, "internalFilenamePredicate"), "evaluateWithObject:", a3);
}

+ (BOOL)isNotSpecialFilename:(id)a3
{
  return (objc_msgSend(a1, "isInternalFilename:") & 1) == 0
      && !objc_msgSend(a1, "isFunctionStreamFilename:", a3);
}

+ (unint64_t)contextFromFilename:(id)a3
{
  uint64_t v3;
  void *v4;
  unint64_t v6;

  v6 = 0;
  v3 = objc_msgSend((id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("-")), "lastObject");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", v3);
  objc_msgSend(v4, "scanHexLongLong:", &v6);

  return v6;
}

+ (id)coreArchiveBundleFilesPredicate
{
  return +[DYCaptureArchive getReturnAllFilesPredicate](DYCaptureArchive, "getReturnAllFilesPredicate");
}

+ (id)getReturnAllFilesPredicate
{
  if (+[DYCaptureArchive getReturnAllFilesPredicate]::predicate_once != -1)
    dispatch_once(&+[DYCaptureArchive getReturnAllFilesPredicate]::predicate_once, &__block_literal_global_14);
  return (id)+[DYCaptureArchive getReturnAllFilesPredicate]::predicate;
}

id __46__DYCaptureArchive_getReturnAllFilesPredicate__block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_15);
  +[DYCaptureArchive getReturnAllFilesPredicate]::predicate = (uint64_t)result;
  return result;
}

uint64_t __46__DYCaptureArchive_getReturnAllFilesPredicate__block_invoke_2()
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

+ (id)createArchiveInTemporaryDirectory:(id *)a3
{
  return (id)objc_msgSend(a1, "createArchiveInTemporaryDirectoryWithName:error:", 0, a3);
}

+ (id)createArchiveInTemporaryDirectoryWithName:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "createArchiveInTemporaryDirectoryWithName:deleteOnClose:error:", a3, 0, a4);
}

+ (id)createArchiveInTemporaryDirectoryWithName:(id)a3 deleteOnClose:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v7;
  id result;
  DYCaptureArchive *v9;

  v6 = a4;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  if (!objc_msgSend(v7, "bundleIdentifier"))
    objc_msgSend((id)objc_msgSend(v7, "executablePath"), "lastPathComponent");
  result = (id)DYFSCreateTempFileURL();
  if (result)
  {
    v9 = -[DYCaptureArchive initWithURL:options:error:]([DYCaptureArchive alloc], "initWithURL:options:error:", result, 2562, a5);
    -[DYCaptureArchive setDeleteOnClose:](v9, "setDeleteOnClose:", v6);
    return v9;
  }
  return result;
}

- (BOOL)_createNewArchiveAtPath:(id)a3 error:(id *)a4
{
  $938B03310D06493B2963E5A84CB75A7E *v7;
  unint64_t hash_table_length;
  size_t v9;
  $26580380F16D6530B01F933C495FCEE1 *v10;
  uint64_t file_table_capacity;
  size_t v12;
  $7E080378D8F67055EE0984892F39872B *v13;
  unint64_t v14;
  void *v15;
  size_t v16;
  unint64_t *v17;
  int v18;
  BOOL result;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int __pattern4;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend((id)objc_opt_new(), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", a3, 0, 0, a4) & 1) == 0)
  {
LABEL_9:
    DYLog();
    return 0;
  }
  self->_header.fourcc = 1667851384;
  *(_OWORD *)&self->_header.version = xmmword_23C6C1BC0;
  v7 = ($938B03310D06493B2963E5A84CB75A7E *)malloc_type_malloc(0x3000uLL, 0xCFDB4047uLL);
  self->_hash_table = v7;
  if (v7)
  {
    __pattern4 = -1;
    memset_pattern4(v7, &__pattern4, 0x3000uLL);
    hash_table_length = self->_header.hash_table_length;
    self->_file_table_capacity = self->_header.hash_table_length >> 1;
    v9 = 24 * (hash_table_length >> 1);
    v10 = ($26580380F16D6530B01F933C495FCEE1 *)malloc_type_malloc(v9, 0xEB3DFD82uLL);
    self->_file_table = v10;
    if (v10)
    {
      bzero(v10, v9);
      file_table_capacity = self->_file_table_capacity;
      self->_name_table_capacity = file_table_capacity;
      v12 = 2 * file_table_capacity;
      v13 = ($7E080378D8F67055EE0984892F39872B *)malloc_type_malloc(2 * file_table_capacity, 0x252E420DuLL);
      self->_name_table = v13;
      if (v13)
      {
        bzero(v13, v12);
        v14 = 4 * *MEMORY[0x24BDB03C8];
        self->_string_table_capacity = v14;
        v15 = malloc_type_malloc(v14, 0xFED10AD7uLL);
        self->_string_table_storage = v15;
        if (v15)
        {
          bzero(v15, self->_string_table_capacity);
          v16 = 8 * self->_name_table_capacity;
          v17 = (unint64_t *)malloc_type_malloc(v16, 0x730F8FD4uLL);
          self->_string_table_offsets = v17;
          if (v17)
          {
            bzero(v17, v16);
            v18 = open((const char *)objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("store0")), "fileSystemRepresentation"), 2578, 420);
            self->_backingStoreFD = v18;
            if (v18 != -1)
            {
              self->_backingStoreSize = 0;
              self->_backingStoreWritePosition = 0;
              self->_metadata = (NSMutableDictionary *)objc_opt_new();
              self->_uuid = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x24BDBD240]);
              result = 1;
              self->_modified = 1;
              return result;
            }
            if (a4)
            {
              v21 = (void *)MEMORY[0x24BDD1540];
              v22 = *MEMORY[0x24BDD1128];
              v23 = *__error();
              v25 = *MEMORY[0x24BDD0FC8];
              v26[0] = CFSTR("Failed to create backing store.");
              *a4 = (id)objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1));
            }
            goto LABEL_9;
          }
        }
      }
    }
  }
  if (a4)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 4, 0);
    result = 0;
    *a4 = v20;
    return result;
  }
  return 0;
}

- (BOOL)_loadArchiveAtPath:(id)a3 error:(id *)a4
{
  _BOOL4 v7;
  int v8;
  int v9;
  int v10;
  int v11;
  ssize_t v12;
  ssize_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableDictionary *metadata;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int file_table_length;
  uint64_t hash_table_length;
  int64_t v32;
  $938B03310D06493B2963E5A84CB75A7E *v33;
  ssize_t v34;
  ssize_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  $26580380F16D6530B01F933C495FCEE1 *v41;
  ssize_t v42;
  ssize_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int name_table_length;
  unsigned int file_table_capacity;
  unsigned int v49;
  unsigned int v50;
  $26580380F16D6530B01F933C495FCEE1 *v51;
  int64_t v52;
  $7E080378D8F67055EE0984892F39872B *v53;
  ssize_t v54;
  ssize_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  size_t v60;
  $7E080378D8F67055EE0984892F39872B *v61;
  off_t v62;
  int64_t v63;
  off_t v64;
  char *v65;
  ssize_t v66;
  ssize_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  void *v72;
  size_t v73;
  unint64_t *v74;
  unint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  size_t v79;
  unint64_t *v80;
  uint64_t v81;
  unint64_t *string_table_offsets;
  $7E080378D8F67055EE0984892F39872B *name_table;
  unint64_t *v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unsigned int var0;
  int v89;
  int v90;
  int v91;
  off_t st_size;
  NSMutableDictionary *v93;
  const __CFString *v94;
  CFAllocatorRef *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  stat v103;
  stat v104;
  uint64_t v105;
  const __CFString *v106;
  uint64_t v107;
  const __CFString *v108;
  uint64_t v109;
  const __CFString *v110;
  uint64_t v111;
  const __CFString *v112;
  uint64_t v113;
  const __CFString *v114;
  uint64_t v115;
  const __CFString *v116;
  uint64_t v117;
  const __CFString *v118;
  uint64_t v119;
  const __CFString *v120;
  uint64_t v121;
  _QWORD v122[2];

  v122[1] = *MEMORY[0x24BDAC8D0];
  v7 = -[DYCaptureArchive isReadOnly](self, "isReadOnly");
  if (v7)
    v8 = 20;
  else
    v8 = 22;
  v9 = open((const char *)objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("index")), "fileSystemRepresentation"), v8);
  if (v9 == -1)
  {
    if (a4)
    {
      v17 = *__error();
      if (v17 == 2)
      {
        v19 = CFSTR("The index file does not exist. The capture may be incomplete or corrupt.");
      }
      else if (v17 == 13)
      {
        v18 = CFSTR("read/write");
        if (v7)
          v18 = CFSTR("read");
        v19 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The index file could not be opened because %@ permission was denied."), v18);
      }
      else
      {
        v19 = CFSTR("The index file could not be opened. The file may be in use.");
      }
      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BDD1128];
      v25 = *__error();
      v121 = *MEMORY[0x24BDD0FC8];
      v122[0] = v19;
      *a4 = (id)objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, v25, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v122, &v121, 1));
    }
    __error();
    goto LABEL_27;
  }
  v10 = v9;
  v11 = fcntl(v9, 3);
  fcntl(v10, 4, v11 & 0xFFFFFFFB);
  fcntl(v10, 48, 1);
  if (fstat(v10, &v104) == -1)
  {
    if (a4)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v21 = *MEMORY[0x24BDD1128];
      v22 = *__error();
      v119 = *MEMORY[0x24BDD0FC8];
      v120 = CFSTR("Failed to stat index.");
      *a4 = (id)objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1));
    }
    goto LABEL_109;
  }
  v12 = read(v10, &self->_header, 0x14uLL);
  if (v12 <= 19)
  {
    v13 = v12;
    close(v10);
    if (v13 != -1)
      goto LABEL_8;
    if (a4)
    {
      v27 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD1128];
      v29 = *__error();
      v117 = *MEMORY[0x24BDD0FC8];
      v118 = CFSTR("Failed to read index.");
      *a4 = (id)objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, v29, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1));
    }
    goto LABEL_109;
  }
  if (self->_header.fourcc != 1667851384)
    goto LABEL_100;
  if (self->_header.version)
  {
    close(v10);
    if (a4)
    {
      v14 = *MEMORY[0x24BE39080];
      v15 = (void *)MEMORY[0x24BE39108];
      v16 = 11;
      goto LABEL_102;
    }
LABEL_28:
    LOBYTE(metadata) = 0;
    return (char)metadata;
  }
  file_table_length = self->_header.file_table_length;
  if (file_table_length > self->_header.name_table_length)
    goto LABEL_100;
  hash_table_length = self->_header.hash_table_length;
  if (file_table_length > hash_table_length || !(_DWORD)hash_table_length)
    goto LABEL_100;
  v32 = 12 * hash_table_length;
  v33 = ($938B03310D06493B2963E5A84CB75A7E *)malloc_type_malloc(12 * hash_table_length, 0x24A97E3DuLL);
  self->_hash_table = v33;
  if (!v33)
    goto LABEL_103;
  v34 = read(v10, v33, v32);
  if (v34 < v32)
  {
    v35 = v34;
    close(v10);
    if (v35 == -1)
    {
      if (a4)
      {
        v36 = (void *)MEMORY[0x24BDD1540];
        v37 = *MEMORY[0x24BDD1128];
        v38 = *__error();
        v115 = *MEMORY[0x24BDD0FC8];
        v116 = CFSTR("Failed to read index for hash table.");
        *a4 = (id)objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, v38, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1));
      }
LABEL_109:
      __error();
LABEL_27:
      DYLog();
      goto LABEL_28;
    }
    goto LABEL_8;
  }
  v39 = self->_header.file_table_length;
  if ((_DWORD)v39)
  {
    v40 = 24 * v39;
    v41 = ($26580380F16D6530B01F933C495FCEE1 *)malloc_type_malloc(24 * v39, 0xA9A54A9EuLL);
    self->_file_table = v41;
    if (!v41)
      goto LABEL_103;
    v42 = read(v10, v41, v40);
    if (v42 < v40)
    {
      v43 = v42;
      close(v10);
      if (v43 == -1)
      {
        if (a4)
        {
          v44 = (void *)MEMORY[0x24BDD1540];
          v45 = *MEMORY[0x24BDD1128];
          v46 = *__error();
          v113 = *MEMORY[0x24BDD0FC8];
          v114 = CFSTR("Failed to read index for file table.");
          *a4 = (id)objc_msgSend(v44, "errorWithDomain:code:userInfo:", v45, v46, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1));
        }
        goto LABEL_109;
      }
LABEL_8:
      if (a4)
      {
        v14 = *MEMORY[0x24BE39080];
        v15 = (void *)MEMORY[0x24BE39108];
        v16 = 9;
LABEL_102:
        v96 = (void *)objc_msgSend(v15, "errorWithDomain:code:userInfo:", v14, v16, 0);
        LOBYTE(metadata) = 0;
        *a4 = v96;
        return (char)metadata;
      }
      goto LABEL_28;
    }
    file_table_capacity = self->_header.file_table_length;
    name_table_length = self->_header.name_table_length;
    self->_file_table_capacity = file_table_capacity;
    if (!name_table_length)
    {
      if (v7)
        goto LABEL_91;
LABEL_70:
      self->_name_table_capacity = file_table_capacity;
      v60 = 2 * file_table_capacity;
      v61 = ($7E080378D8F67055EE0984892F39872B *)malloc_type_malloc(v60, 0xB021DF3DuLL);
      self->_name_table = v61;
      bzero(v61, v60);
      if (!self->_name_table)
        goto LABEL_103;
      if (self->_header.name_table_length)
        goto LABEL_72;
      goto LABEL_79;
    }
  }
  else if (v7)
  {
    name_table_length = self->_header.name_table_length;
    if (!name_table_length)
      goto LABEL_91;
  }
  else
  {
    v49 = self->_header.hash_table_length;
    if (v49 <= 3)
      v50 = 1;
    else
      v50 = v49 >> 1;
    self->_file_table_capacity = v50;
    v51 = ($26580380F16D6530B01F933C495FCEE1 *)malloc_type_malloc(24 * v50, 0x733F178BuLL);
    self->_file_table = v51;
    if (!v51)
      goto LABEL_103;
    name_table_length = self->_header.name_table_length;
    if (!name_table_length)
    {
      file_table_capacity = self->_file_table_capacity;
      goto LABEL_70;
    }
  }
  v52 = 2 * name_table_length;
  v53 = ($7E080378D8F67055EE0984892F39872B *)malloc_type_malloc(v52, 0x58CC46D2uLL);
  self->_name_table = v53;
  if (!v53)
    goto LABEL_103;
  bzero(v53, v52);
  v54 = read(v10, self->_name_table, v52);
  if (v54 < v52)
  {
    v55 = v54;
    close(v10);
    if (v55 == -1)
    {
      if (a4)
      {
        v56 = (void *)MEMORY[0x24BDD1540];
        v57 = *MEMORY[0x24BDD1128];
        v58 = *__error();
        v111 = *MEMORY[0x24BDD0FC8];
        v112 = CFSTR("Failed to read index for name table.");
        *a4 = (id)objc_msgSend(v56, "errorWithDomain:code:userInfo:", v57, v58, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1));
      }
      goto LABEL_109;
    }
    goto LABEL_8;
  }
  v59 = self->_header.name_table_length;
  self->_name_table_capacity = v59;
  if (v59)
  {
LABEL_72:
    v62 = lseek(v10, 0, 1);
    if (v62 == -1)
    {
      if (a4)
      {
        v76 = (void *)MEMORY[0x24BDD1540];
        v77 = *MEMORY[0x24BDD1128];
        v78 = *__error();
        v109 = *MEMORY[0x24BDD0FC8];
        v110 = CFSTR("Failed to lseek for index.");
        *a4 = (id)objc_msgSend(v76, "errorWithDomain:code:userInfo:", v77, v78, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1));
      }
      __error();
      DYLog();
      close(v10);
      goto LABEL_28;
    }
    v63 = v104.st_size - v62;
    v64 = (v104.st_size - v62 + *MEMORY[0x24BDB03C8]) & -*MEMORY[0x24BDB03C8];
    self->_string_table_capacity = v64;
    v65 = (char *)malloc_type_malloc(v64, 0x57BD109CuLL);
    self->_string_table_storage = v65;
    if (v65)
    {
      bzero(&v65[v63], self->_string_table_capacity - v63);
      v66 = read(v10, self->_string_table_storage, v63);
      if (v66 < v63)
      {
        v67 = v66;
        close(v10);
        if (v67 == -1)
        {
          if (a4)
          {
            v68 = (void *)MEMORY[0x24BDD1540];
            v69 = *MEMORY[0x24BDD1128];
            v70 = *__error();
            v107 = *MEMORY[0x24BDD0FC8];
            v108 = CFSTR("Failed to read index for string index.");
            *a4 = (id)objc_msgSend(v68, "errorWithDomain:code:userInfo:", v69, v70, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1));
          }
          goto LABEL_109;
        }
        goto LABEL_8;
      }
      v79 = 8 * self->_name_table_capacity;
      v80 = (unint64_t *)malloc_type_malloc(v79, 0x471809AAuLL);
      self->_string_table_offsets = v80;
      if (v80)
      {
        v75 = v63 + 1;
        bzero(v80, v79);
        goto LABEL_87;
      }
    }
    goto LABEL_103;
  }
  if (!v7)
  {
LABEL_79:
    v71 = 4 * *MEMORY[0x24BDB03C8];
    self->_string_table_capacity = v71;
    v72 = malloc_type_malloc(v71, 0xD0D46F0BuLL);
    self->_string_table_storage = v72;
    if (v72)
    {
      bzero(v72, self->_string_table_capacity);
      v73 = 8 * self->_name_table_capacity;
      v74 = (unint64_t *)malloc_type_malloc(v73, 0xBA3B9CD6uLL);
      self->_string_table_offsets = v74;
      if (v74)
      {
        bzero(v74, v73);
        v75 = 0;
LABEL_87:
        v81 = self->_header.name_table_length;
        if (v81 < 2)
          goto LABEL_91;
        string_table_offsets = self->_string_table_offsets;
        name_table = self->_name_table;
        v86 = *string_table_offsets;
        v84 = string_table_offsets + 1;
        v85 = v86;
        v87 = v81 - 1;
        while (1)
        {
          var0 = name_table->var0;
          ++name_table;
          v85 += var0;
          if (v85 > v75)
            break;
          *v84++ = v85;
          if (!--v87)
            goto LABEL_91;
        }
LABEL_100:
        close(v10);
        if (a4)
        {
          v14 = *MEMORY[0x24BE39080];
          v15 = (void *)MEMORY[0x24BE39108];
          v16 = 10;
          goto LABEL_102;
        }
        goto LABEL_28;
      }
    }
LABEL_103:
    close(v10);
    if (a4)
    {
      v14 = *MEMORY[0x24BE39080];
      v15 = (void *)MEMORY[0x24BE39108];
      v16 = 4;
      goto LABEL_102;
    }
    goto LABEL_28;
  }
LABEL_91:
  close(v10);
  v89 = open((const char *)objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("store0")), "fileSystemRepresentation"), v8);
  self->_backingStoreFD = v89;
  if (v89 == -1)
  {
    if (a4)
    {
      v99 = (void *)MEMORY[0x24BDD1540];
      v100 = *MEMORY[0x24BDD1128];
      v101 = *__error();
      v105 = *MEMORY[0x24BDD0FC8];
      v106 = CFSTR("Failed to open backing store.");
      *a4 = (id)objc_msgSend(v99, "errorWithDomain:code:userInfo:", v100, v101, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1));
    }
    goto LABEL_109;
  }
  v90 = v89;
  v91 = fcntl(v89, 3);
  fcntl(v90, 4, v91 & 0xFFFFFFFB);
  if (fstat(self->_backingStoreFD, &v103) == -1
    || (st_size = v103.st_size,
        self->_backingStoreSize = v103.st_size,
        self->_backingStoreWritePosition = st_size,
        lseek(self->_backingStoreFD, st_size, 0) == -1))
  {
    if (a4)
    {
      v97 = (void *)MEMORY[0x24BDD1540];
      v98 = *MEMORY[0x24BDD1128];
      v16 = *__error();
      v15 = v97;
      v14 = v98;
      goto LABEL_102;
    }
    goto LABEL_28;
  }
  metadata = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("metadata")), 0, a4);
  if (metadata)
  {
    v93 = metadata;
    self->_metadata = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", metadata, 0, 0, a4), "mutableCopy");

    metadata = self->_metadata;
    if (metadata)
    {
      v94 = (const __CFString *)-[NSMutableDictionary objectForKey:](metadata, "objectForKey:", CFSTR("(uuid)"));
      v95 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
      if (v94)
      {
        self->_uuid = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x24BDBD240], v94);
        -[NSMutableDictionary removeObjectForKey:](self->_metadata, "removeObjectForKey:", CFSTR("(uuid)"));
      }
      if (self->_uuid)
      {
        LOBYTE(metadata) = 1;
      }
      else
      {
        self->_uuid = CFUUIDCreate(*v95);
        LOBYTE(metadata) = 1;
        if (!v7)
          self->_modified = 1;
      }
    }
  }
  return (char)metadata;
}

- (void)_swapHashTable
{
  uint64_t hash_table_length;
  unsigned int *p_var2;

  hash_table_length = self->_header.hash_table_length;
  if ((_DWORD)hash_table_length)
  {
    p_var2 = &self->_hash_table->var2;
    do
    {
      *((int8x8_t *)p_var2 - 1) = vrev32_s8(*(int8x8_t *)(p_var2 - 2));
      *p_var2 = bswap32(*p_var2);
      p_var2 += 3;
      --hash_table_length;
    }
    while (hash_table_length);
  }
}

- (void)_swapFileTable
{
  uint64_t v2;
  unint64_t v3;
  $26580380F16D6530B01F933C495FCEE1 *v4;

  if (self->_header.file_table_length)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = &self->_file_table[v2];
      *(int8x8_t *)&v4->var0 = vrev32_s8(*(int8x8_t *)&v4->var0);
      v4->var2 = bswap64(v4->var2);
      *(int8x8_t *)&v4->var3 = vrev32_s8(*(int8x8_t *)&v4->var3);
      ++v3;
      ++v2;
    }
    while (v3 < self->_header.file_table_length);
  }
}

- (void)_swapNameTable
{
  uint64_t name_table_length;
  $7E080378D8F67055EE0984892F39872B *name_table;

  name_table_length = self->_header.name_table_length;
  if ((_DWORD)name_table_length)
  {
    name_table = self->_name_table;
    do
    {
      name_table->var0 = bswap32(name_table->var0) >> 16;
      ++name_table;
      --name_table_length;
    }
    while (name_table_length);
  }
}

- (DYCaptureArchive)init
{
  -[DYCaptureArchive doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYCaptureArchive)initWithURL:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  const char *v9;
  DYCaptureArchive *v10;
  DYCaptureArchive *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char v24;
  void *v25;
  uint64_t v26;
  NSURL *v27;
  NSURL *v28;
  size_t v29;
  id *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  int32x4_t v34;
  unsigned int *begin;
  int32x4_t v36;
  size_t v37;
  objc_super v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  self->_lock_readers = 0;
  self->_lock_global_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  self->_blocking_readers = 0;
  v9 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gputools.%@.%p"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(self)), self), "UTF8String");
  self->_write_queue = (OS_dispatch_queue *)dispatch_queue_create(v9, 0);
  self->_add_group = (OS_dispatch_group *)dispatch_group_create();
  v39.receiver = self;
  v39.super_class = (Class)DYCaptureArchive;
  v10 = -[DYCaptureArchive init](&v39, sel_init);
  v11 = v10;
  if (!v10)
    return v11;
  v10->_backingStoreFD = -1;
  v10->_options = a4;
  if ((a4 & 0xFFFFFFFFFFFFF5FCLL) != 0)
  {
    if (a5)
    {
      v12 = (void *)MEMORY[0x24BE39108];
      v13 = *MEMORY[0x24BDD1128];
      v44 = *MEMORY[0x24BDD0FC8];
      v45[0] = CFSTR("Received unexpected options.");
      v14 = (void *)MEMORY[0x24BDBCE70];
      v15 = (const __CFString **)v45;
      v16 = &v44;
LABEL_5:
      v17 = objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
      v18 = v12;
      v19 = v13;
      v20 = 22;
LABEL_30:
      *a5 = (id)objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, v20, v17);
      goto LABEL_31;
    }
    goto LABEL_31;
  }
  v21 = objc_msgSend((id)objc_msgSend(a3, "URLByResolvingSymlinksInPath"), "path");
  if (!v21)
    goto LABEL_27;
  v22 = v21;
  v23 = DYFSDirectoryExists();
  v24 = v23;
  if (v23)
  {
    if ((~(_DWORD)a4 & 0xA00) == 0)
    {
      if (a5)
      {
        v25 = (void *)MEMORY[0x24BE39108];
        v26 = *MEMORY[0x24BDD1128];
        v42 = *MEMORY[0x24BDD0FC8];
        v43 = CFSTR("File already exists.");
        v17 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v18 = v25;
        v19 = v26;
        v20 = 17;
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    if (!-[DYCaptureArchive _loadArchiveAtPath:error:](v11, "_loadArchiveAtPath:error:", v22, a5))
      goto LABEL_31;
  }
  else
  {
    if ((a4 & 0x200) == 0)
    {
      if (!a5)
        goto LABEL_31;
      v18 = (void *)MEMORY[0x24BE39108];
      v19 = *MEMORY[0x24BDD1128];
      v20 = 2;
LABEL_29:
      v17 = 0;
      goto LABEL_30;
    }
    if ((a4 & 3) == 0)
    {
      if (!a5)
        goto LABEL_31;
      v12 = (void *)MEMORY[0x24BE39108];
      v13 = *MEMORY[0x24BDD1128];
      v40 = *MEMORY[0x24BDD0FC8];
      v41 = CFSTR("File exists and is read only.");
      v14 = (void *)MEMORY[0x24BDBCE70];
      v15 = &v41;
      v16 = &v40;
      goto LABEL_5;
    }
    if (!-[DYCaptureArchive _createNewArchiveAtPath:error:](v11, "_createNewArchiveAtPath:error:", v22, a5))
    {
LABEL_31:

      return 0;
    }
  }
  v27 = (NSURL *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v22, 1), "fileReferenceURL");
  v11->_url = v27;
  if (!v27)
  {
    v28 = (NSURL *)(id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v22, 1);
    v11->_url = v28;
    if (!v28)
    {
LABEL_27:
      if (!a5)
        goto LABEL_31;
      v18 = (void *)MEMORY[0x24BE39108];
      v19 = *MEMORY[0x24BE39080];
      v20 = 1;
      goto LABEL_29;
    }
  }
  v29 = 8 * v11->_name_table_capacity;
  v30 = (id *)malloc_type_malloc(v29, 0x1C89C020uLL);
  v11->_string_table_nscache = v30;
  bzero(v30, v29);
  if (!-[DYCaptureArchive isReadOnly](v11, "isReadOnly"))
  {
    v31 = malloc_type_malloc(0x40000uLL, 0x8EAE2729uLL);
    v11->_store_write_buffer = v31;
    v11->_store_write_ptr = v31;
    v11->_aliasCreationMap = (NSMutableDictionary *)objc_opt_new();
  }
  v32 = *MEMORY[0x24BDB03C8];
  v11->_read_buffer_capacity = 25 * *MEMORY[0x24BDB03C8];
  v11->_read_buffer = malloc_type_malloc(400 * v32, 0x786B05F4uLL);
  v11->_read_buffer_sem = (OS_dispatch_semaphore *)dispatch_semaphore_create(16);
  v11->_read_buffer_tokens_lock = 0;
  std::vector<unsigned int>::resize((std::vector<unsigned int> *)&v11->_read_buffer_tokens, 0x10uLL);
  v33 = 0;
  v34 = (int32x4_t)xmmword_23C6C1BD0;
  begin = v11->_read_buffer_tokens.__begin_;
  v36.i64[0] = 0x400000004;
  v36.i64[1] = 0x400000004;
  do
  {
    *(int32x4_t *)&begin[v33] = v34;
    v34 = vaddq_s32(v34, v36);
    v33 += 4;
  }
  while (v33 != 16);
  if ((v24 & 1) == 0 && !-[DYCaptureArchive _performCommit:](v11, "_performCommit:", a5, *(double *)v34.i64))
    goto LABEL_31;
  v37 = compression_decode_scratch_buffer_size(COMPRESSION_ZLIB);
  v11->_scratchSize = v37;
  v11->_scratch = (char *)malloc_type_malloc(16 * v37, 0xF033740FuLL);
  -[DYCaptureArchive initCache](v11, "initCache");
  return v11;
}

- (void)dealloc
{
  NSObject *write_queue;
  NSObject *add_group;
  $938B03310D06493B2963E5A84CB75A7E *hash_table;
  $26580380F16D6530B01F933C495FCEE1 *file_table;
  $7E080378D8F67055EE0984892F39872B *name_table;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v9;
  unint64_t v10;
  vm_map_t *v11;
  char *v12;
  void *string_table_storage;
  unint64_t *string_table_offsets;
  id *string_table_nscache;
  void *read_buffer;
  void *store_write_buffer;
  __CFUUID *uuid;
  NSObject *lock_global_semaphore;
  NSObject *read_buffer_sem;
  DYCaptureArchive *v21;
  objc_super v22;

  if (self->_modified)
  {
    v21 = self;
    DYLog();
  }
  -[DYCaptureArchive discardAndClose](self, "discardAndClose", v21);
  write_queue = self->_write_queue;
  if (write_queue)
  {
    dispatch_release(write_queue);
    self->_write_queue = 0;
  }
  add_group = self->_add_group;
  if (add_group)
  {
    dispatch_release(add_group);
    self->_add_group = 0;
  }
  hash_table = self->_hash_table;
  if (hash_table)
    free(hash_table);
  file_table = self->_file_table;
  if (file_table)
    free(file_table);
  name_table = self->_name_table;
  if (name_table)
    free(name_table);
  begin = self->_cacheTable.__begin_;
  if (begin != self->_cacheTable.__end_)
  {
    if (self->_header.file_table_length)
    {
      v9 = 0;
      v10 = 0;
      v11 = (vm_map_t *)MEMORY[0x24BDAEC58];
      do
      {
        v12 = (char *)self->_cacheTable.__begin_ + v9;
        dispatch_release(*((dispatch_object_t *)v12 + 3));
        *((_QWORD *)v12 + 3) = 0;
        if (*(_QWORD *)v12)
        {
          mach_vm_deallocate(*v11, *(_QWORD *)v12, *((_QWORD *)v12 + 1));
          *(_QWORD *)v12 = 0;
          *((_QWORD *)v12 + 1) = 0;
        }
        ++v10;
        v9 += 32;
      }
      while (v10 < self->_header.file_table_length);
      begin = self->_cacheTable.__begin_;
    }
    self->_cacheTable.__end_ = begin;
  }
  free(self->_scratch);
  self->_scratch = 0;
  string_table_storage = self->_string_table_storage;
  if (string_table_storage)
    free(string_table_storage);
  string_table_offsets = self->_string_table_offsets;
  if (string_table_offsets)
    free(string_table_offsets);
  string_table_nscache = self->_string_table_nscache;
  if (string_table_nscache)
    free(string_table_nscache);
  read_buffer = self->_read_buffer;
  if (read_buffer)
    free(read_buffer);
  store_write_buffer = self->_store_write_buffer;
  if (store_write_buffer)
    free(store_write_buffer);

  uuid = self->_uuid;
  if (uuid)
    CFRelease(uuid);
  lock_global_semaphore = self->_lock_global_semaphore;
  if (lock_global_semaphore)
  {
    dispatch_release(lock_global_semaphore);
    self->_lock_global_semaphore = 0;
  }
  read_buffer_sem = self->_read_buffer_sem;
  if (read_buffer_sem)
  {
    dispatch_release(read_buffer_sem);
    self->_read_buffer_sem = 0;
  }
  v22.receiver = self;
  v22.super_class = (Class)DYCaptureArchive;
  -[DYCaptureArchive dealloc](&v22, sel_dealloc);
}

- (void)setTargetQueue:(id)a3
{
  dispatch_set_target_queue((dispatch_object_t)self->_write_queue, (dispatch_queue_t)a3);
}

- (NSURL)url
{
  return -[NSURL filePathURL](self->_url, "filePathURL");
}

- (NSString)path
{
  return -[NSURL path](-[NSURL filePathURL](self->_url, "filePathURL"), "path");
}

- (BOOL)isReadOnly
{
  return (self->_options & 3) == 0;
}

- (BOOL)isClosed
{
  return self->_backingStoreFD == -1;
}

- (int)_storeFileDescriptor
{
  return self->_backingStoreFD;
}

- ($55969086526AB00ED573B0A7B58FA2BF)_header
{
  return ($55969086526AB00ED573B0A7B58FA2BF *)&self->_header;
}

- ($938B03310D06493B2963E5A84CB75A7E)_hashTable
{
  return self->_hash_table;
}

- ($26580380F16D6530B01F933C495FCEE1)_fileTable
{
  return self->_file_table;
}

- ($7E080378D8F67055EE0984892F39872B)_nameTable
{
  return self->_name_table;
}

- (void)_stringTableStorage
{
  return self->_string_table_storage;
}

- (unint64_t)_stringTableOffsets
{
  return self->_string_table_offsets;
}

- (void)_fileObjectDidInitialize
{
  unsigned int *p_open_file_count;
  unsigned int v3;
  DYCaptureArchive *v4;

  p_open_file_count = &self->_open_file_count;
  do
    v3 = __ldaxr(p_open_file_count);
  while (__stlxr(v3 + 1, p_open_file_count));
  if (!v3)
    v4 = self;
}

- (void)_fileObjectDidDeallocate
{
  unsigned int *p_open_file_count;
  unsigned int v3;
  unsigned int v4;

  p_open_file_count = &self->_open_file_count;
  do
  {
    v3 = __ldaxr(p_open_file_count);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, p_open_file_count));
  if (!v4)

}

- (id)_getCFilename:(id)a3 outSize:(unint64_t *)a4 error:(id *)a5
{
  unint64_t v8;
  void *v9;

  v8 = objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 1) + 1;
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v8);
  if ((objc_msgSend(a3, "getCString:maxLength:encoding:", objc_msgSend(v9, "mutableBytes"), v8, 1) & 1) != 0)
  {
    if (a4)
      *a4 = v8;
  }
  else
  {
    v9 = 0;
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 1, 0);
  }
  return v9;
}

- (void)_growHashTable
{
  uint64_t hash_table_length;
  $938B03310D06493B2963E5A84CB75A7E *hash_table;
  $938B03310D06493B2963E5A84CB75A7E *v5;
  char *string_table_storage;
  uint64_t v7;
  $938B03310D06493B2963E5A84CB75A7E *v8;
  unsigned int v9;
  $938B03310D06493B2963E5A84CB75A7E *v10;
  unsigned int var2;
  unsigned int *p_var2;
  unsigned int v13;
  $938B03310D06493B2963E5A84CB75A7E *v14;
  unsigned int v15;
  int __pattern4;
  char v17;

  v17 = 0;
  hash_table_length = self->_header.hash_table_length;
  hash_table = self->_hash_table;
  v5 = ($938B03310D06493B2963E5A84CB75A7E *)malloc_type_malloc(12 * (2 * hash_table_length), 0x2817264AuLL);
  self->_hash_table = v5;
  self->_header.hash_table_length = 2 * hash_table_length;
  __pattern4 = -1;
  memset_pattern4(v5, &__pattern4, 12 * (2 * hash_table_length));
  if ((_DWORD)hash_table_length)
  {
    string_table_storage = (char *)self->_string_table_storage;
    v7 = hash_table_length;
    v8 = hash_table;
    do
    {
      if (v8->var2 == -1)
      {
        v9 = -[DYCaptureArchive _createNewHashEntry:didGrowTable:](self, "_createNewHashEntry:didGrowTable:", &string_table_storage[self->_string_table_offsets[v8->var1]], &v17);
        v10 = &self->_hash_table[v9];
        var2 = v8->var2;
        *(_QWORD *)&v10->var0 = *(_QWORD *)&v8->var0;
        v10->var2 = var2;
        v8->var0 = v9;
      }
      ++v8;
      --v7;
    }
    while (v7);
    p_var2 = &hash_table->var2;
    do
    {
      if (*p_var2 != -1)
      {
        v13 = -[DYCaptureArchive _createNewHashEntry:didGrowTable:](self, "_createNewHashEntry:didGrowTable:", &string_table_storage[self->_string_table_offsets[*(p_var2 - 1)]], &v17);
        v14 = &self->_hash_table[v13];
        v15 = *p_var2;
        *(_QWORD *)&v14->var0 = *((_QWORD *)p_var2 - 1);
        v14->var2 = v15;
        self->_hash_table[v13].var2 = hash_table[*p_var2].var0;
      }
      p_var2 += 3;
      --hash_table_length;
    }
    while (hash_table_length);
  }
  free(hash_table);
}

- (unsigned)_createNewHashEntry:(const char *)a3 didGrowTable:(BOOL *)a4
{
  unsigned int v7;
  int v8;
  const char *v9;
  int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int hash_table_length;
  unsigned int v17;
  $938B03310D06493B2963E5A84CB75A7E *hash_table;
  unsigned int result;

  if (a4)
    *a4 = 0;
  v7 = -1640531527;
  v8 = *(unsigned __int8 *)a3;
  if (*a3)
  {
    v9 = a3 + 2;
    while (1)
    {
      v10 = *((unsigned __int8 *)v9 - 1);
      if (!*(v9 - 1))
        break;
      v11 = v7 + v8;
      v12 = *(unsigned __int8 *)v9;
      v9 += 2;
      v8 = v12;
      v7 = ((v11 << 16) ^ (v10 << 11) ^ v11) + (((v11 << 16) ^ (v10 << 11) ^ v11) >> 11);
      if (!v12)
        goto LABEL_9;
    }
    v7 = ((v7 + v8) ^ ((v7 + v8) << 11)) + (((v7 + v8) ^ ((v7 + v8) << 11)) >> 17);
  }
LABEL_9:
  v13 = (v7 ^ (8 * v7)) + ((v7 ^ (8 * v7)) >> 5);
  v14 = (v13 ^ (4 * v13)) + ((v13 ^ (4 * v13)) >> 15);
  v15 = v14 ^ (v14 << 10);
  if (!v15)
    v15 = 0x40000000;
  hash_table_length = self->_header.hash_table_length;
  v17 = v15 % hash_table_length;
  hash_table = self->_hash_table;
  if (hash_table[v17].var0 == -1)
    return v17;
  if (v17 + 1 == hash_table_length)
    result = 0;
  else
    result = v17 + 1;
  if (result == v17)
  {
LABEL_21:
    -[DYCaptureArchive _growHashTable](self, "_growHashTable");
    if (a4)
      *a4 = 1;
    return -[DYCaptureArchive _createNewHashEntry:didGrowTable:](self, "_createNewHashEntry:didGrowTable:", a3, 0);
  }
  else
  {
    while (hash_table[result].var0 != -1)
    {
      if (result + 1 == hash_table_length)
        result = 0;
      else
        ++result;
      if (result == v17)
        goto LABEL_21;
    }
  }
  return result;
}

- (unsigned)_createNewFileEntry
{
  unsigned int file_table_length;

  file_table_length = self->_header.file_table_length;
  if (file_table_length == self->_file_table_capacity)
  {
    self->_file_table_capacity = 2 * file_table_length;
    self->_file_table = ($26580380F16D6530B01F933C495FCEE1 *)malloc_type_realloc(self->_file_table, 48 * file_table_length, 0x1000040504FFAC1uLL);
    file_table_length = self->_header.file_table_length;
  }
  self->_header.file_table_length = file_table_length + 1;
  -[DYCaptureArchive resizeCache](self, "resizeCache");
  return file_table_length;
}

- (unsigned)_createNewNameEntry
{
  uint64_t name_table_length;
  id *v4;

  name_table_length = self->_header.name_table_length;
  if ((_DWORD)name_table_length == self->_name_table_capacity)
  {
    self->_name_table_capacity = 2 * name_table_length;
    self->_name_table = ($7E080378D8F67055EE0984892F39872B *)malloc_type_realloc(self->_name_table, 2 * (2 * name_table_length), 0x1000040BDFB0063uLL);
    self->_string_table_offsets = (unint64_t *)malloc_type_realloc(self->_string_table_offsets, 8 * self->_name_table_capacity, 0x100004000313F17uLL);
    v4 = (id *)malloc_type_realloc(self->_string_table_nscache, 8 * self->_name_table_capacity, 0x80040B8603338uLL);
    self->_string_table_nscache = v4;
    bzero(&v4[name_table_length], 8 * name_table_length);
    LODWORD(name_table_length) = self->_header.name_table_length;
  }
  self->_header.name_table_length = name_table_length + 1;
  return name_table_length;
}

- (unint64_t)_reserveStringStorageSize:(unint64_t)a3
{
  unsigned int name_table_length;
  uint64_t v5;
  unint64_t string_table_capacity;
  unint64_t v7;
  uint64_t var0;
  size_t v9;
  char *v10;
  unint64_t result;
  unint64_t v12;
  size_t v13;
  char *v14;

  name_table_length = self->_header.name_table_length;
  if (name_table_length)
  {
    v5 = name_table_length - 1;
    string_table_capacity = self->_string_table_capacity;
    v7 = self->_string_table_offsets[v5];
    var0 = self->_name_table[v5].var0;
    if (v7 + a3 + var0 > string_table_capacity)
    {
      v9 = ((a3 + *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8]) + string_table_capacity;
      v10 = (char *)malloc_type_realloc(self->_string_table_storage, v9, 0x921731F9uLL);
      self->_string_table_storage = v10;
      bzero(&v10[self->_string_table_capacity], v9 - self->_string_table_capacity);
      self->_string_table_capacity = v9;
      v7 = self->_string_table_offsets[v5];
      var0 = self->_name_table[v5].var0;
    }
    return v7 + var0;
  }
  else
  {
    v12 = self->_string_table_capacity;
    if (v12 >= a3)
    {
      return 0;
    }
    else
    {
      v13 = ((a3 + *MEMORY[0x24BDB03C8] - 1) & -*MEMORY[0x24BDB03C8]) + v12;
      v14 = (char *)malloc_type_realloc(self->_string_table_storage, v13, 0x52000063uLL);
      self->_string_table_storage = v14;
      bzero(&v14[self->_string_table_capacity], v13 - self->_string_table_capacity);
      result = 0;
      self->_string_table_capacity = v13;
    }
  }
  return result;
}

- (unsigned)_findHashEntry:(const char *)a3
{
  int v3;
  const char *v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int hash_table_length;
  unsigned int v14;
  $938B03310D06493B2963E5A84CB75A7E *hash_table;
  const char *string_table_storage;
  unint64_t *string_table_offsets;
  unsigned int v18;

  v3 = *(unsigned __int8 *)a3;
  if (*a3)
  {
    v5 = a3 + 2;
    v6 = -1640531527;
    while (1)
    {
      v7 = *((unsigned __int8 *)v5 - 1);
      if (!*(v5 - 1))
        break;
      v8 = v6 + v3;
      v9 = *(unsigned __int8 *)v5;
      v5 += 2;
      v3 = v9;
      v6 = ((v8 << 16) ^ (v7 << 11) ^ v8) + (((v8 << 16) ^ (v7 << 11) ^ v8) >> 11);
      if (!v9)
        goto LABEL_7;
    }
    v6 = ((v6 + v3) ^ ((v6 + v3) << 11)) + (((v6 + v3) ^ ((v6 + v3) << 11)) >> 17);
LABEL_7:
    v10 = (v6 ^ (8 * v6)) + ((v6 ^ (8 * v6)) >> 5);
    v11 = (v10 ^ (4 * v10)) + ((v10 ^ (4 * v10)) >> 15);
    v12 = v11 ^ (v11 << 10);
    if (!v12)
      v12 = 0x40000000;
    hash_table_length = self->_header.hash_table_length;
    v14 = v12 % hash_table_length;
    hash_table = self->_hash_table;
    if (hash_table[v12 % hash_table_length].var0 != -1)
    {
      string_table_storage = (const char *)self->_string_table_storage;
      string_table_offsets = self->_string_table_offsets;
      if (!strcmp(a3, &string_table_storage[string_table_offsets[hash_table[v14].var1]]))
        return v14;
      if (v14 + 1 == hash_table_length)
        v18 = 0;
      else
        v18 = v14 + 1;
      while (v18 != v14)
      {
        if (hash_table[v18].var0 == -1)
          break;
        if (!strcmp(a3, &string_table_storage[string_table_offsets[hash_table[v18].var1]]))
          return v18;
        if (v18 + 1 == hash_table_length)
          v18 = 0;
        else
          ++v18;
      }
    }
  }
  return -1;
}

- (void)_performEmptyStringTableNSCache
{
  uint64_t name_table_length;
  unint64_t v4;
  uint64_t v5;

  if (self->_string_table_nscache)
  {
    name_table_length = self->_header.name_table_length;
    if ((_DWORD)name_table_length)
    {
      v4 = 0;
      v5 = 8 * name_table_length;
      do
      {

        self->_string_table_nscache[v4 / 8] = 0;
        v4 += 8;
      }
      while (v5 != v4);
    }
  }
}

- (void)_fillStringTableNSCacheForRange:(_NSRange)a3
{
  int length;
  char *string_table_storage;
  uint64_t location_low;
  char *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  void *v11;

  length = a3.length;
  if (LODWORD(a3.location) < LODWORD(a3.location) + LODWORD(a3.length))
  {
    string_table_storage = (char *)self->_string_table_storage;
    location_low = LODWORD(a3.location);
    do
    {
      if (!self->_string_table_nscache[location_low])
      {
        v7 = &string_table_storage[self->_string_table_offsets[location_low]];
        v8 = -[DYCaptureArchive isReadOnly](self, "isReadOnly");
        v9 = objc_alloc(MEMORY[0x24BDD17C8]);
        v10 = self->_name_table[location_low].var0 - 1;
        if (v8)
          v11 = (void *)objc_msgSend(v9, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, v10, 1, 0);
        else
          v11 = (void *)objc_msgSend(v9, "initWithBytes:length:encoding:", v7, v10, 1);
        self->_string_table_nscache[location_low] = v11;
      }
      ++location_low;
      --length;
    }
    while (length);
  }
}

- (unint64_t)countOfFilenames
{
  return self->_header.name_table_length;
}

- (id)objectInFilenamesAtIndex:(unint64_t)a3
{
  -[DYCaptureArchive _fillStringTableNSCacheForRange:](self, "_fillStringTableNSCacheForRange:", a3, 1);
  return self->_string_table_nscache[a3];
}

- (id)filenamesAtIndexes:(id)a3
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  _QWORD v11[2];
  _QWORD v12[51];

  v12[50] = *MEMORY[0x24BDAC8D0];
  v11[0] = 0;
  v11[1] = -[DYCaptureArchive countOfFilenames](self, "countOfFilenames");
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  do
  {
    v6 = objc_msgSend(a3, "getIndexes:maxCount:inIndexRange:", v12, 50, v11);
    -[DYCaptureArchive _fillStringTableNSCacheForRange:](self, "_fillStringTableNSCacheForRange:");
    if (!v6)
      break;
    v7 = 0;
    v8 = 1;
    do
    {
      objc_msgSend(v5, "addObject:", self->_string_table_nscache[v12[v7]]);
      v7 = v8;
    }
    while (v6 > v8++);
  }
  while (v6 >= 0x32);
  return v5;
}

- (void)getFilenames:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  -[DYCaptureArchive _fillStringTableNSCacheForRange:](self, "_fillStringTableNSCacheForRange:", a4.location, a4.length);
  memmove(a3, &self->_string_table_nscache[location], 8 * length);
}

- (vector<unsigned)getSortedFilePositionsForDataCaching
{
  unsigned int v5;
  __compressed_pair<unsigned long long *, std::allocator<unsigned long long>> *p_end_cap;
  unint64_t *end;
  unint64_t *v8;
  unint64_t *begin;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  _QWORD v22[5];
  _QWORD *v23;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  std::vector<unsigned long long>::reserve((void **)&retstr->__begin_, self->_header.file_table_length);
  if (self->_header.file_table_length)
  {
    v5 = 0;
    p_end_cap = &retstr->__end_cap_;
    end = retstr->__end_;
    do
    {
      if (end >= p_end_cap->__value_)
      {
        begin = retstr->__begin_;
        v10 = end - retstr->__begin_;
        v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 61)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v12 = (char *)p_end_cap->__value_ - (char *)begin;
        if (v12 >> 2 > v11)
          v11 = v12 >> 2;
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
          v13 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v13 = v11;
        if (v13)
        {
          v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&retstr->__end_cap_, v13);
          begin = retstr->__begin_;
          end = retstr->__end_;
        }
        else
        {
          v14 = 0;
        }
        v15 = (unint64_t *)&v14[8 * v10];
        *v15 = v5;
        v8 = v15 + 1;
        while (end != begin)
        {
          v16 = *--end;
          *--v15 = v16;
        }
        retstr->__begin_ = v15;
        retstr->__end_ = v8;
        retstr->__end_cap_.__value_ = (unint64_t *)&v14[8 * v13];
        if (begin)
          operator delete(begin);
      }
      else
      {
        *end = v5;
        v8 = end + 1;
      }
      retstr->__end_ = v8;
      ++v5;
      end = v8;
    }
    while (v5 != self->_header.file_table_length);
  }
  else
  {
    v8 = retstr->__end_;
  }
  v17 = retstr->__begin_;
  v18 = 126 - 2 * __clz(v8 - retstr->__begin_);
  v19 = v8 == retstr->__begin_;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__DYCaptureArchive_getSortedFilePositionsForDataCaching__block_invoke;
  v22[3] = &unk_250D58878;
  v22[4] = self;
  v23 = v22;
  if (v19)
    v20 = 0;
  else
    v20 = v18;
  return (vector<unsigned long long, std::allocator<unsigned long long>> *)std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *,false>((uint64_t)v17, (uint64_t *)v8, (uint64_t)&v23, v20, 1);
}

BOOL __56__DYCaptureArchive_getSortedFilePositionsForDataCaching__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  v4 = *(_DWORD *)(v3 + 24 * a2 + 20);
  v5 = *(_DWORD *)(v3 + 24 * a3 + 20);
  v6 = v4 > v5;
  if (v4 == v5)
    return *(_DWORD *)(v3 + 24 * a2) > *(_DWORD *)(v3 + 24 * a3);
  return v6;
}

- (id)filenamesWithPrefix:(id)a3 error:(id *)a4
{
  volatile int *v7;
  _BYTE *v8;
  char *string_table_storage;
  id v10;
  uint64_t name_table_length;
  uint64_t i;
  char *v13;
  int v14;
  BOOL v15;
  int v16;
  BOOL v17;
  unsigned int v18;
  BOOL v19;
  id v20;
  _BYTE v22[24];
  OS_dispatch_semaphore *lock_global_semaphore;

  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v22, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  lock_global_semaphore = 0;
  v8 = (_BYTE *)objc_msgSend(-[DYCaptureArchive _getCFilename:outSize:error:](self, "_getCFilename:outSize:error:", a3, &lock_global_semaphore, a4), "bytes");
  if (v8)
  {
    lock_global_semaphore = (OS_dispatch_semaphore *)((char *)lock_global_semaphore - 1);
    string_table_storage = (char *)self->_string_table_storage;
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    name_table_length = self->_header.name_table_length;
    if ((_DWORD)name_table_length)
    {
      for (i = 0; i != name_table_length; ++i)
      {
        v13 = &string_table_storage[self->_string_table_offsets[i]];
        v14 = *v8;
        v15 = *v8 != 0;
        v16 = *v13;
        if (*v13)
          v17 = v14 == 0;
        else
          v17 = 1;
        if (v17)
        {
LABEL_15:
          if (v16)
            goto LABEL_19;
        }
        else
        {
          v18 = 1;
          while (v16 == v14)
          {
            v14 = v8[v18];
            v15 = v8[v18] != 0;
            v16 = v13[v18++];
            if (v16)
              v19 = v14 == 0;
            else
              v19 = 1;
            if (v19)
              goto LABEL_15;
          }
          v15 = 1;
        }
        if (!v15)
LABEL_19:
          objc_msgSend(v10, "addObject:", -[DYCaptureArchive objectInFilenamesAtIndex:](self, "objectInFilenamesAtIndex:", i));
      }
    }
    v20 = v10;
  }
  else
  {
    v20 = 0;
  }
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v22, v7);
  return v20;
}

- (id)filenamesWithPredicate:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t name_table_length;
  unint64_t v8;
  uint64_t v9;
  id v10;

  -[DYCaptureArchive _fillStringTableNSCacheForRange:](self, "_fillStringTableNSCacheForRange:", 0, self->_header.name_table_length);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  name_table_length = self->_header.name_table_length;
  if ((_DWORD)name_table_length)
  {
    v8 = 0;
    v9 = 8 * name_table_length;
    do
    {
      v10 = self->_string_table_nscache[v8 / 8];
      if (objc_msgSend(a3, "evaluateWithObject:", v10))
        objc_msgSend(v6, "addObject:", v10);
      v8 += 8;
    }
    while (v9 != v8);
  }
  return v6;
}

- (id)_resolveCFilename:(const char *)a3 error:(id *)a4
{
  unsigned int v7;
  $938B03310D06493B2963E5A84CB75A7E *hash_table;
  unsigned int var2;

  v7 = -[DYCaptureArchive _findHashEntry:](self, "_findHashEntry:");
  if (v7 == -1)
  {
    if (a4)
      *a4 = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 13, 0);
    return 0;
  }
  else
  {
    hash_table = self->_hash_table;
    var2 = hash_table[v7].var2;
    if (var2 == -1)
      return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a3, 1);
    else
      return -[DYCaptureArchive objectInFilenamesAtIndex:](self, "objectInFilenamesAtIndex:", hash_table[var2].var1);
  }
}

- (id)resolveFilename:(id)a3 error:(id *)a4
{
  volatile int *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _BYTE v12[24];
  OS_dispatch_semaphore *lock_global_semaphore;

  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v12, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (!objc_msgSend(a3, "length"))
  {
    if (a4)
    {
      v8 = 1;
      goto LABEL_7;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  if (!-[DYCaptureArchive isClosed](self, "isClosed"))
  {
    v10 = objc_msgSend(-[DYCaptureArchive _getCFilename:outSize:error:](self, "_getCFilename:outSize:error:", a3, 0, a4), "bytes");
    if (v10)
    {
      v9 = -[DYCaptureArchive _resolveCFilename:error:](self, "_resolveCFilename:error:", v10, a4);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_10;
  v8 = 20;
LABEL_7:
  v9 = 0;
  *a4 = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], v8, 0);
LABEL_11:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v12, v7);
  return v9;
}

- (BOOL)_writeMetadataInPath:(id)a3 error:(id *)a4
{
  CFStringRef v7;
  CFStringRef v8;
  void *v9;

  v7 = CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x24BDBD240], self->_uuid);
  if (v7)
  {
    v8 = v7;
    -[NSMutableDictionary setObject:forKey:](self->_metadata, "setObject:forKey:", v7, CFSTR("(uuid)"));
    CFRelease(v8);
  }
  v9 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", self->_metadata, 200, 0, a4);
  -[NSMutableDictionary removeObjectForKey:](self->_metadata, "removeObjectForKey:", CFSTR("(uuid)"));
  if (v9)
    return objc_msgSend(v9, "writeToFile:options:error:", objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("metadata")), 1, a4);
  else
    return 0;
}

- (BOOL)_writeIndexInPath:(id)a3 error:(id *)a4
{
  const std::__fs::filesystem::path *v7;
  int v8;
  int v9;
  uint64_t hash_table_length;
  uint64_t v11;
  uint64_t v12;
  uint64_t name_table_length;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  ssize_t v17;
  uint64_t v18;
  ssize_t v19;
  uint64_t v20;
  ssize_t v21;
  uint64_t v22;
  ssize_t v23;
  int64_t v24;
  ssize_t v25;
  const std::__fs::filesystem::path *v26;
  std::error_code *v27;
  int v28;
  BOOL v29;
  BOOL result;
  void *v31;
  id *v32;
  unsigned int v33;
  unsigned int file_table_length;

  v7 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR(".index")), "fileSystemRepresentation");
  v8 = open((const char *)v7, 1570, 420);
  if (v8 == -1)
    goto LABEL_39;
  v9 = v8;
  hash_table_length = self->_header.hash_table_length;
  v11 = 12 * hash_table_length;
  v12 = 24 * self->_header.file_table_length;
  name_table_length = self->_header.name_table_length;
  v14 = 2 * name_table_length;
  v33 = self->_header.name_table_length;
  file_table_length = self->_header.file_table_length;
  v15 = (_DWORD)name_table_length
      ? self->_string_table_offsets[(name_table_length - 1)]
      + self->_name_table[(name_table_length - 1)].var0
      : 0;
  if (ftruncate(v8, v11 + v12 + v14 + v15 + 20) == -1)
  {
LABEL_39:
    if (!a4)
      return 0;
LABEL_40:
    v31 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    result = 0;
    *a4 = v31;
    return result;
  }
  v32 = a4;
  v16 = 0;
  do
  {
    v17 = write(v9, (char *)&self->_header + v16, 20 - v16);
    if (v17 == -1)
    {
      if (*__error() != 4)
      {
LABEL_38:
        a4 = v32;
        goto LABEL_39;
      }
    }
    else
    {
      v16 += v17;
    }
  }
  while (v16 < 20);
  if ((_DWORD)hash_table_length)
  {
    v18 = 0;
    do
    {
      v19 = write(v9, (char *)self->_hash_table + v18, v11 - v18);
      if (v19 == -1)
      {
        if (*__error() != 4)
          goto LABEL_38;
      }
      else
      {
        v18 += v19;
      }
    }
    while (v18 < v11);
  }
  if (file_table_length)
  {
    v20 = 0;
    do
    {
      v21 = write(v9, (char *)self->_file_table + v20, v12 - v20);
      if (v21 == -1)
      {
        if (*__error() != 4)
          goto LABEL_38;
      }
      else
      {
        v20 += v21;
      }
    }
    while (v20 < v12);
  }
  if (v33)
  {
    v22 = 0;
    do
    {
      v23 = write(v9, (char *)self->_name_table + v22, v14 - v22);
      if (v23 == -1)
      {
        if (*__error() != 4)
          goto LABEL_38;
      }
      else
      {
        v22 += v23;
      }
    }
    while (v22 < v14);
  }
  if (v15 >= 1)
  {
    v24 = 0;
    do
    {
      v25 = write(v9, (char *)self->_string_table_storage + v24, v15 - v24);
      if (v25 == -1)
      {
        if (*__error() != 4)
          goto LABEL_38;
      }
      else
      {
        v24 += v25;
      }
    }
    while (v24 < v15);
  }
  fcntl(self->_backingStoreFD, 51);
  close(v9);
  v26 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("index")), "fileSystemRepresentation");
  rename(v7, v26, v27);
  v29 = v28 == -1;
  result = v28 != -1;
  a4 = v32;
  if (v32 && v29)
    goto LABEL_40;
  return result;
}

- (BOOL)_performCommit:(id *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  NSString *v11;
  off_t backingStoreWritePosition;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_modified)
    goto LABEL_17;
  if (-[DYCaptureArchive isReadOnly](self, "isReadOnly"))
  {
    if (a3)
    {
      v5 = *MEMORY[0x24BE39080];
      v6 = (void *)MEMORY[0x24BE39108];
      v7 = 7;
LABEL_5:
      v8 = 0;
LABEL_6:
      v9 = (void *)objc_msgSend(v6, "errorWithDomain:code:userInfo:", v5, v7, v8);
      LOBYTE(v10) = 0;
      *a3 = v9;
      return v10;
    }
    goto LABEL_22;
  }
  v11 = -[DYCaptureArchive path](self, "path");
  if (self->_store_write_ptr != self->_store_write_buffer)
  {
    if (-[DYCaptureArchive _writeBufferToBackingStore:size:error:](self, "_writeBufferToBackingStore:size:error:") == -1)
      goto LABEL_22;
    self->_store_write_ptr = self->_store_write_buffer;
  }
  fcntl(self->_backingStoreFD, 51);
  backingStoreWritePosition = self->_backingStoreWritePosition;
  if (self->_backingStoreSize > backingStoreWritePosition)
  {
    if (ftruncate(self->_backingStoreFD, backingStoreWritePosition) == -1)
    {
      if (a3)
      {
        v15 = (void *)MEMORY[0x24BDD1540];
        v16 = *MEMORY[0x24BDD1128];
        v7 = *__error();
        v6 = v15;
        v5 = v16;
        goto LABEL_5;
      }
LABEL_22:
      LOBYTE(v10) = 0;
      return v10;
    }
    self->_backingStoreSize = self->_backingStoreWritePosition;
  }
  if (!v11)
  {
    if (a3)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BE39080];
      v18 = *MEMORY[0x24BDD0FC8];
      v19[0] = CFSTR("Capture archive path is nil");
      v8 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v6 = v13;
      v5 = v14;
      v7 = 14;
      goto LABEL_6;
    }
    goto LABEL_22;
  }
  v10 = -[DYCaptureArchive _writeMetadataInPath:error:](self, "_writeMetadataInPath:error:", v11, a3);
  if (v10)
  {
    v10 = -[DYCaptureArchive _writeIndexInPath:error:](self, "_writeIndexInPath:error:", v11, a3);
    if (v10)
    {
      self->_modified = 0;
LABEL_17:
      LOBYTE(v10) = 1;
    }
  }
  return v10;
}

- (BOOL)commit:(id *)a3
{
  NSObject *add_group;
  NSObject *write_queue;
  uint64_t *v7;
  id v8;
  BOOL v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  dispatch_semaphore_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  if (self->_backingStoreFD == -1)
  {
    v9 = 0;
    if (a3)
      *a3 = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 20, 0);
  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3052000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v12 = 0;
    v13 = &v12;
    v14 = 0x3052000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    v17 = dispatch_semaphore_create(0);
    write_queue = self->_write_queue;
    add_group = self->_add_group;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __27__DYCaptureArchive_commit___block_invoke;
    v11[3] = &unk_250D588A0;
    v11[4] = self;
    v11[5] = &v24;
    v11[6] = &v18;
    v11[7] = &v12;
    dispatch_group_notify(add_group, write_queue, v11);
    dispatch_semaphore_wait((dispatch_semaphore_t)v13[5], 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release((dispatch_object_t)v13[5]);
    v7 = v19;
    if (a3)
      *a3 = (id)v19[5];
    v8 = (id)v7[5];
    v9 = *((_BYTE *)v25 + 24) != 0;
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  return v9;
}

intptr_t __27__DYCaptureArchive_commit___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *dsema;

  dsema = *(NSObject **)(*(_QWORD *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performCommit:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  return dispatch_semaphore_signal(dsema);
}

- (BOOL)commitForExport:(id *)a3 progressHandler:(id)a4
{
  DYCaptureArchive *v4;
  unint64_t hash_table_length;
  uint64_t v7;
  unint64_t v8;
  $938B03310D06493B2963E5A84CB75A7E *v9;
  unsigned int var0;
  $26580380F16D6530B01F933C495FCEE1 *file_table;
  $26580380F16D6530B01F933C495FCEE1 *v12;
  unsigned int *p_var3;
  unsigned int v14;
  unsigned int var3;
  char *v16;
  void *v17;
  uint64_t v18;
  NSURL *v19;
  const char *v20;
  std::string *v21;
  std::string *v22;
  uint64_t v23;
  NSObject *global_queue;
  id *v26;
  _QWORD block[10];
  std::string v28;
  stat v29;

  v26 = a3;
  v4 = self;
  LODWORD(hash_table_length) = self->_header.hash_table_length;
  if ((_DWORD)hash_table_length)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      if (a4)
        self = (DYCaptureArchive *)(*((uint64_t (**)(id, SEL, float))a4 + 2))(a4, a2, (float)(v8 + 1) / (float)hash_table_length);
      v9 = &v4->_hash_table[v7];
      var0 = v9->var0;
      if (v9->var0 != -1)
      {
        file_table = v4->_file_table;
        v12 = &file_table[var0];
        var3 = v12->var3;
        p_var3 = &v12->var3;
        v14 = var3;
        if ((var3 & 2) != 0)
        {
          *p_var3 = v14 & 0xFFFFFFFC | 1;
          v16 = (char *)v4->_string_table_storage + v4->_string_table_offsets[file_table[var0].var1.var0];
          v17 = (void *)MEMORY[0x2426225CC](self, a2);
          v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v16);
          v19 = -[NSURL URLByAppendingPathComponent:](v4->_url, "URLByAppendingPathComponent:", v18);
          memset(&v28, 0, sizeof(v28));
          v20 = -[NSURL fileSystemRepresentation](v19, "fileSystemRepresentation");
          memset(&v29, 0, sizeof(v29));
          if (lstat(v20, &v29)
            || (v29.st_mode & 0xF000) != 0xA000
            || ((std::string::resize(&v28, v29.st_size, 0),
                 (v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              ? (v21 = &v28)
              : (v21 = (std::string *)v28.__r_.__value_.__r.__words[0]),
                readlink(v20, (char *)v21, v29.st_size + 1) < 0))
          {
            v23 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v19, v26);
            dispatch_group_enter((dispatch_group_t)v4->_add_group);
            global_queue = dispatch_get_global_queue(0, 0);
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __52__DYCaptureArchive_commitForExport_progressHandler___block_invoke;
            block[3] = &unk_250D588F0;
            block[4] = v23;
            block[5] = v4;
            block[8] = v26;
            block[9] = v9;
            block[6] = v18;
            block[7] = v19;
            dispatch_async(global_queue, block);
          }
          else
          {
            if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v22 = &v28;
            else
              v22 = (std::string *)v28.__r_.__value_.__r.__words[0];
            v9->var0 = v4->_hash_table[-[DYCaptureArchive _findHashEntry:](v4, "_findHashEntry:", v22, v26)].var0;
            objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtURL:error:", v19, 0);
          }
          if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v28.__r_.__value_.__l.__data_);
          objc_autoreleasePoolPop(v17);
        }
      }
      ++v8;
      hash_table_length = v4->_header.hash_table_length;
      ++v7;
    }
    while (v8 < hash_table_length);
  }
  return -[DYCaptureArchive commit:](v4, "commit:", v26, a4, v26);
}

void __52__DYCaptureArchive_commitForExport_progressHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = objc_msgSend(MEMORY[0x24BDBCE50], "dy_dataByCompressingData:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
  if (v2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__DYCaptureArchive_commitForExport_progressHandler___block_invoke_2;
    block[3] = &unk_250D588C8;
    v3 = *(_QWORD *)(a1 + 72);
    v7 = *(_OWORD *)(a1 + 40);
    v4 = *(NSObject **)(v7 + 208);
    v5 = *(_QWORD *)(a1 + 56);
    v8 = v2;
    v9 = v5;
    v10 = v3;
    dispatch_async(v4, block);
  }
}

intptr_t __52__DYCaptureArchive_commitForExport_progressHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *dsema;
  uint64_t v6;

  dsema = *(NSObject **)(*(_QWORD *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  v6 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "_performFinalizeAddFileAtPosition:name:data:error:", **(unsigned int **)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v6) & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = v6;
    _DYOLog();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v3, v4), "removeItemAtURL:error:", *(_QWORD *)(a1 + 56), 0);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 216));
  return dispatch_semaphore_signal(dsema);
}

- (void)discardAndClose
{
  NSObject *write_queue;
  _QWORD block[5];

  if (self->_backingStoreFD != -1)
  {
    write_queue = self->_write_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__DYCaptureArchive_discardAndClose__block_invoke;
    block[3] = &unk_250D587B0;
    block[4] = self;
    dispatch_sync(write_queue, block);
  }
}

intptr_t __35__DYCaptureArchive_discardAndClose__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  NSObject *dsema;

  dsema = *(NSObject **)(*(_QWORD *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  close(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 264));
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 264) = -1;
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[273])
  {
    objc_msgSend((id)objc_opt_new(), "removeItemAtURL:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0);
    v2 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v2, "_performEmptyStringTableNSCache");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = 0;
  *(_DWORD *)(v3 + 48) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 272) = 0;
  return dispatch_semaphore_signal(dsema);
}

- (void)close
{
  if (self->_modified)
    _DYOLog();
  -[DYCaptureArchive discardAndClose](self, "discardAndClose");
}

- (int64_t)_writeBufferToBackingStore:(const void *)a3 size:(int64_t)a4 error:(id *)a5
{
  int64_t backingStoreSize;
  int64_t v10;
  off_t v11;
  int64_t v12;
  off_t v13;
  int64_t v14;
  ssize_t v15;

  backingStoreSize = self->_backingStoreSize;
  v10 = self->_backingStoreWritePosition + a4;
  if (v10 > backingStoreSize)
  {
    v11 = backingStoreSize + 40960;
    v12 = (v10 & 0xFFFFFFFFFFFFF000) + 4096;
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    if (ftruncate(self->_backingStoreFD, v13) == -1)
    {
LABEL_16:
      if (a5)
        *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      return -1;
    }
    self->_backingStoreSize = v13;
  }
  if (a4 < 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = 0;
    do
    {
      v15 = pwrite(self->_backingStoreFD, (char *)a3 + v14, a4 - v14, self->_backingStoreWritePosition);
      if (v15 == -1)
      {
        if (*__error() != 4)
          goto LABEL_16;
      }
      else
      {
        v14 += v15;
      }
    }
    while (v14 < a4);
  }
  self->_backingStoreWritePosition += v14;
  return v14;
}

- (BOOL)_flushWriteBuffer:(id *)a3
{
  int64_t v4;

  v4 = -[DYCaptureArchive _writeBufferToBackingStore:size:error:](self, "_writeBufferToBackingStore:size:error:", self->_store_write_buffer, (char *)self->_store_write_ptr - (char *)self->_store_write_buffer, a3);
  if (v4 != -1)
    self->_store_write_ptr = self->_store_write_buffer;
  return v4 != -1;
}

- (BOOL)_performAddAlias:(id)a3 targetting:(id)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  unsigned int var2;
  unsigned int v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  unsigned int v16;
  unsigned int v17;
  $938B03310D06493B2963E5A84CB75A7E *hash_table;
  unsigned int v19;
  void *v20;
  void *v21;
  $938B03310D06493B2963E5A84CB75A7E *v22;
  unsigned int v23;
  char v25;
  uint64_t v26;

  v26 = 0;
  v9 = objc_msgSend(-[DYCaptureArchive _getCFilename:outSize:error:](self, "_getCFilename:outSize:error:", a4, &v26), "bytes");
  if (v9)
  {
    v10 = v9;
    var2 = -[DYCaptureArchive _findHashEntry:](self, "_findHashEntry:", v9);
    if (var2 == -1)
    {
      v20 = (void *)-[NSMutableDictionary objectForKey:](self->_aliasCreationMap, "objectForKey:", a4);
      if (!v20)
      {
        v20 = (void *)objc_opt_new();
        -[NSMutableDictionary setObject:forKey:](self->_aliasCreationMap, "setObject:forKey:", v20, a4);

      }
      objc_msgSend(v20, "addObject:", a3);
      LOBYTE(v9) = 1;
    }
    else
    {
      do
      {
        v12 = var2;
        var2 = self->_hash_table[var2].var2;
      }
      while (var2 != -1);
      v13 = objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 1) + 1;
      v14 = -[DYCaptureArchive _reserveStringStorageSize:](self, "_reserveStringStorageSize:", v13);
      v15 = (char *)self->_string_table_storage + v14;
      if ((objc_msgSend(a3, "getCString:maxLength:encoding:", v15, v13, 1) & 1) != 0)
      {
        if (-[DYCaptureArchive _findHashEntry:](self, "_findHashEntry:", v15) == -1)
        {
          v25 = 0;
          v16 = -[DYCaptureArchive _createNewHashEntry:didGrowTable:](self, "_createNewHashEntry:didGrowTable:", v15, &v25);
          if (v25)
          {
            v17 = -[DYCaptureArchive _findHashEntry:](self, "_findHashEntry:", v10);
            hash_table = self->_hash_table;
            do
            {
              v12 = v17;
              v17 = hash_table[v17].var2;
            }
            while (v17 != -1);
            v19 = v12;
          }
          else
          {
            v19 = v12;
            hash_table = self->_hash_table;
          }
          v22 = &hash_table[v16];
          v22->var0 = hash_table[v19].var0;
          v23 = -[DYCaptureArchive _createNewNameEntry](self, "_createNewNameEntry");
          self->_name_table[v23].var0 = v13;
          v22->var1 = v23;
          v22->var2 = v12;
          self->_string_table_offsets[v23] = v14;
        }
        LOBYTE(v9) = 1;
        self->_modified = 1;
      }
      else if (a5)
      {
        v21 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 1, 0);
        LOBYTE(v9) = 0;
        *a5 = v21;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return v9;
}

- (BOOL)addAlias:(id)a3 forName:(id)a4 options:(id)a5 error:(id *)a6 waitUntilDone:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  NSObject *write_queue;
  NSObject *add_group;
  NSObject *v19;
  _QWORD v20[7];
  _QWORD block[9];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v7 = a7;
  if (!objc_msgSend(a4, "length") || !objc_msgSend(a3, "length"))
  {
    if (a6)
    {
      v12 = *MEMORY[0x24BE39080];
      v13 = (void *)MEMORY[0x24BE39108];
      v14 = 1;
      goto LABEL_8;
    }
    return 0;
  }
  if (-[DYCaptureArchive isReadOnly](self, "isReadOnly"))
  {
    if (a6)
    {
      v12 = *MEMORY[0x24BE39080];
      v13 = (void *)MEMORY[0x24BE39108];
      v14 = 7;
LABEL_8:
      v15 = 0;
      *a6 = (id)objc_msgSend(v13, "errorWithDomain:code:userInfo:", v12, v14, 0);
      return v15;
    }
    return 0;
  }
  if (-[DYCaptureArchive isClosed](self, "isClosed"))
  {
    if (a6)
    {
      v12 = *MEMORY[0x24BE39080];
      v13 = (void *)MEMORY[0x24BE39108];
      v14 = 20;
      goto LABEL_8;
    }
    return 0;
  }
  if (v7)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    dispatch_group_enter((dispatch_group_t)self->_add_group);
    write_queue = self->_write_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__DYCaptureArchive_addAlias_forName_options_error_waitUntilDone___block_invoke;
    block[3] = &unk_250D58918;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = &v22;
    block[8] = a6;
    dispatch_sync(write_queue, block);
    dispatch_group_leave((dispatch_group_t)self->_add_group);
    v15 = *((_BYTE *)v23 + 24) != 0;
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v19 = self->_write_queue;
    add_group = self->_add_group;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __65__DYCaptureArchive_addAlias_forName_options_error_waitUntilDone___block_invoke_2;
    v20[3] = &unk_250D58940;
    v20[4] = self;
    v20[5] = a3;
    v20[6] = a4;
    dispatch_group_async(add_group, v19, v20);
    return 1;
  }
  return v15;
}

intptr_t __65__DYCaptureArchive_addAlias_forName_options_error_waitUntilDone___block_invoke(uint64_t a1)
{
  NSObject *dsema;

  dsema = *(NSObject **)(*(_QWORD *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performAddAlias:targetting:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  return dispatch_semaphore_signal(dsema);
}

intptr_t __65__DYCaptureArchive_addAlias_forName_options_error_waitUntilDone___block_invoke_2(uint64_t a1)
{
  NSObject *dsema;
  uint64_t v4;

  dsema = *(NSObject **)(*(_QWORD *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  v4 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "_performAddAlias:targetting:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v4) & 1) == 0)_DYOLog();
  return dispatch_semaphore_signal(dsema);
}

- (BOOL)addAlias:(id)a3 forName:(id)a4 options:(id)a5 error:(id *)a6
{
  return -[DYCaptureArchive addAlias:forName:options:error:waitUntilDone:](self, "addAlias:forName:options:error:waitUntilDone:", a3, a4, a5, a6, 1);
}

- (unsigned)_performAddFileWithName:(id)a3 dataSize:(unsigned int)a4 error:(id *)a5
{
  return -[DYCaptureArchive _performAddFileWithName:dataSize:withFlags:error:](self, "_performAddFileWithName:dataSize:withFlags:error:", a3, *(_QWORD *)&a4, 0, a5);
}

- (unsigned)_performAddFileWithName:(id)a3 dataSize:(unsigned int)a4 withFlags:(unsigned int)a5 error:(id *)a6
{
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unsigned int result;
  $938B03310D06493B2963E5A84CB75A7E *v18;
  unsigned int v19;
  $26580380F16D6530B01F933C495FCEE1 *file_table;
  $26580380F16D6530B01F933C495FCEE1 *v21;

  v11 = objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 1) + 1;
  v12 = -[DYCaptureArchive _reserveStringStorageSize:](self, "_reserveStringStorageSize:", v11);
  v13 = (char *)self->_string_table_storage + v12;
  if ((objc_msgSend(a3, "getCString:maxLength:encoding:", v13, v11, 1) & 1) == 0)
  {
    if (a6)
    {
      v14 = *MEMORY[0x24BE39080];
      v15 = (void *)MEMORY[0x24BE39108];
      v16 = 1;
      goto LABEL_7;
    }
    return -1;
  }
  if (-[DYCaptureArchive _findHashEntry:](self, "_findHashEntry:", v13) != -1)
  {
    if (a6)
    {
      v14 = *MEMORY[0x24BE39080];
      v15 = (void *)MEMORY[0x24BE39108];
      v16 = 12;
LABEL_7:
      *a6 = (id)objc_msgSend(v15, "errorWithDomain:code:userInfo:", v14, v16, 0);
      return -1;
    }
    return -1;
  }
  v18 = &self->_hash_table[-[DYCaptureArchive _createNewHashEntry:didGrowTable:](self, "_createNewHashEntry:didGrowTable:", v13, 0)];
  v18->var0 = -[DYCaptureArchive _createNewFileEntry](self, "_createNewFileEntry");
  v19 = -[DYCaptureArchive _createNewNameEntry](self, "_createNewNameEntry");
  file_table = self->_file_table;
  self->_name_table[v19].var0 = v11;
  v18->var1 = v19;
  v18->var2 = -1;
  self->_string_table_offsets[v19] = v12;
  result = v18->var0;
  v21 = &file_table[v18->var0];
  v21->var0 = a4;
  *(_QWORD *)&v21->var3 = a5 | 1;
  if ((a5 & 2) != 0)
  {
    file_table[result].var1.var0 = v19;
    return v18->var0;
  }
  return result;
}

- (BOOL)_performFinalizeAddFileAtPosition:(unsigned int)a3 name:(id)a4 data:(id)a5 error:(id *)a6
{
  $26580380F16D6530B01F933C495FCEE1 *file_table;
  unsigned int v12;
  $26580380F16D6530B01F933C495FCEE1 *v13;
  char *v14;
  size_t v15;
  void *store_write_ptr;
  char *v17;
  char *v18;
  size_t v19;
  char *store_write_buffer;
  _BOOL4 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  file_table = self->_file_table;
  v12 = objc_msgSend(a5, "length");
  v13 = &file_table[a3];
  v13->var1.var0 = v12;
  v13->var2 = (char *)self->_store_write_ptr + self->_backingStoreWritePosition - (char *)self->_store_write_buffer;
  if (!objc_msgSend(a5, "length"))
    goto LABEL_23;
  v14 = (char *)objc_msgSend(a5, "bytes");
  v15 = objc_msgSend(a5, "length");
  store_write_ptr = self->_store_write_ptr;
  v17 = (char *)((char *)self->_store_write_buffer - (char *)store_write_ptr);
  v18 = v17 + 0x40000;
  v19 = v15 - (_QWORD)(v17 + 0x40000);
  if (v15 <= (unint64_t)(v17 + 0x40000))
  {
    memcpy(store_write_ptr, v14, v15);
    if ((char *)v15 == v18)
    {
      if (-[DYCaptureArchive _writeBufferToBackingStore:size:error:](self, "_writeBufferToBackingStore:size:error:", self->_store_write_buffer, 0x40000, a6) == -1)
      {
LABEL_9:
        LOBYTE(v21) = 0;
        return v21;
      }
      store_write_buffer = (char *)self->_store_write_buffer;
    }
    else
    {
      store_write_buffer = (char *)self->_store_write_ptr + v15;
    }
    self->_store_write_ptr = store_write_buffer;
  }
  else
  {
    memcpy(store_write_ptr, v14, (size_t)(v17 + 0x40000));
    if (-[DYCaptureArchive _writeBufferToBackingStore:size:error:](self, "_writeBufferToBackingStore:size:error:", self->_store_write_buffer, 0x40000, a6) == -1)goto LABEL_9;
    self->_store_write_ptr = self->_store_write_buffer;
    if (-[DYCaptureArchive _writeBufferToBackingStore:size:error:](self, "_writeBufferToBackingStore:size:error:", &v14[(_QWORD)v18], v19, a6) == -1)goto LABEL_9;
  }
  v22 = (void *)-[NSMutableDictionary objectForKey:](self->_aliasCreationMap, "objectForKey:", a4);
  if (!v22
    || (v23 = v22, !objc_msgSend(v22, "count"))
    || (v31 = 0u,
        v32 = 0u,
        v29 = 0u,
        v30 = 0u,
        (v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v33, 16)) == 0))
  {
LABEL_22:
    objc_opt_self();
LABEL_23:
    LOBYTE(v21) = 1;
    self->_modified = 1;
    return v21;
  }
  v25 = v24;
  v26 = *(_QWORD *)v30;
LABEL_16:
  v27 = 0;
  while (1)
  {
    if (*(_QWORD *)v30 != v26)
      objc_enumerationMutation(v23);
    v21 = -[DYCaptureArchive _performAddAlias:targetting:error:](self, "_performAddAlias:targetting:error:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v27), a4, a6);
    if (!v21)
      return v21;
    if (v25 == ++v27)
    {
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v25)
        goto LABEL_16;
      goto LABEL_22;
    }
  }
}

- (BOOL)addFileWithName:(id)a3 data:(id)a4 options:(id)a5 error:(id *)a6 waitUntilDone:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  NSObject *write_queue;
  NSObject *v18;
  _QWORD v19[7];
  _QWORD block[9];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a7;
  if (!objc_msgSend(a3, "length"))
  {
    if (a6)
    {
      v12 = *MEMORY[0x24BE39080];
      v13 = (void *)MEMORY[0x24BE39108];
      v14 = 1;
      goto LABEL_13;
    }
    return 0;
  }
  if (-[DYCaptureArchive isReadOnly](self, "isReadOnly"))
  {
    if (a6)
    {
      v12 = *MEMORY[0x24BE39080];
      v13 = (void *)MEMORY[0x24BE39108];
      v14 = 7;
LABEL_13:
      v15 = 0;
      *a6 = (id)objc_msgSend(v13, "errorWithDomain:code:userInfo:", v12, v14, 0);
      return v15;
    }
    return 0;
  }
  if (-[DYCaptureArchive isClosed](self, "isClosed"))
  {
    if (a6)
    {
      v12 = *MEMORY[0x24BE39080];
      v13 = (void *)MEMORY[0x24BE39108];
      v14 = 20;
      goto LABEL_13;
    }
    return 0;
  }
  if ((unint64_t)objc_msgSend(a4, "length") >> 31)
  {
    if (a6)
    {
      v12 = *MEMORY[0x24BE39080];
      v13 = (void *)MEMORY[0x24BE39108];
      v14 = 2;
      goto LABEL_13;
    }
    return 0;
  }
  if (v7)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    dispatch_group_enter((dispatch_group_t)self->_add_group);
    write_queue = self->_write_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke;
    block[3] = &unk_250D58968;
    block[4] = self;
    block[5] = a3;
    block[7] = &v21;
    block[8] = a6;
    block[6] = a4;
    dispatch_sync(write_queue, block);
    dispatch_group_leave((dispatch_group_t)self->_add_group);
    v15 = *((_BYTE *)v22 + 24) != 0;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_add_group);
    v18 = self->_write_queue;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke_2;
    v19[3] = &unk_250D58940;
    v19[4] = self;
    v19[5] = a3;
    v19[6] = a4;
    dispatch_async(v18, v19);
    return 1;
  }
  return v15;
}

intptr_t __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *dsema;

  dsema = *(NSObject **)(*(_QWORD *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  v2 = objc_msgSend(*(id *)(a1 + 32), "_performAddFileWithName:dataSize:error:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "length"), *(_QWORD *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_DWORD)v2 != -1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v3 = objc_msgSend(MEMORY[0x24BDBCE50], "dy_dataByCompressingData:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    if (v3)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performFinalizeAddFileAtPosition:name:data:error:", v2, *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 64));
  }
  return dispatch_semaphore_signal(dsema);
}

void __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  int v3;
  NSObject *global_queue;
  _QWORD block[5];
  int8x16_t v6;
  int v7;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 264) == -1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(v1 + 216));
  }
  else
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v1 + 232), 0xFFFFFFFFFFFFFFFFLL);
    v8 = 0;
    v3 = objc_msgSend(*(id *)(a1 + 32), "_performAddFileWithName:dataSize:error:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "length"), &v8);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 232));
    if (v3 == -1)
    {
      _DYOLog();
      dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 216));
    }
    else
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke_3;
      block[3] = &unk_250D58990;
      block[4] = *(_QWORD *)(a1 + 32);
      v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
      v7 = v3;
      dispatch_async(global_queue, block);
    }
  }
}

void __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[7];
  int v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 264) == -1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(v1 + 216));
  }
  else
  {
    v9 = 0;
    v3 = objc_msgSend(MEMORY[0x24BDBCE50], "dy_dataByCompressingData:error:", *(_QWORD *)(a1 + 40), &v9);
    v4 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      v5 = *(NSObject **)(v4 + 208);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke_4;
      block[3] = &unk_250D58990;
      v8 = *(_DWORD *)(a1 + 56);
      v6 = *(_QWORD *)(a1 + 48);
      block[4] = v4;
      block[5] = v6;
      block[6] = v3;
      dispatch_async(v5, block);
    }
    else
    {
      _DYOLog();
      dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 216));
    }
  }
}

void __69__DYCaptureArchive_addFileWithName_data_options_error_waitUntilDone___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 264) == -1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(v1 + 216));
  }
  else
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v1 + 232), 0xFFFFFFFFFFFFFFFFLL);
    v3 = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "_performFinalizeAddFileAtPosition:name:data:error:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v3) & 1) == 0)_DYOLog();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 232));
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 216));
  }
}

- (BOOL)addTempFileWithName:(id)a3 options:(id)a4 fromLocation:(id)a5 error:(id *)a6
{
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  NSURL *v17;
  uint64_t v18;
  NSObject *write_queue;
  BOOL v20;
  _QWORD block[9];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  if (!objc_msgSend(a3, "length"))
  {
    if (a6)
    {
      v11 = *MEMORY[0x24BE39080];
      v12 = (void *)MEMORY[0x24BE39108];
      v13 = 1;
      goto LABEL_20;
    }
    return 0;
  }
  if (-[DYCaptureArchive isReadOnly](self, "isReadOnly"))
  {
    if (a6)
    {
      v11 = *MEMORY[0x24BE39080];
      v12 = (void *)MEMORY[0x24BE39108];
      v13 = 7;
LABEL_20:
      v20 = 0;
      *a6 = (id)objc_msgSend(v12, "errorWithDomain:code:userInfo:", v11, v13, 0);
      return v20;
    }
    return 0;
  }
  if (-[DYCaptureArchive isClosed](self, "isClosed"))
  {
    if (a6)
    {
      v11 = *MEMORY[0x24BE39080];
      v12 = (void *)MEMORY[0x24BE39108];
      v13 = 20;
      goto LABEL_20;
    }
    return 0;
  }
  v14 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v15 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Size")), "unsignedIntegerValue");
  if (!v15)
  {
    v23 = 0;
    v16 = (void *)objc_msgSend(v14, "attributesOfItemAtPath:error:", a5, &v23);
    v15 = objc_msgSend((id)objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BDD0D08]), "longLongValue");
  }
  if (HIDWORD(v15))
  {
    if (a6)
    {
      v11 = *MEMORY[0x24BE39080];
      v12 = (void *)MEMORY[0x24BE39108];
      v13 = 2;
      goto LABEL_20;
    }
    return 0;
  }
  v17 = -[NSURL URLByAppendingPathComponent:](self->_url, "URLByAppendingPathComponent:", a3);
  v18 = -[NSURL path](v17, "path");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", -[NSURL URLByDeletingLastPathComponent](v17, "URLByDeletingLastPathComponent"), 1, 0, 0);
  if ((objc_msgSend(a5, "isEqualToString:", v18) & 1) == 0
    && !objc_msgSend(v14, "moveItemAtPath:toPath:error:", a5, v18, a6))
  {
    if (a6)
    {
      v11 = *MEMORY[0x24BE39080];
      v12 = (void *)MEMORY[0x24BE39108];
      v13 = 3;
      goto LABEL_20;
    }
    return 0;
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  dispatch_group_enter((dispatch_group_t)self->_add_group);
  write_queue = self->_write_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__DYCaptureArchive_addTempFileWithName_options_fromLocation_error___block_invoke;
  block[3] = &unk_250D589B8;
  block[4] = self;
  block[5] = a3;
  block[7] = v15;
  block[8] = a6;
  block[6] = &v23;
  dispatch_sync(write_queue, block);
  dispatch_group_leave((dispatch_group_t)self->_add_group);
  v20 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);
  return v20;
}

intptr_t __67__DYCaptureArchive_addTempFileWithName_options_fromLocation_error___block_invoke(uint64_t a1)
{
  NSObject *dsema;

  dsema = *(NSObject **)(*(_QWORD *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performAddFileWithName:dataSize:withFlags:error:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), 2, *(_QWORD *)(a1 + 64)) != -1;
  return dispatch_semaphore_signal(dsema);
}

- (BOOL)addFileWithName:(id)a3 data:(id)a4 options:(id)a5 error:(id *)a6
{
  return -[DYCaptureArchive addFileWithName:data:options:error:waitUntilDone:](self, "addFileWithName:data:options:error:waitUntilDone:", a3, a4, a5, a6, 1);
}

- (BOOL)addCaptureFile:(id)a3 options:(id)a4 error:(id *)a5 waitUntilDone:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v11;
  void *v12;
  BOOL v13;

  v6 = a6;
  v11 = objc_msgSend(a3, "copyMutableData:", a5);
  if (!v11)
    return 1;
  v12 = (void *)v11;
  v13 = -[DYCaptureArchive addFileWithName:data:options:error:waitUntilDone:](self, "addFileWithName:data:options:error:waitUntilDone:", objc_msgSend(a3, "name"), v11, a4, a5, v6);

  return v13;
}

- (BOOL)addFilesFromArchive:(id)a3 error:(id *)a4 passingTest:(id)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *write_queue;
  _QWORD block[9];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[6];

  if (!-[DYCaptureArchive isReadOnly](self, "isReadOnly"))
  {
    if (!-[DYCaptureArchive isClosed](self, "isClosed"))
    {
      v13 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("filenames"));
      v14 = (void *)objc_opt_new();
      v15 = MEMORY[0x24BDAC760];
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke;
      v23[3] = &unk_250D589E0;
      v23[4] = v14;
      v23[5] = a5;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v23);
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 1;
      dispatch_group_enter((dispatch_group_t)self->_add_group);
      write_queue = self->_write_queue;
      block[0] = v15;
      block[1] = 3221225472;
      block[2] = __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke_2;
      block[3] = &unk_250D58918;
      block[7] = &v19;
      block[8] = a4;
      block[4] = self;
      block[5] = v14;
      block[6] = a3;
      dispatch_sync(write_queue, block);
      dispatch_group_leave((dispatch_group_t)self->_add_group);

      v12 = *((_BYTE *)v20 + 24) != 0;
      _Block_object_dispose(&v19, 8);
      return v12;
    }
    if (a4)
    {
      v9 = *MEMORY[0x24BE39080];
      v10 = (void *)MEMORY[0x24BE39108];
      v11 = 20;
      goto LABEL_7;
    }
    return 0;
  }
  if (!a4)
    return 0;
  v9 = *MEMORY[0x24BE39080];
  v10 = (void *)MEMORY[0x24BE39108];
  v11 = 7;
LABEL_7:
  v12 = 0;
  *a4 = (id)objc_msgSend(v10, "errorWithDomain:code:userInfo:", v9, v11, 0);
  return v12;
}

uint64_t __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return result;
}

intptr_t __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[7];
  __int128 v13;
  _QWORD v14[8];
  dispatch_semaphore_t v15;
  dispatch_semaphore_t v16;
  dispatch_semaphore_t v17;

  v16 = *(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 232);
  v17 = v16;
  v15 = v16;
  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_flushWriteBuffer:", *(_QWORD *)(a1 + 64));
  v2 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(*(_QWORD *)(v2 + 8) + 24))
  {
    v3 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke_3;
    v14[3] = &unk_250D58A08;
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 64);
    v14[6] = v2;
    v14[7] = v6;
    v7 = *(_QWORD *)(a1 + 32);
    v14[4] = v5;
    v14[5] = v7;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v14);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v8 = (void *)objc_opt_new();
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke_4;
      v12[3] = &unk_250D58A30;
      v9 = *(_QWORD *)(a1 + 48);
      v13 = *(_OWORD *)(a1 + 56);
      v12[4] = v9;
      v12[5] = v8;
      v10 = *(void **)(a1 + 40);
      v12[6] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

    }
  }
  return dispatch_semaphore_signal(v15);
}

void __58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;

  v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_getCFilename:outSize:error:", a2, 0, *(_QWORD *)(a1 + 56)), "bytes");
  if (!v6)
    goto LABEL_7;
  v7 = v6;
  v8 = objc_msgSend(*(id *)(a1 + 32), "_findHashEntry:", v6);
  if (v8 != -1)
  {
    v9 = v8;
    v10 = *(_QWORD **)(a1 + 32);
    v11 = v10[7];
    if (*(_DWORD *)(v11 + 12 * v9 + 8) != -1)
      return;
    v12 = objc_msgSend(v10, "copyDataForFilePosition:error:", *(unsigned int *)(v11 + 12 * v9), *(_QWORD *)(a1 + 56));
    if (v12)
    {
      v13 = (void *)v12;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "addFileWithName:data:options:error:waitUntilDone:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7), v12, 0, *(_QWORD *)(a1 + 56), 0);

      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a4 = 1;
      return;
    }
LABEL_7:
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    return;
  }
  *a4 = 1;
  v14 = *(_QWORD **)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  if (v14)
    *v14 = objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 13, 0);
}

_QWORD *__58__DYCaptureArchive_addFilesFromArchive_error_passingTest___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *result;
  unsigned int v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  result = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_getCFilename:outSize:error:", a2, 0, *(_QWORD *)(a1 + 64)), "bytes");
  if (!result)
    goto LABEL_17;
  result = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_findHashEntry:", result);
  if ((_DWORD)result == -1)
  {
    *a4 = 1;
    v14 = *(_QWORD **)(a1 + 64);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    if (v14)
    {
      result = (_QWORD *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 13, 0);
      *v14 = result;
    }
    return result;
  }
  v8 = result;
  result = *(_QWORD **)(a1 + 32);
  v9 = result[7];
  v10 = (unsigned int *)(v9 + 12 * v8);
  v11 = v10[2];
  if (v11 == -1)
    return result;
  v12 = objc_msgSend(result, "objectInFilenamesAtIndex:", *(unsigned int *)(v9 + 12 * v11 + 4));
  v13 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v12);
  if (v13)
    v12 = v13;
  result = (_QWORD *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_getCFilename:outSize:error:", v12, 0, *(_QWORD *)(a1 + 64)), "bytes");
  if (!result)
    goto LABEL_17;
  if (objc_msgSend(*(id *)(a1 + 48), "_findHashEntry:", result) != -1)
  {
    result = (_QWORD *)objc_msgSend(*(id *)(a1 + 48), "_performAddAlias:targetting:error:", a2, v12, *(_QWORD *)(a1 + 64));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)result;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      return result;
    goto LABEL_9;
  }
  v15 = objc_msgSend(*(id *)(a1 + 48), "_performAddFileWithName:dataSize:error:", a2, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 24 * *v10), *(_QWORD *)(a1 + 64));
  if ((_DWORD)v15 == -1)
  {
    result = (_QWORD *)_DYOLog();
    goto LABEL_17;
  }
  v16 = v15;
  result = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_readRawDataForFilePosition:error:", *v10, *(_QWORD *)(a1 + 64));
  if (!result)
  {
LABEL_17:
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    return result;
  }
  result = (_QWORD *)objc_msgSend(*(id *)(a1 + 48), "_performFinalizeAddFileAtPosition:name:data:error:", v16, a2, result, *(_QWORD *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
LABEL_9:
    *a4 = 1;
    return result;
  }
  return (_QWORD *)objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", a2, v12);
}

- (BOOL)_performReplaceDataOfFile:(id)a3 withData:(id)a4 error:(id *)a5
{
  uint64_t v8;
  unsigned int v9;
  $26580380F16D6530B01F933C495FCEE1 *file_table;
  unsigned int var0;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  $26580380F16D6530B01F933C495FCEE1 *v17;
  $72DC6413704F5B14E009C082116F69CD *p_var1;
  unsigned int v19;
  int64_t backingStoreWritePosition;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  ssize_t v26;
  void *v27;
  uint64_t v28;
  $26580380F16D6530B01F933C495FCEE1 *v30;

  v8 = objc_msgSend(-[DYCaptureArchive _getCFilename:outSize:error:](self, "_getCFilename:outSize:error:", a3, 0), "bytes");
  if (!v8)
    return 0;
  v9 = -[DYCaptureArchive _findHashEntry:](self, "_findHashEntry:", v8);
  if (v9 == -1)
  {
    if (a5)
    {
      v21 = *MEMORY[0x24BE39080];
      v22 = (void *)MEMORY[0x24BE39108];
      v23 = 13;
      goto LABEL_10;
    }
    return 0;
  }
  file_table = self->_file_table;
  var0 = self->_hash_table[v9].var0;
  v12 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "dy_dataByCompressingData:error:", a4, a5);
  if (!v12)
    return 0;
  v13 = v12;
  v14 = objc_msgSend(v12, "bytes");
  v15 = objc_msgSend(v13, "length");
  v16 = v15;
  v17 = &file_table[var0];
  v19 = v17->var1.var0;
  p_var1 = &v17->var1;
  if (v15 > (unint64_t)v19)
  {
    if (-[DYCaptureArchive _flushWriteBuffer:](self, "_flushWriteBuffer:", 0))
    {
      backingStoreWritePosition = self->_backingStoreWritePosition;
      if (-[DYCaptureArchive _writeBufferToBackingStore:size:error:](self, "_writeBufferToBackingStore:size:error:", v14, v16, a5) != -1)
      {
        v30 = file_table;
        file_table[var0].var2 = backingStoreWritePosition;
LABEL_17:
        p_var1->var0 = v16;
        v30[var0].var0 = objc_msgSend(a4, "length");
        v24 = 1;
        self->_modified = 1;
        objc_opt_self();
        return v24;
      }
    }
    return 0;
  }
  v30 = file_table;
  if (v15 < 1)
    goto LABEL_17;
  v25 = 0;
  while (1)
  {
    v26 = pwrite(self->_backingStoreFD, (const void *)(v25 + v14), v16 - v25, v30[var0].var2);
    if (v26 == -1)
      break;
    v25 += v26;
LABEL_16:
    if (v25 >= v16)
      goto LABEL_17;
  }
  if (*__error() == 4)
    goto LABEL_16;
  if (!a5)
    return 0;
  v27 = (void *)MEMORY[0x24BDD1540];
  v28 = *MEMORY[0x24BDD1128];
  v23 = *__error();
  v22 = v27;
  v21 = v28;
LABEL_10:
  v24 = 0;
  *a5 = (id)objc_msgSend(v22, "errorWithDomain:code:userInfo:", v21, v23, 0);
  return v24;
}

- (BOOL)replaceDataOfFile:(id)a3 withData:(id)a4 error:(id *)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  NSObject *write_queue;
  uint64_t *v15;
  id v16;
  _QWORD block[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  if (!objc_msgSend(a3, "length"))
  {
    if (a5)
    {
      v9 = *MEMORY[0x24BE39080];
      v10 = (void *)MEMORY[0x24BE39108];
      v11 = 1;
      goto LABEL_13;
    }
    return 0;
  }
  if ((unint64_t)objc_msgSend(a4, "length") >> 31)
  {
    if (a5)
    {
      v9 = *MEMORY[0x24BE39080];
      v10 = (void *)MEMORY[0x24BE39108];
      v11 = 2;
LABEL_13:
      v12 = 0;
      *a5 = (id)objc_msgSend(v10, "errorWithDomain:code:userInfo:", v9, v11, 0);
      return v12;
    }
    return 0;
  }
  if (-[DYCaptureArchive isReadOnly](self, "isReadOnly"))
  {
    if (a5)
    {
      v9 = *MEMORY[0x24BE39080];
      v10 = (void *)MEMORY[0x24BE39108];
      v11 = 7;
      goto LABEL_13;
    }
    return 0;
  }
  if (-[DYCaptureArchive isClosed](self, "isClosed"))
  {
    if (a5)
    {
      v9 = *MEMORY[0x24BE39080];
      v10 = (void *)MEMORY[0x24BE39108];
      v11 = 20;
      goto LABEL_13;
    }
    return 0;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  dispatch_group_enter((dispatch_group_t)self->_add_group);
  write_queue = self->_write_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__DYCaptureArchive_replaceDataOfFile_withData_error___block_invoke;
  block[3] = &unk_250D58A58;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = &v24;
  block[8] = &v18;
  dispatch_sync(write_queue, block);
  dispatch_group_leave((dispatch_group_t)self->_add_group);
  v15 = v19;
  if (a5)
    *a5 = (id)v19[5];
  v16 = (id)v15[5];
  v12 = *((_BYTE *)v25 + 24) != 0;
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v12;
}

intptr_t __53__DYCaptureArchive_replaceDataOfFile_withData_error___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *dsema;

  dsema = *(NSObject **)(*(_QWORD *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performReplaceDataOfFile:withData:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  return dispatch_semaphore_signal(dsema);
}

- (BOOL)updateDataReferenceCounts:(id)a3 error:(id *)a4
{
  BOOL v7;
  NSObject *v8;
  NSObject *add_group;
  NSObject *write_queue;
  uint64_t *v11;
  id v12;
  _QWORD v14[10];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  if (-[DYCaptureArchive isClosed](self, "isClosed"))
  {
    v7 = 0;
    if (a4)
      *a4 = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 20, 0);
  }
  else
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 1;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3052000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    v8 = dispatch_semaphore_create(0);
    write_queue = self->_write_queue;
    add_group = self->_add_group;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52__DYCaptureArchive_updateDataReferenceCounts_error___block_invoke;
    v14[3] = &unk_250D58A80;
    v14[4] = self;
    v14[5] = a3;
    v14[8] = &v21;
    v14[9] = a4;
    v14[6] = v8;
    v14[7] = &v15;
    dispatch_group_notify(add_group, write_queue, v14);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v8);
    v11 = v16;
    if (a4)
      *a4 = (id)v16[5];
    v12 = (id)v11[5];
    v7 = *((_BYTE *)v22 + 24) != 0;
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);
  }
  return v7;
}

intptr_t __52__DYCaptureArchive_updateDataReferenceCounts_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  dispatch_semaphore_t dsema;
  dispatch_semaphore_t v23;
  dispatch_semaphore_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v23 = *(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 232);
  v24 = v23;
  dsema = v23;
  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(void **)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_getCFilename:outSize:error:", v6, 0, *(_QWORD *)(a1 + 72)), "bytes");
        if (!v7)
        {
          v12 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
          goto LABEL_13;
        }
        v8 = objc_msgSend(*(id *)(a1 + 32), "_findHashEntry:", v7);
        if (v8 == -1)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
          v13 = (void *)MEMORY[0x24BE39108];
          v14 = (void *)MEMORY[0x24BDBCE70];
          v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not update ref counts for file: %@"), v6);
          v16 = objc_msgSend(v14, "dictionaryWithObject:forKey:", v15, *MEMORY[0x24BDD0FC8]);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = (id)objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 13, v16);
          goto LABEL_13;
        }
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(v9 + 64);
        v11 = *(_DWORD *)(*(_QWORD *)(v9 + 56) + 12 * v8);
        *(_DWORD *)(v10 + 24 * v11 + 20) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6), "unsignedIntValue");
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  return dispatch_semaphore_signal(dsema);
}

- (void)initCache
{
  unint64_t file_table_length;
  unint64_t v4;
  uint64_t v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  file_table_length = self->_header.file_table_length;
  self->_cacheSize = file_table_length;
  std::vector<DYCaptureArchiveCacheEntry>::resize((uint64_t)&self->_cacheTable, file_table_length);
  if (self->_header.file_table_length)
  {
    v4 = 0;
    v5 = 24;
    do
    {
      begin = self->_cacheTable.__begin_;
      *(_QWORD *)((char *)begin + v5) = dispatch_semaphore_create(1);
      ++v4;
      v5 += 32;
    }
    while (v4 < self->_header.file_table_length);
  }
}

- (void)resizeCache
{
  unint64_t cacheSize;
  unint64_t file_table_length;
  uint64_t v5;
  char *v6;

  std::vector<DYCaptureArchiveCacheEntry>::resize((uint64_t)&self->_cacheTable, self->_header.file_table_length);
  cacheSize = self->_cacheSize;
  file_table_length = self->_header.file_table_length;
  if (cacheSize < file_table_length)
  {
    v5 = 32 * cacheSize;
    do
    {
      v6 = (char *)self->_cacheTable.__begin_ + v5;
      *(_OWORD *)v6 = 0u;
      *((_OWORD *)v6 + 1) = 0u;
      *((_QWORD *)v6 + 3) = dispatch_semaphore_create(1);
      ++cacheSize;
      file_table_length = self->_header.file_table_length;
      v5 += 32;
    }
    while (cacheSize < file_table_length);
  }
  self->_cacheSize = file_table_length;
}

- (void)cacheAllResources
{
  uint64_t v3;
  std::__thread_struct *v4;
  uint64_t *v5;
  int v6;
  std::thread v7;
  uint64_t *v8;

  self->_useCache = 1;
  atomic_store(0, &self->_preloadAtomicIndex.__a_.__a_value);
  v3 = 15;
  while (1)
  {
    v4 = (std::__thread_struct *)operator new();
    std::__thread_struct::__thread_struct(v4);
    v5 = (uint64_t *)operator new();
    *v5 = (uint64_t)v4;
    v5[1] = (uint64_t)self;
    v8 = v5;
    v6 = pthread_create(&v7.__t_, 0, (void *(__cdecl *)(void *))std::__thread_proxy[abi:ne180100]<std::tuple<std::unique_ptr<std::__thread_struct>,-[DYCaptureArchive cacheAllResources]::$_0>>, v5);
    if (v6)
      break;
    v8 = 0;
    std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,-[DYCaptureArchive cacheAllResources]::$_0>>::~unique_ptr[abi:ne180100](&v8);
    std::thread::detach(&v7);
    std::thread::~thread(&v7);
    if (!--v3)
      return;
  }
  std::__throw_system_error(v6, "thread constructor failed");
  __break(1u);
}

- (void)releaseBytesForFilePosition:(unint64_t)a3
{
  uint64_t v3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  char *v6;
  int v7;
  BOOL v8;
  int state;

  v3 = a3;
  if (a3 >= (unint64_t)self->_header.file_table_length)
    __assert_rtn("-[DYCaptureArchive releaseBytesForFilePosition:]", ", 0, "position < _header.file_table_length");
  begin = self->_cacheTable.__begin_;
  v6 = (char *)begin + 32 * a3;
  dispatch_semaphore_wait(*((dispatch_semaphore_t *)v6 + 3), 0xFFFFFFFFFFFFFFFFLL);
  v7 = *((_DWORD *)v6 + 4);
  v8 = __OFSUB__(v7--, 1);
  *((_DWORD *)v6 + 4) = v7;
  if ((v7 < 0) ^ v8 | (v7 == 0))
  {
    if (self->_useCache)
    {
      state = 1;
      mach_vm_purgable_control(*MEMORY[0x24BDAEC58], *(_QWORD *)v6, 0, &state);
    }
    else
    {
      mach_vm_deallocate(*MEMORY[0x24BDAEC58], *(_QWORD *)v6, *((_QWORD *)begin + 4 * v3 + 1));
      *(_QWORD *)v6 = 0;
      *((_QWORD *)v6 + 1) = 0;
      *((_DWORD *)v6 + 4) = 0;
    }
  }
  dispatch_semaphore_signal(*((dispatch_semaphore_t *)v6 + 3));
  -[DYCaptureArchive _printUsage](self, "_printUsage");
}

- (BOOL)allocatePageAlignedMemory:(void *)a3 forFilePosition:(unint64_t)a4 error:(id *)a5
{
  mach_vm_size_t v6;
  kern_return_t v8;
  BOOL v9;
  mach_vm_address_t address;

  v6 = ~*MEMORY[0x24BDB03B8] & (*MEMORY[0x24BDB03B8] + self->_file_table[a4].var0);
  if (!v6)
    return 0;
  address = 0;
  v8 = mach_vm_allocate(*MEMORY[0x24BDAEC58], &address, v6, 3);
  v9 = v8 == 0;
  if (v8)
    *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], v8, 0);
  else
    *a3 = (void *)address;
  return v9;
}

- (void)_cleanBytes:(unint64_t)a3 andSkip:(id *)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  vm_map_t *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  char *v15;
  char *v16;

  begin = self->_cacheTable.__begin_;
  end = self->_cacheTable.__end_;
  if (begin != end && a3)
  {
    v9 = 0;
    v10 = 0;
    v11 = (end - begin) >> 5;
    v12 = 1;
    v13 = (vm_map_t *)MEMORY[0x24BDAEC58];
    do
    {
      v14 = self->_cacheTable.__begin_;
      v15 = (char *)v14 + v9;
      if (($FE1E04DC213CC14599BC0197C507E86A *)((char *)v14 + v9) != a4
        && !dispatch_semaphore_wait(*((dispatch_semaphore_t *)v15 + 3), 0))
      {
        v16 = (char *)v14 + v9;
        if (!*((_DWORD *)v16 + 4))
        {
          mach_vm_deallocate(*v13, *(_QWORD *)v16, *((_QWORD *)v16 + 1));
          v10 += *((_QWORD *)v16 + 1);
          *((_DWORD *)v15 + 4) = 0;
          *(_QWORD *)v15 = 0;
          *((_QWORD *)v15 + 1) = 0;
        }
        dispatch_semaphore_signal(*((dispatch_semaphore_t *)v15 + 3));
      }
      if (v12 >= v11)
        break;
      ++v12;
      v9 += 32;
    }
    while (v10 < a3);
  }
}

- (void)_springCleaning
{
  host_t v3;
  vm_size_t v4;
  integer_t host_info_out[15];
  mach_msg_type_number_t host_info_outCnt;
  vm_size_t v7;

  v7 = 0;
  v3 = MEMORY[0x242622500](self, a2);
  host_info_outCnt = 15;
  host_page_size(v3, &v7);
  if (!host_statistics(v3, 2, host_info_out, &host_info_outCnt))
  {
    v4 = v7 * host_info_out[0];
    if (!(v4 >> 27))
      -[DYCaptureArchive _cleanBytes:andSkip:](self, "_cleanBytes:andSkip:", 0x8000000 - v4, 0);
  }
}

- (int)_tryAgain:(id *)a3
{
  -[DYCaptureArchive _cleanBytes:andSkip:](self, "_cleanBytes:andSkip:", a3->var1, a3);
  return mach_vm_allocate(*MEMORY[0x24BDAEC58], &a3->var0, a3->var1, 3);
}

- (BOOL)requestBuffer:(void *)a3 forFilePosition:(unint64_t)a4 cacheEntry:(id *)a5 needsData:(BOOL *)a6 error:(id *)a7
{
  unint64_t var0;
  void *v13;
  int var2;
  BOOL v15;
  BOOL v16;
  unint64_t v17;
  vm_map_t *v18;
  int v19;
  void *v20;
  kern_return_t v21;
  int v23;
  unint64_t var1;
  int v26;
  int state;

  var0 = self->_file_table[a4].var0;
  v13 = (void *)a5->var0;
  if (a5->var0)
  {
    var2 = a5->var2;
    if (var2 >= 1)
    {
      a5->var2 = var2 + 1;
      *a3 = v13;
      *a6 = 0;
      if (a5->var1 >= var0)
        return 1;
LABEL_25:
      __assert_rtn("-[DYCaptureArchive requestBuffer:forFilePosition:cacheEntry:needsData:error:]", ", 0, "(size_t)bytes_to_copy <= entry->map_size");
    }
    state = 0;
    if (mach_vm_purgable_control(*MEMORY[0x24BDAEC58], (mach_vm_address_t)v13, 0, &state))
      v16 = 1;
    else
      v16 = state == 2;
    if (!v16)
    {
      ++a5->var2;
      var1 = a5->var1;
      *a3 = (void *)a5->var0;
      *a6 = 0;
      if (var1 >= var0)
        return 1;
      goto LABEL_25;
    }
  }
  v17 = ~*MEMORY[0x24BDB03B8] & (*MEMORY[0x24BDB03B8] + var0);
  a5->var1 = v17;
  if (!v17)
    return 0;
  a5->var2 = 1;
  v18 = (vm_map_t *)MEMORY[0x24BDAEC58];
  if (mach_vm_allocate(*MEMORY[0x24BDAEC58], &a5->var0, v17, 3)
    && (v19 = -[DYCaptureArchive _tryAgain:](self, "_tryAgain:", a5)) != 0)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], v19, 0);
    v15 = 0;
  }
  else
  {
    v26 = 0;
    v21 = mach_vm_purgable_control(*v18, a5->var0, 0, &v26);
    if (v26 == 2 && v21 == 0)
      v23 = 2;
    else
      v23 = v21;
    v15 = v23 == 0;
    if (!v23)
    {
      *a3 = (void *)a5->var0;
      *a6 = 1;
      return v15;
    }
    v20 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], v23, 0);
  }
  *a7 = v20;
  return v15;
}

- (BOOL)_requestDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t *)a5 error:(id *)a6
{
  uint64_t v8;
  unint64_t *v9;
  $26580380F16D6530B01F933C495FCEE1 *file_table;
  $26580380F16D6530B01F933C495FCEE1 *v12;
  $26580380F16D6530B01F933C495FCEE1 *v13;
  int64_t v14;
  $72DC6413704F5B14E009C082116F69CD *p_var1;
  unsigned int var0;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  dispatch_semaphore_t *v23;
  _BOOL4 v24;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v25;
  char *v26;
  int v27;
  NSURL *v28;
  void *v29;
  _BOOL4 v30;
  Bytef *v31;
  volatile int *v32;
  unsigned int *end;
  uint64_t v34;
  volatile int *v35;
  char *v36;
  int64_t backingStoreWritePosition;
  BOOL v38;
  uint64_t v39;
  int64_t read_buffer_capacity;
  uint8_t *v41;
  int v42;
  const __CFString *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char *v47;
  const uint8_t *v48;
  size_t v49;
  uint8_t *v50;
  uint64_t v51;
  int64_t v52;
  size_t v53;
  ssize_t v54;
  volatile int *v55;
  unint64_t v56;
  unsigned int *value;
  unsigned int *v58;
  unsigned int *v59;
  unsigned int *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  unsigned int *v65;
  unsigned int *v66;
  unsigned int v67;
  unsigned int v69;
  uint64_t v70;
  size_t v71;
  ssize_t v72;
  ssize_t v73;
  int64_t v74;
  int v75;
  uint64_t v77;
  unint64_t *v78;
  unsigned int v79;
  unint64_t *v80;
  GPUTools::DYLockUtils *p_read_buffer_tokens_lock;
  char *v82;
  size_t v83;
  uint64_t v84;
  z_stream strm;
  unsigned __int8 v86[9];

  if (!a4)
  {
    if (!a6)
      goto LABEL_13;
    v19 = *MEMORY[0x24BDD1128];
    v20 = (void *)MEMORY[0x24BE39108];
    v21 = 14;
    goto LABEL_12;
  }
  v8 = a3;
  if (a3 >= (unint64_t)self->_header.file_table_length)
    __assert_rtn("-[DYCaptureArchive _requestDataForFilePosition:buffer:size:error:]", ", 0, "position < _header.file_table_length");
  v9 = a5;
  file_table = self->_file_table;
  v12 = &file_table[a3];
  if ((v12->var3 & 2) != 0)
  {
    LOBYTE(strm.next_in) = 1;
    begin = self->_cacheTable.__begin_;
    if (begin == self->_cacheTable.__end_)
    {
      LODWORD(v9) = -[DYCaptureArchive allocatePageAlignedMemory:forFilePosition:error:](self, "allocatePageAlignedMemory:forFilePosition:error:", a4, a3, a6);
      v23 = 0;
      v24 = 1;
      if (!(_DWORD)v9)
        goto LABEL_26;
    }
    else
    {
      v23 = (dispatch_semaphore_t *)((char *)begin + 32 * a3);
      dispatch_semaphore_wait(v23[3], 0xFFFFFFFFFFFFFFFFLL);
      if (!-[DYCaptureArchive requestBuffer:forFilePosition:cacheEntry:needsData:error:](self, "requestBuffer:forFilePosition:cacheEntry:needsData:error:", a4, v8, v23, &strm, a6)|| !*a4)
      {
        LOBYTE(v9) = 0;
        goto LABEL_26;
      }
      *v9 = v12->var0;
      v24 = LOBYTE(strm.next_in) != 0;
      LOBYTE(v9) = 1;
    }
    if (!v24)
    {
LABEL_26:
      if (self->_cacheTable.__begin_ != self->_cacheTable.__end_)
        dispatch_semaphore_signal(v23[3]);
      return (char)v9;
    }
    v28 = -[NSURL URLByAppendingPathComponent:](self->_url, "URLByAppendingPathComponent:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", (char *)self->_string_table_storage + self->_string_table_offsets[file_table[v8].var1.var0]));
    v29 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v28);
    if (v29)
    {
      memcpy(*a4, (const void *)objc_msgSend(v29, "bytes"), v12->var0);
      LOBYTE(v9) = 1;
      goto LABEL_26;
    }
    if (self->_cacheTable.__begin_ != self->_cacheTable.__end_)
      dispatch_semaphore_signal(v23[3]);
    if (!a6)
      goto LABEL_13;
    v19 = *MEMORY[0x24BE39080];
    v20 = (void *)MEMORY[0x24BE39108];
    v21 = 13;
LABEL_12:
    *a6 = (id)objc_msgSend(v20, "errorWithDomain:code:userInfo:", v19, v21, 0);
    goto LABEL_13;
  }
  v13 = &file_table[a3];
  var0 = v13->var1.var0;
  p_var1 = &v13->var1;
  v14 = var0;
  v17 = v12->var0;
  if ((_DWORD)v17)
    v18 = (_DWORD)v14 == 0;
  else
    v18 = 1;
  if (v18)
  {
    *a5 = 0;
    *a4 = 0;
LABEL_13:
    LOBYTE(v9) = 1;
    return (char)v9;
  }
  v84 = *(_QWORD *)&p_var1[1].var0;
  v86[0] = 1;
  v25 = self->_cacheTable.__begin_;
  if (v25 == self->_cacheTable.__end_)
  {
    v30 = -[DYCaptureArchive allocatePageAlignedMemory:forFilePosition:error:](self, "allocatePageAlignedMemory:forFilePosition:error:", a4, a3, a6);
    v26 = 0;
    v27 = 1;
    if (!v30)
    {
LABEL_35:
      if (self->_cacheTable.__begin_ == self->_cacheTable.__end_)
      {
LABEL_86:
        *v9 = v17;
        goto LABEL_13;
      }
      v46 = 0;
LABEL_78:
      dispatch_semaphore_signal(*((dispatch_semaphore_t *)v26 + 3));
      -[DYCaptureArchive _printUsage](self, "_printUsage");
      if (v46)
        goto LABEL_79;
      goto LABEL_86;
    }
  }
  else
  {
    v26 = (char *)v25 + 32 * a3;
    dispatch_semaphore_wait(*((dispatch_semaphore_t *)v26 + 3), 0xFFFFFFFFFFFFFFFFLL);
    if (!-[DYCaptureArchive requestBuffer:forFilePosition:cacheEntry:needsData:error:](self, "requestBuffer:forFilePosition:cacheEntry:needsData:error:", a4, v8, v26, v86, a6))goto LABEL_81;
    v27 = v86[0];
  }
  if (!v27)
    goto LABEL_35;
  v82 = v26;
  v31 = (Bytef *)*a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_read_buffer_sem, 0xFFFFFFFFFFFFFFFFLL);
  GPUTools::DYLockUtils::Lock((GPUTools::DYLockUtils *)&self->_read_buffer_tokens_lock, v32);
  end = self->_read_buffer_tokens.__end_;
  v34 = *(end - 1);
  self->_read_buffer_tokens.__end_ = end - 1;
  p_read_buffer_tokens_lock = (GPUTools::DYLockUtils *)&self->_read_buffer_tokens_lock;
  GPUTools::DYLockUtils::Unlock((GPUTools::DYLockUtils *)&self->_read_buffer_tokens_lock, v35);
  v36 = &self->_scratch[self->_scratchSize * v34];
  backingStoreWritePosition = self->_backingStoreWritePosition;
  v38 = __OFSUB__(v84, backingStoreWritePosition);
  v39 = v84 - backingStoreWritePosition;
  v83 = v17;
  v79 = v34;
  v80 = v9;
  if (v39 < 0 == v38)
  {
    if (v39 >= 0)
    {
      v47 = (char *)self->_store_write_buffer + v39;
      if (self->_store_write_ptr > v47)
      {
        v48 = (const uint8_t *)(v47 + 2);
        v49 = p_var1->var0 - 2;
        v50 = v31;
LABEL_52:
        if (compression_decode_buffer(v50, v17, v48, v49, v36, COMPRESSION_ZLIB) == v17)
          goto LABEL_53;
      }
    }
    v44 = (void *)MEMORY[0x24BDD1540];
    v43 = (const __CFString *)*MEMORY[0x24BE39080];
    v45 = 8;
LABEL_55:
    v46 = (void *)objc_msgSend(v44, "errorWithDomain:code:userInfo:", v43, v45, 0);
    goto LABEL_56;
  }
  read_buffer_capacity = self->_read_buffer_capacity;
  v41 = (uint8_t *)self->_read_buffer + read_buffer_capacity * v34;
  if (read_buffer_capacity >= v14)
  {
    v51 = 0;
    v52 = v14;
    while (1)
    {
      v53 = self->_read_buffer_capacity >= v52 ? v52 : self->_read_buffer_capacity;
      v54 = pread(self->_backingStoreFD, &v41[v51], v53, v51 + v84);
      if (v54 == -1 && *__error() != 4)
        break;
      v51 += v54;
      v52 -= v54;
      if (!v52)
        goto LABEL_51;
    }
    v46 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    if (!v46)
    {
LABEL_51:
      v48 = v41 + 2;
      v49 = v14 - 2;
      v50 = v31;
      v17 = v83;
      goto LABEL_52;
    }
    goto LABEL_56;
  }
  strm.next_in = 0;
  strm.avail_in = 0;
  strm.next_out = v31;
  strm.avail_out = v17;
  memset(&strm.zalloc, 0, 24);
  v42 = inflateInit_(&strm, "1.2.12", 112);
  v43 = CFSTR("ZlibErrorDomain");
  if (v42)
  {
    v44 = (void *)MEMORY[0x24BDD1540];
    v45 = 1;
    goto LABEL_55;
  }
  v69 = 0;
  v70 = 0;
  while (2)
  {
    if (self->_read_buffer_capacity >= v14)
      v71 = v14;
    else
      v71 = self->_read_buffer_capacity;
    v72 = pread(self->_backingStoreFD, v41, v71, v70 + v84);
    v73 = v72;
    if (v72 != -1)
    {
      v74 = self->_read_buffer_capacity;
      if (v74 >= v14)
        v74 = v14;
      if (v72 < v74)
      {
        v46 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 8, 0);
        inflateEnd(&strm);
        if (v46)
          goto LABEL_56;
        goto LABEL_53;
      }
      goto LABEL_97;
    }
    if (*__error() == 4)
    {
LABEL_97:
      strm.next_in = v41;
      strm.avail_in = v73;
      if (v14 == v73)
        v75 = 4;
      else
        v75 = 2;
      while (strm.avail_in && v69 == 0)
      {
        v69 = inflate(&strm, v75);
        if (v69 >= 2)
        {
          v77 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ZlibErrorDomain"), 1, 0);
          if (v77)
          {
            v46 = (void *)v77;
            inflateEnd(&strm);
            goto LABEL_56;
          }
          break;
        }
      }
      v70 += v73;
      v14 -= v73;
      if (v14)
        continue;
      inflateEnd(&strm);
LABEL_53:
      v46 = 0;
LABEL_56:
      GPUTools::DYLockUtils::Lock(p_read_buffer_tokens_lock, v55);
      value = self->_read_buffer_tokens.__end_cap_.__value_;
      v58 = self->_read_buffer_tokens.__end_;
      v9 = v80;
      if (v58 >= value)
      {
        v60 = self->_read_buffer_tokens.__begin_;
        v61 = v58 - v60;
        v26 = v82;
        if ((unint64_t)(v61 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v62 = (char *)value - (char *)v60;
        v63 = ((char *)value - (char *)v60) >> 1;
        if (v63 <= v61 + 1)
          v63 = v61 + 1;
        if (v62 >= 0x7FFFFFFFFFFFFFFCLL)
          v56 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v56 = v63;
        if (v56)
        {
          v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&self->_read_buffer_tokens.__end_cap_, v56);
          v60 = self->_read_buffer_tokens.__begin_;
          v58 = self->_read_buffer_tokens.__end_;
        }
        else
        {
          v64 = 0;
        }
        v65 = (unsigned int *)&v64[4 * v61];
        v66 = (unsigned int *)&v64[4 * v56];
        *v65 = v79;
        v59 = v65 + 1;
        while (v58 != v60)
        {
          v67 = *--v58;
          *--v65 = v67;
        }
        self->_read_buffer_tokens.__begin_ = v65;
        self->_read_buffer_tokens.__end_ = v59;
        self->_read_buffer_tokens.__end_cap_.__value_ = v66;
        if (v60)
          operator delete(v60);
      }
      else
      {
        *v58 = v79;
        v59 = v58 + 1;
        v26 = v82;
      }
      self->_read_buffer_tokens.__end_ = v59;
      GPUTools::DYLockUtils::Unlock(p_read_buffer_tokens_lock, (volatile int *)v56);
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_read_buffer_sem);
      v17 = v83;
      if (self->_cacheTable.__begin_ == self->_cacheTable.__end_)
      {
        if (v46)
        {
          if (*a4)
            free(*a4);
LABEL_79:
          if (a6)
          {
            LOBYTE(v9) = 0;
            *a6 = v46;
            return (char)v9;
          }
LABEL_81:
          LOBYTE(v9) = 0;
          return (char)v9;
        }
        goto LABEL_86;
      }
      if (v46)
      {
        if (*a4 && *((int *)v26 + 4) <= 1)
        {
          mach_vm_deallocate(*MEMORY[0x24BDAEC58], *(_QWORD *)v26, *((_QWORD *)v26 + 1));
          *(_QWORD *)v26 = 0;
          *((_QWORD *)v26 + 1) = 0;
          *((_DWORD *)v26 + 4) = 0;
        }
        *a4 = 0;
      }
      goto LABEL_78;
    }
    break;
  }
  v78 = v9;
  inflateEnd(&strm);
  if (a6)
    *a6 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
  LOBYTE(v9) = 0;
  *v78 = 0;
  *a4 = 0;
  return (char)v9;
}

- (BOOL)requestDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t *)a5 error:(id *)a6
{
  volatile int *v11;
  _BYTE v13[24];
  OS_dispatch_semaphore *lock_global_semaphore;

  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v13, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  LOBYTE(a6) = -[DYCaptureArchive _requestDataForFilePosition:buffer:size:error:](self, "_requestDataForFilePosition:buffer:size:error:", a3, a4, a5, a6);
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v13, v11);
  return (char)a6;
}

- (id)_readRawDataForFilePosition:(unsigned int)a3 error:(id *)a4
{
  $26580380F16D6530B01F933C495FCEE1 *v4;
  int64_t var0;
  int64_t var2;
  int64_t backingStoreWritePosition;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  ssize_t v16;
  ssize_t v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;

  v4 = &self->_file_table[a3];
  var0 = v4->var1.var0;
  if (!(_DWORD)var0)
    return (id)objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  var2 = v4->var2;
  backingStoreWritePosition = self->_backingStoreWritePosition;
  v10 = __OFSUB__(var2, backingStoreWritePosition);
  v11 = var2 - backingStoreWritePosition;
  if (v11 < 0 == v10)
  {
    if (v11 >= 0 && self->_store_write_ptr > (char *)self->_store_write_buffer + v11)
      return (id)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytesNoCopy:length:freeWhenDone:");
LABEL_16:
    if (a4)
    {
      v19 = *MEMORY[0x24BE39080];
      v20 = (void *)MEMORY[0x24BE39108];
      v21 = 8;
      goto LABEL_22;
    }
    return 0;
  }
  v12 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", var0);
  if (!v12)
  {
    if (a4)
    {
      v19 = *MEMORY[0x24BE39080];
      v20 = (void *)MEMORY[0x24BE39108];
      v21 = 4;
      goto LABEL_22;
    }
    return 0;
  }
  v13 = v12;
  v14 = (void *)objc_msgSend(v12, "mutableBytes");
  v15 = 0;
  while (1)
  {
    v16 = pread(self->_backingStoreFD, v14, var0, v15 + var2);
    v17 = v16;
    if (v16 != -1)
    {
      if (var0 > v16)
        goto LABEL_16;
      goto LABEL_10;
    }
    if (*__error() != 4)
      break;
LABEL_10:
    v15 += v17;
    var0 -= v17;
    if (!var0)
      return v13;
  }
  if (!a4)
    return 0;
  v22 = (void *)MEMORY[0x24BDD1540];
  v23 = *MEMORY[0x24BDD1128];
  v21 = *__error();
  v20 = v22;
  v19 = v23;
LABEL_22:
  v13 = 0;
  *a4 = (id)objc_msgSend(v20, "errorWithDomain:code:userInfo:", v19, v21, 0);
  return v13;
}

- (int64_t)readDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  int64_t v11;
  volatile int *v12;
  _BYTE v14[24];
  OS_dispatch_semaphore *lock_global_semaphore;

  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v14, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  v11 = -[DYCaptureArchive _readDataForFilePosition:buffer:size:error:](self, "_readDataForFilePosition:buffer:size:error:", a3, a4, a5, a6);
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v14, v12);
  return v11;
}

- (int64_t)_readDataForFilePosition:(unint64_t)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  unint64_t v11;
  void *__src;

  if (!a4)
  {
    if (a6)
      *a6 = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 14, 0);
    return -1;
  }
  v11 = 0;
  __src = 0;
  if (!-[DYCaptureArchive _requestDataForFilePosition:buffer:size:error:](self, "_requestDataForFilePosition:buffer:size:error:", a3, &__src, &v11, a6))return -1;
  if (v11 < a5)
    __assert_rtn("-[DYCaptureArchive _readDataForFilePosition:buffer:size:error:]", ", 0, "size <= dataSize");
  memcpy(a4, __src, a5);
  -[DYCaptureArchive releaseBytesForFilePosition:](self, "releaseBytesForFilePosition:", a3);
  return a5;
}

- (id)copyDataForFilePosition:(unint64_t)a3 error:(id *)a4
{
  id v7;
  volatile int *v8;
  _BYTE v10[24];
  OS_dispatch_semaphore *lock_global_semaphore;

  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v10, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  v7 = -[DYCaptureArchive _copyDataForFilePosition:error:](self, "_copyDataForFilePosition:error:", a3, a4);
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v10, v8);
  return v7;
}

- (id)_copyDataForFilePosition:(unint64_t)a3 error:(id *)a4
{
  uint64_t v4;
  $26580380F16D6530B01F933C495FCEE1 *file_table;
  void *v8;

  v4 = a3;
  if (a3 >= (unint64_t)self->_header.file_table_length)
    __assert_rtn("-[DYCaptureArchive _copyDataForFilePosition:error:]", ", 0, "position < _header.file_table_length");
  file_table = self->_file_table;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", file_table[a3].var0);
  objc_msgSend(v8, "setLength:", file_table[v4].var0);
  if (-[DYCaptureArchive _readDataForFilePosition:buffer:size:error:](self, "_readDataForFilePosition:buffer:size:error:", v4, objc_msgSend(v8, "mutableBytes"), file_table[v4].var0, a4) == -1)
  {

    return 0;
  }
  return v8;
}

- (id)openFileWithFilename:(id)a3 error:(id *)a4
{
  volatile int *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v14[24];
  OS_dispatch_semaphore *lock_global_semaphore;

  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v14, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (!objc_msgSend(a3, "length"))
  {
    if (a4)
    {
      v8 = 1;
      goto LABEL_7;
    }
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  if (!-[DYCaptureArchive isClosed](self, "isClosed"))
  {
    v11 = objc_msgSend(-[DYCaptureArchive _getCFilename:outSize:error:](self, "_getCFilename:outSize:error:", a3, 0, a4), "bytes");
    if (v11)
    {
      v12 = -[DYCaptureArchive _findHashEntry:](self, "_findHashEntry:", v11);
      if ((_DWORD)v12 != -1)
      {
        v10 = -[DYCaptureFile _initWithArchive:hashPosition:name:]([DYCaptureFile alloc], "_initWithArchive:hashPosition:name:", self, v12, a3);
        goto LABEL_15;
      }
      if (a4)
      {
        v9 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 13, 0);
        goto LABEL_8;
      }
    }
    goto LABEL_14;
  }
  if (!a4)
    goto LABEL_14;
  v8 = 20;
LABEL_7:
  v9 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], v8, 0);
LABEL_8:
  v10 = 0;
  *a4 = v9;
LABEL_15:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v14, v7);
  return v10;
}

- (int64_t)readDataForFilenameBuffer:(const char *)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  volatile int *v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  unsigned int v16;
  _BYTE v17[24];
  OS_dispatch_semaphore *lock_global_semaphore;

  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v17, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (*a3)
  {
    if (-[DYCaptureArchive isClosed](self, "isClosed"))
    {
      if (a6)
      {
        v12 = 20;
LABEL_7:
        v13 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], v12, 0);
LABEL_8:
        *a6 = v13;
      }
    }
    else
    {
      v16 = -[DYCaptureArchive _findHashEntry:](self, "_findHashEntry:", a3);
      if (v16 != -1)
      {
        v14 = -[DYCaptureArchive readDataForFilePosition:buffer:size:error:](self, "readDataForFilePosition:buffer:size:error:", self->_hash_table[v16].var0, a4, a5, a6);
        goto LABEL_10;
      }
      if (a6)
      {
        v13 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 13, 0);
        goto LABEL_8;
      }
    }
  }
  else if (a6)
  {
    v12 = 1;
    goto LABEL_7;
  }
  v14 = -1;
LABEL_10:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v17, v11);
  return v14;
}

- (int64_t)readDataForFilename:(id)a3 buffer:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  return -[DYCaptureArchive readDataForFilenameBuffer:buffer:size:error:](self, "readDataForFilenameBuffer:buffer:size:error:", objc_msgSend(a3, "cStringUsingEncoding:", 1), a4, a5, a6);
}

- (id)copyDataForFilenameBuffer:(const char *)a3 error:(id *)a4
{
  volatile int *v7;
  uint64_t v8;
  void *v9;
  id v10;
  unsigned int v11;
  _BYTE v13[24];
  OS_dispatch_semaphore *lock_global_semaphore;

  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v13, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (!*a3)
  {
    if (a4)
    {
      v8 = 1;
      goto LABEL_7;
    }
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  if (!-[DYCaptureArchive isClosed](self, "isClosed"))
  {
    v11 = -[DYCaptureArchive _findHashEntry:](self, "_findHashEntry:", a3);
    if (v11 != -1)
    {
      v10 = -[DYCaptureArchive _copyDataForFilePosition:error:](self, "_copyDataForFilePosition:error:", self->_hash_table[v11].var0, a4);
      goto LABEL_14;
    }
    if (a4)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 13, 0);
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  if (!a4)
    goto LABEL_13;
  v8 = 20;
LABEL_7:
  v9 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], v8, 0);
LABEL_8:
  v10 = 0;
  *a4 = v9;
LABEL_14:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v13, v7);
  return v10;
}

- (id)copyDataForFilename:(id)a3 error:(id *)a4
{
  return -[DYCaptureArchive copyDataForFilenameBuffer:error:](self, "copyDataForFilenameBuffer:error:", objc_msgSend(a3, "cStringUsingEncoding:", 1), a4);
}

- (void)allocateAndReadDataForFilenameBuffer:(const char *)a3 outSize:(unint64_t *)a4 error:(id *)a5
{
  int i;
  void *v9;
  uint64_t v11;
  size_t size;

  if (!-[DYCaptureArchive getInfo:forFilenameBuffer:error:](self, "getInfo:forFilenameBuffer:error:", &v11, a3))
    return 0;
  for (i = 3; i; --i)
  {
    v9 = malloc_type_malloc(size, 0x2F0C5437uLL);
    if (!v9)
      break;
    if (-[DYCaptureArchive readDataForFilePosition:buffer:size:error:](self, "readDataForFilePosition:buffer:size:error:", v11, v9, size, a5) != -1)
    {
      if (a4)
        *a4 = size;
      return v9;
    }
    free(v9);
    v9 = 0;
  }
  return v9;
}

- (id)getFilenameForFilePosition:(unint64_t)a3 error:(id *)a4
{
  unsigned int v4;
  volatile int *v6;
  unint64_t hash_table_length;
  $938B03310D06493B2963E5A84CB75A7E *hash_table;
  unint64_t v9;
  BOOL v10;
  $938B03310D06493B2963E5A84CB75A7E *v11;
  unsigned int var0;
  id v13;
  void *v14;
  _BYTE v16[24];
  OS_dispatch_semaphore *lock_global_semaphore;

  v4 = a3;
  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v16, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (self->_header.file_table_length <= (unint64_t)v4)
    __assert_rtn("-[DYCaptureArchive getFilenameForFilePosition:error:]", ", 0, "position < _header.file_table_length");
  hash_table_length = self->_header.hash_table_length;
  if (!(_DWORD)hash_table_length)
  {
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  hash_table = self->_hash_table;
  if (hash_table->var0 != v4)
  {
    v9 = 0;
    v11 = hash_table + 1;
    while (hash_table_length - 1 != v9)
    {
      var0 = v11->var0;
      ++v11;
      ++v9;
      if (var0 == v4)
      {
        v10 = v9 < hash_table_length;
        goto LABEL_9;
      }
    }
    goto LABEL_12;
  }
  v9 = 0;
  v10 = 1;
LABEL_9:
  v13 = -[DYCaptureArchive objectInFilenamesAtIndex:](self, "objectInFilenamesAtIndex:", hash_table[v9].var1);
  if (v10)
    v14 = v13;
  else
    v14 = 0;
LABEL_13:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v16, v6);
  return v14;
}

- (BOOL)getInfo:(id *)a3 forFilePosition:(unint64_t)a4 error:(id *)a5
{
  volatile int *v9;
  _BYTE v11[24];
  OS_dispatch_semaphore *lock_global_semaphore;

  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v11, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  LOBYTE(a5) = -[DYCaptureArchive _getInfo:forFilePosition:error:](self, "_getInfo:forFilePosition:error:", a3, a4, a5);
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v11, v9);
  return (char)a5;
}

- (BOOL)_getInfo:(id *)a3 forFilePosition:(unint64_t)a4 error:(id *)a5
{
  $26580380F16D6530B01F933C495FCEE1 *v5;
  __int128 v6;

  if (self->_header.file_table_length <= a4)
    __assert_rtn("-[DYCaptureArchive _getInfo:forFilePosition:error:]", ", 0, "position_32 < _header.file_table_length");
  v5 = &self->_file_table[a4];
  a3->var0 = a4;
  *(int32x2_t *)&v6 = vrev64_s32(*(int32x2_t *)&v5->var0);
  *((_QWORD *)&v6 + 1) = *(_QWORD *)&v5->var3;
  *(_OWORD *)&a3->var2 = v6;
  a3->var1 = v5->var2;
  return 1;
}

- (BOOL)getInfo:(id *)a3 forFilenameBuffer:(const char *)a4 error:(id *)a5
{
  volatile int *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  unsigned int v13;
  _BYTE v15[24];
  OS_dispatch_semaphore *lock_global_semaphore;

  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v15, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (!*a4)
  {
    if (a5)
    {
      v10 = 1;
      goto LABEL_7;
    }
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  if (!-[DYCaptureArchive isClosed](self, "isClosed"))
  {
    v13 = -[DYCaptureArchive _findHashEntry:](self, "_findHashEntry:", a4);
    if (v13 != -1)
    {
      v12 = -[DYCaptureArchive _getInfo:forFilePosition:error:](self, "_getInfo:forFilePosition:error:", a3, self->_hash_table[v13].var0, a5);
      goto LABEL_14;
    }
    if (a5)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 13, 0);
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  if (!a5)
    goto LABEL_13;
  v10 = 20;
LABEL_7:
  v11 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], v10, 0);
LABEL_8:
  v12 = 0;
  *a5 = v11;
LABEL_14:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v15, v9);
  return v12;
}

- (BOOL)getInfo:(id *)a3 forFilename:(id)a4 error:(id *)a5
{
  return -[DYCaptureArchive getInfo:forFilenameBuffer:error:](self, "getInfo:forFilenameBuffer:error:", a3, objc_msgSend(a4, "cStringUsingEncoding:", 1), a5);
}

- (BOOL)fileExistsForFilenameBuffer:(const char *)a3 error:(id *)a4
{
  volatile int *v7;
  void *v8;
  BOOL v9;
  _BYTE v11[24];
  OS_dispatch_semaphore *lock_global_semaphore;

  lock_global_semaphore = self->_lock_global_semaphore;
  AutoReaderLock::AutoReaderLock((uint64_t)v11, (AutoReaderLock *)&self->_lock_readers, (uint64_t)lock_global_semaphore, (uint64_t)&self->_blocking_readers);
  if (!*a3)
  {
    if (a4)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 1, 0);
      goto LABEL_7;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if (!-[DYCaptureArchive isClosed](self, "isClosed"))
  {
    v9 = -[DYCaptureArchive _findHashEntry:](self, "_findHashEntry:", a3) != -1;
    goto LABEL_10;
  }
  if (!a4)
    goto LABEL_9;
  v8 = (void *)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 20, 0);
LABEL_7:
  v9 = 0;
  *a4 = v8;
LABEL_10:
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)v11, v7);
  return v9;
}

- (BOOL)fileExistsForFilename:(id)a3 error:(id *)a4
{
  return -[DYCaptureArchive fileExistsForFilenameBuffer:error:](self, "fileExistsForFilenameBuffer:error:", objc_msgSend(a3, "cStringUsingEncoding:", 1), a4);
}

- (id)metadataValueForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_metadata, "objectForKey:", a3);
}

- (BOOL)setMetadataValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  _BOOL4 v9;
  void *v10;

  v9 = -[DYCaptureArchive isReadOnly](self, "isReadOnly");
  if (v9)
  {
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 7, 0);
  }
  else
  {
    v10 = (void *)objc_msgSend(a3, "copyWithZone:", 0);
    -[NSMutableDictionary setObject:forKey:](self->_metadata, "setObject:forKey:", v10, a4);

  }
  return !v9;
}

- (void)setMetadataFromArchive:(id)a3
{

  self->_metadata = (NSMutableDictionary *)objc_msgSend(*((id *)a3 + 18), "mutableCopy");
}

- (void)markMetadataModified
{
  NSObject *write_queue;
  _QWORD block[5];

  write_queue = self->_write_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__DYCaptureArchive_markMetadataModified__block_invoke;
  block[3] = &unk_250D587B0;
  block[4] = self;
  dispatch_sync(write_queue, block);
}

intptr_t __40__DYCaptureArchive_markMetadataModified__block_invoke(uint64_t a1)
{
  NSObject *dsema;

  dsema = *(NSObject **)(*(_QWORD *)(a1 + 32) + 232);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 272) = 1;
  return dispatch_semaphore_signal(dsema);
}

- (BOOL)storeAdjunctData:(id)a3 filename:(id)a4 error:(id *)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  void *v14;
  NSString *v15;
  const char *v16;

  if (!a4)
  {
    v16 = "filename != nil";
    goto LABEL_24;
  }
  if (!a3)
  {
    v16 = "data != nil";
LABEL_24:
    __assert_rtn("-[DYCaptureArchive storeAdjunctData:filename:error:]", ", 0, v16);
  }
  if (!objc_msgSend(a4, "length")
    || (unint64_t)objc_msgSend((id)objc_msgSend(a4, "pathComponents"), "count") >= 2)
  {
    if (!a5)
      return 0;
    v9 = *MEMORY[0x24BE39080];
    v10 = (void *)MEMORY[0x24BE39108];
    v11 = 1;
LABEL_7:
    *a5 = (id)objc_msgSend(v10, "errorWithDomain:code:userInfo:", v9, v11, 0);
    return 0;
  }
  if (-[DYCaptureArchive isReadOnly](self, "isReadOnly"))
  {
    if (!a5)
      return 0;
    v9 = *MEMORY[0x24BE39080];
    v10 = (void *)MEMORY[0x24BE39108];
    v11 = 7;
    goto LABEL_7;
  }
  if (-[DYCaptureArchive isClosed](self, "isClosed"))
    goto LABEL_13;
  if ((unint64_t)objc_msgSend(a3, "length") >> 31)
  {
    if (!a5)
      return 0;
    v9 = *MEMORY[0x24BE39080];
    v10 = (void *)MEMORY[0x24BE39108];
    v11 = 2;
    goto LABEL_7;
  }
  v13 = objc_msgSend(MEMORY[0x24BDBCE50], "dy_dataByCompressingData:error:", a3, a5);
  if (!v13)
    return 0;
  v14 = (void *)v13;
  if (-[DYCaptureArchive isClosed](self, "isClosed"))
  {
LABEL_13:
    if (!a5)
      return 0;
    v9 = *MEMORY[0x24BE39080];
    v10 = (void *)MEMORY[0x24BE39108];
    v11 = 20;
    goto LABEL_7;
  }
  v15 = -[NSString stringByAppendingPathComponent:](-[DYCaptureArchive path](self, "path"), "stringByAppendingPathComponent:", a4);
  if (!v15)
    return 0;
  return objc_msgSend(v14, "writeToFile:options:error:", v15, 0, a5);
}

- (id)copyAdjunctDataForFilename:(id)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  char v14;

  if (!a3)
    __assert_rtn("-[DYCaptureArchive copyAdjunctDataForFilename:error:]", ", 0, "filename != nil");
  if (objc_msgSend(a3, "length") && (unint64_t)objc_msgSend((id)objc_msgSend(a3, "pathComponents"), "count") < 2)
  {
    if (-[DYCaptureArchive isClosed](self, "isClosed"))
    {
      if (a4)
      {
        v7 = *MEMORY[0x24BE39080];
        v8 = (void *)MEMORY[0x24BE39108];
        v9 = 20;
        goto LABEL_6;
      }
    }
    else
    {
      v11 = -[NSString stringByAppendingPathComponent:](-[DYCaptureArchive path](self, "path"), "stringByAppendingPathComponent:", a3);
      if (v11)
      {
        v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", v11, 0, a4);
        if (v12)
        {
          v13 = (void *)v12;
          v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
          v14 = objc_msgSend(MEMORY[0x24BDBCE50], "dy_decompressData:inMutableData:error:", v13, v10, a4);

          if ((v14 & 1) != 0)
            return v10;

        }
      }
      else if (a4)
      {
        v7 = *MEMORY[0x24BE39080];
        v8 = (void *)MEMORY[0x24BE39108];
        v9 = 14;
        goto LABEL_6;
      }
    }
    return 0;
  }
  if (!a4)
    return 0;
  v7 = *MEMORY[0x24BE39080];
  v8 = (void *)MEMORY[0x24BE39108];
  v9 = 1;
LABEL_6:
  v10 = 0;
  *a4 = (id)objc_msgSend(v8, "errorWithDomain:code:userInfo:", v7, v9, 0);
  return v10;
}

- (BOOL)adjunctFileExistsForFilename:(id)a3 error:(id *)a4
{
  if (!a3)
    __assert_rtn("-[DYCaptureArchive adjunctFileExistsForFilename:error:]", ", 0, "filename != nil");
  if (objc_msgSend(a3, "length"))
    return objc_msgSend((id)objc_opt_new(), "fileExistsAtPath:", -[NSString stringByAppendingPathComponent:](-[DYCaptureArchive path](self, "path"), "stringByAppendingPathComponent:", a3));
  if (a4)
    *a4 = (id)objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], 1, 0);
  return 0;
}

- (BOOL)acceptCaptureVisitor:(id)a3
{
  objc_msgSend(a3, "visitCaptureArchive:", self);
  return 1;
}

- (__CFUUID)uuid
{
  return self->_uuid;
}

- (BOOL)deleteOnClose
{
  return self->_deleteOnClose;
}

- (void)setDeleteOnClose:(BOOL)a3
{
  self->_deleteOnClose = a3;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unsigned int *v4;

  begin = self->_cacheTable.__begin_;
  if (begin)
  {
    self->_cacheTable.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_read_buffer_tokens.__begin_;
  if (v4)
  {
    self->_read_buffer_tokens.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 38) = 0;
  *((_QWORD *)self + 39) = 0;
  *((_QWORD *)self + 37) = 0;
  return self;
}

- (uint64_t)cacheAllResources
{
  uint64_t *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    std::unique_ptr<std::__thread_struct>::reset[abi:ne180100](v2, 0);
    MEMORY[0x24262211C](v2, 0xA0C40AFF93C70);
  }
  return a1;
}

@end
