@implementation PDFForm

- (PDFForm)init
{
  PDFForm *v2;
  PDFFormPrivateVars *v3;
  PDFFormPrivateVars *v4;
  uint64_t v5;
  PDFFormPrivateVars *v6;
  NSMutableArray *fieldArray;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PDFForm;
  v2 = -[PDFForm init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PDFFormPrivateVars);
    v4 = v2->_private;
    v2->_private = v3;

    objc_storeWeak((id *)&v2->_private->document, 0);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
    v6 = v2->_private;
    fieldArray = v6->fieldArray;
    v6->fieldArray = (NSMutableArray *)v5;

    v2->_private->appearString = 0;
  }
  return v2;
}

- (PDFForm)initWithDocument:(id)a3
{
  id v4;
  PDFForm *v5;
  PDFFormPrivateVars *v6;
  PDFFormPrivateVars *v7;
  uint64_t v8;
  PDFFormPrivateVars *v9;
  NSMutableArray *fieldArray;
  CGPDFDocument *v11;
  CGPDFDictionary *Catalog;
  size_t Count;
  size_t v14;
  size_t i;
  PDFFormField *v16;
  PDFFormField *v17;
  PDFFormField *v18;
  PDFForm *v19;
  uint64_t v21;
  CGPDFObjectRef object;
  objc_super v23;
  CGPDFArrayRef array;
  CGPDFDictionaryRef value;

  v4 = a3;
  array = 0;
  value = 0;
  v23.receiver = self;
  v23.super_class = (Class)PDFForm;
  v5 = -[PDFForm init](&v23, sel_init);
  if (!v5)
    goto LABEL_18;
  v6 = objc_alloc_init(PDFFormPrivateVars);
  v7 = v5->_private;
  v5->_private = v6;

  objc_storeWeak((id *)&v5->_private->document, v4);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
  v9 = v5->_private;
  fieldArray = v9->fieldArray;
  v9->fieldArray = (NSMutableArray *)v8;

  v5->_private->appearString = 0;
  v11 = (CGPDFDocument *)objc_msgSend(v4, "documentRef");
  if (!v11)
    goto LABEL_18;
  Catalog = CGPDFDocumentGetCatalog(v11);
  if (Catalog
    && CGPDFDictionaryGetDictionary(Catalog, "AcroForm", &value)
    && CGPDFDictionaryGetArray(value, "Fields", &array)
    && CGPDFArrayGetCount(array))
  {
    Count = CGPDFArrayGetCount(array);
    if (Count)
    {
      v14 = Count;
      for (i = 0; i != v14; ++i)
      {
        object = 0;
        if (CGPDFArrayGetObject(array, i, &object))
        {
          v21 = 0;
          if (CGPDFObjectGetValue(object, kCGPDFObjectTypeDictionary, &v21))
          {
            v16 = [PDFFormField alloc];
            v17 = -[PDFFormField initWithFormDictionary:](v16, "initWithFormDictionary:", v21);
            v18 = v17;
            if (v17)
            {
              -[PDFFormField setDocument:](v17, "setDocument:", v4);
              -[NSMutableArray addObject:](v5->_private->fieldArray, "addObject:", v18);
            }

          }
        }
      }
    }
    if (CGPDFDictionaryGetString(value, "DA", &v5->_private->appearString))
      CGPDFStringRetain();
    v19 = v5;
  }
  else
  {
LABEL_18:
    v19 = 0;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PDFFormPrivateVars *v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = objc_alloc_init(PDFFormPrivateVars);
  v7 = (void *)v5[1];
  v5[1] = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  objc_storeWeak((id *)(v5[1] + 8), WeakRetained);

  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
  v10 = v5[1];
  v11 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v9;

  *(_QWORD *)(v5[1] + 24) = CGPDFStringRetain();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_private->fieldArray;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(*(id *)(v5[1] + 16), "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CGPDFStringRelease();
  v3.receiver = self;
  v3.super_class = (Class)PDFForm;
  -[PDFForm dealloc](&v3, sel_dealloc);
}

- (id)document
{
  return objc_loadWeakRetained((id *)&self->_private->document);
}

- (id)fieldNames
{
  NSMutableArray *fieldArray;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;

  fieldArray = self->_private->fieldArray;
  if (fieldArray && -[NSMutableArray count](fieldArray, "count"))
  {
    v4 = -[NSMutableArray count](self->_private->fieldArray, "count");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4);
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->_private->fieldArray, "objectAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fieldName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          objc_msgSend(v5, "addObject:", v8);

      }
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setStringValue:(id)a3 forFieldNamed:(id)a4 postFormChangeNotification:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v15 = a3;
  -[PDFForm fieldNamed:](self, "fieldNamed:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setStringValue:", v15);
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFForm document](self, "document");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(v9, "fieldName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryWithObject:forKey:", v13, CFSTR("PDFFormFieldName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("PDFFormDidChangeValue"), v11, v14);

    }
  }

}

- (id)stringValueForFieldNamed:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PDFForm fieldNamed:](self, "fieldNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)defaultStringValueForFieldNamed:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PDFForm fieldNamed:](self, "fieldNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "defaultStringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CGPDFString)defaultDAStringRef
{
  return self->_private->appearString;
}

- (void)addFormField:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "fieldName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFForm fieldNamed:](self, "fieldNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PDFForm document](self, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDocument:", v6);

    -[NSMutableArray addObject:](self->_private->fieldArray, "addObject:", v7);
  }

}

- (void)removeFormFieldWithFieldName:(id)a3
{
  void *v4;
  void *v5;

  -[PDFForm fieldNamed:](self, "fieldNamed:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[NSMutableArray removeObject:](self->_private->fieldArray, "removeObject:", v4);
    v4 = v5;
  }

}

- (void)resetFormForFields:(id)a3
{
  -[PDFForm _commonResetForm:inclusive:](self, "_commonResetForm:inclusive:", a3, 1);
}

- (void)resetFormExcludingFields:(id)a3
{
  -[PDFForm _commonResetForm:inclusive:](self, "_commonResetForm:inclusive:", a3, 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("fields: ["));
  v4 = -[NSMutableArray count](self->_private->fieldArray, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->_private->fieldArray, "objectAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v8);

    }
  }
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (void)_commonResetForm:(id)a3 inclusive:(BOOL)a4
{
  int v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a4;
  v6 = a3;
  v21 = v6;
  if (v6)
    v7 = objc_msgSend(v6, "count");
  else
    v7 = 0;
  v8 = -[NSMutableArray count](self->_private->fieldArray, "count");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->_private->fieldArray, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fieldName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v13 = 0;
        while (1)
        {
          objc_msgSend(v21, "objectAtIndex:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v12);

          if (v15)
            break;
          if (v7 == ++v13)
            goto LABEL_10;
        }
        v16 = 1;
      }
      else
      {
LABEL_10:
        v16 = 0;
      }
      if (v16 == v4)
      {
        objc_msgSend(v11, "defaultStringValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setStringValue:", v17);

        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFForm document](self, "document");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v12, CFSTR("PDFFormFieldName"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("PDFFormDidChangeValue"), v19, v20);

      }
    }
  }

}

- (id)fieldNamed:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (!v4)
  {
    NSLog(CFSTR("Temp - [fieldNamed:] passed in nil"));
    goto LABEL_8;
  }
  v5 = -[NSMutableArray count](self->_private->fieldArray, "count");
  if (!v5)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v6 = v5;
  v7 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndex:](self->_private->fieldArray, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fieldName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v4);

    if ((v10 & 1) != 0)
      break;

    if (v6 == ++v7)
      goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (void)addNeedsAppearanceToDictionaryRef:(__CFDictionary *)a3
{
  CFDictionarySetValue(a3, CFSTR("/NeedAppearances"), (const void *)*MEMORY[0x24BDBD270]);
}

- (__CFDictionary)createDictionaryRef
{
  uint64_t v3;
  uint64_t v4;
  const __CFAllocator *v5;
  CFMutableArrayRef Mutable;
  __CFArray *v7;
  uint64_t i;
  void *v9;
  void *v10;
  const void *v11;
  __CFDictionary *v12;

  v3 = -[NSMutableArray count](self->_private->fieldArray, "count");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (!Mutable)
    return 0;
  v7 = Mutable;
  for (i = 0; i != v4; ++i)
  {
    -[NSMutableArray objectAtIndex:](self->_private->fieldArray, "objectAtIndex:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clearDictionaryRef");

    -[NSMutableArray objectAtIndex:](self->_private->fieldArray, "objectAtIndex:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (const void *)objc_msgSend(v10, "dictionaryRef");

    if (v11)
      CFArrayAppendValue(v7, v11);
  }
  v12 = CFDictionaryCreateMutable(v5, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(v12, CFSTR("/Fields"), v7);
  -[PDFForm addNeedsAppearanceToDictionaryRef:](self, "addNeedsAppearanceToDictionaryRef:", v12);
  CFRelease(v7);
  return v12;
}

- (void)setDocument:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_storeWeak((id *)&self->_private->document, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_private->fieldArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setDocument:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
