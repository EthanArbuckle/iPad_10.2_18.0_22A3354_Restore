@implementation CKLStreamRawMessageObserver

- (void)eventMatched:(id)a3
{
  const char *v3;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  objc_msgSend_composedMessage(a3, a2, (uint64_t)a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasPrefix_(v10, v3, (uint64_t)CFSTR("SIM: ")))
  {
    objc_msgSend_substringFromIndex_(v10, v4, 5);
    v5 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v5;
  }
  v6 = objc_retainAutorelease((id)objc_msgSend_initWithFormat_(objc_alloc(MEMORY[0x1E0CB3940]), (const char *)v10, (uint64_t)CFSTR("%@"), v10));
  v9 = (const char *)objc_msgSend_UTF8String(v6, v7, v8);
  puts(v9);

}

@end
