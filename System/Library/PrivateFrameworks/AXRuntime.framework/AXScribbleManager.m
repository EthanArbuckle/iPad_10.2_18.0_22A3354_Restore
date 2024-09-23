@implementation AXScribbleManager

- (AXScribbleManager)init
{
  AXScribbleManager *v2;
  AXScribbleManager *v3;
  AXScribbleElement *lastFetchedElement;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXScribbleManager;
  v2 = -[AXScribbleManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    lastFetchedElement = v2->_lastFetchedElement;
    v2->_lastSearchPoint = 0;
    v2->_lastFetchedElement = 0;

  }
  return v3;
}

- (void)foundScribbleElement:(id)a3 atSearchPoint:(int64_t)a4
{
  objc_storeStrong((id *)&self->_lastFetchedElement, a3);
}

- (void)hideSelectedElement
{
  AXScribbleElement *lastFetchedElement;

  lastFetchedElement = self->_lastFetchedElement;
  self->_lastFetchedElement = 0;

  self->_lastSearchPoint = 0;
}

- (BOOL)isUniqueElement:(id)a3
{
  id v4;
  AXScribbleElement *lastFetchedElement;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  BOOL v20;
  BOOL v21;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  lastFetchedElement = self->_lastFetchedElement;
  if (!lastFetchedElement)
    goto LABEL_6;
  -[AXScribbleElement renderedText](lastFetchedElement, "renderedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", v7))
  {

    goto LABEL_6;
  }
  -[AXScribbleElement geometry](self->_lastFetchedElement, "geometry");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v4, "geometry");
  v24.origin.x = v16;
  v24.origin.y = v17;
  v24.size.width = v18;
  v24.size.height = v19;
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  v20 = CGRectEqualToRect(v23, v24);

  if (!v20)
  {
LABEL_6:
    v21 = 1;
    goto LABEL_7;
  }
  v21 = 0;
LABEL_7:

  return v21;
}

- (id)searchPointToNSString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("AXScribbleSearchPointCenter");
  else
    return off_1E6919790[a3 - 1];
}

- (int64_t)nsStringToSearchPoint:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXScribbleSearchPointTopLeft")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXScribbleSearchPointTopRight")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXScribbleSearchPointBottomLeft")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXScribbleSerachPointBottomRight")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)nextSearchPoint:(BOOL)a3
{
  int64_t lastSearchPoint;
  uint64_t v4;
  int64_t v5;

  lastSearchPoint = self->_lastSearchPoint;
  v4 = lastSearchPoint - 1;
  if (lastSearchPoint <= 0)
    v4 = 4;
  if (lastSearchPoint < 4)
    v5 = lastSearchPoint + 1;
  else
    v5 = 0;
  if (a3)
    v5 = v4;
  self->_lastSearchPoint = v5;
  return v5;
}

- (int64_t)lastSearchPoint
{
  return self->_lastSearchPoint;
}

- (void)setLastSearchPoint:(int64_t)a3
{
  self->_lastSearchPoint = a3;
}

- (AXScribbleElement)lastFetchedElement
{
  return self->_lastFetchedElement;
}

- (void)setLastFetchedElement:(id)a3
{
  objc_storeStrong((id *)&self->_lastFetchedElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchedElement, 0);
}

@end
