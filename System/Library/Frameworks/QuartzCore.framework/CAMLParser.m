@implementation CAMLParser

- (id)objectById:(id)a3
{
  id result;

  result = (id)*((_QWORD *)self->_data + 8);
  if (result)
  {
    result = (id)CFDictionaryGetValue((CFDictionaryRef)result, a3);
    if (result)
      return (id)*((_QWORD *)result + 1);
  }
  return result;
}

- (id)attributeForKey:(id)a3 remove:(BOOL)a4
{
  const char *v4;
  const char *v5;

  v4 = *(const char **)(*((_QWORD *)self->_data + 6) + 216);
  if (v4 && (v5 = CAML::memq_(v4, (const char **)objc_msgSend(a3, "UTF8String"), (const char *)a4)) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  else
    return 0;
}

- (void)setElementValue:(id)a3
{
  CAML::State *v3;

  v3 = (CAML::State *)*((_QWORD *)self->_data + 11);
  if (v3)
    CAML::State::set_value(v3, a3);
}

- (id)elementValue
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_data + 11);
  if (v2)
    return *(id *)(v2 + 64);
  else
    return 0;
}

- (void)dealloc
{
  _CAMLParserData *data;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  data = self->_data;
  if (data)
    (*(void (**)(_CAMLParserData *, SEL))(*(_QWORD *)data + 8))(data, a2);
  v4.receiver = self;
  v4.super_class = (Class)CAMLParser;
  -[CAMLParser dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  _CAMLParserData *data;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;

  data = self->_data;
  if (*((id *)data + 12) != a3)
  {
    *((_QWORD *)data + 12) = a3;
    *((_BYTE *)data + 112) = *((_BYTE *)data + 112) & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 2;
    else
      v4 = 0;
    *((_BYTE *)data + 112) = *((_BYTE *)data + 112) & 0xFD | v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 4;
    else
      v5 = 0;
    *((_BYTE *)data + 112) = *((_BYTE *)data + 112) & 0xFB | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 8;
    else
      v6 = 0;
    *((_BYTE *)data + 112) = *((_BYTE *)data + 112) & 0xF7 | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 16;
    else
      v7 = 0;
    *((_BYTE *)data + 112) = *((_BYTE *)data + 112) & 0xEF | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 32;
    else
      v8 = 0;
    *((_BYTE *)data + 112) = *((_BYTE *)data + 112) & 0xDF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 64;
    else
      v9 = 0;
    *((_BYTE *)data + 112) = *((_BYTE *)data + 112) & 0xBF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 0x80;
    else
      v10 = 0;
    *((_BYTE *)data + 112) = v10 & 0x80 | *((_BYTE *)data + 112) & 0x7F;
  }
}

- (id)result
{
  return (id)CAML::Context::result((CAML::Context *)self->_data);
}

- (BOOL)parseContentsOfURL:(id)a3
{
  _CAMLParserData *data;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  CFURLRef PathComponent;
  CFURLRef v12;
  const void *v13;
  BOOL v14;
  const void *v15;
  const void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  data = self->_data;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", a3, 0, &v17);
  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to load CAPackage from URL: %@"), a3);
  if (v17)
  {
    v8 = *MEMORY[0x1E0CB3388];
    v18[0] = *MEMORY[0x1E0CB2D50];
    v18[1] = v8;
    v19[0] = v7;
    v19[1] = v17;
    v9 = (const void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CoreAnimationErrorDomain"), 2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
    v17 = v9;
    if (v9)
      CAML::Context::set_error((CAML::Context *)data, v9);
  }
  if (!v6)
    return 0;
  v10 = *((_QWORD *)data + 2);
  if (!v10)
  {
    PathComponent = CFURLCreateCopyDeletingLastPathComponent(0, (CFURLRef)a3);
    if (PathComponent)
    {
      v12 = PathComponent;
      CAML::Context::set_base_url((CAML::Context *)data, PathComponent);
      CFRelease(v12);
    }
  }
  v13 = (const void *)*((_QWORD *)data + 3);
  CAML::Context::set_current_url((CAML::Context *)data, a3);
  v14 = -[CAMLParser parseData:](self, "parseData:", v6);
  CAML::Context::set_current_url((CAML::Context *)data, v13);
  if (!v10)
  {
    v15 = (const void *)*((_QWORD *)data + 2);
    if (v15)
    {
      CFRelease(v15);
      *((_QWORD *)data + 2) = 0;
    }
  }

  return v14;
}

+ (id)parser
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)parseData:(id)a3
{
  return -[CAMLParser parseBytes:length:](self, "parseBytes:length:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
}

- (BOOL)parseBytes:(const char *)a3 length:(unint64_t)a4
{
  int v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  malloc_zone_t *malloc_zone;
  _QWORD *v11;
  _CAMLParserData *data;
  const void *v13;
  xmlParserCtxt *v14;
  xmlParserCtxt *PushParserCtxt;
  BOOL v16;

  v4 = a4;
  v7 = (void *)MEMORY[0x186DBE2E4](self, a2);
  pthread_mutex_lock(&parser_mutex);
  while (1)
  {
    v8 = parser_wip;
    if (!parser_wip)
      break;
    v9 = parser_wip;
    while (*(const char **)v9 != a3)
    {
      v9 = *(_QWORD *)(v9 + 8);
      if (!v9)
        goto LABEL_8;
    }
    pthread_cond_wait(&parser_cond, &parser_mutex);
  }
LABEL_8:
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v11 = malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
  *v11 = a3;
  v11[1] = v8;
  parser_wip = (uint64_t)v11;
  pthread_mutex_unlock(&parser_mutex);
  data = self->_data;
  v13 = (const void *)*((_QWORD *)data + 4);
  if (v13)
  {
    CFRelease(v13);
    *((_QWORD *)data + 4) = 0;
  }
  v14 = (xmlParserCtxt *)*((_QWORD *)data + 1);
  if (!v14)
  {
    if (CAML::Context::_sax_vtable_once[0] != -1)
      dispatch_once_f(CAML::Context::_sax_vtable_once, 0, (dispatch_function_t)CAML::Context::create_sax_vtable);
    PushParserCtxt = xmlCreatePushParserCtxt((xmlSAXHandlerPtr)CAML::Context::_sax_vtable, data, 0, 0, 0);
    *((_QWORD *)data + 1) = PushParserCtxt;
    if (!PushParserCtxt)
    {
      v16 = 0;
      goto LABEL_16;
    }
    xmlCtxtUseOptions(PushParserCtxt, 2);
    CAML::Context::push_state((uint64_t)data, 1, 0, 0, 0);
    v14 = (xmlParserCtxt *)*((_QWORD *)data + 1);
  }
  xmlParseChunk(v14, a3, v4, 0);
  v16 = *((_QWORD *)data + 4) == 0;
LABEL_16:
  pthread_mutex_lock(&parser_mutex);
  parser_wip = (uint64_t)x_list_remove((_QWORD *)parser_wip, (uint64_t)a3);
  pthread_cond_broadcast(&parser_cond);
  pthread_mutex_unlock(&parser_mutex);
  objc_autoreleasePoolPop(v7);
  return v16;
}

- (CAMLParser)init
{
  CAMLParser *v2;
  malloc_zone_t *malloc_zone;
  char *v4;
  char *v5;
  int *v6;
  uint64_t i;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)CAMLParser;
  v2 = -[CAMLParser init](&v9, sel_init);
  if (v2)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v4 = (char *)malloc_type_zone_malloc(malloc_zone, 0x78uLL, 0x8BB15036uLL);
    v5 = v4;
    if (v4)
    {
      *(_OWORD *)(v4 + 56) = 0u;
      *(_OWORD *)(v4 + 40) = 0u;
      *(_OWORD *)(v4 + 24) = 0u;
      *(_OWORD *)(v4 + 8) = 0u;
      *(_QWORD *)v4 = off_1E1599CF8;
      *((_QWORD *)v4 + 9) = 0;
      *((_QWORD *)v4 + 10) = v2;
      *((_QWORD *)v4 + 12) = 0;
      *((_QWORD *)v4 + 13) = 0;
      *((_QWORD *)v4 + 11) = 0;
      v4[112] = 0;
      if (CAML::ObjCContext::_builtin_types_once[0] != -1)
        dispatch_once_f(CAML::ObjCContext::_builtin_types_once, 0, (dispatch_function_t)CAML::ObjCContext::create_builtin_types);
      v6 = (int *)x_hash_table_new_((unint64_t (*)(uint64_t))x_string_hash, (BOOL (*)(uint64_t, uint64_t))x_string_compare, 0, 0, 0, 0);
      for (i = 0; i != 192; i += 8)
        hash_table_modify(v6, *(_QWORD *)(*(_QWORD *)(CAML::ObjCContext::_builtin_types + i) + 8), *(_QWORD *)(CAML::ObjCContext::_builtin_types + i), 0);
      hash_table_modify(v6, (uint64_t)"NSString", *(_QWORD *)(CAML::ObjCContext::_builtin_types + 32), 0);
      *((_QWORD *)v5 + 13) = v6;
    }
    v2->_data = (_CAMLParserData *)v5;
  }
  return v2;
}

- (void)setBaseURL:(id)a3
{
  CAML::Context::set_base_url((CAML::Context *)self->_data, a3);
}

- (NSError)error
{
  return (NSError *)*((_QWORD *)self->_data + 4);
}

- (NSURL)baseURL
{
  return (NSURL *)*((_QWORD *)self->_data + 2);
}

- (CAMLParserDelegate)delegate
{
  return (CAMLParserDelegate *)*((_QWORD *)self->_data + 12);
}

- (BOOL)parseString:(id)a3
{
  const char *v4;

  v4 = (const char *)objc_msgSend(a3, "UTF8String");
  return -[CAMLParser parseBytes:length:](self, "parseBytes:length:", v4, strlen(v4));
}

- (id)willLoadResourceFromURL:(id)a3
{
  id result;

  result = (id)(*(uint64_t (**)(_CAMLParserData *, id))(*(_QWORD *)self->_data + 72))(self->_data, a3);
  if (result)
    return result;
  return result;
}

- (void)didLoadResource:(id)a3 fromURL:(id)a4
{
  (*(void (**)(_CAMLParserData *, id, id))(*(_QWORD *)self->_data + 80))(self->_data, a4, a3);
}

- (id)didFailToLoadResourceFromURL:(id)a3
{
  id result;

  result = (id)(*(uint64_t (**)(_CAMLParserData *, id))(*(_QWORD *)self->_data + 88))(self->_data, a3);
  if (result)
    return result;
  return result;
}

- (void)parserError:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a3, &v5);
  CAML::Context::error((CAML::Context *)self->_data, "%s", (const char *)objc_msgSend(v4, "UTF8String"));

}

- (void)parserWarning:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a3, &v5);
  CAML::Context::warning((CAML::Context *)self->_data, "%s", (const char *)objc_msgSend(v4, "UTF8String"));

}

+ (id)parseContentsOfURL:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "parseContentsOfURL:", a3);
  v5 = objc_msgSend(v4, "error");
  if (v5)
  {
    NSLog(CFSTR("Error while parsing CoreAnimation XML document %@: %@"), a3, v5);
    v6 = 0;
  }
  else
  {
    v6 = (id)objc_msgSend(v4, "result");
  }

  return v6;
}

@end
