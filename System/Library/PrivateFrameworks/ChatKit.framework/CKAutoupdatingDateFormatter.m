@implementation CKAutoupdatingDateFormatter

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKAutoupdatingDateFormatter notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKAutoupdatingDateFormatter;
  -[CKAutoupdatingDateFormatter dealloc](&v4, sel_dealloc);
}

- (CKAutoupdatingDateFormatter)initWithTemplate:(id)a3
{
  id v4;
  CKAutoupdatingDateFormatter *v5;
  CKAutoupdatingDateFormatter *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKAutoupdatingDateFormatter;
  v5 = -[CKAutoupdatingDateFormatter init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CKAutoupdatingDateFormatter setTemplate:](v5, "setTemplate:", v4);
    objc_msgSend(MEMORY[0x1E0C99DC8], "__ck_currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAutoupdatingDateFormatter setLocale:](v6, "setLocale:", v7);

    -[CKAutoupdatingDateFormatter notificationCenter](v6, "notificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel_updateDateFormat, *MEMORY[0x1E0C99720], 0);

    -[CKAutoupdatingDateFormatter updateDateFormat](v6, "updateDateFormat");
  }

  return v6;
}

- (id)notificationCenter
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
}

- (void)updateDateFormat
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3578];
  -[CKAutoupdatingDateFormatter template](self, "template");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAutoupdatingDateFormatter locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFormatFromTemplate:options:locale:", v4, 0, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CKAutoupdatingDateFormatter setDateFormat:](self, "setDateFormat:", v6);
}

- (NSString)template
{
  return self->_template;
}

- (void)setTemplate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_template, 0);
}

@end
