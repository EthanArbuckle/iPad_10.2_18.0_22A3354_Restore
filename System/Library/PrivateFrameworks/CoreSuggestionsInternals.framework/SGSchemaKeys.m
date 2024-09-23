@implementation SGSchemaKeys

+ (BOOL)schemaURLString:(id)a3 isEqualTo:(id)a4
{
  id v5;
  id v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "hasPrefix:", CFSTR("http://schema.org/"));
  v8 = objc_msgSend(v6, "hasPrefix:", CFSTR("http://schema.org/"));
  v9 = v8;
  if ((v7 & 1) != 0 || (v8 & 1) != 0)
  {
    if ((v7 & 1) == 0)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("http://schema.org/%@"), v5);

      v5 = (id)v10;
    }
    if ((v9 & 1) == 0)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("http://schema.org/%@"), v6);

      v6 = (id)v11;
    }
  }
  v12 = objc_msgSend(v5, "isEqualToString:", v6);

  return v12;
}

@end
