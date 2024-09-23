@implementation NSURL(UTAdditions)

- (id)URLByAppendingPathComponent:()UTAdditions conformingToType:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTAdditions.mm"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("partialName != nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTAdditions.mm"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentType != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "stringByAppendingPathExtensionForType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:", v10, objc_msgSend(v9, "conformsToType:", &off_1ECD25710));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)URLByAppendingPathExtensionForType:()UTAdditions
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UTAdditions.mm"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentType != nil"));

  }
  objc_msgSend(a1, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "stringByAppendingPathExtensionForType:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v5, "conformsToType:", &off_1ECD25710);
    objc_msgSend(a1, "URLByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v7)
    v11 = v7;
  else
    v11 = a1;
  v12 = v11;

  return v12;
}

@end
