@implementation _GCGamepadEventKeyboardEventAdapterConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCGamepadEventKeyboardEventAdapterConfig)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_GCGamepadEventKeyboardEventAdapterConfig;
  return -[_GCGamepadEventKeyboardEventAdapterConfig init](&v3, sel_init);
}

- (_GCGamepadEventKeyboardEventAdapterConfig)initWithCoder:(id)a3
{
  id v4;
  _GCGamepadEventKeyboardEventAdapterConfig *v5;
  const void *v6;
  size_t v7;
  unint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GCGamepadEventKeyboardEventAdapterConfig;
  v5 = -[_GCGamepadEventKeyboardEventAdapterConfig init](&v10, sel_init);
  if (v5)
  {
    v9 = 0;
    v6 = (const void *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("mappings"), &v9);
    if (v9 >= 0x2F0)
      v7 = 752;
    else
      v7 = v9;
    memcpy(v5->_mappings, v6, v7);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBytes:length:forKey:", self->_mappings, 752, CFSTR("mappings"));
}

- (void)mapUsagePage:(int64_t)a3 usage:(int64_t)a4 toGamepadElement:(int64_t)a5
{
  char *v5;

  if ((unint64_t)a5 <= 0x2E)
  {
    v5 = (char *)self + 16 * a5;
    *((_QWORD *)v5 + 1) = a3;
    *((_QWORD *)v5 + 2) = a4;
  }
}

- (int64_t)gamepadElementForUsagePage:(int64_t)a3 usage:(int64_t)a4
{
  int64_t result;
  int64_t *i;

  result = 0;
  for (i = &self->_mappings[0].usage; *(i - 1) != a3 || *i != a4; i += 2)
  {
    if (++result == 47)
      return -1;
  }
  return result;
}

@end
