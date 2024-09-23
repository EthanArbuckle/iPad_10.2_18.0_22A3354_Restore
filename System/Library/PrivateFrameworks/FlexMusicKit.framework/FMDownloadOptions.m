@implementation FMDownloadOptions

- (FMDownloadOptions)init
{
  FMDownloadOptions *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  FMDownloadOptions *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMDownloadOptions;
  v2 = -[FMDownloadOptions init](&v9, sel_init);
  v7 = v2;
  if (v2)
    objc_msgSend__configureDefaults(v2, v3, v4, v5, v6);
  return v7;
}

- (void)_configureDefaults
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_setAllowsCellular_(self, a2, 1, v2, v3);
  objc_msgSend_setDownloadPriority_(self, v5, 0, v6, v7);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = (void *)MEMORY[0x24BDD17C8];
  if (objc_msgSend_downloadPriority(self, a2, v2, v3, v4))
    v11 = CFSTR("Background");
  else
    v11 = CFSTR("User Initiated");
  if (objc_msgSend_allowsCellular(self, v7, v8, v9, v10))
    return (id)objc_msgSend_stringWithFormat_(v6, v12, (uint64_t)CFSTR("[%@] [cellular %@]"), v13, v14, v11, CFSTR("allowed"));
  else
    return (id)objc_msgSend_stringWithFormat_(v6, v12, (uint64_t)CFSTR("[%@] [cellular %@]"), v13, v14, v11, CFSTR("not allowed"));
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (void)setAllowsCellular:(BOOL)a3
{
  self->_allowsCellular = a3;
}

- (unint64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadPriority:(unint64_t)a3
{
  self->_downloadPriority = a3;
}

@end
