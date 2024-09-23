@implementation ABCarouselItem

- (id)initWithImage:(char)a3 canBeHighlighted:(void *)a4 identifier:
{
  id v8;
  id v9;
  id *v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v8 = a2;
  v9 = a4;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)ABCarouselItem;
    v10 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 3, a2);
      *((_BYTE *)a1 + 8) = a3;
      v11 = objc_msgSend(v9, "copy");
      v12 = a1[2];
      a1[2] = (id)v11;

    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  char v7;
  NSString *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    if (self)
    {
      if (v5)
      {
        if (self->_canBeHighlighted != (*((_BYTE *)v5 + 8) != 0))
        {
LABEL_5:
          v7 = 0;
LABEL_10:

          goto LABEL_11;
        }
        v8 = self->_identifier;
        goto LABEL_8;
      }
      if (self->_canBeHighlighted)
        goto LABEL_5;
      v8 = self->_identifier;
    }
    else
    {
      if (v5)
      {
        if (*((_BYTE *)v5 + 8))
          goto LABEL_5;
        v8 = 0;
LABEL_8:
        v9 = (void *)v6[2];
LABEL_9:
        v7 = ABEqualObjects(v8, v9);

        goto LABEL_10;
      }
      v8 = 0;
    }
    v9 = 0;
    goto LABEL_9;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
