@implementation PDFActionResetForm

- (PDFActionResetForm)init
{
  PDFActionResetForm *v2;
  PDFActionResetForm *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDFActionResetForm;
  v2 = -[PDFAction init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PDFActionResetForm commonInit](v2, "commonInit");
    -[PDFAction setType:](v3, "setType:", CFSTR("ResetForm"));
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PDFActionResetFormPrivateVars *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PDFActionResetForm;
  v5 = -[PDFAction copyWithZone:](&v12, sel_copyWithZone_);
  if (v5)
  {
    v6 = objc_alloc_init(PDFActionResetFormPrivateVars);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = -[NSArray copyWithZone:](self->_private2->fields, "copyWithZone:", a3);
    v9 = v5[2];
    v10 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = v8;

    *(_BYTE *)(v5[2] + 16) = self->_private2->included;
  }
  return v5;
}

- (NSArray)fields
{
  return self->_private2->fields;
}

- (void)setFields:(NSArray *)fields
{
  uint64_t v4;
  PDFActionResetFormPrivateVars *private2;
  NSArray *v6;

  v4 = -[NSArray copy](fields, "copy");
  private2 = self->_private2;
  v6 = private2->fields;
  private2->fields = (NSArray *)v4;

}

- (BOOL)fieldsIncludedAreCleared
{
  return self->_private2->included;
}

- (void)setFieldsIncludedAreCleared:(BOOL)fieldsIncludedAreCleared
{
  self->_private2->included = fieldsIncludedAreCleared;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[PDFActionResetForm toolTip](self, "toolTip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("ResetForm Action - %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PDFActionResetForm)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  PDFActionResetForm *v6;
  size_t Count;
  void *v8;
  size_t i;
  __CFString *v10;
  uint64_t v11;
  PDFActionResetFormPrivateVars *private2;
  NSArray *fields;
  PDFActionResetForm *v14;
  uint64_t v16;
  CGPDFStringRef string;
  CGPDFObjectRef object;
  CGPDFInteger v19;
  objc_super v20;
  CGPDFArrayRef value;

  v20.receiver = self;
  v20.super_class = (Class)PDFActionResetForm;
  value = 0;
  v6 = -[PDFAction initWithActionDictionary:forDocument:forPage:](&v20, sel_initWithActionDictionary_forDocument_forPage_, a3, a4, a5);
  if (v6)
  {
    if (CGPDFDictionaryGetArray(a3, "Fields", &value))
    {
      v19 = 0;
      Count = CGPDFArrayGetCount(value);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", Count);
      if (Count)
      {
        for (i = 0; i != Count; ++i)
        {
          object = 0;
          if (CGPDFArrayGetObject(value, i, &object))
          {
            v16 = 0;
            string = 0;
            if (CGPDFObjectGetValue(object, kCGPDFObjectTypeString, &string))
            {
              v10 = (__CFString *)CGPDFStringCopyTextString(string);
              objc_msgSend(v8, "addObject:", v10);

            }
            else if (CGPDFObjectGetValue(object, kCGPDFObjectTypeDictionary, &v16))
            {
              NSLog(CFSTR("Need to handle ResetForm Field dictionaries."));
            }
          }
        }
      }
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v8);
      private2 = v6->_private2;
      fields = private2->fields;
      private2->fields = (NSArray *)v11;

      if (CGPDFDictionaryGetInteger(a3, "Flags", &v19) && (v19 & 1) != 0)
        v6->_private2->included = 0;

    }
    else
    {
      v6->_private2->included = 0;
    }
    v14 = v6;
  }

  return v6;
}

- (void)commonInit
{
  PDFActionResetFormPrivateVars *v3;
  PDFActionResetFormPrivateVars *private2;
  PDFActionResetFormPrivateVars *v5;
  NSArray *fields;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDFActionResetForm;
  -[PDFAction commonInit](&v7, sel_commonInit);
  v3 = objc_alloc_init(PDFActionResetFormPrivateVars);
  private2 = self->_private2;
  self->_private2 = v3;

  v5 = self->_private2;
  fields = v5->fields;
  v5->fields = 0;

  self->_private2->included = 1;
}

- (__CFDictionary)createDictionaryRef
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("/S"), CFSTR("/ResetForm"));
  -[PDFActionResetForm addFieldsToDictionaryRef:](self, "addFieldsToDictionaryRef:", Mutable);
  -[PDFActionResetForm addFlagsToDictionaryRef:](self, "addFlagsToDictionaryRef:", Mutable);
  return Mutable;
}

- (void)addFieldsToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  CFIndex v5;
  __CFArray *Mutable;
  uint64_t i;
  id v8;

  -[PDFActionResetForm fields](self, "fields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    v5 = objc_msgSend(v4, "count");
    v4 = v8;
    if (v5)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, MEMORY[0x24BDBD690]);
      for (i = 0; i != v5; ++i)
        CFArrayAppendValue(Mutable, (const void *)objc_msgSend(v8, "objectAtIndex:", i));
      CFDictionarySetValue(a3, CFSTR("/Fields"), Mutable);
      v4 = v8;
      if (Mutable)
      {
        CFRelease(Mutable);
        v4 = v8;
      }
    }
  }

}

- (void)addFlagsToDictionaryRef:(__CFDictionary *)a3
{
  CFNumberRef v4;
  CFNumberRef v5;
  int valuePtr;

  valuePtr = 1;
  if (!-[PDFActionResetForm fieldsIncludedAreCleared](self, "fieldsIncludedAreCleared"))
  {
    v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
    if (v4)
    {
      v5 = v4;
      CFDictionarySetValue(a3, CFSTR("/Flags"), v4);
      CFRelease(v5);
    }
  }
}

- (id)toolTip
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  PDFKitLocalizedString(CFSTR("Reset forms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private2, 0);
}

@end
