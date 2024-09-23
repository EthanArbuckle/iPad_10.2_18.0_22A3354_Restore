@implementation CADisplayPreferences

- (BOOL)matchContent
{
  return self->_priv->var0;
}

- (CADisplayPreferences)initWithMatchContent:(BOOL)a3 preferredHdrType:(int)a4
{
  CADisplayPreferencesPriv *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = (CADisplayPreferencesPriv *)malloc_type_malloc(8uLL, 0x10000404A09149AuLL);
  self->_priv = v7;
  v7->var0 = a3;
  v7->var1 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CADisplayPreferences;
  return -[CADisplayPreferences init](&v9, sel_init);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  free(self->_priv);
  v3.receiver = self;
  v3.super_class = (Class)CADisplayPreferences;
  -[CADisplayPreferences dealloc](&v3, sel_dealloc);
}

- (CADisplayPreferences)init
{
  return -[CADisplayPreferences initWithPreferences:](self, "initWithPreferences:", 0);
}

- (CADisplayPreferences)initWithPreferences:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = *((_QWORD *)a3 + 1);
    a3 = (id)(*(_BYTE *)v3 != 0);
    v4 = *(unsigned int *)(v3 + 4);
  }
  else
  {
    v4 = 0;
  }
  return -[CADisplayPreferences initWithMatchContent:preferredHdrType:](self, "initWithMatchContent:preferredHdrType:", a3, v4);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CADisplayPreferences initWithPreferences:](+[CAMutableDisplayPreferences allocWithZone:](CAMutableDisplayPreferences, "allocWithZone:", a3), "initWithPreferences:", self);
}

- (void)setMatchContent:(BOOL)a3
{
  self->_priv->var0 = a3;
}

- (NSString)preferredHdrMode
{
  unsigned int v2;

  v2 = self->_priv->var1 - 1;
  if (v2 > 4)
    return 0;
  else
    return (NSString *)*(&off_1E159C5A0 + v2);
}

- (int)_preferredHdrType
{
  return self->_priv->var1;
}

- (void)setPreferredHdrMode:(id)a3
{
  int v5;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Dolby")) & 1) != 0)
  {
    v5 = 5;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("HDR10")) & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("SDR"));
  }
  self->_priv->var1 = v5;
}

@end
