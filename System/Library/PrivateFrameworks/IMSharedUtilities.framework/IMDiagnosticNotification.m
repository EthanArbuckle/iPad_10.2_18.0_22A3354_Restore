@implementation IMDiagnosticNotification

- (IMDiagnosticNotification)init
{
  void *v3;
  int v4;
  IMDiagnosticNotification *v5;
  uint64_t v6;
  NSString *identifier;
  IMDiagnosticNotification *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalInstall");

  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)IMDiagnosticNotification;
    v5 = -[IMDiagnosticNotification init](&v10, sel_init);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v6 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (IMDiagnosticNotification)initWithTitle:(id)a3 body:(id)a4
{
  id v7;
  id v8;
  IMDiagnosticNotification *v9;
  IMDiagnosticNotification *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[IMDiagnosticNotification init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_body, a4);
  }

  return v10;
}

- (id)_createContent
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  -[IMDiagnosticNotification title](self, "title");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[IMDiagnosticNotification body](self, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v6 = (void *)qword_1EE5041E0;
  v18 = qword_1EE5041E0;
  if (!qword_1EE5041E0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_19E2EFC14;
    v14[3] = &unk_1E3FB4F80;
    v14[4] = &v15;
    sub_19E2EFC14((uint64_t)v14);
    v6 = (void *)v16[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v15, 8);
  v8 = objc_alloc_init(v7);
  -[IMDiagnosticNotification title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

  -[IMDiagnosticNotification body](self, "body");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBody:", v10);

  objc_msgSend(v8, "setFooter:", CFSTR("This is an internal-only notification."));
  objc_msgSend(MEMORY[0x1E0CEC738], "iconForApplicationIdentifier:", CFSTR("com.apple.MobileSMS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIcon:", v11);

  if (-[IMDiagnosticNotification timeSensitive](self, "timeSensitive"))
  {
    objc_msgSend(v8, "setShouldIgnoreDowntime:", 1);
    objc_msgSend(v8, "setShouldIgnoreDoNotDisturb:", 1);
  }
  v12 = (void *)objc_msgSend(v8, "copy");

  return v12;
}

- (id)_createRequest
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  -[IMDiagnosticNotification _createContent](self, "_createContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)qword_1EE5041F0;
    v13 = qword_1EE5041F0;
    if (!qword_1EE5041F0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = sub_19E2EFD14;
      v9[3] = &unk_1E3FB4F80;
      v9[4] = &v10;
      sub_19E2EFD14((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    -[IMDiagnosticNotification identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestWithIdentifier:content:trigger:", v6, v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (BOOL)timeSensitive
{
  return self->_timeSensitive;
}

- (void)setTimeSensitive:(BOOL)a3
{
  self->_timeSensitive = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
