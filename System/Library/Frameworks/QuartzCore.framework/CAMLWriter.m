@implementation CAMLWriter

- (CAMLWriter)initWithData:(id)a3
{
  CAMLWriter *v4;
  malloc_zone_t *malloc_zone;
  _CAMLWriterPriv *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {

    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CAMLWriter;
  v4 = -[CAMLWriter init](&v8, sel_init);
  if (v4)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v6 = (_CAMLWriterPriv *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x40uLL, 0x743898A5uLL);
    v4->_priv = v6;
    if (v6)
    {
      v4->_priv->var0 = (__CFData *)CFRetain(a3);
      return v4;
    }

    return 0;
  }
  return v4;
}

- (NSURL)baseURL
{
  return (NSURL *)self->_priv->var1;
}

- (void)setBaseURL:(id)a3
{
  _CAMLWriterPriv *priv;
  __CFURL *var1;

  priv = self->_priv;
  var1 = priv->var1;
  if (var1 != a3)
  {
    if (var1)
      CFRelease(var1);
    priv->var1 = (__CFURL *)a3;
    if (a3)
      CFRetain(a3);
  }
}

- (BOOL)encodingForReverseSerializationTest
{
  return 0;
}

- (CAMLWriterDelegate)delegate
{
  return (CAMLWriterDelegate *)self->_priv->var2;
}

- (void)setDelegate:(id)a3
{
  _CAMLWriterPriv *priv;
  char v5;
  char v6;
  char v7;

  priv = self->_priv;
  if (priv->var2 != a3)
  {
    priv->var2 = a3;
    *((_BYTE *)self->_priv + 60) = *((_BYTE *)self->_priv + 60) & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *((_BYTE *)self->_priv + 60) = *((_BYTE *)self->_priv + 60) & 0xFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *((_BYTE *)self->_priv + 60) = *((_BYTE *)self->_priv + 60) & 0xFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *((_BYTE *)self->_priv + 60) = *((_BYTE *)self->_priv + 60) & 0xF7 | v7;
  }
}

- (void)encodeObject:(id)a3
{
  -[CAMLWriter encodeObject:conditionally:](self, "encodeObject:conditionally:", a3, 0);
}

- (void)encodeObject:(id)a3 conditionally:(BOOL)a4
{
  _CAMLWriterPriv *priv;
  char v8;
  const __CFString *v9;
  CFStringRef Copy;
  __CFString *v11;
  const __CFSet *var5;
  uint64_t v13;
  char v14;
  const __CFSet *var6;
  __CFSet *Mutable;
  uint64_t v17;

  priv = self->_priv;
  if (!priv->var3)
  {
    -[CAMLWriter beginElement:](self, "beginElement:", 0, a4);
    -[CAMLWriter setElementAttribute:forKey:](self, "setElementAttribute:forKey:", CFSTR("http://www.apple.com/CoreAnimation/1.0"), CFSTR("xmlns"));
    -[CAMLWriter encodeObject:](self, "encodeObject:", a3);
    -[CAMLWriter endElement](self, "endElement");
    return;
  }
  v8 = *((_BYTE *)priv + 60);
  if ((v8 & 8) != 0)
  {
    if (!objc_msgSend(priv->var2, "CAMLWriter:shouldEncodeObject:", self, a3))
      return;
    v8 = *((_BYTE *)priv + 60);
  }
  if (a3
    && (v8 & 2) != 0
    && (v9 = (const __CFString *)objc_msgSend(priv->var2, "CAMLWriter:IDForObject:", self, a3)) != 0
    && (Copy = CFStringCreateCopy(0, v9)) != 0)
  {
    v11 = (__CFString *)Copy;
    var5 = priv->var5;
    if (var5 && CFSetContainsValue(var5, v11))
    {
      if ((*((_BYTE *)priv + 60) & 1) == 0
        || (v13 = objc_msgSend(priv->var2, "CAMLWriter:typeForObject:", self, a3)) == 0)
      {
        v13 = objc_msgSend(a3, "CAMLType");
      }
      -[CAMLWriter beginElement:](self, "beginElement:", 1);
      -[CAMLWriter setElementAttribute:forKey:](self, "setElementAttribute:forKey:", v13, CFSTR("type"));
      -[CAMLWriter setElementAttribute:forKey:](self, "setElementAttribute:forKey:", v11, CFSTR("object"));
      -[CAMLWriter endElement](self, "endElement");
      goto LABEL_32;
    }
    if (a4)
      goto LABEL_32;
    priv->var4 = v11;
    Mutable = priv->var5;
    if (!Mutable)
    {
      Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
      priv->var5 = Mutable;
    }
    CFSetAddValue(Mutable, v11);
    v14 = 0;
  }
  else
  {
    if (a4)
      return;
    v11 = 0;
    priv->var4 = 0;
    v14 = 1;
  }
  var6 = priv->var6;
  if (!var6)
  {
    var6 = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
    priv->var6 = var6;
  }
  if (!a3 || CFSetContainsValue(var6, a3))
  {
    if ((v14 & 1) != 0)
      return;
LABEL_32:
    CFRelease(v11);
    return;
  }
  CFSetAddValue(priv->var6, a3);
  if ((*((_BYTE *)priv + 60) & 1) == 0 || (v17 = objc_msgSend(priv->var2, "CAMLWriter:typeForObject:", self, a3)) == 0)
    v17 = objc_msgSend(a3, "CAMLType");
  -[CAMLWriter beginElement:](self, "beginElement:", 1);
  priv->var3->var4 = (void *)CFRetain(a3);
  -[CAMLWriter setElementAttribute:forKey:](self, "setElementAttribute:forKey:", v17, CFSTR("type"));
  objc_msgSend(a3, "encodeWithCAMLWriter:", self);
  -[CAMLWriter endElement](self, "endElement");
  CFSetRemoveValue(priv->var6, a3);
  if ((v14 & 1) == 0)
    goto LABEL_32;
}

- (void)beginElement:(unsigned int)a3
{
  _CAMLWriterPriv *priv;
  malloc_zone_t *malloc_zone;
  _CAMLWriterElement *v7;

  priv = self->_priv;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v7 = (_CAMLWriterElement *)malloc_type_zone_malloc(malloc_zone, 0x50uLL, 0x8BB15036uLL);
  if (v7)
  {
    v7->var0 = priv->var3;
    priv->var3 = v7;
    v7->var1 = 0;
    v7->var2 = 0;
    v7->var3 = &v7->var1;
    v7->var4 = 0;
    v7->var5 = 0;
    v7->var6 = 0;
    v7->var7 = &v7->var6;
    v7->var8 = 0;
    v7->var9 = 1 << a3;
    if (priv->var4)
    {
      if (a3 == 1)
        -[CAMLWriter setElementAttribute:forKey:](self, "setElementAttribute:forKey:");
      priv->var4 = 0;
    }
  }
}

- (void)beginPropertyElement:(id)a3
{
  -[CAMLWriter beginElement:](self, "beginElement:", 2);
  -[CAMLWriter setElementAttribute:forKey:](self, "setElementAttribute:forKey:", a3, CFSTR("key"));
}

- (void)setElementAttribute:(id)a3 forKey:(id)a4
{
  _CAMLWriterElement *var3;
  int v6;
  int v7;
  _CAMLWriterAttribute *p_var6;
  id v9;
  malloc_zone_t *malloc_zone;

  var3 = self->_priv->var3;
  v6 = CAInternAtom((const __CFString *)a4, 1);
  v7 = v6;
  p_var6 = (_CAMLWriterAttribute *)&var3->var6;
  do
  {
    p_var6 = *(_CAMLWriterAttribute **)p_var6;
    if (!p_var6)
    {
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      p_var6 = (_CAMLWriterAttribute *)malloc_type_zone_malloc(malloc_zone, 0x18uLL, 0x8BB15036uLL);
      *var3->var7 = p_var6;
      var3->var7 = (_CAMLWriterAttribute **)p_var6;
      *(_QWORD *)p_var6 = 0;
      *((_DWORD *)p_var6 + 2) = v7;
      goto LABEL_7;
    }
  }
  while (*((_DWORD *)p_var6 + 2) != v6);
  v9 = (id)*((_QWORD *)p_var6 + 2);
  if (v9 == a3)
    return;
  CFRelease(v9);
  *((_QWORD *)p_var6 + 2) = 0;
LABEL_7:
  *((_QWORD *)p_var6 + 2) = CFStringCreateCopy(0, (CFStringRef)a3);
}

- (void)setElementContent:(id)a3
{
  _CAMLWriterElement *var3;
  __CFString *var8;
  CFStringRef Copy;

  var3 = self->_priv->var3;
  var8 = var3->var8;
  if (var8 != a3)
  {
    if (var8)
      CFRelease(var8);
    Copy = 0;
    if (a3)
      Copy = CFStringCreateCopy(0, (CFStringRef)a3);
    var3->var8 = (__CFString *)Copy;
  }
}

- (id)URLStringForResource:(id)a3
{
  _CAMLWriterPriv *priv;
  void *v4;
  void *v5;
  __CFURL *var1;
  void *v8;
  int v9;
  void *v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  if (!a3)
    return 0;
  priv = self->_priv;
  if ((*((_BYTE *)priv + 60) & 4) == 0)
    return 0;
  v4 = (void *)objc_msgSend(priv->var2, "CAMLWriter:URLForResource:", self, a3);
  if (!v4)
    return 0;
  v5 = v4;
  var1 = priv->var1;
  if (!var1)
    return (id)objc_msgSend(v5, "absoluteString");
  if (objc_msgSend(v4, "baseURL") && objc_msgSend((id)objc_msgSend(v5, "baseURL"), "isEqual:", var1))
    return (id)objc_msgSend(v5, "relativePath");
  if (!objc_msgSend(v5, "isFileURL"))
    return (id)objc_msgSend(v5, "absoluteString");
  if ((-[__CFURL isFileURL](var1, "isFileURL") & 1) == 0)
    return (id)objc_msgSend(v5, "absoluteString");
  v8 = (void *)objc_msgSend((id)objc_msgSend(v5, "path"), "pathComponents");
  v9 = objc_msgSend(v8, "count");
  v10 = (void *)objc_msgSend((id)-[__CFURL path](var1, "path"), "pathComponents");
  v11 = objc_msgSend(v10, "count");
  v12 = v11;
  if (v9 <= (int)v11)
    return (id)objc_msgSend(v5, "absoluteString");
  v13 = v11;
  while ((int)v13 >= 1)
  {
    --v13;
    if ((objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", v13), "isEqualToString:", objc_msgSend(v10, "objectAtIndex:", v13)) & 1) == 0)return (id)objc_msgSend(v5, "absoluteString");
  }
  v14 = objc_msgSend(v8, "subarrayWithRange:", v12, v9 - v12);
  v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v14);
  return (id)objc_msgSend(v15, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet"));
}

- (void)endElement
{
  _CAMLWriterElement *var3;
  _CAMLWriterElement *var0;
  const __CFString *var8;
  _CAMLWriterElement *v6;
  void *var4;
  unsigned int var9;
  _CAMLWriterElement *var1;
  _CAMLWriterElement *v10;
  _CAMLWriterAttribute *var6;
  _CAMLWriterAttribute *v12;
  unsigned int v13;
  int v14;
  _CAMLWriterAttribute **v15;
  _CAMLWriterAttribute *v16;
  unsigned int v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  _CAMLWriterAttribute **p_var6;
  _CAMLWriterAttribute **v22;
  const __CFString *v23;
  const __CFString *v24;
  int v25;
  _CAMLWriterAttribute *v26;
  int v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFSet *v30;
  CFRange result;
  void *values[2];
  __int128 v33;
  uint64_t v34;
  CFRange v35;
  CFRange v36;

  v34 = *MEMORY[0x1E0C80C00];
  var3 = self->_priv->var3;
  var0 = var3->var0;
  result.location = 0;
  result.length = 0;
  if (var3->var9 == 2)
  {
    var8 = var3->var8;
    if (var8)
    {
      if (!-[CAMLWriter endElement]::newline_set)
      {
        v35.location = 10;
        v35.length = 1;
        -[CAMLWriter endElement]::newline_set = (uint64_t)CFCharacterSetCreateWithCharactersInRange(0, v35);
        var8 = var3->var8;
      }
      v36.length = CFStringGetLength(var8);
      result.location = 0;
      result.length = v36.length;
      v36.location = 0;
      if (!CFStringFindCharacterFromSet(var3->var8, (CFCharacterSetRef)-[CAMLWriter endElement]::newline_set, v36, 0, &result))
      {
        -[CAMLWriter setElementAttribute:forKey:](self, "setElementAttribute:forKey:", var3->var8, CFSTR("value"));
        CFRelease(var3->var8);
        var3->var8 = 0;
      }
    }
  }
  self->_priv->var3 = var0;
  if (var0)
  {
    if ((var0->var9 & 4) != 0)
    {
      v6 = var0->var0;
      if (var0->var0)
      {
        var4 = v6->var4;
        if (var4)
        {
          if ((v6->var9 & 2) != 0)
          {
            p_var6 = &var0->var6;
            while (1)
            {
              p_var6 = (_CAMLWriterAttribute **)*p_var6;
              if (!p_var6)
                break;
              if (*((_DWORD *)p_var6 + 2) == 329)
              {
                if (p_var6[2])
                {
                  v22 = &var3->var6;
                  while (1)
                  {
                    v22 = (_CAMLWriterAttribute **)*v22;
                    if (!v22)
                      break;
                    if (*((_DWORD *)v22 + 2) == 566)
                    {
                      v23 = (const __CFString *)v22[2];
                      if (v23)
                      {
                        v24 = (const __CFString *)objc_msgSend(var4, "CAMLTypeForKey:");
                        if (v24)
                        {
                          if (CAMLWriterTypesEqual(v23, v24))
                            CAMLWriterElementRemoveAttribute(var3, 566);
                        }
                      }
                      goto LABEL_12;
                    }
                  }
                }
                break;
              }
            }
          }
        }
      }
    }
LABEL_12:
    var9 = var3->var9;
    if (var9 == 2)
    {
      if (var0->var9 == 4)
      {
        var0->var9 = 6;
        var0->var8 = var3->var8;
        var3->var8 = 0;
        var1 = var3->var1;
        if (var1)
        {
          v10 = var3->var1;
          do
          {
            v10->var0 = var0;
            v10 = v10->var2;
          }
          while (v10);
        }
        *var0->var3 = var1;
        var0->var3 = var3->var3;
        var3->var1 = 0;
        var3->var3 = &var3->var1;
        *var0->var7 = var3->var6;
        var0->var7 = var3->var7;
        var3->var6 = 0;
        var3->var7 = &var3->var6;
        goto LABEL_51;
      }
      goto LABEL_26;
    }
  }
  else
  {
    var9 = var3->var9;
  }
  if (var9 == 6)
  {
    if (var0)
    {
      if (!var3->var1 && var0->var9 == 2)
      {
        var6 = var3->var6;
        if (var6)
        {
          v12 = *(_CAMLWriterAttribute **)var6;
          if (*(_QWORD *)var6)
          {
            if (!*(_QWORD *)v12)
            {
              v25 = *((_DWORD *)var6 + 2);
              if (v25 == 572)
              {
                v27 = *((_DWORD *)v12 + 2);
                v26 = *(_CAMLWriterAttribute **)var6;
                v12 = var3->var6;
                if (v27 != 329)
                  goto LABEL_26;
              }
              else
              {
                if (v25 != 329)
                  goto LABEL_26;
                v26 = var3->var6;
                if (*((_DWORD *)v12 + 2) != 572)
                  goto LABEL_26;
              }
              v28 = (const __CFString *)*((_QWORD *)v26 + 2);
              v29 = *((_QWORD *)v12 + 2);
              if (!CAMLWriterIdentifierNeedsQuoting(v28))
              {
                v30 = (const __CFSet *)CAMLWriterReservedAttr(__CFString const*)::reserved_attrs;
                if (!CAMLWriterReservedAttr(__CFString const*)::reserved_attrs)
                {
                  *(_OWORD *)values = xmmword_1E15AB400;
                  v33 = *(_OWORD *)off_1E15AB410;
                  v30 = CFSetCreate(0, (const void **)values, 4, MEMORY[0x1E0C9B3B0]);
                  CAMLWriterReservedAttr(__CFString const*)::reserved_attrs = (uint64_t)v30;
                }
                if (!CFSetContainsValue(v30, v28))
                {
                  -[CAMLWriter setElementAttribute:forKey:](self, "setElementAttribute:forKey:", v29, v28);
                  goto LABEL_51;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_26:
  if (var3->var5)
    goto LABEL_38;
  v13 = var3->var9;
  if ((v13 & 6) != 0)
  {
    if ((v13 & 4) != 0)
      v14 = 329;
    else
      v14 = 566;
    v15 = &var3->var6;
    while (1)
    {
      v15 = (_CAMLWriterAttribute **)*v15;
      if (!v15)
        break;
      if (*((_DWORD *)v15 + 2) == v14)
      {
        v16 = v15[2];
        if (v16 && !CAMLWriterIdentifierNeedsQuoting((CFStringRef)v15[2]))
        {
          var3->var5 = (__CFString *)CFRetain(v16);
          CAMLWriterElementRemoveAttribute(var3, v14);
        }
        break;
      }
    }
  }
  if (var3->var5)
  {
LABEL_38:
    if (var0)
    {
LABEL_39:
      *var0->var3 = var3;
      var0->var3 = &var3->var2;
      return;
    }
  }
  else
  {
    v17 = var3->var9;
    v18 = CFSTR("o");
    v19 = CFSTR("unknown");
    if (v17 == 8)
      v19 = CFSTR("script");
    if (v17 != 2)
      v18 = v19;
    if (v17 == 1)
      v18 = CFSTR("caml");
    if ((v17 & 4) != 0)
      v20 = CFSTR("p");
    else
      v20 = v18;
    var3->var5 = (__CFString *)v20;
    CFRetain(v20);
    if (var0)
      goto LABEL_39;
  }
  CAMLWriterPrintf(self->_priv, "%s", "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
  -[CAMLWriter _writeElementTree:](self, "_writeElementTree:", var3);
  CAMLWriterNewline((_CAMLWriterPriv *)self->_priv->var0, self->_priv->var7);
LABEL_51:
  CAMLWriterFreeElementList(var3);
}

- (void)_writeElementTree:(_CAMLWriterElement *)a3
{
  _BOOL4 v5;
  _CAMLWriterPriv *priv;
  _CAMLWriterAttribute *var6;
  const char *v8;
  _CAMLWriterPriv *v9;
  const __CFString *String;
  const char *v11;
  const char *v12;
  _CAMLWriterElement *var1;
  _CAMLWriterPriv *v14;

  CAMLWriterNewline((_CAMLWriterPriv *)self->_priv->var0, self->_priv->var7);
  if (a3->var1)
    v5 = 0;
  else
    v5 = a3->var8 == 0;
  priv = self->_priv;
  if (a3->var6)
  {
    CAMLWriterPrintf(priv, "<%S", a3->var5);
    var6 = a3->var6;
    if (var6)
    {
      if (v5)
        v8 = "/>";
      else
        v8 = ">";
      do
      {
        v9 = self->_priv;
        String = CAAtomGetString(*((_DWORD *)var6 + 2));
        if (*(_QWORD *)var6)
          v11 = "";
        else
          v11 = v8;
        CAMLWriterPrintf(v9, " %S=\"%S\"%s", String, *((const void **)var6 + 2), v11);
        var6 = *(_CAMLWriterAttribute **)var6;
      }
      while (var6);
    }
  }
  else
  {
    v12 = ">";
    if (v5)
      v12 = "/>";
    CAMLWriterPrintf(priv, "<%S%s", a3->var5, v12);
  }
  var1 = a3->var1;
  if (var1)
  {
    ++self->_priv->var7;
    do
    {
      -[CAMLWriter _writeElementTree:](self, "_writeElementTree:", var1);
      var1 = var1->var2;
    }
    while (var1);
    --self->_priv->var7;
  }
  else if (a3->var8)
  {
    CAMLWriterPrintf(self->_priv, "%S", a3->var8);
  }
  if (!v5)
  {
    v14 = self->_priv;
    if (!a3->var8)
    {
      CAMLWriterNewline((_CAMLWriterPriv *)v14->var0, v14->var7);
      v14 = self->_priv;
    }
    CAMLWriterPrintf(v14, "</%S>", a3->var5);
  }
}

- (void)dealloc
{
  _CAMLWriterPriv *priv;
  __CFString *var4;
  __CFSet *var5;
  __CFSet *var6;
  __CFURL *var1;
  _CAMLWriterElement *var3;
  malloc_zone_t *malloc_zone;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  priv = self->_priv;
  if (priv)
  {
    if (priv->var0)
      CFRelease(priv->var0);
    var4 = priv->var4;
    if (var4)
      CFRelease(var4);
    var5 = priv->var5;
    if (var5)
      CFRelease(var5);
    var6 = priv->var6;
    if (var6)
      CFRelease(var6);
    var1 = priv->var1;
    if (var1)
      CFRelease(var1);
    var3 = priv->var3;
    if (var3)
      CAMLWriterFreeElementList(var3);
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    malloc_zone_free(malloc_zone, priv);
  }
  v10.receiver = self;
  v10.super_class = (Class)CAMLWriter;
  -[CAMLWriter dealloc](&v10, sel_dealloc);
}

+ (id)writerWithData:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithData:", a3);
}

@end
