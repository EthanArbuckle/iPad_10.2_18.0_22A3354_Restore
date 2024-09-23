@implementation _BlastDoorHWEncoding

+ (id)encodeHandwriting:(id)a3 compress:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  if (getHWEncodingClass())
  {
    objc_msgSend(getHWEncodingClass(), "encodeHandwriting:compress:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)decodeHandwritingFromData:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (getHWEncodingClass())
  {
    objc_msgSend(getHWEncodingClass(), "decodeHandwritingFromData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)dataRepresentation:(id)a3 frame:(CGRect)a4 bound:(CGRect)a5 uuid:(id)a6 date:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a4.size.height;
  v13 = a4.size.width;
  v14 = a4.origin.y;
  v15 = a4.origin.x;
  v18 = a6;
  v19 = a7;
  +[_BlastDoorDrawing createDrawing:frame:bound:](_BlastDoorDrawing, "createDrawing:frame:bound:", a3, v15, v14, v13, v12, x, y, width, height);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    +[_BlastDoorHWHandwritingItem createHandwritingItem:uuid:date:](_BlastDoorHWHandwritingItem, "createHandwritingItem:uuid:date:", v20, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(a1, "encodeHandwriting:compress:", v21, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
