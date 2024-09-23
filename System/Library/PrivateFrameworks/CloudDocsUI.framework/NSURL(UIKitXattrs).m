@implementation NSURL(UIKitXattrs)

- (id)_ui_extendedAttributeForKey:()UIKitXattrs
{
  const char *v4;
  id v5;
  const char *v6;
  ssize_t v7;
  size_t v8;
  id v9;

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  objc_msgSend(a1, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");

  v7 = getxattr(v6, v4, 0, 0, 0, 1);
  if (v7 < 1)
    goto LABEL_4;
  v8 = v7;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v7);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (getxattr(v6, v4, (void *)objc_msgSend(v9, "mutableBytes"), v8, 0, 1) != v8)
  {

LABEL_4:
    v9 = 0;
  }
  return v9;
}

- (uint64_t)_ui_setExtendedAttribute:()UIKitXattrs forKey:
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  id v11;
  const void *v12;
  size_t v13;

  v6 = objc_retainAutorelease(a4);
  v7 = a3;
  v8 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
  objc_msgSend(a1, "path");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");

  v11 = objc_retainAutorelease(v7);
  v12 = (const void *)objc_msgSend(v11, "bytes");
  v13 = objc_msgSend(v11, "length");

  return setxattr(v10, v8, v12, v13, 0, 1);
}

@end
