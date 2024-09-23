@implementation _UIAccessibilityNavigationViewInfo

- (id)navigationItem
{
  if (a1)
    return objc_loadWeakRetained((id *)(a1 + 16));
  else
    return 0;
}

- (id)setNavigationItem:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 2, a2);
  return result;
}

- (id)barButtonItem
{
  if (a1)
    return objc_loadWeakRetained((id *)(a1 + 24));
  else
    return 0;
}

- (id)setBarButtonItem:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 3, a2);
  return result;
}

- (id)navigationBar
{
  if (a1)
    return objc_loadWeakRetained((id *)(a1 + 32));
  else
    return 0;
}

- (id)setNavigationBar:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 4, a2);
  return result;
}

- (uint64_t)isCancelItem
{
  char v2;

  if (a1)
    v2 = *(_BYTE *)(a1 + 8) & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)setIsCancelItem:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

- (uint64_t)isRightItem
{
  char v2;

  if (a1)
    v2 = *(_BYTE *)(a1 + 9) & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)setIsRightItem:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 9) = a2 & 1;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationBar);
  objc_destroyWeak((id *)&self->_barButtonItem);
  objc_destroyWeak((id *)&self->_navigationItem);
}

@end
