@implementation PDFTextRange

- (BOOL)isEmpty
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  PDFTextPosition *end;
  uint64_t v11;
  BOOL v12;

  -[PDFTextPosition page](self->_end, "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDFTextPosition page](self->_end, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexForPage:", v5);

  -[PDFTextPosition page](self->_start, "page");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "indexForPage:", v7);

  v12 = 1;
  if (self->_start)
  {
    end = self->_end;
    if (end && v6 >= v8)
    {
      if (v6 != v8
        || (v11 = -[PDFTextPosition offset](end, "offset"), v11 > -[PDFTextPosition offset](self->_start, "offset")))
      {
        v12 = 0;
      }
    }
  }

  return v12;
}

- (id)start
{
  return self->_start;
}

- (id)end
{
  return self->_end;
}

+ (id)textRangeFromSelection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  PDFTextPosition *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PDFTextPosition *v12;
  id v13;

  v3 = a3;
  objc_msgSend(v3, "pages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PDFTextPosition initWithOffset:onPage:]([PDFTextPosition alloc], "initWithOffset:onPage:", objc_msgSend(v3, "rangeAtIndex:onPage:", 0, v5), v5);
  objc_msgSend(v3, "pages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v3, "rangeAtIndex:onPage:", objc_msgSend(v3, "numberOfTextRangesOnPage:", v8) - 1, v8);
  v11 = v10;

  v12 = -[PDFTextPosition initWithOffset:onPage:]([PDFTextPosition alloc], "initWithOffset:onPage:", v9 + v11, v8);
  v13 = -[PDFTextRange initFromPos:toPos:]([PDFTextRange alloc], "initFromPos:toPos:", v6, v12);

  return v13;
}

- (id)initFromPos:(id)a3 toPos:(id)a4
{
  id v6;
  id v7;
  PDFTextRange *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PDFTextRange;
  v8 = -[PDFTextRange init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "page");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexForPage:", v9);

    objc_msgSend(v7, "page");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "document");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "indexForPage:", v12);

    if (v14 < v11 || v14 == v11 && (v15 = objc_msgSend(v7, "offset"), v15 < objc_msgSend(v6, "offset")))
    {
      v16 = v6;
    }
    else
    {
      v16 = v7;
      v7 = v6;
    }
    v6 = v7;
    objc_storeStrong((id *)&v8->_start, v7);
    objc_storeStrong((id *)&v8->_end, v16);

    v7 = v16;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PDFTextPosition description](self->_start, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFTextPosition description](self->_end, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Start: \"%@\", End: \"%@\"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
