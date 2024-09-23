@implementation _SUUIDynamicGridSizeCacheKey

- (BOOL)__isSUUIDynamicGridSizeCacheKey
{
  return 1;
}

- (unint64_t)hash
{
  int64_t position;

  position = self->_position;
  return -[SUUIViewElement elementType](self->_viewElement, "elementType") + 155 * position;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  SUUIViewElement *v6;

  if (a3 == self)
    goto LABEL_6;
  v5 = objc_msgSend(a3, "__isSUUIDynamicGridSizeCacheKey");
  if (v5)
  {
    if (*((_QWORD *)a3 + 1) != self->_position)
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    v6 = (SUUIViewElement *)*((_QWORD *)a3 + 2);
    if (v6 != self->_viewElement)
    {
      LOBYTE(v5) = -[SUUIViewElement isEqual:](v6, "isEqual:");
      return v5;
    }
LABEL_6:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setViewElement:", self->_viewElement);
  objc_msgSend(v4, "setPosition:", self->_position);
  return v4;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (SUUIViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_viewElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end
