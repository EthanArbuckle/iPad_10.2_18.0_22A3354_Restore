@implementation NSURL(NSItemProvider)

+ (uint64_t)readableTypeIdentifiersForItemProvider
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = _MergedGlobals_88();
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
}

- (NSData)_URLArchive
{
  void *v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend(a1, "baseURL");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  if (v2)
  {
    objc_msgSend(v3, "addObject:", objc_msgSend(a1, "relativeString"));
    v4 = (const __CFString *)objc_msgSend(v2, "absoluteString");
  }
  else
  {
    objc_msgSend(v3, "addObject:", objc_msgSend(a1, "absoluteString"));
    v4 = &stru_1E0F56070;
  }
  objc_msgSend(v3, "addObject:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(a1, "_NSItemProviderArchive_customArchiveDictionary");
    if (v5)
      objc_msgSend(v3, "addObject:", v5);
  }
  return +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
}

+ (id)objectWithItemProviderData:()NSItemProvider typeIdentifier:error:
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = _MergedGlobals_88();
  if (!off_1ECD04D58(a4, v8))
  {
    v22 = (uint64_t)_NSIPCocoaErrorWithCode(4864, 0, 0, (uint64_t)CFSTR("A URL cannot be instantiated from a representation of type “%@”."), v9, v10, v11, v12, a4);
    goto LABEL_18;
  }
  v38[0] = 0;
  v13 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a3, 0, 0, v38);
  if (!_NSIsNSArray())
    goto LABEL_16;
  if ((unint64_t)objc_msgSend(v13, "count") >= 2
    && (objc_msgSend(v13, "objectAtIndexedSubscript:", 0), _NSIsNSString())
    && (objc_msgSend(v13, "objectAtIndexedSubscript:", 1), _NSIsNSString()))
  {
    v18 = objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", 1), "isEqualToString:", &stru_1E0F56070);
    v19 = objc_alloc(MEMORY[0x1E0C99E98]);
    v20 = objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    if (v18)
      v21 = objc_msgSend(v19, "initWithString:", v20);
    else
      v21 = objc_msgSend(v19, "initWithString:relativeToURL:", v20, objc_msgSend(v13, "objectAtIndexedSubscript:", 1));
    v23 = (void *)v21;
  }
  else
  {
    v23 = 0;
  }
  if ((unint64_t)objc_msgSend(v13, "count") >= 3)
  {
    v24 = objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
    if (_NSIsNSDictionary())
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v23, "_NSItemProviderArchive_didUnarchiveCustomDictionary:", v24);
    }
  }
  if (v23)
  {
    v22 = 0;
  }
  else
  {
LABEL_16:
    v22 = (uint64_t)_NSIPCocoaErrorWithCode(4864, v38[0], 0, (uint64_t)CFSTR("The URL archive of type “%@” contains invalid data."), v14, v15, v16, v17, a4);
    v23 = 0;
  }
  v25 = v23;
  if (!v25)
  {
LABEL_18:
    if (!objc_msgSend(a3, "length"))
    {
      v25 = 0;
LABEL_27:
      if (!(v25 | v22))
      {
        v22 = (uint64_t)_NSIPCocoaErrorWithCode(4864, 0, 0, (uint64_t)CFSTR("A URL could not be instantiated because of an unknown error."), v26, v27, v28, v29, v37);
        v25 = 0;
      }
      goto LABEL_29;
    }
    v30 = -[NSString initWithData:encoding:]([NSString alloc], "initWithData:encoding:", a3, 4);
    if (v30)
    {
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v30);
      v31 = (void *)objc_msgSend((id)v25, "scheme");
      if (v25 && objc_msgSend(v31, "length") && (objc_msgSend((id)v25, "isFileURL") & 1) == 0)
      {
        v22 = 0;
        goto LABEL_25;
      }

      v22 = (uint64_t)_NSIPCocoaErrorWithCode(4864, v22, 0, (uint64_t)CFSTR("A URL cannot be instantiated from a representation of type “%@” even after treating it as a string."), v32, v33, v34, v35, a4);
    }
    v25 = 0;
LABEL_25:

    goto LABEL_27;
  }
LABEL_29:
  if (a5 && v22)
    *a5 = v22;
  return (id)v25;
}

+ (uint64_t)writableTypeIdentifiersForItemProvider
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = _MergedGlobals_88();
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
}

- (void)writableTypeIdentifiersForItemProvider
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (objc_msgSend(a1, "isFileURL"))
    objc_msgSend(v2, "addObject:", off_1ECD04D50());
  objc_msgSend(v2, "addObject:", _MergedGlobals_88());
  return v2;
}

- (uint64_t)loadDataWithTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:
{
  uint64_t v7;

  if ((objc_msgSend(a3, "isEqualToString:", off_1ECD04D50()) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", _MergedGlobals_88()))
  {
    v7 = objc_msgSend(a1, "_URLArchive");
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, _QWORD))(a4 + 16))(a4, v7, 0);
  return 0;
}

@end
