@implementation NSError(MKErrorInternal)

- (id)_mapkit_error
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  id result;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if ((v4 & 1) == 0)
    return a1;
  v5 = objc_msgSend(a1, "code");
  v6 = 2;
  switch(v5)
  {
    case -10:
      goto LABEL_6;
    case -9:
    case -6:
    case -5:
    case -4:
      goto LABEL_7;
    case -8:
      v6 = 4;
      goto LABEL_9;
    case -7:
      goto LABEL_9;
    case -3:
      v6 = 3;
      goto LABEL_9;
    default:
      if ((unint64_t)(v5 + 402) >= 2)
LABEL_7:
        v6 = 1;
      else
LABEL_6:
        v6 = 5;
LABEL_9:
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = MKErrorDomain;
      v13 = CFSTR("MKErrorGEOError");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v6, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      result = v12;
      break;
  }
  return result;
}

@end
