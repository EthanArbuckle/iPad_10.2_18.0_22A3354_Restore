@implementation PDFActionGoTo

- (PDFActionGoTo)initWithDestination:(PDFDestination *)destination
{
  PDFDestination *v5;
  PDFActionGoTo *v6;
  PDFActionGoTo *v7;
  objc_super v9;

  v5 = destination;
  v9.receiver = self;
  v9.super_class = (Class)PDFActionGoTo;
  v6 = -[PDFAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PDFAction setType:](v6, "setType:", CFSTR("GoTo"));
    objc_storeStrong((id *)&v7->_private2->destination, destination);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PDFActionGoToPrivateVars *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PDFActionGoTo;
  v5 = -[PDFAction copyWithZone:](&v12, sel_copyWithZone_);
  if (v5)
  {
    v6 = objc_alloc_init(PDFActionGoToPrivateVars);
    v7 = (void *)v5[2];
    v5[2] = v6;

    v8 = -[PDFDestination copyWithZone:](self->_private2->destination, "copyWithZone:", a3);
    v9 = v5[2];
    v10 = *(void **)(v9 + 8);
    *(_QWORD *)(v9 + 8) = v8;

  }
  return v5;
}

- (PDFDestination)destination
{
  return self->_private2->destination;
}

- (void)setDestination:(PDFDestination *)destination
{
  objc_storeStrong((id *)&self->_private2->destination, destination);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[PDFActionGoTo toolTip](self, "toolTip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("GoTo Action - %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PDFActionGoTo)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  id v8;
  PDFActionGoTo *v9;
  PDFDestination *v10;
  PDFActionGoToPrivateVars *private2;
  PDFDestination *destination;
  PDFActionGoTo *v13;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PDFActionGoTo;
  v9 = -[PDFAction initWithActionDictionary:forDocument:forPage:](&v15, sel_initWithActionDictionary_forDocument_forPage_, a3, v8, a5);
  if (v9)
  {
    v10 = -[PDFDestination initWithDictionary:forDocument:]([PDFDestination alloc], "initWithDictionary:forDocument:", a3, v8);
    private2 = v9->_private2;
    destination = private2->destination;
    private2->destination = v10;

    v13 = v9;
  }

  return v9;
}

- (void)commonInit
{
  PDFActionGoToPrivateVars *v3;
  PDFActionGoToPrivateVars *private2;
  PDFActionGoToPrivateVars *v5;
  PDFDestination *destination;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDFActionGoTo;
  -[PDFAction commonInit](&v7, sel_commonInit);
  v3 = objc_alloc_init(PDFActionGoToPrivateVars);
  private2 = self->_private2;
  self->_private2 = v3;

  v5 = self->_private2;
  destination = v5->destination;
  v5->destination = 0;

}

- (__CFDictionary)createDictionaryRef
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("/S"), CFSTR("/GoTo"));
  -[PDFActionGoTo addDestinationToDictionaryRef:](self, "addDestinationToDictionaryRef:", Mutable);
  return Mutable;
}

- (void)addDestinationToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  const void *v5;
  id v6;

  -[PDFActionGoTo destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    v5 = (const void *)objc_msgSend(v4, "createArrayRef");
    v4 = v6;
    if (v5)
    {
      CFDictionarySetValue(a3, CFSTR("/D"), v5);
      CFRelease(v5);
      v4 = v6;
    }
  }

}

- (id)toolTip
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  PDFKitLocalizedString(CFSTR("Go to page %@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFActionGoTo destination](self, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "page");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)toolTipNoLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[PDFActionGoTo destination](self, "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PDFGetToolTipNoLabel(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private2, 0);
}

@end
