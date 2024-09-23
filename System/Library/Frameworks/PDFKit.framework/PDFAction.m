@implementation PDFAction

- (PDFAction)init
{
  PDFAction *v2;
  PDFAction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDFAction;
  v2 = -[PDFAction init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PDFAction commonInit](v2, "commonInit");
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PDFActionPrivate *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = objc_alloc_init(PDFActionPrivate);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSString copyWithZone:](self->_private->type, "copyWithZone:", a3);
    v9 = v5[1];
    v10 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = v8;

    v11 = -[NSArray copyWithZone:](self->_private->nextActions, "copyWithZone:", a3);
    v12 = v5[1];
    v13 = *(void **)(v12 + 16);
    *(_QWORD *)(v12 + 16) = v11;

  }
  return v5;
}

- (NSString)type
{
  return self->_private->type;
}

- (void)commonInit
{
  PDFActionPrivate *v3;
  PDFActionPrivate *v4;
  PDFActionPrivate *v5;
  NSString *type;
  PDFActionPrivate *v7;
  NSArray *nextActions;

  v3 = objc_alloc_init(PDFActionPrivate);
  v4 = self->_private;
  self->_private = v3;

  v5 = self->_private;
  type = v5->type;
  v5->type = 0;

  v7 = self->_private;
  nextActions = v7->nextActions;
  v7->nextActions = 0;

}

+ (PDFAction)actionWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = (objc_class *)objc_msgSend(a1, "_classForActionDictionary:", a3);
  if (!v10)
    v10 = (objc_class *)PDFAction;
  v11 = (void *)objc_msgSend([v10 alloc], "initWithActionDictionary:forDocument:forPage:", a3, v9, v8);

  return (PDFAction *)v11;
}

+ (Class)_classForActionDictionary:(CGPDFDictionary *)a3
{
  _BOOL4 Name;
  void *v4;
  char *v5;
  char *value;

  value = 0;
  Name = CGPDFDictionaryGetName(a3, "S", (const char **)&value);
  v4 = 0;
  v5 = value;
  if (Name && value != 0)
  {
    if (strcmp(value, "GoTo")
      && strcmp(v5, "Named")
      && strcmp(v5, "URI")
      && strcmp(v5, "Launch")
      && strcmp(v5, "GoToR")
      && strcmp(v5, "ResetForm"))
    {
      return (Class)0;
    }
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v4;
}

- (PDFAction)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8;
  id v9;
  PDFAction *v10;
  PDFAction *v11;
  id v12;
  uint64_t v13;
  PDFActionPrivate *v14;
  NSString *type;
  PDFAction *v16;
  objc_super v18;
  CGPDFDictionaryRef v19;
  CGPDFArrayRef v20;
  char *value;

  v8 = a4;
  v9 = a5;
  v20 = 0;
  value = 0;
  v18.receiver = self;
  v18.super_class = (Class)PDFAction;
  v19 = 0;
  v10 = -[PDFAction init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    -[PDFAction commonInit](v10, "commonInit");
    if (CGPDFDictionaryGetName(a3, "S", (const char **)&value))
    {
      v12 = objc_alloc(MEMORY[0x24BDD17C8]);
      v13 = objc_msgSend(v12, "initWithUTF8String:", value);
      v14 = v11->_private;
      type = v14->type;
      v14->type = (NSString *)v13;

    }
    if (CGPDFDictionaryGetDictionary(a3, "Next", &v19))
    {
      -[PDFAction _setNextAction:forDocument:forPage:](v11, "_setNextAction:forDocument:forPage:", v19, v8, v9);
    }
    else if (CGPDFDictionaryGetArray(a3, "Next", &v20))
    {
      -[PDFAction _setNextActions:forDocument:forPage:](v11, "_setNextActions:forDocument:forPage:", v20, v8, v9);
    }
    v16 = v11;
  }

  return v11;
}

- (__CFDictionary)createDictionaryRef
{
  return 0;
}

- (id)toolTip
{
  return 0;
}

- (id)description
{
  return 0;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_private->type, a3);
}

- (id)nextActions
{
  return self->_private->nextActions;
}

- (void)_setNextActions:(id)a3
{
  objc_storeStrong((id *)&self->_private->nextActions, a3);
}

- (void)_setNextAction:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  PDFActionPrivate *v16;
  NSArray *nextActions;
  id v18;

  v18 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "threadDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v11, "setObject:forKey:", v9, v9);
    v13 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_classForActionDictionary:", a3);
    if (!v13)
      v13 = (objc_class *)PDFAction;
    v14 = (void *)objc_msgSend([v13 alloc], "initWithActionDictionary:forDocument:forPage:", a3, v18, v8);
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = self->_private;
      nextActions = v16->nextActions;
      v16->nextActions = (NSArray *)v15;

    }
  }
  objc_msgSend(v11, "removeObjectForKey:", v9);

}

- (void)_setNextActions:(CGPDFArray *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8;
  id v9;
  size_t Count;
  size_t v11;
  NSArray *v12;
  void *v13;
  size_t i;
  objc_class *v15;
  id v16;
  uint64_t v17;
  PDFActionPrivate *v18;
  NSArray *nextActions;
  NSArray *v20;
  CGPDFDictionaryRef value;

  v8 = a4;
  v9 = a5;
  value = 0;
  Count = CGPDFArrayGetCount(a3);
  if (Count)
  {
    v11 = Count;
    v12 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", Count);
    v13 = 0;
    for (i = 0; i != v11; ++i)
    {
      if (CGPDFArrayGetDictionary(a3, i, &value))
      {
        v15 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_classForActionDictionary:", value);
        if (!v15)
          v15 = (objc_class *)PDFAction;
        v16 = [v15 alloc];
        v17 = objc_msgSend(v16, "initWithActionDictionary:forDocument:forPage:", value, v8, v9);

        if (v17)
        {
          -[NSArray addObject:](v12, "addObject:", v17);
          v13 = (void *)v17;
        }
        else
        {
          v13 = 0;
        }
      }
    }
    v18 = self->_private;
    nextActions = v18->nextActions;
    v18->nextActions = v12;
    v20 = v12;

  }
}

- (id)baseURLForDocument:(id)a3
{
  id v3;
  CGPDFDocument *v4;
  CGPDFDictionary *Catalog;
  const unsigned __int8 *BytePtr;
  const unsigned __int8 *v7;
  void *v8;
  void *v9;
  CGPDFStringRef string;
  CGPDFDictionaryRef value;

  v3 = a3;
  value = 0;
  v4 = (CGPDFDocument *)objc_msgSend(v3, "documentRef");
  if (!v4)
    goto LABEL_7;
  Catalog = CGPDFDocumentGetCatalog(v4);
  if (!CGPDFDictionaryGetDictionary(Catalog, "URI", &value)
    || (string = 0, !CGPDFDictionaryGetString(value, "Base", &string))
    || (BytePtr = CGPDFStringGetBytePtr(string)) == 0
    || (v7 = BytePtr, !CGPDFStringGetLength(string))
    || (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 30),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v8),
        v8,
        !v9))
  {
LABEL_7:
    objc_msgSend(v3, "documentURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
