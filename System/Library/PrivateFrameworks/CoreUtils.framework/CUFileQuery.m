@implementation CUFileQuery

- (CUFileQuery)initWithDictionary:(id)a3 error:(id *)a4
{
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CUFileQuery *v12;
  CFTypeID TypeID;
  void *v14;
  CUFileQuery *v15;
  uint64_t v17;

  v6 = (const __CFDictionary *)a3;
  v12 = -[CUFileQuery init](self, "init");
  if (v12)
  {
    TypeID = CFStringGetTypeID();
    CFDictionaryGetTypedValue(v6, CFSTR("path"), TypeID, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_storeStrong((id *)&v12->_path, v14);

    v15 = v12;
  }
  else if (a4)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"Init failed", v7, v8, v9, v10, v11, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)encodeWithDictionary:(id)a3
{
  NSString *path;

  path = self->_path;
  if (path)
    objc_msgSend(a3, "setObject:forKeyedSubscript:", path, CFSTR("path"));
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return NSPrintF((uint64_t)"CUFileQuery", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
