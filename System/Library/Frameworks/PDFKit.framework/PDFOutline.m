@implementation PDFOutline

- (PDFOutline)init
{
  PDFOutline *v2;
  PDFOutline *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDFOutline;
  v2 = -[PDFOutline init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PDFOutline commonInit](v2, "commonInit");
  return v3;
}

- (PDFDocument)document
{
  return (PDFDocument *)objc_loadWeakRetained((id *)&self->_private->document);
}

- (PDFOutline)parent
{
  return (PDFOutline *)objc_loadWeakRetained((id *)&self->_private->parent);
}

- (NSUInteger)numberOfChildren
{
  PDFOutlinePrivate *v2;
  NSUInteger result;

  v2 = self->_private;
  if (!v2->childrenLoaded)
  {
    -[PDFOutline _lazilyLoadChildren](self, "_lazilyLoadChildren");
    v2 = self->_private;
  }
  result = (NSUInteger)v2->children;
  if (result)
    return (int)objc_msgSend((id)result, "count");
  return result;
}

- (NSUInteger)index
{
  void *v3;
  void *v4;
  void *v5;
  NSUInteger v6;

  -[PDFOutline parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PDFOutline parent](self, "parent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_childArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", self);

  return v6;
}

- (PDFOutline)childAtIndex:(NSUInteger)index
{
  PDFOutlinePrivate *v5;
  void *children;

  v5 = self->_private;
  if (!v5->childrenLoaded)
  {
    -[PDFOutline _lazilyLoadChildren](self, "_lazilyLoadChildren");
    v5 = self->_private;
  }
  children = v5->children;
  if (children)
  {
    if (objc_msgSend(children, "count") <= index)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("childAtIndex: %ld out of bounds"), index);
      children = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndex:](self->_private->children, "objectAtIndex:", index);
      children = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (PDFOutline *)children;
}

- (void)insertChild:(PDFOutline *)child atIndex:(NSUInteger)index
{
  PDFOutline *v6;
  PDFOutlinePrivate *v7;
  NSMutableArray *children;
  uint64_t v9;
  PDFOutlinePrivate *v10;
  NSMutableArray *v11;
  PDFOutline *v12;

  v6 = child;
  if (v6)
  {
    v12 = v6;
    v7 = self->_private;
    if (!v7->childrenLoaded)
    {
      -[PDFOutline _lazilyLoadChildren](self, "_lazilyLoadChildren");
      v7 = self->_private;
    }
    children = v7->children;
    if (!children)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
      v10 = self->_private;
      v11 = v10->children;
      v10->children = (NSMutableArray *)v9;

      children = self->_private->children;
    }
    -[NSMutableArray insertObject:atIndex:](children, "insertObject:atIndex:", v12, index);
    -[PDFOutline _setParent:](v12, "_setParent:", self);
    v6 = v12;
  }

}

- (void)removeFromParent
{
  void *v3;
  NSUInteger v4;
  NSUInteger v5;
  void *v6;

  -[PDFOutline parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[PDFOutline index](self, "index");
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("removeFromParent: object no longer child of parent"));
    }
    else
    {
      v5 = v4;
      -[PDFOutline parent](self, "parent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_removeChildAtIndex:", v5);

      objc_storeWeak((id *)&self->_private->parent, 0);
    }
  }
}

- (NSString)label
{
  PDFOutlinePrivate *v3;
  NSString *title;

  v3 = self->_private;
  title = v3->title;
  if (!title)
  {
    v3->title = (NSString *)&stru_24C25F170;

    title = self->_private->title;
  }
  return title;
}

- (void)setLabel:(NSString *)label
{
  uint64_t v4;
  PDFOutlinePrivate *v5;
  NSString *title;

  v4 = -[NSString copy](label, "copy");
  v5 = self->_private;
  title = v5->title;
  v5->title = (NSString *)v4;

}

- (BOOL)isOpen
{
  return self->_private->open;
}

- (void)setIsOpen:(BOOL)isOpen
{
  self->_private->open = isOpen;
}

- (PDFDestination)destination
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[PDFOutline action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "type"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("GoTo")),
        v4,
        v5))
  {
    objc_msgSend(v3, "destination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (PDFDestination *)v6;
}

- (void)setDestination:(PDFDestination *)destination
{
  PDFDestination *v4;
  PDFActionGoTo *v5;

  v4 = destination;
  v5 = -[PDFActionGoTo initWithDestination:]([PDFActionGoTo alloc], "initWithDestination:", v4);

  -[PDFOutline setAction:](self, "setAction:", v5);
}

- (PDFAction)action
{
  PDFOutlinePrivate *v2;
  char isKindOfClass;
  PDFAction *action;
  id WeakRetained;
  PDFDestination *v7;
  PDFActionGoTo *v8;
  PDFOutlinePrivate *v9;
  PDFAction *v10;
  CGPDFDictionaryRef value;

  v2 = self->_private;
  if (v2->action)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v2 = self->_private;
    if ((isKindOfClass & 1) != 0)
    {
      action = v2->action;
      v2->action = 0;

      WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
      v7 = -[PDFDestination initWithDictionary:forDocument:]([PDFDestination alloc], "initWithDictionary:forDocument:", self->_private->srcDictionary, WeakRetained);
      if (v7)
      {
        v8 = -[PDFActionGoTo initWithDestination:]([PDFActionGoTo alloc], "initWithDestination:", v7);
      }
      else
      {
        value = 0;
        if (!CGPDFDictionaryGetDictionary(self->_private->srcDictionary, "A", &value))
        {
LABEL_8:

          v2 = self->_private;
          return v2->action;
        }
        +[PDFAction actionWithActionDictionary:forDocument:forPage:](PDFAction, "actionWithActionDictionary:forDocument:forPage:", value, WeakRetained, 0);
        v8 = (PDFActionGoTo *)objc_claimAutoreleasedReturnValue();
      }
      v9 = self->_private;
      v10 = v9->action;
      v9->action = &v8->super;

      goto LABEL_8;
    }
  }
  return v2->action;
}

- (void)setAction:(PDFAction *)action
{
  PDFAction *v5;
  PDFOutlinePrivate *v6;
  id *p_action;
  PDFAction *v8;
  PDFAction *v9;

  v5 = action;
  v6 = self->_private;
  v8 = v6->action;
  p_action = (id *)&v6->action;
  if (v8 != v5)
  {
    v9 = v5;
    objc_storeStrong(p_action, action);
    v5 = v9;
  }

}

- (void)dealloc
{
  __CFDictionary *dictionary;
  objc_super v4;

  dictionary = self->_private->dictionary;
  if (dictionary)
    CFRelease(dictionary);
  v4.receiver = self;
  v4.super_class = (Class)PDFOutline;
  -[PDFOutline dealloc](&v4, sel_dealloc);
}

- (PDFOutline)initWithDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 parent:(id)a5
{
  id v8;
  id v9;
  PDFOutline *v10;
  PDFOutline *v11;
  CFStringRef v12;
  PDFOutlinePrivate *v13;
  NSString *title;
  uint64_t v15;
  PDFOutlinePrivate *v16;
  PDFAction *action;
  CGPDFInteger v19;
  CGPDFStringRef value;
  objc_super v21;

  v8 = a4;
  v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PDFOutline;
  v10 = -[PDFOutline init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    -[PDFOutline commonInit](v10, "commonInit");
    v19 = 0;
    value = 0;
    objc_storeWeak((id *)&v11->_private->document, v8);
    v11->_private->srcDictionary = a3;
    objc_storeWeak((id *)&v11->_private->parent, v9);
    if (CGPDFDictionaryGetString(a3, "Title", &value))
    {
      v12 = CGPDFStringCopyTextString(value);
      v13 = v11->_private;
      title = v13->title;
      v13->title = &v12->isa;

    }
    else
    {
      v11->_private->open = 1;
    }
    if (CGPDFDictionaryGetInteger(a3, "Count", &v19))
      v11->_private->open = v19 > 0;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v19);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v11->_private;
    action = v16->action;
    v16->action = (PDFAction *)v15;

    v11->_private->childrenLoaded = 0;
  }

  return v11;
}

- (void)_lazilyLoadChildren
{
  PDFOutlinePrivate *v2;
  uint64_t v4;
  PDFOutlinePrivate *v5;
  NSMutableArray *children;
  id WeakRetained;
  id v8;
  uint64_t v9;
  void *v10;
  CGPDFDictionaryRef value;

  v2 = self->_private;
  if (v2)
  {
    if (v2->srcDictionary)
    {
      value = 0;
      v2->childrenLoaded = 1;
      if (CGPDFDictionaryGetDictionary(self->_private->srcDictionary, "First", &value))
      {
        v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
        v5 = self->_private;
        children = v5->children;
        v5->children = (NSMutableArray *)v4;

        if (self->_private->children)
        {
          while (!-[PDFOutline _childDictionaryReferencesParent:](self, "_childDictionaryReferencesParent:", value))
          {
            WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
            v8 = objc_alloc((Class)objc_opt_class());
            v9 = objc_msgSend(v8, "initWithDictionary:forDocument:parent:", value, WeakRetained, self);
            if (!v9)
            {

              return;
            }
            v10 = (void *)v9;
            -[NSMutableArray addObject:](self->_private->children, "addObject:", v9);

            if (!CGPDFDictionaryGetDictionary(value, "Next", &value))
              return;
          }
        }
      }
    }
  }
}

- (void)commonInit
{
  PDFOutlinePrivate *v3;
  PDFOutlinePrivate *v4;
  PDFOutlinePrivate *v5;
  NSString *title;
  PDFOutlinePrivate *v7;
  PDFAction *action;
  PDFOutlinePrivate *v9;
  NSMutableArray *children;

  v3 = objc_alloc_init(PDFOutlinePrivate);
  v4 = self->_private;
  self->_private = v3;

  objc_storeWeak((id *)&self->_private->document, 0);
  v5 = self->_private;
  title = v5->title;
  v5->title = 0;

  v7 = self->_private;
  action = v7->action;
  v7->action = 0;

  objc_storeWeak((id *)&self->_private->parent, 0);
  v9 = self->_private;
  children = v9->children;
  v9->children = 0;

  self->_private->childrenLoaded = 0;
  self->_private->dictionary = 0;
  self->_private->open = 0;
  self->_private->srcDictionary = 0;
}

- (CGPDFDictionary)_srcDictionaryRef
{
  return self->_private->srcDictionary;
}

- (__CFDictionary)createDictionaryRef
{
  __CFDictionary *dictionary;
  CFAllocatorRef *v3;
  void *v4;
  __CFDictionary *Copy;
  const __CFAllocator *v7;
  void *v8;
  void *v9;
  const void *v10;
  const void *v11;
  void *v12;
  const void *v13;
  const void *v14;
  void *v15;
  const void *v16;
  const void *v17;
  void *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  int v23;
  id WeakRetained;
  CFNumberRef v25;
  CFNumberRef v26;
  __CFDictionary *v27;
  void *v28;
  int valuePtr;

  valuePtr = 0;
  dictionary = self->_private->dictionary;
  v3 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (!dictionary)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    self->_private->dictionary = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (self->_private->dictionary)
    {
      -[PDFOutline _firstChild](self, "_firstChild");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = (const void *)objc_msgSend(v8, "createDictionaryRef");
        if (v10)
        {
          v11 = v10;
          CFDictionarySetValue(self->_private->dictionary, CFSTR("/First"), v10);
          CFRelease(v11);
        }
      }
      -[PDFOutline parent](self, "parent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (const void *)objc_msgSend(v12, "createDictionaryRef");
        if (v13)
        {
          v14 = v13;
          CFDictionarySetValue(self->_private->dictionary, CFSTR("/Parent"), v13);
          CFRelease(v14);
        }
      }
      -[PDFOutline _next](self, "_next");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = (const void *)objc_msgSend(v15, "createDictionaryRef");
        if (v16)
        {
          v17 = v16;
          CFDictionarySetValue(self->_private->dictionary, CFSTR("/Next"), v16);
          CFRelease(v17);
        }
      }
      -[PDFOutline _previous](self, "_previous");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = (const void *)objc_msgSend(v18, "createDictionaryRef");
        if (v19)
        {
          v20 = v19;
          CFDictionarySetValue(self->_private->dictionary, CFSTR("/Prev"), v19);
          CFRelease(v20);
        }
      }
      -[PDFOutline _lastChild](self, "_lastChild");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v21 = (const void *)objc_msgSend(v4, "createDictionaryRef");
        if (v21)
        {
          v22 = v21;
          CFDictionarySetValue(self->_private->dictionary, CFSTR("/Last"), v21);
          CFRelease(v22);
        }
      }
      v23 = -[PDFOutline _openDescendantCount](self, "_openDescendantCount");
      valuePtr = v23;
      WeakRetained = objc_loadWeakRetained((id *)&self->_private->parent);
      if (WeakRetained || v23 >= 1)
      {
        v25 = CFNumberCreate(v7, kCFNumberSInt32Type, &valuePtr);
        if (v25)
        {
          v26 = v25;
          CFDictionarySetValue(self->_private->dictionary, CFSTR("/Count"), v25);
          CFRelease(v26);
        }
        if (WeakRetained)
        {
          v27 = self->_private->dictionary;
          -[PDFOutline label](self, "label");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          CFDictionarySetValue(v27, CFSTR("/Title"), v28);

        }
      }
      if (!-[PDFOutline _addDestinationToDictionaryRef:](self, "_addDestinationToDictionaryRef:", self->_private->dictionary))-[PDFOutline _addActionToDictionaryRef:](self, "_addActionToDictionaryRef:", self->_private->dictionary);

      dictionary = self->_private->dictionary;
      if (dictionary)
        goto LABEL_3;
    }
    else
    {
      v4 = 0;
    }
    Copy = 0;
    goto LABEL_32;
  }
  v4 = 0;
LABEL_3:
  Copy = CFDictionaryCreateCopy(*v3, dictionary);
LABEL_32:

  return Copy;
}

- (void)invalidateDictionaryRef
{
  __CFDictionary *dictionary;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t i;
  void *v7;

  dictionary = self->_private->dictionary;
  if (dictionary)
  {
    CFRelease(dictionary);
    self->_private->dictionary = 0;
  }
  v4 = -[PDFOutline numberOfChildren](self, "numberOfChildren");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      -[PDFOutline childAtIndex:](self, "childAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "invalidateDictionaryRef");

    }
  }
}

- (void)setDocument:(id)a3
{
  objc_storeWeak((id *)&self->_private->document, a3);
}

- (void)_setParent:(id)a3
{
  objc_storeWeak((id *)&self->_private->parent, a3);
}

- (id)_childArray
{
  PDFOutlinePrivate *v2;

  v2 = self->_private;
  if (!v2->childrenLoaded)
  {
    -[PDFOutline _lazilyLoadChildren](self, "_lazilyLoadChildren");
    v2 = self->_private;
  }
  return v2->children;
}

- (void)_removeChildAtIndex:(unint64_t)a3
{
  PDFOutlinePrivate *v4;
  NSMutableArray *children;

  v4 = self->_private;
  if (!v4->childrenLoaded)
  {
    -[PDFOutline _lazilyLoadChildren](self, "_lazilyLoadChildren");
    v4 = self->_private;
  }
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    children = v4->children;
    if (children)
      -[NSMutableArray removeObjectAtIndex:](children, "removeObjectAtIndex:", a3);
  }
}

- (BOOL)_addDestinationToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;
  const void *v6;
  const void *v7;
  BOOL v8;

  -[PDFOutline destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (v6 = (const void *)objc_msgSend(v4, "createArrayRef")) != 0)
  {
    v7 = v6;
    CFDictionarySetValue(a3, CFSTR("/Dest"), v6);
    CFRelease(v7);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_addActionToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  const void *v5;
  id v6;

  -[PDFOutline action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    v5 = (const void *)objc_msgSend(v4, "createDictionaryRef");
    v4 = v6;
    if (v5)
    {
      CFDictionarySetValue(a3, CFSTR("/A"), v5);
      CFRelease(v5);
      v4 = v6;
    }
  }

}

- (int)_openDescendantCount
{
  int v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  int v8;

  v3 = -[PDFOutline numberOfChildren](self, "numberOfChildren");
  if (!v3)
    return 0;
  if (!-[PDFOutline isOpen](self, "isOpen"))
    return -v3;
  if (v3 < 1)
    return v3;
  v4 = 0;
  v5 = v3;
  do
  {
    -[PDFOutline childAtIndex:](self, "childAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_openDescendantCount");

    if (v7 <= 0)
      v8 = 0;
    else
      v8 = v3;
    v5 += v8;
    ++v4;
  }
  while (v3 != v4);
  return v5;
}

- (BOOL)_childDictionaryReferencesParent:(CGPDFDictionary *)a3
{
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  void *v8;
  CGPDFDictionary *v9;
  PDFOutline *v10;
  CGPDFDictionary *v11;
  BOOL v12;
  uint64_t v13;

  v5 = -[PDFOutline numberOfChildren](self, "numberOfChildren");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      -[PDFOutline childAtIndex:](self, "childAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (CGPDFDictionary *)objc_msgSend(v8, "_srcDictionaryRef");

      if (v9 == a3)
        return 1;
      if (v6 == ++v7)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v10 = self;
    do
    {
      v11 = -[PDFOutline _srcDictionaryRef](v10, "_srcDictionaryRef");
      v12 = v11 == a3;
      if (v11 == a3)
        break;
      -[PDFOutline parent](v10, "parent");
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (PDFOutline *)v13;
    }
    while (v13);

  }
  return v12;
}

- (id)_next
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[PDFOutline parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[PDFOutline index](self, "index");
    -[PDFOutline parent](self, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfChildren");

    v7 = 0;
    if (v6 && v4 < v6 - 1)
    {
      -[PDFOutline parent](self, "parent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "childAtIndex:", v4 + 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_previous
{
  void *v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[PDFOutline parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[PDFOutline index](self, "index");
    -[PDFOutline parent](self, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfChildren");

    v7 = 0;
    if (v6 && v4)
    {
      -[PDFOutline parent](self, "parent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "childAtIndex:", v4 - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_firstChild
{
  void *v3;

  v3 = -[PDFOutline numberOfChildren](self, "numberOfChildren");
  if (v3)
  {
    -[PDFOutline childAtIndex:](self, "childAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_lastChild
{
  char *v3;

  v3 = -[PDFOutline numberOfChildren](self, "numberOfChildren");
  if (v3)
  {
    -[PDFOutline childAtIndex:](self, "childAtIndex:", v3 - 1);
    v3 = (char *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
