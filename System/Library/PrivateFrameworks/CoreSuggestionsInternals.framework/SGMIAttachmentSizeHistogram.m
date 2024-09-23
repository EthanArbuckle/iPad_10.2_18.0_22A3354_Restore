@implementation SGMIAttachmentSizeHistogram

- (id)numberArray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_countUpTo8KB);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_count8KBTo32KB);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_count32KBTo128KB);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_count128KBTo512KB);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_count512KBTo2MB);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_countOver2MB);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SGMIAttachmentSizeHistogram)initWithNumberArray:(id)a3
{
  id v4;
  NSObject *v5;
  SGMIAttachmentSizeHistogram *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") != 6)
  {
    sgMailIntelligenceLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_fault_impl(&dword_1C3607000, v5, OS_LOG_TYPE_FAULT, "Error initializing SGMIAttachmentSizeHistogram with numberArray: %@", buf, 0xCu);
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)SGMIAttachmentSizeHistogram;
  v6 = -[SGMIAttachmentSizeHistogram init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_countUpTo8KB = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_count8KBTo32KB = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_count32KBTo128KB = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_count128KBTo512KB = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_count512KBTo2MB = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_countOver2MB = objc_msgSend(v12, "unsignedIntegerValue");

  }
  return v6;
}

- (void)bucketizeWithSize:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 8;
  v4 = 16;
  v5 = 48;
  if (a3 < 0x200001)
    v5 = 40;
  if (a3 < 0x80001)
    v5 = 32;
  if (a3 <= 0x20000)
    v5 = 24;
  if (a3 > 0x8000)
    v4 = v5;
  if (a3 > 0x2000)
    v3 = v4;
  ++*(Class *)((char *)&self->super.isa + v3);
}

- (BOOL)isEmpty
{
  return !self->_countUpTo8KB
      && !self->_count8KBTo32KB
      && !self->_count32KBTo128KB
      && !self->_count128KBTo512KB
      && !self->_count512KBTo2MB
      && self->_countOver2MB == 0;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UpTo8KB: %tu\n8KBTo32KB: %tu\n32KBTo128KB: %tu\n128KBTo512KB: %tu\n512KBTo2MB: %tu\nOver2MB: %tu"), self->_countUpTo8KB, self->_count8KBTo32KB, self->_count32KBTo128KB, self->_count128KBTo512KB, self->_count512KBTo2MB, self->_countOver2MB);
}

- (unint64_t)countUpTo8KB
{
  return self->_countUpTo8KB;
}

- (unint64_t)count8KBTo32KB
{
  return self->_count8KBTo32KB;
}

- (unint64_t)count32KBTo128KB
{
  return self->_count32KBTo128KB;
}

- (unint64_t)count128KBTo512KB
{
  return self->_count128KBTo512KB;
}

- (unint64_t)count512KBTo2MB
{
  return self->_count512KBTo2MB;
}

- (unint64_t)countOver2MB
{
  return self->_countOver2MB;
}

+ (id)bucketsNames
{
  return &unk_1E7E10728;
}

@end
