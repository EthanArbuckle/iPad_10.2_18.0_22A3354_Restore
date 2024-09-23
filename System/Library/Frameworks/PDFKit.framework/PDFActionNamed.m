@implementation PDFActionNamed

- (PDFActionNamed)initWithName:(PDFActionNamedName)name
{
  PDFActionNamed *v4;
  PDFActionNamed *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDFActionNamed;
  v4 = -[PDFAction init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PDFActionNamed commonInit](v4, "commonInit");
    -[PDFAction setType:](v5, "setType:", CFSTR("Named"));
    v5->_private2->name = name;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  PDFActionNamedPrivateVars *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDFActionNamed;
  v4 = -[PDFAction copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = objc_alloc_init(PDFActionNamedPrivateVars);
    v6 = (void *)v4[2];
    v4[2] = v5;

    *(_QWORD *)(v4[2] + 8) = self->_private2->name;
  }
  return v4;
}

- (PDFActionNamedName)name
{
  return self->_private2->name;
}

- (void)setName:(PDFActionNamedName)name
{
  self->_private2->name = name;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[PDFActionNamed toolTip](self, "toolTip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Named Action - %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PDFActionNamed)initWithActionDictionary:(CGPDFDictionary *)a3 forDocument:(id)a4 forPage:(id)a5
{
  PDFActionNamed *v6;
  char *v7;
  PDFActionNamed *v8;
  uint64_t v9;
  objc_super v11;
  char *value;

  v11.receiver = self;
  v11.super_class = (Class)PDFActionNamed;
  value = 0;
  v6 = -[PDFAction initWithActionDictionary:forDocument:forPage:](&v11, sel_initWithActionDictionary_forDocument_forPage_, a3, a4, a5);
  if (!v6 || !CGPDFDictionaryGetName(a3, "N", (const char **)&value))
    goto LABEL_14;
  v7 = value;
  if (!strcmp(value, "Find"))
  {
    v9 = 8;
LABEL_26:
    v6->_private2->name = v9;
    v8 = v6;
    goto LABEL_27;
  }
  if (!strcmp(v7, "FirstPage"))
  {
    v9 = 3;
    goto LABEL_26;
  }
  if (!strcmp(v7, "GoBack"))
  {
    v9 = 5;
    goto LABEL_26;
  }
  if (!strcmp(v7, "GoForward"))
  {
    v9 = 6;
    goto LABEL_26;
  }
  if (!strcmp(v7, "GoToPage"))
  {
    v9 = 7;
    goto LABEL_26;
  }
  if (!strcmp(v7, "LastPage"))
  {
    v9 = 4;
    goto LABEL_26;
  }
  if (!strcmp(v7, "NextPage"))
  {
    v9 = 1;
    goto LABEL_26;
  }
  if (!strcmp(v7, "PrevPage"))
  {
    v9 = 2;
    goto LABEL_26;
  }
  if (!strcmp(v7, "Print"))
  {
    v9 = 9;
    goto LABEL_26;
  }
  if (!strcmp(v7, "ZoomViewIn"))
  {
    v9 = 10;
    goto LABEL_26;
  }
  if (!strcmp(v7, "ZoomViewOut"))
  {
    v9 = 11;
    goto LABEL_26;
  }
LABEL_14:
  v8 = 0;
LABEL_27:

  return v8;
}

- (void)commonInit
{
  PDFActionNamedPrivateVars *v3;
  PDFActionNamedPrivateVars *private2;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDFActionNamed;
  -[PDFAction commonInit](&v5, sel_commonInit);
  v3 = objc_alloc_init(PDFActionNamedPrivateVars);
  private2 = self->_private2;
  self->_private2 = v3;

  self->_private2->name = 0;
}

- (__CFDictionary)createDictionaryRef
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("/S"), CFSTR("/Named"));
  -[PDFActionNamed addNameToDictionaryRef:](self, "addNameToDictionaryRef:", Mutable);
  return Mutable;
}

- (void)addNameToDictionaryRef:(__CFDictionary *)a3
{
  unint64_t v4;

  v4 = -[PDFActionNamed name](self, "name") - 1;
  if (v4 <= 0xA)
    CFDictionarySetValue(a3, CFSTR("/N"), off_24C25D2B0[v4]);
}

- (id)toolTip
{
  unint64_t v2;

  v2 = -[PDFActionNamed name](self, "name") - 1;
  if (v2 > 8 || ((0x1BFu >> v2) & 1) == 0)
    return 0;
  PDFKitLocalizedString(off_24C25D308[v2]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private2, 0);
}

@end
