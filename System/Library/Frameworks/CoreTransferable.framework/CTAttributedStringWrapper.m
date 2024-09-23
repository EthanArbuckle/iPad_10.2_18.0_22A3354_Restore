@implementation CTAttributedStringWrapper

+ (id)attributedStringFromData:(id)a3 options:(id)a4 documentAttributes:(id *)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_initWithData_options_documentAttributes_error_) & 1) != 0)
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithData:options:documentAttributes:error:", v9, v10, a5, a6);
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x24BDD1540]);
    v16 = *MEMORY[0x24BDD0FC8];
    v17[0] = CFSTR("Conversion of binary data into attributed string is not supported on this platform");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *a6 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("NSAttributedStringConversionErrorDomain"), 1, v13);

    v11 = objc_alloc_init(MEMORY[0x24BDD1458]);
  }
  v14 = v11;

  return v14;
}

+ (id)dataFromAttributedString:(id)a3 range:(_NSRange)a4 documentAttributes:(id)a5 error:(id *)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  length = a4.length;
  location = a4.location;
  v18[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "dataFromRange:documentAttributes:error:", location, length, v11, a6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x24BDD1540]);
    v17 = *MEMORY[0x24BDD0FC8];
    v18[0] = CFSTR("Conversion of attributed string into binary data is not supported on this platform");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *a6 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", CFSTR("NSAttributedStringConversionErrorDomain"), 1, v14);

    v12 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  }
  v15 = v12;

  return v15;
}

+ (BOOL)containsAttachments:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", sel_containsAttachments))
    v4 = objc_msgSend(v3, "containsAttachments");
  else
    v4 = 0;

  return v4;
}

@end
