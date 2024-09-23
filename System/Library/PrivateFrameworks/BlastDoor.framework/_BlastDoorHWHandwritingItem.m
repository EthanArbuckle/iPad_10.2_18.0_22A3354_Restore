@implementation _BlastDoorHWHandwritingItem

+ (id)createHandwritingItem:(id)a3 uuid:(id)a4 date:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (getHWHandwritingItemClass())
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)getHWHandwritingItemClass()), "initWithDrawing:", v7);
    objc_msgSend(v10, "setUuid:", v8);
    objc_msgSend(v10, "setCreationDate:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
