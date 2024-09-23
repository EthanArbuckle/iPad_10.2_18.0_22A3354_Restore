@implementation BSUIMapItem

- (id)initWithMKMapItem:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BSUIMapItem;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)name
{
  if (a1)
  {
    objc_msgSend(a1[1], "name");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)phoneNumber
{
  if (a1)
  {
    objc_msgSend(a1[1], "phoneNumber");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_localizedResponseTime
{
  if (a1)
  {
    objc_msgSend(a1[1], "_localizedResponseTime");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)_isMessageIDVerified
{
  if (result)
    return objc_msgSend(*(id *)(result + 8), "_isMessageIDVerified");
  return result;
}

- (id)_navTintBrandColor
{
  if (a1)
  {
    objc_msgSend(a1[1], "_navTintBrandColor");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_navBackgroundbrandColor
{
  if (a1)
  {
    objc_msgSend(a1[1], "_navBackgroundbrandColor");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)timeZone
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "_geoMapItem");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_messageLink");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)messageBusinessHours
{
  if (a1)
  {
    objc_msgSend(a1[1], "_messageBusinessHours");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)url
{
  if (a1)
  {
    objc_msgSend(a1[1], "url");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_bestBrandIconURLForSize:(id *)a1 allowSmaller:(uint64_t)a2
{
  if (a1)
  {
    objc_msgSend(a1[1], "_bestBrandIconURLForSize:allowSmaller:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_bestNavbarBrandIconURLForSize:(id *)a1 allowSmaller:(uint64_t)a2
{
  if (a1)
  {
    objc_msgSend(a1[1], "_bestNavbarBrandIconURLForSize:allowSmaller:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)makePlacecardViewController
{
  if (a1)
    a1 = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x24BE63FD8]), "initWithMapItem:", a1[1]);
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
