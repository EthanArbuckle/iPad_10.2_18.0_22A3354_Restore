@implementation DACUnknownActivityPolicy

+ (id)policyWithOptions:(unint64_t)a3
{
  return -[DACUnknownActivityPolicy _initWithOptions:audioSessionCategory:audioSessionMode:audioSessionOptions:audioSessionRouteSharingPolicy:]([DACUnknownActivityPolicy alloc], a3, 0, 0, 0, 0);
}

- (_QWORD)_initWithOptions:(void *)a3 audioSessionCategory:(void *)a4 audioSessionMode:(uint64_t)a5 audioSessionOptions:(uint64_t)a6 audioSessionRouteSharingPolicy:
{
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)DACUnknownActivityPolicy;
    v13 = objc_msgSendSuper2(&v19, sel_init);
    a1 = v13;
    if (v13)
    {
      v13[1] = a2;
      v14 = objc_msgSend(v11, "copy");
      v15 = (void *)a1[2];
      a1[2] = v14;

      v16 = objc_msgSend(v12, "copy");
      v17 = (void *)a1[3];
      a1[3] = v16;

      a1[4] = a5;
      a1[5] = a6;
    }
  }

  return a1;
}

+ (id)audioPolicyWithOptions:(unint64_t)a3 audioSessionCategory:(id)a4 audioSessionMode:(id)a5 audioSessionOptions:(unint64_t)a6
{
  id v9;
  id v10;
  _QWORD *v11;

  v9 = a5;
  v10 = a4;
  v11 = -[DACUnknownActivityPolicy _initWithOptions:audioSessionCategory:audioSessionMode:audioSessionOptions:audioSessionRouteSharingPolicy:]([DACUnknownActivityPolicy alloc], a3 | 8, v10, v9, a6, 0);

  return v11;
}

+ (id)audioPolicyWithOptions:(unint64_t)a3 audioSessionCategory:(id)a4 audioSessionMode:(id)a5 audioSessionOptions:(unint64_t)a6 audioSessionRouteSharingPolicy:(unint64_t)a7
{
  id v11;
  id v12;
  _QWORD *v13;

  v11 = a5;
  v12 = a4;
  v13 = -[DACUnknownActivityPolicy _initWithOptions:audioSessionCategory:audioSessionMode:audioSessionOptions:audioSessionRouteSharingPolicy:]([DACUnknownActivityPolicy alloc], a3 | 8, v12, v11, a6, a7);

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DACUnknownActivityPolicy options](self, "options");
  -[DACUnknownActivityPolicy audioSessionCategory](self, "audioSessionCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DACUnknownActivityPolicy audioSessionMode](self, "audioSessionMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %lu audio(%@/%@/%lu/%lu)>"), v5, self, v6, v7, v8, -[DACUnknownActivityPolicy audioSessionOptions](self, "audioSessionOptions"), -[DACUnknownActivityPolicy audioSessionRouteSharingPolicy](self, "audioSessionRouteSharingPolicy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (DACUnknownActivityPolicy)initWithCoder:(id)a3
{
  id v4;
  DACUnknownActivityPolicy *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  DACUnknownActivityPolicy *v12;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) < 1)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
    v5 = (DACUnknownActivityPolicy *)objc_claimAutoreleasedReturnValue();
    v6 = -[DACUnknownActivityPolicy unsignedIntegerValue](v5, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioSessionCategory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioSessionMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioSessionOptions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioSessionRouteSharingPolicy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (DACUnknownActivityPolicy *)-[DACUnknownActivityPolicy _initWithOptions:audioSessionCategory:audioSessionMode:audioSessionOptions:audioSessionRouteSharingPolicy:](self, v6, v7, v8, v10, objc_msgSend(v11, "unsignedIntegerValue"));

    self = v5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("version"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DACUnknownActivityPolicy options](self, "options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("options"));

  -[DACUnknownActivityPolicy audioSessionCategory](self, "audioSessionCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("audioSessionCategory"));

  -[DACUnknownActivityPolicy audioSessionMode](self, "audioSessionMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("audioSessionMode"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DACUnknownActivityPolicy audioSessionOptions](self, "audioSessionOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("audioSessionOptions"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DACUnknownActivityPolicy audioSessionRouteSharingPolicy](self, "audioSessionRouteSharingPolicy"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("audioSessionRouteSharingPolicy"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  DACUnknownActivityPolicy *v9;
  DACUnknownActivityPolicy *v10;
  DACUnknownActivityPolicy *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  int v21;

  v9 = (DACUnknownActivityPolicy *)a3;
  v10 = v9;
  if (v9)
  {
    if (self == v9)
    {
      LOBYTE(self) = 1;
      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      if (self)
      {
        v12 = -[DACUnknownActivityPolicy options](self, "options");
        if (v12 == -[DACUnknownActivityPolicy options](v11, "options"))
        {
          -[DACUnknownActivityPolicy audioSessionCategory](self, "audioSessionCategory");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13
            || (-[DACUnknownActivityPolicy audioSessionCategory](v11, "audioSessionCategory"),
                (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[DACUnknownActivityPolicy audioSessionCategory](self, "audioSessionCategory");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            -[DACUnknownActivityPolicy audioSessionCategory](v11, "audioSessionCategory");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
            {

              LOBYTE(self) = 0;
              goto LABEL_31;
            }
            v21 = 1;
          }
          else
          {
            v21 = 0;
          }
          -[DACUnknownActivityPolicy audioSessionMode](self, "audioSessionMode");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14
            || (-[DACUnknownActivityPolicy audioSessionMode](v11, "audioSessionMode"),
                (v17 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[DACUnknownActivityPolicy audioSessionMode](self, "audioSessionMode", v17);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[DACUnknownActivityPolicy audioSessionMode](v11, "audioSessionMode");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v7, "isEqual:", v3) & 1) == 0)
            {

              LOBYTE(self) = 0;
              if (v14)
                goto LABEL_29;
              goto LABEL_20;
            }
            v20 = v6;
            v19 = 1;
          }
          else
          {
            v20 = v6;
            v18 = 0;
            v19 = 0;
          }
          v15 = -[DACUnknownActivityPolicy audioSessionOptions](self, "audioSessionOptions", v18);
          if (v15 == -[DACUnknownActivityPolicy audioSessionOptions](v11, "audioSessionOptions"))
          {
            self = -[DACUnknownActivityPolicy audioSessionRouteSharingPolicy](self, "audioSessionRouteSharingPolicy");
            LOBYTE(self) = self == (DACUnknownActivityPolicy *)-[DACUnknownActivityPolicy audioSessionRouteSharingPolicy](v11, "audioSessionRouteSharingPolicy");
            if ((v19 & 1) == 0)
            {
LABEL_28:
              v6 = v20;
              if (v14)
              {
LABEL_29:

                if (v21)
                {
LABEL_30:

                }
LABEL_31:
                if (!v13)

                goto LABEL_34;
              }
LABEL_20:

              if ((v21 & 1) == 0)
                goto LABEL_31;
              goto LABEL_30;
            }
          }
          else
          {
            LOBYTE(self) = 0;
            if (!v19)
              goto LABEL_28;
          }

          goto LABEL_28;
        }
        LOBYTE(self) = 0;
      }
LABEL_34:

      goto LABEL_35;
    }
  }
  LOBYTE(self) = 0;
LABEL_35:

  return (char)self;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)audioSessionCategory
{
  return self->_audioSessionCategory;
}

- (NSString)audioSessionMode
{
  return self->_audioSessionMode;
}

- (unint64_t)audioSessionOptions
{
  return self->_audioSessionOptions;
}

- (unint64_t)audioSessionRouteSharingPolicy
{
  return self->_audioSessionRouteSharingPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSessionMode, 0);
  objc_storeStrong((id *)&self->_audioSessionCategory, 0);
}

@end
