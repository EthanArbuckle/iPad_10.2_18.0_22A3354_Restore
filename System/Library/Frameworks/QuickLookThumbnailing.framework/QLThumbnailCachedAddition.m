@implementation QLThumbnailCachedAddition

- (QLThumbnailCachedAddition)initWithAddition:(id)a3
{
  id v4;
  QLThumbnailCachedAddition *v5;
  id v6;
  int v7;
  QLThumbnailCachedAddition *v8;
  stat v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLThumbnailCachedAddition;
  v5 = -[QLThumbnailCachedAddition init](&v11, sel_init);
  if (!v5)
    goto LABEL_5;
  memset(&v10, 0, sizeof(v10));
  objc_msgSend(v4, "url", 0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = stat((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v10);

  if (!v7)
  {
    -[QLThumbnailCachedAddition setAddition:](v5, "setAddition:", v4);
    v5->_fileID = v10.st_ino;
LABEL_5:
    v8 = v5;
    goto LABEL_6;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "addition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", self->_addition);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[GSAddition hash](self->_addition, "hash");
}

- (BOOL)isStillValid
{
  id v3;
  int v4;
  stat v6;

  memset(&v6, 0, sizeof(v6));
  -[GSAddition url](self->_addition, "url", 0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = stat((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v6);

  return !v4 && self->_fileID == v6.st_ino;
}

- (GSAddition)addition
{
  return (GSAddition *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAddition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addition, 0);
}

@end
