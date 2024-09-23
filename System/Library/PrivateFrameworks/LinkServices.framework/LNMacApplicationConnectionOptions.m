@implementation LNMacApplicationConnectionOptions

- (LNMacApplicationConnectionOptions)init
{
  LNMacApplicationConnectionOptions *v2;
  LNMacApplicationConnectionOptions *v3;
  LNMacApplicationConnectionOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNMacApplicationConnectionOptions;
  v2 = -[LNMacApplicationConnectionOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_background = 1;
    v4 = v2;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNMacApplicationConnectionOptions;
  v4 = -[LNConnectionOptions copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setBackground:", -[LNMacApplicationConnectionOptions isBackground](self, "isBackground"));
  return v4;
}

- (BOOL)isForeground
{
  return !-[LNMacApplicationConnectionOptions isBackground](self, "isBackground");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LNConnectionOptions authenticationPolicy](self, "authenticationPolicy");
  v7 = CFSTR("Force Unlock");
  if (!v6)
    v7 = CFSTR("Default");
  v8 = v7;
  if (-[LNMacApplicationConnectionOptions isBackground](self, "isBackground"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[LNConnectionOptions initiatesAudioSession](self, "initiatesAudioSession"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, authenticationPolicy: %@, background: %@, initiatesAudioSession: %@>"), v5, self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (unint64_t)hash
{
  return -[LNMacApplicationConnectionOptions isBackground](self, "isBackground");
}

- (BOOL)isEqual:(id)a3
{
  LNMacApplicationConnectionOptions *v4;
  LNMacApplicationConnectionOptions *v5;
  LNMacApplicationConnectionOptions *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  objc_super v10;

  v4 = (LNMacApplicationConnectionOptions *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
    goto LABEL_10;
  }
  v6 = v4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v6 = 0;
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)LNMacApplicationConnectionOptions;
  if (!-[LNConnectionOptions isEqual:](&v10, sel_isEqual_, v6))
  {
LABEL_7:
    LOBYTE(v8) = 0;
    goto LABEL_8;
  }
  v7 = -[LNMacApplicationConnectionOptions isBackground](self, "isBackground");
  v8 = v7 ^ -[LNMacApplicationConnectionOptions isBackground](v6, "isBackground") ^ 1;
LABEL_8:

LABEL_10:
  return v8;
}

- (BOOL)isBackground
{
  return self->_background;
}

- (void)setBackground:(BOOL)a3
{
  self->_background = a3;
}

@end
