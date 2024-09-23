@implementation LiveFSHexAndASCIIString

- (LiveFSHexAndASCIIString)initWithData:(id)a3
{
  id v4;
  LiveFSHexAndASCIIString *v5;
  uint64_t v6;
  NSData *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LiveFSHexAndASCIIString;
  v5 = -[LiveFSHexAndASCIIString init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    data = v5->data;
    v5->data = (NSData *)v6;

  }
  return v5;
}

- (LiveFSHexAndASCIIString)init
{
  void *v3;
  LiveFSHexAndASCIIString *v4;

  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LiveFSHexAndASCIIString initWithData:](self, "initWithData:", v3);

  return v4;
}

- (id)data
{
  return self->data;
}

- (unint64_t)length
{
  return 53 * ((-[NSData length](self->data, "length") + 9) / 0xA);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  unsigned __int16 v4;

  v4 = 0;
  -[LiveFSHexAndASCIIString getCharacters:range:](self, "getCharacters:range:", &v4, a3, 1);
  return v4;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  unsigned __int8 *v19;
  uint64_t v20;
  unint64_t v21;
  unsigned __int16 *v22;
  void *v23;
  unint64_t v24;
  NSRange v25;
  NSUInteger v26;
  unint64_t v27;
  unsigned __int16 *v28;
  uint64_t v29;
  int64_t v30;
  unsigned __int8 *v31;
  id v32;
  NSRange v33;
  NSRange v34;

  length = a4.length;
  location = a4.location;
  v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 53);
  v31 = -[NSData bytes](self->data, "bytes");
  v8 = 10 * (location / 0x35);
  v26 = length;
  v9 = 10 * ((length + location + 52) / 0x35);
  if (v9 > -[NSData length](self->data, "length"))
    v9 = -[NSData length](self->data, "length");
  v10 = v9 - v8;
  v11 = v32;
  if (v9 > v8)
  {
    v30 = v9;
    do
    {
      v28 = a3;
      v29 = v10 - 10;
      if (v10 >= 10)
        v10 = 10;
      if (v10 <= 1)
        v10 = 1;
      v12 = v9;
      v27 = v10;
      v13 = -v10;
      objc_msgSend(v11, "appendFormat:", CFSTR("%08ld: "), v8);
      v14 = 0;
      v15 = v31;
      v16 = v13;
      if (v12 <= v8)
        goto LABEL_13;
      do
      {
        objc_msgSend(v32, "appendFormat:", CFSTR(" %02hhx"), v15[v8]);
        ++v15;
        v17 = __CFADD__(v16++, 1);
      }
      while (!v17);
      v14 = v27;
      if (v27 <= 9)
      {
LABEL_13:
        v18 = v14 - 10;
        do
        {
          objc_msgSend(v32, "appendString:", CFSTR("   "));
          v17 = __CFADD__(v18++, 1);
        }
        while (!v17);
      }
      objc_msgSend(v32, "appendString:", CFSTR("  "));
      v19 = v31;
      if (v30 <= v8)
      {
        v21 = 0;
        v22 = v28;
        v9 = v30;
      }
      else
      {
        do
        {
          if ((v19[v8] & 0x7Fu) - 32 >= 0x5F)
            v20 = 46;
          else
            v20 = v19[v8];
          objc_msgSend(v32, "appendFormat:", CFSTR("%c"), v20);
          ++v19;
          v17 = __CFADD__(v13++, 1);
        }
        while (!v17);
        v21 = v27;
        v22 = v28;
        v23 = v32;
        v9 = v30;
        if (v27 > 9)
          goto LABEL_28;
      }
      v24 = v21 - 10;
      do
      {
        objc_msgSend(v32, "appendString:", CFSTR(" "));
        v23 = v32;
        v17 = __CFADD__(v24++, 1);
      }
      while (!v17);
LABEL_28:
      objc_msgSend(v23, "appendString:", CFSTR("\n"));
      v33.location = 53 * (v8 / 0xAuLL);
      v33.length = 53;
      v34.location = location;
      v34.length = v26;
      v25 = NSIntersectionRange(v33, v34);
      objc_msgSend(v32, "getCharacters:range:", v22, v25.location - 53 * (v8 / 0xAuLL), v25.length);
      objc_msgSend(v32, "setString:", &stru_24F64CE40);
      v11 = v32;
      v8 += 10;
      a3 = &v22[v25.length];
      v10 = v29;
    }
    while (v8 < v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->data, 0);
}

@end
