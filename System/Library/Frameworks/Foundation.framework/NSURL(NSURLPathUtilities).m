@implementation NSURL(NSURLPathUtilities)

- (uint64_t)pathComponents
{
  return objc_msgSend((id)objc_msgSend(a1, "path"), "pathComponents");
}

- (uint64_t)lastPathComponent
{
  return objc_msgSend((id)objc_msgSend(a1, "path"), "lastPathComponent");
}

- (uint64_t)pathExtension
{
  return objc_msgSend((id)objc_msgSend(a1, "path"), "pathExtension");
}

- (id)URLByResolvingSymlinksInPath
{
  void *v3;
  uint64_t v4;

  if (!objc_msgSend(a1, "isFileURL"))
    return a1;
  if (objc_msgSend(a1, "isFileReferenceURL"))
    return (id)objc_msgSend((id)objc_msgSend(a1, "filePathURL"), "URLByResolvingSymlinksInPath");
  v3 = (void *)objc_msgSend(a1, "path");
  if (!v3)
    return a1;
  v4 = objc_msgSend(v3, "stringByResolvingSymlinksInPath");
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
}

- (uint64_t)URLByAppendingPathComponent:()NSURLPathUtilities
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  _QWORD v9[8];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: component, components, or pathExtension cannot be nil."), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v8);
  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__16;
  v15 = __Block_byref_object_dispose__16;
  v16 = 0;
  if ((objc_msgSend(a3, "hasSuffix:", CFSTR("/")) & 1) != 0 || !-[objc_class isFileURL](a1, "isFileURL"))
  {
    v6 = -[objc_class URLByAppendingPathComponent:isDirectory:](a1, "URLByAppendingPathComponent:isDirectory:", a3, 0);
    v12[5] = v6;
  }
  else
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3052000000;
    v10[3] = __Block_byref_object_copy__16;
    v10[4] = __Block_byref_object_dispose__16;
    v10[5] = 0;
    v5 = -[objc_class URLByAppendingPathComponent:isDirectory:](a1, "URLByAppendingPathComponent:isDirectory:", a3, 0);
    v12[5] = v5;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__NSURL_NSURLPathUtilities__URLByAppendingPathComponent___block_invoke;
    v9[3] = &unk_1E0F51108;
    v9[6] = &v11;
    v9[7] = v10;
    v9[4] = a1;
    v9[5] = a3;
    +[NSURL setIOPolicy:type:scope:forBlock:](MEMORY[0x1E0C99E98], (uint64_t)v9);
    _Block_object_dispose(v10, 8);
    v6 = v12[5];
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (CFURLRef)URLByAppendingPathComponent:()NSURLPathUtilities isDirectory:
{
  void *v5;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: component, components, or pathExtension cannot be nil."), _NSMethodExceptionProem(url, a2)), 0);
    objc_exception_throw(v5);
  }
  return CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE30], url, a3, a4);
}

- (CFURLRef)URLByDeletingPathExtension
{
  return CFURLCreateCopyDeletingPathExtension((CFAllocatorRef)*MEMORY[0x1E0C9AE30], url);
}

- (CFURLRef)URLByAppendingPathExtension:()NSURLPathUtilities
{
  void *v4;

  if (!a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: component, components, or pathExtension cannot be nil."), _NSMethodExceptionProem(url, a2)), 0);
    objc_exception_throw(v4);
  }
  return CFURLCreateCopyAppendingPathExtension((CFAllocatorRef)*MEMORY[0x1E0C9AE30], url, a3);
}

- (CFURLRef)URLByDeletingLastPathComponent
{
  return CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE30], url);
}

+ (uint64_t)fileURLWithPathComponents:()NSURLPathUtilities
{
  NSString *v4;
  void *v6;

  if (!a3)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: component, components, or pathExtension cannot be nil."), _NSMethodExceptionProem(a1, a2)), 0);
    objc_exception_throw(v6);
  }
  v4 = +[NSString pathWithComponents:](NSString, "pathWithComponents:");
  if (objc_msgSend((id)objc_msgSend(a3, "lastObject"), "isEqual:", CFSTR("/")))
    return objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
  else
    return objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
}

- (id)URLByStandardizingPath
{
  uint64_t v3;
  uint64_t v4;

  if (!objc_msgSend(a1, "isFileURL"))
    return a1;
  if (objc_msgSend(a1, "isFileReferenceURL"))
    return (id)objc_msgSend((id)objc_msgSend(a1, "filePathURL"), "URLByStandardizingPath");
  v3 = objc_msgSend((id)objc_msgSend(a1, "path"), "stringByStandardizingPath");
  if (!v3)
    return a1;
  v4 = v3;
  if (objc_msgSend(a1, "checkResourceIsReachableAndReturnError:", 0))
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, CFURLHasDirectoryPath((CFURLRef)a1) != 0);
}

- (uint64_t)checkResourceIsReachableAndReturnError:()NSURLPathUtilities
{
  objc_class *v5;
  uint64_t v6;
  void *v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v5 == (objc_class *)qword_1ECD0A200)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v5, a2)), 0);
    objc_exception_throw(v8);
  }
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__NSURL_NSURLPathUtilities__checkResourceIsReachableAndReturnError___block_invoke;
    v9[3] = &unk_1E0F51130;
    v9[4] = &v10;
    v9[5] = v5;
    v9[6] = a3;
    +[NSURL setIOPolicy:type:scope:forBlock:](MEMORY[0x1E0C99E98], (uint64_t)v9);
    if (a3)
    {
      if (!*((_BYTE *)v11 + 24))
        *a3 = *a3;
    }
  }
  v6 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

@end
