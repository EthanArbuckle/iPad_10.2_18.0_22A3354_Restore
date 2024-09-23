@implementation IPv4AddressWithPrefixFormatter

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  _BOOL4 v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)IPv4AddressWithPrefixFormatter;
  v7 = -[IPv4AddressFormatter isPartialStringValid:newEditingString:errorDescription:](&v18, sel_isPartialStringValid_newEditingString_errorDescription_, a3, a4);
  if (v7)
  {
    if (objc_msgSend_length(a3, v8, v9))
    {
      v11 = objc_msgSend_rangeOfString_(a3, v10, (uint64_t)CFSTR("/"));
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ((unint64_t)objc_msgSend_length(a3, v12, v13) >= 0x10)
        {
          if (a5)
          {
LABEL_6:
            LOBYTE(v7) = 0;
            *a5 = CFSTR("gErC");
            return v7;
          }
LABEL_9:
          LOBYTE(v7) = 0;
          return v7;
        }
      }
      else
      {
        v14 = (void *)objc_msgSend_substringFromIndex_(a3, v12, v11 + 1);
        if ((unint64_t)objc_msgSend_integerValue(v14, v15, v16) >= 0x21)
        {
          if (a5)
            goto LABEL_6;
          goto LABEL_9;
        }
      }
    }
    LOBYTE(v7) = 1;
  }
  return v7;
}

@end
