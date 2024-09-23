@implementation AEConcretePreferencePrimitives

- (_QWORD)initWithDomain:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)AEConcretePreferencePrimitives;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

- (id)BOOLForKey:(id)a3
{
  const __CFString *domain;
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  _BOOL8 v6;

  if (self)
    domain = (const __CFString *)self->_domain;
  else
    domain = 0;
  v4 = (const __CFBoolean *)CFPreferencesCopyValue((CFStringRef)a3, domain, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
  if (v4)
  {
    v5 = v4;
    v6 = CFBooleanGetValue(v4) != 0;
    CFRelease(v5);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v4 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setBool:(id)a3 forKey:(id)a4
{
  __CFString *v6;
  int v7;
  const void **v8;
  const void *v9;
  const __CFString *domain;
  id v11;

  v11 = a3;
  v6 = (__CFString *)a4;
  if (v11)
  {
    v7 = objc_msgSend(v11, "BOOLValue");
    v8 = (const void **)MEMORY[0x24BDBD270];
    if (!v7)
      v8 = (const void **)MEMORY[0x24BDBD268];
    v9 = *v8;
    if (self)
      goto LABEL_5;
LABEL_8:
    domain = 0;
    goto LABEL_6;
  }
  v9 = 0;
  if (!self)
    goto LABEL_8;
LABEL_5:
  domain = (const __CFString *)self->_domain;
LABEL_6:
  CFPreferencesSetValue(v6, v9, domain, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);

}

- (id)numberForKey:(id)a3
{
  __CFString *v4;
  void *v5;

  v4 = (__CFString *)a3;
  objc_opt_class();
  -[AEConcretePreferencePrimitives objectForKey:ofClass:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)objectForKey:(uint64_t)a1 ofClass:(CFStringRef)key
{
  void *v2;
  id v3;

  if (a1)
  {
    v2 = (void *)CFPreferencesCopyValue(key, *(CFStringRef *)(a1 + 8), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setNumber:(id)a3 forKey:(id)a4
{
  const __CFString *domain;

  if (self)
    domain = (const __CFString *)self->_domain;
  else
    domain = 0;
  CFPreferencesSetValue((CFStringRef)a4, a3, domain, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
