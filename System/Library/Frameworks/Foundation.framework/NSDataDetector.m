@implementation NSDataDetector

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

+ (NSDataDetector)dataDetectorWithTypes:(NSTextCheckingTypes)checkingTypes error:(NSError *)error
{
  return (NSDataDetector *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithTypes:error:", checkingTypes, error);
}

- (NSDataDetector)initWithTypes:(NSTextCheckingTypes)checkingTypes error:(NSError *)error
{
  NSDataDetector *v7;
  NSDataDetector *v8;
  void *v9;
  BOOL v10;
  int v11;
  uint64_t v12;
  NSString *v14;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((checkingTypes & 0x1838) == 0)
  {
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: no data detector types specified"), _NSMethodExceptionProem((objc_class *)self, a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0));
  }
  v15.receiver = self;
  v15.super_class = (Class)NSDataDetector;
  v7 = -[NSDataDetector init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_types = checkingTypes;
    qword_1ECD0A688 = (uint64_t)_NSFaultInObject((unint64_t *)&qword_1ECD0A688, 0, (uint64_t)&__block_literal_global_72);
    objc_msgSend((id)qword_1ECD0A688, "lock");
    if ((_MergedGlobals_146 & 1) == 0)
    {
      v9 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/DataDetectorsCore.framework/DataDetectorsCore"), "fileSystemRepresentation"), 256);
      qword_1ECD0A680 = (uint64_t)v9;
      if (v9)
      {
        off_1ECD0A648 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))dlsym(v9, "DDScannerCreate");
        off_1ECD0A690 = dlsym((void *)qword_1ECD0A680, "DDScannerReset");
        off_1ECD0A658 = dlsym((void *)qword_1ECD0A680, "DDScannerScanStringWithRange");
        off_1ECD0A650 = dlsym((void *)qword_1ECD0A680, "DDScannerSetProgressReportingBlock");
        off_1ECD0A670 = dlsym((void *)qword_1ECD0A680, "DDScannerCopyResults");
        off_1ECD0A668 = dlsym((void *)qword_1ECD0A680, "DDScannerCopyResultsCheckOverlap");
        off_1ECD0A660 = dlsym((void *)qword_1ECD0A680, "DDScannerCopyResultsWithOptions");
        off_1ECD0A698 = dlsym((void *)qword_1ECD0A680, "DDResultGetType");
        off_1ECD0A678 = dlsym((void *)qword_1ECD0A680, "DDResultGetRange");
        off_1ECD0A6A0 = dlsym((void *)qword_1ECD0A680, "DDResultGetRangeForURLification");
        off_1ECD0A6A8 = dlsym((void *)qword_1ECD0A680, "DDResultGetSubResults");
        off_1ECD0A6B0 = dlsym((void *)qword_1ECD0A680, "DDResultGetValue");
        *(_QWORD *)&xmmword_1ECD0A6B8 = dlsym((void *)qword_1ECD0A680, "DDResultCopyExtractedURL");
        *((_QWORD *)&xmmword_1ECD0A6B8 + 1) = dlsym((void *)qword_1ECD0A680, "DDResultCopyExtractedURLWithOptions");
        off_1ECD0A6C8 = dlsym((void *)qword_1ECD0A680, "DDResultCopyExtractedDateFromReferenceDate");
        off_1ECD0A6D0 = dlsym((void *)qword_1ECD0A680, "DDResultCopyExtractedStartDateEndDate");
        off_1ECD0A6D8 = dlsym((void *)qword_1ECD0A680, "DDResultCopyPhoneValue");
      }
      v10 = 0;
      _MergedGlobals_146 = 1;
      if (off_1ECD0A648)
      {
        if (off_1ECD0A690)
        {
          if (off_1ECD0A658)
          {
            if (off_1ECD0A650)
            {
              v10 = 0;
              if ((unint64_t)off_1ECD0A670 | (unint64_t)off_1ECD0A668 | (unint64_t)off_1ECD0A660)
              {
                if (off_1ECD0A698)
                {
                  if (off_1ECD0A678)
                  {
                    if (off_1ECD0A6A0)
                    {
                      if (off_1ECD0A6A8)
                      {
                        if (off_1ECD0A6B0)
                        {
                          v10 = 0;
                          if (xmmword_1ECD0A6B8 != 0)
                          {
                            if (off_1ECD0A6C8)
                              v10 = off_1ECD0A6D0 != 0;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      byte_1ECD0A641 = v10;
    }
    objc_msgSend((id)qword_1ECD0A688, "unlock");
    v11 = byte_1ECD0A641;
    if (byte_1ECD0A641)
    {
      v12 = off_1ECD0A648((checkingTypes & 0x1818) == 0, 1, error);
      v8->super._internal = (void *)v12;
      if (v12)
        return v8;
    }
    else if (v8->super._internal)
    {
      return v8;
    }
    if (error && !v11)
      *error = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 256, 0);
    -[NSDataDetector dealloc](v8, "dealloc");
    return 0;
  }
  return v8;
}

- (NSDataDetector)initWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  NSString *v6;

  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Not valid for NSDataDetector"), _NSMethodExceptionProem((objc_class *)self, a2));

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v6, 0));
}

- (void)encodeWithCoder:(id)a3
{
  NSTextCheckingTypes v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = -[NSDataDetector checkingTypes](self, "checkingTypes");
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a3, "encodeInt64:forKey:", v4, CFSTR("NSCheckingTypes"));
  }
  else
  {
    v5[0] = v4;
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "Q", v5);
  }
}

- (NSDataDetector)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  NSString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v6 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NSCheckingTypes"));
    return -[NSDataDetector initWithTypes:error:](self, "initWithTypes:error:", v6, 0);
  }
  v11[0] = 0;
  v7 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSDataDetector"));
  if (v7 == 1)
  {
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "Q", v11, 8);
    v6 = v11[0];
    return -[NSDataDetector initWithTypes:error:](self, "initWithTypes:error:", v6, 0);
  }
  v9 = v7;
  v10 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v10, 1, v9);
  -[NSDataDetector dealloc](self, "dealloc");
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  NSTextCheckingTypes v5;

  if (a3 == self)
    return 1;
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[NSDataDetector checkingTypes](self, "checkingTypes");
  return v5 == objc_msgSend(a3, "checkingTypes");
}

- (void)dealloc
{
  void *internal;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  internal = self->super._internal;
  if (internal)
  {
    CFRelease(internal);
    self->super._internal = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSDataDetector;
  -[NSRegularExpression dealloc](&v4, sel_dealloc);
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSDataDetector;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ 0x%llx"), -[NSRegularExpression description](&v3, sel_description), self->_types);
}

- (NSTextCheckingTypes)checkingTypes
{
  return self->_types;
}

- (id)pattern
{
  return 0;
}

- (unint64_t)options
{
  return 0;
}

- (unint64_t)numberOfCaptureGroups
{
  return 1;
}

- (void)enumerateMatchesInString:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 usingBlock:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  __int16 v9;
  unint64_t v13;
  void *internal;
  int *p_checkout;
  int v17;
  int v18;
  const __CFArray *v19;
  const __CFArray *v20;
  const void *ValueAtIndex;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSAddressCheckingResult *v33;
  NSLinkCheckingResult *v34;
  const void *v35;
  CFTypeID TypeID;
  NSPhoneNumberCheckingResult *v37;
  uint64_t v38;
  uint64_t v39;
  CFTypeRef v40;
  double v41;
  double v42;
  NSDateCheckingResult *v43;
  CFTypeRef v44;
  CFTypeRef v45;
  uint64_t v46;
  NSLinkCheckingResult *v47;
  int v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  void *cf;
  void (**v58)(id, NSLinkCheckingResult *, _QWORD, char *);
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  id v62;
  __int16 v63;
  NSUInteger v64;
  unint64_t v65;
  int v66;
  _QWORD v67[7];
  BOOL v68;
  char v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  NSUInteger v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  char v78;
  char v79;
  const void *v80;
  CFTypeRef v81;
  CFTypeRef v82;
  CFTypeRef v83[3];

  length = a5.length;
  location = a5.location;
  v9 = a4;
  v83[1] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v13 = objc_msgSend(a3, "length");
  v63 = -[NSDataDetector checkingTypes](self, "checkingTypes");
  v78 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v64 = location;
  v73 = location;
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __68__NSDataDetector_enumerateMatchesInString_options_range_usingBlock___block_invoke;
  v67[3] = &unk_1E0F52640;
  v68 = (v9 & 4) != 0;
  v69 = v9 & 1;
  v67[4] = a6;
  v67[5] = &v70;
  v58 = (void (**)(id, NSLinkCheckingResult *, _QWORD, char *))a6;
  v67[6] = &v74;
  v62 = a3;
  if (!a3)
  {
    v52 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v52);
  }
  v59 = v9 & 1;
  if (v13 < length || location > v13 - length)
  {
    v53 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range or index out of bounds"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v53);
  }
  v61 = v9 & 4;
  internal = self->super._internal;
  p_checkout = &self->super._checkout;
  do
  {
    if (__ldaxr((unsigned int *)p_checkout))
    {
      v17 = 0;
      __clrex();
      internal = (void *)off_1ECD0A648((v63 & 0x1818) == 0, 1, 0);
      if (!internal)
        goto LABEL_109;
LABEL_8:
      if ((v9 & 5) != 0)
        off_1ECD0A650(internal, v67);
      v18 = 0;
      if (off_1ECD0A658(internal, a3, v64, length))
      {
        LOBYTE(v66) = 0;
        if (!v78)
        {
          v66 = 0;
          v65 = v64 + length;
          v60 = v9;
          while (1)
          {
            if (*((_BYTE *)v75 + 24))
            {
              v18 = 0;
              goto LABEL_117;
            }
            if (off_1ECD0A660)
            {
              v19 = (const __CFArray *)off_1ECD0A660(internal, 3);
            }
            else if (off_1ECD0A668)
            {
              v19 = (const __CFArray *)off_1ECD0A668(internal, 1);
            }
            else
            {
              if (!off_1ECD0A670)
                goto LABEL_116;
              v19 = (const __CFArray *)off_1ECD0A670(internal);
            }
            v20 = v19;
            if (!v19)
            {
LABEL_116:
              v18 = 1;
              goto LABEL_117;
            }
            if (CFArrayGetCount(v19) < 1)
            {
              CFRelease(v20);
              goto LABEL_116;
            }
            ValueAtIndex = CFArrayGetValueAtIndex(v20, 0);
            v22 = off_1ECD0A678(ValueAtIndex);
            v24 = v22 + v23;
            v25 = v66;
            if (v65 == v22 + v23)
              v25 = 1;
            v66 = v25;
            if (!v61 || v22 <= v71[3])
            {
              v26 = off_1ECD0A678(ValueAtIndex);
              v28 = v27;
              v29 = off_1ECD0A6A0(ValueAtIndex);
              if (v29 != -1 && v30 >= 1 && v29 >= v26 && v29 + v30 <= v26 + v28)
              {
                v28 = v30;
                v26 = v29;
              }
              if (v26 >= v64 && v26 + v28 <= v65)
                break;
            }
LABEL_102:
            CFRelease(v20);
            if (v78 || (v71[3] = v24, v65 <= v24))
            {
              v18 = 0;
LABEL_113:
              LOBYTE(v9) = v60;
              goto LABEL_117;
            }
            v18 = 0;
            if (!off_1ECD0A658(internal, v62, v24, v65 - v24))
              goto LABEL_113;
            LOBYTE(v9) = v60;
            if (v78)
              goto LABEL_117;
          }
          v31 = (void *)off_1ECD0A698(ValueAtIndex);
          if ((v63 & 0x20) != 0
            && (!*(&xmmword_1ECD0A6B8 + 1)
              ? (cf = (void *)xmmword_1ECD0A6B8(ValueAtIndex))
              : (cf = (void *)((uint64_t (*)(const void *, _QWORD))*(&xmmword_1ECD0A6B8 + 1))(ValueAtIndex, 0)), cf))
          {
            if ((objc_msgSend(CFSTR("PhoneNumber"), "isEqualToString:", v31) & 1) == 0
              && (objc_msgSend(CFSTR("QuotedShortPhoneNumber"), "isEqualToString:", v31) & 1) == 0
              && (objc_msgSend(CFSTR("UnquotedShortPhoneNumber"), "isEqualToString:", v31) & 1) == 0)
            {
              v46 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", cf);
              if (v46
                || (v46 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", (id)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)objc_msgSend(cf, "stringByReplacingPercentEscapesUsingEncoding:", 4), CFSTR("#"), 0, 0x8000100u))) != 0)
              {
                v34 = -[NSLinkCheckingResult initWithRange:URL:]([NSLinkCheckingResult alloc], "initWithRange:URL:", v26, v28, v46);
              }
              else
              {
                v34 = 0;
              }
LABEL_96:
              CFRelease(cf);
LABEL_97:
              if (v34)
              {
                if ((v60 & 0x2000) != 0)
                  v47 = 0;
                else
                  v47 = v34;
                v58[2](v58, v47, 4 * (v66 & 1u), &v78);

              }
              goto LABEL_102;
            }
            v56 = 0;
          }
          else
          {
            cf = 0;
            v56 = 1;
          }
          if ((v63 & 0x10) != 0
            && ((objc_msgSend(CFSTR("FullAddress"), "isEqualToString:", v31) & 1) != 0
             || objc_msgSend(CFSTR("SignatureBlock"), "isEqualToString:", v31)))
          {
            v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            addAddressResultsToComponents((uint64_t)ValueAtIndex, v32);
            if (objc_msgSend(v32, "count"))
            {
              v33 = [NSAddressCheckingResult alloc];
              goto LABEL_52;
            }
            goto LABEL_63;
          }
          if ((v63 & 0x1000) != 0 && objc_msgSend(CFSTR("FlightInformation"), "isEqualToString:", v31))
          {
            v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            addAddressResultsToComponents((uint64_t)ValueAtIndex, v32);
            if (objc_msgSend(v32, "count"))
            {
              v33 = [NSTransitInformationCheckingResult alloc];
LABEL_52:
              v34 = -[NSAddressCheckingResult initWithRange:components:underlyingResult:](v33, "initWithRange:components:underlyingResult:", v26, v28, v32, ValueAtIndex);
              goto LABEL_95;
            }
            goto LABEL_63;
          }
          if ((v63 & 0x800) != 0 && objc_msgSend(CFSTR("PhoneNumber"), "isEqualToString:", v31))
          {
            v83[0] = 0;
            if (off_1ECD0A6D8 && off_1ECD0A6D8(ValueAtIndex, v83, 0) && v83[0]
              || (v35 = (const void *)off_1ECD0A6B0(ValueAtIndex), (v83[0] = v35) != 0) && (CFRetain(v35), v83[0]))
            {
              TypeID = CFStringGetTypeID();
              if (TypeID == CFGetTypeID(v83[0]))
              {
                v37 = [NSPhoneNumberCheckingResult alloc];
                v34 = -[NSPhoneNumberCheckingResult initWithRange:phoneNumber:underlyingResult:](v37, "initWithRange:phoneNumber:underlyingResult:", v26, v28, v83[0], ValueAtIndex);
              }
              else
              {
                v34 = 0;
              }
              v45 = v83[0];
              if (v83[0])
LABEL_94:
                CFRelease(v45);
LABEL_95:
              if ((v56 & 1) != 0)
                goto LABEL_97;
              goto LABEL_96;
            }
          }
          else if ((v63 & 8) != 0
                 && ((objc_msgSend(CFSTR("Date"), "isEqualToString:", v31) & 1) != 0
                  || (objc_msgSend(CFSTR("Time"), "isEqualToString:", v31) & 1) != 0
                  || (objc_msgSend(CFSTR("DateTime"), "isEqualToString:", v31) & 1) != 0
                  || (objc_msgSend(CFSTR("DateDuration"), "isEqualToString:", v31) & 1) != 0
                  || (objc_msgSend(CFSTR("TimeDuration"), "isEqualToString:", v31) & 1) != 0
                  || objc_msgSend(CFSTR("Timestamp"), "isEqualToString:", v31)))
          {
            v82 = 0;
            v83[0] = 0;
            v80 = 0;
            v81 = 0;
            v55 = objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v38 = objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
            v79 = 0;
            objc_msgSend(v31, "rangeOfString:", CFSTR("Duration"));
            if (!v39 || !off_1ECD0A6D0(ValueAtIndex, v83, &v81, &v82, &v80, &v79, v55, v38))
              off_1ECD0A6C8(ValueAtIndex, v55, v38, &v79, v83, &v81);
            v40 = v83[0];
            v41 = 0.0;
            if (v83[0] && v82)
            {
              v42 = MEMORY[0x186DA67A0]();
              v41 = v42 - MEMORY[0x186DA67A0](v83[0]);
              v40 = v83[0];
            }
            if (v40)
            {
              v43 = [NSDateCheckingResult alloc];
              if (v81)
                v44 = v81;
              else
                v44 = v80;
              LOWORD(v54) = v79 == 0;
              v34 = -[NSDateCheckingResult initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:](v43, "initWithRange:date:timeZone:duration:referenceDate:underlyingResult:timeIsSignificant:timeIsApproximate:", v26, v28, v83[0], v44, v55, ValueAtIndex, v41, v54);
              if (v83[0])
                CFRelease(v83[0]);
            }
            else
            {
              v34 = 0;
            }
            if (v81)
              CFRelease(v81);
            if (v82)
              CFRelease(v82);
            v45 = v80;
            if (v80)
              goto LABEL_94;
            goto LABEL_95;
          }
LABEL_63:
          v34 = 0;
          goto LABEL_95;
        }
      }
      else
      {
        LOBYTE(v66) = 0;
      }
LABEL_117:
      if (v59 || v61)
        off_1ECD0A650(internal, 0);
      v48 = v66 & 1;
      if ((v9 & 2) == 0)
        goto LABEL_129;
LABEL_121:
      if (!v78 && !*((_BYTE *)v75 + 24))
      {
        v49 = v48 == 0;
        v50 = 2;
        if (!v49)
          v50 = 6;
        if (v18)
          v51 = v50 | 0x10;
        else
          v51 = v50;
        v58[2](v58, 0, v51, &v78);
      }
      goto LABEL_129;
    }
    v17 = 1;
  }
  while (__stlxr(1u, (unsigned int *)p_checkout));
  if (internal)
    goto LABEL_8;
LABEL_109:
  v48 = 0;
  v18 = 0;
  if ((v9 & 2) != 0)
    goto LABEL_121;
LABEL_129:
  if (internal)
  {
    if (v17)
    {
      off_1ECD0A690(internal);
      do
        __ldaxr((unsigned int *)p_checkout);
      while (__stlxr(0, (unsigned int *)p_checkout));
    }
    else
    {
      CFRelease(internal);
    }
  }
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
}

uint64_t __68__NSDataDetector_enumerateMatchesInString_options_range_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 56) && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < a2 >> 32)
    return 0;
  v2 = 1;
  if (*(_BYTE *)(a1 + 57))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v2;
}

@end
