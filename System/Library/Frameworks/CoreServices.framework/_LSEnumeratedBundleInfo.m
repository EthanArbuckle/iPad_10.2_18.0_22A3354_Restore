@implementation _LSEnumeratedBundleInfo

- (_LSEnumeratedBundleInfo)initWithBundleID:(id)a3 isPlaceholder:(BOOL)a4
{
  id v7;
  _LSEnumeratedBundleInfo *v8;
  _LSEnumeratedBundleInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LSEnumeratedBundleInfo;
  v8 = -[_LSEnumeratedBundleInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundleID, a3);
    v9->_isPlaceholder = a4;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_isPlaceholder | (2 * -[NSString hash](self->_bundleID, "hash"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", self->_bundleID))
      v7 = self->_isPlaceholder == objc_msgSend(v5, "isPlaceholder");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
