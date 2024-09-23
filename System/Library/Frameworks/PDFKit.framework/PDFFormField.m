@implementation PDFFormField

- (PDFFormField)initWithAnnotation:(id)a3
{
  id v4;
  PDFFormField *v5;
  PDFFormField *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  PDFFormFieldPrivateVars *v15;
  NSString *fieldName;
  void *v17;
  uint64_t v18;
  PDFFormFieldPrivateVars *v19;
  NSString *stringValue;
  void *v21;
  uint64_t v22;
  PDFFormFieldPrivateVars *v23;
  NSString *v24;
  void *v25;
  uint64_t v26;
  PDFFormFieldPrivateVars *v27;
  NSString *defaultStringValue;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PDFFormField;
  v5 = -[PDFFormField init](&v30, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PDFFormField commonInit](v5, "commonInit");
    objc_msgSend(v4, "page");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "document");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        -[PDFFormField setDocument:](v6, "setDocument:", v9);

    }
    objc_msgSend(v4, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("/Widget")))
    {
      v11 = v6;
      v6 = 0;
LABEL_26:

      v6 = v6;
      goto LABEL_27;
    }
    objc_msgSend(v4, "valueForAnnotationKey:", CFSTR("/FT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("/Btn")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("/Tx")) & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("/Ch")))
      {
LABEL_15:
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("/Btn")))
          v6->_private->buttonType = objc_msgSend(v4, "widgetControlType");
        objc_msgSend(v4, "fieldName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "copy");
        v15 = v6->_private;
        fieldName = v15->fieldName;
        v15->fieldName = (NSString *)v14;

        if (objc_msgSend(v11, "isEqualToString:", CFSTR("/Btn"))
          && objc_msgSend(v4, "buttonWidgetState") == 1)
        {
          objc_msgSend(v4, "widgetOnStateString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "copy");
          v19 = v6->_private;
          stringValue = v19->stringValue;
          v19->stringValue = (NSString *)v18;

        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("/Tx")) & 1) != 0
               || objc_msgSend(v11, "isEqualToString:", CFSTR("/Ch")))
        {
          objc_msgSend(v4, "widgetStringValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "copy");
          v23 = v6->_private;
          v24 = v23->stringValue;
          v23->stringValue = (NSString *)v22;

        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("/Tx")) & 1) != 0
          || objc_msgSend(v11, "isEqualToString:", CFSTR("/Ch")))
        {
          objc_msgSend(v4, "widgetDefaultStringValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "copy");
          v27 = v6->_private;
          defaultStringValue = v27->defaultStringValue;
          v27->defaultStringValue = (NSString *)v26;

        }
        goto LABEL_26;
      }
      v12 = 2;
    }
    v6->_private->fieldType = v12;
    goto LABEL_15;
  }
LABEL_27:

  return v6;
}

- (PDFFormField)initWithFormDictionary:(CGPDFDictionary *)a3
{
  PDFFormField *v4;
  PDFFormField *v5;
  int v6;
  PDFFormFieldPrivateVars *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id v11;
  void *v12;
  void *v13;
  PDFFormFieldPrivateVars *v14;
  uint64_t v15;
  PDFFormFieldPrivateVars *v16;
  int v17;
  CFStringRef v18;
  PDFFormFieldPrivateVars *v19;
  NSString *fieldName;
  CFStringRef v21;
  id v22;
  PDFFormFieldPrivateVars *v23;
  NSString *stringValue;
  CFStringRef v25;
  PDFFormFieldPrivateVars *v26;
  NSString *defaultStringValue;
  char v28;
  PDFFormFieldPrivateVars *v29;
  NSString *v30;
  uint64_t v31;
  PDFFormFieldPrivateVars *v32;
  PDFFormField *v33;
  objc_super v35;
  char *v36;
  CGPDFInteger value;
  CGPDFStringRef string;
  __int128 v39;
  __int128 v40;

  v39 = 0u;
  v40 = 0u;
  value = 0;
  string = 0;
  v35.receiver = self;
  v35.super_class = (Class)PDFFormField;
  v36 = 0;
  v4 = -[PDFFormField init](&v35, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PDFFormField commonInit](v4, "commonInit");
    if (CGPDFDictionaryGetInteger(a3, "Ff", &value))
      v6 = value;
    else
      v6 = 0;
    if (CGPDFDictionaryGetRect())
    {
      v7 = v5->_private;
      v7->bounds.origin.x = PDFRectFromCGRect(*(double *)&v39, *((double *)&v39 + 1), *(double *)&v40, *((double *)&v40 + 1));
      v7->bounds.origin.y = v8;
      v7->bounds.size.width = v9;
      v7->bounds.size.height = v10;
    }
    if (!CGPDFDictionaryGetName(a3, "FT", (const char **)&v36))
    {
LABEL_23:
      if (!CGPDFDictionaryGetString(a3, "T", &string))
      {
        NSLog(CFSTR("PDFFormField has no 'T' key."));
        goto LABEL_37;
      }
      v18 = CGPDFStringCopyTextString(string);
      v19 = v5->_private;
      fieldName = v19->fieldName;
      v19->fieldName = &v18->isa;

      if (!CGPDFDictionaryGetName(a3, "V", (const char **)&v36))
      {
        if (CGPDFDictionaryGetString(a3, "V", &string))
        {
          v21 = CGPDFStringCopyTextString(string);
LABEL_30:
          v23 = v5->_private;
          stringValue = v23->stringValue;
          v23->stringValue = &v21->isa;

          goto LABEL_31;
        }
        if (!CGPDFDictionaryGetName(a3, "AS", (const char **)&v36))
        {
LABEL_31:
          if (CGPDFDictionaryGetString(a3, "DV", &string))
          {
            v25 = CGPDFStringCopyTextString(string);
            v26 = v5->_private;
            defaultStringValue = v26->defaultStringValue;
            v26->defaultStringValue = &v25->isa;
            v28 = 1;
          }
          else
          {
            v29 = v5->_private;
            v30 = v29->stringValue;
            if (!v30 || !v29->fieldType)
              goto LABEL_37;
            v31 = -[NSString copy](v30, "copy");
            v28 = 0;
            v32 = v5->_private;
            defaultStringValue = v32->defaultStringValue;
            v32->defaultStringValue = (NSString *)v31;
          }

          v5->_private->writeDefaultValue = v28;
LABEL_37:
          v33 = v5;
          goto LABEL_38;
        }
      }
      v22 = objc_alloc(MEMORY[0x24BDD17C8]);
      v21 = (CFStringRef)objc_msgSend(v22, "initWithCString:encoding:", v36, 1);
      goto LABEL_30;
    }
    v11 = objc_alloc(MEMORY[0x24BDD17C8]);
    v12 = (void *)objc_msgSend(v11, "initWithUTF8String:", v36);
    +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v13, "isEqualToString:", CFSTR("/Btn")))
    {
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("/Tx")))
      {
        v16 = v5->_private;
        v17 = 1;
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("/Ch")))
      {
        v16 = v5->_private;
        v17 = 2;
      }
      else
      {
        if (!objc_msgSend(v13, "isEqualToString:", CFSTR("/Sig")))
          goto LABEL_22;
        v16 = v5->_private;
        v17 = 3;
      }
      v16->fieldType = v17;
      goto LABEL_22;
    }
    v5->_private->fieldType = 0;
    if ((v6 & 0x8000) != 0)
    {
      v14 = v5->_private;
      v15 = 1;
    }
    else
    {
      v14 = v5->_private;
      if ((v6 & 0x10000) != 0)
      {
        v14->buttonType = 0;
        goto LABEL_22;
      }
      v15 = 2;
    }
    v14->buttonType = v15;
LABEL_22:

    goto LABEL_23;
  }
LABEL_38:

  return v5;
}

- (void)commonInit
{
  PDFFormFieldPrivateVars *v3;
  PDFFormFieldPrivateVars *v4;
  PDFFormFieldPrivateVars *v5;
  CGSize v6;
  PDFFormFieldPrivateVars *v7;
  NSString *fieldName;
  PDFFormFieldPrivateVars *v9;
  NSString *stringValue;
  PDFFormFieldPrivateVars *v11;
  NSString *defaultStringValue;

  v3 = objc_alloc_init(PDFFormFieldPrivateVars);
  v4 = self->_private;
  self->_private = v3;

  objc_storeWeak((id *)&self->_private->document, 0);
  v5 = self->_private;
  v6 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v5->bounds.origin = (CGPoint)*MEMORY[0x24BDBF090];
  v5->bounds.size = v6;
  self->_private->fieldType = -1;
  self->_private->buttonType = -1;
  v7 = self->_private;
  fieldName = v7->fieldName;
  v7->fieldName = 0;

  v9 = self->_private;
  stringValue = v9->stringValue;
  v9->stringValue = 0;

  v11 = self->_private;
  defaultStringValue = v11->defaultStringValue;
  v11->defaultStringValue = 0;

  self->_private->writeDefaultValue = 0;
  self->_private->dictionary = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "commonInit");
    -[PDFFormField document](self, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDocument:", v6);

    objc_msgSend(v5, "setFieldType:", -[PDFFormField fieldType](self, "fieldType"));
    objc_msgSend(v5, "setButtonType:", -[PDFFormField buttonType](self, "buttonType"));
    -[PDFFormField fieldName](self, "fieldName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFieldName:", v7);

    -[PDFFormField stringValue](self, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStringValue:", v8);

    -[PDFFormField defaultStringValue](self, "defaultStringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDefaultStringValue:", v9);

    objc_msgSend(v5, "setWriteDefaultValue:", -[PDFFormField writeDefaultValue](self, "writeDefaultValue"));
    v10 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PDFFormField clearDictionaryRef](self, "clearDictionaryRef");
  v3.receiver = self;
  v3.super_class = (Class)PDFFormField;
  -[PDFFormField dealloc](&v3, sel_dealloc);
}

- (void)clearDictionaryRef
{
  PDFFormFieldPrivateVars *v3;
  const __CFDictionary *dictionary;
  const __CFArray *Value;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  __CFDictionary *ValueAtIndex;

  v3 = self->_private;
  dictionary = v3->dictionary;
  if (dictionary)
  {
    Value = (const __CFArray *)CFDictionaryGetValue(dictionary, CFSTR("/Kids"));
    if (Value)
    {
      v6 = Value;
      Count = CFArrayGetCount(Value);
      if (Count >= 1)
      {
        v8 = Count;
        for (i = 0; i != v8; ++i)
        {
          ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(v6, i);
          if (ValueAtIndex)
            CFDictionaryRemoveValue(ValueAtIndex, CFSTR("/Parent"));
        }
      }
    }
    CFRelease(self->_private->dictionary);
    v3 = self->_private;
  }
  v3->dictionary = 0;
}

- (__CFDictionary)dictionaryRef
{
  __CFDictionary *result;

  if (-[PDFFormField _isRedacted](self, "_isRedacted"))
    return 0;
  result = self->_private->dictionary;
  if (!result)
  {
    self->_private->dictionary = -[PDFFormField createDictionaryRef](self, "createDictionaryRef");
    return self->_private->dictionary;
  }
  return result;
}

- (void)commonCreateDictionaryRef:(__CFDictionary *)a3
{
  PDFFormFieldPrivateVars *v5;
  unsigned int fieldType;
  PDFFormFieldPrivateVars *v7;
  unsigned int v8;

  v5 = self->_private;
  fieldType = v5->fieldType;
  if (fieldType)
  {
    if (fieldType <= 2)
      -[PDFFormField addStringValueToDictionaryRef:](self, "addStringValueToDictionaryRef:", a3);
  }
  else if (v5->buttonType)
  {
    -[PDFFormField addNameValueToDictionaryRef:](self, "addNameValueToDictionaryRef:", a3);
  }
  v7 = self->_private;
  if (v7->writeDefaultValue)
  {
    v8 = v7->fieldType;
    if (v8)
    {
      if (v8 <= 2)
        -[PDFFormField addStringDefaultValueToDictionaryRef:](self, "addStringDefaultValueToDictionaryRef:", a3);
    }
    else if (v7->buttonType)
    {
      -[PDFFormField addNameDefaultValueToDictionaryRef:](self, "addNameDefaultValueToDictionaryRef:", a3);
    }
  }
}

- (__CFDictionary)createDictionaryRef
{
  void *v2;
  const __CFAllocator *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  const void *v22;
  __CFArray *v23;
  const void *ValueAtIndex;
  CFIndex Count;
  CFIndex v27;
  CFIndex j;
  __CFDictionary *v29;
  __CFDictionary *v30;
  __CFDictionary *v31;
  __CFDictionary *v32;
  __CFDictionary *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  CFMutableDictionaryRef cf;
  void *v38;
  __CFArray *theArray;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  -[PDFFormField document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    cf = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    theArray = CFArrayCreateMutable(v3, 0, MEMORY[0x24BDBD690]);
    v34 = objc_msgSend(v2, "pageCount");
    if (v34)
    {
      v4 = 0;
      v36 = v2;
      do
      {
        v35 = v4;
        objc_msgSend(v2, "pageAtIndex:");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v38 = v5;
        objc_msgSend(v5, "annotations");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v43;
          while (2)
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v43 != v8)
                objc_enumerationMutation(obj);
              v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_msgSend(v10, "valueForAnnotationKey:", CFSTR("/Subtype"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "valueForAnnotationKey:", CFSTR("/FT"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v11, "isEqualToString:", CFSTR("/Widget")))
              {
                if (objc_msgSend(v12, "isEqualToString:", CFSTR("/Btn")))
                {
                  objc_msgSend(v10, "fieldName");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PDFFormField fieldName](self, "fieldName");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  v15 = objc_msgSend(v13, "isEqualToString:", v14);

                  if (v15)
                    goto LABEL_16;
                }
                if (objc_msgSend(v12, "isEqualToString:", CFSTR("/Ch")))
                {
                  objc_msgSend(v10, "fieldName");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PDFFormField fieldName](self, "fieldName");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v16, "isEqualToString:", v17);

                  if (v18)
                    goto LABEL_16;
                }
                if (objc_msgSend(v12, "isEqualToString:", CFSTR("/Tx")))
                {
                  objc_msgSend(v10, "fieldName");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PDFFormField fieldName](self, "fieldName");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v19, "isEqualToString:", v20);

                  if (v21)
                  {
LABEL_16:
                    v22 = (const void *)objc_msgSend(v10, "dictionaryRef");
                    if (!v22)
                    {

                      v2 = v36;
                      ValueAtIndex = cf;
                      v23 = theArray;
                      goto LABEL_25;
                    }
                    CFArrayAppendValue(theArray, v22);
                  }
                }
              }

            }
            v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
            if (v7)
              continue;
            break;
          }
        }

        v4 = v35 + 1;
        v2 = v36;
      }
      while (v35 + 1 != v34);
    }
    v23 = theArray;
    if (CFArrayGetCount(theArray))
    {
      ValueAtIndex = cf;
      if (CFArrayGetCount(theArray) == 1)
      {
        CFRelease(cf);
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
        -[PDFFormField commonCreateDictionaryRef:](self, "commonCreateDictionaryRef:", ValueAtIndex);
        CFRetain(ValueAtIndex);
      }
      else if (CFArrayGetCount(theArray) >= 2)
      {
        -[PDFFormField addFieldTypeToDictionaryRef:](self, "addFieldTypeToDictionaryRef:", cf);
        -[PDFFormField addFieldNameToDictionaryRef:](self, "addFieldNameToDictionaryRef:", cf);
        -[PDFFormField commonCreateDictionaryRef:](self, "commonCreateDictionaryRef:", cf);
        Count = CFArrayGetCount(theArray);
        if (Count >= 1)
        {
          v27 = Count;
          for (j = 0; j != v27; ++j)
          {
            v29 = (__CFDictionary *)CFArrayGetValueAtIndex(theArray, j);
            CFDictionaryRemoveValue(v29, CFSTR("/FT"));
            v30 = (__CFDictionary *)CFArrayGetValueAtIndex(theArray, j);
            CFDictionaryRemoveValue(v30, CFSTR("/T"));
            v31 = (__CFDictionary *)CFArrayGetValueAtIndex(theArray, j);
            CFDictionaryRemoveValue(v31, CFSTR("/V"));
            v32 = (__CFDictionary *)CFArrayGetValueAtIndex(theArray, j);
            CFDictionaryRemoveValue(v32, CFSTR("/DV"));
            v33 = (__CFDictionary *)CFArrayGetValueAtIndex(theArray, j);
            CFDictionarySetValue(v33, CFSTR("/Parent"), cf);
          }
        }
        CFDictionarySetValue(cf, CFSTR("/Kids"), theArray);
      }
    }
    else
    {
      CFRelease(cf);
      NSLog(CFSTR("PDFFormField with no corresponding Widget sharing the field name."));
      ValueAtIndex = 0;
    }
LABEL_25:
    if (v23)
      CFRelease(v23);
  }
  else
  {
    ValueAtIndex = 0;
  }

  return (__CFDictionary *)ValueAtIndex;
}

- (void)setDocument:(id)a3
{
  id v4;
  PDFFormFieldPrivateVars *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t i;
  void *v11;
  PDFFormFieldPrivateVars *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  PDFFormFieldPrivateVars *v22;
  NSString *stringValue;
  uint64_t v24;
  PDFFormFieldPrivateVars *v25;
  NSString *defaultStringValue;
  id v27;
  uint64_t v28;
  __CFString *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_storeWeak((id *)&self->_private->document, v4);
  v5 = self->_private;
  if (!v5->stringValue)
  {
    v27 = v4;
    objc_msgSend(v4, "annotationsForFieldName:", v5->fieldName);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v32;
      v9 = CFSTR("/Subtype");
      v29 = &stru_24C25F170;
      while (1)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v12 = self->_private;
          objc_msgSend(v11, "bounds");
          v37.origin.x = v13;
          v37.origin.y = v14;
          v37.size.width = v15;
          v37.size.height = v16;
          if (PDFRectEqualToRect(v12->bounds, v37))
          {
            objc_msgSend(v11, "valueForAnnotationKey:", v9);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "isEqualToString:", CFSTR("/Widget")))
            {
              v18 = v9;
              objc_msgSend(v11, "valueForAnnotationKey:", CFSTR("/FT"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "valueForAnnotationKey:", CFSTR("/V"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v19, "isEqualToString:", CFSTR("/Btn")))
              {
                objc_msgSend(v11, "widgetOnStateString");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20 && objc_msgSend(v20, "isEqualToString:", v21))
                {
                  v28 = objc_msgSend(v20, "copy");

                  v29 = (__CFString *)v28;
                }
LABEL_17:

              }
              else if (((objc_msgSend(v19, "isEqualToString:", CFSTR("/Tx")) & 1) != 0
                      || objc_msgSend(v19, "isEqualToString:", CFSTR("/Ch")))
                     && v20)
              {
                v21 = v29;
                v29 = (__CFString *)objc_msgSend(v20, "copy");
                goto LABEL_17;
              }

              v9 = v18;
            }

            continue;
          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (!v7)
          goto LABEL_24;
      }
    }
    v29 = &stru_24C25F170;
LABEL_24:
    objc_storeStrong((id *)&self->_private->stringValue, v29);
    v22 = self->_private;
    stringValue = v22->stringValue;
    if (stringValue && !v22->defaultStringValue && v22->fieldType)
    {
      v24 = -[NSString copy](stringValue, "copy");
      v25 = self->_private;
      defaultStringValue = v25->defaultStringValue;
      v25->defaultStringValue = (NSString *)v24;

      self->_private->writeDefaultValue = 0;
    }

    v4 = v27;
  }

}

- (id)document
{
  return objc_loadWeakRetained((id *)&self->_private->document);
}

- (void)setFieldType:(int)a3
{
  self->_private->fieldType = a3;
}

- (int)fieldType
{
  return self->_private->fieldType;
}

- (void)setButtonType:(int64_t)a3
{
  self->_private->buttonType = a3;
}

- (int64_t)buttonType
{
  return self->_private->buttonType;
}

- (void)setFieldName:(id)a3
{
  NSString *v5;
  PDFFormFieldPrivateVars *v6;
  id *p_fieldName;
  NSString *fieldName;
  NSString *v9;

  v5 = (NSString *)a3;
  v6 = self->_private;
  fieldName = v6->fieldName;
  p_fieldName = (id *)&v6->fieldName;
  if (fieldName != v5)
  {
    v9 = v5;
    objc_storeStrong(p_fieldName, a3);
    v5 = v9;
  }

}

- (id)fieldName
{
  return self->_private->fieldName;
}

- (void)setStringValue:(id)a3
{
  NSString *v5;
  PDFFormFieldPrivateVars *v6;
  id *p_stringValue;
  NSString *stringValue;
  NSString *v9;

  v5 = (NSString *)a3;
  v6 = self->_private;
  stringValue = v6->stringValue;
  p_stringValue = (id *)&v6->stringValue;
  if (stringValue != v5)
  {
    v9 = v5;
    objc_storeStrong(p_stringValue, a3);
    v5 = v9;
  }

}

- (id)stringValue
{
  return self->_private->stringValue;
}

- (void)setDefaultStringValue:(id)a3
{
  NSString *v5;
  PDFFormFieldPrivateVars *v6;
  id *p_defaultStringValue;
  NSString *defaultStringValue;
  NSString *v9;

  v5 = (NSString *)a3;
  v6 = self->_private;
  defaultStringValue = v6->defaultStringValue;
  p_defaultStringValue = (id *)&v6->defaultStringValue;
  if (defaultStringValue != v5)
  {
    v9 = v5;
    objc_storeStrong(p_defaultStringValue, a3);
    v5 = v9;
  }

}

- (id)defaultStringValue
{
  return self->_private->defaultStringValue;
}

- (void)setWriteDefaultValue:(BOOL)a3
{
  self->_private->writeDefaultValue = a3;
}

- (BOOL)writeDefaultValue
{
  return self->_private->writeDefaultValue;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PDFFormField fieldName](self, "fieldName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFFormField stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFFormField defaultStringValue](self, "defaultStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Field \"%@\" = \"%@\" (\"%@\")\n"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addFieldTypeToDictionaryRef:(__CFDictionary *)a3
{
  uint64_t fieldType;

  fieldType = self->_private->fieldType;
  if (fieldType <= 3)
    CFDictionarySetValue(a3, CFSTR("/FT"), off_24C25CF68[fieldType]);
}

- (void)addFieldNameToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;

  -[PDFFormField fieldName](self, "fieldName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    CFDictionarySetValue(a3, CFSTR("/T"), v4);
    v4 = v5;
  }

}

- (void)addNameValueToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;

  -[PDFFormField stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    CFDictionarySetValue(a3, CFSTR("/V"), (const void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@"), v4));
    v4 = v5;
  }

}

- (void)addStringValueToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;

  -[PDFFormField stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    CFDictionarySetValue(a3, CFSTR("/V"), v4);
    v4 = v5;
  }

}

- (void)addNameDefaultValueToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;

  -[PDFFormField defaultStringValue](self, "defaultStringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    CFDictionarySetValue(a3, CFSTR("/DV"), (const void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@"), v4));
    v4 = v5;
  }

}

- (void)addStringDefaultValueToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;

  -[PDFFormField defaultStringValue](self, "defaultStringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    CFDictionarySetValue(a3, CFSTR("/DV"), v4);
    v4 = v5;
  }

}

- (BOOL)_isRedacted
{
  PDFFormField *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->document);
  objc_msgSend(WeakRetained, "annotationsForFieldName:", v2->_private->fieldName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "page");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v6, "rectIntersectsWithRedactionPath:", v2->_private->bounds.origin.x, v2->_private->bounds.origin.y, v2->_private->bounds.size.width, v2->_private->bounds.size.height);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
