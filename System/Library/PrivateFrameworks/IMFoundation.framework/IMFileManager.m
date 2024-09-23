@implementation IMFileManager

+ (id)defaultManager
{
  return (id)((uint64_t (*)(id, char *))MEMORY[0x1E0DE7D20])(a1, sel_defaultHFSFileManager);
}

+ (id)defaultHFSFileManager
{
  if (qword_1EE1DD880 != -1)
    dispatch_once(&qword_1EE1DD880, &unk_1E2C42C28);
  return (id)qword_1EE1DD888;
}

- (id)displayNameOfFileWithName:(id)a3 hfsFlags:(unsigned __int16)a4
{
  char v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int isEqualToString;
  id v14;
  void *v15;

  v4 = a4;
  v5 = a3;
  v9 = v5;
  if ((v4 & 0x10) != 0
    || (objc_msgSend_pathExtension(v5, v6, v7, v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        isEqualToString = objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("app"), v12),
        v10,
        isEqualToString))
  {
    objc_msgSend_stringByDeletingPathExtension(v9, v6, v7, v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v9;
  }
  v15 = v14;

  return v15;
}

- (id)pathExtensionForMIMEType:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  __CFString *v13;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  objc_msgSend_sharedMappings(MEMORY[0x1E0CB39C0], v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredExtensionForMIMEType_(v7, v8, (uint64_t)v3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if ((objc_msgSend_isEqualToIgnoringCase_(v3, v11, (uint64_t)CFSTR("text/x-vlocation"), v12) & 1) != 0)
    {
      v13 = CFSTR("vcf");
      goto LABEL_3;
    }
    if ((objc_msgSend_isEqualToIgnoringCase_(v3, v15, (uint64_t)CFSTR("text/x-vcalendar"), v16) & 1) != 0)
    {
      v13 = CFSTR("vcs");
      goto LABEL_3;
    }
  }
  v13 = v10;
LABEL_3:

  return v13;
}

- (id)UTITypeOfMimeType:(id)a3
{
  id v3;
  uint64_t (*v4)(uint64_t, id, _QWORD);
  void *v5;

  v3 = a3;
  if (qword_1EE1DDA68 != -1)
    dispatch_once(&qword_1EE1DDA68, &unk_1E2C43248);
  v4 = (uint64_t (*)(uint64_t, id, _QWORD))off_1EE1DDA60;
  if (qword_1EE1DDA80 != -1)
    dispatch_once(&qword_1EE1DDA80, &unk_1E2C43688);
  v5 = (void *)v4(qword_1EE1DDA88, v3, 0);

  return v5;
}

- (id)MIMETypeOfPathExtension:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("vcs"), v5) & 1) != 0)
  {
    v9 = CFSTR("text/x-vcalendar");
  }
  else
  {
    objc_msgSend_sharedMappings(MEMORY[0x1E0CB39C0], v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_MIMETypeForExtension_(v10, v11, (uint64_t)v3, v12);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)MIMETypeOfPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  __CFString *v13;

  v4 = a3;
  objc_msgSend_pathExtension(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v8, v9, (uint64_t)CFSTR("vcf"), v10)
    && (objc_msgSend_hasSuffix_(v4, v11, (uint64_t)CFSTR(".loc.vcf"), v12) & 1) != 0)
  {
    v13 = CFSTR("text/x-vlocation");
  }
  else
  {
    objc_msgSend_MIMETypeOfPathExtension_(self, v11, (uint64_t)v8, v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)pathExtensionForUTIType:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t (*v7)(id, uint64_t);
  void *v8;

  v6 = a3;
  if (qword_1EE1DD600 != -1)
    dispatch_once(&qword_1EE1DD600, &unk_1E2C44458);
  if (objc_msgSend_length(v6, v3, v4, v5))
  {
    v7 = (uint64_t (*)(id, uint64_t))off_1EE1DD5F8;
    if (qword_1EE1DD6F8 != -1)
      dispatch_once(&qword_1EE1DD6F8, &unk_1E2C436A8);
    v8 = (void *)v7(v6, qword_1EE1DD700);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)UTITypeOfPath:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t (*v14)(uint64_t, void *, _QWORD);

  v3 = a3;
  objc_msgSend_pathExtension(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("vcf"), v9)
    && (objc_msgSend_hasSuffix_(v3, v10, (uint64_t)CFSTR(".loc.vcf"), v12) & 1) != 0)
  {
    v13 = CFSTR("public.vlocation");
  }
  else if (objc_msgSend_length(v7, v10, v11, v12))
  {
    if (qword_1EE1DD6F0 != -1)
      dispatch_once(&qword_1EE1DD6F0, &unk_1E2C43368);
    v14 = (uint64_t (*)(uint64_t, void *, _QWORD))off_1EE1DD6E8;
    if (qword_1EE1DD6F8 != -1)
      dispatch_once(&qword_1EE1DD6F8, &unk_1E2C436A8);
    v13 = (__CFString *)v14(qword_1EE1DD700, v7, 0);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)UTITypeOfPathExtension:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, id, _QWORD);
  void *v8;

  v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6))
  {
    if (qword_1EE1DDA78 != -1)
      dispatch_once(&qword_1EE1DDA78, &unk_1E2C433C8);
    v7 = (uint64_t (*)(uint64_t, id, _QWORD))off_1EE1DDA70;
    if (qword_1EE1DD6F8 != -1)
      dispatch_once(&qword_1EE1DD6F8, &unk_1E2C436A8);
    v8 = (void *)v7(qword_1EE1DD700, v3, 0);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
