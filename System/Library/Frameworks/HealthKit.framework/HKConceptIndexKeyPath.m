@implementation HKConceptIndexKeyPath

- (HKConceptIndexKeyPath)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (id)conceptIndexKeyPathWithFullKeyPath:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKConceptIndexKeyPath.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullKeyPath"));

  }
  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("."));
    v10 = v9;
    if (objc_msgSend(v7, "length") != v8 + 1)
    {
      v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFullKeyPath:range:", v7, v8, v10);
      goto LABEL_9;
    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = CFSTR("Key Path ends in a period and is invalid.");
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = CFSTR("Key Path is an empty string. Please provide a key path with at least length 1");
  }
  objc_msgSend(v11, "hk_assignError:code:format:", a4, 3, v12);
  v13 = 0;
LABEL_9:

  return v13;
}

- (HKConceptIndexKeyPath)initWithFullKeyPath:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  HKConceptIndexKeyPath *v8;
  uint64_t v9;
  NSString *fullKeyPath;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKConceptIndexKeyPath;
  v8 = -[HKConceptIndexKeyPath init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    fullKeyPath = v8->_fullKeyPath;
    v8->_fullKeyPath = (NSString *)v9;

    v8->_range.location = location;
    v8->_range.length = length;
  }

  return v8;
}

- (id)head
{
  NSString *fullKeyPath;
  NSString **p_fullKeyPath;

  p_fullKeyPath = &self->_fullKeyPath;
  fullKeyPath = self->_fullKeyPath;
  if (p_fullKeyPath[1] == (NSString *)0x7FFFFFFFFFFFFFFFLL)
    return fullKeyPath;
  -[NSString substringToIndex:](fullKeyPath, "substringToIndex:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tail
{
  NSUInteger location;

  location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[NSString substringFromIndex:](self->_fullKeyPath, "substringFromIndex:", self->_range.length + location);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)fullKeyPath
{
  return self->_fullKeyPath;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullKeyPath, 0);
}

@end
