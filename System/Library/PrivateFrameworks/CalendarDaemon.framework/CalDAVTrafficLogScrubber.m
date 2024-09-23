@implementation CalDAVTrafficLogScrubber

+ (id)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_15);
  return (id)log_log;
}

void __31__CalDAVTrafficLogScrubber_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar", "CalDAVTrafficLogScrubber");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

+ (BOOL)sortICSDocuments
{
  return _sortICSDocuments;
}

+ (void)setSortICSDocuments:(BOOL)a3
{
  _sortICSDocuments = a3;
}

+ (BOOL)redactLog:(id)a3 toOutputFile:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  CalDAVTrafficLogScrubber *v10;
  int v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(CalDAVTrafficLogScrubber);
  -[CalDAVTrafficLogScrubber setContext:](v10, "setContext:", v7);
  -[CalDAVTrafficLogScrubber setInputURL:](v10, "setInputURL:", v9);

  -[CalDAVTrafficLogScrubber setOutputURL:](v10, "setOutputURL:", v8);
  if (-[CalDAVTrafficLogScrubber scrub](v10, "scrub"))
  {
    -[CalDAVTrafficLogScrubber cleanUp](v10, "cleanUp");
    v11 = objc_msgSend(v7, "canceled") ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (CalDAVTrafficLogScrubber)init
{
  CalDAVTrafficLogScrubber *v2;
  uint64_t v3;
  NSMutableArray *urlsToCleanUp;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CalDAVTrafficLogScrubber;
  v2 = -[CalDAVTrafficLogScrubber init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    urlsToCleanUp = v2->_urlsToCleanUp;
    v2->_urlsToCleanUp = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)cleanUp
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_urlsToCleanUp;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[CADDiagnosticLogContext deleteTemporaryFile:](self->_context, "deleteTemporaryFile:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_urlsToCleanUp, "removeAllObjects");
}

- (BOOL)scrub
{
  CalDAVTrafficLogScrubber *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  FILE *v7;
  NSObject *v8;
  id v9;
  FILE *v10;
  void *v11;
  int v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  char v33;
  char *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  CalXMLSanitizer *v56;
  char v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  int v65;
  NSObject *v66;
  void *v67;
  void *v69;
  void *v70;
  CalDAVTrafficLogScrubber *v71;
  FILE *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  char v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;

  v2 = self;
  v84 = *MEMORY[0x1E0C80C00];
  -[CalDAVTrafficLogScrubber decompressedInputFile](self, "decompressedInputFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVTrafficLogScrubber temporaryUncompressedFile](v2, "temporaryUncompressedFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v2->_urlsToCleanUp, "addObject:", v4);
  -[CalDAVTrafficLogScrubber context](v2, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "log:", CFSTR("Redacting log at %@..."), v3);

  if (!v3)
    goto LABEL_89;
  objc_msgSend(v3, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = fopen((const char *)objc_msgSend(v6, "fileSystemRepresentation"), "r");

  if (!v7)
  {
    +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CalDAVTrafficLogScrubber scrub].cold.2();

  }
  v70 = v4;
  v71 = v2;
  v69 = v3;
  objc_msgSend(v4, "path");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = fopen((const char *)objc_msgSend(v9, "fileSystemRepresentation"), "w");

  if (v10)
  {
    if (v7)
    {
      if ((-[CADDiagnosticLogContext canceled](v2->_context, "canceled") & 1) != 0)
        goto LABEL_84;
      v72 = v7;
      while (1)
      {
        v11 = (void *)MEMORY[0x1BCC9D714]();
        v12 = writeNextTaskHeader(v7, v10);
        v13 = v12;
        if (v12 != 1)
          break;
        if (writeRequest_onceToken != -1)
          dispatch_once(&writeRequest_onceToken, &__block_literal_global_256);
        readFromFileUntilStringAndReturnData(v7, "\n", 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (!v38)
        {
          fputs("Failed to parse request.\n", v10);
          goto LABEL_51;
        }
        v40 = v11;
        v41 = objc_msgSend(v38, "rangeOfString:", CFSTR(" "));
        if (v41 == 0x7FFFFFFFFFFFFFFFLL)
        {
          fprintf(v10, "Request line (length %lu) did not have a space.\n", objc_msgSend(v39, "length"));
LABEL_51:

          goto LABEL_52;
        }
        v49 = v41;
        v50 = v42;
        objc_msgSend(v39, "substringToIndex:", v41);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend((id)writeRequest_knownMethods, "containsObject:", v51);
        if ((v78 & 1) != 0)
        {
          fputNSString(v10, v51);
          v52 = objc_retainAutorelease(v51);
          fputc(32, v10);
          objc_msgSend(v39, "substringFromIndex:", v49 + v50);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          CalRedactURLString();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          fputNSString(v10, v54);
          fputc(10, v10);

        }
        else
        {
          fprintf(v10, "Request with unknown method. (Method length=%lu, line length=%lu)\n", objc_msgSend(v51, "length"), objc_msgSend(v39, "length"));
          v52 = 0;
        }
        v11 = v40;
        v13 = 1;

        v14 = v52;
        if ((v78 & 1) != 0)
          goto LABEL_14;
LABEL_62:

        objc_autoreleasePoolPop(v11);
      }
      if (v12 == 2)
      {
        readFromFileUntilStringAndReturnData(v7, "\n", 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = "Unparseable response status length %lu; no HTTP version\n";
        if (!objc_msgSend(v43, "hasPrefix:", CFSTR("HTTP/"))
          || (v45 = objc_msgSend(v43, "rangeOfString:", CFSTR(" ")),
              v44 = "Unparseable response status length %lu; no code\n",
              v45 == 0x7FFFFFFFFFFFFFFFLL)
          || (v47 = objc_msgSend(v43, "rangeOfString:options:range:", CFSTR(" ("), 0, v45 + v46, objc_msgSend(v43, "length") - (v45 + v46)), v44 = "Unparseable response status length %lu; no space after code\n",
              v47 == 0x7FFFFFFFFFFFFFFFLL))
        {
          fprintf(v10, v44, objc_msgSend(v43, "length"));
          goto LABEL_48;
        }
        v59 = v47;
        v60 = v48;
        if (writeHttpStatus_onceToken != -1)
          dispatch_once(&writeHttpStatus_onceToken, &__block_literal_global_332);
        objc_msgSend(v43, "substringWithRange:", 5, v59 - 5);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v61, "rangeOfCharacterFromSet:", writeHttpStatus_disallowedCharacters) != 0x7FFFFFFFFFFFFFFFLL)
          fprintf(v10, "Unparseable response status length %lu; http version or response code (length %lu) contained things that are not numbers\n",
            objc_msgSend(v43, "length"),
            objc_msgSend(v61, "length"));
        if ((objc_msgSend(v43, "hasSuffix:", CFSTR(")")) & 1) == 0)
        {
          fprintf(v10, "Unparseable response status length %lu; no \")\" at end of line\n", objc_msgSend(v43, "length"));
          goto LABEL_80;
        }
        v62 = v59 + v60;
        objc_msgSend(v43, "substringToIndex:", v59 + v60);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        fputNSString(v10, v63);
        objc_msgSend(v43, "substringWithRange:", v62, objc_msgSend(v43, "length") + ~v62);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend((id)writeHttpStatus_expectedStatusDescriptions, "containsObject:", v64))
          fputNSString(v10, v64);
        else
          fprintf(v10, "<unexpected description length %lu>", objc_msgSend(v64, "length"));
        fputs(")\n", v10);
        v65 = fgetc(v7);
        if (v65 == -1)
          goto LABEL_79;
        if (v65 != 10)
        {
          ungetc(v65, v7);
LABEL_79:
          fputs("[Parse failure: missing newline]\n", v10);

LABEL_80:
LABEL_48:

LABEL_52:
          v14 = 0;
          goto LABEL_62;
        }

      }
      else if (!v12)
      {
        objc_autoreleasePoolPop(v11);
        goto LABEL_84;
      }
      v14 = 0;
LABEL_14:
      v75 = v11;
      if (getHeaderRedactionBehaviors_onceToken != -1)
        dispatch_once(&getHeaderRedactionBehaviors_onceToken, &__block_literal_global_442);
      v15 = (id)getHeaderRedactionBehaviors_headerRedactionBehaviors;
      readFromFileUntilStringAndReturnData(v7, "\n\n", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        fputs("[Parse failure: Failed to parse headers]\n", v10);

        goto LABEL_62;
      }
      v77 = v15;
      v73 = v16;
      v74 = v14;
      v76 = v13;
      objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v80;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v80 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
            if (objc_msgSend(v22, "length"))
            {
              v23 = objc_msgSend(v22, "rangeOfString:", CFSTR(": "));
              if (v23 == 0x7FFFFFFFFFFFFFFFLL)
              {
                fprintf(v10, "[Parse failure: unparseable header of length %lu]\n", objc_msgSend(v22, "length"));
              }
              else
              {
                v25 = v23;
                v26 = v24;
                objc_msgSend(v22, "substringToIndex:", v23);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                fputNSString(v10, v27);
                fputs(": ", v10);
                objc_msgSend(v22, "substringFromIndex:", v25 + v26);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "lowercaseString");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "objectForKeyedSubscript:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "integerValue");

                CalRedactString(v31, v28);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                fputNSString(v10, v32);
                fputc(10, v10);

              }
            }
            else
            {
              fputc(10, v10);
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
        }
        while (v19);
      }
      fputc(10, v10);

      v14 = v74;
      v7 = v72;
      if (checkForString(v72, "[compression: gzip]\n", 1))
        fputs("[compression: gzip]\n", v10);
      v33 = checkForString(v72, "\nTask ", 0);
      if (v76 == 1)
        v34 = "\n>>>>>\n";
      else
        v34 = "\n<<<<<\n";
      v11 = v75;
      if ((v33 & 1) != 0)
      {
LABEL_61:
        fputs(v34, v10);

        goto LABEL_62;
      }
      v35 = fgetc(v72);
      ungetc(v35, v72);
      if (v35 != 60 && (v35 == 66 || objc_msgSend(v14, "isEqualToString:", CFSTR("PUT"))))
      {
        readFromFileUntilStringAndReturnData(v72, v34, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        CalRedactString(3, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        fputNSString(v10, v37);
      }
      else
      {
        readFromFileUntilStringAndReturnData(v72, v34, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v36, "length"))
        {
LABEL_60:

          goto LABEL_61;
        }
        v55 = v14;
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithData:", v36);
        objc_msgSend(v37, "setShouldProcessNamespaces:", 1);
        v56 = objc_alloc_init(CalXMLSanitizer);
        -[CalXMLSanitizer setOutput:](v56, "setOutput:", v10);
        objc_msgSend(v37, "setDelegate:", v56);
        v57 = objc_msgSend(v37, "parse");
        -[CalXMLSanitizer scrubbedXML](v56, "scrubbedXML");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        fputNSString(v10, v58);

        if ((v57 & 1) == 0)
          fputNSString(v10, CFSTR("[Parse failure: -[NSXMLParser parse] returned NO]\n"));

        v14 = v55;
      }

      goto LABEL_60;
    }
  }
  else
  {
    +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      -[CalDAVTrafficLogScrubber scrub].cold.1();

    if (v7)
LABEL_84:
      fclose(v7);
    if (!v10)
      goto LABEL_87;
  }
  fclose(v10);
LABEL_87:
  v2 = v71;
  v3 = v69;
  v4 = v70;
  if ((-[CADDiagnosticLogContext canceled](v71->_context, "canceled") & 1) == 0)
    +[CADDiagnosticsUtils compressFileAt:to:context:](CADDiagnosticsUtils, "compressFileAt:to:context:", v70, v71->_outputURL, v71->_context);
LABEL_89:
  -[CalDAVTrafficLogScrubber context](v2, "context");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "log:", CFSTR("...finished redacting log from %@"), v3);

  return 1;
}

- (id)temporaryUncompressedFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSURL URLByDeletingPathExtension](self->_outputURL, "URLByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingString:", CFSTR("~temp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CADDiagnosticLogContext temporaryFileForName:](self->_context, "temporaryFileForName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)decompressedInputFile
{
  id *v2;
  id *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  FILE *v13;
  id v14;
  FILE *v15;
  NSObject *v16;
  char v18;
  Bytef *next_in;
  size_t v20;
  char v21;
  int v22;
  int v23;
  char v24;
  NSObject *v25;
  int v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  int *v33;
  id *v34;
  id v35;
  void *v36;
  z_stream strm;
  uint8_t v38[4];
  int v39[3];
  uint8_t buf[4];
  int v41;
  _BYTE __ptr[32768];
  _BYTE v43[32768];
  uint64_t v44;

  v2 = (id *)MEMORY[0x1E0C80A78](self);
  v44 = *MEMORY[0x1E0C80C00];
  v3 = v2 + 2;
  objc_msgSend(v2[2], "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("gz"));

  if ((v5 & 1) == 0)
    return *v3;
  objc_msgSend(v2[3], "URLByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = objc_claimAutoreleasedReturnValue();

  v36 = (void *)v7;
  objc_msgSend(v2[4], "temporaryFileForName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2[2], "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = v10;
  memset(&strm.avail_out + 1, 0, 76);
  *(_OWORD *)&strm.avail_in = 0u;
  strm.next_in = v43;
  strm.next_out = __ptr;
  strm.avail_in = 0;
  strm.avail_out = 0x8000;
  v35 = objc_retainAutorelease(v11);
  v13 = fopen((const char *)objc_msgSend(v35, "fileSystemRepresentation"), "r");
  v14 = objc_retainAutorelease(v12);
  v15 = fopen((const char *)objc_msgSend(v14, "fileSystemRepresentation"), "w");
  if (!inflateInit2_(&strm, 47, "1.2.12", 112))
  {
    v34 = v2;
    v33 = &v41;
    v18 = 1;
    next_in = strm.next_in;
    while (1)
    {
      if (next_in != v43)
        -[CalDAVTrafficLogScrubber decompressedInputFile].cold.4();
      v20 = fread(&v43[strm.avail_in], 1uLL, 0x8000 - strm.avail_in, v13);
      if (v20)
        break;
      v26 = ferror(v13);
      if (v26)
      {
        v27 = v26;
        +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log", v33);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v41 = v27;
          _os_log_error_impl(&dword_1B6A18000, v28, OS_LOG_TYPE_ERROR, "error reading file: %i", buf, 8u);
        }
LABEL_31:

        v18 = 0;
      }
      else if (strm.avail_in)
      {
        goto LABEL_10;
      }
LABEL_32:
      v21 = 1;
LABEL_33:
      if (strm.next_in == v43)
      {
        +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[CalDAVTrafficLogScrubber decompressedInputFile].cold.2(buf, v33, v16);
        goto LABEL_40;
      }
      next_in = v43;
      __memmove_chk();
      strm.next_in = v43;
      if ((v21 & 1) != 0)
      {
        inflateEnd(&strm);
        fclose(v13);
        fclose(v15);

        v30 = v8;
        v29 = v36;
        if ((v18 & 1) != 0)
        {
          objc_msgSend(v34[1], "addObject:", v8);
          v32 = v8;
          goto LABEL_44;
        }
        goto LABEL_41;
      }
    }
    strm.avail_in += v20;
LABEL_10:
    v21 = 0;
    while (1)
    {
      v22 = inflate(&strm, 0);
      if (v22)
      {
        v23 = v22;
        if (v22 == 1)
        {
          v24 = 0;
        }
        else
        {
          +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v41 = v23;
            _os_log_error_impl(&dword_1B6A18000, v25, OS_LOG_TYPE_ERROR, "zlib gave an error: %i", buf, 8u);
          }

          v18 = 0;
          v24 = 1;
        }
        v21 = 1;
      }
      else
      {
        v24 = 1;
      }
      if (strm.avail_out >> 15)
        goto LABEL_33;
      if (fwrite(__ptr, 0x8000 - strm.avail_out, 1uLL, v15) != 1)
      {
        +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[CalDAVTrafficLogScrubber decompressedInputFile].cold.3(v38, v15, v39, v28);
        goto LABEL_31;
      }
      if ((v21 & 1) != 0)
      {
        if ((v24 & 1) == 0)
          goto LABEL_32;
      }
      else
      {
        strm.next_out = __ptr;
        strm.avail_out = 0x8000;
        if (!strm.avail_in)
        {
          v21 = 0;
          goto LABEL_33;
        }
      }
    }
  }
  +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[CalDAVTrafficLogScrubber decompressedInputFile].cold.5();
LABEL_40:
  v30 = v8;
  v29 = v36;

  inflateEnd(&strm);
  fclose(v13);
  fclose(v15);

LABEL_41:
  +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log", v33);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    -[CalDAVTrafficLogScrubber decompressedInputFile].cold.1((uint64_t *)v3, (uint64_t)v30, v31);

  v32 = 0;
LABEL_44:

  return v32;
}

- (void)compressFileAt:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  id v7;
  FILE *v8;
  NSObject *v9;
  id v10;
  FILE *v11;
  NSObject *v12;
  NSObject *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = fopen((const char *)objc_msgSend(v7, "fileSystemRepresentation"), "r");

  if (!v8)
  {
    +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CalDAVTrafficLogScrubber scrub].cold.2();

  }
  objc_msgSend(v6, "path");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = fopen((const char *)objc_msgSend(v10, "fileSystemRepresentation"), "w");

  if (!v11)
  {
    +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CalDAVTrafficLogScrubber scrub].cold.1();

  }
  if (CPFileCompressionZDeflate())
  {
    +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CalDAVTrafficLogScrubber compressFileAt:to:].cold.1();

  }
  if (v8)
    fclose(v8);
  if (v11)
    fclose(v11);

}

- (NSURL)inputURL
{
  return self->_inputURL;
}

- (void)setInputURL:(id)a3
{
  objc_storeStrong((id *)&self->_inputURL, a3);
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
  objc_storeStrong((id *)&self->_outputURL, a3);
}

- (CADDiagnosticLogContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_inputURL, 0);
  objc_storeStrong((id *)&self->_urlsToCleanUp, 0);
}

- (void)scrub
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6A18000, v0, v1, "Failed to open input file \"%@\": %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)decompressedInputFile
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_1B6A18000, v0, v1, "Error initializing inflate: %i", v2);
  OUTLINED_FUNCTION_1();
}

- (void)compressFileAt:to:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_1B6A18000, v0, v1, "Compressing file failed: %i", v2);
  OUTLINED_FUNCTION_1();
}

@end
