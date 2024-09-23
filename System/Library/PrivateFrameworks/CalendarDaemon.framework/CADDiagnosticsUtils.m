@implementation CADDiagnosticsUtils

+ (BOOL)compressFileAt:(id)a3 to:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  FILE *v11;
  id v12;
  FILE *v13;
  uint64_t v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "path");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = fopen((const char *)objc_msgSend(v10, "fileSystemRepresentation"), "r");

  if (v11)
  {
    objc_msgSend(v8, "path");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = fopen((const char *)objc_msgSend(v12, "fileSystemRepresentation"), "w");

    if (v13)
    {
      v14 = CPFileCompressionZDeflate();
      if ((_DWORD)v14)
        objc_msgSend(v9, "logError:", CFSTR("Compressing file failed: %i"), v14);
      fclose(v11);
      fclose(v13);
      LOBYTE(v11) = 1;
    }
    else
    {
      objc_msgSend(v9, "logError:", CFSTR("Failed to open output file \"%@\": %d"), v8, *__error());
      fclose(v11);
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    objc_msgSend(v9, "logError:", CFSTR("Failed to open input file \"%@\": %d"), v7, *__error());
  }

  return (char)v11;
}

@end
