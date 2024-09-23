@implementation _GCPhysicalInputFilteredElementCollection

- (id)initWithCollection:(void *)a3 filter:
{
  id *v6;
  void *v8;

  if (a1)
  {
    if (!obj)
    {
      unk_254DEC4F8(&off_254DEC660, "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithCollection_filter_, a1, CFSTR("GCPhysicalInputElement.m"), 86, CFSTR("Invalid parameter not satisfying: %s"), "collection != nil");

    }
    objc_storeStrong(a1 + 1, obj);
    objc_storeStrong(a1 + 2, a3);
    v6 = a1;
  }

  return a1;
}

- (id)_filteredElements
{
  void *v1;
  id v2;
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v7;
  void *v8;
  uint64_t i;
  id v10;
  id v11;
  void *v12;
  void *v13;

  if (!a1)
  {
    v3 = 0;
    return v3;
  }
  v1 = (void *)a1[3];
  if (v1)
  {
    v2 = v1;
  }
  else
  {
    v4 = a1;
    objc_sync_enter(v4);
    v5 = (void *)v4[3];
    if (v5)
    {
      v3 = v5;
      objc_sync_exit(v4);

      return v3;
    }
    v7 = objc_msgSend((id)v4[1], "count");
    v8 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEBB20), "initWithCapacity:", v7);
    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        v10 = (id)objc_msgSend((id)v4[1], "elementAtIndex:", i);
        v11 = v10;
        if (!v4[2] || (objc_msgSend(v10, "conformsToProtocol:") & 1) != 0)
          objc_msgSend(v8, "addObject:", v11);
      }
    }
    v12 = (void *)objc_msgSend(v8, "copy");
    v13 = (void *)v4[3];
    v4[3] = v12;

    objc_sync_exit(v4);
    v2 = v12;
  }
  v3 = v2;
  return v3;
}

- (unint64_t)count
{
  return objc_msgSend(-[_GCPhysicalInputFilteredElementCollection _filteredElements](self), "count");
}

- (id)elementAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(-[_GCPhysicalInputFilteredElementCollection _filteredElements](self), "objectAtIndex:", a3);
}

- (id)elementForAlias:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = -[GCPhysicalInputElementCollection elementForAlias:](self->_backingCollection, "elementForAlias:", a3);
  v5 = v4;
  if (self->_filter && !objc_msgSend(v4, "conformsToProtocol:"))
    v6 = 0;
  else
    v6 = v5;
  return v6;
}

- (id)elementEnumerator
{
  return (id)objc_msgSend(-[_GCPhysicalInputFilteredElementCollection _filteredElements](self), "objectEnumerator");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cached_filteredElements, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_backingCollection, 0);
}

@end
