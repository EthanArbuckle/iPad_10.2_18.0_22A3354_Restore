@implementation BSDescriptionStream

- (void)appendString:(id)a3 withName:(id)a4
{
  -[BSDescriptionStream appendString:withName:skipIfEmpty:](self, "appendString:withName:skipIfEmpty:", a3, a4, 0);
}

- (id)appendInteger:(int64_t)a3 withName:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, CFSTR("%td"), (uint64_t)a4, v4, v5, v6, v7, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)descriptionForRootObject:(id)a3
{
  BSDescriptionStream *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(BSDescriptionStream);
  -[BSDescriptionStream appendObject:withName:](v4, "appendObject:withName:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)appendObject:(id)a3 withName:(id)a4
{
  return -[BSDescriptionStream appendObject:withName:skipIfNil:](self, "appendObject:withName:skipIfNil:", a3, a4, 0);
}

- (id)appendObject:(id)a3 withName:(id)a4 skipIfNil:(BOOL)a5
{
  BSDescriptionStyle *v8;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  NSMutableString **p_string;
  const char *v16;
  int64_t v17;
  unsigned __int8 *v18;
  int64_t indentLevel;
  const char *v20;
  size_t v21;
  int64_t v22;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v26;
  int64_t v27;
  CFIndex v28;
  int *v29;
  unint64_t v30;
  int64_t v31;
  unsigned __int8 *v32;
  uint64_t v33;
  int64_t v34;
  unsigned __int8 *v35;
  int64_t v36;
  unsigned __int8 *v37;
  const char *v38;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v42;
  CFIndex v43;
  int64_t v44;
  CFIndex v45;
  int64_t v46;
  unsigned __int8 *v47;
  id v48;
  int v49;
  int64_t v50;
  NSMutableString *string;
  double v52;
  const __CFString *v53;
  int64_t v54;
  NSMutableString *v55;
  uint64_t v56;
  int64_t v57;
  const __CFString *v58;
  int64_t v59;
  int64_t v60;
  int64_t v61;
  int64_t v62;
  int64_t v63;
  float v64;
  int64_t v65;
  int64_t v66;
  int64_t v67;
  int64_t v68;
  int64_t v69;
  BSDescriptionStream *v70;
  BSDescriptionStyle *style;
  __CFString *v73;
  __CFString *v74;
  CFIndex v75;
  int64_t v76;
  CFIndex v77;
  CFIndex usedBufLen;
  uint64_t v79;
  void *v80;
  void *v81;
  BSDescriptionStream *v82;
  CFRange v83;
  CFRange v84;
  CFRange v85;
  CFRange v86;
  CFRange v87;
  CFRange v88;

  if (a3 || !a5)
  {
    v8 = self->_style;
    switch(self->_emitPhase)
    {
      case 1:
        p_appendBufferCount = &self->_appendBufferCount;
        appendBufferCount = self->_appendBufferCount;
        appendBuffer = self->_appendBuffer;
        if (self->_style->_collectionLineBreak == 3)
        {
          if (appendBufferCount > 1022)
          {
            appendBuffer[appendBufferCount] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
            self->_appendBufferCount = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
          }
          else
          {
            appendBuffer[appendBufferCount] = 59;
            ++*p_appendBufferCount;
          }
          goto LABEL_13;
        }
        if (appendBufferCount <= 1021)
        {
          *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
          v14 = 2;
          goto LABEL_21;
        }
        appendBuffer[appendBufferCount] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
        p_string = &self->_string;
        v16 = "; ";
        goto LABEL_26;
      case 2:
        p_appendBufferCount = &self->_appendBufferCount;
        v12 = self->_appendBufferCount;
        v13 = self->_appendBuffer;
        if (v12 <= 1022)
        {
          v13[v12] = 32;
          v14 = 1;
          goto LABEL_21;
        }
        v13[v12] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v13, 0x8000100u);
        p_string = &self->_string;
        v16 = " ";
LABEL_26:
        *p_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)*p_string, v16, 0x8000100u);
        break;
      case 3:
LABEL_13:
        v17 = self->_appendBufferCount;
        v18 = self->_appendBuffer;
        if (v17 > 1022)
        {
          v18[v17] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v18, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
        }
        else
        {
          v18[v17] = 10;
          ++self->_appendBufferCount;
        }
        goto LABEL_16;
      case 4:
LABEL_16:
        indentLevel = self->_indentLevel;
        if (indentLevel < 1)
          break;
        if (indentLevel >= 8)
          indentLevel = 8;
        v20 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
        v21 = strlen(v20);
        p_appendBufferCount = &self->_appendBufferCount;
        v22 = self->_appendBufferCount;
        if ((uint64_t)(v22 + v21) > 1023)
        {
          if (v22 >= 1)
          {
            self->_appendBuffer[v22] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            *p_appendBufferCount = 0;
          }
          CFStringAppendCString((CFMutableStringRef)self->_string, v20, 0x8000100u);
        }
        else
        {
          v14 = v21;
          memcpy(&self->_appendBuffer[v22], v20, v21);
LABEL_21:
          *p_appendBufferCount += v14;
        }
        break;
      default:
        goto LABEL_28;
    }
    self->_emitPhase = 0;
LABEL_28:
    if (!a4)
      goto LABEL_60;
    nameTruncation = v8->_nameTruncation;
    maximumNameLengthBeforeTruncation = v8->_maximumNameLengthBeforeTruncation;
    if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
    {
      self->_lineTruncation = 0;
    }
    else
    {
      self->_lineTruncation = nameTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
    }
    v26 = objc_msgSend(a4, "length");
    v27 = self->_appendBufferCount;
    if (v27 + 3 * v26 > 1023)
    {
      if (v27 >= 1)
      {
        self->_appendBuffer[v27] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      if (v26 > 341)
      {
        -[NSMutableString appendString:](self->_string, "appendString:", a4);
        goto LABEL_43;
      }
      usedBufLen = 0;
      v84.location = 0;
      v84.length = v26;
      CFStringGetBytes((CFStringRef)a4, v84, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      v28 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v83.location = 0;
      v83.length = v26;
      CFStringGetBytes((CFStringRef)a4, v83, 0x8000100u, 0, 0, &self->_appendBuffer[v27], 1024 - v27, &usedBufLen);
      v28 = self->_appendBufferCount + usedBufLen;
    }
    self->_appendBufferCount = v28;
LABEL_43:
    BSDescribeTruncationCommit((uint64_t)self);
    if (self->_proemNestCount <= 0)
      v29 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
    else
      v29 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
    v30 = *(unint64_t *)((char *)&self->_style->super.isa + *v29);
    if (v30 < 2)
    {
      v34 = self->_appendBufferCount;
      v35 = self->_appendBuffer;
      if (v34 <= 1021)
      {
        *(_WORD *)&v35[v34] = 8250;
        v33 = 2;
        goto LABEL_55;
      }
      v35[v34] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v35, 0x8000100u);
      v38 = ": ";
    }
    else if (v30 == 2)
    {
      v36 = self->_appendBufferCount;
      v37 = &self->_appendBuffer[v36];
      if (v36 <= 1020)
      {
        v37[2] = 32;
        *(_WORD *)v37 = 15648;
        v33 = 3;
        goto LABEL_55;
      }
      *v37 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      v38 = " = ";
    }
    else
    {
      if (v30 != 3)
        goto LABEL_60;
      v31 = self->_appendBufferCount;
      v32 = self->_appendBuffer;
      if (v31 <= 1019)
      {
        *(_DWORD *)&v32[v31] = 540945696;
        v33 = 4;
LABEL_55:
        self->_appendBufferCount += v33;
        goto LABEL_60;
      }
      v32[v31] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v32, 0x8000100u);
      v38 = " -> ";
    }
    self->_appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, v38, 0x8000100u);
LABEL_60:
    valueTruncation = v8->_valueTruncation;
    maximumValueLengthBeforeTruncation = v8->_maximumValueLengthBeforeTruncation;
    if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
    {
      maximumValueLengthBeforeTruncation = 0;
      v42 = 1096;
    }
    else
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      v42 = 1088;
    }
    *(Class *)((char *)&self->super.isa + v42) = (Class)maximumValueLengthBeforeTruncation;

    if (!a3)
    {
      v46 = self->_appendBufferCount;
      v47 = &self->_appendBuffer[v46];
      if (v46 > 1018)
      {
        *v47 = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
LABEL_143:
        self->_emitPhase = 1;
        BSDescribeTruncationCommit((uint64_t)self);
        goto LABEL_144;
      }
      v47[4] = 62;
      *(_DWORD *)v47 = 1818848828;
      v45 = self->_appendBufferCount + 5;
LABEL_83:
      self->_appendBufferCount = v45;
      goto LABEL_143;
    }
    if (_NSIsNSString())
    {
      v43 = objc_msgSend(a3, "length");
      v44 = self->_appendBufferCount;
      if (3 * v43 + v44 > 1023)
      {
        if (v44 >= 1)
        {
          self->_appendBuffer[v44] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
        }
        if (v43 > 341)
        {
          -[NSMutableString appendString:](self->_string, "appendString:", a3);
          goto LABEL_143;
        }
        usedBufLen = 0;
        v86.location = 0;
        v86.length = v43;
        CFStringGetBytes((CFStringRef)a3, v86, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
        v45 = usedBufLen;
      }
      else
      {
        usedBufLen = 0;
        v85.location = 0;
        v85.length = v43;
        CFStringGetBytes((CFStringRef)a3, v85, 0x8000100u, 0, 0, &self->_appendBuffer[v44], 1024 - v44, &usedBufLen);
        v45 = self->_appendBufferCount + usedBufLen;
      }
      goto LABEL_83;
    }
    if (_NSIsNSNumber())
    {
      v48 = objc_retainAutorelease(a3);
      v49 = *(char *)objc_msgSend(v48, "objCType");
      if (v49 > 80)
      {
        switch(v49)
        {
          case 'c':
            goto LABEL_102;
          case 'd':
            v50 = self->_appendBufferCount;
            if (v50 >= 1)
            {
              self->_appendBuffer[v50] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_appendBufferCount = 0;
            }
            string = self->_string;
            objc_msgSend(v48, "doubleValue");
            v53 = CFSTR("%0.16g");
            goto LABEL_124;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_116;
          case 'f':
            v63 = self->_appendBufferCount;
            if (v63 >= 1)
            {
              self->_appendBuffer[v63] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_appendBufferCount = 0;
            }
            string = self->_string;
            objc_msgSend(v48, "floatValue");
            v52 = v64;
            v53 = CFSTR("%0.7g");
LABEL_124:
            -[NSMutableString appendFormat:](string, "appendFormat:", v53, *(_QWORD *)&v52);
            goto LABEL_142;
          case 'i':
            v65 = self->_appendBufferCount;
            if (v65 >= 1)
            {
              self->_appendBuffer[v65] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_appendBufferCount = 0;
            }
            v55 = self->_string;
            v56 = objc_msgSend(v48, "intValue");
            goto LABEL_128;
          case 'l':
            v66 = self->_appendBufferCount;
            if (v66 >= 1)
            {
              self->_appendBuffer[v66] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_appendBufferCount = 0;
            }
            v55 = self->_string;
            v56 = objc_msgSend(v48, "longValue");
            v58 = CFSTR("%ld");
            goto LABEL_141;
          case 'q':
            v67 = self->_appendBufferCount;
            if (v67 >= 1)
            {
              self->_appendBuffer[v67] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_appendBufferCount = 0;
            }
            v55 = self->_string;
            v56 = objc_msgSend(v48, "longLongValue");
            v58 = CFSTR("%lld");
            goto LABEL_141;
          case 's':
            v68 = self->_appendBufferCount;
            if (v68 >= 1)
            {
              self->_appendBuffer[v68] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_appendBufferCount = 0;
            }
            v55 = self->_string;
            v56 = objc_msgSend(v48, "shortValue");
            v58 = CFSTR("%hi");
            goto LABEL_141;
          default:
            if (v49 == 81)
            {
              v69 = self->_appendBufferCount;
              if (v69 >= 1)
              {
                self->_appendBuffer[v69] = 0;
                CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
                self->_appendBufferCount = 0;
              }
              v55 = self->_string;
              v56 = objc_msgSend(v48, "unsignedLongLongValue");
              v58 = CFSTR("%llu");
            }
            else
            {
              if (v49 != 83)
                goto LABEL_116;
              v60 = self->_appendBufferCount;
              if (v60 >= 1)
              {
                self->_appendBuffer[v60] = 0;
                CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
                self->_appendBufferCount = 0;
              }
              v55 = self->_string;
              v56 = objc_msgSend(v48, "unsignedShortValue");
              v58 = CFSTR("%hu");
            }
            break;
        }
        goto LABEL_141;
      }
      if (v49 > 72)
      {
        if (v49 == 73)
        {
          v61 = self->_appendBufferCount;
          if (v61 >= 1)
          {
            self->_appendBuffer[v61] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_appendBufferCount = 0;
          }
          v55 = self->_string;
          v56 = objc_msgSend(v48, "unsignedIntValue");
          goto LABEL_115;
        }
        if (v49 == 76)
        {
          v57 = self->_appendBufferCount;
          if (v57 >= 1)
          {
            self->_appendBuffer[v57] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_appendBufferCount = 0;
          }
          v55 = self->_string;
          v56 = objc_msgSend(v48, "unsignedLongValue");
          v58 = CFSTR("%lu");
          goto LABEL_141;
        }
      }
      else
      {
        if (v49 == 66)
        {
LABEL_102:
          v59 = self->_appendBufferCount;
          if (v59 >= 1)
          {
            self->_appendBuffer[v59] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_appendBufferCount = 0;
          }
          v55 = self->_string;
          v56 = objc_msgSend(v48, "charValue");
LABEL_128:
          v58 = CFSTR("%d");
          goto LABEL_141;
        }
        if (v49 == 67)
        {
          v54 = self->_appendBufferCount;
          if (v54 >= 1)
          {
            self->_appendBuffer[v54] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_appendBufferCount = 0;
          }
          v55 = self->_string;
          v56 = objc_msgSend(v48, "unsignedCharValue");
LABEL_115:
          v58 = CFSTR("%u");
LABEL_141:
          -[NSMutableString appendFormat:](v55, "appendFormat:", v58, v56);
LABEL_142:

          goto LABEL_143;
        }
      }
LABEL_116:
      v62 = self->_appendBufferCount;
      if (v62 >= 1)
      {
        self->_appendBuffer[v62] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      -[NSMutableString appendFormat:](self->_string, "appendFormat:", CFSTR("<***unknown type:%s>"), objc_msgSend(objc_retainAutorelease(v48), "objCType"));
      goto LABEL_142;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a3, "appendDescriptionToStream:", self);
      goto LABEL_143;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a3, "appendDescriptionToFormatter:", self);
      goto LABEL_143;
    }
    if (_NSIsNSDictionary())
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v79 = 3221225472;
      v80 = __BSDescribeAppendObjectDescription_block_invoke;
      v81 = &unk_1E1EBFB08;
      v82 = self;
      -[BSDescriptionStream _appendDictionary:withName:itemBlock:]((uint64_t)self, a3, 0, (uint64_t)&usedBufLen);
      goto LABEL_143;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[BSDescriptionStream appendIntegerSet:withName:format:](self, "appendIntegerSet:withName:format:", a3, 0, 0);
      goto LABEL_143;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v79 = 3221225472;
      v80 = __BSDescribeAppendObjectDescription_block_invoke_2;
      v81 = &unk_1E1EBFB30;
      v82 = self;
      -[BSDescriptionStream appendIntegerMap:withName:keyFormat:valueBlock:](self, "appendIntegerMap:withName:keyFormat:valueBlock:", a3, 0, 0, &usedBufLen);
      goto LABEL_143;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v79 = 3221225472;
      v80 = __BSDescribeAppendObjectDescription_block_invoke_3;
      v81 = &unk_1E1EBFB30;
      v82 = self;
      -[BSDescriptionStream appendCollection:withName:itemBlock:](self, "appendCollection:withName:itemBlock:", a3, 0, &usedBufLen);
      goto LABEL_143;
    }
    if (self->_forceSuccinct || (style = self->_style, style->_verbosity == 2))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(a3, "succinctDescription");
        v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_156;
      }
      style = self->_style;
    }
    if (style->_debugging == 2)
      objc_msgSend(a3, "debugDescription");
    else
      objc_msgSend(a3, "description");
    v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_156:
    v74 = v73;
    v75 = -[__CFString length](v73, "length");
    v76 = self->_appendBufferCount;
    if (v76 + 3 * v75 > 1023)
    {
      if (v76 >= 1)
      {
        self->_appendBuffer[v76] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      if (v75 > 341)
      {
        -[NSMutableString appendString:](self->_string, "appendString:", v74);
        goto LABEL_164;
      }
      usedBufLen = 0;
      v88.location = 0;
      v88.length = v75;
      CFStringGetBytes(v74, v88, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      v77 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v87.location = 0;
      v87.length = v75;
      CFStringGetBytes(v74, v87, 0x8000100u, 0, 0, &self->_appendBuffer[v76], 1024 - v76, &usedBufLen);
      v77 = self->_appendBufferCount + usedBufLen;
    }
    self->_appendBufferCount = v77;
LABEL_164:

    goto LABEL_143;
  }
LABEL_144:
  v70 = self;
  return self;
}

- (id)description
{
  int64_t appendBufferCount;

  appendBufferCount = self->_appendBufferCount;
  if (appendBufferCount >= 1)
  {
    self->_appendBuffer[appendBufferCount] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
  }
  return self->_string;
}

- (BSDescriptionStream)init
{
  BSDescriptionStream *v2;
  NSMutableString *v3;
  NSMutableString *string;
  uint64_t v5;
  BSDescriptionStyle *style;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BSDescriptionStream;
  v2 = -[BSDescriptionStream init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    string = v2->_string;
    v2->_string = v3;

    _BSDefaultDescriptionStyle();
    v5 = objc_claimAutoreleasedReturnValue();
    style = v2->_style;
    v2->_style = (BSDescriptionStyle *)v5;

  }
  return v2;
}

- (void)appendCollection:(id)a3 withName:(id)a4 itemBlock:(id)a5
{
  int v9;
  BSDescriptionStyle *v10;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  NSMutableString **p_string;
  const char *v18;
  int64_t v19;
  unsigned __int8 *v20;
  int64_t indentLevel;
  const char *v22;
  size_t v23;
  int64_t v24;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  uint64_t v28;
  CFIndex v29;
  int64_t v30;
  CFIndex v31;
  int *v32;
  unint64_t v33;
  int64_t v34;
  unsigned __int8 *v35;
  uint64_t v36;
  int64_t v37;
  unsigned __int8 *v38;
  int64_t v39;
  unsigned __int8 *v40;
  const char *v41;
  objc_class *v42;
  int64_t valueTruncation;
  uint64_t v44;
  uint64_t maximumValueLengthBeforeTruncation;
  uint64_t v46;
  BSDescriptionStyle *style;
  int64_t maximumItemCountForTruncation;
  BOOL v49;
  unint64_t v50;
  __CFString *v51;
  __CFString *v52;
  _QWORD v53[8];
  char v54;
  BOOL v55;
  CFIndex usedBufLen;
  CFRange v57;
  CFRange v58;

  v9 = _NSIsNSSet();
  if (!a4)
    goto LABEL_62;
  v10 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_12;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v16 = 2;
        goto LABEL_20;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v18 = "; ";
      goto LABEL_25;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v14 = self->_appendBufferCount;
      v15 = self->_appendBuffer;
      if (v14 <= 1022)
      {
        v15[v14] = 32;
        v16 = 1;
        goto LABEL_20;
      }
      v15[v14] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v15, 0x8000100u);
      p_string = &self->_string;
      v18 = " ";
LABEL_25:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v18, 0x8000100u);
      break;
    case 3:
LABEL_12:
      v19 = self->_appendBufferCount;
      v20 = self->_appendBuffer;
      if (v19 > 1022)
      {
        v20[v19] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v20, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v20[v19] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_15;
    case 4:
LABEL_15:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v22 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v23 = strlen(v22);
      p_appendBufferCount = &self->_appendBufferCount;
      v24 = self->_appendBufferCount;
      if ((uint64_t)(v24 + v23) > 1023)
      {
        if (v24 >= 1)
        {
          self->_appendBuffer[v24] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v22, 0x8000100u);
      }
      else
      {
        v16 = v23;
        memcpy(&self->_appendBuffer[v24], v22, v23);
LABEL_20:
        *p_appendBufferCount += v16;
      }
      break;
    default:
      goto LABEL_27;
  }
  self->_emitPhase = 0;
LABEL_27:
  nameTruncation = v10->_nameTruncation;
  maximumNameLengthBeforeTruncation = v10->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    maximumNameLengthBeforeTruncation = 0;
    v28 = 1096;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v28 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v28) = (Class)maximumNameLengthBeforeTruncation;
  v29 = objc_msgSend(a4, "length");
  v30 = self->_appendBufferCount;
  if (v30 + 3 * v29 <= 1023)
  {
    usedBufLen = 0;
    v57.location = 0;
    v57.length = v29;
    CFStringGetBytes((CFStringRef)a4, v57, 0x8000100u, 0, 0, &self->_appendBuffer[v30], 1024 - v30, &usedBufLen);
    v31 = self->_appendBufferCount + usedBufLen;
LABEL_39:
    self->_appendBufferCount = v31;
    goto LABEL_41;
  }
  if (v30 >= 1)
  {
    self->_appendBuffer[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
  }
  if (v29 <= 341)
  {
    usedBufLen = 0;
    v58.location = 0;
    v58.length = v29;
    CFStringGetBytes((CFStringRef)a4, v58, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v31 = usedBufLen;
    goto LABEL_39;
  }
  -[NSMutableString appendString:](self->_string, "appendString:", a4);
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v32 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v32 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v33 = *(unint64_t *)((char *)&self->_style->super.isa + *v32);
  if (v33 < 2)
  {
    v37 = self->_appendBufferCount;
    v38 = self->_appendBuffer;
    if (v37 <= 1021)
    {
      *(_WORD *)&v38[v37] = 8250;
      v36 = 2;
      goto LABEL_53;
    }
    v38[v37] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v38, 0x8000100u);
    v41 = ": ";
  }
  else if (v33 == 2)
  {
    v39 = self->_appendBufferCount;
    v40 = &self->_appendBuffer[v39];
    if (v39 <= 1020)
    {
      v40[2] = 32;
      *(_WORD *)v40 = 15648;
      v36 = 3;
      goto LABEL_53;
    }
    *v40 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v41 = " = ";
  }
  else
  {
    if (v33 != 3)
      goto LABEL_58;
    v34 = self->_appendBufferCount;
    v35 = self->_appendBuffer;
    if (v34 <= 1019)
    {
      *(_DWORD *)&v35[v34] = 540945696;
      v36 = 4;
LABEL_53:
      self->_appendBufferCount += v36;
      goto LABEL_58;
    }
    v35[v34] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v35, 0x8000100u);
    v41 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v41, 0x8000100u);
LABEL_58:
  v42 = 0;
  valueTruncation = v10->_valueTruncation;
  v44 = 1096;
  if (valueTruncation >= 2)
  {
    maximumValueLengthBeforeTruncation = v10->_maximumValueLengthBeforeTruncation;
    if (maximumValueLengthBeforeTruncation >= 1)
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      v44 = 1088;
      v42 = (objc_class *)maximumValueLengthBeforeTruncation;
    }
  }
  *(Class *)((char *)&self->super.isa + v44) = v42;

LABEL_62:
  v46 = objc_msgSend(a3, "count");
  style = self->_style;
  if (style->_collectionTruncationStyle == 2)
  {
    maximumItemCountForTruncation = style->_maximumItemCountForTruncation;
    v49 = maximumItemCountForTruncation < v46;
    if (maximumItemCountForTruncation < v46)
      v50 = maximumItemCountForTruncation + 1;
    else
      v50 = v46;
  }
  else
  {
    v49 = 0;
    v50 = v46;
  }
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __59__BSDescriptionStream_appendCollection_withName_itemBlock___block_invoke;
  v53[3] = &unk_1E1EBF8E0;
  v53[4] = a3;
  v53[5] = self;
  if (v9)
    v51 = CFSTR("(");
  else
    v51 = CFSTR("[");
  if (v9)
    v52 = CFSTR(")");
  else
    v52 = CFSTR("]");
  v54 = v9;
  v55 = v49;
  v53[6] = a5;
  v53[7] = v50;
  -[BSDescriptionStream _appendSectionWithTotalItemCount:truncatedItemCount:openDelimiter:closeDelimiter:block:]((uint64_t)self, v46, v50, v51, v52, (uint64_t)v53);
  if (a4)
  {
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
  }
}

- (void)appendProem:(id)a3 block:(id)a4
{
  _QWORD v5[7];

  ++self->_proemNestCount;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__BSDescriptionStream_appendProem_block___block_invoke;
  v5[3] = &unk_1E1EBFA70;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  -[BSDescriptionStream _overrideCollectionLineBreaking:force:block:](self, 2, 1, (uint64_t)v5);
  --self->_proemNestCount;
}

void __41__BSDescriptionStream_appendProem_block___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__BSDescriptionStream_appendProem_block___block_invoke_2;
  v5[3] = &unk_1E1EBFA70;
  v2 = a1[4];
  v4 = a1[5];
  v3 = a1[6];
  v5[4] = v4;
  v5[5] = v2;
  v5[6] = v3;
  if (v2)
    -[BSDescriptionStream _appendSectionWithTotalItemCount:truncatedItemCount:openDelimiter:closeDelimiter:block:](v2, -1, 0xFFFFFFFFFFFFFFFFLL, CFSTR("<"), CFSTR(">"), (uint64_t)v5);
}

- (void)_appendSectionWithTotalItemCount:(unint64_t)a3 truncatedItemCount:(__CFString *)a4 openDelimiter:(__CFString *)a5 closeDelimiter:(uint64_t)a6 block:
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  __CFString *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  size_t v24;
  uint64_t v25;
  size_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFIndex v31;
  uint64_t v32;
  CFIndex v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  size_t v38;
  uint64_t v39;
  size_t v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  CFIndex v47;
  uint64_t v48;
  CFIndex v49;
  _QWORD v50[9];
  BOOL v51;
  CFIndex usedBufLen;
  CFRange v53;
  CFRange v54;
  CFRange v55;
  CFRange v56;

  if (a1)
  {
    v12 = *(_QWORD *)(a1 + 1104);
    if (v12 == 1)
    {
      v12 = 0;
      *(_QWORD *)(a1 + 1104) = 0;
    }
    v13 = *(_QWORD *)(a1 + 1112);
    *(_QWORD *)(a1 + 1112) = a3;
    if (!a3
      || (v14 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 24), v14 != 3) && !*(_BYTE *)(a1 + 1057) && (a3 < 2 || v14 == 2))
    {
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __110__BSDescriptionStream__appendSectionWithTotalItemCount_truncatedItemCount_openDelimiter_closeDelimiter_block___block_invoke;
      v50[3] = &unk_1E1EBFA98;
      v51 = a2 != a3;
      v50[7] = a6;
      v50[8] = a2;
      v50[4] = a1;
      v50[5] = a4;
      v50[6] = a5;
      -[BSDescriptionStream _overrideCollectionLineBreaking:force:block:]((_QWORD *)a1, 2, 0, (uint64_t)v50);
LABEL_87:
      *(_QWORD *)(a1 + 1112) = v13;
      return;
    }
    if (v12 != 4)
    {
      if (v12 != 3)
      {
        if (v12 != 2)
          goto LABEL_30;
        v15 = *(_QWORD *)(a1 + 1040);
        v16 = (const char *)(a1 + 16);
        if (v15 <= 1022)
        {
          v16[v15] = 32;
          v17 = *(_QWORD *)(a1 + 1040) + 1;
LABEL_24:
          *(_QWORD *)(a1 + 1040) = v17;
          goto LABEL_29;
        }
        v16[v15] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v16, 0x8000100u);
        *(_QWORD *)(a1 + 1040) = 0;
        v20 = *(__CFString **)(a1 + 1064);
        v21 = " ";
        goto LABEL_28;
      }
      v18 = *(_QWORD *)(a1 + 1040);
      v19 = (const char *)(a1 + 16);
      if (v18 > 1022)
      {
        v19[v18] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v19, 0x8000100u);
        *(_QWORD *)(a1 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
      }
      else
      {
        v19[v18] = 10;
        ++*(_QWORD *)(a1 + 1040);
      }
    }
    v22 = *(_QWORD *)(a1 + 1072);
    if (v22 < 1)
    {
LABEL_29:
      *(_QWORD *)(a1 + 1104) = 0;
LABEL_30:
      if (a2 != a3)
      {
        v27 = *(_QWORD *)(a1 + 1040);
        v28 = a1 + 16;
        if (v27 > 1022)
        {
          *(_BYTE *)(v28 + v27) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
          *(_QWORD *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "|", 0x8000100u);
          v29 = *(_QWORD *)(a1 + 1040);
        }
        else
        {
          *(_BYTE *)(v28 + v27) = 124;
          v29 = *(_QWORD *)(a1 + 1040) + 1;
          *(_QWORD *)(a1 + 1040) = v29;
        }
        if (v29 >= 1)
        {
          *(_BYTE *)(v28 + v29) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
          *(_QWORD *)(a1 + 1040) = 0;
        }
        objc_msgSend(*(id *)(a1 + 1064), "appendFormat:", CFSTR("%d"), a2);
        v30 = *(_QWORD *)(a1 + 1040);
        if (v30 > 1021)
        {
          *(_BYTE *)(v28 + v30) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
          *(_QWORD *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "| ", 0x8000100u);
        }
        else
        {
          *(_WORD *)(v28 + v30) = 8316;
          *(_QWORD *)(a1 + 1040) += 2;
        }
      }
      v31 = -[__CFString length](a4, "length");
      v32 = *(_QWORD *)(a1 + 1040);
      if (3 * v31 + v32 > 1023)
      {
        if (v32 >= 1)
        {
          *(_BYTE *)(a1 + 16 + v32) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
          *(_QWORD *)(a1 + 1040) = 0;
        }
        if (v31 > 341)
        {
          objc_msgSend(*(id *)(a1 + 1064), "appendString:", a4);
          v33 = *(_QWORD *)(a1 + 1040);
LABEL_47:
          v34 = a1 + 16;
          if (v33 > 1022)
          {
            *(_BYTE *)(v34 + v33) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
            *(_QWORD *)(a1 + 1040) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
          }
          else
          {
            *(_BYTE *)(v34 + v33) = 10;
            ++*(_QWORD *)(a1 + 1040);
          }
          *(_QWORD *)(a1 + 1104) = 4;
          ++*(_QWORD *)(a1 + 1072);
          (*(void (**)(uint64_t))(a6 + 16))(a6);
          v35 = *(_QWORD *)(a1 + 1104);
          if (v35 == 3)
          {
            *(_QWORD *)(a1 + 1104) = 4;
            v36 = *(_QWORD *)(a1 + 1072) - 1;
            *(_QWORD *)(a1 + 1072) = v36;
          }
          else
          {
            v36 = *(_QWORD *)(a1 + 1072) - 1;
            *(_QWORD *)(a1 + 1072) = v36;
            switch(v35)
            {
              case 1:
                v45 = *(_QWORD *)(a1 + 1040);
                if (*(_QWORD *)(*(_QWORD *)(a1 + 8) + 24) != 3)
                {
                  if (v45 <= 1021)
                  {
                    *(_WORD *)(v34 + v45) = 8251;
                    v41 = *(_QWORD *)(a1 + 1040) + 2;
                    goto LABEL_71;
                  }
                  *(_BYTE *)(v34 + v45) = 0;
                  CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
                  *(_QWORD *)(a1 + 1040) = 0;
                  v43 = *(__CFString **)(a1 + 1064);
                  v44 = "; ";
                  goto LABEL_76;
                }
                if (v45 > 1022)
                {
                  *(_BYTE *)(v34 + v45) = 0;
                  CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
                  *(_QWORD *)(a1 + 1040) = 0;
                  CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), ";", 0x8000100u);
                  v46 = *(_QWORD *)(a1 + 1040);
                }
                else
                {
                  *(_BYTE *)(v34 + v45) = 59;
                  v46 = *(_QWORD *)(a1 + 1040) + 1;
                  *(_QWORD *)(a1 + 1040) = v46;
                }
                if (v46 > 1022)
                {
                  *(_BYTE *)(v34 + v46) = 0;
                  CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
                  *(_QWORD *)(a1 + 1040) = 0;
                  CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
                }
                else
                {
                  *(_BYTE *)(v34 + v46) = 10;
                  ++*(_QWORD *)(a1 + 1040);
                }
                v36 = *(_QWORD *)(a1 + 1072);
                break;
              case 4:
                break;
              case 2:
                v42 = *(_QWORD *)(a1 + 1040);
                if (v42 <= 1022)
                {
                  *(_BYTE *)(v34 + v42) = 32;
                  v41 = *(_QWORD *)(a1 + 1040) + 1;
                  goto LABEL_71;
                }
                *(_BYTE *)(v34 + v42) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
                *(_QWORD *)(a1 + 1040) = 0;
                v43 = *(__CFString **)(a1 + 1064);
                v44 = " ";
LABEL_76:
                CFStringAppendCString(v43, v44, 0x8000100u);
                goto LABEL_77;
              default:
                goto LABEL_78;
            }
          }
          if (v36 < 1)
          {
LABEL_77:
            *(_QWORD *)(a1 + 1104) = 0;
LABEL_78:
            v47 = -[__CFString length](a5, "length");
            v48 = *(_QWORD *)(a1 + 1040);
            if (3 * v47 + v48 > 1023)
            {
              if (v48 >= 1)
              {
                *(_BYTE *)(v34 + v48) = 0;
                CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
                *(_QWORD *)(a1 + 1040) = 0;
              }
              if (v47 > 341)
              {
                objc_msgSend(*(id *)(a1 + 1064), "appendString:", a5);
                goto LABEL_86;
              }
              usedBufLen = 0;
              v56.location = 0;
              v56.length = v47;
              CFStringGetBytes(a5, v56, 0x8000100u, 0, 0, (UInt8 *)(a1 + 16), 1024, &usedBufLen);
              v49 = usedBufLen;
            }
            else
            {
              usedBufLen = 0;
              v55.location = 0;
              v55.length = v47;
              CFStringGetBytes(a5, v55, 0x8000100u, 0, 0, (UInt8 *)(v34 + v48), 1024 - v48, &usedBufLen);
              v49 = *(_QWORD *)(a1 + 1040) + usedBufLen;
            }
            *(_QWORD *)(a1 + 1040) = v49;
LABEL_86:
            *(_QWORD *)(a1 + 1104) = 3;
            goto LABEL_87;
          }
          if (v36 >= 8)
            v36 = 8;
          v37 = (const char *)*((_QWORD *)&sIndentSpaceStrings + v36);
          v38 = strlen(v37);
          v39 = *(_QWORD *)(a1 + 1040);
          if ((uint64_t)(v39 + v38) <= 1023)
          {
            v40 = v38;
            memcpy((void *)(v34 + v39), v37, v38);
            v41 = *(_QWORD *)(a1 + 1040) + v40;
LABEL_71:
            *(_QWORD *)(a1 + 1040) = v41;
            goto LABEL_77;
          }
          if (v39 >= 1)
          {
            *(_BYTE *)(v34 + v39) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
            *(_QWORD *)(a1 + 1040) = 0;
          }
          v43 = *(__CFString **)(a1 + 1064);
          v44 = v37;
          goto LABEL_76;
        }
        usedBufLen = 0;
        v54.location = 0;
        v54.length = v31;
        CFStringGetBytes(a4, v54, 0x8000100u, 0, 0, (UInt8 *)(a1 + 16), 1024, &usedBufLen);
        v33 = usedBufLen;
      }
      else
      {
        usedBufLen = 0;
        v53.location = 0;
        v53.length = v31;
        CFStringGetBytes(a4, v53, 0x8000100u, 0, 0, (UInt8 *)(a1 + v32 + 16), 1024 - v32, &usedBufLen);
        v33 = *(_QWORD *)(a1 + 1040) + usedBufLen;
      }
      *(_QWORD *)(a1 + 1040) = v33;
      goto LABEL_47;
    }
    if (v22 >= 8)
      v22 = 8;
    v23 = (const char *)*((_QWORD *)&sIndentSpaceStrings + v22);
    v24 = strlen(v23);
    v25 = *(_QWORD *)(a1 + 1040);
    if ((uint64_t)(v25 + v24) <= 1023)
    {
      v26 = v24;
      memcpy((void *)(a1 + v25 + 16), v23, v24);
      v17 = *(_QWORD *)(a1 + 1040) + v26;
      goto LABEL_24;
    }
    if (v25 >= 1)
    {
      *(_BYTE *)(a1 + 16 + v25) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
      *(_QWORD *)(a1 + 1040) = 0;
    }
    v20 = *(__CFString **)(a1 + 1064);
    v21 = v23;
LABEL_28:
    CFStringAppendCString(v20, v21, 0x8000100u);
    goto LABEL_29;
  }
}

- (void)_overrideCollectionLineBreaking:(char)a3 force:(uint64_t)a4 block:
{
  id v5;

  if (a1)
  {
    if (*(uint64_t *)(a1[1] + 24) < 2 || (a3 & 1) != 0)
    {
      if (a2 == 3)
      {
        +[BSDescriptionStyle collectionLineBreakEachItemStyle](BSDescriptionStyle, "collectionLineBreakEachItemStyle");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "overlayStyle:block:");
        goto LABEL_9;
      }
      if (a2 == 2)
      {
        +[BSDescriptionStyle collectionLineBreakNoneStyle](BSDescriptionStyle, "collectionLineBreakNoneStyle");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "overlayStyle:block:");
LABEL_9:

        return;
      }
    }
    (*(void (**)(uint64_t))(a4 + 16))(a4);
  }
}

CFIndex __110__BSDescriptionStream__appendSectionWithTotalItemCount_truncatedItemCount_openDelimiter_closeDelimiter_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  CFIndex v10;
  uint64_t v11;
  CFIndex v12;
  uint64_t v13;
  __CFString *v14;
  CFIndex v15;
  uint64_t v16;
  CFIndex result;
  CFIndex v18;
  CFIndex usedBufLen;
  CFRange v20;
  CFRange v21;
  CFRange v22;
  CFRange v23;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 64);
    v4 = *(_QWORD *)(v2 + 1040);
    v5 = v2 + 16;
    if (v4 > 1022)
    {
      *(_BYTE *)(v5 + v4) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
      *(_QWORD *)(v2 + 1040) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), "|", 0x8000100u);
      v6 = *(_QWORD *)(v2 + 1040);
    }
    else
    {
      *(_BYTE *)(v5 + v4) = 124;
      v6 = *(_QWORD *)(v2 + 1040) + 1;
      *(_QWORD *)(v2 + 1040) = v6;
    }
    if (v6 >= 1)
    {
      *(_BYTE *)(v5 + v6) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
      *(_QWORD *)(v2 + 1040) = 0;
    }
    objc_msgSend(*(id *)(v2 + 1064), "appendFormat:", CFSTR("%d"), v3);
    v7 = *(_QWORD *)(v2 + 1040);
    if (v7 > 1021)
    {
      *(_BYTE *)(v5 + v7) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
      *(_QWORD *)(v2 + 1040) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), "| ", 0x8000100u);
    }
    else
    {
      *(_WORD *)(v5 + v7) = 8316;
      *(_QWORD *)(v2 + 1040) += 2;
    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(__CFString **)(a1 + 40);
  v10 = -[__CFString length](v8, "length");
  v11 = *(_QWORD *)(v9 + 1040);
  if (3 * v10 + v11 <= 1023)
  {
    usedBufLen = 0;
    v20.location = 0;
    v20.length = v10;
    CFStringGetBytes(v8, v20, 0x8000100u, 0, 0, (UInt8 *)(v9 + v11 + 16), 1024 - v11, &usedBufLen);
    v12 = *(_QWORD *)(v9 + 1040) + usedBufLen;
LABEL_16:
    *(_QWORD *)(v9 + 1040) = v12;
    goto LABEL_18;
  }
  if (v11 >= 1)
  {
    *(_BYTE *)(v9 + 16 + v11) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v9 + 1064), (const char *)(v9 + 16), 0x8000100u);
    *(_QWORD *)(v9 + 1040) = 0;
  }
  if (v10 <= 341)
  {
    usedBufLen = 0;
    v21.location = 0;
    v21.length = v10;
    CFStringGetBytes(v8, v21, 0x8000100u, 0, 0, (UInt8 *)(v9 + 16), 1024, &usedBufLen);
    v12 = usedBufLen;
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(v9 + 1064), "appendString:", v8);
LABEL_18:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(__CFString **)(a1 + 48);
  v15 = -[__CFString length](v14, "length");
  v16 = *(_QWORD *)(v13 + 1040);
  if (3 * v15 + v16 > 1023)
  {
    if (v16 >= 1)
    {
      *(_BYTE *)(v13 + 16 + v16) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v13 + 1064), (const char *)(v13 + 16), 0x8000100u);
      *(_QWORD *)(v13 + 1040) = 0;
    }
    if (v15 > 341)
    {
      result = objc_msgSend(*(id *)(v13 + 1064), "appendString:", v14);
      goto LABEL_26;
    }
    usedBufLen = 0;
    v23.location = 0;
    v23.length = v15;
    result = CFStringGetBytes(v14, v23, 0x8000100u, 0, 0, (UInt8 *)(v13 + 16), 1024, &usedBufLen);
    v18 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v22.location = 0;
    v22.length = v15;
    result = CFStringGetBytes(v14, v22, 0x8000100u, 0, 0, (UInt8 *)(v13 + v16 + 16), 1024 - v16, &usedBufLen);
    v18 = *(_QWORD *)(v13 + 1040) + usedBufLen;
  }
  *(_QWORD *)(v13 + 1040) = v18;
LABEL_26:
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104) = 2;
  return result;
}

- (void)_overlayStyle:(uint64_t)a3 block:
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v6 = *(void **)(a1 + 8);
    if (v6 == (void *)a2)
    {
      (*(void (**)(uint64_t))(a3 + 16))(a3);
    }
    else
    {
      v7 = v6;
      -[BSDescriptionStyle _styleByOverlayingStyle:](*(CFSetRef **)(a1 + 8), a2);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v8;

      (*(void (**)(uint64_t))(a3 + 16))(a3);
      v10 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v7;

    }
  }
}

- (void)overlayStyle:(id)a3 block:(id)a4
{
  -[BSDescriptionStream _overlayStyle:block:]((uint64_t)self, (uint64_t)a3, (uint64_t)a4);
}

uint64_t __41__BSDescriptionStream_appendProem_block___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  objc_class *v3;
  __CFString *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  CFMutableStringRef *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFIndex v23;
  uint64_t v24;
  CFIndex v25;
  int *v26;
  unint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t result;
  uint64_t v44;
  CFIndex usedBufLen;
  CFRange v46;
  CFRange v47;

  if (!a1[4])
    goto LABEL_68;
  v2 = a1[5];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(v2 + 8);
  switch(*(_QWORD *)(v2 + 1104))
  {
    case 1:
      v6 = (_QWORD *)(v2 + 1040);
      v7 = *(_QWORD *)(v2 + 1040);
      v8 = (const char *)(v2 + 16);
      if (*(_QWORD *)(*(_QWORD *)(v2 + 8) + 24) == 3)
      {
        if (v7 > 1022)
        {
          v8[v7] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v8, 0x8000100u);
          *(_QWORD *)(v2 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), ";", 0x8000100u);
        }
        else
        {
          v8[v7] = 59;
          ++*v6;
        }
        goto LABEL_12;
      }
      if (v7 <= 1021)
      {
        *(_WORD *)&v8[v7] = 8251;
        v11 = 2;
        goto LABEL_20;
      }
      v8[v7] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v8, 0x8000100u);
      v12 = (CFMutableStringRef *)(v2 + 1064);
      v13 = "; ";
      goto LABEL_25;
    case 2:
      v6 = (_QWORD *)(v2 + 1040);
      v9 = *(_QWORD *)(v2 + 1040);
      v10 = (const char *)(v2 + 16);
      if (v9 <= 1022)
      {
        v10[v9] = 32;
        v11 = 1;
        goto LABEL_20;
      }
      v10[v9] = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v10, 0x8000100u);
      v12 = (CFMutableStringRef *)(v2 + 1064);
      v13 = " ";
LABEL_25:
      *v6 = 0;
      CFStringAppendCString(*v12, v13, 0x8000100u);
      break;
    case 3:
LABEL_12:
      v14 = *(_QWORD *)(v2 + 1040);
      v15 = (const char *)(v2 + 16);
      if (v14 > 1022)
      {
        v15[v14] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v15, 0x8000100u);
        *(_QWORD *)(v2 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), "\n", 0x8000100u);
      }
      else
      {
        v15[v14] = 10;
        ++*(_QWORD *)(v2 + 1040);
      }
      goto LABEL_15;
    case 4:
LABEL_15:
      v16 = *(_QWORD *)(v2 + 1072);
      if (v16 < 1)
        break;
      if (v16 >= 8)
        v16 = 8;
      v17 = (const char *)*((_QWORD *)&sIndentSpaceStrings + v16);
      v18 = strlen(v17);
      v6 = (_QWORD *)(v2 + 1040);
      v19 = *(_QWORD *)(v2 + 1040);
      if ((uint64_t)(v19 + v18) > 1023)
      {
        if (v19 >= 1)
        {
          *(_BYTE *)(v2 + 16 + v19) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
          *v6 = 0;
        }
        CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v17, 0x8000100u);
      }
      else
      {
        v11 = v18;
        memcpy((void *)(v2 + v19 + 16), v17, v18);
LABEL_20:
        *v6 += v11;
      }
      break;
    default:
      goto LABEL_27;
  }
  *(_QWORD *)(v2 + 1104) = 0;
LABEL_27:
  if (!v4)
    goto LABEL_59;
  v20 = v5[6];
  v21 = v5[7];
  if (v20 < 2 || v21 < 1)
  {
    *(_QWORD *)(v2 + 1096) = 0;
  }
  else
  {
    *(_QWORD *)(v2 + 1096) = v20;
    *(_QWORD *)(v2 + 1080) = *(_QWORD *)(v2 + 1040) + objc_msgSend(*(id *)(v2 + 1064), "length");
    *(_QWORD *)(v2 + 1088) = v21;
  }
  v23 = -[__CFString length](v4, "length");
  v24 = *(_QWORD *)(v2 + 1040);
  if (v24 + 3 * v23 > 1023)
  {
    if (v24 >= 1)
    {
      *(_BYTE *)(v2 + 16 + v24) = 0;
      CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
      *(_QWORD *)(v2 + 1040) = 0;
    }
    if (v23 > 341)
    {
      objc_msgSend(*(id *)(v2 + 1064), "appendString:", v4);
      goto LABEL_42;
    }
    usedBufLen = 0;
    v47.location = 0;
    v47.length = v23;
    CFStringGetBytes(v4, v47, 0x8000100u, 0, 0, (UInt8 *)(v2 + 16), 1024, &usedBufLen);
    v25 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v46.location = 0;
    v46.length = v23;
    CFStringGetBytes(v4, v46, 0x8000100u, 0, 0, (UInt8 *)(v2 + v24 + 16), 1024 - v24, &usedBufLen);
    v25 = *(_QWORD *)(v2 + 1040) + usedBufLen;
  }
  *(_QWORD *)(v2 + 1040) = v25;
LABEL_42:
  BSDescribeTruncationCommit(v2);
  if (*(uint64_t *)(v2 + 1048) <= 0)
    v26 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v26 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v27 = *(_QWORD *)(*(_QWORD *)(v2 + 8) + *v26);
  if (v27 < 2)
  {
    v31 = *(_QWORD *)(v2 + 1040);
    v32 = (const char *)(v2 + 16);
    if (v31 <= 1021)
    {
      *(_WORD *)&v32[v31] = 8250;
      v30 = 2;
      goto LABEL_54;
    }
    v32[v31] = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v32, 0x8000100u);
    v35 = ": ";
LABEL_58:
    *(_QWORD *)(v2 + 1040) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v35, 0x8000100u);
    goto LABEL_59;
  }
  if (v27 == 2)
  {
    v33 = *(_QWORD *)(v2 + 1040);
    v34 = v2 + 16 + v33;
    if (v33 <= 1020)
    {
      *(_BYTE *)(v34 + 2) = 32;
      *(_WORD *)v34 = 15648;
      v30 = 3;
      goto LABEL_54;
    }
    *(_BYTE *)v34 = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
    v35 = " = ";
    goto LABEL_58;
  }
  if (v27 == 3)
  {
    v28 = *(_QWORD *)(v2 + 1040);
    v29 = (const char *)(v2 + 16);
    if (v28 <= 1019)
    {
      *(_DWORD *)&v29[v28] = 540945696;
      v30 = 4;
LABEL_54:
      *(_QWORD *)(v2 + 1040) += v30;
      goto LABEL_59;
    }
    v29[v28] = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), v29, 0x8000100u);
    v35 = " -> ";
    goto LABEL_58;
  }
LABEL_59:
  v36 = v5[8];
  v37 = v5[9];
  if (v36 <= 1 || v37 < 1)
  {
    v37 = 0;
    v39 = 1096;
  }
  else
  {
    *(_QWORD *)(v2 + 1096) = v36;
    *(_QWORD *)(v2 + 1080) = *(_QWORD *)(v2 + 1040) + objc_msgSend(*(id *)(v2 + 1064), "length");
    v39 = 1088;
  }
  *(_QWORD *)(v2 + v39) = v37;

  v40 = a1[5];
  v41 = *(_QWORD *)(v40 + 1040);
  if (v41 >= 1)
  {
    *(_BYTE *)(v40 + 16 + v41) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v40 + 1064), (const char *)(v40 + 16), 0x8000100u);
    *(_QWORD *)(v40 + 1040) = 0;
    v40 = a1[5];
  }
  objc_msgSend(*(id *)(v40 + 1064), "appendFormat:", CFSTR("%p"), a1[4]);
  v42 = a1[5];
  *(_QWORD *)(v42 + 1104) = 1;
  BSDescribeTruncationCommit(v42);
LABEL_68:
  result = (*(uint64_t (**)(void))(a1[6] + 16))();
  v44 = a1[5];
  if (*(_QWORD *)(v44 + 1104) == 1)
    *(_QWORD *)(v44 + 1104) = 0;
  return result;
}

void __59__BSDescriptionStream_appendCollection_withName_itemBlock___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 && *(_QWORD *)(*(_QWORD *)(v4 + 8) + 88) == 2 && *(_BYTE *)(a1 + 64))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v29;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(v5);
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {

            v10 = *(id *)(a1 + 32);
            goto LABEL_15;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v6)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v3 = v9;
LABEL_15:

  }
  else
  {
    v10 = v2;
  }
  v27 = 0u;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  v13 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    v14 = 0;
    v15 = *(_QWORD *)v25;
LABEL_18:
    v16 = 0;
    v17 = v12 + v14;
    while (1)
    {
      if (*(_QWORD *)v25 != v15)
        objc_enumerationMutation(v11);
      v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16);
      if (*(_BYTE *)(a1 + 65))
      {
        if (v14 + v16 >= *(_QWORD *)(a1 + 56) - 1)
          break;
      }
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __59__BSDescriptionStream_appendCollection_withName_itemBlock___block_invoke_2;
      v23[3] = &unk_1E1EBEE78;
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      v23[4] = v18;
      v23[5] = v20;
      BSDescribeAppendItem(v19, (uint64_t)v23);
      if (v12 == ++v16)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        v14 = v17;
        if (v12)
          goto LABEL_18;
        break;
      }
    }
  }

  if (*(_BYTE *)(a1 + 65))
  {
    v21 = *(_QWORD *)(a1 + 40);
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __59__BSDescriptionStream_appendCollection_withName_itemBlock___block_invoke_3;
    v22[3] = &unk_1E1EBE890;
    v22[4] = v21;
    BSDescribeAppendItem(v21, (uint64_t)v22);
  }

}

uint64_t __59__BSDescriptionStream_appendCollection_withName_itemBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_appendDictionary:(__CFString *)a3 withName:(uint64_t)a4 itemBlock:
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  CFMutableStringRef *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  CFIndex v27;
  uint64_t v28;
  CFIndex v29;
  int *v30;
  unint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  unint64_t v48;
  _QWORD v49[8];
  BOOL v50;
  CFIndex usedBufLen;
  CFRange v52;
  CFRange v53;

  if (!a1)
    return;
  if (a3)
  {
    v8 = *(id *)(a1 + 8);
    switch(*(_QWORD *)(a1 + 1104))
    {
      case 1:
        v9 = (_QWORD *)(a1 + 1040);
        v10 = *(_QWORD *)(a1 + 1040);
        v11 = (const char *)(a1 + 16);
        if (*(_QWORD *)(*(_QWORD *)(a1 + 8) + 24) == 3)
        {
          if (v10 > 1022)
          {
            v11[v10] = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v11, 0x8000100u);
            *(_QWORD *)(a1 + 1040) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), ";", 0x8000100u);
          }
          else
          {
            v11[v10] = 59;
            ++*v9;
          }
          goto LABEL_13;
        }
        if (v10 <= 1021)
        {
          *(_WORD *)&v11[v10] = 8251;
          v14 = 2;
          goto LABEL_21;
        }
        v11[v10] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v11, 0x8000100u);
        v15 = (CFMutableStringRef *)(a1 + 1064);
        v16 = "; ";
        goto LABEL_26;
      case 2:
        v9 = (_QWORD *)(a1 + 1040);
        v12 = *(_QWORD *)(a1 + 1040);
        v13 = (const char *)(a1 + 16);
        if (v12 <= 1022)
        {
          v13[v12] = 32;
          v14 = 1;
          goto LABEL_21;
        }
        v13[v12] = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v13, 0x8000100u);
        v15 = (CFMutableStringRef *)(a1 + 1064);
        v16 = " ";
LABEL_26:
        *v9 = 0;
        CFStringAppendCString(*v15, v16, 0x8000100u);
        break;
      case 3:
LABEL_13:
        v17 = *(_QWORD *)(a1 + 1040);
        v18 = (const char *)(a1 + 16);
        if (v17 > 1022)
        {
          v18[v17] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v18, 0x8000100u);
          *(_QWORD *)(a1 + 1040) = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), "\n", 0x8000100u);
        }
        else
        {
          v18[v17] = 10;
          ++*(_QWORD *)(a1 + 1040);
        }
        goto LABEL_16;
      case 4:
LABEL_16:
        v19 = *(_QWORD *)(a1 + 1072);
        if (v19 < 1)
          break;
        if (v19 >= 8)
          v19 = 8;
        v20 = (const char *)*((_QWORD *)&sIndentSpaceStrings + v19);
        v21 = strlen(v20);
        v9 = (_QWORD *)(a1 + 1040);
        v22 = *(_QWORD *)(a1 + 1040);
        if ((uint64_t)(v22 + v21) > 1023)
        {
          if (v22 >= 1)
          {
            *(_BYTE *)(a1 + 16 + v22) = 0;
            CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
            *v9 = 0;
          }
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v20, 0x8000100u);
        }
        else
        {
          v14 = v21;
          memcpy((void *)(a1 + v22 + 16), v20, v21);
LABEL_21:
          *v9 += v14;
        }
        break;
      default:
        goto LABEL_28;
    }
    *(_QWORD *)(a1 + 1104) = 0;
LABEL_28:
    v23 = v8[6];
    v24 = v8[7];
    if (v23 < 2 || v24 < 1)
    {
      v24 = 0;
      v26 = 1096;
    }
    else
    {
      *(_QWORD *)(a1 + 1096) = v23;
      *(_QWORD *)(a1 + 1080) = *(_QWORD *)(a1 + 1040) + objc_msgSend(*(id *)(a1 + 1064), "length");
      v26 = 1088;
    }
    *(_QWORD *)(a1 + v26) = v24;
    v27 = -[__CFString length](a3, "length");
    v28 = *(_QWORD *)(a1 + 1040);
    if (v28 + 3 * v27 > 1023)
    {
      if (v28 >= 1)
      {
        *(_BYTE *)(a1 + 16 + v28) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
        *(_QWORD *)(a1 + 1040) = 0;
      }
      if (v27 > 341)
      {
        objc_msgSend(*(id *)(a1 + 1064), "appendString:", a3);
LABEL_42:
        BSDescribeTruncationCommit(a1);
        if (*(uint64_t *)(a1 + 1048) <= 0)
          v30 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
        else
          v30 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
        v31 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + *v30);
        if (v31 < 2)
        {
          v35 = *(_QWORD *)(a1 + 1040);
          v36 = (const char *)(a1 + 16);
          if (v35 <= 1021)
          {
            *(_WORD *)&v36[v35] = 8250;
            v34 = 2;
            goto LABEL_54;
          }
          v36[v35] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v36, 0x8000100u);
          v39 = ": ";
        }
        else if (v31 == 2)
        {
          v37 = *(_QWORD *)(a1 + 1040);
          v38 = a1 + 16 + v37;
          if (v37 <= 1020)
          {
            *(_BYTE *)(v38 + 2) = 32;
            *(_WORD *)v38 = 15648;
            v34 = 3;
            goto LABEL_54;
          }
          *(_BYTE *)v38 = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), (const char *)(a1 + 16), 0x8000100u);
          v39 = " = ";
        }
        else
        {
          if (v31 != 3)
            goto LABEL_59;
          v32 = *(_QWORD *)(a1 + 1040);
          v33 = (const char *)(a1 + 16);
          if (v32 <= 1019)
          {
            *(_DWORD *)&v33[v32] = 540945696;
            v34 = 4;
LABEL_54:
            *(_QWORD *)(a1 + 1040) += v34;
            goto LABEL_59;
          }
          v33[v32] = 0;
          CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v33, 0x8000100u);
          v39 = " -> ";
        }
        *(_QWORD *)(a1 + 1040) = 0;
        CFStringAppendCString(*(CFMutableStringRef *)(a1 + 1064), v39, 0x8000100u);
LABEL_59:
        v40 = 0;
        v41 = v8[8];
        v42 = 1096;
        if (v41 >= 2)
        {
          v43 = v8[9];
          if (v43 >= 1)
          {
            *(_QWORD *)(a1 + 1096) = v41;
            *(_QWORD *)(a1 + 1080) = *(_QWORD *)(a1 + 1040) + objc_msgSend(*(id *)(a1 + 1064), "length");
            v42 = 1088;
            v40 = v43;
          }
        }
        *(_QWORD *)(a1 + v42) = v40;

        goto LABEL_63;
      }
      usedBufLen = 0;
      v53.location = 0;
      v53.length = v27;
      CFStringGetBytes(a3, v53, 0x8000100u, 0, 0, (UInt8 *)(a1 + 16), 1024, &usedBufLen);
      v29 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v52.location = 0;
      v52.length = v27;
      CFStringGetBytes(a3, v52, 0x8000100u, 0, 0, (UInt8 *)(a1 + v28 + 16), 1024 - v28, &usedBufLen);
      v29 = *(_QWORD *)(a1 + 1040) + usedBufLen;
    }
    *(_QWORD *)(a1 + 1040) = v29;
    goto LABEL_42;
  }
LABEL_63:
  v44 = objc_msgSend(a2, "count");
  v45 = *(_QWORD *)(a1 + 8);
  if (*(_QWORD *)(v45 + 80) == 2)
  {
    v46 = *(_QWORD *)(v45 + 96);
    v47 = v46 < v44;
    if (v46 < v44)
      v48 = v46 + 1;
    else
      v48 = v44;
  }
  else
  {
    v47 = 0;
    v48 = v44;
  }
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke;
  v49[3] = &unk_1E1EBF958;
  v49[4] = a1;
  v49[5] = a2;
  v50 = v47;
  v49[6] = a4;
  v49[7] = v48;
  -[BSDescriptionStream _appendSectionWithTotalItemCount:truncatedItemCount:openDelimiter:closeDelimiter:block:](a1, v44, v48, CFSTR("{"), CFSTR("}"), (uint64_t)v49);
  if (a3)
  {
    *(_QWORD *)(a1 + 1104) = 1;
    BSDescribeTruncationCommit(a1);
  }
}

- (id)appendUInt64:(unint64_t)a3 withName:(id)a4 format:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;

  v8 = CFSTR("%llu");
  if (a5 == 1)
    v8 = CFSTR("0x%llX");
  BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, v8, (uint64_t)a4, a5, v5, v6, v7, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

- (void)appendRightArrow
{
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;

  appendBufferCount = self->_appendBufferCount;
  appendBuffer = self->_appendBuffer;
  if (appendBufferCount > 1019)
  {
    appendBuffer[appendBufferCount] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, " -> ", 0x8000100u);
  }
  else
  {
    *(_DWORD *)&appendBuffer[appendBufferCount] = 540945696;
    self->_appendBufferCount += 4;
  }
  self->_emitPhase = 0;
}

void __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD v22[8];
  char v23;
  _QWORD v24[4];
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_QWORD *)(*(_QWORD *)(v2 + 8) + 88) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v34 = 0u;
    v33 = 0u;
    v32 = 0u;
    v31 = 0u;
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v32 != v5)
            objc_enumerationMutation(v3);
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {

            v10 = v3;
            goto LABEL_15;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v4)
          continue;
        break;
      }
    }

    objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
    v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v30 = 0u;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v12)
    {
      v13 = 0;
      v14 = *(_QWORD *)v28;
      v15 = MEMORY[0x1E0C809B0];
LABEL_17:
      v16 = 0;
      v20 = v12 + v13;
      while (1)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16);
        if (*(_BYTE *)(a1 + 64))
        {
          if (v13 + v16 >= *(_QWORD *)(a1 + 56) - 1)
            break;
        }
        v18 = *(_QWORD *)(a1 + 32);
        v25[0] = v15;
        v25[1] = 3221225472;
        v25[2] = __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_2;
        v25[3] = &unk_1E1EBFA70;
        v25[4] = v17;
        v26 = *(_OWORD *)(a1 + 40);
        BSDescribeAppendItem(v18, (uint64_t)v25);
        if (v12 == ++v16)
        {
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          v13 = v20;
          if (v12)
            goto LABEL_17;
          break;
        }
      }
    }

  }
  else
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v24[3] = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_3;
    v22[3] = &unk_1E1EBF930;
    v23 = *(_BYTE *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 56);
    v22[6] = v24;
    v22[7] = v7;
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v22[4] = v2;
    v22[5] = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v22);
    _Block_object_dispose(v24, 8);
  }
  if (*(_BYTE *)(a1 + 64))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_5;
    v21[3] = &unk_1E1EBE890;
    v21[4] = v19;
    BSDescribeAppendItem(v19, (uint64_t)v21);
  }
}

- (void)appendFormat:(id)a3
{
  int64_t appendBufferCount;
  char v6;

  appendBufferCount = self->_appendBufferCount;
  if (appendBufferCount >= 1)
  {
    self->_appendBuffer[appendBufferCount] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
  }
  CFStringAppendFormatAndArguments((CFMutableStringRef)self->_string, 0, (CFStringRef)a3, &v6);
}

void __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[7];

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (*(_BYTE *)(a1 + 64) && v5 >= *(_QWORD *)(a1 + 56) - 1)
  {
    *a4 = 1;
  }
  else
  {
    *(_QWORD *)(v4 + 24) = v5 + 1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_4;
    v8[3] = &unk_1E1EBFA70;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8[5] = a3;
    v8[6] = v7;
    v8[4] = a2;
    BSDescribeAppendItem(v6, (uint64_t)v8);
  }
}

- (void)appendString:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  BSDescriptionStyle *v8;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  NSMutableString **p_string;
  const char *v16;
  int64_t v17;
  unsigned __int8 *v18;
  int64_t indentLevel;
  const char *v20;
  size_t v21;
  int64_t v22;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v26;
  int64_t v27;
  CFIndex v28;
  int *v29;
  unint64_t v30;
  int64_t v31;
  unsigned __int8 *v32;
  uint64_t v33;
  int64_t v34;
  unsigned __int8 *v35;
  int64_t v36;
  unsigned __int8 *v37;
  const char *v38;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v42;
  CFIndex v43;
  int64_t v44;
  CFIndex v45;
  int64_t v46;
  unsigned __int8 *v47;
  CFIndex usedBufLen;
  CFRange v49;
  CFRange v50;
  CFRange v51;
  CFRange v52;

  if (a3 || !a5)
  {
    v8 = self->_style;
    switch(self->_emitPhase)
    {
      case 1:
        p_appendBufferCount = &self->_appendBufferCount;
        appendBufferCount = self->_appendBufferCount;
        appendBuffer = self->_appendBuffer;
        if (self->_style->_collectionLineBreak == 3)
        {
          if (appendBufferCount > 1022)
          {
            appendBuffer[appendBufferCount] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
            self->_appendBufferCount = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
          }
          else
          {
            appendBuffer[appendBufferCount] = 59;
            ++*p_appendBufferCount;
          }
          goto LABEL_13;
        }
        if (appendBufferCount <= 1021)
        {
          *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
          v14 = 2;
          goto LABEL_21;
        }
        appendBuffer[appendBufferCount] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
        p_string = &self->_string;
        v16 = "; ";
        goto LABEL_26;
      case 2:
        p_appendBufferCount = &self->_appendBufferCount;
        v12 = self->_appendBufferCount;
        v13 = self->_appendBuffer;
        if (v12 <= 1022)
        {
          v13[v12] = 32;
          v14 = 1;
          goto LABEL_21;
        }
        v13[v12] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v13, 0x8000100u);
        p_string = &self->_string;
        v16 = " ";
LABEL_26:
        *p_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)*p_string, v16, 0x8000100u);
        break;
      case 3:
LABEL_13:
        v17 = self->_appendBufferCount;
        v18 = self->_appendBuffer;
        if (v17 > 1022)
        {
          v18[v17] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v18, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
        }
        else
        {
          v18[v17] = 10;
          ++self->_appendBufferCount;
        }
        goto LABEL_16;
      case 4:
LABEL_16:
        indentLevel = self->_indentLevel;
        if (indentLevel < 1)
          break;
        if (indentLevel >= 8)
          indentLevel = 8;
        v20 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
        v21 = strlen(v20);
        p_appendBufferCount = &self->_appendBufferCount;
        v22 = self->_appendBufferCount;
        if ((uint64_t)(v22 + v21) > 1023)
        {
          if (v22 >= 1)
          {
            self->_appendBuffer[v22] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            *p_appendBufferCount = 0;
          }
          CFStringAppendCString((CFMutableStringRef)self->_string, v20, 0x8000100u);
        }
        else
        {
          v14 = v21;
          memcpy(&self->_appendBuffer[v22], v20, v21);
LABEL_21:
          *p_appendBufferCount += v14;
        }
        break;
      default:
        goto LABEL_28;
    }
    self->_emitPhase = 0;
LABEL_28:
    if (!a4)
      goto LABEL_60;
    nameTruncation = v8->_nameTruncation;
    maximumNameLengthBeforeTruncation = v8->_maximumNameLengthBeforeTruncation;
    if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
    {
      self->_lineTruncation = 0;
    }
    else
    {
      self->_lineTruncation = nameTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
    }
    v26 = objc_msgSend(a4, "length");
    v27 = self->_appendBufferCount;
    if (v27 + 3 * v26 > 1023)
    {
      if (v27 >= 1)
      {
        self->_appendBuffer[v27] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      if (v26 > 341)
      {
        -[NSMutableString appendString:](self->_string, "appendString:", a4);
        goto LABEL_43;
      }
      usedBufLen = 0;
      v50.location = 0;
      v50.length = v26;
      CFStringGetBytes((CFStringRef)a4, v50, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      v28 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v49.location = 0;
      v49.length = v26;
      CFStringGetBytes((CFStringRef)a4, v49, 0x8000100u, 0, 0, &self->_appendBuffer[v27], 1024 - v27, &usedBufLen);
      v28 = self->_appendBufferCount + usedBufLen;
    }
    self->_appendBufferCount = v28;
LABEL_43:
    BSDescribeTruncationCommit((uint64_t)self);
    if (self->_proemNestCount <= 0)
      v29 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
    else
      v29 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
    v30 = *(unint64_t *)((char *)&self->_style->super.isa + *v29);
    if (v30 < 2)
    {
      v34 = self->_appendBufferCount;
      v35 = self->_appendBuffer;
      if (v34 <= 1021)
      {
        *(_WORD *)&v35[v34] = 8250;
        v33 = 2;
        goto LABEL_55;
      }
      v35[v34] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v35, 0x8000100u);
      v38 = ": ";
    }
    else if (v30 == 2)
    {
      v36 = self->_appendBufferCount;
      v37 = &self->_appendBuffer[v36];
      if (v36 <= 1020)
      {
        v37[2] = 32;
        *(_WORD *)v37 = 15648;
        v33 = 3;
        goto LABEL_55;
      }
      *v37 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      v38 = " = ";
    }
    else
    {
      if (v30 != 3)
        goto LABEL_60;
      v31 = self->_appendBufferCount;
      v32 = self->_appendBuffer;
      if (v31 <= 1019)
      {
        *(_DWORD *)&v32[v31] = 540945696;
        v33 = 4;
LABEL_55:
        self->_appendBufferCount += v33;
        goto LABEL_60;
      }
      v32[v31] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v32, 0x8000100u);
      v38 = " -> ";
    }
    self->_appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, v38, 0x8000100u);
LABEL_60:
    valueTruncation = v8->_valueTruncation;
    maximumValueLengthBeforeTruncation = v8->_maximumValueLengthBeforeTruncation;
    if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
    {
      maximumValueLengthBeforeTruncation = 0;
      v42 = 1096;
    }
    else
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      v42 = 1088;
    }
    *(Class *)((char *)&self->super.isa + v42) = (Class)maximumValueLengthBeforeTruncation;

    if (a3)
    {
      v43 = objc_msgSend(a3, "length");
      v44 = self->_appendBufferCount;
      if (3 * v43 + v44 > 1023)
      {
        if (v44 >= 1)
        {
          self->_appendBuffer[v44] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
        }
        if (v43 > 341)
        {
          -[NSMutableString appendString:](self->_string, "appendString:", a3);
          goto LABEL_78;
        }
        usedBufLen = 0;
        v52.location = 0;
        v52.length = v43;
        CFStringGetBytes((CFStringRef)a3, v52, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
        v45 = usedBufLen;
      }
      else
      {
        usedBufLen = 0;
        v51.location = 0;
        v51.length = v43;
        CFStringGetBytes((CFStringRef)a3, v51, 0x8000100u, 0, 0, &self->_appendBuffer[v44], 1024 - v44, &usedBufLen);
        v45 = self->_appendBufferCount + usedBufLen;
      }
    }
    else
    {
      v46 = self->_appendBufferCount;
      v47 = &self->_appendBuffer[v46];
      if (v46 > 1018)
      {
        *v47 = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
        goto LABEL_78;
      }
      v47[4] = 62;
      *(_DWORD *)v47 = 1818848828;
      v45 = self->_appendBufferCount + 5;
    }
    self->_appendBufferCount = v45;
LABEL_78:
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
  }
}

- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, CFSTR("%tu"), (uint64_t)a4, v4, v5, v6, v7, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendDouble:(double)a3 withName:(id)a4 decimalPrecision:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, CFSTR("%f"), 0x7FFFFFFFFFFFFFFFLL, v5, v6, v7, v8, SLOBYTE(a3));
  }
  else
  {
    v9 = -1;
    if (a5 < 0x7FFFFFFF)
      v9 = a5;
    BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, CFSTR("%.*f"), a5, v5, v6, v7, v8, v9);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendBool:(BOOL)a3 withName:(id)a4 ifEqualTo:(BOOL)a5
{
  _BOOL4 v7;
  const char *v8;
  BSDescriptionStyle *v9;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  NSMutableString **p_string;
  const char *v17;
  int64_t v18;
  unsigned __int8 *v19;
  int64_t indentLevel;
  const char *v21;
  size_t v22;
  int64_t v23;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v27;
  int64_t v28;
  CFIndex v29;
  int *v30;
  unint64_t v31;
  int64_t v32;
  unsigned __int8 *v33;
  uint64_t v34;
  int64_t v35;
  unsigned __int8 *v36;
  int64_t v37;
  unsigned __int8 *v38;
  const char *v39;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v43;
  size_t v44;
  int64_t v45;
  BSDescriptionStream *v46;
  CFIndex usedBufLen;
  CFRange v49;
  CFRange v50;

  if (a3 != a5)
    goto LABEL_77;
  v7 = a3;
  if (a3)
    v8 = "YES";
  else
    v8 = "NO";
  v9 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_15;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v15 = 2;
        goto LABEL_23;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v17 = "; ";
      goto LABEL_28;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v13 = self->_appendBufferCount;
      v14 = self->_appendBuffer;
      if (v13 <= 1022)
      {
        v14[v13] = 32;
        v15 = 1;
        goto LABEL_23;
      }
      v14[v13] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v14, 0x8000100u);
      p_string = &self->_string;
      v17 = " ";
LABEL_28:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v17, 0x8000100u);
      break;
    case 3:
LABEL_15:
      v18 = self->_appendBufferCount;
      v19 = self->_appendBuffer;
      if (v18 > 1022)
      {
        v19[v18] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v19, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v19[v18] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_18;
    case 4:
LABEL_18:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v21 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v22 = strlen(v21);
      p_appendBufferCount = &self->_appendBufferCount;
      v23 = self->_appendBufferCount;
      if ((uint64_t)(v23 + v22) > 1023)
      {
        if (v23 >= 1)
        {
          self->_appendBuffer[v23] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v21, 0x8000100u);
      }
      else
      {
        v15 = v22;
        memcpy(&self->_appendBuffer[v23], v21, v22);
LABEL_23:
        *p_appendBufferCount += v15;
      }
      break;
    default:
      goto LABEL_30;
  }
  self->_emitPhase = 0;
LABEL_30:
  if (!a4)
    goto LABEL_62;
  nameTruncation = v9->_nameTruncation;
  maximumNameLengthBeforeTruncation = v9->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  v27 = objc_msgSend(a4, "length");
  v28 = self->_appendBufferCount;
  if (v28 + 3 * v27 > 1023)
  {
    if (v28 >= 1)
    {
      self->_appendBuffer[v28] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v27 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a4);
      goto LABEL_45;
    }
    usedBufLen = 0;
    v50.location = 0;
    v50.length = v27;
    CFStringGetBytes((CFStringRef)a4, v50, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v29 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v49.location = 0;
    v49.length = v27;
    CFStringGetBytes((CFStringRef)a4, v49, 0x8000100u, 0, 0, &self->_appendBuffer[v28], 1024 - v28, &usedBufLen);
    v29 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v29;
LABEL_45:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v30 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v30 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v31 = *(unint64_t *)((char *)&self->_style->super.isa + *v30);
  if (v31 < 2)
  {
    v35 = self->_appendBufferCount;
    v36 = self->_appendBuffer;
    if (v35 <= 1021)
    {
      *(_WORD *)&v36[v35] = 8250;
      v34 = 2;
      goto LABEL_57;
    }
    v36[v35] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v36, 0x8000100u);
    v39 = ": ";
LABEL_61:
    self->_appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, v39, 0x8000100u);
    goto LABEL_62;
  }
  if (v31 == 2)
  {
    v37 = self->_appendBufferCount;
    v38 = &self->_appendBuffer[v37];
    if (v37 <= 1020)
    {
      v38[2] = 32;
      *(_WORD *)v38 = 15648;
      v34 = 3;
      goto LABEL_57;
    }
    *v38 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v39 = " = ";
    goto LABEL_61;
  }
  if (v31 == 3)
  {
    v32 = self->_appendBufferCount;
    v33 = self->_appendBuffer;
    if (v32 <= 1019)
    {
      *(_DWORD *)&v33[v32] = 540945696;
      v34 = 4;
LABEL_57:
      self->_appendBufferCount += v34;
      goto LABEL_62;
    }
    v33[v32] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v33, 0x8000100u);
    v39 = " -> ";
    goto LABEL_61;
  }
LABEL_62:
  valueTruncation = v9->_valueTruncation;
  maximumValueLengthBeforeTruncation = v9->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v43 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v43 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v43) = (Class)maximumValueLengthBeforeTruncation;

  if (v7)
    v44 = 3;
  else
    v44 = 2;
  v45 = self->_appendBufferCount;
  if ((uint64_t)(v45 + v44) > 1023)
  {
    if (v45 >= 1)
    {
      self->_appendBuffer[v45] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    CFStringAppendCString((CFMutableStringRef)self->_string, v8, 0x8000100u);
  }
  else
  {
    memcpy(&self->_appendBuffer[v45], v8, v44);
    self->_appendBufferCount += v44;
  }
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
LABEL_77:
  v46 = self;
  return self;
}

- (void)appendBodySectionWithName:(id)a3 openDelimiter:(id)a4 closeDelimiter:(id)a5 block:(id)a6
{
  BSDescriptionStyle *v11;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  NSMutableString **p_string;
  const char *v19;
  int64_t v20;
  unsigned __int8 *v21;
  int64_t indentLevel;
  const char *v23;
  size_t v24;
  int64_t v25;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  uint64_t v29;
  CFIndex v30;
  int64_t v31;
  CFIndex v32;
  int *v33;
  unint64_t v34;
  int64_t v35;
  unsigned __int8 *v36;
  uint64_t v37;
  int64_t v38;
  unsigned __int8 *v39;
  int64_t v40;
  unsigned __int8 *v41;
  const char *v42;
  objc_class *v43;
  int64_t valueTruncation;
  uint64_t v45;
  uint64_t maximumValueLengthBeforeTruncation;
  _QWORD v47[8];
  CFIndex usedBufLen;
  CFRange v49;
  CFRange v50;

  if (!a3)
    goto LABEL_62;
  v11 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_12;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v17 = 2;
        goto LABEL_20;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v19 = "; ";
      goto LABEL_25;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v15 = self->_appendBufferCount;
      v16 = self->_appendBuffer;
      if (v15 <= 1022)
      {
        v16[v15] = 32;
        v17 = 1;
        goto LABEL_20;
      }
      v16[v15] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v16, 0x8000100u);
      p_string = &self->_string;
      v19 = " ";
LABEL_25:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v19, 0x8000100u);
      break;
    case 3:
LABEL_12:
      v20 = self->_appendBufferCount;
      v21 = self->_appendBuffer;
      if (v20 > 1022)
      {
        v21[v20] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v21, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v21[v20] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_15;
    case 4:
LABEL_15:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v23 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v24 = strlen(v23);
      p_appendBufferCount = &self->_appendBufferCount;
      v25 = self->_appendBufferCount;
      if ((uint64_t)(v25 + v24) > 1023)
      {
        if (v25 >= 1)
        {
          self->_appendBuffer[v25] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v23, 0x8000100u);
      }
      else
      {
        v17 = v24;
        memcpy(&self->_appendBuffer[v25], v23, v24);
LABEL_20:
        *p_appendBufferCount += v17;
      }
      break;
    default:
      goto LABEL_27;
  }
  self->_emitPhase = 0;
LABEL_27:
  nameTruncation = v11->_nameTruncation;
  maximumNameLengthBeforeTruncation = v11->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    maximumNameLengthBeforeTruncation = 0;
    v29 = 1096;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v29 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v29) = (Class)maximumNameLengthBeforeTruncation;
  v30 = objc_msgSend(a3, "length");
  v31 = self->_appendBufferCount;
  if (v31 + 3 * v30 <= 1023)
  {
    usedBufLen = 0;
    v49.location = 0;
    v49.length = v30;
    CFStringGetBytes((CFStringRef)a3, v49, 0x8000100u, 0, 0, &self->_appendBuffer[v31], 1024 - v31, &usedBufLen);
    v32 = self->_appendBufferCount + usedBufLen;
LABEL_39:
    self->_appendBufferCount = v32;
    goto LABEL_41;
  }
  if (v31 >= 1)
  {
    self->_appendBuffer[v31] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
  }
  if (v30 <= 341)
  {
    usedBufLen = 0;
    v50.location = 0;
    v50.length = v30;
    CFStringGetBytes((CFStringRef)a3, v50, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v32 = usedBufLen;
    goto LABEL_39;
  }
  -[NSMutableString appendString:](self->_string, "appendString:", a3);
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v33 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v33 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v34 = *(unint64_t *)((char *)&self->_style->super.isa + *v33);
  if (v34 < 2)
  {
    v38 = self->_appendBufferCount;
    v39 = self->_appendBuffer;
    if (v38 <= 1021)
    {
      *(_WORD *)&v39[v38] = 8250;
      v37 = 2;
      goto LABEL_53;
    }
    v39[v38] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v39, 0x8000100u);
    v42 = ": ";
  }
  else if (v34 == 2)
  {
    v40 = self->_appendBufferCount;
    v41 = &self->_appendBuffer[v40];
    if (v40 <= 1020)
    {
      v41[2] = 32;
      *(_WORD *)v41 = 15648;
      v37 = 3;
      goto LABEL_53;
    }
    *v41 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v42 = " = ";
  }
  else
  {
    if (v34 != 3)
      goto LABEL_58;
    v35 = self->_appendBufferCount;
    v36 = self->_appendBuffer;
    if (v35 <= 1019)
    {
      *(_DWORD *)&v36[v35] = 540945696;
      v37 = 4;
LABEL_53:
      self->_appendBufferCount += v37;
      goto LABEL_58;
    }
    v36[v35] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v36, 0x8000100u);
    v42 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v42, 0x8000100u);
LABEL_58:
  v43 = 0;
  valueTruncation = v11->_valueTruncation;
  v45 = 1096;
  if (valueTruncation >= 2)
  {
    maximumValueLengthBeforeTruncation = v11->_maximumValueLengthBeforeTruncation;
    if (maximumValueLengthBeforeTruncation >= 1)
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      v45 = 1088;
      v43 = (objc_class *)maximumValueLengthBeforeTruncation;
    }
  }
  *(Class *)((char *)&self->super.isa + v45) = v43;

LABEL_62:
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __84__BSDescriptionStream_appendBodySectionWithName_openDelimiter_closeDelimiter_block___block_invoke;
  v47[3] = &unk_1E1EBF8B8;
  v47[4] = self;
  v47[5] = a4;
  v47[6] = a5;
  v47[7] = a6;
  -[BSDescriptionStream _overrideCollectionLineBreaking:force:block:](self, 3, 0, (uint64_t)v47);
  if (a3)
  {
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
  }
}

void __84__BSDescriptionStream_appendBodySectionWithName_openDelimiter_closeDelimiter_block___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    -[BSDescriptionStream _appendSectionWithTotalItemCount:truncatedItemCount:openDelimiter:closeDelimiter:block:](v2, -1, 0xFFFFFFFFFFFFFFFFLL, *(__CFString **)(a1 + 40), *(__CFString **)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)appendCustomFormatWithName:(id)a3 block:(id)a4
{
  BSDescriptionStyle *v7;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  NSMutableString **p_string;
  const char *v15;
  int64_t v16;
  unsigned __int8 *v17;
  int64_t indentLevel;
  const char *v19;
  size_t v20;
  int64_t v21;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v25;
  int64_t v26;
  CFIndex v27;
  int *v28;
  unint64_t v29;
  int64_t v30;
  unsigned __int8 *v31;
  uint64_t v32;
  int64_t v33;
  unsigned __int8 *v34;
  int64_t v35;
  unsigned __int8 *v36;
  const char *v37;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v41;
  CFIndex usedBufLen;
  CFRange v43;
  CFRange v44;

  v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v15 = "; ";
      goto LABEL_24;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v11 = self->_appendBufferCount;
      v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      v15 = " ";
LABEL_24:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v16 = self->_appendBufferCount;
      v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v19 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v20 = strlen(v19);
      p_appendBufferCount = &self->_appendBufferCount;
      v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a3)
    goto LABEL_58;
  nameTruncation = v7->_nameTruncation;
  maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  v25 = objc_msgSend(a3, "length");
  v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a3);
      goto LABEL_41;
    }
    usedBufLen = 0;
    v44.location = 0;
    v44.length = v25;
    CFStringGetBytes((CFStringRef)a3, v44, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v27 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v43.location = 0;
    v43.length = v25;
    CFStringGetBytes((CFStringRef)a3, v43, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    v33 = self->_appendBufferCount;
    v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    v37 = ": ";
  }
  else if (v29 == 2)
  {
    v35 = self->_appendBufferCount;
    v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)v36 = 15648;
      v32 = 3;
      goto LABEL_53;
    }
    *v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v37 = " = ";
  }
  else
  {
    if (v29 != 3)
      goto LABEL_58;
    v30 = self->_appendBufferCount;
    v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    v37 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  valueTruncation = v7->_valueTruncation;
  maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  (*((void (**)(id, BSDescriptionStream *))a4 + 2))(a4, self);
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
}

- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4 format:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;

  v8 = CFSTR("%tu");
  if (a5 == 1)
    v8 = CFSTR("0x%tX");
  BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, v8, (uint64_t)a4, a5, v5, v6, v7, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendTimeInterval:(double)a3 withName:(id)a4 decomposeUnits:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  BSDescriptionStyle *v16;
  int64_t *v17;
  int64_t v18;
  unsigned __int8 *v19;
  BSDescriptionStyle *v20;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  id appended;
  id v25;
  int64_t v26;
  unsigned __int8 *v27;
  uint64_t v28;
  int64_t v29;
  unsigned __int8 *v30;
  uint64_t v31;
  NSMutableString **p_string;
  const char *v33;
  NSMutableString **v34;
  const char *v35;
  int64_t v36;
  unsigned __int8 *v37;
  int64_t indentLevel;
  const char *v39;
  size_t v40;
  int64_t v41;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v45;
  int64_t v46;
  CFIndex v47;
  int *v48;
  unint64_t v49;
  int64_t v50;
  unsigned __int8 *v51;
  uint64_t v52;
  int64_t v53;
  unsigned __int8 *v54;
  int64_t v55;
  unsigned __int8 *v56;
  const char *v57;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v61;
  CFIndex v62;
  int64_t v63;
  CFIndex v64;
  int64_t v65;
  unsigned __int8 *v66;
  int64_t v67;
  const char *v68;
  size_t v69;
  int64_t v70;
  int64_t v71;
  int64_t v72;
  CFIndex v73;
  int64_t v74;
  CFIndex v75;
  int *v76;
  unint64_t v77;
  int64_t v78;
  unsigned __int8 *v79;
  uint64_t v80;
  int64_t v81;
  unsigned __int8 *v82;
  int64_t v83;
  unsigned __int8 *v84;
  const char *v85;
  objc_class *v86;
  int64_t v87;
  uint64_t v88;
  uint64_t v89;
  CFIndex v90;
  int64_t v91;
  CFIndex v92;
  int64_t v93;
  unsigned __int8 *v94;
  BSDescriptionStream *v95;
  CFIndex usedBufLen;
  CFRange v98;
  CFRange v99;
  CFRange v100;
  CFRange v101;
  CFRange v102;
  CFRange v103;
  CFRange v104;
  CFRange v105;

  if (fabs(a3) == INFINITY)
  {
    v20 = self->_style;
    switch(self->_emitPhase)
    {
      case 1:
        p_appendBufferCount = &self->_appendBufferCount;
        appendBufferCount = self->_appendBufferCount;
        appendBuffer = self->_appendBuffer;
        if (self->_style->_collectionLineBreak == 3)
        {
          if (appendBufferCount > 1022)
          {
            appendBuffer[appendBufferCount] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
            self->_appendBufferCount = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
          }
          else
          {
            appendBuffer[appendBufferCount] = 59;
            ++*p_appendBufferCount;
          }
          goto LABEL_30;
        }
        if (appendBufferCount <= 1021)
        {
          *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
          v28 = 2;
          goto LABEL_38;
        }
        appendBuffer[appendBufferCount] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
        p_string = &self->_string;
        v33 = "; ";
        goto LABEL_43;
      case 2:
        p_appendBufferCount = &self->_appendBufferCount;
        v26 = self->_appendBufferCount;
        v27 = self->_appendBuffer;
        if (v26 <= 1022)
        {
          v27[v26] = 32;
          v28 = 1;
          goto LABEL_38;
        }
        v27[v26] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v27, 0x8000100u);
        p_string = &self->_string;
        v33 = " ";
LABEL_43:
        *p_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)*p_string, v33, 0x8000100u);
        break;
      case 3:
LABEL_30:
        v36 = self->_appendBufferCount;
        v37 = self->_appendBuffer;
        if (v36 > 1022)
        {
          v37[v36] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v37, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
        }
        else
        {
          v37[v36] = 10;
          ++self->_appendBufferCount;
        }
        goto LABEL_33;
      case 4:
LABEL_33:
        indentLevel = self->_indentLevel;
        if (indentLevel < 1)
          break;
        if (indentLevel >= 8)
          indentLevel = 8;
        v39 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
        v40 = strlen(v39);
        p_appendBufferCount = &self->_appendBufferCount;
        v41 = self->_appendBufferCount;
        if ((uint64_t)(v41 + v40) > 1023)
        {
          if (v41 >= 1)
          {
            self->_appendBuffer[v41] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            *p_appendBufferCount = 0;
          }
          CFStringAppendCString((CFMutableStringRef)self->_string, v39, 0x8000100u);
        }
        else
        {
          v28 = v40;
          memcpy(&self->_appendBuffer[v41], v39, v40);
LABEL_38:
          *p_appendBufferCount += v28;
        }
        break;
      default:
        goto LABEL_45;
    }
    self->_emitPhase = 0;
LABEL_45:
    if (!a4)
      goto LABEL_77;
    nameTruncation = v20->_nameTruncation;
    maximumNameLengthBeforeTruncation = v20->_maximumNameLengthBeforeTruncation;
    if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
    {
      self->_lineTruncation = 0;
    }
    else
    {
      self->_lineTruncation = nameTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
    }
    v45 = objc_msgSend(a4, "length");
    v46 = self->_appendBufferCount;
    if (v46 + 3 * v45 > 1023)
    {
      if (v46 >= 1)
      {
        self->_appendBuffer[v46] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      if (v45 > 341)
      {
        -[NSMutableString appendString:](self->_string, "appendString:", a4);
        goto LABEL_60;
      }
      usedBufLen = 0;
      v99.location = 0;
      v99.length = v45;
      CFStringGetBytes((CFStringRef)a4, v99, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      v47 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v98.location = 0;
      v98.length = v45;
      CFStringGetBytes((CFStringRef)a4, v98, 0x8000100u, 0, 0, &self->_appendBuffer[v46], 1024 - v46, &usedBufLen);
      v47 = self->_appendBufferCount + usedBufLen;
    }
    self->_appendBufferCount = v47;
LABEL_60:
    BSDescribeTruncationCommit((uint64_t)self);
    if (self->_proemNestCount <= 0)
      v48 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
    else
      v48 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
    v49 = *(unint64_t *)((char *)&self->_style->super.isa + *v48);
    if (v49 < 2)
    {
      v53 = self->_appendBufferCount;
      v54 = self->_appendBuffer;
      if (v53 <= 1021)
      {
        *(_WORD *)&v54[v53] = 8250;
        v52 = 2;
        goto LABEL_72;
      }
      v54[v53] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v54, 0x8000100u);
      v57 = ": ";
    }
    else if (v49 == 2)
    {
      v55 = self->_appendBufferCount;
      v56 = &self->_appendBuffer[v55];
      if (v55 <= 1020)
      {
        v56[2] = 32;
        *(_WORD *)v56 = 15648;
        v52 = 3;
        goto LABEL_72;
      }
      *v56 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      v57 = " = ";
    }
    else
    {
      if (v49 != 3)
        goto LABEL_77;
      v50 = self->_appendBufferCount;
      v51 = self->_appendBuffer;
      if (v50 <= 1019)
      {
        *(_DWORD *)&v51[v50] = 540945696;
        v52 = 4;
LABEL_72:
        self->_appendBufferCount += v52;
        goto LABEL_77;
      }
      v51[v50] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v51, 0x8000100u);
      v57 = " -> ";
    }
    self->_appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, v57, 0x8000100u);
LABEL_77:
    valueTruncation = v20->_valueTruncation;
    maximumValueLengthBeforeTruncation = v20->_maximumValueLengthBeforeTruncation;
    if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
    {
      maximumValueLengthBeforeTruncation = 0;
      v61 = 1096;
    }
    else
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      v61 = 1088;
    }
    *(Class *)((char *)&self->super.isa + v61) = (Class)maximumValueLengthBeforeTruncation;

    v62 = objc_msgSend(CFSTR("(inf)"), "length");
    v63 = self->_appendBufferCount;
    if (3 * v62 + v63 > 1023)
    {
      if (v63 >= 1)
      {
        self->_appendBuffer[v63] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      if (v62 > 341)
      {
        -[NSMutableString appendString:](self->_string, "appendString:", CFSTR("(inf)"));
        goto LABEL_91;
      }
      usedBufLen = 0;
      v101.location = 0;
      v101.length = v62;
      CFStringGetBytes(CFSTR("(inf)"), v101, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      v64 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v100.location = 0;
      v100.length = v62;
      CFStringGetBytes(CFSTR("(inf)"), v100, 0x8000100u, 0, 0, &self->_appendBuffer[v63], 1024 - v63, &usedBufLen);
      v64 = self->_appendBufferCount + usedBufLen;
    }
    self->_appendBufferCount = v64;
LABEL_91:
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
    goto LABEL_154;
  }
  v12 = (a3 - (double)(uint64_t)a3) * 1000.0;
  if (a5)
  {
    if (qword_1ECD39A10 != -1)
      dispatch_once(&qword_1ECD39A10, &__block_literal_global_24);
    objc_msgSend((id)_MergedGlobals_27, "stringFromTimeInterval:", a3);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (fabs(v12) >= 2.22044605e-16)
    {
      -[__CFString stringByAppendingFormat:](v13, "stringByAppendingFormat:", CFSTR(" %.0fms"), *(_QWORD *)&v12);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (__CFString *)v15;
    }
    v16 = self->_style;
    switch(self->_emitPhase)
    {
      case 1:
        v17 = &self->_appendBufferCount;
        v18 = self->_appendBufferCount;
        v19 = self->_appendBuffer;
        if (self->_style->_collectionLineBreak == 3)
        {
          if (v18 > 1022)
          {
            v19[v18] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v19, 0x8000100u);
            self->_appendBufferCount = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
          }
          else
          {
            v19[v18] = 59;
            ++*v17;
          }
          goto LABEL_93;
        }
        if (v18 <= 1021)
        {
          *(_WORD *)&v19[v18] = 8251;
          v31 = 2;
          goto LABEL_101;
        }
        v19[v18] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v19, 0x8000100u);
        v34 = &self->_string;
        v35 = "; ";
        goto LABEL_106;
      case 2:
        v17 = &self->_appendBufferCount;
        v29 = self->_appendBufferCount;
        v30 = self->_appendBuffer;
        if (v29 <= 1022)
        {
          v30[v29] = 32;
          v31 = 1;
          goto LABEL_101;
        }
        v30[v29] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v30, 0x8000100u);
        v34 = &self->_string;
        v35 = " ";
LABEL_106:
        *v17 = 0;
        CFStringAppendCString((CFMutableStringRef)*v34, v35, 0x8000100u);
        break;
      case 3:
LABEL_93:
        v65 = self->_appendBufferCount;
        v66 = self->_appendBuffer;
        if (v65 > 1022)
        {
          v66[v65] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v66, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
        }
        else
        {
          v66[v65] = 10;
          ++self->_appendBufferCount;
        }
        goto LABEL_96;
      case 4:
LABEL_96:
        v67 = self->_indentLevel;
        if (v67 < 1)
          break;
        if (v67 >= 8)
          v67 = 8;
        v68 = (const char *)*((_QWORD *)&sIndentSpaceStrings + v67);
        v69 = strlen(v68);
        v17 = &self->_appendBufferCount;
        v70 = self->_appendBufferCount;
        if ((uint64_t)(v70 + v69) > 1023)
        {
          if (v70 >= 1)
          {
            self->_appendBuffer[v70] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            *v17 = 0;
          }
          CFStringAppendCString((CFMutableStringRef)self->_string, v68, 0x8000100u);
        }
        else
        {
          v31 = v69;
          memcpy(&self->_appendBuffer[v70], v68, v69);
LABEL_101:
          *v17 += v31;
        }
        break;
      default:
        goto LABEL_108;
    }
    self->_emitPhase = 0;
LABEL_108:
    if (!a4)
      goto LABEL_138;
    v71 = v16->_nameTruncation;
    if (v71 < 2 || (v72 = v16->_maximumNameLengthBeforeTruncation, v72 < 1))
    {
      self->_lineTruncation = 0;
    }
    else
    {
      self->_lineTruncation = v71;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      self->_maximumLengthBeforeTruncation = v72;
    }
    v73 = objc_msgSend(a4, "length");
    v74 = self->_appendBufferCount;
    if (v74 + 3 * v73 > 1023)
    {
      if (v74 >= 1)
      {
        self->_appendBuffer[v74] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      if (v73 > 341)
      {
        -[NSMutableString appendString:](self->_string, "appendString:", a4);
        goto LABEL_121;
      }
      usedBufLen = 0;
      v103.location = 0;
      v103.length = v73;
      CFStringGetBytes((CFStringRef)a4, v103, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      v75 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v102.location = 0;
      v102.length = v73;
      CFStringGetBytes((CFStringRef)a4, v102, 0x8000100u, 0, 0, &self->_appendBuffer[v74], 1024 - v74, &usedBufLen);
      v75 = self->_appendBufferCount + usedBufLen;
    }
    self->_appendBufferCount = v75;
LABEL_121:
    BSDescribeTruncationCommit((uint64_t)self);
    if (self->_proemNestCount <= 0)
      v76 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
    else
      v76 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
    v77 = *(unint64_t *)((char *)&self->_style->super.isa + *v76);
    if (v77 < 2)
    {
      v81 = self->_appendBufferCount;
      v82 = self->_appendBuffer;
      if (v81 <= 1021)
      {
        *(_WORD *)&v82[v81] = 8250;
        v80 = 2;
        goto LABEL_133;
      }
      v82[v81] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v82, 0x8000100u);
      v85 = ": ";
LABEL_137:
      self->_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, v85, 0x8000100u);
      goto LABEL_138;
    }
    if (v77 == 2)
    {
      v83 = self->_appendBufferCount;
      v84 = &self->_appendBuffer[v83];
      if (v83 <= 1020)
      {
        v84[2] = 32;
        *(_WORD *)v84 = 15648;
        v80 = 3;
        goto LABEL_133;
      }
      *v84 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      v85 = " = ";
      goto LABEL_137;
    }
    if (v77 == 3)
    {
      v78 = self->_appendBufferCount;
      v79 = self->_appendBuffer;
      if (v78 <= 1019)
      {
        *(_DWORD *)&v79[v78] = 540945696;
        v80 = 4;
LABEL_133:
        self->_appendBufferCount += v80;
        goto LABEL_138;
      }
      v79[v78] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v79, 0x8000100u);
      v85 = " -> ";
      goto LABEL_137;
    }
LABEL_138:
    v86 = 0;
    v87 = v16->_valueTruncation;
    v88 = 1096;
    if (v87 >= 2)
    {
      v89 = v16->_maximumValueLengthBeforeTruncation;
      if (v89 >= 1)
      {
        self->_lineTruncation = v87;
        self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
        v88 = 1088;
        v86 = (objc_class *)v89;
      }
    }
    *(Class *)((char *)&self->super.isa + v88) = v86;

    if (v14)
    {
      v90 = -[__CFString length](v14, "length");
      v91 = self->_appendBufferCount;
      if (v91 + 3 * v90 > 1023)
      {
        if (v91 >= 1)
        {
          self->_appendBuffer[v91] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
        }
        if (v90 > 341)
        {
          -[NSMutableString appendString:](self->_string, "appendString:", v14);
          goto LABEL_153;
        }
        usedBufLen = 0;
        v105.location = 0;
        v105.length = v90;
        CFStringGetBytes(v14, v105, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
        v92 = usedBufLen;
      }
      else
      {
        usedBufLen = 0;
        v104.location = 0;
        v104.length = v90;
        CFStringGetBytes(v14, v104, 0x8000100u, 0, 0, &self->_appendBuffer[v91], 1024 - v91, &usedBufLen);
        v92 = self->_appendBufferCount + usedBufLen;
      }
    }
    else
    {
      v93 = self->_appendBufferCount;
      v94 = &self->_appendBuffer[v93];
      if (v93 > 1018)
      {
        *v94 = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
        goto LABEL_153;
      }
      v94[4] = 62;
      *(_DWORD *)v94 = 1818848828;
      v92 = self->_appendBufferCount + 5;
    }
    self->_appendBufferCount = v92;
LABEL_153:
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);

    goto LABEL_154;
  }
  if (fabs(v12) >= 2.22044605e-16)
    appended = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, CFSTR("%.2fs"), a5, v5, v6, v7, v8, SLOBYTE(a3));
  else
    appended = BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, CFSTR("%.1fs"), a5, v5, v6, v7, v8, SLOBYTE(a3));
  v25 = appended;
LABEL_154:
  v95 = self;
  return self;
}

- (BSDescriptionStream)initWithDescriptionStyle:(id)a3
{
  BSDescriptionStream *v5;
  id v6;
  NSMutableString *v7;
  NSMutableString *string;
  uint64_t v9;
  BSDescriptionStyle *style;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  BSDescriptionStream *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)BSDescriptionStream;
  v5 = -[BSDescriptionStream init](&v28, sel_init);
  if (v5)
  {
    v6 = a3;
    if (!v6)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("style"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v16;
        v31 = 2114;
        v32 = v18;
        v33 = 2048;
        v34 = v5;
        v35 = 2114;
        v36 = CFSTR("BSDescriptionStream.m");
        v37 = 1024;
        v38 = 97;
        v39 = 2114;
        v40 = v15;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1FA068);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = (objc_class *)objc_msgSend(v6, "classForCoder");
      if (!v20)
        v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("style"), v21, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v25;
        v31 = 2114;
        v32 = v27;
        v33 = 2048;
        v34 = v5;
        v35 = 2114;
        v36 = CFSTR("BSDescriptionStream.m");
        v37 = 1024;
        v38 = 97;
        v39 = 2114;
        v40 = v24;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1FA1B0);
    }

    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    string = v5->_string;
    v5->_string = v7;

    v9 = objc_msgSend(v6, "copy");
    style = v5->_style;
    v5->_style = (BSDescriptionStyle *)v9;

    v5->_truncationStartIndex = -1;
  }
  return v5;
}

+ (id)descriptionForRootObject:(id)a3 withStyle:(id)a4
{
  BSDescriptionStream *v5;
  id v6;
  void *v7;

  v5 = -[BSDescriptionStream initWithDescriptionStyle:]([BSDescriptionStream alloc], "initWithDescriptionStyle:", a4);
  v6 = -[BSDescriptionStream appendObject:withName:](v5, "appendObject:withName:", a3, 0);
  -[BSDescriptionStream description](v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setSortKeys:(BOOL)a3
{
  BSDescriptionStyle *v4;
  BSDescriptionStyle *style;
  id v6;
  _QWORD v7[4];
  BOOL v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__BSDescriptionStream_setSortKeys___block_invoke;
  v7[3] = &__block_descriptor_33_e35_v16__0__BSMutableDescriptionStyle_8l;
  v8 = a3;
  +[BSDescriptionStyle build:](BSDescriptionStyle, "build:", v7);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BSDescriptionStyle _styleByOverlayingStyle:](&self->_style->super.isa, (uint64_t)v6);
  v4 = (BSDescriptionStyle *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  self->_style = v4;

}

uint64_t __35__BSDescriptionStream_setSortKeys___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 32))
    v2 = 2;
  else
    v2 = 1;
  return objc_msgSend(a2, "setKeyValuePairSorting:", v2);
}

- (BOOL)sortKeys
{
  if (self)
    LOBYTE(self) = self->_style->_keyValuePairSorting == 2;
  return (char)self;
}

- (void)sameLine:(id)a3
{
  id v5;

  +[BSDescriptionStyle collectionLineBreakNoneStyle](BSDescriptionStyle, "collectionLineBreakNoneStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BSDescriptionStream _overlayStyle:block:]((uint64_t)self, (uint64_t)v5, (uint64_t)a3);

}

- (void)appendBodySectionWithOpenDelimiter:(id)a3 closeDelimiter:(id)a4 block:(id)a5
{
  -[BSDescriptionStream appendBodySectionWithName:openDelimiter:closeDelimiter:block:](self, "appendBodySectionWithName:openDelimiter:closeDelimiter:block:", 0, a3, a4, a5);
}

- (void)appendBodySectionWithName:(id)a3 block:(id)a4
{
  -[BSDescriptionStream appendBodySectionWithName:openDelimiter:closeDelimiter:block:](self, "appendBodySectionWithName:openDelimiter:closeDelimiter:block:", a3, CFSTR("{"), CFSTR("}"), a4);
}

CFIndex __59__BSDescriptionStream_appendCollection_withName_itemBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  CFIndex v2;
  uint64_t v3;
  CFIndex result;
  CFIndex v5;
  CFIndex usedBufLen;
  CFRange v7;
  CFRange v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_msgSend(CFSTR("…"), "length");
  v3 = *(_QWORD *)(v1 + 1040);
  if (3 * v2 + v3 <= 1023)
  {
    usedBufLen = 0;
    v7.location = 0;
    v7.length = v2;
    result = CFStringGetBytes(CFSTR("…"), v7, 0x8000100u, 0, 0, (UInt8 *)(v1 + v3 + 16), 1024 - v3, &usedBufLen);
    v5 = *(_QWORD *)(v1 + 1040) + usedBufLen;
LABEL_7:
    *(_QWORD *)(v1 + 1040) = v5;
    return result;
  }
  if (v3 >= 1)
  {
    *(_BYTE *)(v1 + 16 + v3) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v1 + 1064), (const char *)(v1 + 16), 0x8000100u);
    *(_QWORD *)(v1 + 1040) = 0;
  }
  if (v2 <= 341)
  {
    usedBufLen = 0;
    v8.location = 0;
    v8.length = v2;
    result = CFStringGetBytes(CFSTR("…"), v8, 0x8000100u, 0, 0, (UInt8 *)(v1 + 16), 1024, &usedBufLen);
    v5 = usedBufLen;
    goto LABEL_7;
  }
  return objc_msgSend(*(id *)(v1 + 1064), "appendString:", CFSTR("…"));
}

- (void)appendDictionary:(id)a3 withName:(id)a4 itemBlock:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__BSDescriptionStream_appendDictionary_withName_itemBlock___block_invoke;
  v5[3] = &unk_1E1EBF908;
  v5[4] = a5;
  -[BSDescriptionStream _appendDictionary:withName:itemBlock:]((uint64_t)self, a3, (__CFString *)a4, (uint64_t)v5);
}

uint64_t __59__BSDescriptionStream_appendDictionary_withName_itemBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v1);

}

CFIndex __60__BSDescriptionStream__appendDictionary_withName_itemBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  CFIndex v2;
  uint64_t v3;
  CFIndex result;
  CFIndex v5;
  CFIndex usedBufLen;
  CFRange v7;
  CFRange v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_msgSend(CFSTR("…"), "length");
  v3 = *(_QWORD *)(v1 + 1040);
  if (3 * v2 + v3 <= 1023)
  {
    usedBufLen = 0;
    v7.location = 0;
    v7.length = v2;
    result = CFStringGetBytes(CFSTR("…"), v7, 0x8000100u, 0, 0, (UInt8 *)(v1 + v3 + 16), 1024 - v3, &usedBufLen);
    v5 = *(_QWORD *)(v1 + 1040) + usedBufLen;
LABEL_7:
    *(_QWORD *)(v1 + 1040) = v5;
    return result;
  }
  if (v3 >= 1)
  {
    *(_BYTE *)(v1 + 16 + v3) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v1 + 1064), (const char *)(v1 + 16), 0x8000100u);
    *(_QWORD *)(v1 + 1040) = 0;
  }
  if (v2 <= 341)
  {
    usedBufLen = 0;
    v8.location = 0;
    v8.length = v2;
    result = CFStringGetBytes(CFSTR("…"), v8, 0x8000100u, 0, 0, (UInt8 *)(v1 + 16), 1024, &usedBufLen);
    v5 = usedBufLen;
    goto LABEL_7;
  }
  return objc_msgSend(*(id *)(v1 + 1064), "appendString:", CFSTR("…"));
}

- (void)appendIntegerSet:(id)a3 withName:(id)a4 format:(int64_t)a5
{
  BSDescriptionStyle *v9;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  NSMutableString **p_string;
  const char *v17;
  int64_t v18;
  unsigned __int8 *v19;
  int64_t indentLevel;
  const char *v21;
  size_t v22;
  int64_t v23;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  uint64_t v27;
  CFIndex v28;
  int64_t v29;
  CFIndex v30;
  int *v31;
  unint64_t v32;
  int64_t v33;
  unsigned __int8 *v34;
  uint64_t v35;
  int64_t v36;
  unsigned __int8 *v37;
  int64_t v38;
  unsigned __int8 *v39;
  const char *v40;
  objc_class *v41;
  int64_t valueTruncation;
  uint64_t v43;
  uint64_t maximumValueLengthBeforeTruncation;
  uint64_t v45;
  _QWORD v46[7];
  CFIndex usedBufLen;
  CFRange v48;
  CFRange v49;

  if (!a4)
    goto LABEL_62;
  v9 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_12;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v15 = 2;
        goto LABEL_20;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v17 = "; ";
      goto LABEL_25;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v13 = self->_appendBufferCount;
      v14 = self->_appendBuffer;
      if (v13 <= 1022)
      {
        v14[v13] = 32;
        v15 = 1;
        goto LABEL_20;
      }
      v14[v13] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v14, 0x8000100u);
      p_string = &self->_string;
      v17 = " ";
LABEL_25:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v17, 0x8000100u);
      break;
    case 3:
LABEL_12:
      v18 = self->_appendBufferCount;
      v19 = self->_appendBuffer;
      if (v18 > 1022)
      {
        v19[v18] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v19, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v19[v18] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_15;
    case 4:
LABEL_15:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v21 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v22 = strlen(v21);
      p_appendBufferCount = &self->_appendBufferCount;
      v23 = self->_appendBufferCount;
      if ((uint64_t)(v23 + v22) > 1023)
      {
        if (v23 >= 1)
        {
          self->_appendBuffer[v23] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v21, 0x8000100u);
      }
      else
      {
        v15 = v22;
        memcpy(&self->_appendBuffer[v23], v21, v22);
LABEL_20:
        *p_appendBufferCount += v15;
      }
      break;
    default:
      goto LABEL_27;
  }
  self->_emitPhase = 0;
LABEL_27:
  nameTruncation = v9->_nameTruncation;
  maximumNameLengthBeforeTruncation = v9->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    maximumNameLengthBeforeTruncation = 0;
    v27 = 1096;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v27 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v27) = (Class)maximumNameLengthBeforeTruncation;
  v28 = objc_msgSend(a4, "length");
  v29 = self->_appendBufferCount;
  if (v29 + 3 * v28 <= 1023)
  {
    usedBufLen = 0;
    v48.location = 0;
    v48.length = v28;
    CFStringGetBytes((CFStringRef)a4, v48, 0x8000100u, 0, 0, &self->_appendBuffer[v29], 1024 - v29, &usedBufLen);
    v30 = self->_appendBufferCount + usedBufLen;
LABEL_39:
    self->_appendBufferCount = v30;
    goto LABEL_41;
  }
  if (v29 >= 1)
  {
    self->_appendBuffer[v29] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
  }
  if (v28 <= 341)
  {
    usedBufLen = 0;
    v49.location = 0;
    v49.length = v28;
    CFStringGetBytes((CFStringRef)a4, v49, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v30 = usedBufLen;
    goto LABEL_39;
  }
  -[NSMutableString appendString:](self->_string, "appendString:", a4);
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v31 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v31 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v32 = *(unint64_t *)((char *)&self->_style->super.isa + *v31);
  if (v32 < 2)
  {
    v36 = self->_appendBufferCount;
    v37 = self->_appendBuffer;
    if (v36 <= 1021)
    {
      *(_WORD *)&v37[v36] = 8250;
      v35 = 2;
      goto LABEL_53;
    }
    v37[v36] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v37, 0x8000100u);
    v40 = ": ";
  }
  else if (v32 == 2)
  {
    v38 = self->_appendBufferCount;
    v39 = &self->_appendBuffer[v38];
    if (v38 <= 1020)
    {
      v39[2] = 32;
      *(_WORD *)v39 = 15648;
      v35 = 3;
      goto LABEL_53;
    }
    *v39 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v40 = " = ";
  }
  else
  {
    if (v32 != 3)
      goto LABEL_58;
    v33 = self->_appendBufferCount;
    v34 = self->_appendBuffer;
    if (v33 <= 1019)
    {
      *(_DWORD *)&v34[v33] = 540945696;
      v35 = 4;
LABEL_53:
      self->_appendBufferCount += v35;
      goto LABEL_58;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    v40 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v40, 0x8000100u);
LABEL_58:
  v41 = 0;
  valueTruncation = v9->_valueTruncation;
  v43 = 1096;
  if (valueTruncation >= 2)
  {
    maximumValueLengthBeforeTruncation = v9->_maximumValueLengthBeforeTruncation;
    if (maximumValueLengthBeforeTruncation >= 1)
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      v43 = 1088;
      v41 = (objc_class *)maximumValueLengthBeforeTruncation;
    }
  }
  *(Class *)((char *)&self->super.isa + v43) = v41;

LABEL_62:
  v45 = objc_msgSend(a3, "count");
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __56__BSDescriptionStream_appendIntegerSet_withName_format___block_invoke;
  v46[3] = &unk_1E1EBF550;
  v46[5] = a3;
  v46[6] = a5;
  v46[4] = self;
  if (self)
    -[BSDescriptionStream _appendSectionWithTotalItemCount:truncatedItemCount:openDelimiter:closeDelimiter:block:]((uint64_t)self, v45, v45, CFSTR("("), CFSTR(")"), (uint64_t)v46);
  if (a4)
  {
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
  }
}

void __56__BSDescriptionStream_appendIntegerSet_withName_format___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__BSDescriptionStream_appendIntegerSet_withName_format___block_invoke_2;
  v5[3] = &unk_1E1EBF9A8;
  v2 = *(_QWORD *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = v2;
  v3 = (void *)MEMORY[0x18D769CFC](v5);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 && *(_QWORD *)(*(_QWORD *)(v4 + 8) + 88) == 2)
    objc_msgSend(*(id *)(a1 + 40), "enumerateSortedWithBlock:", v3);
  else
    objc_msgSend(*(id *)(a1 + 40), "enumerateWithBlock:", v3);

}

void __56__BSDescriptionStream_appendIntegerSet_withName_format___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v3[4];
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__BSDescriptionStream_appendIntegerSet_withName_format___block_invoke_3;
  v3[3] = &unk_1E1EBF980;
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v6 = a2;
  BSDescribeAppendItem(v4, (uint64_t)v3);
}

uint64_t __56__BSDescriptionStream_appendIntegerSet_withName_format___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;

  v2 = a1[4];
  v3 = *(_QWORD *)(v2 + 1040);
  if (v3 >= 1)
  {
    *(_BYTE *)(v2 + 16 + v3) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
    *(_QWORD *)(v2 + 1040) = 0;
    v2 = a1[4];
  }
  if (a1[5] == 1)
    v4 = CFSTR("%tX");
  else
    v4 = CFSTR("%td");
  return objc_msgSend(*(id *)(v2 + 1064), "appendFormat:", v4, a1[6]);
}

- (void)appendIntegerMap:(id)a3 withName:(id)a4 keyFormat:(int64_t)a5 valueBlock:(id)a6
{
  BSDescriptionStyle *v11;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  NSMutableString **p_string;
  const char *v19;
  int64_t v20;
  unsigned __int8 *v21;
  int64_t indentLevel;
  const char *v23;
  size_t v24;
  int64_t v25;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  uint64_t v29;
  CFIndex v30;
  int64_t v31;
  CFIndex v32;
  int *v33;
  unint64_t v34;
  int64_t v35;
  unsigned __int8 *v36;
  uint64_t v37;
  int64_t v38;
  unsigned __int8 *v39;
  int64_t v40;
  unsigned __int8 *v41;
  const char *v42;
  objc_class *v43;
  int64_t valueTruncation;
  uint64_t v45;
  uint64_t maximumValueLengthBeforeTruncation;
  uint64_t v47;
  _QWORD v48[8];
  CFIndex usedBufLen;
  CFRange v50;
  CFRange v51;

  if (!a4)
    goto LABEL_62;
  v11 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_12;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v17 = 2;
        goto LABEL_20;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v19 = "; ";
      goto LABEL_25;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v15 = self->_appendBufferCount;
      v16 = self->_appendBuffer;
      if (v15 <= 1022)
      {
        v16[v15] = 32;
        v17 = 1;
        goto LABEL_20;
      }
      v16[v15] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v16, 0x8000100u);
      p_string = &self->_string;
      v19 = " ";
LABEL_25:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v19, 0x8000100u);
      break;
    case 3:
LABEL_12:
      v20 = self->_appendBufferCount;
      v21 = self->_appendBuffer;
      if (v20 > 1022)
      {
        v21[v20] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v21, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v21[v20] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_15;
    case 4:
LABEL_15:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v23 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v24 = strlen(v23);
      p_appendBufferCount = &self->_appendBufferCount;
      v25 = self->_appendBufferCount;
      if ((uint64_t)(v25 + v24) > 1023)
      {
        if (v25 >= 1)
        {
          self->_appendBuffer[v25] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v23, 0x8000100u);
      }
      else
      {
        v17 = v24;
        memcpy(&self->_appendBuffer[v25], v23, v24);
LABEL_20:
        *p_appendBufferCount += v17;
      }
      break;
    default:
      goto LABEL_27;
  }
  self->_emitPhase = 0;
LABEL_27:
  nameTruncation = v11->_nameTruncation;
  maximumNameLengthBeforeTruncation = v11->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    maximumNameLengthBeforeTruncation = 0;
    v29 = 1096;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v29 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v29) = (Class)maximumNameLengthBeforeTruncation;
  v30 = objc_msgSend(a4, "length");
  v31 = self->_appendBufferCount;
  if (v31 + 3 * v30 <= 1023)
  {
    usedBufLen = 0;
    v50.location = 0;
    v50.length = v30;
    CFStringGetBytes((CFStringRef)a4, v50, 0x8000100u, 0, 0, &self->_appendBuffer[v31], 1024 - v31, &usedBufLen);
    v32 = self->_appendBufferCount + usedBufLen;
LABEL_39:
    self->_appendBufferCount = v32;
    goto LABEL_41;
  }
  if (v31 >= 1)
  {
    self->_appendBuffer[v31] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
  }
  if (v30 <= 341)
  {
    usedBufLen = 0;
    v51.location = 0;
    v51.length = v30;
    CFStringGetBytes((CFStringRef)a4, v51, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v32 = usedBufLen;
    goto LABEL_39;
  }
  -[NSMutableString appendString:](self->_string, "appendString:", a4);
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v33 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v33 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v34 = *(unint64_t *)((char *)&self->_style->super.isa + *v33);
  if (v34 < 2)
  {
    v38 = self->_appendBufferCount;
    v39 = self->_appendBuffer;
    if (v38 <= 1021)
    {
      *(_WORD *)&v39[v38] = 8250;
      v37 = 2;
      goto LABEL_53;
    }
    v39[v38] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v39, 0x8000100u);
    v42 = ": ";
  }
  else if (v34 == 2)
  {
    v40 = self->_appendBufferCount;
    v41 = &self->_appendBuffer[v40];
    if (v40 <= 1020)
    {
      v41[2] = 32;
      *(_WORD *)v41 = 15648;
      v37 = 3;
      goto LABEL_53;
    }
    *v41 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v42 = " = ";
  }
  else
  {
    if (v34 != 3)
      goto LABEL_58;
    v35 = self->_appendBufferCount;
    v36 = self->_appendBuffer;
    if (v35 <= 1019)
    {
      *(_DWORD *)&v36[v35] = 540945696;
      v37 = 4;
LABEL_53:
      self->_appendBufferCount += v37;
      goto LABEL_58;
    }
    v36[v35] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v36, 0x8000100u);
    v42 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v42, 0x8000100u);
LABEL_58:
  v43 = 0;
  valueTruncation = v11->_valueTruncation;
  v45 = 1096;
  if (valueTruncation >= 2)
  {
    maximumValueLengthBeforeTruncation = v11->_maximumValueLengthBeforeTruncation;
    if (maximumValueLengthBeforeTruncation >= 1)
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      v45 = 1088;
      v43 = (objc_class *)maximumValueLengthBeforeTruncation;
    }
  }
  *(Class *)((char *)&self->super.isa + v45) = v43;

LABEL_62:
  v47 = objc_msgSend(a3, "count");
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke;
  v48[3] = &unk_1E1EBFA48;
  v48[6] = a6;
  v48[7] = a5;
  v48[4] = self;
  v48[5] = a3;
  if (self)
    -[BSDescriptionStream _appendSectionWithTotalItemCount:truncatedItemCount:openDelimiter:closeDelimiter:block:]((uint64_t)self, v47, v47, CFSTR("{"), CFSTR("}"), (uint64_t)v48);
  if (a4)
  {
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
  }
}

void __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[7];

  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke_2;
  v9[3] = &unk_1E1EBF9F8;
  v3 = *(_QWORD *)(a1 + 56);
  v9[5] = *(_QWORD *)(a1 + 48);
  v9[6] = v3;
  v9[4] = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x18D769CFC](v9);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5 && *(_QWORD *)(*(_QWORD *)(v5 + 8) + 88) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke_4;
    v7[3] = &unk_1E1EBFA20;
    v7[4] = *(_QWORD *)(a1 + 40);
    v8 = v4;
    objc_msgSend(v6, "enumerateSortedWithBlock:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "enumerateWithBlock:", v4);
  }

}

void __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[9];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke_3;
  v5[3] = &unk_1E1EBF9D0;
  v3 = a1[5];
  v5[7] = a1[6];
  v5[8] = a2;
  v4 = a1[4];
  v5[5] = a3;
  v5[6] = v3;
  v5[4] = v4;
  BSDescribeAppendItem(v4, (uint64_t)v5);
}

uint64_t __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;

  v2 = a1[4];
  v3 = *(_QWORD *)(v2 + 1040);
  if (v3 >= 1)
  {
    *(_BYTE *)(v2 + 16 + v3) = 0;
    CFStringAppendCString(*(CFMutableStringRef *)(v2 + 1064), (const char *)(v2 + 16), 0x8000100u);
    *(_QWORD *)(v2 + 1040) = 0;
    v2 = a1[4];
  }
  if (a1[7] == 1)
    v4 = CFSTR("%tX: ");
  else
    v4 = CFSTR("%td: ");
  objc_msgSend(*(id *)(v2 + 1064), "appendFormat:", v4, a1[8]);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __70__BSDescriptionStream_appendIntegerMap_withName_keyFormat_valueBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)appendCustomFormatForValue:(id)a3 withCustomFormatForName:(id)a4
{
  BOOL forceSuccinct;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v10;
  unsigned __int8 *v11;
  int64_t v12;
  NSMutableString *string;
  const char *v14;
  int64_t v15;
  unsigned __int8 *v16;
  int64_t indentLevel;
  const char *v18;
  size_t v19;
  int64_t v20;
  size_t v21;
  int *v22;
  unint64_t v23;
  int64_t v24;
  unsigned __int8 *v25;
  int64_t v26;
  int64_t v27;
  unsigned __int8 *v28;
  int64_t v29;
  unsigned __int8 *v30;
  NSMutableString *v31;
  const char *v32;

  forceSuccinct = self->_forceSuccinct;
  self->_forceSuccinct = 1;
  switch(self->_emitPhase)
  {
    case 1:
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++self->_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v12 = self->_appendBufferCount + 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
      string = self->_string;
      v14 = "; ";
      goto LABEL_24;
    case 2:
      v10 = self->_appendBufferCount;
      v11 = self->_appendBuffer;
      if (v10 <= 1022)
      {
        v11[v10] = 32;
        v12 = self->_appendBufferCount + 1;
        goto LABEL_19;
      }
      v11[v10] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v11, 0x8000100u);
      self->_appendBufferCount = 0;
      string = self->_string;
      v14 = " ";
      goto LABEL_24;
    case 3:
LABEL_11:
      v15 = self->_appendBufferCount;
      v16 = self->_appendBuffer;
      if (v15 > 1022)
      {
        v16[v15] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v16, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v16[v15] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        goto LABEL_25;
      if (indentLevel >= 8)
        indentLevel = 8;
      v18 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v19 = strlen(v18);
      v20 = self->_appendBufferCount;
      if ((uint64_t)(v20 + v19) > 1023)
      {
        if (v20 >= 1)
        {
          self->_appendBuffer[v20] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
        }
        string = self->_string;
        v14 = v18;
LABEL_24:
        CFStringAppendCString((CFMutableStringRef)string, v14, 0x8000100u);
      }
      else
      {
        v21 = v19;
        memcpy(&self->_appendBuffer[v20], v18, v19);
        v12 = self->_appendBufferCount + v21;
LABEL_19:
        self->_appendBufferCount = v12;
      }
LABEL_25:
      self->_emitPhase = 0;
LABEL_26:
      (*((void (**)(id, BSDescriptionStream *))a4 + 2))(a4, self);
      if (self->_proemNestCount <= 0)
        v22 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
      else
        v22 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
      v23 = *(unint64_t *)((char *)&self->_style->super.isa + *v22);
      if (v23 < 2)
      {
        v27 = self->_appendBufferCount;
        v28 = self->_appendBuffer;
        if (v27 <= 1021)
        {
          *(_WORD *)&v28[v27] = 8250;
          v26 = self->_appendBufferCount + 2;
          goto LABEL_38;
        }
        v28[v27] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v28, 0x8000100u);
        self->_appendBufferCount = 0;
        v31 = self->_string;
        v32 = ": ";
      }
      else if (v23 == 2)
      {
        v29 = self->_appendBufferCount;
        v30 = &self->_appendBuffer[v29];
        if (v29 <= 1020)
        {
          v30[2] = 32;
          *(_WORD *)v30 = 15648;
          v26 = self->_appendBufferCount + 3;
          goto LABEL_38;
        }
        *v30 = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
        v31 = self->_string;
        v32 = " = ";
      }
      else
      {
        if (v23 != 3)
          goto LABEL_43;
        v24 = self->_appendBufferCount;
        v25 = self->_appendBuffer;
        if (v24 <= 1019)
        {
          *(_DWORD *)&v25[v24] = 540945696;
          v26 = self->_appendBufferCount + 4;
LABEL_38:
          self->_appendBufferCount = v26;
          goto LABEL_43;
        }
        v25[v24] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v25, 0x8000100u);
        self->_appendBufferCount = 0;
        v31 = self->_string;
        v32 = " -> ";
      }
      CFStringAppendCString((CFMutableStringRef)v31, v32, 0x8000100u);
LABEL_43:
      self->_forceSuccinct = forceSuccinct;
      (*((void (**)(id, BSDescriptionStream *))a3 + 2))(a3, self);
      self->_emitPhase = 1;
      BSDescribeTruncationCommit((uint64_t)self);
      return;
    default:
      goto LABEL_26;
  }
}

- (void)appendCustomFormatWithNameFromObjectDescription:(id)a3 block:(id)a4
{
  BSDescriptionStyle *v7;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  NSMutableString **p_string;
  const char *v15;
  int64_t v16;
  unsigned __int8 *v17;
  int64_t indentLevel;
  const char *v19;
  size_t v20;
  int64_t v21;
  BOOL forceSuccinct;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v26;
  int64_t v27;
  CFIndex v28;
  id v29;
  int v30;
  int64_t v31;
  NSMutableString *string;
  double v33;
  const __CFString *v34;
  int64_t v35;
  NSMutableString *v36;
  uint64_t v37;
  int64_t v38;
  const __CFString *v39;
  int64_t v40;
  int64_t v41;
  int64_t v42;
  int64_t v43;
  int64_t v44;
  float v45;
  int64_t v46;
  int64_t v47;
  int64_t v48;
  int64_t v49;
  int64_t v50;
  int *v51;
  unint64_t v52;
  int64_t *v53;
  int64_t v54;
  unsigned __int8 *v55;
  uint64_t v56;
  int64_t v57;
  unsigned __int8 *v58;
  int64_t v59;
  unsigned __int8 *v60;
  NSMutableString **v61;
  const char *v62;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v66;
  BSDescriptionStyle *style;
  __CFString *v68;
  __CFString *v69;
  CFIndex v70;
  int64_t v71;
  CFIndex v72;
  CFIndex usedBufLen;
  uint64_t v74;
  void *v75;
  void *v76;
  BSDescriptionStream *v77;
  CFRange v78;
  CFRange v79;
  CFRange v80;
  CFRange v81;

  v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v15 = "; ";
      goto LABEL_24;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v11 = self->_appendBufferCount;
      v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      v15 = " ";
LABEL_24:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v16 = self->_appendBufferCount;
      v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v19 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v20 = strlen(v19);
      p_appendBufferCount = &self->_appendBufferCount;
      v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a3)
    goto LABEL_123;
  forceSuccinct = self->_forceSuccinct;
  self->_forceSuccinct = 1;
  nameTruncation = v7->_nameTruncation;
  maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  if (!_NSIsNSString())
  {
    if (_NSIsNSNumber())
    {
      v29 = objc_retainAutorelease(a3);
      v30 = *(char *)objc_msgSend(v29, "objCType");
      if (v30 > 80)
      {
        switch(v30)
        {
          case 'c':
            goto LABEL_65;
          case 'd':
            v31 = self->_appendBufferCount;
            if (v31 >= 1)
            {
              self->_appendBuffer[v31] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_appendBufferCount = 0;
            }
            string = self->_string;
            objc_msgSend(v29, "doubleValue");
            v34 = CFSTR("%0.16g");
            goto LABEL_87;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_79;
          case 'f':
            v44 = self->_appendBufferCount;
            if (v44 >= 1)
            {
              self->_appendBuffer[v44] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_appendBufferCount = 0;
            }
            string = self->_string;
            objc_msgSend(v29, "floatValue");
            v33 = v45;
            v34 = CFSTR("%0.7g");
LABEL_87:
            -[NSMutableString appendFormat:](string, "appendFormat:", v34, *(_QWORD *)&v33);
            goto LABEL_105;
          case 'i':
            v46 = self->_appendBufferCount;
            if (v46 >= 1)
            {
              self->_appendBuffer[v46] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_appendBufferCount = 0;
            }
            v36 = self->_string;
            v37 = objc_msgSend(v29, "intValue");
            goto LABEL_91;
          case 'l':
            v47 = self->_appendBufferCount;
            if (v47 >= 1)
            {
              self->_appendBuffer[v47] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_appendBufferCount = 0;
            }
            v36 = self->_string;
            v37 = objc_msgSend(v29, "longValue");
            v39 = CFSTR("%ld");
            goto LABEL_104;
          case 'q':
            v48 = self->_appendBufferCount;
            if (v48 >= 1)
            {
              self->_appendBuffer[v48] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_appendBufferCount = 0;
            }
            v36 = self->_string;
            v37 = objc_msgSend(v29, "longLongValue");
            v39 = CFSTR("%lld");
            goto LABEL_104;
          case 's':
            v49 = self->_appendBufferCount;
            if (v49 >= 1)
            {
              self->_appendBuffer[v49] = 0;
              CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
              self->_appendBufferCount = 0;
            }
            v36 = self->_string;
            v37 = objc_msgSend(v29, "shortValue");
            v39 = CFSTR("%hi");
            goto LABEL_104;
          default:
            if (v30 == 81)
            {
              v50 = self->_appendBufferCount;
              if (v50 >= 1)
              {
                self->_appendBuffer[v50] = 0;
                CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
                self->_appendBufferCount = 0;
              }
              v36 = self->_string;
              v37 = objc_msgSend(v29, "unsignedLongLongValue");
              v39 = CFSTR("%llu");
            }
            else
            {
              if (v30 != 83)
                goto LABEL_79;
              v41 = self->_appendBufferCount;
              if (v41 >= 1)
              {
                self->_appendBuffer[v41] = 0;
                CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
                self->_appendBufferCount = 0;
              }
              v36 = self->_string;
              v37 = objc_msgSend(v29, "unsignedShortValue");
              v39 = CFSTR("%hu");
            }
            break;
        }
        goto LABEL_104;
      }
      if (v30 > 72)
      {
        if (v30 == 73)
        {
          v42 = self->_appendBufferCount;
          if (v42 >= 1)
          {
            self->_appendBuffer[v42] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_appendBufferCount = 0;
          }
          v36 = self->_string;
          v37 = objc_msgSend(v29, "unsignedIntValue");
          goto LABEL_78;
        }
        if (v30 == 76)
        {
          v38 = self->_appendBufferCount;
          if (v38 >= 1)
          {
            self->_appendBuffer[v38] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_appendBufferCount = 0;
          }
          v36 = self->_string;
          v37 = objc_msgSend(v29, "unsignedLongValue");
          v39 = CFSTR("%lu");
          goto LABEL_104;
        }
      }
      else
      {
        if (v30 == 66)
        {
LABEL_65:
          v40 = self->_appendBufferCount;
          if (v40 >= 1)
          {
            self->_appendBuffer[v40] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_appendBufferCount = 0;
          }
          v36 = self->_string;
          v37 = objc_msgSend(v29, "charValue");
LABEL_91:
          v39 = CFSTR("%d");
          goto LABEL_104;
        }
        if (v30 == 67)
        {
          v35 = self->_appendBufferCount;
          if (v35 >= 1)
          {
            self->_appendBuffer[v35] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            self->_appendBufferCount = 0;
          }
          v36 = self->_string;
          v37 = objc_msgSend(v29, "unsignedCharValue");
LABEL_78:
          v39 = CFSTR("%u");
LABEL_104:
          -[NSMutableString appendFormat:](v36, "appendFormat:", v39, v37);
LABEL_105:

          goto LABEL_106;
        }
      }
LABEL_79:
      v43 = self->_appendBufferCount;
      if (v43 >= 1)
      {
        self->_appendBuffer[v43] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      -[NSMutableString appendFormat:](self->_string, "appendFormat:", CFSTR("<***unknown type:%s>"), objc_msgSend(objc_retainAutorelease(v29), "objCType"));
      goto LABEL_105;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a3, "appendDescriptionToStream:", self);
      goto LABEL_106;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a3, "appendDescriptionToFormatter:", self);
      goto LABEL_106;
    }
    if (_NSIsNSDictionary())
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v74 = 3221225472;
      v75 = __BSDescribeAppendObjectDescription_block_invoke;
      v76 = &unk_1E1EBFB08;
      v77 = self;
      -[BSDescriptionStream _appendDictionary:withName:itemBlock:]((uint64_t)self, a3, 0, (uint64_t)&usedBufLen);
      goto LABEL_106;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[BSDescriptionStream appendIntegerSet:withName:format:](self, "appendIntegerSet:withName:format:", a3, 0, 0);
      goto LABEL_106;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v74 = 3221225472;
      v75 = __BSDescribeAppendObjectDescription_block_invoke_2;
      v76 = &unk_1E1EBFB30;
      v77 = self;
      -[BSDescriptionStream appendIntegerMap:withName:keyFormat:valueBlock:](self, "appendIntegerMap:withName:keyFormat:valueBlock:", a3, 0, 0, &usedBufLen);
      goto LABEL_106;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      usedBufLen = MEMORY[0x1E0C809B0];
      v74 = 3221225472;
      v75 = __BSDescribeAppendObjectDescription_block_invoke_3;
      v76 = &unk_1E1EBFB30;
      v77 = self;
      -[BSDescriptionStream appendCollection:withName:itemBlock:](self, "appendCollection:withName:itemBlock:", a3, 0, &usedBufLen);
      goto LABEL_106;
    }
    if (self->_forceSuccinct || (style = self->_style, style->_verbosity == 2))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(a3, "succinctDescription");
        v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_141;
      }
      style = self->_style;
    }
    if (style->_debugging == 2)
      objc_msgSend(a3, "debugDescription");
    else
      objc_msgSend(a3, "description");
    v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_141:
    v69 = v68;
    v70 = -[__CFString length](v68, "length");
    v71 = self->_appendBufferCount;
    if (v71 + 3 * v70 > 1023)
    {
      if (v71 >= 1)
      {
        self->_appendBuffer[v71] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      if (v70 > 341)
      {
        -[NSMutableString appendString:](self->_string, "appendString:", v69);
        goto LABEL_149;
      }
      usedBufLen = 0;
      v81.location = 0;
      v81.length = v70;
      CFStringGetBytes(v69, v81, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      v72 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v80.location = 0;
      v80.length = v70;
      CFStringGetBytes(v69, v80, 0x8000100u, 0, 0, &self->_appendBuffer[v71], 1024 - v71, &usedBufLen);
      v72 = self->_appendBufferCount + usedBufLen;
    }
    self->_appendBufferCount = v72;
LABEL_149:

    goto LABEL_106;
  }
  v26 = objc_msgSend(a3, "length");
  v27 = self->_appendBufferCount;
  if (v27 + 3 * v26 > 1023)
  {
    if (v27 >= 1)
    {
      self->_appendBuffer[v27] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v26 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a3);
      goto LABEL_106;
    }
    usedBufLen = 0;
    v79.location = 0;
    v79.length = v26;
    CFStringGetBytes((CFStringRef)a3, v79, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v28 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v78.location = 0;
    v78.length = v26;
    CFStringGetBytes((CFStringRef)a3, v78, 0x8000100u, 0, 0, &self->_appendBuffer[v27], 1024 - v27, &usedBufLen);
    v28 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v28;
LABEL_106:
  BSDescribeTruncationCommit((uint64_t)self);
  self->_forceSuccinct = forceSuccinct;
  if (self->_proemNestCount <= 0)
    v51 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v51 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v52 = *(unint64_t *)((char *)&self->_style->super.isa + *v51);
  if (v52 < 2)
  {
    v53 = &self->_appendBufferCount;
    v57 = self->_appendBufferCount;
    v58 = self->_appendBuffer;
    if (v57 <= 1021)
    {
      *(_WORD *)&v58[v57] = 8250;
      v56 = 2;
      goto LABEL_118;
    }
    v58[v57] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v58, 0x8000100u);
    v61 = &self->_string;
    v62 = ": ";
  }
  else if (v52 == 2)
  {
    v53 = &self->_appendBufferCount;
    v59 = self->_appendBufferCount;
    v60 = &self->_appendBuffer[v59];
    if (v59 <= 1020)
    {
      v60[2] = 32;
      *(_WORD *)v60 = 15648;
      v56 = 3;
      goto LABEL_118;
    }
    *v60 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v61 = &self->_string;
    v62 = " = ";
  }
  else
  {
    if (v52 != 3)
      goto LABEL_123;
    v53 = &self->_appendBufferCount;
    v54 = self->_appendBufferCount;
    v55 = self->_appendBuffer;
    if (v54 <= 1019)
    {
      *(_DWORD *)&v55[v54] = 540945696;
      v56 = 4;
LABEL_118:
      *v53 += v56;
      goto LABEL_123;
    }
    v55[v54] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v55, 0x8000100u);
    v61 = &self->_string;
    v62 = " -> ";
  }
  *v53 = 0;
  CFStringAppendCString((CFMutableStringRef)*v61, v62, 0x8000100u);
LABEL_123:
  valueTruncation = v7->_valueTruncation;
  maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v66 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v66 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v66) = (Class)maximumValueLengthBeforeTruncation;

  (*((void (**)(id, BSDescriptionStream *))a4 + 2))(a4, self);
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
}

- (void)appendString:(id)a3
{
  CFIndex v5;
  int64_t appendBufferCount;
  CFIndex v7;
  CFIndex usedBufLen;
  CFRange v9;
  CFRange v10;

  v5 = objc_msgSend(a3, "length");
  appendBufferCount = self->_appendBufferCount;
  if (3 * v5 + appendBufferCount <= 1023)
  {
    usedBufLen = 0;
    v9.location = 0;
    v9.length = v5;
    CFStringGetBytes((CFStringRef)a3, v9, 0x8000100u, 0, 0, &self->_appendBuffer[appendBufferCount], 1024 - appendBufferCount, &usedBufLen);
    v7 = self->_appendBufferCount + usedBufLen;
LABEL_7:
    self->_appendBufferCount = v7;
    return;
  }
  if (appendBufferCount >= 1)
  {
    self->_appendBuffer[appendBufferCount] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
  }
  if (v5 <= 341)
  {
    usedBufLen = 0;
    v10.location = 0;
    v10.length = v5;
    CFStringGetBytes((CFStringRef)a3, v10, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v7 = usedBufLen;
    goto LABEL_7;
  }
  -[NSMutableString appendString:](self->_string, "appendString:", a3);
}

- (id)style
{
  return self->_style;
}

- (BOOL)hasSuccinctStyle
{
  return self->_forceSuccinct || self->_style->_verbosity == 2;
}

- (BOOL)hasDebugStyle
{
  return self->_style->_debugging == 2;
}

- (id)appendBool:(BOOL)a3 withName:(id)a4
{
  _BOOL4 v5;
  const char *v7;
  BSDescriptionStyle *v8;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  NSMutableString **p_string;
  const char *v16;
  int64_t v17;
  unsigned __int8 *v18;
  int64_t indentLevel;
  const char *v20;
  size_t v21;
  int64_t v22;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v26;
  int64_t v27;
  CFIndex v28;
  int *v29;
  unint64_t v30;
  int64_t v31;
  unsigned __int8 *v32;
  uint64_t v33;
  int64_t v34;
  unsigned __int8 *v35;
  int64_t v36;
  unsigned __int8 *v37;
  const char *v38;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v42;
  size_t v43;
  int64_t v44;
  CFIndex usedBufLen;
  CFRange v47;
  CFRange v48;

  v5 = a3;
  if (a3)
    v7 = "YES";
  else
    v7 = "NO";
  v8 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_14;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v14 = 2;
        goto LABEL_22;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v16 = "; ";
      goto LABEL_27;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v12 = self->_appendBufferCount;
      v13 = self->_appendBuffer;
      if (v12 <= 1022)
      {
        v13[v12] = 32;
        v14 = 1;
        goto LABEL_22;
      }
      v13[v12] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v13, 0x8000100u);
      p_string = &self->_string;
      v16 = " ";
LABEL_27:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v16, 0x8000100u);
      break;
    case 3:
LABEL_14:
      v17 = self->_appendBufferCount;
      v18 = self->_appendBuffer;
      if (v17 > 1022)
      {
        v18[v17] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v18, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v18[v17] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_17;
    case 4:
LABEL_17:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v20 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v21 = strlen(v20);
      p_appendBufferCount = &self->_appendBufferCount;
      v22 = self->_appendBufferCount;
      if ((uint64_t)(v22 + v21) > 1023)
      {
        if (v22 >= 1)
        {
          self->_appendBuffer[v22] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v20, 0x8000100u);
      }
      else
      {
        v14 = v21;
        memcpy(&self->_appendBuffer[v22], v20, v21);
LABEL_22:
        *p_appendBufferCount += v14;
      }
      break;
    default:
      goto LABEL_29;
  }
  self->_emitPhase = 0;
LABEL_29:
  if (!a4)
    goto LABEL_61;
  nameTruncation = v8->_nameTruncation;
  maximumNameLengthBeforeTruncation = v8->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  v26 = objc_msgSend(a4, "length");
  v27 = self->_appendBufferCount;
  if (v27 + 3 * v26 > 1023)
  {
    if (v27 >= 1)
    {
      self->_appendBuffer[v27] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v26 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a4);
      goto LABEL_44;
    }
    usedBufLen = 0;
    v48.location = 0;
    v48.length = v26;
    CFStringGetBytes((CFStringRef)a4, v48, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v28 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v47.location = 0;
    v47.length = v26;
    CFStringGetBytes((CFStringRef)a4, v47, 0x8000100u, 0, 0, &self->_appendBuffer[v27], 1024 - v27, &usedBufLen);
    v28 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v28;
LABEL_44:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v29 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v29 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v30 = *(unint64_t *)((char *)&self->_style->super.isa + *v29);
  if (v30 < 2)
  {
    v34 = self->_appendBufferCount;
    v35 = self->_appendBuffer;
    if (v34 <= 1021)
    {
      *(_WORD *)&v35[v34] = 8250;
      v33 = 2;
      goto LABEL_56;
    }
    v35[v34] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v35, 0x8000100u);
    v38 = ": ";
  }
  else if (v30 == 2)
  {
    v36 = self->_appendBufferCount;
    v37 = &self->_appendBuffer[v36];
    if (v36 <= 1020)
    {
      v37[2] = 32;
      *(_WORD *)v37 = 15648;
      v33 = 3;
      goto LABEL_56;
    }
    *v37 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v38 = " = ";
  }
  else
  {
    if (v30 != 3)
      goto LABEL_61;
    v31 = self->_appendBufferCount;
    v32 = self->_appendBuffer;
    if (v31 <= 1019)
    {
      *(_DWORD *)&v32[v31] = 540945696;
      v33 = 4;
LABEL_56:
      self->_appendBufferCount += v33;
      goto LABEL_61;
    }
    v32[v31] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v32, 0x8000100u);
    v38 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v38, 0x8000100u);
LABEL_61:
  valueTruncation = v8->_valueTruncation;
  maximumValueLengthBeforeTruncation = v8->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v42 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v42 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v42) = (Class)maximumValueLengthBeforeTruncation;

  if (v5)
    v43 = 3;
  else
    v43 = 2;
  v44 = self->_appendBufferCount;
  if ((uint64_t)(v44 + v43) > 1023)
  {
    if (v44 >= 1)
    {
      self->_appendBuffer[v44] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    CFStringAppendCString((CFMutableStringRef)self->_string, v7, 0x8000100u);
  }
  else
  {
    memcpy(&self->_appendBuffer[v44], v7, v43);
    self->_appendBufferCount += v43;
  }
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (id)appendFlag:(int64_t)a3 withName:(id)a4
{
  __CFString *v6;
  BSDescriptionStyle *v7;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  NSMutableString **p_string;
  const char *v15;
  int64_t v16;
  unsigned __int8 *v17;
  int64_t indentLevel;
  const char *v19;
  size_t v20;
  int64_t v21;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v25;
  int64_t v26;
  CFIndex v27;
  int *v28;
  unint64_t v29;
  int64_t v30;
  unsigned __int8 *v31;
  uint64_t v32;
  int64_t v33;
  unsigned __int8 *v34;
  int64_t v35;
  unsigned __int8 *v36;
  const char *v37;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v41;
  CFIndex v42;
  int64_t v43;
  CFIndex v44;
  int64_t v45;
  unsigned __int8 *v46;
  BSDescriptionStream *v47;
  CFIndex usedBufLen;
  CFRange v50;
  CFRange v51;
  CFRange v52;
  CFRange v53;

  BSSettingFlagDescription(a3);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v15 = "; ";
      goto LABEL_24;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v11 = self->_appendBufferCount;
      v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      v15 = " ";
LABEL_24:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v16 = self->_appendBufferCount;
      v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v19 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v20 = strlen(v19);
      p_appendBufferCount = &self->_appendBufferCount;
      v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4)
    goto LABEL_58;
  nameTruncation = v7->_nameTruncation;
  maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  v25 = objc_msgSend(a4, "length");
  v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a4);
      goto LABEL_41;
    }
    usedBufLen = 0;
    v51.location = 0;
    v51.length = v25;
    CFStringGetBytes((CFStringRef)a4, v51, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v27 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v50.location = 0;
    v50.length = v25;
    CFStringGetBytes((CFStringRef)a4, v50, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    v33 = self->_appendBufferCount;
    v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    v37 = ": ";
  }
  else if (v29 == 2)
  {
    v35 = self->_appendBufferCount;
    v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)v36 = 15648;
      v32 = 3;
      goto LABEL_53;
    }
    *v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v37 = " = ";
  }
  else
  {
    if (v29 != 3)
      goto LABEL_58;
    v30 = self->_appendBufferCount;
    v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    v37 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  valueTruncation = v7->_valueTruncation;
  maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  if (v6)
  {
    v42 = -[__CFString length](v6, "length");
    v43 = self->_appendBufferCount;
    if (v43 + 3 * v42 > 1023)
    {
      if (v43 >= 1)
      {
        self->_appendBuffer[v43] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      if (v42 > 341)
      {
        -[NSMutableString appendString:](self->_string, "appendString:", v6);
        goto LABEL_76;
      }
      usedBufLen = 0;
      v53.location = 0;
      v53.length = v42;
      CFStringGetBytes(v6, v53, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      v44 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v52.location = 0;
      v52.length = v42;
      CFStringGetBytes(v6, v52, 0x8000100u, 0, 0, &self->_appendBuffer[v43], 1024 - v43, &usedBufLen);
      v44 = self->_appendBufferCount + usedBufLen;
    }
  }
  else
  {
    v45 = self->_appendBufferCount;
    v46 = &self->_appendBuffer[v45];
    if (v45 > 1018)
    {
      *v46 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
      goto LABEL_76;
    }
    v46[4] = 62;
    *(_DWORD *)v46 = 1818848828;
    v44 = self->_appendBufferCount + 5;
  }
  self->_appendBufferCount = v44;
LABEL_76:
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  v47 = self;

  return v47;
}

- (id)appendFlag:(int64_t)a3 withName:(id)a4 skipIfNotSet:(BOOL)a5
{
  BSDescriptionStream *v7;
  __CFString *v8;
  BSDescriptionStyle *v9;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  NSMutableString **p_string;
  const char *v17;
  int64_t v18;
  unsigned __int8 *v19;
  int64_t indentLevel;
  const char *v21;
  size_t v22;
  int64_t v23;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v27;
  int64_t v28;
  CFIndex v29;
  int *v30;
  unint64_t v31;
  int64_t v32;
  unsigned __int8 *v33;
  uint64_t v34;
  int64_t v35;
  unsigned __int8 *v36;
  int64_t v37;
  unsigned __int8 *v38;
  const char *v39;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v43;
  CFIndex v44;
  int64_t v45;
  CFIndex v46;
  int64_t v47;
  unsigned __int8 *v48;
  BSDescriptionStream *v49;
  CFIndex usedBufLen;
  CFRange v52;
  CFRange v53;
  CFRange v54;
  CFRange v55;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL || !a5)
  {
    BSSettingFlagDescription(a3);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_style;
    switch(self->_emitPhase)
    {
      case 1:
        p_appendBufferCount = &self->_appendBufferCount;
        appendBufferCount = self->_appendBufferCount;
        appendBuffer = self->_appendBuffer;
        if (self->_style->_collectionLineBreak == 3)
        {
          if (appendBufferCount > 1022)
          {
            appendBuffer[appendBufferCount] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
            self->_appendBufferCount = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
          }
          else
          {
            appendBuffer[appendBufferCount] = 59;
            ++*p_appendBufferCount;
          }
          goto LABEL_14;
        }
        if (appendBufferCount <= 1021)
        {
          *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
          v15 = 2;
          goto LABEL_22;
        }
        appendBuffer[appendBufferCount] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
        p_string = &self->_string;
        v17 = "; ";
        goto LABEL_27;
      case 2:
        p_appendBufferCount = &self->_appendBufferCount;
        v13 = self->_appendBufferCount;
        v14 = self->_appendBuffer;
        if (v13 <= 1022)
        {
          v14[v13] = 32;
          v15 = 1;
          goto LABEL_22;
        }
        v14[v13] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v14, 0x8000100u);
        p_string = &self->_string;
        v17 = " ";
LABEL_27:
        *p_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)*p_string, v17, 0x8000100u);
        break;
      case 3:
LABEL_14:
        v18 = self->_appendBufferCount;
        v19 = self->_appendBuffer;
        if (v18 > 1022)
        {
          v19[v18] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v19, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
        }
        else
        {
          v19[v18] = 10;
          ++self->_appendBufferCount;
        }
        goto LABEL_17;
      case 4:
LABEL_17:
        indentLevel = self->_indentLevel;
        if (indentLevel < 1)
          break;
        if (indentLevel >= 8)
          indentLevel = 8;
        v21 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
        v22 = strlen(v21);
        p_appendBufferCount = &self->_appendBufferCount;
        v23 = self->_appendBufferCount;
        if ((uint64_t)(v23 + v22) > 1023)
        {
          if (v23 >= 1)
          {
            self->_appendBuffer[v23] = 0;
            CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
            *p_appendBufferCount = 0;
          }
          CFStringAppendCString((CFMutableStringRef)self->_string, v21, 0x8000100u);
        }
        else
        {
          v15 = v22;
          memcpy(&self->_appendBuffer[v23], v21, v22);
LABEL_22:
          *p_appendBufferCount += v15;
        }
        break;
      default:
        goto LABEL_29;
    }
    self->_emitPhase = 0;
LABEL_29:
    if (!a4)
      goto LABEL_61;
    nameTruncation = v9->_nameTruncation;
    maximumNameLengthBeforeTruncation = v9->_maximumNameLengthBeforeTruncation;
    if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
    {
      self->_lineTruncation = 0;
    }
    else
    {
      self->_lineTruncation = nameTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
    }
    v27 = objc_msgSend(a4, "length");
    v28 = self->_appendBufferCount;
    if (v28 + 3 * v27 > 1023)
    {
      if (v28 >= 1)
      {
        self->_appendBuffer[v28] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      if (v27 > 341)
      {
        -[NSMutableString appendString:](self->_string, "appendString:", a4);
        goto LABEL_44;
      }
      usedBufLen = 0;
      v53.location = 0;
      v53.length = v27;
      CFStringGetBytes((CFStringRef)a4, v53, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      v29 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v52.location = 0;
      v52.length = v27;
      CFStringGetBytes((CFStringRef)a4, v52, 0x8000100u, 0, 0, &self->_appendBuffer[v28], 1024 - v28, &usedBufLen);
      v29 = self->_appendBufferCount + usedBufLen;
    }
    self->_appendBufferCount = v29;
LABEL_44:
    BSDescribeTruncationCommit((uint64_t)self);
    if (self->_proemNestCount <= 0)
      v30 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
    else
      v30 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
    v31 = *(unint64_t *)((char *)&self->_style->super.isa + *v30);
    if (v31 < 2)
    {
      v35 = self->_appendBufferCount;
      v36 = self->_appendBuffer;
      if (v35 <= 1021)
      {
        *(_WORD *)&v36[v35] = 8250;
        v34 = 2;
        goto LABEL_56;
      }
      v36[v35] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v36, 0x8000100u);
      v39 = ": ";
    }
    else if (v31 == 2)
    {
      v37 = self->_appendBufferCount;
      v38 = &self->_appendBuffer[v37];
      if (v37 <= 1020)
      {
        v38[2] = 32;
        *(_WORD *)v38 = 15648;
        v34 = 3;
        goto LABEL_56;
      }
      *v38 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      v39 = " = ";
    }
    else
    {
      if (v31 != 3)
        goto LABEL_61;
      v32 = self->_appendBufferCount;
      v33 = self->_appendBuffer;
      if (v32 <= 1019)
      {
        *(_DWORD *)&v33[v32] = 540945696;
        v34 = 4;
LABEL_56:
        self->_appendBufferCount += v34;
        goto LABEL_61;
      }
      v33[v32] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v33, 0x8000100u);
      v39 = " -> ";
    }
    self->_appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, v39, 0x8000100u);
LABEL_61:
    valueTruncation = v9->_valueTruncation;
    maximumValueLengthBeforeTruncation = v9->_maximumValueLengthBeforeTruncation;
    if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
    {
      maximumValueLengthBeforeTruncation = 0;
      v43 = 1096;
    }
    else
    {
      self->_lineTruncation = valueTruncation;
      self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
      v43 = 1088;
    }
    *(Class *)((char *)&self->super.isa + v43) = (Class)maximumValueLengthBeforeTruncation;

    if (v8)
    {
      v44 = -[__CFString length](v8, "length");
      v45 = self->_appendBufferCount;
      if (v45 + 3 * v44 > 1023)
      {
        if (v45 >= 1)
        {
          self->_appendBuffer[v45] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
        }
        if (v44 > 341)
        {
          -[NSMutableString appendString:](self->_string, "appendString:", v8);
          goto LABEL_79;
        }
        usedBufLen = 0;
        v55.location = 0;
        v55.length = v44;
        CFStringGetBytes(v8, v55, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
        v46 = usedBufLen;
      }
      else
      {
        usedBufLen = 0;
        v54.location = 0;
        v54.length = v44;
        CFStringGetBytes(v8, v54, 0x8000100u, 0, 0, &self->_appendBuffer[v45], 1024 - v45, &usedBufLen);
        v46 = self->_appendBufferCount + usedBufLen;
      }
    }
    else
    {
      v47 = self->_appendBufferCount;
      v48 = &self->_appendBuffer[v47];
      if (v47 > 1018)
      {
        *v48 = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
        goto LABEL_79;
      }
      v48[4] = 62;
      *(_DWORD *)v48 = 1818848828;
      v46 = self->_appendBufferCount + 5;
    }
    self->_appendBufferCount = v46;
LABEL_79:
    self->_emitPhase = 1;
    BSDescribeTruncationCommit((uint64_t)self);
    v49 = self;

    return self;
  }
  v7 = self;
  return self;
}

- (id)appendInt:(int)a3 withName:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, CFSTR("%d"), (uint64_t)a4, v4, v5, v6, v7, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendUnsignedInt:(unsigned int)a3 withName:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, CFSTR("%u"), (uint64_t)a4, v4, v5, v6, v7, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendInt64:(int64_t)a3 withName:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, CFSTR("%lld"), (uint64_t)a4, v4, v5, v6, v7, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendUInt64:(unint64_t)a3 withName:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, CFSTR("%llu"), (uint64_t)a4, v4, v5, v6, v7, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendFloat:(double)a3 withName:(id)a4
{
  return -[BSDescriptionStream appendFloat:withName:decimalPrecision:](self, "appendFloat:withName:decimalPrecision:", a4, 0x7FFFFFFFFFFFFFFFLL, a3);
}

uint64_t __66__BSDescriptionStream_appendTimeInterval_withName_decomposeUnits___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)_MergedGlobals_27;
  _MergedGlobals_27 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_27, "setUnitsStyle:", 1);
}

- (id)appendPointer:(void *)a3 withName:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  BSDescribeAppendFieldFormat((uint64_t)self, (__CFString *)a4, CFSTR("%p"), (uint64_t)a4, v4, v5, v6, v7, (char)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)appendPoint:(CGPoint)a3 withName:(id)a4
{
  CGFloat y;
  CGFloat x;
  BSDescriptionStyle *v8;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  NSMutableString **p_string;
  const char *v16;
  int64_t v17;
  unsigned __int8 *v18;
  int64_t indentLevel;
  const char *v20;
  size_t v21;
  int64_t v22;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v26;
  int64_t v27;
  CFIndex v28;
  int *v29;
  unint64_t v30;
  int64_t v31;
  unsigned __int8 *v32;
  uint64_t v33;
  int64_t v34;
  unsigned __int8 *v35;
  int64_t v36;
  unsigned __int8 *v37;
  const char *v38;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v42;
  int64_t v43;
  CFIndex usedBufLen;
  CFRange v46;
  CFRange v47;

  y = a3.y;
  x = a3.x;
  v8 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v14 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v16 = "; ";
      goto LABEL_24;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v12 = self->_appendBufferCount;
      v13 = self->_appendBuffer;
      if (v12 <= 1022)
      {
        v13[v12] = 32;
        v14 = 1;
        goto LABEL_19;
      }
      v13[v12] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v13, 0x8000100u);
      p_string = &self->_string;
      v16 = " ";
LABEL_24:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v16, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v17 = self->_appendBufferCount;
      v18 = self->_appendBuffer;
      if (v17 > 1022)
      {
        v18[v17] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v18, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v18[v17] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v20 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v21 = strlen(v20);
      p_appendBufferCount = &self->_appendBufferCount;
      v22 = self->_appendBufferCount;
      if ((uint64_t)(v22 + v21) > 1023)
      {
        if (v22 >= 1)
        {
          self->_appendBuffer[v22] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v20, 0x8000100u);
      }
      else
      {
        v14 = v21;
        memcpy(&self->_appendBuffer[v22], v20, v21);
LABEL_19:
        *p_appendBufferCount += v14;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4)
    goto LABEL_58;
  nameTruncation = v8->_nameTruncation;
  maximumNameLengthBeforeTruncation = v8->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  v26 = objc_msgSend(a4, "length");
  v27 = self->_appendBufferCount;
  if (v27 + 3 * v26 > 1023)
  {
    if (v27 >= 1)
    {
      self->_appendBuffer[v27] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v26 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a4);
      goto LABEL_41;
    }
    usedBufLen = 0;
    v47.location = 0;
    v47.length = v26;
    CFStringGetBytes((CFStringRef)a4, v47, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v28 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v46.location = 0;
    v46.length = v26;
    CFStringGetBytes((CFStringRef)a4, v46, 0x8000100u, 0, 0, &self->_appendBuffer[v27], 1024 - v27, &usedBufLen);
    v28 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v28;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v29 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v29 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v30 = *(unint64_t *)((char *)&self->_style->super.isa + *v29);
  if (v30 < 2)
  {
    v34 = self->_appendBufferCount;
    v35 = self->_appendBuffer;
    if (v34 <= 1021)
    {
      *(_WORD *)&v35[v34] = 8250;
      v33 = 2;
      goto LABEL_53;
    }
    v35[v34] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v35, 0x8000100u);
    v38 = ": ";
  }
  else if (v30 == 2)
  {
    v36 = self->_appendBufferCount;
    v37 = &self->_appendBuffer[v36];
    if (v36 <= 1020)
    {
      v37[2] = 32;
      *(_WORD *)v37 = 15648;
      v33 = 3;
      goto LABEL_53;
    }
    *v37 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v38 = " = ";
  }
  else
  {
    if (v30 != 3)
      goto LABEL_58;
    v31 = self->_appendBufferCount;
    v32 = self->_appendBuffer;
    if (v31 <= 1019)
    {
      *(_DWORD *)&v32[v31] = 540945696;
      v33 = 4;
LABEL_53:
      self->_appendBufferCount += v33;
      goto LABEL_58;
    }
    v32[v31] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v32, 0x8000100u);
    v38 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v38, 0x8000100u);
LABEL_58:
  valueTruncation = v8->_valueTruncation;
  maximumValueLengthBeforeTruncation = v8->_maximumValueLengthBeforeTruncation;
  if (valueTruncation <= 1 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v42 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v42 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v42) = (Class)maximumValueLengthBeforeTruncation;

  v43 = self->_appendBufferCount;
  if (v43 >= 1)
  {
    self->_appendBuffer[v43] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
  }
  -[NSMutableString appendFormat:](self->_string, "appendFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&x, 17, *(_QWORD *)&y);
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (id)appendSize:(CGSize)a3 withName:(id)a4
{
  CGFloat height;
  CGFloat width;
  BSDescriptionStyle *v8;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  NSMutableString **p_string;
  const char *v16;
  int64_t v17;
  unsigned __int8 *v18;
  int64_t indentLevel;
  const char *v20;
  size_t v21;
  int64_t v22;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v26;
  int64_t v27;
  CFIndex v28;
  int *v29;
  unint64_t v30;
  int64_t v31;
  unsigned __int8 *v32;
  uint64_t v33;
  int64_t v34;
  unsigned __int8 *v35;
  int64_t v36;
  unsigned __int8 *v37;
  const char *v38;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v42;
  int64_t v43;
  CFIndex usedBufLen;
  CFRange v46;
  CFRange v47;

  height = a3.height;
  width = a3.width;
  v8 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v14 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v16 = "; ";
      goto LABEL_24;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v12 = self->_appendBufferCount;
      v13 = self->_appendBuffer;
      if (v12 <= 1022)
      {
        v13[v12] = 32;
        v14 = 1;
        goto LABEL_19;
      }
      v13[v12] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v13, 0x8000100u);
      p_string = &self->_string;
      v16 = " ";
LABEL_24:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v16, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v17 = self->_appendBufferCount;
      v18 = self->_appendBuffer;
      if (v17 > 1022)
      {
        v18[v17] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v18, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v18[v17] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v20 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v21 = strlen(v20);
      p_appendBufferCount = &self->_appendBufferCount;
      v22 = self->_appendBufferCount;
      if ((uint64_t)(v22 + v21) > 1023)
      {
        if (v22 >= 1)
        {
          self->_appendBuffer[v22] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v20, 0x8000100u);
      }
      else
      {
        v14 = v21;
        memcpy(&self->_appendBuffer[v22], v20, v21);
LABEL_19:
        *p_appendBufferCount += v14;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4)
    goto LABEL_58;
  nameTruncation = v8->_nameTruncation;
  maximumNameLengthBeforeTruncation = v8->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  v26 = objc_msgSend(a4, "length");
  v27 = self->_appendBufferCount;
  if (v27 + 3 * v26 > 1023)
  {
    if (v27 >= 1)
    {
      self->_appendBuffer[v27] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v26 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a4);
      goto LABEL_41;
    }
    usedBufLen = 0;
    v47.location = 0;
    v47.length = v26;
    CFStringGetBytes((CFStringRef)a4, v47, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v28 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v46.location = 0;
    v46.length = v26;
    CFStringGetBytes((CFStringRef)a4, v46, 0x8000100u, 0, 0, &self->_appendBuffer[v27], 1024 - v27, &usedBufLen);
    v28 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v28;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v29 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v29 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v30 = *(unint64_t *)((char *)&self->_style->super.isa + *v29);
  if (v30 < 2)
  {
    v34 = self->_appendBufferCount;
    v35 = self->_appendBuffer;
    if (v34 <= 1021)
    {
      *(_WORD *)&v35[v34] = 8250;
      v33 = 2;
      goto LABEL_53;
    }
    v35[v34] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v35, 0x8000100u);
    v38 = ": ";
  }
  else if (v30 == 2)
  {
    v36 = self->_appendBufferCount;
    v37 = &self->_appendBuffer[v36];
    if (v36 <= 1020)
    {
      v37[2] = 32;
      *(_WORD *)v37 = 15648;
      v33 = 3;
      goto LABEL_53;
    }
    *v37 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v38 = " = ";
  }
  else
  {
    if (v30 != 3)
      goto LABEL_58;
    v31 = self->_appendBufferCount;
    v32 = self->_appendBuffer;
    if (v31 <= 1019)
    {
      *(_DWORD *)&v32[v31] = 540945696;
      v33 = 4;
LABEL_53:
      self->_appendBufferCount += v33;
      goto LABEL_58;
    }
    v32[v31] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v32, 0x8000100u);
    v38 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v38, 0x8000100u);
LABEL_58:
  valueTruncation = v8->_valueTruncation;
  maximumValueLengthBeforeTruncation = v8->_maximumValueLengthBeforeTruncation;
  if (valueTruncation <= 1 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v42 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v42 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v42) = (Class)maximumValueLengthBeforeTruncation;

  v43 = self->_appendBufferCount;
  if (v43 >= 1)
  {
    self->_appendBuffer[v43] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
  }
  -[NSMutableString appendFormat:](self->_string, "appendFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&width, 17, *(_QWORD *)&height);
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (id)appendRect:(CGRect)a3 withName:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  BSDescriptionStyle *v10;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  NSMutableString **p_string;
  const char *v18;
  int64_t v19;
  unsigned __int8 *v20;
  int64_t indentLevel;
  const char *v22;
  size_t v23;
  int64_t v24;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v28;
  int64_t v29;
  CFIndex v30;
  int *v31;
  unint64_t v32;
  int64_t v33;
  unsigned __int8 *v34;
  uint64_t v35;
  int64_t v36;
  unsigned __int8 *v37;
  int64_t v38;
  unsigned __int8 *v39;
  const char *v40;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v44;
  int64_t v45;
  unsigned __int8 *v46;
  int64_t v47;
  int64_t v48;
  int64_t v49;
  int64_t v50;
  CFIndex usedBufLen;
  CFRange v53;
  CFRange v54;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v16 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v18 = "; ";
      goto LABEL_24;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v14 = self->_appendBufferCount;
      v15 = self->_appendBuffer;
      if (v14 <= 1022)
      {
        v15[v14] = 32;
        v16 = 1;
        goto LABEL_19;
      }
      v15[v14] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v15, 0x8000100u);
      p_string = &self->_string;
      v18 = " ";
LABEL_24:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v18, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v19 = self->_appendBufferCount;
      v20 = self->_appendBuffer;
      if (v19 > 1022)
      {
        v20[v19] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v20, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v20[v19] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v22 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v23 = strlen(v22);
      p_appendBufferCount = &self->_appendBufferCount;
      v24 = self->_appendBufferCount;
      if ((uint64_t)(v24 + v23) > 1023)
      {
        if (v24 >= 1)
        {
          self->_appendBuffer[v24] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v22, 0x8000100u);
      }
      else
      {
        v16 = v23;
        memcpy(&self->_appendBuffer[v24], v22, v23);
LABEL_19:
        *p_appendBufferCount += v16;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4)
    goto LABEL_58;
  nameTruncation = v10->_nameTruncation;
  maximumNameLengthBeforeTruncation = v10->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  v28 = objc_msgSend(a4, "length");
  v29 = self->_appendBufferCount;
  if (v29 + 3 * v28 > 1023)
  {
    if (v29 >= 1)
    {
      self->_appendBuffer[v29] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v28 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a4);
      goto LABEL_41;
    }
    usedBufLen = 0;
    v54.location = 0;
    v54.length = v28;
    CFStringGetBytes((CFStringRef)a4, v54, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v30 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v53.location = 0;
    v53.length = v28;
    CFStringGetBytes((CFStringRef)a4, v53, 0x8000100u, 0, 0, &self->_appendBuffer[v29], 1024 - v29, &usedBufLen);
    v30 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v30;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v31 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v31 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v32 = *(unint64_t *)((char *)&self->_style->super.isa + *v31);
  if (v32 < 2)
  {
    v36 = self->_appendBufferCount;
    v37 = self->_appendBuffer;
    if (v36 <= 1021)
    {
      *(_WORD *)&v37[v36] = 8250;
      v35 = 2;
      goto LABEL_53;
    }
    v37[v36] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v37, 0x8000100u);
    v40 = ": ";
  }
  else if (v32 == 2)
  {
    v38 = self->_appendBufferCount;
    v39 = &self->_appendBuffer[v38];
    if (v38 <= 1020)
    {
      v39[2] = 32;
      *(_WORD *)v39 = 15648;
      v35 = 3;
      goto LABEL_53;
    }
    *v39 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v40 = " = ";
  }
  else
  {
    if (v32 != 3)
      goto LABEL_58;
    v33 = self->_appendBufferCount;
    v34 = self->_appendBuffer;
    if (v33 <= 1019)
    {
      *(_DWORD *)&v34[v33] = 540945696;
      v35 = 4;
LABEL_53:
      self->_appendBufferCount += v35;
      goto LABEL_58;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    v40 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v40, 0x8000100u);
LABEL_58:
  valueTruncation = v10->_valueTruncation;
  maximumValueLengthBeforeTruncation = v10->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v44 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v44 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v44) = (Class)maximumValueLengthBeforeTruncation;

  v45 = self->_appendBufferCount;
  v46 = self->_appendBuffer;
  if (v45 > 1022)
  {
    v46[v45] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, "{", 0x8000100u);
    v47 = self->_appendBufferCount;
  }
  else
  {
    v46[v45] = 123;
    v47 = self->_appendBufferCount + 1;
    self->_appendBufferCount = v47;
  }
  if (v47 >= 1)
  {
    v46[v47] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
  }
  -[NSMutableString appendFormat:](self->_string, "appendFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&x, 17, *(_QWORD *)&y);
  v48 = self->_appendBufferCount;
  if (v48 > 1021)
  {
    v46[v48] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, ", ", 0x8000100u);
    v49 = self->_appendBufferCount;
  }
  else
  {
    *(_WORD *)&v46[v48] = 8236;
    v49 = self->_appendBufferCount + 2;
    self->_appendBufferCount = v49;
  }
  if (v49 >= 1)
  {
    v46[v49] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
  }
  -[NSMutableString appendFormat:](self->_string, "appendFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&width, 17, *(_QWORD *)&height);
  v50 = self->_appendBufferCount;
  if (v50 > 1022)
  {
    v46[v50] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, "}", 0x8000100u);
  }
  else
  {
    v46[v50] = 125;
    ++self->_appendBufferCount;
  }
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (id)appendSelector:(SEL)a3 withName:(id)a4
{
  __CFString *v6;
  BSDescriptionStyle *v7;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  NSMutableString **p_string;
  const char *v15;
  int64_t v16;
  unsigned __int8 *v17;
  int64_t indentLevel;
  const char *v19;
  size_t v20;
  int64_t v21;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v25;
  int64_t v26;
  CFIndex v27;
  int *v28;
  unint64_t v29;
  int64_t v30;
  unsigned __int8 *v31;
  uint64_t v32;
  int64_t v33;
  unsigned __int8 *v34;
  int64_t v35;
  unsigned __int8 *v36;
  const char *v37;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v41;
  CFIndex v42;
  int64_t v43;
  CFIndex v44;
  int64_t v45;
  unsigned __int8 *v46;
  BSDescriptionStream *v47;
  CFIndex usedBufLen;
  CFRange v50;
  CFRange v51;
  CFRange v52;
  CFRange v53;

  NSStringFromSelector(a3);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v15 = "; ";
      goto LABEL_24;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v11 = self->_appendBufferCount;
      v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      v15 = " ";
LABEL_24:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v16 = self->_appendBufferCount;
      v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v19 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v20 = strlen(v19);
      p_appendBufferCount = &self->_appendBufferCount;
      v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4)
    goto LABEL_58;
  nameTruncation = v7->_nameTruncation;
  maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  v25 = objc_msgSend(a4, "length");
  v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a4);
      goto LABEL_41;
    }
    usedBufLen = 0;
    v51.location = 0;
    v51.length = v25;
    CFStringGetBytes((CFStringRef)a4, v51, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v27 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v50.location = 0;
    v50.length = v25;
    CFStringGetBytes((CFStringRef)a4, v50, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    v33 = self->_appendBufferCount;
    v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    v37 = ": ";
  }
  else if (v29 == 2)
  {
    v35 = self->_appendBufferCount;
    v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)v36 = 15648;
      v32 = 3;
      goto LABEL_53;
    }
    *v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v37 = " = ";
  }
  else
  {
    if (v29 != 3)
      goto LABEL_58;
    v30 = self->_appendBufferCount;
    v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    v37 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  valueTruncation = v7->_valueTruncation;
  maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  if (v6)
  {
    v42 = -[__CFString length](v6, "length");
    v43 = self->_appendBufferCount;
    if (v43 + 3 * v42 > 1023)
    {
      if (v43 >= 1)
      {
        self->_appendBuffer[v43] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      if (v42 > 341)
      {
        -[NSMutableString appendString:](self->_string, "appendString:", v6);
        goto LABEL_76;
      }
      usedBufLen = 0;
      v53.location = 0;
      v53.length = v42;
      CFStringGetBytes(v6, v53, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      v44 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v52.location = 0;
      v52.length = v42;
      CFStringGetBytes(v6, v52, 0x8000100u, 0, 0, &self->_appendBuffer[v43], 1024 - v43, &usedBufLen);
      v44 = self->_appendBufferCount + usedBufLen;
    }
  }
  else
  {
    v45 = self->_appendBufferCount;
    v46 = &self->_appendBuffer[v45];
    if (v45 > 1018)
    {
      *v46 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
      goto LABEL_76;
    }
    v46[4] = 62;
    *(_DWORD *)v46 = 1818848828;
    v44 = self->_appendBufferCount + 5;
  }
  self->_appendBufferCount = v44;
LABEL_76:
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  v47 = self;

  return v47;
}

- (id)appendCString:(const char *)a3 withName:(id)a4
{
  BSDescriptionStyle *v7;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  NSMutableString **p_string;
  const char *v15;
  int64_t v16;
  unsigned __int8 *v17;
  int64_t indentLevel;
  const char *v19;
  size_t v20;
  int64_t v21;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v25;
  int64_t v26;
  CFIndex v27;
  int *v28;
  unint64_t v29;
  int64_t v30;
  unsigned __int8 *v31;
  uint64_t v32;
  int64_t v33;
  unsigned __int8 *v34;
  int64_t v35;
  unsigned __int8 *v36;
  const char *v37;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v41;
  size_t v42;
  int64_t v43;
  size_t v44;
  int64_t v45;
  int64_t v46;
  unsigned __int8 *v47;
  NSMutableString *string;
  const char *v49;
  CFIndex usedBufLen;
  CFRange v52;
  CFRange v53;

  v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v15 = "; ";
      goto LABEL_24;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v11 = self->_appendBufferCount;
      v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      v15 = " ";
LABEL_24:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v16 = self->_appendBufferCount;
      v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v19 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v20 = strlen(v19);
      p_appendBufferCount = &self->_appendBufferCount;
      v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4)
    goto LABEL_58;
  nameTruncation = v7->_nameTruncation;
  maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  v25 = objc_msgSend(a4, "length");
  v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a4);
      goto LABEL_41;
    }
    usedBufLen = 0;
    v53.location = 0;
    v53.length = v25;
    CFStringGetBytes((CFStringRef)a4, v53, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v27 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v52.location = 0;
    v52.length = v25;
    CFStringGetBytes((CFStringRef)a4, v52, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    v33 = self->_appendBufferCount;
    v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    v37 = ": ";
  }
  else if (v29 == 2)
  {
    v35 = self->_appendBufferCount;
    v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)v36 = 15648;
      v32 = 3;
      goto LABEL_53;
    }
    *v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v37 = " = ";
  }
  else
  {
    if (v29 != 3)
      goto LABEL_58;
    v30 = self->_appendBufferCount;
    v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    v37 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  valueTruncation = v7->_valueTruncation;
  maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  if (!a3)
  {
    v46 = self->_appendBufferCount;
    v47 = &self->_appendBuffer[v46];
    if (v46 <= 1018)
    {
      v47[4] = 62;
      *(_DWORD *)v47 = 1818848828;
      v45 = self->_appendBufferCount + 5;
      goto LABEL_69;
    }
    *v47 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
    string = self->_string;
    v49 = "<nil>";
LABEL_74:
    CFStringAppendCString((CFMutableStringRef)string, v49, 0x8000100u);
    goto LABEL_75;
  }
  v42 = strlen(a3);
  v43 = self->_appendBufferCount;
  if ((uint64_t)(v43 + v42) > 1023)
  {
    if (v43 >= 1)
    {
      self->_appendBuffer[v43] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    string = self->_string;
    v49 = a3;
    goto LABEL_74;
  }
  v44 = v42;
  memcpy(&self->_appendBuffer[v43], a3, v42);
  v45 = self->_appendBufferCount + v44;
LABEL_69:
  self->_appendBufferCount = v45;
LABEL_75:
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (id)appendQueue:(id)a3 withName:(id)a4
{
  const char *label;
  BSDescriptionStyle *v7;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  NSMutableString **p_string;
  const char *v15;
  int64_t v16;
  unsigned __int8 *v17;
  int64_t indentLevel;
  const char *v19;
  size_t v20;
  int64_t v21;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v25;
  int64_t v26;
  CFIndex v27;
  int *v28;
  unint64_t v29;
  int64_t v30;
  unsigned __int8 *v31;
  uint64_t v32;
  int64_t v33;
  unsigned __int8 *v34;
  int64_t v35;
  unsigned __int8 *v36;
  const char *v37;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v41;
  size_t v42;
  int64_t v43;
  size_t v44;
  int64_t v45;
  int64_t v46;
  unsigned __int8 *v47;
  NSMutableString *string;
  const char *v49;
  CFIndex usedBufLen;
  CFRange v52;
  CFRange v53;

  label = dispatch_queue_get_label((dispatch_queue_t)a3);
  v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v15 = "; ";
      goto LABEL_24;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v11 = self->_appendBufferCount;
      v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      v15 = " ";
LABEL_24:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v16 = self->_appendBufferCount;
      v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v19 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v20 = strlen(v19);
      p_appendBufferCount = &self->_appendBufferCount;
      v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4)
    goto LABEL_58;
  nameTruncation = v7->_nameTruncation;
  maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  v25 = objc_msgSend(a4, "length");
  v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a4);
      goto LABEL_41;
    }
    usedBufLen = 0;
    v53.location = 0;
    v53.length = v25;
    CFStringGetBytes((CFStringRef)a4, v53, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v27 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v52.location = 0;
    v52.length = v25;
    CFStringGetBytes((CFStringRef)a4, v52, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    v33 = self->_appendBufferCount;
    v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    v37 = ": ";
  }
  else if (v29 == 2)
  {
    v35 = self->_appendBufferCount;
    v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)v36 = 15648;
      v32 = 3;
      goto LABEL_53;
    }
    *v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v37 = " = ";
  }
  else
  {
    if (v29 != 3)
      goto LABEL_58;
    v30 = self->_appendBufferCount;
    v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    v37 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  valueTruncation = v7->_valueTruncation;
  maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  if (!label)
  {
    v46 = self->_appendBufferCount;
    v47 = &self->_appendBuffer[v46];
    if (v46 <= 1018)
    {
      v47[4] = 62;
      *(_DWORD *)v47 = 1818848828;
      v45 = self->_appendBufferCount + 5;
      goto LABEL_69;
    }
    *v47 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    self->_appendBufferCount = 0;
    string = self->_string;
    v49 = "<nil>";
LABEL_74:
    CFStringAppendCString((CFMutableStringRef)string, v49, 0x8000100u);
    goto LABEL_75;
  }
  v42 = strlen(label);
  v43 = self->_appendBufferCount;
  if ((uint64_t)(v43 + v42) > 1023)
  {
    if (v43 >= 1)
    {
      self->_appendBuffer[v43] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    string = self->_string;
    v49 = label;
    goto LABEL_74;
  }
  v44 = v42;
  memcpy(&self->_appendBuffer[v43], label, v42);
  v45 = self->_appendBufferCount + v44;
LABEL_69:
  self->_appendBufferCount = v45;
LABEL_75:
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (id)appendClass:(Class)a3 withName:(id)a4
{
  __CFString *v6;
  BSDescriptionStyle *v7;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  NSMutableString **p_string;
  const char *v15;
  int64_t v16;
  unsigned __int8 *v17;
  int64_t indentLevel;
  const char *v19;
  size_t v20;
  int64_t v21;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v25;
  int64_t v26;
  CFIndex v27;
  int *v28;
  unint64_t v29;
  int64_t v30;
  unsigned __int8 *v31;
  uint64_t v32;
  int64_t v33;
  unsigned __int8 *v34;
  int64_t v35;
  unsigned __int8 *v36;
  const char *v37;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v41;
  CFIndex v42;
  int64_t v43;
  CFIndex v44;
  int64_t v45;
  unsigned __int8 *v46;
  BSDescriptionStream *v47;
  CFIndex usedBufLen;
  CFRange v50;
  CFRange v51;
  CFRange v52;
  CFRange v53;

  NSStringFromClass(a3);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v15 = "; ";
      goto LABEL_24;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v11 = self->_appendBufferCount;
      v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      v15 = " ";
LABEL_24:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v16 = self->_appendBufferCount;
      v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v19 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v20 = strlen(v19);
      p_appendBufferCount = &self->_appendBufferCount;
      v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4)
    goto LABEL_58;
  nameTruncation = v7->_nameTruncation;
  maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  v25 = objc_msgSend(a4, "length");
  v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a4);
      goto LABEL_41;
    }
    usedBufLen = 0;
    v51.location = 0;
    v51.length = v25;
    CFStringGetBytes((CFStringRef)a4, v51, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v27 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v50.location = 0;
    v50.length = v25;
    CFStringGetBytes((CFStringRef)a4, v50, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    v33 = self->_appendBufferCount;
    v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    v37 = ": ";
  }
  else if (v29 == 2)
  {
    v35 = self->_appendBufferCount;
    v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)v36 = 15648;
      v32 = 3;
      goto LABEL_53;
    }
    *v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v37 = " = ";
  }
  else
  {
    if (v29 != 3)
      goto LABEL_58;
    v30 = self->_appendBufferCount;
    v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    v37 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  valueTruncation = v7->_valueTruncation;
  maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  if (v6)
  {
    v42 = -[__CFString length](v6, "length");
    v43 = self->_appendBufferCount;
    if (v43 + 3 * v42 > 1023)
    {
      if (v43 >= 1)
      {
        self->_appendBuffer[v43] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
        self->_appendBufferCount = 0;
      }
      if (v42 > 341)
      {
        -[NSMutableString appendString:](self->_string, "appendString:", v6);
        goto LABEL_76;
      }
      usedBufLen = 0;
      v53.location = 0;
      v53.length = v42;
      CFStringGetBytes(v6, v53, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
      v44 = usedBufLen;
    }
    else
    {
      usedBufLen = 0;
      v52.location = 0;
      v52.length = v42;
      CFStringGetBytes(v6, v52, 0x8000100u, 0, 0, &self->_appendBuffer[v43], 1024 - v43, &usedBufLen);
      v44 = self->_appendBufferCount + usedBufLen;
    }
  }
  else
  {
    v45 = self->_appendBufferCount;
    v46 = &self->_appendBuffer[v45];
    if (v45 > 1018)
    {
      *v46 = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, "<nil>", 0x8000100u);
      goto LABEL_76;
    }
    v46[4] = 62;
    *(_DWORD *)v46 = 1818848828;
    v44 = self->_appendBufferCount + 5;
  }
  self->_appendBufferCount = v44;
LABEL_76:
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  v47 = self;

  return v47;
}

- (id)appendVersionedPID:(int64_t)a3 withName:(id)a4
{
  BSDescriptionStyle *v7;
  int64_t *p_appendBufferCount;
  int64_t appendBufferCount;
  unsigned __int8 *appendBuffer;
  int64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  NSMutableString **p_string;
  const char *v15;
  int64_t v16;
  unsigned __int8 *v17;
  int64_t indentLevel;
  const char *v19;
  size_t v20;
  int64_t v21;
  int64_t nameTruncation;
  int64_t maximumNameLengthBeforeTruncation;
  CFIndex v25;
  int64_t v26;
  CFIndex v27;
  int *v28;
  unint64_t v29;
  int64_t v30;
  unsigned __int8 *v31;
  uint64_t v32;
  int64_t v33;
  unsigned __int8 *v34;
  int64_t v35;
  unsigned __int8 *v36;
  const char *v37;
  int64_t valueTruncation;
  int64_t maximumValueLengthBeforeTruncation;
  uint64_t v41;
  CFIndex usedBufLen;
  CFRange v44;
  CFRange v45;

  v7 = self->_style;
  switch(self->_emitPhase)
  {
    case 1:
      p_appendBufferCount = &self->_appendBufferCount;
      appendBufferCount = self->_appendBufferCount;
      appendBuffer = self->_appendBuffer;
      if (self->_style->_collectionLineBreak == 3)
      {
        if (appendBufferCount > 1022)
        {
          appendBuffer[appendBufferCount] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
          self->_appendBufferCount = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, ";", 0x8000100u);
        }
        else
        {
          appendBuffer[appendBufferCount] = 59;
          ++*p_appendBufferCount;
        }
        goto LABEL_11;
      }
      if (appendBufferCount <= 1021)
      {
        *(_WORD *)&appendBuffer[appendBufferCount] = 8251;
        v13 = 2;
        goto LABEL_19;
      }
      appendBuffer[appendBufferCount] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)appendBuffer, 0x8000100u);
      p_string = &self->_string;
      v15 = "; ";
      goto LABEL_24;
    case 2:
      p_appendBufferCount = &self->_appendBufferCount;
      v11 = self->_appendBufferCount;
      v12 = self->_appendBuffer;
      if (v11 <= 1022)
      {
        v12[v11] = 32;
        v13 = 1;
        goto LABEL_19;
      }
      v12[v11] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v12, 0x8000100u);
      p_string = &self->_string;
      v15 = " ";
LABEL_24:
      *p_appendBufferCount = 0;
      CFStringAppendCString((CFMutableStringRef)*p_string, v15, 0x8000100u);
      break;
    case 3:
LABEL_11:
      v16 = self->_appendBufferCount;
      v17 = self->_appendBuffer;
      if (v16 > 1022)
      {
        v17[v16] = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v17, 0x8000100u);
        self->_appendBufferCount = 0;
        CFStringAppendCString((CFMutableStringRef)self->_string, "\n", 0x8000100u);
      }
      else
      {
        v17[v16] = 10;
        ++self->_appendBufferCount;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      indentLevel = self->_indentLevel;
      if (indentLevel < 1)
        break;
      if (indentLevel >= 8)
        indentLevel = 8;
      v19 = (const char *)*((_QWORD *)&sIndentSpaceStrings + indentLevel);
      v20 = strlen(v19);
      p_appendBufferCount = &self->_appendBufferCount;
      v21 = self->_appendBufferCount;
      if ((uint64_t)(v21 + v20) > 1023)
      {
        if (v21 >= 1)
        {
          self->_appendBuffer[v21] = 0;
          CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
          *p_appendBufferCount = 0;
        }
        CFStringAppendCString((CFMutableStringRef)self->_string, v19, 0x8000100u);
      }
      else
      {
        v13 = v20;
        memcpy(&self->_appendBuffer[v21], v19, v20);
LABEL_19:
        *p_appendBufferCount += v13;
      }
      break;
    default:
      goto LABEL_26;
  }
  self->_emitPhase = 0;
LABEL_26:
  if (!a4)
    goto LABEL_58;
  nameTruncation = v7->_nameTruncation;
  maximumNameLengthBeforeTruncation = v7->_maximumNameLengthBeforeTruncation;
  if (nameTruncation < 2 || maximumNameLengthBeforeTruncation < 1)
  {
    self->_lineTruncation = 0;
  }
  else
  {
    self->_lineTruncation = nameTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    self->_maximumLengthBeforeTruncation = maximumNameLengthBeforeTruncation;
  }
  v25 = objc_msgSend(a4, "length");
  v26 = self->_appendBufferCount;
  if (v26 + 3 * v25 > 1023)
  {
    if (v26 >= 1)
    {
      self->_appendBuffer[v26] = 0;
      CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
      self->_appendBufferCount = 0;
    }
    if (v25 > 341)
    {
      -[NSMutableString appendString:](self->_string, "appendString:", a4);
      goto LABEL_41;
    }
    usedBufLen = 0;
    v45.location = 0;
    v45.length = v25;
    CFStringGetBytes((CFStringRef)a4, v45, 0x8000100u, 0, 0, self->_appendBuffer, 1024, &usedBufLen);
    v27 = usedBufLen;
  }
  else
  {
    usedBufLen = 0;
    v44.location = 0;
    v44.length = v25;
    CFStringGetBytes((CFStringRef)a4, v44, 0x8000100u, 0, 0, &self->_appendBuffer[v26], 1024 - v26, &usedBufLen);
    v27 = self->_appendBufferCount + usedBufLen;
  }
  self->_appendBufferCount = v27;
LABEL_41:
  BSDescribeTruncationCommit((uint64_t)self);
  if (self->_proemNestCount <= 0)
    v28 = &OBJC_IVAR___BSDescriptionStyle__bodyItemSeparator;
  else
    v28 = &OBJC_IVAR___BSDescriptionStyle__proemItemSeparator;
  v29 = *(unint64_t *)((char *)&self->_style->super.isa + *v28);
  if (v29 < 2)
  {
    v33 = self->_appendBufferCount;
    v34 = self->_appendBuffer;
    if (v33 <= 1021)
    {
      *(_WORD *)&v34[v33] = 8250;
      v32 = 2;
      goto LABEL_53;
    }
    v34[v33] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v34, 0x8000100u);
    v37 = ": ";
  }
  else if (v29 == 2)
  {
    v35 = self->_appendBufferCount;
    v36 = &self->_appendBuffer[v35];
    if (v35 <= 1020)
    {
      v36[2] = 32;
      *(_WORD *)v36 = 15648;
      v32 = 3;
      goto LABEL_53;
    }
    *v36 = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)self->_appendBuffer, 0x8000100u);
    v37 = " = ";
  }
  else
  {
    if (v29 != 3)
      goto LABEL_58;
    v30 = self->_appendBufferCount;
    v31 = self->_appendBuffer;
    if (v30 <= 1019)
    {
      *(_DWORD *)&v31[v30] = 540945696;
      v32 = 4;
LABEL_53:
      self->_appendBufferCount += v32;
      goto LABEL_58;
    }
    v31[v30] = 0;
    CFStringAppendCString((CFMutableStringRef)self->_string, (const char *)v31, 0x8000100u);
    v37 = " -> ";
  }
  self->_appendBufferCount = 0;
  CFStringAppendCString((CFMutableStringRef)self->_string, v37, 0x8000100u);
LABEL_58:
  valueTruncation = v7->_valueTruncation;
  maximumValueLengthBeforeTruncation = v7->_maximumValueLengthBeforeTruncation;
  if (valueTruncation < 2 || maximumValueLengthBeforeTruncation < 1)
  {
    maximumValueLengthBeforeTruncation = 0;
    v41 = 1096;
  }
  else
  {
    self->_lineTruncation = valueTruncation;
    self->_truncationStartIndex = self->_appendBufferCount + -[NSMutableString length](self->_string, "length");
    v41 = 1088;
  }
  *(Class *)((char *)&self->super.isa + v41) = (Class)maximumValueLengthBeforeTruncation;

  BSAppendVersionedPIDToStringAppendTarget(a3, self);
  self->_emitPhase = 1;
  BSDescribeTruncationCommit((uint64_t)self);
  return self;
}

- (BOOL)verboseSingleItemCollections
{
  return self->_verboseSingleItemCollections;
}

- (void)setVerboseSingleItemCollections:(BOOL)a3
{
  self->_verboseSingleItemCollections = a3;
}

@end
