@implementation _IKJSDataObserverRecord

+ (id)hashForObserver:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a3);
}

- (_IKJSDataObserverRecord)initWithObserver:(id)a3 pathString:(id)a4
{
  id v6;
  id v7;
  _IKJSDataObserverRecord *v8;
  _IKJSDataObserverRecord *v9;
  uint64_t v10;
  NSString *observerHash;
  uint64_t v12;
  NSString *pathString;
  id WeakRetained;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_IKJSDataObserverRecord;
  v8 = -[_IKJSDataObserverRecord init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_msgSend((id)objc_opt_class(), "hashForObserver:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    observerHash = v9->_observerHash;
    v9->_observerHash = (NSString *)v10;

    v12 = objc_msgSend(v7, "copy");
    pathString = v9->_pathString;
    v9->_pathString = (NSString *)v12;

    WeakRetained = objc_loadWeakRetained((id *)&v9->_observer);
    v9->_observerFlags.hasDidChangePropertyPath = objc_opt_respondsToSelector() & 1;

  }
  return v9;
}

- (BOOL)isAffectedByPropertyPathWithString:(id)a3 subpathString:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 hasDidChangePropertyPath;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  BOOL v13;

  v6 = a3;
  -[_IKJSDataObserverRecord observer](self, "observer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    hasDidChangePropertyPath = self->_observerFlags.hasDidChangePropertyPath;

    if (hasDidChangePropertyPath)
    {
      -[_IKJSDataObserverRecord pathString](self, "pathString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v6;
      if (objc_msgSend(v9, "length"))
      {
        if (objc_msgSend(v10, "rangeOfString:", v9))
        {
          v12 = 0;
          v13 = objc_msgSend(v9, "rangeOfString:", v10) == 0;
          goto LABEL_11;
        }
      }
      else
      {
        v11 = 0;
      }
      objc_msgSend(v10, "substringFromIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 1;
LABEL_11:

      if (!a4)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  v12 = 0;
  v13 = 0;
  if (a4)
LABEL_7:
    *a4 = objc_retainAutorelease(v12);
LABEL_8:

  return v13;
}

- (IKJSDataObserving)observer
{
  return (IKJSDataObserving *)objc_loadWeakRetained((id *)&self->_observer);
}

- (NSString)observerHash
{
  return self->_observerHash;
}

- (NSString)pathString
{
  return self->_pathString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathString, 0);
  objc_storeStrong((id *)&self->_observerHash, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end
