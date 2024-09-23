@implementation UIDragItem

- (id)_safari_localTabDragMetadata
{
  id v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "localObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "localObject");
      v1 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

@end
