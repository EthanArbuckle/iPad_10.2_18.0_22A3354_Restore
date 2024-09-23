@implementation NSError(BacklightServices)

- (id)bls_loggingString
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  void *v12;

  v2 = (void *)objc_opt_new();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__NSError_BacklightServices__bls_loggingString__block_invoke;
  v10[3] = &unk_1E621A3B8;
  v4 = v2;
  v11 = v4;
  v12 = a1;
  objc_msgSend(v4, "appendProem:block:", 0, v10);
  objc_msgSend(a1, "underlyingErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __47__NSError_BacklightServices__bls_loggingString__block_invoke_3;
    v8[3] = &unk_1E621AA30;
    v9 = v4;
    objc_msgSend(v9, "appendCollection:withName:itemBlock:", v5, CFSTR("underlyingErrors"), v8);

  }
  objc_msgSend(v4, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bls_shortLoggingString
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v2 = (void *)objc_opt_new();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__NSError_BacklightServices__bls_shortLoggingString__block_invoke;
  v5[3] = &unk_1E621A368;
  v5[4] = a1;
  objc_msgSend(v2, "appendCustomFormatWithName:block:", 0, v5);
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
