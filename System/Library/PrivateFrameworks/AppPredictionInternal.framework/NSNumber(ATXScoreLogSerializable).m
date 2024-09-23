@implementation NSNumber(ATXScoreLogSerializable)

- (uint64_t)needsQuotes
{
  int v2;
  int v3;

  v2 = objc_msgSend(a1, "isEqualToNumber:", &unk_1E83D09A0);
  v3 = v2 | objc_msgSend(a1, "isEqualToNumber:", &unk_1E83D09B0);
  return v3 | objc_msgSend(a1, "isEqualToNumber:", &unk_1E83D09C0);
}

- (void)atx_writeToFile:()ATXScoreLogSerializable
{
  id v4;
  int v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  double v9;
  float v10;

  v4 = objc_retainAutorelease(a1);
  v5 = *(char *)objc_msgSend(v4, "objCType");
  switch(v5)
  {
    case 'd':
      if (objc_msgSend(v4, "needsQuotes"))
        v8 = "\"%0.16g\";
      else
        v8 = "%0.16g";
      objc_msgSend(v4, "doubleValue");
      goto LABEL_16;
    case 'f':
      if (objc_msgSend(v4, "needsQuotes"))
        v8 = "\"%0.7g\";
      else
        v8 = "%0.7g";
      objc_msgSend(v4, "floatValue");
      v9 = v10;
LABEL_16:
      fprintf(a3, v8, *(_QWORD *)&v9);
      return;
    case 'i':
      v6 = objc_msgSend(v4, "intValue");
      if (objc_msgSend(v4, "needsQuotes"))
        v7 = "\"%d\";
      else
        v7 = "%d";
      fprintf(a3, v7, v6);
      break;
    default:
      printStringRepresentation(a3, v4);
      break;
  }
}

@end
